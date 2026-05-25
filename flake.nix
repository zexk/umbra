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
    });

    nixosModules.default =
      import ./modules/nixos.nix { inherit palette umbraLib; };

    homeManagerModules.default =
      import ./modules/home-manager.nix { inherit palette umbraLib; };
  };
}
