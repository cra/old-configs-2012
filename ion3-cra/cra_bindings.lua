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
    kpress(META.."period", "WScreen.switch_prev(_)"),
    kpress(ALTMETA.."s", "WScreen.switch_prev(_)"),
    kpress(ALTMETA.."u", "WScreen.switch_next(_)"),
})

defbindings("WMPlex", {
    bdoc("Toggle fullscreen mode of current client window."),
    kpress(META.."Return", 
                "WGroup.set_fullscreen(_, 'toggle')"),
    bdoc("Query for command line to execute."),
    kpress(ALTMETA.."R", "mod_query.query_exec(_)"),

})


function toggle_tabbar(fr)
  if WFrame.mode(fr)=="tiled-alt"
      then
          WFrame.set_mode(fr,"tiled")
      else
          WFrame.set_mode(fr,"tiled-alt")
  end
end


defbindings("WFrame", {

    -- An exercise for my little finger, heh :)
    bdoc("Switch to next/previous object within the frame."),
    kpress(META.."a", "WFrame.switch_prev(_)"),
    kpress(META.."t", "WFrame.switch_next(_)"),

    bdoc("Attach tagged frames."),
    kpress(META.."Shift+T", "ioncore.tagged_attach(_)"),
    
    bdoc("Toggle tabheader"),
    mpress(ALTMETA.."Button2", "toggle_tabbar(_)"),
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
    kpress(ALTMETA.."e", "ioncore.goto_next(_sub, 'up', {no_ascend=_})"),
    kpress(ALTMETA.."h", "ioncore.goto_next(_sub, 'down', {no_ascend=_})"),

    kpress(ALTMETA.."a", "ioncore.goto_next(_sub, 'left', {no_ascend=_})"),
    kpress(ALTMETA.."t", "ioncore.goto_next(_sub, 'right', {no_ascend=_})")
})

