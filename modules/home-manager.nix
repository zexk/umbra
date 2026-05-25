{ palette, umbraLib }:

{ config, lib, pkgs, ... }:

let
  cfg = config.umbra;
  p   = palette;

  # ── Alacritty ───────────────────────────────────────────────────────────────
  alacrittyTheme = {
    colors = {
      primary    = { background = p.backgrounds.bg1; foreground = p.foregrounds.fg0; dim_foreground = p.foregrounds.fg2; };
      cursor     = { text = p.backgrounds.bg0; cursor = p.accents.iris; };
      vi_mode_cursor = { text = p.backgrounds.bg0; cursor = p.accents.mauve; };
      selection  = { text = "CellForeground"; background = p.backgrounds.bg4; };
      search.matches         = { foreground = p.backgrounds.bg0; background = p.accents.iris; };
      search.focused_match   = { foreground = p.backgrounds.bg0; background = p.accents.mauve; };
      normal = {
        black   = p.ansi.black;   red     = p.ansi.red;
        green   = p.ansi.green;   yellow  = p.ansi.yellow;
        blue    = p.ansi.blue;    magenta = p.ansi.magenta;
        cyan    = p.ansi.cyan;    white   = p.ansi.white;
      };
      bright = {
        black   = p.ansi.bright.black;   red     = p.ansi.bright.red;
        green   = p.ansi.bright.green;   yellow  = p.ansi.bright.yellow;
        blue    = p.ansi.bright.blue;    magenta = p.ansi.bright.magenta;
        cyan    = p.ansi.bright.cyan;    white   = p.ansi.bright.white;
      };
    };
  };

  # ── Xresources ──────────────────────────────────────────────────────────────
  xresourcesLines = ''
    ! Umbra — Xresources
    *.foreground:  ${p.foregrounds.fg0}
    *.background:  ${p.backgrounds.bg1}
    *.cursorColor: ${p.accents.iris}
    *.color0:  ${p.ansi.black}
    *.color1:  ${p.ansi.red}
    *.color2:  ${p.ansi.green}
    *.color3:  ${p.ansi.yellow}
    *.color4:  ${p.ansi.blue}
    *.color5:  ${p.ansi.magenta}
    *.color6:  ${p.ansi.cyan}
    *.color7:  ${p.ansi.white}
    *.color8:  ${p.ansi.bright.black}
    *.color9:  ${p.ansi.bright.red}
    *.color10: ${p.ansi.bright.green}
    *.color11: ${p.ansi.bright.yellow}
    *.color12: ${p.ansi.bright.blue}
    *.color13: ${p.ansi.bright.magenta}
    *.color14: ${p.ansi.bright.cyan}
    *.color15: ${p.ansi.bright.white}
  '';

in {
  options.umbra = {
    enable = lib.mkEnableOption "Umbra colorscheme";

    terminal = lib.mkOption {
      type    = lib.types.enum [ "alacritty" "kitty" "foot" "wezterm" "none" ];
      default = "none";
      description = "Terminal emulator to theme.";
    };

    xresources = lib.mkOption {
      type    = lib.types.bool;
      default = false;
      description = "Write Umbra colours into ~/.Xresources.";
    };

    neovim = lib.mkOption {
      type    = lib.types.bool;
      default = false;
      description = "Install the Umbra Neovim plugin and set colorscheme.";
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [

    # ── Alacritty ─────────────────────────────────────────────────────────────
    (lib.mkIf (cfg.terminal == "alacritty") {
      programs.alacritty = {
        enable = lib.mkDefault true;
        settings.import = lib.mkDefault [];
        settings = alacrittyTheme;
      };
    })

    # ── Xresources ────────────────────────────────────────────────────────────
    (lib.mkIf cfg.xresources {
      xresources.extraConfig = xresourcesLines;
    })

    # ── Neovim ────────────────────────────────────────────────────────────────
    (lib.mkIf cfg.neovim {
      programs.neovim = {
        enable       = lib.mkDefault true;
        extraPlugins = [
          (pkgs.vimUtils.buildVimPlugin {
            pname   = "umbra-nvim";
            version = "0.1";
            src     = ../ports/neovim;
          })
        ];
        extraLuaConfig = ''
          vim.cmd.colorscheme("umbra")
        '';
      };
    })

  ]);
}
