{
  description = "Umbra — a dark purple colorscheme ecosystem";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
    forAllSystems = nixpkgs.lib.genAttrs systems;

    # Canonical palette — single source of truth for all ports.
    palette = builtins.fromTOML (builtins.readFile ./palette/umbra.toml);

    umbraLib = import ./lib { inherit palette; };

  in {
    # Raw palette attrset — consumable by external flakes.
    inherit palette;

    lib = umbraLib;

    packages = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # Installs the palette TOML into the Nix store.
      default = pkgs.runCommand "umbra-palette" { } ''
        mkdir -p $out/share/umbra
        cp ${./palette/umbra.toml} $out/share/umbra/palette.toml
      '';

      # Neovim plugin — usable as a vim plugin derivation.
      neovim = pkgs.vimUtils.buildVimPlugin {
        pname   = "umbra-nvim";
        version = "0.1";
        src     = ./ports/neovim;
      };

      # GTK3 theme + GTK4 libadwaita overrides.
      gtk = pkgs.callPackage ./ports/gtk { inherit palette; };

      # dmenu wrapped with Umbra colors as default flags (native, no patch needed).
      dmenu = pkgs.callPackage ./ports/dmenu { inherit palette; };

      # Telegram Desktop .tdesktop-theme file — import once via Settings.
      telegram = pkgs.callPackage ./ports/telegram { inherit palette; };

      # Chromium / Chrome unpacked theme extension — load via chrome://extensions.
      chromium = pkgs.callPackage ./ports/chromium { inherit palette; };

      # Firefox WebExtensions theme — load via about:debugging or pack as .xpi.
      firefox = pkgs.callPackage ./ports/firefox { inherit palette; };

      # Vesktop / Vencord .theme.css file.
      discord = pkgs.callPackage ./ports/discord { inherit palette; };

      # btop resource monitor theme.
      btop = pkgs.callPackage ./ports/btop { inherit palette; };
    });

    nixosModules.default =
      import ./modules/nixos.nix { inherit palette umbraLib; };

    homeManagerModules.default =
      import ./modules/home-manager.nix { inherit palette umbraLib; };
  };
}
