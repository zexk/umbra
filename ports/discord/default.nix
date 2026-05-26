{ pkgs, palette }:

let
  p = palette;

  themeContent = ''
    /**
     * @name Umbra
     * @description A dark plum colorscheme for Discord / Vesktop
     * @version 0.2
     * @author Umbra
     * @source https://github.com/zexk/umbra
     */

    .theme-dark,
    .theme-light {
      /* ── Umbra palette ──────────────────────────────────────────────────── */
      --um-bg0:     ${p.backgrounds.bg0};
      --um-bg1:     ${p.backgrounds.bg1};
      --um-bg2:     ${p.backgrounds.bg2};
      --um-bg3:     ${p.backgrounds.bg3};
      --um-bg4:     ${p.backgrounds.bg4};
      --um-bg5:     ${p.backgrounds.bg5};
      --um-fg0:     ${p.foregrounds.fg0};
      --um-fg1:     ${p.foregrounds.fg1};
      --um-fg2:     ${p.foregrounds.fg2};
      --um-fg3:     ${p.foregrounds.fg3};
      --um-iris:    ${p.accents.iris};
      --um-mauve:   ${p.accents.mauve};
      --um-magenta: ${p.accents.magenta};
      --um-red:     ${p.ansi.red};
      --um-green:   ${p.ansi.green};
      --um-yellow:  ${p.ansi.yellow};
      --um-blue:    ${p.ansi.blue};
      --um-cyan:    ${p.ansi.cyan};

      /* ── Text ───────────────────────────────────────────────────────────── */
      --header-primary:     var(--um-fg0);
      --header-secondary:   var(--um-fg1);
      --text-normal:        var(--um-fg0);
      --text-muted:         var(--um-fg3);
      --text-link:          var(--um-iris);
      --channels-default:   var(--um-fg2);
      --interactive-normal: var(--um-fg1);
      --interactive-hover:  var(--um-fg0);
      --interactive-active: var(--um-fg0);
      --interactive-muted:  var(--um-fg3);

      /* ── Backgrounds ────────────────────────────────────────────────────── */
      --background-primary:          var(--um-bg1);  /* main chat area */
      --background-secondary:        var(--um-bg2);  /* channel sidebar */
      --background-secondary-alt:    var(--um-bg2);
      --background-tertiary:         var(--um-bg0);  /* server list */
      --background-accent:           var(--um-bg3);
      --background-floating:         var(--um-bg2);  /* menus / tooltips */
      --background-mobile-primary:   var(--um-bg1);
      --background-mobile-secondary: var(--um-bg2);

      /* 8-digit hex for translucent modifiers (#RRGGBBAA) */
      --background-modifier-hover:     ${p.backgrounds.bg3}29;  /* ~16% */
      --background-modifier-active:    ${p.backgrounds.bg4}40;  /* ~25% */
      --background-modifier-selected:  ${p.backgrounds.bg4}59;  /* ~35% */
      --background-modifier-accent:    ${p.accents.iris}0f;     /* ~6%  */
      --background-mentioned:          ${p.accents.iris}0d;     /* ~5%  */
      --background-mentioned-hover:    ${p.accents.iris}14;     /* ~8%  */
      --background-message-hover:      ${p.backgrounds.bg0}12;  /* ~7%  */
      --background-help-warning:       ${p.ansi.yellow}1a;      /* ~10% */
      --background-help-info:          ${p.ansi.blue}1a;        /* ~10% */

      /* ── Scrollbars ─────────────────────────────────────────────────────── */
      --scrollbar-thin-thumb:                  var(--um-bg4);
      --scrollbar-thin-track:                  transparent;
      --scrollbar-auto-thumb:                  var(--um-bg4);
      --scrollbar-auto-track:                  var(--um-bg2);
      --scrollbar-auto-scrollbar-color-thumb:  var(--um-bg4);
      --scrollbar-auto-scrollbar-color-track:  var(--um-bg2);

      /* ── Elevation / shadows ────────────────────────────────────────────── */
      --elevation-stroke: 0 0 0 1px ${p.backgrounds.bg0}4d;
      --elevation-low:    0 1px 0 ${p.backgrounds.bg0}33,
                          0 1.5px 0 ${p.backgrounds.bg0}0d,
                          0 2px 0 ${p.backgrounds.bg0}0d;
      --elevation-medium: 0 4px 4px ${p.backgrounds.bg0}40;
      --elevation-high:   0 8px 16px ${p.backgrounds.bg0}59;

      /* ── Focus / accent ─────────────────────────────────────────────────── */
      --focus-primary:          var(--um-iris);
      --logo-primary:           #ffffff;
      --radio-group-dot-foreground: var(--um-bg0);

      /* ── Message input & cards ──────────────────────────────────────────── */
      --channeltextarea-background:             var(--um-bg3);
      --activity-card-background:              var(--um-bg2);
      --textbox-markdown-syntax:               var(--um-fg3);
      --deprecated-card-bg:                    ${p.backgrounds.bg2}99;
      --deprecated-card-editable-bg:           ${p.backgrounds.bg2}4d;
      --deprecated-store-bg:                   var(--um-bg2);
      --deprecated-quickswitcher-input-background: var(--um-bg3);
      --deprecated-quickswitcher-input-placeholder: ${p.foregrounds.fg3}4d;
      --deprecated-text-input-bg:              ${p.backgrounds.bg0}1a;
      --deprecated-text-input-border:          ${p.backgrounds.bg0}4d;
      --deprecated-text-input-border-hover:    var(--um-iris);
      --deprecated-text-input-border-disabled: var(--um-bg2);
      --deprecated-text-input-prefix:          var(--um-fg0);

      /* ── Status indicators ──────────────────────────────────────────────── */
      --rs-online-color:    var(--um-green);
      --rs-idle-color:      var(--um-yellow);
      --rs-dnd-color:       var(--um-red);
      --rs-streaming-color: var(--um-magenta);
      --rs-offline-color:   var(--um-fg3);
      --rs-invisible-color: var(--um-bg3);

      /* ── Guild header ───────────────────────────────────────────────────── */
      --guild-header-text-shadow: 0 1px 1px ${p.backgrounds.bg0}66;
    }
  '';

in pkgs.writeText "umbra.theme.css" themeContent
