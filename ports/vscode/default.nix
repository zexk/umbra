{ pkgs, palette }:

let
  p  = palette;
  bg = p.backgrounds;
  fg = p.foregrounds;
  ac = p.accents;
  bo = p.borders;
  sy = p.syntax;
  an = p.ansi;
  se = p.semantic;

  pkg = {
    name        = "umbra";
    displayName = "Umbra";
    description = "Umbra dark theme — auto-generated from the Umbra palette.";
    version     = "1.0.0";
    engines.vscode = "^1.70.0";
    categories  = [ "Themes" ];
    contributes.themes = [{
      label    = "Umbra";
      uiTheme  = "vs-dark";
      path     = "./themes/umbra-color-theme.json";
    }];
  };

  theme = {
    name   = "Umbra";
    type   = "dark";
    semanticHighlighting = true;

    # ── Semantic token colors ────────────────────────────────────────────────
    semanticTokenColors = {
      keyword          = sy.keyword;
      "keyword.async"  = sy.keyword;
      function         = sy.function;
      method           = sy.function;
      class            = sy.type;
      "class.readonly" = sy.type;
      type             = sy.type;
      interface        = sy.type;
      enum             = sy.type;
      enumMember       = { foreground = sy.number; };
      variable         = fg.fg0;
      parameter        = fg.fg1;
      property         = sy.property;
      "property.readonly" = { foreground = sy.property; };
      comment          = { foreground = sy.comment; fontStyle = "italic"; };
      string           = sy.string;
      number           = sy.number;
      operator         = sy.operator;
      decorator        = ac.magenta;
      macro            = sy.keyword;
      namespace        = sy.type;
      typeParameter    = sy.type;
    };

    # ── Token colors (TextMate grammar) ─────────────────────────────────────
    tokenColors = [
      {
        name  = "Comment";
        scope = [ "comment" "punctuation.definition.comment" ];
        settings = { foreground = sy.comment; fontStyle = "italic"; };
      }
      {
        name  = "String";
        scope = [ "string" "string.quoted" "string.template" ];
        settings.foreground = sy.string;
      }
      {
        name  = "String escape / regex";
        scope = [ "constant.character.escape" "string.regexp" ];
        settings.foreground = ac.magenta;
      }
      {
        name  = "Number / Boolean / Null";
        scope = [ "constant.numeric" "constant.language" "constant.other" ];
        settings.foreground = sy.number;
      }
      {
        name  = "Keyword";
        scope = [
          "keyword" "keyword.control" "keyword.other"
          "storage.type" "storage.modifier"
        ];
        settings.foreground = sy.keyword;
      }
      {
        name  = "Operator";
        scope = [ "keyword.operator" "punctuation.accessor" ];
        settings.foreground = sy.operator;
      }
      {
        name  = "Function / method name";
        scope = [
          "entity.name.function"
          "meta.function-call entity.name.function"
          "support.function"
        ];
        settings.foreground = sy.function;
      }
      {
        name  = "Type / class / interface";
        scope = [
          "entity.name.type" "entity.name.class"
          "entity.other.inherited-class"
          "support.class" "support.type"
        ];
        settings.foreground = sy.type;
      }
      {
        name  = "Variable";
        scope = [ "variable" "variable.other.readwrite" ];
        settings.foreground = fg.fg0;
      }
      {
        name  = "Variable — parameter";
        scope = [ "variable.parameter" ];
        settings.foreground = fg.fg1;
      }
      {
        name  = "Property";
        scope = [
          "variable.other.property"
          "variable.other.object.property"
          "support.type.property-name"
          "meta.object-literal.key"
        ];
        settings.foreground = sy.property;
      }
      {
        name  = "Decorator / annotation";
        scope = [ "meta.decorator" "entity.name.function.decorator" "punctuation.decorator" ];
        settings.foreground = ac.magenta;
      }
      {
        name  = "Namespace / module";
        scope = [ "entity.name.namespace" "entity.name.module" "support.module" ];
        settings.foreground = sy.type;
      }
      {
        name  = "Enum member / constant";
        scope = [ "variable.other.enummember" "constant.other.enum" ];
        settings.foreground = sy.number;
      }
      {
        name  = "Tag name";
        scope = [ "entity.name.tag" "meta.tag" ];
        settings.foreground = sy.keyword;
      }
      {
        name  = "Tag attribute";
        scope = [ "entity.other.attribute-name" ];
        settings.foreground = sy.property;
      }
      {
        name  = "Markup heading";
        scope = [ "markup.heading" "entity.name.section" ];
        settings = { foreground = sy.function; fontStyle = "bold"; };
      }
      {
        name  = "Markup bold";
        scope = [ "markup.bold" ];
        settings = { foreground = fg.fg0; fontStyle = "bold"; };
      }
      {
        name  = "Markup italic";
        scope = [ "markup.italic" ];
        settings = { foreground = fg.fg0; fontStyle = "italic"; };
      }
      {
        name  = "Markup inline code";
        scope = [ "markup.inline.raw" "markup.fenced_code.block" ];
        settings.foreground = sy.string;
      }
      {
        name  = "Markup link";
        scope = [ "markup.underline.link" ];
        settings.foreground = ac.iris;
      }
      {
        name  = "CSS property";
        scope = [ "support.type.property-name.css" "entity.other.attribute-name.class.css" ];
        settings.foreground = sy.property;
      }
      {
        name  = "CSS value / unit";
        scope = [ "support.constant.property-value.css" "constant.numeric.css" "keyword.other.unit.css" ];
        settings.foreground = sy.number;
      }
      {
        name  = "Punctuation";
        scope = [ "punctuation" "meta.brace" ];
        settings.foreground = fg.fg2;
      }
      {
        name  = "Invalid / deprecated";
        scope = [ "invalid" "invalid.deprecated" ];
        settings = { foreground = se.error; fontStyle = "underline"; };
      }
    ];

    # ── Workbench UI colors ──────────────────────────────────────────────────
    colors = {
      # Global
      "focusBorder"                        = ac.iris;
      "foreground"                         = fg.fg0;
      "disabledForeground"                 = fg.fg3;
      "selection.background"               = "${bg.bg4}80";
      "errorForeground"                    = se.error;
      "descriptionForeground"              = fg.fg2;
      "icon.foreground"                    = fg.fg2;

      # Text
      "textLink.foreground"                = ac.iris;
      "textLink.activeForeground"          = ac.mauve;
      "textCodeBlock.background"           = bg.bg2;
      "textBlockQuote.background"          = bg.bg2;
      "textBlockQuote.border"              = ac.iris;
      "textPreformat.foreground"           = sy.string;
      "textSeparator.foreground"           = bo.line;

      # Window / title bar
      "titleBar.activeBackground"          = bg.bg1;
      "titleBar.activeForeground"          = fg.fg0;
      "titleBar.inactiveBackground"        = bg.bg0;
      "titleBar.inactiveForeground"        = fg.fg2;
      "titleBar.border"                    = bo.line;

      # Menu
      "menu.background"                    = bg.bg2;
      "menu.foreground"                    = fg.fg0;
      "menu.selectionBackground"           = bg.bg4;
      "menu.selectionForeground"           = fg.fg0;
      "menu.separatorBackground"           = bo.line;
      "menu.border"                        = bo.line;
      "menubar.selectionBackground"        = bg.bg3;
      "menubar.selectionForeground"        = fg.fg0;

      # Activity bar
      "activityBar.background"             = bg.bg0;
      "activityBar.foreground"             = fg.fg0;
      "activityBar.inactiveForeground"     = fg.fg3;
      "activityBar.border"                 = bo.line;
      "activityBarBadge.background"        = ac.iris;
      "activityBarBadge.foreground"        = bg.bg0;
      "activityBar.activeBorder"           = ac.iris;
      "activityBar.activeBackground"       = "${bg.bg2}60";

      # Side bar
      "sideBar.background"                 = bg.bg0;
      "sideBar.foreground"                 = fg.fg1;
      "sideBar.border"                     = bo.line;
      "sideBarTitle.foreground"            = fg.fg2;
      "sideBarSectionHeader.background"    = bg.bg1;
      "sideBarSectionHeader.foreground"    = fg.fg1;
      "sideBarSectionHeader.border"        = bo.line;

      # Editor groups / tabs
      "editorGroupHeader.tabsBackground"   = bg.bg0;
      "editorGroupHeader.tabsBorder"       = bo.line;
      "editorGroup.border"                 = bo.line;
      "tab.activeBackground"               = bg.bg2;
      "tab.activeForeground"               = fg.fg0;
      "tab.activeBorder"                   = "${bg.bg2}00";
      "tab.activeBorderTop"                = ac.iris;
      "tab.inactiveBackground"             = bg.bg0;
      "tab.inactiveForeground"             = fg.fg3;
      "tab.border"                         = bo.line;
      "tab.hoverBackground"                = bg.bg1;
      "tab.unfocusedActiveBackground"      = bg.bg1;
      "tab.unfocusedActiveForeground"      = fg.fg2;
      "tab.unfocusedInactiveForeground"    = fg.fg3;

      # Editor
      "editor.background"                  = bg.bg1;
      "editor.foreground"                  = fg.fg0;
      "editorCursor.foreground"            = ac.iris;
      "editorCursor.background"            = bg.bg0;
      "editor.lineHighlightBackground"     = "${bg.bg2}80";
      "editor.lineHighlightBorder"         = "${bg.bg2}00";
      "editor.selectionBackground"         = "${bg.bg4}80";
      "editor.inactiveSelectionBackground" = "${bg.bg3}60";
      "editor.wordHighlightBackground"     = "${bg.bg3}80";
      "editor.wordHighlightStrongBackground" = "${bg.bg4}80";
      "editor.findMatchBackground"         = "${ac.iris}40";
      "editor.findMatchHighlightBackground" = "${ac.iris}25";
      "editor.findRangeHighlightBackground" = "${bg.bg3}40";
      "editor.hoverHighlightBackground"    = "${bg.bg3}60";
      "editor.rangeHighlightBackground"    = "${bg.bg2}40";
      "editorLineNumber.foreground"        = fg.fg3;
      "editorLineNumber.activeForeground"  = fg.fg1;
      "editorIndentGuide.background1"      = bo.line;
      "editorIndentGuide.activeBackground1" = bg.bg5;
      "editorWhitespace.foreground"        = "${fg.fg3}50";
      "editorRuler.foreground"             = bo.line;
      "editor.bracketMatchBackground"      = "${bg.bg4}60";
      "editor.bracketMatchBorder"          = ac.iris;
      "editorBracketHighlight.foreground1" = ac.iris;
      "editorBracketHighlight.foreground2" = ac.mauve;
      "editorBracketHighlight.foreground3" = ac.magenta;
      "editorBracketHighlight.foreground4" = an.cyan;
      "editorBracketHighlight.unexpectedBracket.foreground" = se.error;
      "editorOverviewRuler.border"         = bo.line;
      "editorOverviewRuler.findMatchForeground" = ac.iris;
      "editorOverviewRuler.errorForeground"     = se.error;
      "editorOverviewRuler.warningForeground"   = se.warn;
      "editorOverviewRuler.infoForeground"      = se.info;
      "editorGutter.background"            = bg.bg1;
      "editorGutter.addedBackground"       = se.success;
      "editorGutter.modifiedBackground"    = se.info;
      "editorGutter.deletedBackground"     = se.error;

      # Minimap
      "minimap.background"                 = bg.bg0;
      "minimap.selectionHighlight"         = "${bg.bg4}80";
      "minimap.findMatchHighlight"         = "${ac.iris}60";
      "minimapSlider.background"           = "${bg.bg4}40";
      "minimapSlider.hoverBackground"      = "${bg.bg4}60";
      "minimapSlider.activeBackground"     = "${bg.bg4}80";

      # Scrollbar
      "scrollbar.shadow"                   = "${bg.bg0}00";
      "scrollbarSlider.background"         = "${bg.bg5}40";
      "scrollbarSlider.hoverBackground"    = "${bg.bg5}70";
      "scrollbarSlider.activeBackground"   = "${ac.iris}60";

      # Panel (terminal, output, problems)
      "panel.background"                   = bg.bg0;
      "panel.border"                       = bo.line;
      "panelTitle.activeForeground"        = fg.fg0;
      "panelTitle.activeBorder"            = ac.iris;
      "panelTitle.inactiveForeground"      = fg.fg2;
      "panelInput.border"                  = bo.line;

      # Terminal
      "terminal.background"                = bg.bg0;
      "terminal.foreground"                = fg.fg0;
      "terminalCursor.foreground"          = ac.iris;
      "terminalCursor.background"          = bg.bg0;
      "terminal.selectionBackground"       = "${bg.bg4}80";
      "terminal.ansiBlack"                 = an.black;
      "terminal.ansiRed"                   = an.red;
      "terminal.ansiGreen"                 = an.green;
      "terminal.ansiYellow"                = an.yellow;
      "terminal.ansiBlue"                  = an.blue;
      "terminal.ansiMagenta"               = an.magenta;
      "terminal.ansiCyan"                  = an.cyan;
      "terminal.ansiWhite"                 = an.white;
      "terminal.ansiBrightBlack"           = an.bright.black;
      "terminal.ansiBrightRed"             = an.bright.red;
      "terminal.ansiBrightGreen"           = an.bright.green;
      "terminal.ansiBrightYellow"          = an.bright.yellow;
      "terminal.ansiBrightBlue"            = an.bright.blue;
      "terminal.ansiBrightMagenta"         = an.bright.magenta;
      "terminal.ansiBrightCyan"            = an.bright.cyan;
      "terminal.ansiBrightWhite"           = an.bright.white;

      # Status bar
      "statusBar.background"               = bg.bg0;
      "statusBar.foreground"               = fg.fg1;
      "statusBar.border"                   = bo.line;
      "statusBar.debuggingBackground"      = ac.iris;
      "statusBar.debuggingForeground"      = bg.bg0;
      "statusBar.noFolderBackground"       = bg.bg2;
      "statusBar.noFolderForeground"       = fg.fg1;
      "statusBarItem.hoverBackground"      = "${bg.bg3}80";
      "statusBarItem.activeBackground"     = "${bg.bg4}80";
      "statusBarItem.remoteBackground"     = ac.iris;
      "statusBarItem.remoteForeground"     = bg.bg0;

      # Input / widgets
      "input.background"                   = bg.bg2;
      "input.foreground"                   = fg.fg0;
      "input.border"                       = bo.line;
      "input.placeholderForeground"        = fg.fg3;
      "inputOption.activeBackground"       = "${ac.iris}30";
      "inputOption.activeBorder"           = ac.iris;
      "inputOption.activeForeground"       = fg.fg0;
      "inputValidation.errorBackground"    = bg.bg1;
      "inputValidation.errorBorder"        = se.error;
      "inputValidation.warningBackground"  = bg.bg1;
      "inputValidation.warningBorder"      = se.warn;
      "inputValidation.infoBackground"     = bg.bg1;
      "inputValidation.infoBorder"         = se.info;

      # Dropdown
      "dropdown.background"                = bg.bg2;
      "dropdown.foreground"                = fg.fg0;
      "dropdown.border"                    = bo.line;
      "dropdown.listBackground"            = bg.bg2;

      # Button
      "button.background"                  = ac.iris;
      "button.foreground"                  = bg.bg0;
      "button.hoverBackground"             = ac.mauve;
      "button.secondaryBackground"         = bg.bg3;
      "button.secondaryForeground"         = fg.fg0;
      "button.secondaryHoverBackground"    = bg.bg4;
      "button.border"                      = "${bg.bg0}00";

      # Checkbox
      "checkbox.background"                = bg.bg2;
      "checkbox.foreground"                = fg.fg0;
      "checkbox.border"                    = bg.bg5;

      # List / tree
      "list.activeSelectionBackground"     = bg.bg4;
      "list.activeSelectionForeground"     = fg.fg0;
      "list.inactiveSelectionBackground"   = bg.bg3;
      "list.inactiveSelectionForeground"   = fg.fg1;
      "list.hoverBackground"               = bg.bg2;
      "list.hoverForeground"               = fg.fg0;
      "list.focusBackground"               = bg.bg4;
      "list.focusForeground"               = fg.fg0;
      "list.focusOutline"                  = "${ac.iris}00";
      "list.highlightForeground"           = ac.iris;
      "list.dropBackground"                = "${bg.bg4}80";
      "list.errorForeground"               = se.error;
      "list.warningForeground"             = se.warn;
      "tree.indentGuidesStroke"            = bo.line;

      # Quick input / command palette
      "quickInput.background"              = bg.bg1;
      "quickInput.foreground"              = fg.fg0;
      "quickInputTitle.background"         = bg.bg2;
      "quickInputList.focusBackground"     = bg.bg4;
      "quickInputList.focusForeground"     = fg.fg0;

      # Badge
      "badge.background"                   = ac.iris;
      "badge.foreground"                   = bg.bg0;

      # Progress bar
      "progressBar.background"             = ac.iris;

      # Notifications
      "notificationCenter.border"          = bo.line;
      "notificationCenterHeader.background" = bg.bg2;
      "notificationCenterHeader.foreground" = fg.fg1;
      "notifications.background"           = bg.bg2;
      "notifications.foreground"           = fg.fg0;
      "notifications.border"               = bo.line;
      "notificationLink.foreground"        = ac.iris;
      "notificationsErrorIcon.foreground"  = se.error;
      "notificationsWarningIcon.foreground" = se.warn;
      "notificationsInfoIcon.foreground"   = se.info;

      # Extensions / settings
      "extensionButton.prominentBackground" = ac.iris;
      "extensionButton.prominentForeground" = bg.bg0;
      "extensionButton.prominentHoverBackground" = ac.mauve;
      "extensionBadge.remoteBackground"    = ac.iris;
      "extensionBadge.remoteForeground"    = bg.bg0;

      # Picker / suggest widget
      "editorSuggestWidget.background"     = bg.bg2;
      "editorSuggestWidget.border"         = bo.line;
      "editorSuggestWidget.foreground"     = fg.fg0;
      "editorSuggestWidget.highlightForeground" = ac.iris;
      "editorSuggestWidget.selectedBackground"  = bg.bg4;
      "editorSuggestWidget.selectedForeground"  = fg.fg0;
      "editorHoverWidget.background"       = bg.bg2;
      "editorHoverWidget.border"           = bo.line;
      "editorHoverWidget.foreground"       = fg.fg0;

      # Widget (peek, reference, info)
      "editorWidget.background"            = bg.bg1;
      "editorWidget.border"                = bo.line;
      "editorWidget.foreground"            = fg.fg0;
      "editorWidget.resizeBorder"          = ac.iris;

      # Diff editor
      "diffEditor.insertedTextBackground"  = "${se.success}18";
      "diffEditor.removedTextBackground"   = "${se.error}18";
      "diffEditor.insertedLineBackground"  = "${se.success}10";
      "diffEditor.removedLineBackground"   = "${se.error}10";
      "diffEditor.diagonalFill"            = "${bg.bg3}60";

      # Breadcrumb
      "breadcrumb.background"              = bg.bg1;
      "breadcrumb.foreground"              = fg.fg2;
      "breadcrumb.focusForeground"         = fg.fg0;
      "breadcrumb.activeSelectionForeground" = ac.iris;
      "breadcrumbPicker.background"        = bg.bg2;

      # Git decorations
      "gitDecoration.addedResourceForeground"    = se.success;
      "gitDecoration.modifiedResourceForeground" = se.info;
      "gitDecoration.deletedResourceForeground"  = se.error;
      "gitDecoration.untrackedResourceForeground" = se.success;
      "gitDecoration.ignoredResourceForeground"  = fg.fg3;
      "gitDecoration.conflictingResourceForeground" = se.warn;
      "gitDecoration.submoduleResourceForeground" = fg.fg2;

      # Peek view
      "peekView.border"                    = ac.iris;
      "peekViewEditor.background"          = bg.bg0;
      "peekViewEditorGutter.background"    = bg.bg0;
      "peekViewEditor.matchHighlightBackground" = "${ac.iris}30";
      "peekViewResult.background"          = bg.bg1;
      "peekViewResult.fileForeground"      = fg.fg0;
      "peekViewResult.lineForeground"      = fg.fg2;
      "peekViewResult.matchHighlightBackground" = "${ac.iris}30";
      "peekViewResult.selectionBackground" = bg.bg3;
      "peekViewResult.selectionForeground" = fg.fg0;
      "peekViewTitle.background"           = bg.bg2;
      "peekViewTitleDescription.foreground" = fg.fg2;
      "peekViewTitleLabel.foreground"      = fg.fg0;

      # Debug
      "debugToolBar.background"            = bg.bg2;
      "debugToolBar.border"                = bo.line;
      "editor.stackFrameHighlightBackground" = "${an.yellow}20";
      "editor.focusedStackFrameHighlightBackground" = "${se.success}20";

      # Merge conflicts
      "merge.currentHeaderBackground"      = "${se.info}30";
      "merge.currentContentBackground"     = "${se.info}15";
      "merge.incomingHeaderBackground"     = "${ac.iris}30";
      "merge.incomingContentBackground"    = "${ac.iris}15";
      "merge.border"                       = bo.line;

      # Settings
      "settings.headerForeground"          = fg.fg0;
      "settings.modifiedItemIndicator"     = ac.iris;
      "settings.dropdownBackground"        = bg.bg2;
      "settings.dropdownForeground"        = fg.fg0;
      "settings.dropdownBorder"            = bo.line;
      "settings.checkboxBackground"        = bg.bg2;
      "settings.checkboxForeground"        = fg.fg0;
      "settings.checkboxBorder"            = bg.bg5;
      "settings.textInputBackground"       = bg.bg2;
      "settings.textInputForeground"       = fg.fg0;
      "settings.textInputBorder"           = bo.line;
      "settings.numberInputBackground"     = bg.bg2;
      "settings.numberInputForeground"     = fg.fg0;
      "settings.numberInputBorder"         = bo.line;

      # Keybinding label
      "keybindingLabel.background"         = bg.bg3;
      "keybindingLabel.foreground"         = fg.fg0;
      "keybindingLabel.border"             = bg.bg5;
      "keybindingLabel.bottomBorder"       = bg.bg5;

      # Welcome / walkthrough
      "welcomePage.background"             = bg.bg0;
      "welcomePage.tileBackground"         = bg.bg1;
      "welcomePage.tileBorder"             = bo.line;
      "walkThrough.embeddedEditorBackground" = bg.bg0;
    };
  };

  json = pkgs.formats.json { };

in pkgs.runCommand "umbra-vscode-theme" { } ''
  mkdir -p $out/themes
  cp ${json.generate "package.json"              pkg}   $out/package.json
  cp ${json.generate "umbra-color-theme.json"    theme} $out/themes/umbra-color-theme.json
''
