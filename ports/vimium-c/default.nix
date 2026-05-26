{ pkgs, palette }:

let
  p = palette;
in pkgs.writeText "umbra-vimium-c.css" ''
  /* Umbra — Vimium-C custom CSS
     Paste into: Vimium-C options → Advanced → Custom CSS for Vimium UI */

  /* Hint markers */
  .vimiumHintMarker {
    background-color: ${p.backgrounds.bg2};
    border: 1px solid ${p.borders.line};
    padding: 1px 3px;
    font-weight: bold;
  }
  .vimiumHintMarker > .keyLabel {
    color: ${p.foregrounds.fg0};
  }
  .vimiumHintMarker > .typedKeyLabel {
    color: ${p.accents.iris};
  }
  .vimiumHintMarker.matchingHint .keyLabel {
    color: ${p.foregrounds.fg3};
  }

  /* HUD (mode indicator / find bar) */
  #vimiumHUD {
    background-color: ${p.backgrounds.bg1};
    color: ${p.foregrounds.fg1};
    border-top: 1px solid ${p.borders.line};
  }
  #vimiumHUD .HUDcontainer {
    background-color: ${p.backgrounds.bg1};
  }
  #vimiumHUD input {
    background-color: ${p.backgrounds.bg0};
    color: ${p.foregrounds.fg0};
    border: 1px solid ${p.borders.line};
  }
''
