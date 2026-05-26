{ pkgs, palette }:

let
  p = palette;
in pkgs.writeText "umbra-vimium-c.css" ''
  /* Umbra — Vimium-C custom CSS
     Paste into: Vimium-C options → Advanced → Custom CSS for Vimium UI */

  /* Hint box */
  .LH {
    background-color: ${p.backgrounds.bg2};
    border: 1px solid ${p.borders.line};
  }

  /* Hint characters */
  .LH > .MC {
    color: ${p.foregrounds.fg0};
    font-weight: bold;
  }

  /* Selected / matched hint */
  .S {
    background-color: ${p.backgrounds.bg3};
    border-color: ${p.accents.iris};
  }
  .S > .MC {
    color: ${p.accents.iris};
  }

  /* HUD (mode indicator / find bar) */
  #vimiumHUD {
    background-color: ${p.backgrounds.bg1};
    color: ${p.foregrounds.fg1};
    border-top: 1px solid ${p.borders.line};
  }
  #vimiumHUD input {
    background-color: ${p.backgrounds.bg0};
    color: ${p.foregrounds.fg0};
    border: 1px solid ${p.borders.line};
  }
''
