{ pkgs, palette }:

let
  p = palette;
in pkgs.writeText "umbra-vimium-c.css" ''
  /* Umbra — Vimium-C custom CSS
     Paste into: Vimium-C options → Advanced → Custom CSS for Vimium UI */

  /* Hint markers */
  .vimiumHintMarker {
    background-color: ${p.backgrounds.bg2} !important;
    border: 1px solid ${p.borders.line} !important;
    padding: 1px 3px !important;
    font-weight: bold !important;
  }
  .vimiumHintMarker > span {
    color: ${p.foregrounds.fg0} !important;
  }
  .vimiumHintMarker.matched > span,
  .vimiumHintMarker.matchedHint > span {
    color: ${p.accents.iris} !important;
  }

  /* HUD (mode indicator / find bar) */
  #vimiumHUD {
    background-color: ${p.backgrounds.bg1} !important;
    color: ${p.foregrounds.fg1} !important;
    border-top: 1px solid ${p.borders.line} !important;
  }
  #vimiumHUD input {
    background-color: ${p.backgrounds.bg0} !important;
    color: ${p.foregrounds.fg0} !important;
    border: 1px solid ${p.borders.line} !important;
  }
''
