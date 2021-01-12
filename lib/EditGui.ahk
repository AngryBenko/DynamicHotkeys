drawEditGUI() {
    global
    Gui, MainGui: +LastFound
	WinGetPos, xx, yy
	xx += 10
	yy += 10
	DisableHotkeys()
	editText := "To edit your keybinds, click on 'Set Primary'.`n"
	editText .= "Click 'Set Secondary' if you would like a secondary keybind for the same shortcut.`n"
	editText .= "If you would like to reset the keybinds, click on 'Reset Key'"
	Gui, EditGui: Font, s8 bold, Segoe UI
	Gui, EditGui: Add, Text, cBlack y5, %editText%
	Gui, EditGui: Font, s10 normal, Segoe UI
	Gui, EditGui: Add, Text, cBlack yp+45 x185, Primary
	Gui, EditGui: Add, Text, cBlack yp xp+120, Secondary
	ypos := 70

    drawEditWorkflowGUI()

    Gui, EditGui: Add, Button, gCloseEdit vCloseEdit xp+25 yp+35, Save
	;height := height + 60
	Gui, EditGui: Show, Center w650 h%height% x%xx% y%yy%, Edit Keybinds

	LoadSettings()
    return
}

drawEditWorkflowGUI() {
    if (workflowCheck == "Line") { ; Lines
		drawEditLIGUI()
	} else if (workflowCheck == "RE") { ; RE
		drawEditREGUI()
	} else if (workflowCheck == "LG") { ; LG
		drawEditLGGUI()
	} else if (workflowCheck == "SVA/SE") { ; SVA/SE
		drawEditSVASEGUI()
	}
}

drawEditLIGUI() {
    global
    Loop % (LINumHotkeys + NumHotkeys) {
        if (A_Index > LINumHotkeys) {
			displayType := DisplayVar[A_Index - LINumHotkeys]
		} else {
			displayType := LIDisplayVar[A_Index]
		}

        Gui, EditGui: Font, s10, Segoe UI

        if (A_Index == LINumHotkeys + NumHotkeys) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Special)
        } else if (A_index <= LINumHotkeys) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (LI) %displayType%
        } else {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Misc) %displayType%
        }
        
        Gui, EditGui: Font, s8, Segoe UI
        Gui, EditGui: Add, Edit, Disabled vLIHotkeyName1%A_Index% w110 xp+155 y%ypos%, None
        Gui, EditGui: Add, Edit, Disabled vLIHotkeyName2%A_Index% w110 xp+130 yp-1, None
        Gui, EditGui: Font,, 

        if (A_Index < (LINumHotkeys + NumHotkeys) && A_Index > ((LINumHotkeys + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+120, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v1Bind1%A_Index% yp-1 xp+110, Set Primary 
            Gui, EditGui: Add, Button, gBind2 v1Bind2%A_Index% xp+70, Set Secondary 
            Gui, EditGui: Add, Button, gReset v1Reset%A_Index% xp+85, Reset Key
        }
        ypos += 25
    }
    return
}

drawEditREGUI() {
    global
    Loop % (RENumHotkeys + NumHotkeys){
        if (A_Index > RENumHotkeys) {
			displayType := DisplayVar[A_Index - RENumHotkeys]
		} else {
			displayType := REDisplayVar[A_Index]
		}

        Gui, EditGui: Font, s10, Segoe UI

        if (A_Index == RENumHotkeys + NumHotkeys) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Special)
        } else if (A_index <= RENumHotkeys) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (RE) %displayType%
        } else {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Misc) %displayType%
        }

        Gui, EditGui: Font, s8, Segoe UI
        Gui, EditGui: Add, Edit, Disabled vREHotkeyName1%A_Index% w110 xp+155 y%ypos%, None
        Gui, EditGui: Add, Edit, Disabled vREHotkeyName2%A_Index% w110 xp+130 yp-1, None
        Gui, EditGui: Font,, 

        if (A_Index < (RENumHotkeys + NumHotkeys) && A_Index > ((RENumHotkeys + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+120, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v2Bind1%A_Index% yp-1 xp+110, Set Primary 
            Gui, EditGui: Add, Button, gBind2 v2Bind2%A_Index% xp+70, Set Secondary 
            Gui, EditGui: Add, Button, gReset v2Reset%A_Index% xp+85, Reset Key
        }
        ypos += 25
    }

    return
}

drawEditLGGUI() {
    global
    Loop % (LGNumHotkeys + NumHotkeys){
        if (A_Index > LGNumHotkeys) {
			displayType := DisplayVar[A_Index - LGNumHotkeys]
		} else {
			displayType := LGDisplayVar[A_Index]
		}

        Gui, EditGui: Font, s10, Segoe UI

        if (A_Index == LGNumHotkeys + NumHotkeys) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Special)
        } else if (A_index <= LGNumHotkeys) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (LG) %displayType%
        } else {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Misc) %displayType%
        }

        Gui, EditGui: Font, s8, Segoe UI
        Gui, EditGui: Add, Edit, Disabled vLGHotkeyName1%A_Index% w110 xp+155 y%ypos%, None
        Gui, EditGui: Add, Edit, Disabled vLGHotkeyName2%A_Index% w110 xp+130 yp-1, None
        Gui, EditGui: Font,, 

        if (A_Index < (LGNumHotkeys + NumHotkeys) && A_Index > ((LGNumHotkeys + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+120, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v3Bind1%A_Index% yp-1 xp+110, Set Primary 
            Gui, EditGui: Add, Button, gBind2 v3Bind2%A_Index% xp+70, Set Secondary 
            Gui, EditGui: Add, Button, gReset v3Reset%A_Index% xp+85, Reset Key
        }
        ypos += 25
    }
    return
}

drawEditSVASEGUI() {
    global
    Loop % (SVASENumHotkeys + NumHotkeys){
        if (A_Index > SVASENumHotkeys) {
			displayType := DisplayVar[A_Index - SVASENumHotkeys]
		} else {
			displayType := SVASEDisplayVar[A_Index]
		}

        Gui, EditGui: Font, s10, Segoe UI

        if (A_Index == SVASENumHotkeys + NumHotkeys) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Special)
        } else if (A_index <= SVASENumHotkeys) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (SVASE) %displayType%
        } else {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Misc) %displayType%
        }

        Gui, EditGui: Font, s8, Segoe UI
        Gui, EditGui: Add, Edit, Disabled vSVASEHotkeyName1%A_Index% w110 xp+155 y%ypos%, None
        Gui, EditGui: Add, Edit, Disabled vSVASEHotkeyName2%A_Index% w110 xp+130 yp-1, None
        Gui, EditGui: Font,, 

        if (A_Index < (SVASENumHotkeys + NumHotkeys) && A_Index > ((SVASENumHotkeys + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+120, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v4Bind1%A_Index% yp-1 xp+110, Set Primary 
            Gui, EditGui: Add, Button, gBind2 v4Bind2%A_Index% xp+70, Set Secondary 
            Gui, EditGui: Add, Button, gReset v4Reset%A_Index% xp+85, Reset Key
        }
        ypos += 25
    }
    return
}