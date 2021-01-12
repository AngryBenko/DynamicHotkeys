; Try to separate main gui from secondary gui

drawMainGUI() {
    global

    general := "Welcome to "
    general .= title
    general .= "!`n"
    general .= "Press the shortcuts below to apply types or to select tool.`n"
    general .= "If you do not have extra mouse buttons, check 'Middle' box. Otherwise select your preferred thumb button`n"
    general .= "To edit/setup shortcuts, go to File -> Edit Keybinds."
    important := "Please do not close this window for the script to work in the background!"

    drawHeaderGUI()
    drawMainWorkflowGUI()

    Gui, MainGui: +Resize -MaximizeBox
	Gui, MainGui: Show, Center w600 h%height% , %Title%
    return
}

drawHeaderGUI() {
	global

	Menu, FileMenu, Add, Edit Keybinds, 2ndGui
	Menu, FileMenu, Add, Reload Script, Reload
	Menu, MyMenuBar, Add, &File, :FileMenu
	Menu, MyMenuBar, Add, &Help, Help
    Gui, MainGui: Default
	Gui, MainGui: Menu, MyMenuBar
	Gui, MainGui: Font, s9 normal, Segoe UI
	Gui, MainGui: Add, Text, cBlack y5, %general%
	Gui, MainGui: Font, s9 bold, Segoe UI
	Gui, MainGui: Add, Text, cBlack y5 xp+380, Workflow:
	Gui, MainGui: Add, DropDownList, vWorkflow gWorkflow yp xp+65, Line|RE|LG|SVA/SE
	Gui, MainGui: Font, s9 bold, Segoe UI
	Gui, MainGui: Add, Text, cBlack x11 y65, %important%
	Gui, MainGui: Font, s10 normal, Segoe UI
	Gui, MainGui: Add, Text, cBlack yp+20 x60, Primary
	Gui, MainGui: Add, Text, cBlack yp xp+125, Secondary
	;Gui, MainGui: Add, Radio, vModGroup gModCheck Group yp xp+150 , Middle
	;Gui, MainGui: Add, Radio, gModCheck yp xp+70 Checked , Thumb1
	;Gui, MainGui: Add, Radio, gModCheck yp xp+80 , Thumb2
	;Gui, MainGui:+AlwaysOnTop

	return
}

drawMainWorkflowGUI() {
	global
	if (workflowCheck == "Line") { ; Lines
		drawMainLIGUI()
	} else if (workflowCheck == "RE") { ; RE
		drawMainREGUI()
	} else if (workflowCheck == "LG") { ; LG
		drawMainLGGUI()
	} else if (workflowCheck == "SVA/SE") { ; SVA/SE
		drawMainSVASEGUI()
	}
	return
}

drawMainLIGUI() {
	global
	Loop % (LINumHotkeys + NumHotkeys) {
		if (A_Index > LINumHotkeys) {
			displayType := DisplayVar[A_Index - LINumHotkeys]
		} else {
			displayType := LIDisplayVar[A_Index]
		}

        
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index == LINumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (Special)
        } else if (A_Index <= LINumHotkeys) {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (LI)
        } else {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (Misc)
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vLIHotkeyName1%A_Index% w110 yp-1 xp+50 , None
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index == LINumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+87, =/+ ;
        } else {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+115, OR ;
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vLIHotkeyName2%A_Index% w80 yp-1 xp+28, None
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index != LINumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+128, %displayType%
        } else {
            Gui, MainGui: Add, DropDownList, vSpecialChoice gSpecialChoice AltSubmit yp xp+100, Custom|MSTeam Mute
        }
		ypos += 25
	}
	return
}

drawMainREGUI() {
	global
	Loop % (RENumHotkeys + NumHotkeys) {
		if (A_Index > RENumHotkeys) {
			displayType := DisplayVar[A_Index - RENumHotkeys]
		} else {
			displayType := REDisplayVar[A_Index]
		}
    
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index == RENumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (Special)
        } else if (A_Index <= RENumHotkeys) {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (RE)
        } else {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (Misc)
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vREHotkeyName1%A_Index% w110 yp-1 xp+50 , None
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index == RENumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+87, =/+ ;;;;;;;;
        } else {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+115, OR ;;;;;;;
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vREHotkeyName2%A_Index% w80 yp-1 xp+28, None
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index != RENumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+128, %displayType%
        } else {
            Gui, MainGui: Add, DropDownList, vSpecialChoice gSpecialChoice AltSubmit yp xp+100, Custom|MSTeam Mute
        }
        
		ypos += 25
	}
	return
}

drawMainLGGUI() {
	global
	Loop % (LGNumHotkeys + NumHotkeys) {
		if (A_Index > LGNumHotkeys) {
			displayType := DisplayVar[A_Index - LGNumHotkeys]
		} else {
			displayType := LGDisplayVar[A_Index]
		}


        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index == LGNumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (Special)
        } else if (A_Index <= LGNumHotkeys) {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (LG)
        } else {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (Misc)
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vLGHotkeyName1%A_Index% w110 yp-1 xp+50 , None
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index == LGNumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+87, =/+ ;;;;;;;;
        } else {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+115, OR ;;;;;;;
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vLGHotkeyName2%A_Index% w80 yp-1 xp+28, None
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index != LGNumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+128, %displayType%
        } else {
            Gui, MainGui: Add, DropDownList, vSpecialChoice gSpecialChoice AltSubmit yp xp+100, Custom|MSTeam Mute
        }
  
		ypos += 25
	}
	return
}

drawMainSVASEGUI() {
	global
	Loop % (SVASENumHotkeys + NumHotkeys) {
		if (A_Index > SVASENumHotkeys) {
			displayType := DisplayVar[A_Index - SVASENumHotkeys]
		} else {
			displayType := SVASEDisplayVar[A_Index]
		}

        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index == SVASENumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (Special)
        } else if (A_Index <= SVASENumHotkeys) {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (SVASE)
        } else {
            Gui, MainGui: Add, Text, cBlack x5 y%ypos%, (Misc)
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vSVASEHotkeyName1%A_Index% w110 yp-1 xp+50 , None
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index == SVASENumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+87, =/+ ;;;;;;;;
        } else {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+115, OR ;;;;;;;
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vSVASEHotkeyName2%A_Index% w80 yp-1 xp+28, None
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index != SVASENumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack y%ypos% xp+128, %displayType%
        } else {
            Gui, MainGui: Add, DropDownList, vSpecialChoice gSpecialChoice AltSubmit yp xp+100, Custom|MSTeam Mute
        }

		ypos += 25
	}
	return
}

destroy1GUI() {
	global
	ypos := 105
    general := ""
	Gui, MainGui: Destroy
	return
}