drawEditGUI() {
    global
    Gui, MainGui: +LastFound
	WinGetPos, xx, yy
	xx += 10
	yy += 10
	DisableHotkeys()
	editText := "To edit your keybinds, click on 'Set Primary'.`n"
	editText .= "If you would like to reset the keybinds, click on 'Reset Key'"
	Gui, EditGui: Font, s9 bold, Segoe UI
	Gui, EditGui: Add, Text, cBlack y5, %editText%
	Gui, EditGui: Font, s10 normal, Segoe UI
	Gui, EditGui: Add, Text, cBlack yp+45 x185, Primary
    Gui, EditGui: +AlwaysOnTop -MinimizeBox +Resize
	ypos := 70

    drawEditWorkflowGUI()

    Gui, EditGui: Add, Button, gCloseEdit vCloseEdit xp+25 yp+35, Save
	;height := height + 60
    if (workflowCheck == "Cuboids") {
        height := ((NumHotkeys + CuboidsNumHotkeys + CuboidsNumHotkeysA) * 25) + 150
        Gui, EditGui: Show, Center w700 h%height% x%xx% y%yy%, Edit Keybinds
    } else {
        Gui, EditGui: Show, Center w700 h%height% x%xx% y%yy%, Edit Keybinds
    }

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
	} else if (workflowCheck == "Cuboids") {
        drawEditCuboidsGUI()
    }
}

drawEditLIGUI() {
    global
    Loop % (LINumHotkeys + NumHotkeys) {
        if (A_Index > LINumHotkeys + LINumHotkeysAdd) { ; add additional lg shortcuts
			displayType := DisplayVar[A_Index - (LINumHotkeys + LINumHotkeysAdd)]
		} else if (A_Index <= LINumHotkeys) {
			displayType := LIDisplayVar[A_Index]
		} else {
            displayType := LIDisplayVarAdd[A_Index - LINumHotkeys]
        }

        Gui, EditGui: Font, s10, Segoe UI

        if (A_Index == LINumHotkeys + LINumHotkeysAdd + NumHotkeys) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Special)
        } else if (A_index <= LINumHotkeys + LINumHotkeysAdd) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (LI) %displayType%
        } else {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Misc) %displayType%
        }
        
        Gui, EditGui: Font, s8, Segoe UI
        Gui, EditGui: Add, Edit, Disabled vLIHotkeyName1%A_Index% w130 xp+155 y%ypos%, None
        Gui, EditGui: Font,, 

        if (A_Index < (LINumHotkeys + LINumHotkeysAdd + NumHotkeys) && A_Index > ((LINumHotkeys + LINumHotkeysAdd + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+140, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v1Bind1%A_Index% yp-1 xp+140, Set Primary 
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
        Gui, EditGui: Add, Edit, Disabled vREHotkeyName1%A_Index% w130 xp+155 y%ypos%, None
        Gui, EditGui: Font,, 

        if (A_Index < (RENumHotkeys + NumHotkeys) && A_Index > ((RENumHotkeys + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+140, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v2Bind1%A_Index% yp-1 xp+140, Set Primary 
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
        Gui, EditGui: Add, Edit, Disabled vLGHotkeyName1%A_Index% w130 xp+155 y%ypos%, None
        Gui, EditGui: Font,, 

        if (A_Index < (LGNumHotkeys + NumHotkeys) && A_Index > ((LGNumHotkeys + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+140, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v3Bind1%A_Index% yp-1 xp+140, Set Primary 
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
        Gui, EditGui: Add, Edit, Disabled vSVASEHotkeyName1%A_Index% w130 xp+155 y%ypos%, None
        Gui, EditGui: Font,, 

        if (A_Index < (SVASENumHotkeys + NumHotkeys) && A_Index > ((SVASENumHotkeys + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+140, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v4Bind1%A_Index% yp-1 xp+140, Set Primary  
            Gui, EditGui: Add, Button, gReset v4Reset%A_Index% xp+85, Reset Key
        }
        ypos += 25
    }
    return
}

drawEditCuboidsGUI() {
    global
    totalNumHotkey := CuboidsNumHotkeys + CuboidsNumHotkeysA
    Loop % (totalNumHotkey + NumHotkeys){
        if (A_Index > totalNumHotkey) {
			displayType := DisplayVar[A_Index - totalNumHotkey]
		} else {
			if (A_Index > CuboidsNumHotkeys) {
                displayType := CuboidsDisplayVar2[A_Index - CuboidsNumHotkeys]
            } else {
                displayType := CuboidsDisplayVar[A_Index]
            }
		}

        Gui, EditGui: Font, s10, Segoe UI

        if (A_Index == totalNumHotkey + NumHotkeys) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Special)
        } else if (A_index <= totalNumHotkey) {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Cuboids) %displayType%
        } else {
            Gui, EditGui: Add, Text, cBlack x5 y%ypos%, (Misc) %displayType%
        }

        Gui, EditGui: Font, s8, Segoe UI
        Gui, EditGui: Add, Edit, Disabled vCuboidsHotkeyName1%A_Index% w130 xp+155 y%ypos%, None
        Gui, EditGui: Font,, 

        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+140, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v5Bind1%A_Index% yp-1 xp+140, Set Primary  
            Gui, EditGui: Add, Button, gReset v5Reset%A_Index% xp+70, Reset Key
        }
        ypos += 25
    }
    return
}

destoryEditGUI() {
    global
    editText := ""
	EnableHotkeys()
	Gui, EditGui: Destroy ; We cannot recreate the same gui. We must destroy or redisplay it.
	;Reload
    return
}