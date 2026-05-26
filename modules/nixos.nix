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
    # Distinct package group — merges alongside myVimPackage without conflict.
    # customRC (VimScript) is separate from the user's customLuaRC (Lua) so
    # both definitions coexist in the types.attrs merge. It runs after
    # packloadall, so the plugin is already in runtimepath when it fires.
    (lib.mkIf config.programs.neovim.enable {
      programs.neovim.configure = {
        packages.umbra.start = [ colorscheme ];
        customRC = "colorscheme umbra";
      };
    })

  ]);
}
