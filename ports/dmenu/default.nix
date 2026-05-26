{ pkgs, palette }:

let p = palette;
in pkgs.symlinkJoin {
  name = "dmenu-umbra";
  paths = [ pkgs.dmenu ];
  nativeBuildInputs = [ pkgs.makeWrapper ];
  # Bake Umbra colors in as default flags. User-supplied flags still override
  # because dmenu takes the last occurrence of each flag.
  postBuild = ''
    wrapProgram $out/bin/dmenu \
      --add-flags "-nb" --add-flags "${p.backgrounds.bg1}" \
      --add-flags "-nf" --add-flags "${p.foregrounds.fg1}" \
      --add-flags "-sb" --add-flags "${p.accents.iris}" \
      --add-flags "-sf" --add-flags "${p.backgrounds.bg0}"
  '';
}
