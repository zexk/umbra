{ pkgs, palette }:

let
  p = palette;

  themeContent = ''
    /**
     * @name Umbra
     * @description A dark plum colorscheme for Discord / Vesktop
     * @version 0.4
     * @author Umbra
     * @source https://github.com/zexk/umbra
     */

    .theme-dark,
    .theme-light,
    .visual-refresh {
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

      /* ── 2025 text tokens ───────────────────────────────────────────────── */
      --text-primary:       var(--um-fg0);
      --text-default:       var(--um-fg0);
      --text-strong:        var(--um-fg0);
      --text-subtle:        var(--um-fg2);
      --text-low-contrast:  var(--um-fg3);
      --text-brand:         var(--um-iris);
      --textbox-markdown-syntax: var(--um-fg3);

      /* ── 2025 icon tokens ───────────────────────────────────────────────── */
      --icon-default:  var(--um-fg2);
      --icon-muted:    var(--um-fg3);
      --icon-strong:   var(--um-fg0);
      --icon-subtle:   var(--um-fg2);
      --channel-icon:  var(--um-fg2);

      /* ── 2025 interactive system ────────────────────────────────────────── */
      --interactive-text-default:          var(--um-fg2);
      --interactive-text-hover:            var(--um-fg1);
      --interactive-text-active:           var(--um-fg0);
      --interactive-icon-default:          var(--um-fg2);
      --interactive-icon-hover:            var(--um-fg1);
      --interactive-icon-active:           var(--um-fg0);
      --interactive-background-hover:      ${p.backgrounds.bg3}29;  /* ~16% */
      --interactive-background-active:     ${p.backgrounds.bg4}40;  /* ~25% */
      --interactive-background-selected:   ${p.backgrounds.bg4}59;  /* ~35% */

      /* ── 2025 input system ──────────────────────────────────────────────── */
      --input-background-default:          var(--um-bg3);
      --input-placeholder-text-default:    var(--um-fg3);
      --input-text-default:                var(--um-fg0);
      --input-border-default:              var(--um-bg5);
      --input-border-hover:                var(--um-iris);
      --input-border-active:               var(--um-iris);
      --channel-text-area-placeholder:     var(--um-fg3);

      /* ── Backgrounds ────────────────────────────────────────────────────── */
      --background-primary:          var(--um-bg1);
      --background-secondary:        var(--um-bg2);
      --background-secondary-alt:    var(--um-bg2);
      --background-tertiary:         var(--um-bg0);
      --background-accent:           var(--um-bg3);
      --background-floating:         var(--um-bg2);
      --background-mobile-primary:   var(--um-bg1);
      --background-mobile-secondary: var(--um-bg2);

      /* ── 2025 surface hierarchy ─────────────────────────────────────────── */
      --background-base-lowest:      var(--um-bg0);
      --background-base-lower:       var(--um-bg1);
      --background-base-low:         var(--um-bg2);
      --background-base-code:        var(--um-bg3);
      --background-code:             var(--um-bg3);
      --background-surface-high:     var(--um-bg2);
      --background-surface-higher:   var(--um-bg3);
      --background-surface-highest:  var(--um-bg4);
      --background-scrim:            ${p.backgrounds.bg0}b3;  /* ~70% */
      --bg-surface-overlay:          var(--um-bg2);
      --bg-surface-overlay-tmp:      var(--um-bg2);
      --bg-surface-raised:           var(--um-bg2);

      /* ── Background modifiers (8-digit hex = #RRGGBBAA) ─────────────────── */
      --background-modifier-hover:     ${p.backgrounds.bg3}29;  /* ~16% */
      --background-modifier-active:    ${p.backgrounds.bg4}40;  /* ~25% */
      --background-modifier-selected:  ${p.backgrounds.bg4}59;  /* ~35% */
      --background-modifier-accent:    ${p.accents.iris}0f;     /* ~6%  */
      --background-mentioned:          ${p.accents.iris}0d;     /* ~5%  */
      --background-mentioned-hover:    ${p.accents.iris}14;     /* ~8%  */
      --background-message-hover:      ${p.backgrounds.bg0}12;  /* ~7%  */
      --background-help-warning:       ${p.ansi.yellow}1a;      /* ~10% */
      --background-help-info:          ${p.ansi.blue}1a;        /* ~10% */

      /* ── 2025 overlay modifiers ─────────────────────────────────────────── */
      --background-mod-invisible: transparent;
      --background-mod-muted:     ${p.backgrounds.bg3}14;  /* ~8%  */
      --background-mod-subtle:    ${p.backgrounds.bg3}29;  /* ~16% */
      --background-mod-normal:    ${p.backgrounds.bg4}40;  /* ~25% */
      --background-mod-strong:    ${p.backgrounds.bg4}59;  /* ~35% */
      --bg-mod-faint:             ${p.backgrounds.bg3}14;  /* ~8%  */

      /* ── 2025 message tokens ────────────────────────────────────────────── */
      --message-background-hover:                var(--um-bg3);
      --message-mentioned-background-default:    ${p.accents.iris}0d;  /* ~5%  */
      --message-mentioned-background-hover:      ${p.accents.iris}14;  /* ~8%  */
      --message-highlight-background-default:    ${p.backgrounds.bg3}33;  /* ~20% */
      --message-highlight-background-hover:      ${p.backgrounds.bg3}47;  /* ~28% */
      --mention-background:                      ${p.accents.iris}1a;  /* ~10% */
      --mention-foreground:                      var(--um-iris);

      /* ── 2025 card, chat, modal ─────────────────────────────────────────── */
      --card-background-default:   var(--um-bg3);
      --chat-background-default:   var(--um-bg1);
      --chat-text-muted:           var(--um-fg3);
      --modal-background:          var(--um-bg2);
      --modal-footer-background:   var(--um-bg2);

      /* ── Scrollbars ─────────────────────────────────────────────────────── */
      --scrollbar-thin-thumb:                  var(--um-bg4);
      --scrollbar-thin-track:                  transparent;
      --scrollbar-auto-thumb:                  var(--um-bg4);
      --scrollbar-auto-track:                  var(--um-bg2);
      --scrollbar-auto-scrollbar-color-thumb:  var(--um-bg4);
      --scrollbar-auto-scrollbar-color-track:  var(--um-bg2);

      /* ── 2025 borders & dividers ────────────────────────────────────────── */
      --border-faint:    var(--um-bg4);
      --border-muted:    var(--um-bg4);
      --border-normal:   var(--um-bg5);
      --border-subtle:   var(--um-bg5);
      --border-strong:   var(--um-fg3);
      --border-focus:    var(--um-iris);
      --divider-subtle:  var(--um-bg3);
      --divider-strong:  var(--um-bg4);
      --spine-default:   var(--um-fg3);

      /* ── Elevation / shadows ────────────────────────────────────────────── */
      --elevation-stroke: 0 0 0 1px ${p.backgrounds.bg0}4d;
      --elevation-low:    0 1px 0 ${p.backgrounds.bg0}33,
                          0 1.5px 0 ${p.backgrounds.bg0}0d,
                          0 2px 0 ${p.backgrounds.bg0}0d;
      --elevation-medium: 0 4px 4px ${p.backgrounds.bg0}40;
      --elevation-high:   0 8px 16px ${p.backgrounds.bg0}59;

      /* ── Focus / accent ─────────────────────────────────────────────────── */
      --focus-primary:              var(--um-iris);
      --control-brand-foreground:   var(--um-iris);
      --logo-primary:               #ffffff;
      --radio-group-dot-foreground: var(--um-bg0);

      /* ── Message input & cards ──────────────────────────────────────────── */
      --channeltextarea-background:             var(--um-bg3);
      --activity-card-background:               var(--um-bg2);
      --deprecated-card-bg:                     ${p.backgrounds.bg2}99;
      --deprecated-card-editable-bg:            ${p.backgrounds.bg2}4d;
      --deprecated-store-bg:                    var(--um-bg2);
      --deprecated-quickswitcher-input-background:   var(--um-bg3);
      --deprecated-quickswitcher-input-placeholder:  ${p.foregrounds.fg3}4d;
      --deprecated-text-input-bg:               ${p.backgrounds.bg0}1a;
      --deprecated-text-input-border:           ${p.backgrounds.bg0}4d;
      --deprecated-text-input-border-hover:     var(--um-iris);
      --deprecated-text-input-border-disabled:  var(--um-bg2);
      --deprecated-text-input-prefix:           var(--um-fg0);

      /* ── Status indicators ──────────────────────────────────────────────── */
      --rs-online-color:    var(--um-green);
      --rs-idle-color:      var(--um-yellow);
      --rs-dnd-color:       var(--um-red);
      --rs-streaming-color: var(--um-magenta);
      --rs-offline-color:   var(--um-fg3);
      --rs-invisible-color: var(--um-bg3);

      /* ── User profile ───────────────────────────────────────────────────── */
      --user-profile-overlay-background:       var(--um-bg2);
      --user-profile-background-hover:         ${p.backgrounds.bg3}1a;  /* ~10% */
      --user-profile-border:                   var(--um-bg4);
      --user-profile-toolbar-background:       var(--um-bg2);
      --user-profile-note-background-focus:    var(--um-bg1);

      /* ── Guild header ───────────────────────────────────────────────────── */
      --guild-header-text-shadow: 0 1px 1px ${p.backgrounds.bg0}66;
    }
  '';

in pkgs.writeText "umbra.theme.css" themeContent
