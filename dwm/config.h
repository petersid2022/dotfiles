// clang-format off

#include <X11/XF86keysym.h>

// #define FONT "Noto Sans"

static const char *upvol[] = { "/home/petrside/.config/dwm_scripts/volume/vol_inc.sh", NULL};
static const char *downvol[] = { "/home/petrside/.config/dwm_scripts/volume/vol_dec.sh", NULL};
static const char *mutevol[] = { "/home/petrside/.config/dwm_scripts/volume/vol_toggle.sh", NULL};

static const char *brighter[] = {"brightnessctl", "set", "10%+", NULL};
static const char *dimmer[] = {"brightnessctl", "set", "10%-", NULL};
static const char *medplaypausecmd[] = {"playerctl", "play-pause", NULL};
static const char *mednextcmd[] = {"playerctl", "next", NULL};
static const char *medprevcmd[] = {"playerctl", "previous", NULL};

static int tagindicatortype = INDICATOR_TOP_BAR_SLIM;
static int tiledindicatortype = INDICATOR_NONE;
static int floatindicatortype = INDICATOR_TOP_LEFT_SQUARE;

// TAB_PATCH
static const unsigned int borderpx = 3;
static const unsigned int snap = 32;
static const int showbar = 1;
static const int topbar = 1;
enum showtab_modes {
  showtab_never,
  showtab_auto,
  showtab_nmodes,
  showtab_always
};
static const int showtab = showtab_auto;
static const int toptab = False;
static const int statusmon = 'A';

static const unsigned int systrayspacing = 20;
static const int showsystray = 1;
static const int quit_empty_window_count = 0;

// static const char *fonts[] = {FONT ":size=15"};
static const char *fonts[] = {"monospace:size=13"};

static char c000000[] = "#000000";
static char normfgcolor[] = "#ffffff";
static char normbgcolor[] = "#000000";
static char normbordercolor[] = "#444444";
static char normfloatcolor[] = "#db8fd9";
static char selfgcolor[] = "#ffffff";
static char selbgcolor[] = "#005577";
static char selbordercolor[] = "#005577";
static char selfloatcolor[] = "#005577";
static char titlenormfgcolor[] = "#ffffff";
static char titlenormbgcolor[] = "#000000";
static char titlenormbordercolor[] = "#444444";
static char titlenormfloatcolor[] = "#db8fd9";
static char titleselfgcolor[] = "#ffffff";
static char titleselbgcolor[] = "#005577";
static char titleselbordercolor[] = "#005577";
static char titleselfloatcolor[] = "#005577";
static char tagsnormfgcolor[] = "#ffffff";
static char tagsnormbgcolor[] = "#000000";
static char tagsnormbordercolor[] = "#444444";
static char tagsnormfloatcolor[] = "#db8fd9";
static char tagsselfgcolor[] = "#ffffff";
static char tagsselbgcolor[] = "#005577";
static char tagsselbordercolor[] = "#005577";
static char tagsselfloatcolor[] = "#005577";
static char hidnormfgcolor[] = "#ffffff";
static char hidselfgcolor[] = "#ffffff";
static char hidnormbgcolor[] = "#000000";
static char hidselbgcolor[] = "#000000";
static char urgfgcolor[] = "#ffffff";
static char urgbgcolor[] = "#000000";
static char urgbordercolor[] = "#ff0000";
static char urgfloatcolor[] = "#db8fd9";

