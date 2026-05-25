{ palette, umbraLib }:

{ config, lib, pkgs, ... }:

let
  cfg = config.umbra;
in {
  options.umbra = {
    enable = lib.mkEnableOption "Umbra colorscheme";

    terminal = lib.mkOption {
      type    = lib.types.enum [ "alacritty" "kitty" "foot" "wezterm" ];
      default = "foot";
      description = "Terminal emulator to theme.";
    };
  };

  config = lib.mkIf cfg.enable {
    # Ports land here as they are implemented:
    #   - programs.alacritty / kitty / foot / wezterm colorscheme
    #   - programs.neovim colorscheme
    #   - gtk.theme
    #   - xresources colours
  };
}
