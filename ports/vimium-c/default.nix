{ pkgs, palette }:

let
  p = palette;
in pkgs.writeText "umbra-vimium-c.css" ''
  /* Umbra — Vimium-C custom CSS
     Paste into: Vimium-C options → Advanced → Custom CSS for Vimium UI */

  /* #ui */

  /* Hint markers — color is on .LH directly, .D>.LH covers force-dark mode */
  .LH, .D > .LH {
    background-color: ${p.backgrounds.bg2};
    color: ${p.foregrounds.fg0};
    border: 1px solid ${p.borders.line};
    font-weight: bold;
  }

  /* Selected / matched hint */
  .S, .D > .S {
    background-color: ${p.backgrounds.bg3};
    color: ${p.accents.iris};
    border-color: ${p.accents.iris};
  }

  /* HUD */
  .HUD {
    background-color: ${p.backgrounds.bg1};
    color: ${p.foregrounds.fg1};
  }
  .HUD.D:after {
    background: ${p.backgrounds.bg1};
  }
''
