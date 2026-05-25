{ pkgs, palette }:

let
  p  = palette;
  bg = p.backgrounds;
  fg = p.foregrounds;
  ac = p.accents;
  se = p.semantic;
  bo = p.borders;

  # ── GTK4 / libadwaita ──────────────────────────────────────────────────────
  # Pure @define-color overrides — libadwaita reads these at runtime.
  # From spec §06: accent→iris, destructive→error, success/warning/error as named,
  # window→bg1, view→bg0, headerbar→bg2.
  gtk4Css = ''
    /* Umbra — libadwaita color overrides */

    @define-color accent_color              ${ac.iris};
    @define-color accent_bg_color           ${ac.iris};
    @define-color accent_fg_color           ${bg.bg0};

    @define-color destructive_color         ${se.error};
    @define-color destructive_bg_color      ${se.error};
    @define-color destructive_fg_color      ${bg.bg0};

    @define-color success_color             ${se.success};
    @define-color success_bg_color          ${se.success};
    @define-color success_fg_color          ${bg.bg0};

    @define-color warning_color             ${se.warn};
    @define-color warning_bg_color          ${se.warn};
    @define-color warning_fg_color          ${bg.bg0};

    @define-color error_color               ${se.error};
    @define-color error_bg_color            ${se.error};
    @define-color error_fg_color            ${bg.bg0};

    @define-color window_bg_color           ${bg.bg1};
    @define-color window_fg_color           ${fg.fg0};

    @define-color view_bg_color             ${bg.bg0};
    @define-color view_fg_color             ${fg.fg0};

    @define-color headerbar_bg_color        ${bg.bg2};
    @define-color headerbar_fg_color        ${fg.fg0};
    @define-color headerbar_border_color    ${bo.line};
    @define-color headerbar_backdrop_color  ${bg.bg1};
    @define-color headerbar_shade_color     rgba(0, 0, 0, 0.20);

    @define-color card_bg_color             ${bg.bg2};
    @define-color card_fg_color             ${fg.fg0};
    @define-color card_shade_color          rgba(0, 0, 0, 0.15);

    @define-color dialog_bg_color           ${bg.bg2};
    @define-color dialog_fg_color           ${fg.fg0};

    @define-color popover_bg_color          ${bg.bg3};
    @define-color popover_fg_color          ${fg.fg0};
    @define-color popover_shade_color       rgba(0, 0, 0, 0.15);

    @define-color shade_color               rgba(0, 0, 0, 0.15);
    @define-color scrollbar_outline_color   rgba(0, 0, 0, 0.50);

    @define-color sidebar_bg_color          ${bg.bg1};
    @define-color sidebar_fg_color          ${fg.fg1};
    @define-color sidebar_backdrop_color    ${bg.bg0};
    @define-color sidebar_shade_color       rgba(0, 0, 0, 0.10);

    @define-color secondary_sidebar_bg_color        ${bg.bg2};
    @define-color secondary_sidebar_fg_color        ${fg.fg1};
    @define-color secondary_sidebar_backdrop_color  ${bg.bg1};
    @define-color secondary_sidebar_shade_color     rgba(0, 0, 0, 0.10);

    @define-color thumbnail_bg_color        ${bg.bg2};
    @define-color thumbnail_fg_color        ${fg.fg0};
  '';

  # ── GTK3 ───────────────────────────────────────────────────────────────────
  # Full standalone theme — no Adwaita dependency, no rounding, no shadows.
  gtk3Css = ''
    /* Umbra GTK3 theme — square, flat, no shadows */

    /* ── Palette variables ──────────────────────────────────────────────────── */
    @define-color bg0      ${bg.bg0};
    @define-color bg1      ${bg.bg1};
    @define-color bg2      ${bg.bg2};
    @define-color bg3      ${bg.bg3};
    @define-color bg4      ${bg.bg4};
    @define-color bg5      ${bg.bg5};

    @define-color fg0      ${fg.fg0};
    @define-color fg1      ${fg.fg1};
    @define-color fg2      ${fg.fg2};
    @define-color fg3      ${fg.fg3};

    @define-color line      ${bo.line};
    @define-color line_soft ${bo.line_soft};

    @define-color iris      ${ac.iris};
    @define-color iris_soft ${ac.iris_soft};
    @define-color mauve     ${ac.mauve};
    @define-color magenta   ${ac.magenta};

    @define-color success   ${se.success};
    @define-color warn      ${se.warn};
    @define-color error     ${se.error};
    @define-color info      ${se.info};

    /* Standard GTK role aliases (apps query these directly) */
    @define-color theme_bg_color                    @bg1;
    @define-color theme_fg_color                    @fg0;
    @define-color theme_base_color                  @bg0;
    @define-color theme_text_color                  @fg0;
    @define-color theme_selected_bg_color           @bg4;
    @define-color theme_selected_fg_color           @fg0;
    @define-color theme_unfocused_bg_color          @bg1;
    @define-color theme_unfocused_fg_color          @fg1;
    @define-color theme_unfocused_base_color        @bg0;
    @define-color theme_unfocused_text_color        @fg1;
    @define-color theme_unfocused_selected_bg_color @bg3;
    @define-color theme_unfocused_selected_fg_color @fg1;
    @define-color borders                           @line;
    @define-color unfocused_borders                 @line_soft;
    @define-color warning_color                     @warn;
    @define-color error_color                       @error;
    @define-color success_color                     @success;

    /* ── Reset ──────────────────────────────────────────────────────────────── */
    * { padding: 0; margin: 0; box-shadow: none; }
    *:focus { outline-style: none; }

    /* ── Window / background ────────────────────────────────────────────────── */
    .background,
    window {
      background-color: @bg1;
      color: @fg0;
    }
    .window-frame,
    .window-frame:backdrop { box-shadow: none; margin: 0; }

    /* ── View (text/list backgrounds) ──────────────────────────────────────── */
    .view                      { background-color: @bg0; color: @fg0; }
    .view:selected,
    .view:selected:focus       { background-color: @bg4; color: @fg0; }
    .view:backdrop             { color: @fg1; }

    /* ── Headerbar / Titlebar ───────────────────────────────────────────────── */
    headerbar,
    .titlebar {
      padding: 6px 10px;
      min-height: 44px;
      background-color: @bg2;
      color: @fg0;
      border-bottom: 1px solid @line;
    }
    headerbar:backdrop,
    .titlebar:backdrop {
      background-color: @bg1;
      color: @fg2;
      border-bottom-color: @line_soft;
    }
    headerbar .title    { font-weight: 500; }
    headerbar .subtitle { color: @fg2; font-size: smaller; }

    /* Window control buttons — square */
    headerbar button.titlebutton {
      min-width: 18px;
      min-height: 18px;
      padding: 0;
      border: 1px solid @line;
      background-color: @bg4;
      color: @fg1;
    }
    headerbar button.titlebutton:hover { background-color: @bg5; }
    headerbar button.titlebutton.close {
      background-color: @iris;
      border-color: @iris;
      color: @bg0;
    }
    headerbar button.titlebutton.close:hover {
      background-color: @mauve;
      border-color: @mauve;
    }

    /* Headerbar action buttons */
    headerbar button:not(.titlebutton) {
      padding: 4px 8px;
      min-height: 28px;
      background-color: @bg3;
      border-color: @line;
    }
    headerbar button:not(.titlebutton):hover { background-color: @bg4; }
    headerbar button:not(.titlebutton).suggested-action {
      background-color: @iris;
      color: @bg0;
      border-color: @iris;
    }

    /* ── Paned separator ────────────────────────────────────────────────────── */
    paned > separator { background-color: @line; min-width: 1px; min-height: 1px; }

    /* ── Sidebar ────────────────────────────────────────────────────────────── */
    .sidebar                        { background-color: @bg1; border-right: 1px solid @line; }
    .sidebar .sidebar-item          { color: @fg1; padding: 6px 12px; }
    .sidebar .sidebar-item:hover    { background-color: @bg3; color: @fg0; }
    .sidebar .sidebar-item:selected {
      background-color: @bg4;
      color: @fg0;
      border-left: 2px solid @iris;
      padding-left: 10px;
    }

    /* ── Label ──────────────────────────────────────────────────────────────── */
    label               { color: @fg0; }
    label:disabled,
    label.dim-label     { color: @fg3; }
    label selection     { background-color: @bg4; color: @fg0; }

    /* ── Separator ──────────────────────────────────────────────────────────── */
    separator           { background-color: @line; min-width: 1px; min-height: 1px; }

    /* ── Button ─────────────────────────────────────────────────────────────── */
    button {
      padding: 7px 15px;
      border: 1px solid @line;
      background-color: @bg2;
      color: @fg0;
    }
    button:hover        { background-color: @bg3; border-color: @bg5; }
    button:active,
    button:checked      { background-color: @bg4; border-color: @bg5; }
    button:focus        { border-color: @iris; }
    button:disabled     { background-color: @bg1; color: @fg3; border-color: @line_soft; }

    button.flat         { border-color: transparent; background-color: transparent; }
    button.flat:hover   { background-color: @bg3; border-color: transparent; }
    button.flat:active,
    button.flat:checked { background-color: @bg4; border-color: transparent; }

    button.suggested-action          { background-color: @iris; color: @bg0; border-color: @iris; }
    button.suggested-action:hover    { background-color: @mauve; border-color: @mauve; }
    button.suggested-action:active   { background-color: @iris_soft; border-color: @iris_soft; }
    button.suggested-action:disabled { background-color: alpha(@iris, 0.4); color: alpha(@bg0, 0.7); border-color: transparent; }

    button.destructive-action          { background-color: transparent; color: @error; border-color: alpha(@error, 0.4); }
    button.destructive-action:hover    { background-color: alpha(@error, 0.1); border-color: alpha(@error, 0.6); }
    button.destructive-action:active   { background-color: alpha(@error, 0.2); }
    button.destructive-action:disabled { color: alpha(@error, 0.5); border-color: alpha(@error, 0.2); }

    /* ── Entry / text input ─────────────────────────────────────────────────── */
    entry,
    spinbutton {
      padding: 6px 10px;
      border: 1px solid @line;
      background-color: @bg0;
      color: @fg0;
      caret-color: @iris;
    }
    entry:focus,
    spinbutton:focus     { border-color: @iris; }
    entry:disabled,
    spinbutton:disabled  { background-color: @bg1; color: @fg3; border-color: @line_soft; }
    entry selection,
    spinbutton selection { background-color: @bg4; color: @fg0; }
    entry.error          { border-color: @error; color: @error; }
    entry.warning        { border-color: @warn; }
    entry image          { color: @fg3; }
    entry image:hover    { color: @fg0; }
    entry placeholder    { color: @fg3; }

    spinbutton button {
      border: none;
      border-radius: 0;
      padding: 0 6px;
      background-color: transparent;
      color: @fg2;
      min-height: 0;
    }
    spinbutton button:hover { color: @fg0; background-color: @bg2; }

    /* ── Text view ──────────────────────────────────────────────────────────── */
    textview              { background-color: @bg0; color: @fg0; }
    textview text         { background-color: @bg0; color: @fg0; }
    textview text selection { background-color: @bg4; color: @fg0; }
    textview border       { background-color: @bg1; }

    /* ── ListBox / FlowBox ──────────────────────────────────────────────────── */
    list, flowbox         { background-color: @bg0; color: @fg0; }
    list > row,
    flowbox > flowboxchild { padding: 6px 12px; border-bottom: 1px solid @line_soft; }
    list > row:last-child,
    flowbox > flowboxchild:last-child { border-bottom: none; }
    list > row:hover,
    flowbox > flowboxchild:hover      { background-color: @bg2; }
    list > row:selected,
    list > row:selected:focus,
    flowbox > flowboxchild:selected,
    flowbox > flowboxchild:selected:focus { background-color: @bg4; color: @fg0; }
    list > row.activatable:hover          { background-color: @bg2; }
    list > row.activatable:selected       { background-color: @bg4; }

    /* ── TreeView ───────────────────────────────────────────────────────────── */
    treeview.view                { background-color: @bg0; color: @fg0; }
    treeview.view:hover          { background-color: @bg2; }
    treeview.view:selected,
    treeview.view:selected:focus { background-color: @bg4; color: @fg0; }
    treeview.view header button {
      background-color: @bg1;
      border-bottom: 1px solid @line;
      color: @fg2;
      padding: 4px 8px;
      border-radius: 0;
      border-left: none;
      border-top: none;
      border-right: 1px solid @line;
    }
    treeview.view header button:hover { color: @fg0; background-color: @bg2; }

    /* ── Scrollbar ──────────────────────────────────────────────────────────── */
    scrollbar            { background-color: @bg1; border: none; }
    scrollbar.vertical   { border-left: 1px solid @line_soft; }
    scrollbar.horizontal { border-top: 1px solid @line_soft; }
    scrollbar slider {
      background-color: @bg5;
      min-width: 6px;
      min-height: 6px;
      margin: 3px;
    }
    scrollbar slider:hover  { background-color: @fg3; }
    scrollbar slider:active { background-color: @iris; }
    scrollbar button        { display: none; }

    /* ── Notebook (tabs) ────────────────────────────────────────────────────── */
    notebook > header              { background-color: @bg1; border-bottom: 1px solid @line; padding: 0; }
    notebook > header > tabs > tab {
      padding: 8px 16px;
      color: @fg2;
      border: none;
      border-bottom: 2px solid transparent;
      background-color: transparent;
      margin-right: 2px;
    }
    notebook > header > tabs > tab:hover   { color: @fg0; background-color: @bg2; }
    notebook > header > tabs > tab:checked { color: @iris; border-bottom-color: @iris; background-color: transparent; }
    notebook > header > tabs > tab button {
      min-width: 14px;
      min-height: 14px;
      padding: 0;
      border: none;
      background-color: transparent;
      color: @fg3;
    }
    notebook > header > tabs > tab button:hover { color: @error; background-color: alpha(@error, 0.1); }
    notebook > stack { background-color: @bg1; }

    /* ── Progress bar — square ──────────────────────────────────────────────── */
    progressbar trough  { background-color: @bg3; min-height: 6px; }
    progressbar progress { background-color: @iris; min-height: 6px; }
    progressbar.osd trough  { background-color: alpha(@bg0, 0.5); }
    progressbar.osd progress { background-color: @iris; }

    /* ── Scale / slider — square ────────────────────────────────────────────── */
    scale trough    { background-color: @bg3; min-height: 4px; min-width: 4px; }
    scale highlight { background-color: @iris; }
    scale slider    { background-color: @iris; min-width: 14px; min-height: 14px; }
    scale slider:hover  { background-color: @mauve; }
    scale slider:active { background-color: @iris_soft; }
    scale marks         { color: @fg3; }

    /* ── Checkbutton / Radiobutton — square ─────────────────────────────────── */
    checkbutton, radiobutton { color: @fg0; }
    checkbutton check,
    radiobutton radio {
      background-color: @bg0;
      border: 1px solid @bg5;
      min-width: 16px;
      min-height: 16px;
    }
    checkbutton check:hover,
    radiobutton radio:hover              { border-color: @iris; }
    checkbutton check:checked,
    radiobutton radio:checked            { background-color: @iris; border-color: @iris; color: @bg0; }
    checkbutton check:checked:hover,
    radiobutton radio:checked:hover      { background-color: @mauve; border-color: @mauve; }
    checkbutton check:indeterminate      { background-color: @iris_soft; border-color: @iris_soft; color: @bg0; }
    checkbutton:disabled check,
    radiobutton:disabled radio           { border-color: @line; background-color: @bg1; }

    /* ── Switch — square ────────────────────────────────────────────────────── */
    switch {
      background-color: @bg3;
      border: 1px solid @line;
      min-width: 36px;
      min-height: 18px;
    }
    switch:checked       { background-color: @iris; border-color: @iris; }
    switch:hover         { border-color: @bg5; }
    switch:checked:hover { background-color: @mauve; border-color: @mauve; }
    switch slider {
      background-color: @fg2;
      margin: 2px;
      min-width: 12px;
      min-height: 12px;
    }
    switch:checked slider { background-color: @bg0; }
    switch:disabled       { opacity: 0.5; }

    /* ── Combobox ───────────────────────────────────────────────────────────── */
    combobox button       { padding: 6px 10px; }
    combobox button arrow { color: @fg2; min-width: 16px; }

    /* ── Menu — square, no shadow ───────────────────────────────────────────── */
    menu, .menu, .context-menu {
      padding: 4px 0;
      background-color: @bg2;
      border: 1px solid @line;
      color: @fg0;
    }
    menu > arrow, .menu > arrow  { background-color: @bg2; color: @fg2; min-height: 16px; min-width: 16px; }
    menu > arrow:hover, .menu > arrow:hover { background-color: @bg3; }
    menuitem                     { padding: 6px 12px; color: @fg0; }
    menuitem:hover               { background-color: @bg4; color: @fg0; }
    menuitem:disabled            { color: @fg3; }
    menuitem accelerator         { color: @fg3; }
    separator.menuitem,
    menuitem separator           { background-color: @line; min-height: 1px; margin: 4px 0; }

    menubar                  { background-color: @bg2; color: @fg1; border-bottom: 1px solid @line; padding: 0; }
    menubar > menuitem       { padding: 6px 12px; }
    menubar > menuitem:hover { background-color: @bg4; color: @fg0; }

    /* ── Popover — square, no shadow ────────────────────────────────────────── */
    popover {
      background-color: @bg3;
      border: 1px solid @line;
      color: @fg0;
      padding: 8px;
    }
    popover > * { color: @fg0; }

    /* ── Tooltip — square ───────────────────────────────────────────────────── */
    tooltip       { background-color: @bg3; color: @fg0; border: 1px solid @line; padding: 4px 8px; }
    tooltip label { color: @fg0; }

    /* ── InfoBar (semantic colours) ─────────────────────────────────────────── */
    infobar          { border-bottom: 1px solid @line; padding: 8px 12px; }
    infobar.info     { background-color: alpha(@info,  0.10); color: @info; }
    infobar.question { background-color: alpha(@iris,  0.10); color: @iris; }
    infobar.warning  { background-color: alpha(@warn,  0.10); color: @warn; }
    infobar.error    { background-color: alpha(@error, 0.10); color: @error; }

    /* ── Statusbar ──────────────────────────────────────────────────────────── */
    statusbar {
      background-color: @bg2;
      color: @fg2;
      font-size: smaller;
      padding: 2px 8px;
      border-top: 1px solid @line;
    }

    /* ── Dialog action area ─────────────────────────────────────────────────── */
    dialog > box > .dialog-action-box { background-color: @bg2; border-top: 1px solid @line; }

    /* ── Frame ──────────────────────────────────────────────────────────────── */
    frame > border { border: 1px solid @line; }

    /* ── Stack switcher ─────────────────────────────────────────────────────── */
    stackswitcher button         { padding: 6px 12px; }
    stackswitcher button:checked { background-color: @bg4; color: @iris; }

    /* ── Expander ───────────────────────────────────────────────────────────── */
    expander title             { color: @fg1; }
    expander title > arrow     { color: @fg3; }
    expander title:hover       { color: @fg0; }
    expander title:checked > arrow { color: @iris; }
  '';

  indexTheme = ''
    [Desktop Entry]
    Type=X-GNOME-Metatheme
    Name=Umbra
    Comment=Dark purple GTK theme
    Encoding=UTF-8

    [X-GNOME-Metatheme]
    GtkTheme=Umbra
    MetacityTheme=Umbra
    IconTheme=Adwaita
    CursorTheme=Adwaita
    ButtonLayout=close,minimize,maximize:
  '';

in
pkgs.runCommand "umbra-gtk-theme"
  {
    gtk3 = pkgs.writeText "umbra-gtk3.css" gtk3Css;
    gtk4 = pkgs.writeText "umbra-gtk4.css" gtk4Css;
    idx  = pkgs.writeText "umbra-index.theme" indexTheme;
  }
  ''
    theme=$out/share/themes/Umbra
    mkdir -p $theme/gtk-3.0 $theme/gtk-4.0
    cp $idx  $theme/index.theme
    cp $gtk3 $theme/gtk-3.0/gtk.css
    ln -s gtk.css $theme/gtk-3.0/gtk-dark.css
    cp $gtk4 $theme/gtk-4.0/gtk.css
  ''
