# Umbra

A dark, plum-toned colour scheme with a single canonical palette
(`palette/umbra.toml`) and Nix-generated ports for terminals, editors,
browsers, and desktop apps.

## Ports

| App | Method |
|---|---|
| alacritty, bat, fzf, starship, tmux, xresources, neovim, oxwm | static file, generated |
| btop, chromium, dark-reader, discord, firefox, gtk, telegram, vimium-c, vscode | package derivation |
| delta, foot, ghostty, helix, kitty, lazygit, mako, swaylock, waybar | inline (home-manager module only) |

See `ports.md` for the full wiring table.

## Usage

As a flake input:

```nix
{
  inputs.umbra.url = "github:zexk/umbra";
}
```

Home Manager module:

```nix
{
  imports = [ umbra.homeManagerModules.default ];
  umbra.enable = true;
}
```

Standalone packages, e.g. the GTK theme:

```sh
nix build github:zexk/umbra#gtk
```

The raw palette is exposed as `umbra.palette` for consumption by other flakes.

## Layout

- `palette/umbra.toml` — single source of truth for every colour
- `lib/` — palette helpers (flattening, ANSI ordering, hex conversion)
- `ports/<app>/` — per-app theme source or template
- `modules/` — NixOS and Home Manager modules that wire ports together
