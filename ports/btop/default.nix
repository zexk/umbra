{ pkgs, palette }:

let
  p = palette;
  bg = p.backgrounds;
  fg = p.foregrounds;
  ac = p.accents;
  an = p.ansi;

  themeContent = ''
    # Umbra — btop theme (v0.2)
    # Auto-generated from the Umbra palette. Do not edit by hand.

    # Main background; empty = terminal default / transparent
    theme[main_bg]="${bg.bg1}"

    # Main text
    theme[main_fg]="${fg.fg0}"

    # Box title text
    theme[title]="${fg.fg0}"

    # Keyboard shortcut highlight
    theme[hi_fg]="${ac.iris}"

    # Selected process row
    theme[selected_bg]="${ac.iris}"
    theme[selected_fg]="${bg.bg0}"

    # Inactive / disabled text
    theme[inactive_fg]="${fg.fg3}"

    # Text drawn on top of graphs (uptime, net scale)
    theme[graph_text]="${fg.fg1}"

    # Meter track background
    theme[meter_bg]="${bg.bg3}"

    # Misc process colours (mini cpu graphs, detail status)
    theme[proc_misc]="${ac.mauve}"

    # Box outlines
    theme[cpu_box]="${ac.iris}"
    theme[mem_box]="${an.green}"
    theme[net_box]="${an.blue}"
    theme[proc_box]="${ac.mauve}"

    # Divider / small-box lines
    theme[div_line]="${bg.bg3}"

    # Temperature gradient: cool → warm → hot
    theme[temp_start]="${an.blue}"
    theme[temp_mid]="${an.yellow}"
    theme[temp_end]="${an.red}"

    # CPU usage gradient: idle → moderate → pegged
    theme[cpu_start]="${ac.iris}"
    theme[cpu_mid]="${an.yellow}"
    theme[cpu_end]="${an.red}"

    # Memory: free meter (green family)
    theme[free_start]="${an.bright.green}"
    theme[free_mid]="${an.green}"
    theme[free_end]="${an.cyan}"

    # Memory: cached meter (blue family)
    theme[cached_start]="${an.bright.blue}"
    theme[cached_mid]="${an.blue}"
    theme[cached_end]="${an.cyan}"

    # Memory: available meter (plum family)
    theme[available_start]="${ac.iris}"
    theme[available_mid]="${ac.mauve}"
    theme[available_end]="${ac.magenta}"

    # Memory: used meter (warms toward red as usage rises)
    theme[used_start]="${ac.mauve}"
    theme[used_mid]="${ac.magenta}"
    theme[used_end]="${an.red}"

    # Network: download (cool iris → blue → cyan)
    theme[download_start]="${ac.iris}"
    theme[download_mid]="${an.blue}"
    theme[download_end]="${an.cyan}"

    # Network: upload (plum family)
    theme[upload_start]="${ac.mauve}"
    theme[upload_mid]="${ac.iris}"
    theme[upload_end]="${ac.magenta}"

    # Process column bars (cpu/mem/thread usage)
    theme[process_start]="${an.green}"
    theme[process_mid]="${ac.iris}"
    theme[process_end]="${fg.fg3}"
  '';

in pkgs.writeText "umbra.theme" themeContent
