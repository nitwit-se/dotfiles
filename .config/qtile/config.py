# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

from libqtile.utils import guess_terminal
from libqtile.log_utils import logger
from libqtile import qtile
import libqtile

mod = "mod4"
terminal = guess_terminal()



keys = [
    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "Left", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),



    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod], "r", lazy.reload_config(), desc="Reload Qtile config"),
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    #Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Rofi and dmenu:
    Key([mod], "d", lazy.spawn("rofi -show drun -config /home/mark/.config/rofi/Nord.rasi"), desc="Rofi"),
    Key([mod, "shift"], "d", lazy.spawn("dmenu_run -i -nb '#2E3440' -nf '#81a1c1' -sb '#81a1c1' -sf '#2E3440' -fn 'SFDisplayPro:bold:pixelsize=14'"), desc="Rofi"),

    Key([mod], "F12",
        lazy.group["scratchpad"].dropdown_toggle('term'),
        desc='Dropdown terminal'
    ),

    Key([mod], "f",
        lazy.window.toggle_fullscreen(),
        desc='toggle fullscreen'
    ),

    Key([mod, "shift"], "space",
        lazy.window.toggle_floating(),
        desc='toggle floating'
    ),
    

]

groups = [
    #Group(i) for i in "123456789" +
    #  
    
    Group('1', label='', layout='columns'),
    Group('2', label='', layout='columns'),
    Group('3', label='', layout='columns'),
    Group('4', label='', layout='columns'),
    Group('5', label='', layout='columns'),
    Group('6', label='', layout='columns'),
    Group('7', label='', layout='columns'),
    Group('8', label='', layout='columns'),
    Group('9', label='﫯', layout='columns'),
    Group('0', label='', layout='columns'),
    
    ScratchPad("scratchpad", [
        # define a drop down terminal.
        # it is placed in the upper third of screen by default.
        DropDown("term", "alacritty -e R -q --no-save", opacity=0.95),

    ] ),
]

for i in groups[:-1]:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])





########################
# Define colors ########
########################

colors = [
    ["#2e3440", "#2e3440"],  # background 0
    ["#d8dee9", "#d8dee9"],  # foreground 1
    ["#4c566a", "#4c566a"],  # background lighter 2
    ["#bf616a", "#bf616a"],  # red 3
    ["#a3be8c", "#a3be8c"],  # green 4
    ["#ebcb8b", "#ebcb8b"],  # yellow 5
    ["#81a1c1", "#81a1c1"],  # blue 6
    ["#b48ead", "#b48ead"],  # magenta 7
    ["#88c0d0", "#88c0d0"],  # cyan 8
    ["#eceff4", "#eceff4"],  # white 9
    ["#4c566a", "#4c566a"],  # grey 10
    ["#d08770", "#d08770"],  # orange 11
    ["#8fbcbb", "#8fbcbb"],  # super cyan 12
    ["#88c0d0", "#88c0d0"],  # super blue 13
    ["#111318", "#111318"],  # super dark background 14
]

layout_theme = {
    "border_width": 2,
    "margin": 3,
    "border_on_single": False,
    "margin_on_single": [ 3, 0, 0, 0 ],
    "fair": True, # Add new windows to the column with least windows.
    "border_focus": "5e81ac",
    "border_normal": "4c566a",
    "font": "Hack Nerd Font",
    "grow_amount": 2,
}


layouts = [
    #layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    layout.Columns(**layout_theme),
    layout.Max(**layout_theme),
    # layout.Floating(**layout_theme),

    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='SF Pro Display',
    #font='Hack Nerd Font',
    fontsize=14,
    padding=3,
    background=colors[0],
)
extension_defaults = widget_defaults.copy()


def separator(linewidth=1, padding=6):
    return widget.Sep(
        linewidth = linewidth,
        padding = padding,
        foreground = colors[2],
        background = colors[0]
    )



screens = [
    Screen(
        top=bar.Bar( [
            widget.CurrentLayoutIcon( scale=0.6 ),
            widget.GroupBox(
                font = "SF Pro Display",
                fontsize = 24,
                margin_y = 3,
                margin_x = 0,
                padding_y = 5,
                padding_x = 3,
                borderwidth = 3,
                active = colors[9],
                inactive = colors[2],
                this_current_screen_border = colors[6],
                rounded = False,
                disable_drag=True,
                highlight_color = colors[1],
                highlight_method = "block", # "block"
            ),
            widget.Spacer(),
            widget.WindowName(
                width=bar.CALCULATED,
                font = "SF Pro Display",
                #font = "Hack Nerd Pro",
                fontsize = 14,
                foreground=colors[6],
            ),
            widget.Spacer(),
            separator(0),
            widget.CPUGraph(
                mouse_callbacks={
                    'Button1': lambda: qtile.cmd_spawn('alacritty -e bpytop')
                }
            ),
            separator(),
            widget.BatteryIcon(),
            widget.Battery(),
            separator(),
            widget.PulseVolume(),
            separator(),
            widget.Wttr(
                lang='en',
                location={
                    'Stockholm': 'Stockholm',
                    },
                format='%m %t',
                units='m',
                update_interval=30,
                mouse_callbacks={
                    'Button1': lambda: qtile.current_screen.set_group(qtile.groups[2]) or qtile.cmd_spawn('firefox https://moonphases.co.uk/') 
                }
            ),
            separator(),
            widget.TextBox('', fontsize=24),
            widget.Clock(
                format='%-H:%M',
                mouse_callbacks={
                    'Button1': lambda: qtile.current_screen.toggle_group(qtile.groups[9],warp=False)
                },
            ),
            #separator(),
            #widget.Clock(
            #    format='%Y-%m-%d',
            #    mouse_callbacks={
            #        'Button1': lambda: qtile.current_screen.toggle_group(qtile.groups[9],warp=False)
            #    },
            #),
            separator(),
            widget.WidgetBox(
                widgets=[
                    widget.Systray(),                     
                    ],
                font="Hack Nerd Font",
                fontsize=14,
                text_open="   ",
                text_closed="   ",
                close_button_location="right"
            ),
            separator(),
            widget.QuickExit(
                default_text="襤",
                countdown_format='{}',
                font="Hack Nerd Font",
                fontsize=14,
            ),
            separator(0)
            ],
            22,
            opacity=0.9
        ),
    ),
    ]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


#lazy.restart()



@libqtile.hook.subscribe.client_new
def func(c):
    #logger.warning( "%s = %s" % ( c.name, c.window.get_wm_class() ) )
    if c.name == "Mailspring":
        c.togroup("9")
    elif "Emacs" in c.window.get_wm_class():
        c.togroup("2")
    elif "firefox" in c.window.get_wm_class():
        c.togroup("3")
    elif "Morgen" in c.window.get_wm_class():
        c.togroup("0")
    elif "Code" in c.window.get_wm_class():
        c.togroup("5")
    elif "Spotify" in c.window.get_wm_class():
        c.togroup("7")
    elif "zoom" in c.window.get_wm_class():
        c.togroup("8")
    elif c.name == "dzen":
        c.cmd_static(0)

