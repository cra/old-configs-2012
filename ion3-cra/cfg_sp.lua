--
-- Ion mod_sp configuration file
--

defbindings("WScreen", {
    bdoc("Toggle scratchpad."),
--    kpress(META.."space", "mod_sp.set_shown_on(_, 'toggle')"),
    
    -- A more ideal key for toggling the scratchpad would be the key left of
    -- the key for numeral 1. Unfortunately the symbols mapped to this key
    -- vary by the keyboard layout, and to be fully portable to different 
    -- architechtures and fancy keyboards, we can't rely on keycodes either. 
    -- However, on standard Finnish/Swedish (and other Nordic) keyboard 
    -- layouts the following should work:
    kpress(META.."section", "mod_sp.set_shown_on(_, 'toggle')"),
    -- and on UK and US layouts this should work:
    kpress(META.."grave", "mod_sp.set_shown_on(_, 'toggle')"),

    -- second one: ipython and gnuplot
    kpress(META.."dollar", "named_scratchpad(_, 'scihandy')"),

    kpress(ALTMETA.."Shift+C", "named_scratchpad(_, 'ims')"),

    kpress("Pause", "named_scratchpad(_, 'muzlo')"),
    kpress(ALTMETA.."Shift+M", "named_scratchpad(_, 'muzlo')"),
    kpress("F3", "named_scratchpad(_, 'muzlo')"),
  
})