static char *colors[][ColCount] = {
    [SchemeNorm] = {normfgcolor, normbgcolor, normbordercolor, normfloatcolor},
    [SchemeSel] = {selfgcolor, selbgcolor, selbordercolor, selfloatcolor},
    [SchemeTitleNorm] = {titlenormfgcolor, titlenormbgcolor, titlenormbordercolor, titlenormfloatcolor},
    [SchemeTitleSel] = {titleselfgcolor, titleselbgcolor, titleselbordercolor, titleselfloatcolor},
    [SchemeTagsNorm] = {tagsnormfgcolor, tagsnormbgcolor, tagsnormbordercolor, tagsnormfloatcolor},
    [SchemeTagsSel] = {tagsselfgcolor, tagsselbgcolor, tagsselbordercolor, tagsselfloatcolor},
    [SchemeHidNorm] = {hidnormfgcolor, hidnormbgcolor, c000000, c000000},
    [SchemeHidSel] = {hidselfgcolor, hidselbgcolor, c000000, c000000},
    [SchemeUrg] = {urgfgcolor, urgbgcolor, urgbordercolor, urgfloatcolor}
};

static char *tagicons[][NUMTAGS] = {
    [DEFAULT_TAGS] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"},
    [ALTERNATIVE_TAGS] = {"A", "B", "C", "D", "E", "F", "G", "H", "I"},
    [ALT_TAGS_DECORATION] = {"<1>", "<2>", "<3>", "<4>", "<5>", "<6>", "<7>", "<8>", "<9>"},
};

static const Rule rules[] = {
    RULE(.wintype = WTYPE "DIALOG", .isfloating = 1)
    RULE(.wintype = WTYPE "UTILITY", .isfloating = 1)
    RULE(.wintype = WTYPE "TOOLBAR", .isfloating = 1)
    RULE(.wintype = WTYPE "SPLASH", .isfloating = 1)
};

static const BarRule barrules[] = {
    {-1, 0, BAR_ALIGN_LEFT, width_tags, draw_tags, click_tags, hover_tags, "tags"},
    {0, 0, BAR_ALIGN_RIGHT, width_systray, draw_systray, click_systray, NULL, "systray"},
    {-1, 0, BAR_ALIGN_LEFT, width_ltsymbol, draw_ltsymbol, click_ltsymbol, NULL, "layout"},
    {statusmon, 0, BAR_ALIGN_RIGHT, width_status, draw_status, click_status, NULL, "status"},
    {-1, 0, BAR_ALIGN_NONE, width_wintitle, draw_wintitle, click_wintitle, NULL, "wintitle"},
};

static const float mfact = 0.55;
static const int nmaster = 1;
static const int resizehints = 0;
static const int lockfullscreen = 1;

static const Layout layouts[] = {
    {"[]=", tile},
    {"><>", NULL},
    {"[M]", monocle},
    {"|M|", centeredmaster},
    {":::", gaplessgrid},
};

#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG) {MODKEY, KEY, view, {.ui = 1 << TAG}}, {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}}, {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}}, {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},
#define SHCMD(cmd) {.v = (const char *[]) { "/usr/bin/bash", "-c", cmd, NULL }}

static char dmenumon[2] = "0";
static const char *dmenucmd[] = {"/home/petrside/.config/dwm_scripts/dmenu.sh", NULL};
static const char *termcmd[] = {"/usr/bin/alacritty", NULL};

