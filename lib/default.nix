{ palette }:

let
  inherit (palette) backgrounds foregrounds borders accents ansi semantic syntax;
in rec {
  # Flat attrset of every named colour — useful for template-based port generation.
  # ANSI bright colours are prefixed with "br_" to avoid collisions.
  flat =
    backgrounds
    // foregrounds
    // borders
    // accents
    // semantic
    // syntax
    // {
      ansi_black   = ansi.black;
      ansi_red     = ansi.red;
      ansi_green   = ansi.green;
      ansi_yellow  = ansi.yellow;
      ansi_blue    = ansi.blue;
      ansi_magenta = ansi.magenta;
      ansi_cyan    = ansi.cyan;
      ansi_white   = ansi.white;
      br_black     = ansi.bright.black;
      br_red       = ansi.bright.red;
      br_green     = ansi.bright.green;
      br_yellow    = ansi.bright.yellow;
      br_blue      = ansi.bright.blue;
      br_magenta   = ansi.bright.magenta;
      br_cyan      = ansi.bright.cyan;
      br_white     = ansi.bright.white;
    };

  # Ordered list of all 16 ANSI colours (indices 0–15).
  ansi16 = with ansi; [
    black red green yellow blue magenta cyan white
    bright.black bright.red bright.green bright.yellow
    bright.blue bright.magenta bright.cyan bright.white
  ];

  # Strip leading '#' — some config formats want bare hex.
  stripHash = s: builtins.substring 1 (builtins.stringLength s - 1) s;

  # Build a substitution context from `flat` — pass to builtins.replaceStrings
  # or a mustache-style renderer to stamp out port templates.
  templateCtx = builtins.mapAttrs (_: stripHash) flat;
}
