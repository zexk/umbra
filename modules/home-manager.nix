{ palette, umbraLib }:

{ config, lib, pkgs, ... }:

let
  cfg = config.umbra;
  p   = palette;
  s   = umbraLib.stripHash;  # bare 6-char hex — oxwm hm module adds # itself
  a   = umbraLib.toArgb;    # ffRRGGBB — oxwm border: picom needs ARGB opacity prefix

  # ── Alacritty ───────────────────────────────────────────────────────────────
  alacrittyColors = {
    colors = {
      primary        = { background = p.backgrounds.bg1; foreground = p.foregrounds.fg0; dim_foreground = p.foregrounds.fg2; };
      cursor         = { text = p.backgrounds.bg0; cursor = p.accents.iris; };
      vi_mode_cursor = { text = p.backgrounds.bg0; cursor = p.accents.mauve; };
      selection      = { text = "CellForeground"; background = p.backgrounds.bg4; };
      search.matches        = { foreground = p.backgrounds.bg0; background = p.accents.iris; };
      search.focused_match  = { foreground = p.backgrounds.bg0; background = p.accents.mauve; };
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

    ! dmenu — Xresources patch (normbgcolor/normfgcolor/selbgcolor/selfgcolor)
    dmenu.normbgcolor: ${p.backgrounds.bg1}
    dmenu.normfgcolor: ${p.foregrounds.fg1}
    dmenu.selbgcolor:  ${p.accents.iris}
    dmenu.selfgcolor:  ${p.backgrounds.bg0}
    dmenu.promptbg:    ${p.backgrounds.bg2}
    dmenu.promptfg:    ${p.accents.iris}
    dmenu.border:      ${p.borders.line}
  '';

  # ── oxwm ────────────────────────────────────────────────────────────────────
  oxwmColors = {
    border = {
      focusedColor   = a p.accents.iris;
      unfocusedColor = a p.backgrounds.bg1;
    };
    bar = {
      unoccupiedScheme = [ (s p.foregrounds.fg3) (s p.backgrounds.bg1) (s p.backgrounds.bg1) ];
      occupiedScheme   = [ (s p.foregrounds.fg1) (s p.backgrounds.bg1) (s p.backgrounds.bg1) ];
      selectedScheme   = [ (s p.foregrounds.fg0) (s p.accents.iris)    (s p.accents.iris)    ];
      urgentScheme     = [ (s p.foregrounds.fg0) (s p.semantic.error)  (s p.semantic.error)  ];
    };
  };

  # ── dunst ───────────────────────────────────────────────────────────────────
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

  # ── Kitty ────────────────────────────────────────────────────────────────────
  kittyColors = {
    foreground            = p.foregrounds.fg0;
    background            = p.backgrounds.bg1;
    cursor                = p.accents.iris;
    cursor_text_color     = p.backgrounds.bg0;
    selection_foreground  = "none";
    selection_background  = p.backgrounds.bg4;
    url_color             = p.accents.iris_soft;
    active_border_color   = p.accents.iris;
    inactive_border_color = p.borders.line;
    bell_border_color     = p.semantic.warn;
    active_tab_foreground   = p.foregrounds.fg0;
    active_tab_background   = p.backgrounds.bg3;
    inactive_tab_foreground = p.foregrounds.fg3;
    inactive_tab_background = p.backgrounds.bg1;
    tab_bar_background      = p.backgrounds.bg1;
    color0  = p.ansi.black;          color8  = p.ansi.bright.black;
    color1  = p.ansi.red;            color9  = p.ansi.bright.red;
    color2  = p.ansi.green;          color10 = p.ansi.bright.green;
    color3  = p.ansi.yellow;         color11 = p.ansi.bright.yellow;
    color4  = p.ansi.blue;           color12 = p.ansi.bright.blue;
    color5  = p.ansi.magenta;        color13 = p.ansi.bright.magenta;
    color6  = p.ansi.cyan;           color14 = p.ansi.bright.cyan;
    color7  = p.ansi.white;          color15 = p.ansi.bright.white;
  };

  # ── Foot ─────────────────────────────────────────────────────────────────────
  # foot.ini [colors] uses bare 6-char hex, no # prefix
  footColors = {
    foreground             = s p.foregrounds.fg0;
    background             = s p.backgrounds.bg1;
    "selection-foreground" = s p.foregrounds.fg0;
    "selection-background" = s p.backgrounds.bg4;
    regular0 = s p.ansi.black;          bright0 = s p.ansi.bright.black;
    regular1 = s p.ansi.red;            bright1 = s p.ansi.bright.red;
    regular2 = s p.ansi.green;          bright2 = s p.ansi.bright.green;
    regular3 = s p.ansi.yellow;         bright3 = s p.ansi.bright.yellow;
    regular4 = s p.ansi.blue;           bright4 = s p.ansi.bright.blue;
    regular5 = s p.ansi.magenta;        bright5 = s p.ansi.bright.magenta;
    regular6 = s p.ansi.cyan;           bright6 = s p.ansi.bright.cyan;
    regular7 = s p.ansi.white;          bright7 = s p.ansi.bright.white;
  };

  # ── Helix ─────────────────────────────────────────────────────────────────────
  helixTheme = {
    palette = {
      "bg0"      = p.backgrounds.bg0;   "bg1"     = p.backgrounds.bg1;
      "bg2"      = p.backgrounds.bg2;   "bg3"     = p.backgrounds.bg3;
      "bg4"      = p.backgrounds.bg4;   "bg5"     = p.backgrounds.bg5;
      "fg0"      = p.foregrounds.fg0;   "fg1"     = p.foregrounds.fg1;
      "fg2"      = p.foregrounds.fg2;   "fg3"     = p.foregrounds.fg3;
      "iris"     = p.accents.iris;      "iris_soft" = p.accents.iris_soft;
      "mauve"    = p.accents.mauve;     "magenta" = p.accents.magenta;
      "red"      = p.ansi.red;          "bright_red"    = p.ansi.bright.red;
      "green"    = p.ansi.green;        "bright_green"  = p.ansi.bright.green;
      "yellow"   = p.ansi.yellow;       "bright_yellow" = p.ansi.bright.yellow;
      "blue"     = p.ansi.blue;         "bright_blue"   = p.ansi.bright.blue;
      "cyan"     = p.ansi.cyan;         "bright_cyan"   = p.ansi.bright.cyan;
      "success"  = p.semantic.success;  "warn"    = p.semantic.warn;
      "error"    = p.semantic.error;    "info"    = p.semantic.info;
    };

    # UI chrome
    "ui.background"           = { bg = "bg1"; };
    "ui.background.separator" = { fg = "bg5"; };
    "ui.text"                 = { fg = "fg0"; };
    "ui.text.focus"           = { fg = "fg0"; modifiers = [ "bold" ]; };
    "ui.text.inactive"        = { fg = "fg3"; };
    "ui.cursor"               = { fg = "bg0"; bg = "iris"; };
    "ui.cursor.primary"       = { fg = "bg0"; bg = "iris"; };
    "ui.cursor.secondary"     = { fg = "bg0"; bg = "mauve"; };
    "ui.cursor.insert"        = { fg = "bg0"; bg = "green"; };
    "ui.cursor.select"        = { fg = "bg0"; bg = "mauve"; };
    "ui.cursor.match"         = { fg = "bg0"; bg = "yellow"; modifiers = [ "bold" ]; };
    "ui.selection"            = { bg = "bg4"; };
    "ui.selection.primary"    = { bg = "bg4"; };
    "ui.linenr"               = { fg = "fg3"; };
    "ui.linenr.selected"      = { fg = "iris"; modifiers = [ "bold" ]; };
    "ui.statusline"           = { fg = "fg1"; bg = "bg2"; };
    "ui.statusline.inactive"  = { fg = "fg3"; bg = "bg1"; };
    "ui.statusline.normal"    = { fg = "bg0"; bg = "iris";  modifiers = [ "bold" ]; };
    "ui.statusline.insert"    = { fg = "bg0"; bg = "green"; modifiers = [ "bold" ]; };
    "ui.statusline.select"    = { fg = "bg0"; bg = "mauve"; modifiers = [ "bold" ]; };
    "ui.popup"                = { fg = "fg0"; bg = "bg2"; };
    "ui.popup.info"           = { fg = "fg0"; bg = "bg2"; };
    "ui.window"               = { fg = "bg5"; };
    "ui.help"                 = { fg = "fg0"; bg = "bg2"; };
    "ui.menu"                 = { fg = "fg0"; bg = "bg2"; };
    "ui.menu.selected"        = { fg = "bg0"; bg = "iris"; };
    "ui.menu.scroll"          = { fg = "bg5"; bg = "bg2"; };
    "ui.gutter"               = { bg = "bg1"; };
    "ui.gutter.selected"      = { bg = "bg2"; };
    "ui.highlight"            = { bg = "bg3"; };
    "ui.highlight.frameline"  = { bg = "bg2"; };
    "ui.virtual.inlay-hint"   = { fg = "fg3"; bg = "bg1"; };
    "ui.virtual.ruler"        = { bg = "bg2"; };
    "ui.virtual.wrap"         = { fg = "fg3"; };
    "ui.virtual.jump-label"   = { fg = "mauve"; modifiers = [ "bold" ]; };

    # Diagnostics
    "diagnostic.error"   = { underline = { color = "error";     style = "curl"; }; };
    "diagnostic.warning" = { underline = { color = "warn";      style = "curl"; }; };
    "diagnostic.info"    = { underline = { color = "info";      style = "curl"; }; };
    "diagnostic.hint"    = { underline = { color = "iris_soft"; style = "curl"; }; };

    # Syntax
    "attribute"                = { fg = "mauve"; };
    "type"                     = { fg = "cyan"; };
    "type.builtin"             = { fg = "cyan"; };
    "constructor"              = { fg = "iris"; };
    "constant"                 = { fg = "mauve"; };
    "constant.builtin"         = { fg = "mauve"; modifiers = [ "bold" ]; };
    "constant.builtin.boolean" = { fg = "mauve"; };
    "constant.character"       = { fg = "green"; };
    "constant.numeric"         = { fg = "yellow"; };
    "string"                   = { fg = "green"; };
    "string.regexp"            = { fg = "cyan"; };
    "string.special"           = { fg = "mauve"; };
    "string.special.url"       = { fg = "blue"; modifiers = [ "underlined" ]; };
    "comment"                  = { fg = "fg3"; modifiers = [ "italic" ]; };
    "comment.block.documentation" = { fg = "fg2"; modifiers = [ "italic" ]; };
    "variable"                 = { fg = "fg0"; };
    "variable.builtin"         = { fg = "iris"; modifiers = [ "bold" ]; };
    "variable.parameter"       = { fg = "fg1"; };
    "variable.other.member"    = { fg = "bright_blue"; };
    "label"                    = { fg = "iris"; };
    "punctuation"              = { fg = "fg2"; };
    "punctuation.delimiter"    = { fg = "fg2"; };
    "punctuation.bracket"      = { fg = "fg1"; };
    "punctuation.special"      = { fg = "magenta"; };
    "keyword"                  = { fg = "iris"; };
    "keyword.control"          = { fg = "iris"; };
    "keyword.operator"         = { fg = "magenta"; };
    "keyword.directive"        = { fg = "magenta"; };
    "keyword.function"         = { fg = "iris"; };
    "keyword.storage"          = { fg = "iris"; };
    "operator"                 = { fg = "magenta"; };
    "function"                 = { fg = "mauve"; };
    "function.builtin"         = { fg = "mauve"; modifiers = [ "bold" ]; };
    "function.method"          = { fg = "mauve"; };
    "function.macro"           = { fg = "iris"; };
    "tag"                      = { fg = "iris"; };
    "namespace"                = { fg = "iris_soft"; };
    "special"                  = { fg = "mauve"; };
    "diff.plus"                = { fg = "green"; };
    "diff.minus"               = { fg = "red"; };
    "diff.delta"               = { fg = "yellow"; };
    "diff.delta.moved"         = { fg = "cyan"; };

    # Markup
    "markup.heading.1"    = { fg = "iris";  modifiers = [ "bold" ]; };
    "markup.heading.2"    = { fg = "mauve"; modifiers = [ "bold" ]; };
    "markup.heading.3"    = { fg = "cyan";  modifiers = [ "bold" ]; };
    "markup.heading.4"    = { fg = "blue";  modifiers = [ "bold" ]; };
    "markup.heading.5"    = { fg = "fg0";   modifiers = [ "bold" ]; };
    "markup.heading.6"    = { fg = "fg1";   modifiers = [ "bold" ]; };
    "markup.list"          = { fg = "magenta"; };
    "markup.bold"          = { modifiers = [ "bold" ]; };
    "markup.italic"        = { modifiers = [ "italic" ]; };
    "markup.strikethrough" = { modifiers = [ "crossed_out" ]; };
    "markup.link.url"      = { fg = "blue"; modifiers = [ "underlined" ]; };
    "markup.link.text"     = { fg = "iris"; };
    "markup.raw"           = { fg = "green"; };
    "markup.raw.inline"    = { fg = "green"; };
    "markup.raw.block"     = { fg = "green"; };
  };

  # ── Lazygit ───────────────────────────────────────────────────────────────────
  lazygitTheme = {
    gui.theme = {
      activeBorderColor         = [ p.accents.iris "bold" ];
      inactiveBorderColor       = [ p.backgrounds.bg4 ];
      optionsTextColor          = [ p.accents.iris ];
      selectedLineBgColor       = [ p.backgrounds.bg2 ];
      cherryPickedCommitBgColor = [ p.backgrounds.bg4 ];
      cherryPickedCommitFgColor = [ p.accents.iris ];
      markedBaseCommitBgColor   = [ p.backgrounds.bg3 ];
      markedBaseCommitFgColor   = [ p.accents.mauve ];
      unstagedChangesColor      = [ p.ansi.red ];
      defaultFgColor            = [ p.foregrounds.fg0 ];
    };
  };

  # ── Zed ───────────────────────────────────────────────────────────────────────
  zedTheme = let
    bg = p.backgrounds; fg = p.foregrounds; ac = p.accents;
    an = p.ansi;        se = p.semantic;    bo = p.borders;
  in {
    "$schema" = "https://zed.dev/schema/themes/v0.2.0.json";
    name   = "Umbra";
    author = "Umbra";
    themes = [{
      name       = "Umbra";
      appearance = "dark";
      style = {
        # Surfaces
        background                    = bg.bg1;
        "elevated_surface.background" = bg.bg2;
        "surface.background"          = bg.bg0;
        "panel.background"            = bg.bg0;
        "pane.focused_border"         = ac.iris;

        # Borders
        border                = bo.line;
        "border.variant"      = bo.line_soft;
        "border.focused"      = ac.iris;
        "border.selected"     = ac.iris;
        "border.transparent"  = "transparent";
        "border.disabled"     = bg.bg3;

        # Bars
        "status_bar.background"          = bg.bg0;
        "title_bar.background"           = bg.bg0;
        "title_bar.inactive_background"  = bg.bg0;
        "toolbar.background"             = bg.bg1;
        "tab_bar.background"             = bg.bg0;
        "tab.inactive_background"        = bg.bg0;
        "tab.active_background"          = bg.bg1;

        # Search
        "search.match_background" = bg.bg4;

        # Scrollbar
        "scrollbar.track.background"       = "transparent";
        "scrollbar.track.border"           = "transparent";
        "scrollbar.thumb.background"       = bg.bg3;
        "scrollbar.thumb.border"           = bg.bg3;
        "scrollbar.thumb.hover_background" = bg.bg4;

        # Ghost elements
        "ghost_element.background" = "transparent";
        "ghost_element.hover"      = bg.bg2;
        "ghost_element.active"     = bg.bg3;
        "ghost_element.selected"   = bg.bg2;
        "ghost_element.disabled"   = "transparent";

        # Text
        text               = fg.fg0;
        "text.muted"       = fg.fg2;
        "text.placeholder" = fg.fg3;
        "text.disabled"    = fg.fg3;
        "text.accent"      = ac.iris;

        # Icons
        icon               = fg.fg1;
        "icon.muted"       = fg.fg3;
        "icon.disabled"    = fg.fg3;
        "icon.placeholder" = fg.fg3;
        "icon.accent"      = ac.iris;

        # Generic element states
        "element.background"     = "transparent";
        "element.hover"          = bg.bg2;
        "element.active"         = bg.bg3;
        "element.selected"       = bg.bg2;
        "element.disabled"       = bg.bg1;
        "drop_target.background" = bg.bg3;

        # Selection / links
        "selection.background" = bg.bg4;
        "link_text.hover"      = ac.iris_soft;

        # Editor
        "editor.foreground"                          = fg.fg0;
        "editor.background"                          = bg.bg1;
        "editor.gutter.background"                   = bg.bg1;
        "editor.subheader.background"                = bg.bg2;
        "editor.active_line.background"              = bg.bg2;
        "editor.highlighted_line.background"         = bg.bg2;
        "editor.line_number"                         = fg.fg3;
        "editor.active_line_number"                  = ac.iris;
        "editor.invisible"                           = bg.bg4;
        "editor.wrap_guide"                          = bg.bg3;
        "editor.active_wrap_guide"                   = bg.bg4;
        "editor.indent_guide"                        = bg.bg3;
        "editor.indent_guide_active"                 = bg.bg4;
        "editor.document_highlight.read_background"  = bg.bg3;
        "editor.document_highlight.write_background" = bg.bg4;

        # Terminal
        "terminal.background"          = bg.bg0;
        "terminal.foreground"          = fg.fg0;
        "terminal.bright_foreground"   = fg.fg0;
        "terminal.dim_foreground"      = fg.fg2;
        "terminal.ansi.black"          = an.black;
        "terminal.ansi.red"            = an.red;
        "terminal.ansi.green"          = an.green;
        "terminal.ansi.yellow"         = an.yellow;
        "terminal.ansi.blue"           = an.blue;
        "terminal.ansi.magenta"        = an.magenta;
        "terminal.ansi.cyan"           = an.cyan;
        "terminal.ansi.white"          = an.white;
        "terminal.ansi.bright_black"   = an.bright.black;
        "terminal.ansi.bright_red"     = an.bright.red;
        "terminal.ansi.bright_green"   = an.bright.green;
        "terminal.ansi.bright_yellow"  = an.bright.yellow;
        "terminal.ansi.bright_blue"    = an.bright.blue;
        "terminal.ansi.bright_magenta" = an.bright.magenta;
        "terminal.ansi.bright_cyan"    = an.bright.cyan;
        "terminal.ansi.bright_white"   = an.bright.white;

        # Diagnostics
        "error.background"   = bg.bg1;   "error.border"   = se.error;
        "warning.background" = bg.bg1;   "warning.border" = se.warn;
        "info.background"    = bg.bg1;   "info.border"    = se.info;
        "success.background" = bg.bg1;   "success.border" = se.success;

        # Syntax tokens
        syntax = {
          attribute                     = { color = ac.mauve; };
          boolean                       = { color = ac.mauve; };
          comment                       = { color = fg.fg3; font_style = "italic"; };
          "comment.doc"                 = { color = fg.fg2; font_style = "italic"; };
          constant                      = { color = ac.mauve; };
          constructor                   = { color = ac.iris; };
          embedded                      = { color = fg.fg0; };
          emphasis                      = { font_style = "italic"; };
          "emphasis.strong"             = { font_weight = 700; };
          enum                          = { color = ac.mauve; };
          function                      = { color = ac.mauve; };
          "function.method"             = { color = ac.mauve; };
          "function.special.definition" = { color = ac.iris; };
          hint                          = { color = fg.fg3; };
          keyword                       = { color = ac.iris; };
          label                         = { color = ac.iris; };
          link_text                     = { color = ac.iris_soft; font_style = "italic"; };
          link_uri                      = { color = an.blue; };
          number                        = { color = an.yellow; };
          operator                      = { color = ac.magenta; };
          predictive                    = { color = fg.fg3; font_style = "italic"; };
          preproc                       = { color = ac.magenta; };
          primary                       = { color = fg.fg0; };
          property                      = { color = an.bright.blue; };
          punctuation                   = { color = fg.fg2; };
          "punctuation.bracket"         = { color = fg.fg1; };
          "punctuation.delimiter"       = { color = fg.fg2; };
          "punctuation.list_marker"     = { color = ac.magenta; };
          "punctuation.special"         = { color = ac.magenta; };
          string                        = { color = an.green; };
          "string.escape"               = { color = ac.mauve; };
          "string.regex"                = { color = an.cyan; };
          "string.special"              = { color = ac.mauve; };
          "string.special.symbol"       = { color = ac.mauve; };
          tag                           = { color = ac.iris; };
          "text.literal"                = { color = an.green; };
          title                         = { color = ac.iris; font_weight = 700; };
          type                          = { color = an.cyan; };
          "type.builtin"                = { color = an.cyan; };
          variable                      = { color = fg.fg0; };
          "variable.special"            = { color = ac.iris; };
          variant                       = { color = ac.iris; };
        };
      };
    }];
  };

in {
  options.umbra.enable = lib.mkEnableOption "Umbra colorscheme";

  config = lib.mkIf cfg.enable (lib.mkMerge [

    # ── Xresources — additive, no enable flag to detect ───────────────────────
    { xresources.extraConfig = xresourcesLines; }

    # ── Alacritty ─────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.alacritty.enable {
      programs.alacritty.settings = alacrittyColors;
    })

    # ── Neovim ────────────────────────────────────────────────────────────────
    # programs.neovim.plugins and initLua are home-manager-specific options.
    # For NixOS-managed neovim (configure.packages style) use nixosModules.default.
    (lib.mkIf config.programs.neovim.enable {
      programs.neovim = {
        plugins = [{
          plugin = pkgs.vimUtils.buildVimPlugin {
            pname   = "umbra-nvim";
            version = "0.1";
            src     = ../ports/neovim;
          };
        }];
        initLua = "vim.cmd.colorscheme('umbra')";
      };
    })

    # ── oxwm ──────────────────────────────────────────────────────────────────
    # Guard with ? because oxwm is a non-standard HM module; accessing an
    # undeclared option would be a hard eval error.
    (lib.mkIf (config.programs ? oxwm && config.programs.oxwm.enable) {
      programs.oxwm.settings = oxwmColors;
    })

    # ── dunst ─────────────────────────────────────────────────────────────────
    (lib.mkIf config.services.dunst.enable {
      services.dunst.settings = dunstColors;
    })

    # ── btop ──────────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.btop.enable {
      xdg.configFile."btop/themes/umbra.theme".source =
        pkgs.callPackage ../ports/btop { inherit palette; };
      programs.btop.settings.color_theme = "umbra";
    })

    # ── Vesktop / Vencord ─────────────────────────────────────────────────────
    (lib.mkIf config.programs.vesktop.enable {
      programs.vesktop.vencord.themes."umbra.theme.css" =
        pkgs.callPackage ../ports/discord { inherit palette; };
      programs.vesktop.vencord.settings.enabledThemes = [ "umbra.theme.css" ];
    })

    # ── Telegram Desktop ──────────────────────────────────────────────────────
    # No HM programs.telegram-desktop module exists, so install unconditionally.
    # Import the theme once via Settings → Chat Settings → Choose from file.
    # Path: ~/.local/share/TelegramDesktop/themes/umbra.tdesktop-theme
    {
      xdg.dataFile."TelegramDesktop/themes/umbra.tdesktop-theme".source =
        pkgs.callPackage ../ports/telegram { inherit palette; };
    }

    # ── GTK ───────────────────────────────────────────────────────────────────
    (lib.mkIf config.gtk.enable {
      gtk.theme = {
        name    = "Umbra";
        package = pkgs.callPackage ../ports/gtk { inherit palette; };
      };
      xdg.configFile."gtk-4.0/gtk.css".source =
        (pkgs.callPackage ../ports/gtk { inherit palette; })
        + "/share/themes/Umbra/gtk-4.0/gtk.css";
    })

    # ── fzf ───────────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.fzf.enable {
      programs.fzf.colors = {
        "fg"                = p.foregrounds.fg1;
        "fg+"               = p.foregrounds.fg0;
        "bg"                = p.backgrounds.bg1;
        "bg+"               = p.backgrounds.bg3;
        "gutter"            = p.backgrounds.bg1;
        "hl"                = p.accents.iris;
        "hl+"               = p.accents.mauve;
        "query"             = p.foregrounds.fg0;
        "info"              = p.foregrounds.fg3;
        "border"            = p.borders.line;
        "separator"         = p.borders.line;
        "scrollbar"         = p.backgrounds.bg5;
        "label"             = p.accents.iris;
        "preview-fg"        = p.foregrounds.fg0;
        "preview-bg"        = p.backgrounds.bg0;
        "preview-border"    = p.borders.line;
        "preview-scrollbar" = p.backgrounds.bg5;
        "preview-label"     = p.accents.iris;
        "pointer"           = p.accents.iris;
        "marker"            = p.accents.mauve;
        "prompt"            = p.accents.iris;
        "spinner"           = p.accents.iris;
        "header"            = p.foregrounds.fg2;
      };
    })

    # ── bat ───────────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.bat.enable {
      programs.bat = {
        themes."Umbra" = {
          src  = ../ports/bat;
          file = "umbra.tmTheme";
        };
        config.theme = "Umbra";
      };
    })

    # ── starship ──────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.starship.enable {
      programs.starship.settings = {
        directory.style  = "${p.accents.iris} bold";
        git_branch.style = p.ansi.cyan;
        git_status = {
          style      = p.ansi.yellow;
          conflicted = "[=](${p.semantic.error})";
          ahead      = "[⇡\${count}](${p.ansi.blue})";
          behind     = "[⇣\${count}](${p.ansi.blue})";
          diverged   = "[⇕](${p.accents.magenta})";
          untracked  = "[?](${p.foregrounds.fg3})";
          stashed    = "[$](${p.foregrounds.fg2})";
          modified   = "[!](${p.ansi.yellow})";
          staged     = "[+](${p.ansi.green})";
          renamed    = "[»](${p.ansi.cyan})";
          deleted    = "[✘](${p.semantic.error})";
        };
        direnv.style = "${p.ansi.yellow} dimmed";
        character = {
          success_symbol = "[❯](${p.accents.iris} bold)";
          error_symbol   = "[❯](${p.semantic.error} bold)";
          vimcmd_symbol  = "[❮](${p.accents.iris_soft} bold)";
        };
      };
    })

    # ── tmux ──────────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.tmux.enable {
      programs.tmux.extraConfig = ''
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
    })

    # ── Kitty ─────────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.kitty.enable {
      programs.kitty.settings = kittyColors;
    })

    # ── Foot ──────────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.foot.enable {
      programs.foot.settings.colors = footColors;
    })

    # ── Helix ─────────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.helix.enable {
      programs.helix.themes.umbra      = helixTheme;
      programs.helix.settings.theme    = "umbra";
    })

    # ── Lazygit ───────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.lazygit.enable {
      programs.lazygit.settings = lazygitTheme;
    })

    # ── Zed ───────────────────────────────────────────────────────────────────
    (lib.mkIf config.programs.zed-editor.enable {
      programs.zed-editor.themes.umbra          = zedTheme;
      programs.zed-editor.userSettings.theme    = {
        mode = "dark";
        dark = "Umbra";
      };
    })

  ]);
}