static const Key keys[] = {
    {0, XF86XK_AudioPlay, spawn, {.v = medplaypausecmd}},
    {0, XF86XK_AudioNext, spawn, {.v = mednextcmd}},
    {0, XF86XK_AudioPrev, spawn, {.v = medprevcmd}},
    {0, XK_Print, spawn, SHCMD("/home/petrside/.config/dwm_scripts/screenshot.sh")},
    {ShiftMask, XK_Print, spawn, SHCMD("/home/petrside/.config/dwm_scripts/screenshotsel.sh")},
    {MODKEY, XK_t, spawn, SHCMD("pcmanfm /home/petrside")},
    {MODKEY, XK_v, spawn, SHCMD("pcmanfm /home/petrside/ece/septembrios2024")},
    {MODKEY, XK_m, spawn, SHCMD("pavucontrol")},
    {MODKEY, XK_o, spawn, SHCMD("Obsidian-1.6.7.AppImage")},
    // {MODKEY, XK_c, spawn, SHCMD("chromium --proxy-server=None")},
    {0, XF86XK_AudioLowerVolume, spawn, {.v = downvol}},
    {0, XF86XK_AudioMute, spawn, {.v = mutevol}},
    {0, XF86XK_AudioRaiseVolume, spawn, {.v = upvol}},
    {0, XF86XK_MonBrightnessDown, spawn, {.v = dimmer}},
    {0, XF86XK_MonBrightnessUp, spawn, {.v = brighter}},
    {MODKEY | ShiftMask, XK_e, spawn, SHCMD("/home/petrside/.config/dwm_scripts/power_menu.sh")},
    {MODKEY, XK_d, spawn, SHCMD("/home/petrside/.config/dwm_scripts/dmenu.sh")},
    {MODKEY, XK_Return, spawn, {.v = termcmd}},
    {MODKEY, XK_Tab, view, {0}},
    // {MODKEY, XK_space, spawn, SHCMD("/home/petrside/.config/dwm_scripts/window_switcher.sh")}, // FOCUSONNETACTIVE_PATCH
    {Mod1Mask, XK_space, focusdir, {.i = 0}},
    {MODKEY, XK_h, focusdir, {.i = 0}},
    {MODKEY, XK_l, focusdir, {.i = 1}},
    {MODKEY, XK_k, focusdir, {.i = 2}},
    {MODKEY, XK_j, focusdir, {.i = 3}},
    {MODKEY, XK_Left, focusdir, {.i = 0}},
    {MODKEY, XK_Right, focusdir, {.i = 1}},
    {MODKEY, XK_Up, focusdir, {.i = 2}},
    {MODKEY, XK_Down, focusdir, {.i = 3}},
    {MODKEY, XK_q, killclient, {0}},
    {MODKEY | ShiftMask, XK_q, quit, {0}},
    {MODKEY | ShiftMask, XK_i, incnmaster, {.i = +1}},
    {MODKEY | ShiftMask, XK_d, incnmaster, {.i = -1}},
    {MODKEY | ShiftMask, XK_h, setmfact, {.f = -0.05}},
    {MODKEY | ShiftMask, XK_l, setmfact, {.f = +0.05}},
    {MODKEY | ShiftMask, XK_Return, zoom, {0}},
    {MODKEY | ShiftMask, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY | ShiftMask, XK_w, setlayout, {.v = &layouts[2]}},
    {MODKEY | ShiftMask, XK_c, setlayout, {.v = &layouts[3]}},
    {MODKEY | ShiftMask, XK_g, setlayout, {.v = &layouts[4]}},
    {MODKEY, XK_bracketleft, viewtoleft, {0}},
    {MODKEY, XK_bracketright, viewtoright, {0}},
    {MODKEY | ShiftMask, XK_bracketleft, tagtoleft, {0}},
    {MODKEY | ShiftMask, XK_bracketright, tagtoright, {0}},
    {MODKEY | ControlMask, XK_bracketleft, tagandviewtoleft, {0}},
    {MODKEY | ControlMask, XK_bracketright, tagandviewtoright, {0}},
    {MODKEY, XK_f, togglefullscreen, {0}},
    {MODKEY | ShiftMask, XK_space, togglefloating, {0}},
    // {MODKEY, XK_0, view, {.ui = ~0}},

    TAGKEYS(XK_1, 0)
    TAGKEYS(XK_2, 1)
    TAGKEYS(XK_3, 2)
    TAGKEYS(XK_4, 3)
    TAGKEYS(XK_5, 4)
    TAGKEYS(XK_6, 5)
    TAGKEYS(XK_7, 6)
    TAGKEYS(XK_8, 7)
    TAGKEYS(XK_9, 8)
};

static const Button buttons[] = {
  {ClkTagBar, 0, Button1, view, {0}},
  {ClkTabBar, 0, Button1, focuswin, {0}},
  {ClkClientWin, MODKEY, Button1, movemouse, {0}},
  {ClkClientWin, MODKEY | ShiftMask, Button1, resizemouse, {0}},
};
// clang-format on
