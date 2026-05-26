{ pkgs, palette }:

let
  p = palette;

  themeContent = ''
    // Umbra — Telegram Desktop Theme (v0.2)
    // Auto-generated from the Umbra palette. Do not edit by hand.
    // Import via Settings → Chat Settings → Choose from file.

    // ── Palette variables ────────────────────────────────────────────────────
    umBg0:     ${p.backgrounds.bg0};
    umBg1:     ${p.backgrounds.bg1};
    umBg2:     ${p.backgrounds.bg2};
    umBg3:     ${p.backgrounds.bg3};
    umBg4:     ${p.backgrounds.bg4};
    umBg5:     ${p.backgrounds.bg5};
    umFg0:     ${p.foregrounds.fg0};
    umFg1:     ${p.foregrounds.fg1};
    umFg2:     ${p.foregrounds.fg2};
    umFg3:     ${p.foregrounds.fg3};
    umIris:    ${p.accents.iris};
    umMauve:   ${p.accents.mauve};
    umMagenta: ${p.accents.magenta};
    umRed:     ${p.ansi.red};
    umGreen:   ${p.ansi.green};
    umYellow:  ${p.ansi.yellow};
    umBlue:    ${p.ansi.blue};
    umCyan:    ${p.ansi.cyan};
    umTransp:  #00000000;
    umRipple:  #ffffff15;

    // ── Window ───────────────────────────────────────────────────────────────
    windowBg:                    umBg1;
    windowFg:                    umFg0;
    windowBgOver:                umBg3;
    windowBgRipple:              umRipple;
    windowFgOver:                umFg0;
    windowSubTextFg:             umFg2;
    windowSubTextFgOver:         umIris;
    windowBoldFg:                umFg0;
    windowBoldFgOver:            umFg0;
    windowBgActive:              umIris;
    windowFgActive:              umBg0;
    windowActiveTextFg:          umIris;
    windowShadowFg:              #000000f0;
    windowShadowFgFallback:      #000000;
    shadowFg:                    umTransp;
    slideFadeOutBg:              umBg1;
    slideFadeOutShadowFg:        umTransp;
    imageBg:                     #000000;
    imageBgTransparent:          #ffffff;

    // ── Buttons ──────────────────────────────────────────────────────────────
    activeButtonBg:              umIris;
    activeButtonBgOver:          umMauve;
    activeButtonBgRipple:        #ffffff30;
    activeButtonFg:              umBg0;
    activeButtonFgOver:          umBg0;
    activeButtonSecondaryFg:     umFg1;
    activeButtonSecondaryFgOver: umFg1;
    activeLineFg:                umIris;
    activeLineFgError:           umRed;
    lightButtonBg:               umBg1;
    lightButtonBgOver:           umBg3;
    lightButtonBgRipple:         umRipple;
    lightButtonFg:               umIris;
    lightButtonFgOver:           umMauve;
    attentionButtonFg:           umRed;
    attentionButtonFgOver:       umRed;
    attentionButtonBgOver:       #b9787325;
    attentionButtonBgRipple:     umRipple;
    outlineButtonBg:             umBg1;
    outlineButtonBgOver:         umBg3;
    outlineButtonOutlineFg:      umIris;
    outlineButtonBgRipple:       umRipple;

    // ── Menu ─────────────────────────────────────────────────────────────────
    menuBg:                      umBg2;
    menuBgOver:                  umBg3;
    menuBgRipple:                umBg4;
    menuIconFg:                  umFg2;
    menuIconFgOver:              umIris;
    menuSubmenuArrowFg:          umFg2;
    menuFgDisabled:              umFg3;
    menuSeparatorFg:             umBg3;

    // ── Scrollbar ────────────────────────────────────────────────────────────
    scrollBarBg:                 umBg5;
    scrollBarBgOver:             umIris;
    scrollBg:                    umBg2;
    scrollBgOver:                umBg2;

    // ── Misc UI ──────────────────────────────────────────────────────────────
    smallCloseIconFg:            umFg2;
    smallCloseIconFgOver:        umRed;
    radialFg:                    umIris;
    radialBg:                    umBg3;
    placeholderFg:               umFg3;
    placeholderFgActive:         umFg2;
    inputBorderFg:               umFg3;
    filterInputBorderFg:         umIris;
    filterInputInactiveBg:       #23142620;
    checkboxFg:                  umFg3;
    sliderBgInactive:            umBg3;
    sliderBgActive:              umIris;
    tooltipBg:                   #301f34e0;
    tooltipFg:                   umFg0;
    tooltipBorderFg:             umTransp;

    // ── Title bar ────────────────────────────────────────────────────────────
    titleBg:                      umBg1;
    titleBgActive:                umBg1;
    titleShadow:                  umTransp;
    titleFg:                      umFg2;
    titleFgActive:                umIris;
    titleButtonBg:                umTransp;
    titleButtonFg:                umBg4;
    titleButtonBgOver:            umTransp;
    titleButtonFgOver:            umFg0;
    titleButtonBgActive:          umTransp;
    titleButtonFgActive:          umFg2;
    titleButtonBgActiveOver:      umBg3;
    titleButtonFgActiveOver:      umFg0;
    titleButtonCloseBg:           umTransp;
    titleButtonCloseFg:           umBg4;
    titleButtonCloseBgOver:       umTransp;
    titleButtonCloseFgOver:       umRed;
    titleButtonCloseBgActive:     umTransp;
    titleButtonCloseFgActive:     umRed;
    titleButtonCloseBgActiveOver: umBg3;
    titleButtonCloseFgActiveOver: umRed;

    // ── Tray ─────────────────────────────────────────────────────────────────
    trayCounterBg:               umRed;
    trayCounterBgMute:           umBg3;
    trayCounterFg:               umFg0;
    trayCounterBgMacInvert:      umBg3;
    trayCounterFgMacInvert:      umFg0;

    // ── Layer / overlay ──────────────────────────────────────────────────────
    layerBg:                     #0c040f99;
    cancelIconFg:                umFg2;
    cancelIconFgOver:            umRed;

    // ── Box dialogs ──────────────────────────────────────────────────────────
    boxBg:                       umBg1;
    boxTextFg:                   umFg0;
    boxTextFgGood:               umGreen;
    boxTextFgError:              umRed;
    boxTitleFg:                  umFg0;
    boxSearchBg:                 umBg1;
    boxSearchCancelIconFg:       umFg2;
    boxSearchCancelIconFgOver:   umRed;
    boxTitleAdditionalFg:        umIris;
    boxTitleCloseFg:             umFg2;
    boxTitleCloseFgOver:         umRed;
    membersAboutLimitFg:         umRed;

    // ── Contacts ─────────────────────────────────────────────────────────────
    contactsBg:                  umBg1;
    contactsBgOver:              umBg3;
    contactsNameFg:              umFg0;
    contactsStatusFg:            umFg2;
    contactsStatusFgOver:        umFg1;
    contactsStatusFgOnline:      umIris;
    photoCropFadeBg:             #0c040f99;
    photoCropPointFg:            umFg2;

    // ── Intro / login ────────────────────────────────────────────────────────
    introBg:                     umBg1;
    introTitleFg:                umFg0;
    introDescriptionFg:          umFg2;
    introErrorFg:                umRed;
    introCoverTopBg:             umBg0;
    introCoverBottomBg:          umBg1;
    introCoverIconsFg:           umFg3;
    introCoverPlaneTrace:        umIris;
    introCoverPlaneInner:        umIris;
    introCoverPlaneOuter:        umMauve;
    introCoverPlaneTop:          umFg0;

    // ── Dialogs (left sidebar) ────────────────────────────────────────────────
    dialogsMenuIconFg:           umFg2;
    dialogsMenuIconFgOver:       umIris;
    dialogsBg:                   umBg1;
    dialogsNameFg:               umFg0;
    dialogsChatIconFg:           umIris;
    dialogsDateFg:               umFg2;
    dialogsTextFg:               umFg2;
    dialogsTextFgService:        umIris;
    dialogsDraftFg:              umRed;
    dialogsVerifiedIconBg:       umIris;
    dialogsVerifiedIconFg:       umBg0;
    dialogsSendingIconFg:        umYellow;
    dialogsSentIconFg:           umGreen;
    dialogsUnreadBg:             umIris;
    dialogsUnreadBgMuted:        umBg4;
    dialogsUnreadFg:             umFg0;
    // hover
    dialogsBgOver:               umBg3;
    dialogsNameFgOver:           umFg0;
    dialogsChatIconFgOver:       umIris;
    dialogsDateFgOver:           umFg2;
    dialogsTextFgOver:           umFg2;
    dialogsTextFgServiceOver:    umIris;
    dialogsDraftFgOver:          umRed;
    dialogsVerifiedIconBgOver:   umIris;
    dialogsVerifiedIconFgOver:   umBg0;
    dialogsSendingIconFgOver:    umYellow;
    dialogsSentIconFgOver:       umGreen;
    dialogsUnreadBgOver:         umIris;
    dialogsUnreadBgMutedOver:    umBg4;
    dialogsUnreadFgOver:         umFg0;
    // active (selected)
    dialogsBgActive:             umBg3;
    dialogsNameFgActive:         umFg0;
    dialogsChatIconFgActive:     umMauve;
    dialogsDateFgActive:         umIris;
    dialogsTextFgActive:         umFg1;
    dialogsTextFgServiceActive:  umIris;
    dialogsDraftFgActive:        umRed;
    dialogsVerifiedIconBgActive: umIris;
    dialogsVerifiedIconFgActive: umBg0;
    dialogsSendingIconFgActive:  umYellow;
    dialogsSentIconFgActive:     umGreen;
    dialogsUnreadBgActive:       umIris;
    dialogsUnreadBgMutedActive:  umBg4;
    dialogsUnreadFgActive:       umFg0;
    dialogsForwardBg:            umBg3;
    dialogsForwardFg:            umIris;

    // ── Search bar ───────────────────────────────────────────────────────────
    searchedBarBg:               umBg1;
    searchedBarBorder:           umTransp;
    searchedBarFg:               umIris;

    // ── Top bar ──────────────────────────────────────────────────────────────
    topBarBg:                    umBg1;

    // ── Emoji / sticker panel ────────────────────────────────────────────────
    emojiPanBg:                  umBg2;
    emojiPanCategories:          umBg2;
    emojiPanHeaderFg:            umFg2;
    emojiPanHeaderBg:            umBg2;
    stickerPanDeleteBg:          #b9787325;
    stickerPanDeleteFg:          umRed;
    stickerPreviewBg:            umTransp;

    // ── Chat history ─────────────────────────────────────────────────────────
    historyTextInFg:             umFg0;
    historyTextOutFg:            umFg0;
    historyCaptionInFg:          umFg0;
    historyCaptionOutFg:         umFg0;
    historyFileNameInFg:         umFg0;
    historyFileNameOutFg:        umFg0;
    historyOutIconFg:            umGreen;
    historyOutIconFgSelected:    umGreen;
    historyIconFgInverted:       umFg0;
    historySendingOutIconFg:     umYellow;
    historySendingInIconFg:      umYellow;
    historySendingInvertedIconFg: umYellow;
    historySystemBg:             umBg3;
    historySystemBgSelected:     umBg4;
    historySystemFg:             umFg1;
    historyUnreadBarBg:          umBg2;
    historyUnreadBarBorder:      umBg3;
    historyUnreadBarFg:          umIris;
    historyForwardChooseBg:      umIris;
    historyForwardChooseFg:      umBg0;
    historyReplyIconFg:          umIris;
    historyToDownShadow:         umTransp;
    historyToDownBg:             #231426cc;

    // ── Peer name / userpic accent colors ────────────────────────────────────
    historyPeer1NameFg:          umRed;
    historyPeer1UserpicBg:       umRed;
    historyPeer2NameFg:          umGreen;
    historyPeer2UserpicBg:       umGreen;
    historyPeer3NameFg:          umYellow;
    historyPeer3UserpicBg:       umYellow;
    historyPeer4NameFg:          umBlue;
    historyPeer4UserpicBg:       umBlue;
    historyPeer5NameFg:          umIris;
    historyPeer5UserpicBg:       umIris;
    historyPeer6NameFg:          umMagenta;
    historyPeer6UserpicBg:       umMagenta;
    historyPeer7NameFg:          umCyan;
    historyPeer7UserpicBg:       umCyan;
    historyPeer8NameFg:          umMauve;
    historyPeer8UserpicBg:       umMauve;
    historyPeerUserpicFg:        umBg0;

    // ── History scrollbar ────────────────────────────────────────────────────
    historyScrollBarBg:          umBg5;
    historyScrollBarBgOver:      umIris;
    historyScrollBg:             umBg2;
    historyScrollBgOver:         umBg2;

    // ── Messages ─────────────────────────────────────────────────────────────
    msgInBg:                     umBg2;
    msgInBgSelected:             umBg3;
    msgOutBg:                    umBg3;
    msgOutBgSelected:            umBg4;
    msgSelectOverlay:            #ffffff10;
    msgStickerOverlay:           #301f3460;
    msgInServiceFg:              umIris;
    msgInServiceFgSelected:      umIris;
    msgOutServiceFg:             umIris;
    msgOutServiceFgSelected:     umIris;
    msgInShadow:                 umTransp;
    msgInShadowSelected:         umTransp;
    msgOutShadow:                umTransp;
    msgOutShadowSelected:        umTransp;
    msgInDateFg:                 #645567cc;
    msgInDateFgSelected:         #0c040f99;
    msgOutDateFg:                #645567cc;
    msgOutDateFgSelected:        #0c040f99;
    msgServiceFg:                #0c040fcc;
    msgServiceBg:                #b07bbccc;
    msgServiceBgSelected:        #c68fc1cc;
    msgInReplyBarColor:          umIris;
    msgInReplyBarSelColor:       umIris;
    msgOutReplyBarColor:         umIris;
    msgOutReplyBarSelColor:      umIris;
    msgImgReplyBarColor:         umIris;
    msgInMonoFg:                 umYellow;
    msgOutMonoFg:                umYellow;
    msgDateImgFg:                umFg0;
    msgDateImgBg:                umBg1;
    msgDateImgBgOver:            umBg2;
    msgDateImgBgSelected:        umBg2;

    // ── File / media thumbnails ──────────────────────────────────────────────
    msgFileThumbLinkInFg:           umIris;
    msgFileThumbLinkInFgSelected:   umFg2;
    msgFileThumbLinkOutFg:          umIris;
    msgFileThumbLinkOutFgSelected:  umFg2;
    msgFileInBg:                    umIris;
    msgFileInBgOver:                umMauve;
    msgFileInBgSelected:            umBg4;
    msgFileOutBg:                   umIris;
    msgFileOutBgOver:               umMauve;
    msgFileOutBgSelected:           umBg4;
    msgFile1Bg:                     umCyan;
    msgFile1BgDark:                 #5d9ea0;
    msgFile1BgOver:                 #91c4c3;
    msgFile1BgSelected:             #b4d9d8;
    msgFile2Bg:                     umGreen;
    msgFile2BgDark:                 #6b9e6c;
    msgFile2BgOver:                 #a4c4a4;
    msgFile2BgSelected:             #c5dbc5;
    msgFile3Bg:                     umRed;
    msgFile3BgDark:                 #9a5e5a;
    msgFile3BgOver:                 #c98e8a;
    msgFile3BgSelected:             #deb4b1;
    msgFile4Bg:                     umYellow;
    msgFile4BgDark:                 #a48a5e;
    msgFile4BgOver:                 #d4ba8e;
    msgFile4BgSelected:             #e4d0ae;

    // ── Waveform ─────────────────────────────────────────────────────────────
    msgWaveformInActive:             umIris;
    msgWaveformInActiveSelected:     umIris;
    msgWaveformInInactive:           umBg3;
    msgWaveformInInactiveSelected:   umBg3;
    msgWaveformOutActive:            umIris;
    msgWaveformOutActiveSelected:    umIris;
    msgWaveformOutInactive:          umBg3;
    msgWaveformOutInactiveSelected:  umBg3;

    // ── Bot keyboard ─────────────────────────────────────────────────────────
    msgBotKbOverBgAdd:           #ffffff10;
    msgBotKbIconFg:              umBg0;
    msgBotKbRippleBg:            #b07bbc40;

    // ── Media ────────────────────────────────────────────────────────────────
    mediaInFg:                   umIris;
    mediaInFgSelected:           umIris;
    mediaOutFg:                  umIris;
    mediaOutFgSelected:          umIris;
    youtubePlayIconBg:           umRed;
    youtubePlayIconFg:           umFg0;
    videoPlayIconBg:             umBg3;
    videoPlayIconFg:             umFg0;
    toastBg:                     umBg3;
    toastFg:                     umFg0;
    reportSpamBg:                umBg2;
    reportSpamFg:                umFg0;

    // ── Compose area ─────────────────────────────────────────────────────────
    historyComposeAreaBg:        umBg1;
    historyComposeAreaFg:        umFg0;
    historyComposeAreaFgService: umFg1;
    historyComposeIconFg:        umFg2;
    historyComposeIconFgOver:    umIris;
    historySendIconFg:           umFg2;
    historySendIconFgOver:       umIris;
    historyPinnedBg:             umBg1;
    historyReplyBg:              umBg1;
    historyReplyCancelFg:        umFg2;
    historyReplyCancelFgOver:    umRed;
    historyComposeButtonBg:      umBg1;
    historyComposeButtonBgOver:  umBg3;
    historyComposeButtonBgRipple: umBg4;

    // ── Overview ─────────────────────────────────────────────────────────────
    overviewCheckBg:             umTransp;
    overviewCheckFg:             umBg0;
    overviewCheckFgActive:       umBg0;
    overviewPhotoSelectOverlay:  #b07bbc40;

    // ── Profile ──────────────────────────────────────────────────────────────
    profileStatusFgOver:         umIris;
    profileVerifiedCheckBg:      umIris;

    // ── Notifications ────────────────────────────────────────────────────────
    notificationsBoxMonitorFg:   umFg0;
    notificationsBoxScreenBg:    umBg3;
    notificationSampleUserpicFg: umIris;
    notificationSampleCloseFg:   umRed;
    notificationSampleTextFg:    umFg0;
    notificationSampleNameFg:    umIris;
    notificationBg:              umBg2;

    // ── Main menu ────────────────────────────────────────────────────────────
    mainMenuBg:                  umBg2;
    mainMenuCoverBg:             umBg3;
    mainMenuCoverFg:             umFg0;

    // ── Media player ─────────────────────────────────────────────────────────
    mediaPlayerBg:               umBg1;
    mediaPlayerActiveFg:         umIris;
    mediaPlayerInactiveFg:       umBg4;
    mediaPlayerDisabledFg:       umBg3;

    // ── Media view (full-screen) ──────────────────────────────────────────────
    mediaviewFileBg:             umBg3;
    mediaviewFileNameFg:         umFg0;
    mediaviewFileSizeFg:         umFg2;
    mediaviewFileRedCornerFg:    umRed;
    mediaviewFileYellowCornerFg: umYellow;
    mediaviewFileGreenCornerFg:  umGreen;
    mediaviewFileBlueCornerFg:   umBlue;
    mediaviewFileExtFg:          umBg0;
    mediaviewMenuBg:             umBg2;
    mediaviewMenuBgOver:         umBg3;
    mediaviewMenuBgRipple:       umBg4;
    mediaviewMenuFg:             umFg0;
    mediaviewBg:                 #0c040fe0;
    mediaviewVideoBg:            #000000;
    mediaviewControlBg:          umBg1;
    mediaviewControlFg:          umFg2;
    mediaviewCaptionBg:          umBg1;
    mediaviewCaptionFg:          umFg0;
    mediaviewTextLinkFg:         umIris;
    mediaviewSaveMsgBg:          umBg3;
    mediaviewSaveMsgFg:          umFg0;
    mediaviewPlaybackActive:     umIris;
    mediaviewPlaybackInactive:   umBg3;
    mediaviewPlaybackActiveOver: umMauve;
    mediaviewPlaybackInactiveOver: umBg4;
    mediaviewPlaybackProgressFg: umFg0;
    mediaviewPlaybackIconFg:     umIris;
    mediaviewPlaybackIconFgOver: umMauve;
    mediaviewPipControlsFg:      umIris;
    mediaviewPipControlsFgOver:  umMauve;
    mediaviewPipFade:            umBg1;
    mediaviewPipPlaybackActive:  umIris;
    mediaviewPipPlaybackInactive: umBg3;
    mediaviewTransparentBg:      #000000;
    mediaviewTransparentFg:      #666666;

    // ── Sidebar filters ──────────────────────────────────────────────────────
    sideBarBg:                   umBg0;
    sideBarBgActive:             umBg2;
    sideBarBgRipple:             #301f3460;
    sideBarTextFg:               umFg1;
    sideBarTextFgActive:         umFg0;
    sideBarIconFg:               umFg2;
    sideBarIconFgActive:         umIris;
    sideBarBadgeBg:              umIris;
    sideBarBadgeBgMuted:         umBg4;
    sideBarBadgeFg:              umFg0;
  '';

in pkgs.writeText "umbra.tdesktop-theme" themeContent
