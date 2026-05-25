{ palette, umbraLib }:

{ config, lib, pkgs, ... }:

let
  cfg = config.umbra;
in {
  options.umbra = {
    enable = lib.mkEnableOption "Umbra colorscheme";
  };

  config = lib.mkIf cfg.enable {
    # Ports land here as they are implemented:
    #   - GTK 3/4 theme
    #   - cursor theme
    #   - icon colouring
    #   - etc.
  };
}
