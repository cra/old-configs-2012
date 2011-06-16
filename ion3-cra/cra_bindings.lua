-- cramur's ion3 bindingsl

--[[

### OVERVIEW ###

By mapping the virtual desktops to a grid on the left hand, rapid
to specific desktops is not only possible, but becomes second nature.

These bindings are designed to be as comfortable as possible from 
a Dvorak keyboard layout. 

Installation:

   dopath("cfg_cra_bindings")

--]]


-- MAIN BINDINGS

--[[

This is the physical layout of the grid layout. The number in the upper-
right hand corner represents the workspace number. Obviously on a Dvorak
keyboard, the actual letters are different, but they do not really 
matter to us. 
 ___________....
|  0|  1|  2|   .
| 1 | 2 | 3 | 4 .
|___|___|___|....
 |  3|  4|  5|   .
 | Q | W | E | R .
 |___|___|___|____
  |  6|  7|  8|  9|
  | A | S | D | F |
  |___|___|___|___|

--]]

defbindings("WScreen", {
    bdoc("Navigate to the left/right workspace."),
    kpress(ALTMETA.."Shift+Left", "WScreen.switch_prev(_)"),
    kpress(ALTMETA.."Shift+Right", "WScreen.switch_next(_)"),
    kpress(ALTMETA.."Shift+H", "WScreen.switch_prev(_)"),
    kpress(ALTMETA.."Shift+N", "WScreen.switch_next(_)"),

    bdoc("Navigate workspaces using a Dvorak grid-based metaphor."),
    kpress(ALTMETA.."1", "WScreen.switch_nth(_, 0)"),
    kpress(ALTMETA.."2", "WScreen.switch_nth(_, 1)"),
    kpress(ALTMETA.."3", "WScreen.switch_nth(_, 2)"),
    kpress(ALTMETA.."apostrophe", "WScreen.switch_nth(_, 3)"),
    kpress(ALTMETA.."comma", "WScreen.switch_nth(_, 4)"),
    kpress(ALTMETA.."period", "WScreen.switch_nth(_, 5)"),
    kpress(ALTMETA.."A", "WScreen.switch_nth(_, 6)"),
    kpress(ALTMETA.."O", "WScreen.switch_nth(_, 7)"),
    kpress(ALTMETA.."E", "WScreen.switch_nth(_, 8)"),
    kpress(ALTMETA.."U", "WScreen.switch_nth(_, 9)"),

})

defbindings("WMPlex", {
    bdoc("Toggle fullscreen mode of current client window."),
    kpress(META.."Return", 
                "WGroup.set_fullscreen(_, 'toggle')"),
    bdoc("Query for command line to execute."),
    kpress(ALTMETA.."R", "mod_query.query_exec(_)"),

    bdoc("Query for host to connect to with SSH."),
    kpress(ALTMETA.."S", "mod_query.query_ssh(_, ':ssh')"),

})

defbindings("WFrame", {

    -- An exercise for my little finger, heh :)
    bdoc("Switch to next/previous object within the frame."),
    kpress(ALTMETA.."at", "WFrame.switch_next(_)"),
    kpress(ALTMETA.."slash", "WFrame.switch_prev(_)"),

    bdoc("Attach tagged frames."),
    kpress(META.."Shift+T", "ioncore.tagged_attach(_)"),
 })

-- ionws

defbindings("WTiling", {

    -- I don't use this much, but I'll leave it in case I need it someday
--[[
    bdoc("Split current frame vertically."),
    kpress(ALTMETA.."N", "WTiling.split_at(_, _sub, 'bottom', true)"),
    kpress(ALTMETA.."P", "WTiling.split_at(_, _sub, 'top', true)"),

    bdoc("Split current frame horizontally."),
    kpress(ALTMETA.."F", "WTiling.split_at(_, _sub, 'right', true)"),
    kpress(ALTMETA.."B", "WTiling.split_at(_, _sub, 'left', true)"),
]]--

    bdoc("Go to frame above/below/right/left of current frame."),
    kpress(ALTMETA.."C", "ioncore.goto_next(_sub, 'up', {no_ascend=_})"),
    kpress(ALTMETA.."T", "ioncore.goto_next(_sub, 'down', {no_ascend=_})"),

    kpress(ALTMETA.."H", "ioncore.goto_next(_sub, 'left', {no_ascend=_})"),
    kpress(ALTMETA.."N", "ioncore.goto_next(_sub, 'right', {no_ascend=_})")
})

