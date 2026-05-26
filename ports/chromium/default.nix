{ pkgs, palette }:

let
  p = palette;

  # Chrome theme colors are [R, G, B] integer arrays.
  # We use Python (available everywhere) to convert palette hex strings.
  genManifest = pkgs.writeText "gen-umbra-chromium.py" ''
    import json, sys

    def rgb(h):
        h = h.lstrip('#')
        return [int(h[i:i+2], 16) for i in (0, 2, 4)]

    manifest = {
        "manifest_version": 3,
        "name": "Umbra",
        "version": "1.0",
        "description": "Umbra — dark chromium theme. Auto-generated from the Umbra palette.",
        "theme": {
            "colors": {
                # Frame / chrome
                "frame":                    rgb("${p.backgrounds.bg1}"),
                "frame_inactive":           rgb("${p.backgrounds.bg0}"),
                "frame_incognito":          rgb("${p.backgrounds.bg2}"),
                "frame_incognito_inactive": rgb("${p.backgrounds.bg1}"),

                # Toolbar (address bar strip)
                "toolbar":                  rgb("${p.backgrounds.bg2}"),

                # Tabs
                "tab_text":                 rgb("${p.foregrounds.fg0}"),
                "tab_background_text":      rgb("${p.foregrounds.fg2}"),

                # Bookmarks bar
                "bookmark_text":            rgb("${p.foregrounds.fg1}"),

                # New Tab Page
                "ntp_background":           rgb("${p.backgrounds.bg0}"),
                "ntp_text":                 rgb("${p.foregrounds.fg0}"),
                "ntp_link":                 rgb("${p.accents.iris}"),
                "ntp_section":              rgb("${p.backgrounds.bg2}"),
                "ntp_section_text":         rgb("${p.foregrounds.fg0}"),
                "ntp_section_link":         rgb("${p.accents.iris}"),

                # Toolbar buttons
                "button_background":        rgb("${p.backgrounds.bg3}"),
            },
            "properties": {
                # Use white Google logo on the NTP (suits dark backgrounds)
                "ntp_logo_alternate": 1,
            },
        },
    }

    with open(sys.argv[1], "w") as f:
        json.dump(manifest, f, indent=2)
        f.write("\n")
  '';

in pkgs.runCommand "umbra-chromium-theme"
  { nativeBuildInputs = [ pkgs.python3 ]; }
  ''
    mkdir -p $out
    python3 ${genManifest} $out/manifest.json
  ''
