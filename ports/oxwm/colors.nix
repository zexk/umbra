# Umbra — oxwm colour reference
# All values are ARGB 8-digit hex strings (no leading #), full opacity (ff).
# Usage: import this file and pass the attrset as `c` in your oxwm settings.
#
# Example:
#   let c = import <umbra/ports/oxwm/colors.nix>; in
#   programs.oxwm.settings.border.focusedColor = c.iris;

{
  # ── Backgrounds ─────────────────────────────────────────────────────────────
  bg0     = "ff100c1c";   # base / void
  bg1     = "ff181327";   # window background
  bg2     = "ff221a35";   # panel / sidebar
  bg3     = "ff2c2244";   # card / hover
  bg4     = "ff392c56";   # selection / active
  bg5     = "ff4a3a6e";   # border bright

  # ── Foregrounds ──────────────────────────────────────────────────────────────
  fg0     = "ffece6f7";   # primary text
  fg1     = "ffc8bce0";   # secondary text
  fg2     = "ff9a8db8";   # muted
  fg3     = "ff6e6189";   # comment / disabled

  # ── Accents ──────────────────────────────────────────────────────────────────
  iris    = "ffb48cff";   # primary purple
  mauve   = "ffd49bff";   # highlight
  magenta = "ffe26ad1";   # secondary

  # ── ANSI ─────────────────────────────────────────────────────────────────────
  red     = "ffe26a7a";
  green   = "ff8fd49b";
  yellow  = "ffe8c87a";
  blue    = "ff8aa9f0";
  cyan    = "ff7fd2d2";

  # ── Semantic ─────────────────────────────────────────────────────────────────
  error   = "ffe26a7a";
  warn    = "ffe8c87a";
  info    = "ff8aa9f0";
  success = "ff8fd49b";
}
