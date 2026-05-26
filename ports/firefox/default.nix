{ pkgs, palette }:

let
  p = palette;

  # Firefox WebExtensions theme — colors are plain hex strings (no RGB conversion needed).
  manifest = {
    manifest_version = 2;
    name             = "Umbra";
    version          = "1.0";
    description      = "Umbra — dark Firefox theme. Auto-generated from the Umbra palette.";
    theme.colors = {
      # Frame / window chrome
      frame                       = p.backgrounds.bg1;
      frame_inactive              = p.backgrounds.bg0;

      # Tab strip
      tab_selected                = p.backgrounds.bg2;
      tab_line                    = p.accents.iris;
      tab_text                    = p.foregrounds.fg0;
      tab_background_text         = p.foregrounds.fg2;
      tab_background_separator    = p.borders.line;
      tab_loading                 = p.accents.iris;

      # Toolbar
      toolbar                     = p.backgrounds.bg2;
      toolbar_text                = p.foregrounds.fg0;
      toolbar_top_separator       = p.borders.line;
      toolbar_bottom_separator    = p.borders.line;
      toolbar_vertical_separator  = p.borders.line;
      icons                       = p.foregrounds.fg2;
      icons_attention             = p.accents.iris;
      button_background_hover     = p.backgrounds.bg3;
      button_background_active    = p.backgrounds.bg4;

      # Address bar (toolbar_field)
      toolbar_field               = p.backgrounds.bg0;
      toolbar_field_text          = p.foregrounds.fg0;
      toolbar_field_border        = p.borders.line;
      toolbar_field_focus         = p.backgrounds.bg1;
      toolbar_field_text_focus    = p.foregrounds.fg0;
      toolbar_field_border_focus  = p.accents.iris;
      toolbar_field_highlight     = p.backgrounds.bg4;
      toolbar_field_highlight_text = p.foregrounds.fg0;

      # Bookmarks bar
      bookmark_text               = p.foregrounds.fg1;

      # Popup / autocomplete dropdown
      popup                       = p.backgrounds.bg2;
      popup_text                  = p.foregrounds.fg0;
      popup_border                = p.borders.line;
      popup_highlight             = p.backgrounds.bg4;
      popup_highlight_text        = p.foregrounds.fg0;

      # Sidebar (bookmarks / history panel)
      sidebar                     = p.backgrounds.bg1;
      sidebar_text                = p.foregrounds.fg0;
      sidebar_border              = p.borders.line;
      sidebar_highlight           = p.backgrounds.bg4;
      sidebar_highlight_text      = p.foregrounds.fg0;

      # New Tab Page
      ntp_background              = p.backgrounds.bg0;
      ntp_card_background         = p.backgrounds.bg2;
      ntp_text                    = p.foregrounds.fg0;
    };
  };

  json = pkgs.formats.json { };

in pkgs.runCommand "umbra-firefox-theme" { } ''
  mkdir -p $out
  cp ${json.generate "manifest.json" manifest} $out/manifest.json
''
