{ palette, umbraLib }:

{ config, lib, pkgs, ... }:

let
  cfg = config.umbra;
  p   = palette;
  a   = umbraLib.toArgb;  # hex → ARGB string for oxwm

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

  # ── oxwm ────────────────────────────────────────────────────────────────────
  # Only the colour-bearing settings — merge with your existing oxwm config.
  oxwmColors = {
    border = {
      focusedColor   = a p.accents.iris;     # iris on focused window
      unfocusedColor = a p.backgrounds.bg1;  # dark on unfocused
    };
    bar = {
      # Each scheme is [ fg bg underline-indicator ] in ARGB
      unoccupiedScheme = [ (a p.foregrounds.fg3) (a p.backgrounds.bg1) (a p.backgrounds.bg1) ];
      occupiedScheme   = [ (a p.foregrounds.fg1) (a p.backgrounds.bg1) (a p.backgrounds.bg1) ];
      selectedScheme   = [ (a p.foregrounds.fg0) (a p.accents.iris)    (a p.accents.iris)    ];
      urgentScheme     = [ (a p.foregrounds.fg0) (a p.semantic.error)  (a p.semantic.error)  ];
    };
  };

  # ── dunst ────────────────────────────────────────────────────────────────────
  dunstColors = {
    global = {
      background      = p.backgrounds.bg1;
      foreground      = p.foregrounds.fg0;
      frame_color     = p.accents.iris;
      highlight       = p.accents.iris;
      separator_color = p.borders.line;
    };
    urgency_low = {
      background  = p.backgrounds.bg0;
      foreground  = p.foregrounds.fg2;
      frame_color = p.borders.line;
      timeout     = 4;
    };
    urgency_normal = {
      background  = p.backgrounds.bg1;
      foreground  = p.foregrounds.fg0;
      frame_color = p.accents.iris;
      timeout     = 8;
    };
    urgency_critical = {
      background  = p.backgrounds.bg1;
      foreground  = p.foregrounds.fg0;
      frame_color = p.semantic.error;
      timeout     = 0;
    };
  };

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

    oxwm = lib.mkOption {
      type    = lib.types.bool;
      default = false;
      description = "Apply Umbra border and bar colours to oxwm.";
    };

    dunst = lib.mkOption {
      type    = lib.types.bool;
      default = false;
      description = "Apply Umbra colours to dunst notifications.";
    };

    gtk = lib.mkOption {
      type    = lib.types.bool;
      default = false;
      description = "Install the Umbra GTK3 theme and write GTK4/libadwaita color overrides.";
    };

    fzf = lib.mkOption {
      type    = lib.types.bool;
      default = false;
      description = "Apply Umbra colours to fzf via programs.fzf.colors.";
    };

    bat = lib.mkOption {
      type    = lib.types.bool;
      default = false;
      description = "Install the Umbra bat syntax theme and set it as default.";
    };

    starship = lib.mkOption {
      type    = lib.types.bool;
      default = false;
      description = "Apply Umbra colours to the starship prompt.";
    };

    tmux = lib.mkOption {
      type    = lib.types.bool;
      default = false;
      description = "Apply Umbra colours to tmux pane borders, status bar, and windows.";
    };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [

    # ── Alacritty ─────────────────────────────────────────────────────────────
    (lib.mkIf (cfg.terminal == "alacritty") {
      programs.alacritty = {
        enable = lib.mkDefault true;
        settings = alacrittyTheme // { import = lib.mkDefault []; };
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
        plugins = [
          {
            plugin = pkgs.vimUtils.buildVimPlugin {
              pname   = "umbra-nvim";
              version = "0.1";
              src     = ../ports/neovim;
            };
          }
        ];
        initLua = ''
          vim.cmd.colorscheme("umbra")
        '';
      };
    })

    # ── oxwm ──────────────────────────────────────────────────────────────────
    (lib.mkIf cfg.oxwm {
      programs.oxwm.settings = oxwmColors;
    })

    # ── dunst ─────────────────────────────────────────────────────────────────
    (lib.mkIf cfg.dunst {
      services.dunst = {
        enable   = lib.mkDefault true;
        settings = dunstColors;
      };
    })

    # ── GTK ───────────────────────────────────────────────────────────────────
    (lib.mkIf cfg.gtk {
      gtk = {
        enable = lib.mkDefault true;
        theme  = {
          name    = "Umbra";
          package = pkgs.callPackage ../ports/gtk { inherit palette; };
        };
      };

      # GTK4 / libadwaita user-level override — written to XDG config directly
      # because gtk.gtk4.theme is not the mechanism libadwaita uses.
      xdg.configFile."gtk-4.0/gtk.css" = {
        source = (pkgs.callPackage ../ports/gtk { inherit palette; })
          + "/share/themes/Umbra/gtk-4.0/gtk.css";
      };
    })

    # ── fzf ───────────────────────────────────────────────────────────────────
    (lib.mkIf cfg.fzf {
      programs.fzf = {
        enable = lib.mkDefault true;
        colors = {
          "fg"               = p.foregrounds.fg1;
          "fg+"              = p.foregrounds.fg0;
          "bg"               = p.backgrounds.bg1;
          "bg+"              = p.backgrounds.bg3;
          "gutter"           = p.backgrounds.bg1;
          "hl"               = p.accents.iris;
          "hl+"              = p.accents.mauve;
          "query"            = p.foregrounds.fg0;
          "info"             = p.foregrounds.fg3;
          "border"           = p.borders.line;
          "separator"        = p.borders.line;
          "scrollbar"        = p.backgrounds.bg5;
          "label"            = p.accents.iris;
          "preview-fg"       = p.foregrounds.fg0;
          "preview-bg"       = p.backgrounds.bg0;
          "preview-border"   = p.borders.line;
          "preview-scrollbar"= p.backgrounds.bg5;
          "preview-label"    = p.accents.iris;
          "pointer"          = p.accents.iris;
          "marker"           = p.accents.mauve;
          "prompt"           = p.accents.iris;
          "spinner"          = p.accents.iris;
          "header"           = p.foregrounds.fg2;
        };
      };
    })

    # ── bat ───────────────────────────────────────────────────────────────────
    (lib.mkIf cfg.bat {
      programs.bat = {
        enable = lib.mkDefault true;
        themes."Umbra" = {
          src  = ../ports/bat;
          file = "umbra.tmTheme";
        };
        config.theme = "Umbra";
      };
    })

    # ── starship ──────────────────────────────────────────────────────────────
    (lib.mkIf cfg.starship {
      programs.starship = {
        enable = lib.mkDefault true;
        settings = {
          directory.style      = "${p.accents.iris} bold";
          git_branch.style     = p.ansi.cyan;
          git_status = {
            style      = p.ansi.yellow;
            conflicted = "[=](${p.semantic.error})";
            ahead      = "[⇡$\\{count\\}](${p.ansi.blue})";
            behind     = "[⇣$\\{count\\}](${p.ansi.blue})";
            diverged   = "[⇕](${p.accents.magenta})";
            untracked  = "[?](${p.foregrounds.fg3})";
            stashed    = "[$](${p.foregrounds.fg2})";
            modified   = "[!](${p.ansi.yellow})";
            staged     = "[+](${p.ansi.green})";
            renamed    = "[»](${p.ansi.cyan})";
            deleted    = "[✘](${p.semantic.error})";
          };
          direnv.style         = "${p.ansi.yellow} dimmed";
          character = {
            success_symbol = "[❯](${p.accents.iris} bold)";
            error_symbol   = "[❯](${p.semantic.error} bold)";
            vimcmd_symbol  = "[❮](${p.accents.iris_soft} bold)";
          };
        };
      };
    })

    # ── tmux ──────────────────────────────────────────────────────────────────
    (lib.mkIf cfg.tmux {
      programs.tmux = {
        enable = lib.mkDefault true;
        extraConfig = ''
          set -g pane-border-style              "fg=${p.borders.line}"
          set -g pane-active-border-style       "fg=${p.accents.iris}"
          set -g status-style                   "bg=${p.backgrounds.bg1},fg=${p.foregrounds.fg2}"
          set -g status-left-style              "bg=${p.backgrounds.bg1},fg=${p.accents.iris}"
          set -g status-right-style             "bg=${p.backgrounds.bg1},fg=${p.foregrounds.fg3}"
          set -g window-status-style            "fg=${p.foregrounds.fg3},bg=${p.backgrounds.bg1}"
          set -g window-status-current-style    "fg=${p.foregrounds.fg0},bg=${p.backgrounds.bg3},bold"
          set -g window-status-activity-style   "fg=${p.ansi.yellow},bg=${p.backgrounds.bg1}"
          set -g window-status-bell-style       "fg=${p.semantic.error},bg=${p.backgrounds.bg1},bold"
          set -g window-status-separator        " "
          set -g message-style                  "bg=${p.backgrounds.bg3},fg=${p.foregrounds.fg0}"
          set -g message-command-style          "bg=${p.backgrounds.bg3},fg=${p.accents.iris}"
          set -g mode-style                     "bg=${p.backgrounds.bg4},fg=${p.foregrounds.fg0}"
          set -g clock-mode-colour              "${p.accents.iris}"
        '';
      };
    })

  ]);
}
