{ pkgs, palette }:

let
  p   = palette;
  fmt = pkgs.formats.json { };

  settings = {
    enabled   = true;
    fetchNews = false;
    theme = {
      mode       = 1;       # 0 = light, 1 = dark
      brightness = 100;
      contrast   = 100;
      grayscale  = 0;
      sepia      = 0;
      useFont    = false;
      fontFamily = "";
      textStroke = 0;
      engine     = "dynamicTheme";
      stylesheet = "";

      darkSchemeBackgroundColor  = p.backgrounds.bg0;
      darkSchemeFontColor        = p.foregrounds.fg0;
      lightSchemeBackgroundColor = p.foregrounds.fg0;
      lightSchemeFontColor       = p.backgrounds.bg0;

      scrollbarColor     = "";
      selectionColor     = p.accents.iris;
      styleSystemControls = true;
      lightColorScheme   = "Default";
      darkColorScheme    = "Default";
      immediateModify    = false;
    };
    siteList         = [ ];
    siteListEnabled  = [ ];
    siteListDisabled = [ ];
    customThemes     = [ ];
    presets          = [ ];
  };

in fmt.generate "umbra-dark-reader.json" settings
