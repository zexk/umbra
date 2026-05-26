{ palette, umbraLib }:

{ config, lib, pkgs, ... }:

let
  cfg = config.umbra;
  p   = palette;

  colorscheme = pkgs.vimUtils.buildVimPlugin {
    pname   = "umbra-nvim";
    version = "0.1";
    src     = ../ports/neovim;
  };

  # Neovim auto-sources plugin/*.lua from every runtimepath entry.
  # colorscheme is listed first so its colors/ dir is available when this fires.
  activate = pkgs.writeTextDir "plugin/umbra-activate.lua"
    "vim.cmd.colorscheme('umbra')";

in {
  options.umbra.enable = lib.mkEnableOption "Umbra colorscheme";

  config = lib.mkIf cfg.enable (lib.mkMerge [

    # ── TTY / virtual console ────────────────────────────────────────────────
    {
      console.colors = map (lib.removePrefix "#") [
        p.ansi.black          p.ansi.red            p.ansi.green
        p.ansi.yellow         p.ansi.blue           p.ansi.magenta
        p.ansi.cyan           p.ansi.white
        p.ansi.bright.black   p.ansi.bright.red     p.ansi.bright.green
        p.ansi.bright.yellow  p.ansi.bright.blue    p.ansi.bright.magenta
        p.ansi.bright.cyan    p.ansi.bright.white
      ];
    }

    # ── Neovim ──────────────────────────────────────────────────────────────
    # Adds a distinct package group so it merges cleanly alongside the user's
    # own packages.myVimPackage without touching customLuaRC / customRC.
    (lib.mkIf config.programs.neovim.enable {
      programs.neovim.configure.packages.umbra.start = [ colorscheme activate ];
    })

  ]);
}
