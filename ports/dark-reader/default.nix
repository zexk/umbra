{ pkgs, palette }:

let
  p   = palette;
  fmt = pkgs.formats.json { };

  settings = {
    enabled              = true;
    applyToListedOnly    = false;
    changeBrowserTheme   = false;
    enableForPDF         = true;
    enableForProtectedPages = false;
    notifyOfNews         = false;
    previewNewDesign     = true;
    syncSettings         = false;
    syncSitesFixes       = false;
    automation = {
      enabled  = false;
      mode     = "system";
      behavior = "OnOff";
    };
    location = { latitude = null; longitude = null; };
    time     = { activation = "18:00"; deactivation = "9:00"; };
    theme = {
      mode       = 1;
      brightness = 100;
      contrast   = 100;
      grayscale  = 0;
      sepia      = 0;
      useFont    = false;
      fontFamily = "Helvetica Neue";
      textStroke = 0;
      engine     = "dynamicTheme";
      stylesheet = "";

      darkSchemeBackgroundColor  = p.backgrounds.bg0;
      darkSchemeTextColor        = p.foregrounds.fg0;
      lightSchemeBackgroundColor = p.foregrounds.fg0;
      lightSchemeTextColor       = p.backgrounds.bg1;

      scrollbarColor      = "auto";
      selectionColor      = p.accents.iris;
      styleSystemControls = true;
    };
    siteList         = [ ];
    siteListEnabled  = [ ];
    customThemes     = [ ];
    presets          = [ ];
  };

in fmt.generate "umbra-dark-reader.json" settings
