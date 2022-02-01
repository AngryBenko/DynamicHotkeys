drawEditGUI() {
    global
	
	firstColumn := 5
    secondColumn := guiColumnPos() + 150
	if (workflowCheck == "SVA/SE") {
		editGuiWidth := width
	} else {
		editGuiWidth := width + 265
	}
	horizontalLineWidth := editGuiWidth - 20
    editToolsWidth := 450
    buttonPosX := editGuiWidth - 160
    buttonPosY := height - 50
    editToolsPos := editGuiWidth / 5.5
    semanticSectionX := 10
    semanticSectionY := 27
    descriptorX := 10
    descriptorY := 27

    Gui, MainGui: +LastFound
    Gui, EditGui: +AlwaysOnTop -MinimizeBox +Resize
	WinGetPos, xx, yy
	xx += 10
	yy += 10
	DisableHotkeys()

    if (darkMode) {
        Gui, EditGui: Color, c202020
        Gui, EditGui: Font, cE0E0E0
    }

	editText := "To edit your keybinds, click on 'Set Primary'.`n"
	editText .= "If you would like to reset the keybinds, click on 'Reset Key'.`n"
    editText .= "General keybinds are restricted to Mouse Button Modifiers.`n"
    editText .= "Advanced keybinds have no restrictions on which modifiers you can use (CTRL, ALT, ThumbButton1, etc.)."
	Gui, EditGui: Font, s9 bold, Segoe UI
	Gui, EditGui: Add, Text, y5, %editText%
	Gui, EditGui: Add, Text, xm w%horizontalLineWidth% 0x10 ; 0x10 is etched gray line
	Gui, EditGui: Font, s9 normal, Segoe UI
    Gui, EditGui: Add, Tab3, xp yp+10, General|Advanced
    ;Gui, EditGui: Add, Tab3, xp yp+10, General


    drawEditWorkflowGUI()

    drawAdvancedEditGUI()

    ; need both save and reset for both tabs
    Gui, EditGui: Tab, 1
    Gui, EditGui: Add, Button, gResetAll vResetAll xm+%buttonPosX% ym+%buttonPosY%, Reset All
    Gui, EditGui: Add, Button, gCloseEdit vCloseEdit xp+75, Save

    Gui, EditGui: Tab, 2
    Gui, EditGui: Add, Button, gResetAll vResetAll2 xm+%buttonPosX% ym+%buttonPosY%, Reset All
    Gui, EditGui: Add, Button, gCloseEdit vCloseEdit2 xp+75, Save

    Gui, EditGui: Tab, 1
    Gui, EditGui: Show, Center w%editGuiWidth% h%height% x%xx% y%yy%, Edit Keybinds

	LoadSettings()
    return
}

confirmationWindow() {
    global 
    Gui, EditGui: +LastFound
    WinGetPos xxx, yyy
	xxx += 300
	yyy += 400
    Gui, Confirm: Font, s9 Bold, Segoe UI
    Gui, Confirm: Add, Text, , Are you sure you want to reset all?
    Gui, Confirm: Font, s9 Normal, Segoe UI
    Gui, Confirm: Add, Button, gYes, Yes
    Gui, Confirm: Add, Button, xp+50 yp gNo, No
    Gui, Confirm: -Border +AlwaysOnTop
    Gui, Confirm: Show, x%xxx% y%yyy%
    return
}

drawAdvancedEditGUI() {
    global

    ; [1] Repurpose the Advanced GUI to be the Advanced settings: Dark Mode, Disable Camera, Always on top, etc. 
    ; [5] Allow user to add/remove the number of custom hotkeys as needed with an upper limit

    Gui, EditGui: Tab, 2
    Gui, EditGui: Font, s10 Bold, Segoe UI
    Gui, EditGui: Add, Text, , ------> This section is experimental. You may run into bugs! <------
    Gui, EditGui: Add, GroupBox, w875 h200 Section, Custom Hotkeys ; First GUI Control
    Loop, % globalNumHotkeys {
        Gui, EditGui: Font, s9 Bold, Segoe UI
        Gui, EditGui: Add, Text, vShortCutName%A_Index% xs+10 yp+30, Shortcut Name
        Gui, EditGui: Font, s9 Normal, Segoe UI
        Gui, EditGui: Add, Edit, vGlobalName%A_Index% w%editWidth% Disabled xp+100 yp
        Gui, EditGui: Add, Text, xp+140, =>
        Gui, EditGui: Add, Edit, vGlobalKey%A_Index% w%editWidth% Disabled xp+30 yp


        Gui, EditGui: Add, Button, gCustomHKName v6HKName%A_Index% xp+140 yp, Edit Name
        Gui, EditGui: Add, Text, xp+75 yp, | 
        Gui, EditGui: Add, Button, gBind2 v6Bind2A%A_Index% xp+10 yp, Edit Hotkey A
        Gui, EditGui: Add, Button, gBind2 v6Bind2B%A_Index% xp+90 yp, Edit Hotkey B
        Gui, EditGui: Add, Text, xp+90 yp, | 
        Gui, EditGui: Add, Button, gReset v6ResetA%A_Index% xp+10 yp, Reset Key A
        Gui, EditGui: Add, Button, gReset v6ResetB%A_Index% xp+80 yp, Reset Key B
    }

    ; IMPORTANT: This will always be active. Not window dependent
    ; IMPORTANT: Hotkey only recognizes keyboard input.
    ; [0] Find a way to incorporate Bind function -- Maybe a call after?
    ; - Separate BindFunction for custom / Open up all keybinds instead of limiting to Mouse Butons (Can still keep same Bind function)
    ; [1] Clicking Edit Hotkey will open a new window which allows you to edit the text field
    ;   and hotkey.
    ; - Two Edit GUI Controls
    ; -- 1. The hotkey to use
    ; -- 2. The hotkey to replace
    ; - Then we store both variables and use to to enable and update the hotkeys

    /*
    Gui, EditGui: +LastFound
	WinGetPos xxx, yyy
	xxx += 25
	yyy += 200
	Gui, EditCustomGui: +AlwaysOnTop
    Gui, EditCustomGui: Add, Edit, w%editWidth% gUserCustomKey vCustomName, Shortcut Name
    Gui, EditCustomGui: Add, Edit, w%editWidth% gUserCustomkey vUserHotKey, User Hotkey
    Gui, EditCustomGui: Add, Edit, w%editWidth% gUserCustomkey vFlideHotkey, FLIDE Hotkey
    Gui, EditCustomGui: Show, x%xxx% y%yyy%
    */

    /*
    UserCustomKey
        This will be the same as Bind, to register the hotkey
        v6Bind (1/2)?
        How to organize custom keys?
            Keep it workflow specific? Global seems to make the most sense.
            How to determine this is a custom key press?; current is using the count going over specific numhotkeys. verType == 6 | DoHotKey6
        How does it save?
        Additional modifier keys?
    Shortcut
        Is the keypresses that should be send, however, this is user defined
        How does it save?

    Current process for hotkeys:
        - Click Edit Button
        - Triggers Bind1
        - Bind waits for input
            - Ensure that at least 1 modifier is pressed
            - Checks for any clash
            - Builds hotkey
            - Apply keybind
        - Updates hotkey GUI
    New process for custom hotkeys:
        - Click ShortcutName Edit Button
        - Triggers Bind2
        - Bind waits for input
            - Ensure at least 1 modifier is pressed
                - Update for additional modifiers
            - Check for any clash
            - Builds hotkey
            - Apply keybind
        - CLick Hotkey button
        - Triggers Bind2
        - Bind waits for input
            - (?) Setup this hotkey to be executed on shortcut keypress
            - Might need to store in a different method
    */


    return
}

changeCustomHKName(index) {
    global
	Gui, EditGui: +LastFound
	WinGetPos xxx, yyy
	xxx += 300
	yyy += 400
	Gui, EditName: Add, Edit, vNameSubmit w300, Shortcut Name
	Gui, EditName: Add, Button, Default gNameSubmit xp+125 ys+25, Submit %index%
    Gui, EditName: -Border +AlwaysOnTop
    Gui, EditName: Show, x%xxx% y%yyy%
    return
}

drawEditWorkflowGUI() {
    Gui, EditGui: Tab, 1
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
    return
}

drawEditLIGUI() {
    global
    totalNumHotkey := LINumHotkeys
    Loop % (totalNumHotkey + NumHotkeys){
        if (A_Index > totalNumHotkey) {
			displayType := DisplayVar[A_Index - totalNumHotkey]
		} else {
            displayType := LIDisplayVar[A_Index]
		}

        Gui, EditGui: Font, s10 Bold Underline, Segoe UI
        ; Creates two sections - Semantics and Tools
        if (A_Index == 1 && A_Index <= LINumHotkeys) {
            groupH := LINumHotkeys * 29
            Gui, EditGui: Add, Groupbox, xp+%semanticSectionX% yp+%semanticSectionY% w565 h%groupH% section, Semantics
        } else if (A_Index == (LINumHotkeys + 1) && A_Index > LINumHotkeys) {
            groupH := NumHotkeys * 29
            if (!LINumHotkeys) {
                Gui, EditGui: Add, Groupbox, xm+%editToolsPos% yp+10 w%editToolsWidth% h%groupH% section, Tools
            } else {
                Gui, EditGui: Add, Groupbox, xp+100 ys w%editToolsWidth% h%groupH% section, Tools
            }
        }

        Gui, EditGui: Font, s10 Normal, Segoe UI
		
		if (A_Index <= totalNumHotkey) {
            Gui, EditGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Lines) %displayType%
        } else {
            Gui, EditGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc) %displayType%
        }

        Gui, EditGui: Font, s8, Segoe UI
		if (A_Index > LINumHotkeys) {
			Gui, EditGui: Add, Edit, Disabled vLIHotkeyName1%A_Index% w%editWidth% xp+155 yp
		} else {
			Gui, EditGui: Add, Edit, Disabled vLIHotkeyName1%A_Index% w%editWidth% xp+275 yp
		}
     

		
        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, xp+140 yp, Not customizable
        
        } else {
            Gui, EditGui: Add, Button, gBind1 v1Bind1%A_Index% xp+140 yp, Set Primary  
            Gui, EditGui: Add, Button, gReset v1Reset%A_Index% xp+75 yp, Reset Key
        }
    }
    return
}

drawEditREGUI() {
    global
    totalNumHotkey := RENumHotkeys
    Loop % (totalNumHotkey + NumHotkeys){
        if (A_Index > totalNumHotkey) {
			displayType := DisplayVar[A_Index - totalNumHotkey]
		} else {
            displayType := REDisplayVar[A_Index]
		}

        Gui, EditGui: Font, s10 Bold Underline, Segoe UI
        ; Creates two sections - Semantics and Tools
        if (A_Index == 1 && A_Index <= RENumHotkeys) {
            groupH := RENumHotkeys * 31
            Gui, EditGui: Add, Groupbox, xp+%semanticSectionX% yp+%semanticSectionY% w475 h%groupH% section, Semantics
        } else if (A_Index == (RENumHotkeys + 1) && A_Index > RENumHotkeys) {
            groupH := NumHotkeys * 29
            if (!RENumHotkeys) {
                Gui, EditGui: Add, Groupbox, xm+%editToolsPos% yp+10 w%editToolsWidth% h%groupH% section, Tools
            } else {
                Gui, EditGui: Add, Groupbox, xp+100 ys w%editToolsWidth% h%groupH% section, Tools
            }
        }

        Gui, EditGui: Font, s10 Normal, Segoe UI
		
		if (A_Index <= totalNumHotkey) {
            Gui, EditGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (RE) %displayType%
        } else {
            Gui, EditGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc) %displayType%
        }

        Gui, EditGui: Font, s8, Segoe UI
		if (A_Index > RENumHotkeys) {
			Gui, EditGui: Add, Edit, Disabled vREHotkeyName1%A_Index% w%editWidth% xp+155 yp
		} else {
			Gui, EditGui: Add, Edit, Disabled vREHotkeyName1%A_Index% w%editWidth% xp+175 yp
		}
     

		; Adds Buttons for each hotkey. If A_Index is selecting the 3rd/2nd from last, then set as not customizable
        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, xp+140, Not customizable
			;Gui, EditGui: Add, Checkbox, gCamToggle v2CamToggle%A_Index% xp+140, Disable
        
        } else {
            Gui, EditGui: Add, Button, gBind1 v2Bind1%A_Index% xp+140 yp, Set Primary  
            Gui, EditGui: Add, Button, gReset v2Reset%A_Index% xp+75 yp, Reset Key
        }
	
    }
    return
}


drawEditLGGUI() {
    global
    totalNumHotkey := LGNumHotkeys + LGNumHotkeysA
    Loop % (totalNumHotkey + NumHotkeys){
        if (A_Index > totalNumHotkey) {
			displayType := DisplayVar[A_Index - totalNumHotkey]
		} else {
			if (A_Index > LGNumHotkeys) {
                displayType := LGDisplayVar2[A_Index - LGNumHotkeys]
            } else {
                displayType := LGDisplayVar[A_Index]
            }
		}
        
        Gui, EditGui: Font, s10 Bold Underline, Segoe UI
        ; Creates two sections - Semantics and Tools
        if (A_Index == 1 && A_Index <= LGNumHotkeys) {
            groupH := LGNumHotkeys * 31
            Gui, EditGui: Add, Groupbox, xp+%semanticSectionX% yp+%semanticSectionY% w455 h%groupH% section, Semantics
        } else if (A_Index == (LGNumHotkeys + 1) && A_Index > LGNumHotkeys) {
            groupH := (LGNumHotkeysA + NumHotkeys) * 29
            if (!LGNumHotkeys) {
                Gui, EditGui: Add, Groupbox, xm+%editToolsPos% yp+10 w%editToolsWidth% h%groupH% section, Tools
            } else {
                Gui, EditGui: Add, Groupbox, xp+130 ys w%editToolsWidth% h%groupH% section, Tools
            }
        }

        Gui, EditGui: Font, s10 Normal, Segoe UI
		
		if (A_Index <= totalNumHotkey) {
            Gui, EditGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (LG) %displayType%
        } else {
            Gui, EditGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc) %displayType%
        }

        Gui, EditGui: Font, s8 Normal, Segoe UI
        Gui, EditGui: Add, Edit, Disabled vLGHotkeyName1%A_Index% w%editWidth% xp+155 yp
     

		
        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, xp+140 yp, Not customizable
        
        } else {
            Gui, EditGui: Add, Button, gBind1 v3Bind1%A_Index% xp+140 yp, Set Primary  
            Gui, EditGui: Add, Button, gReset v3Reset%A_Index% xp+75 yp, Reset Key
        }
    }
    return
}

drawEditSVASEGUI() {
    global
    totalNumHotkey := SVASENumHotkeys
    Loop % (totalNumHotkey + NumHotkeys){
        if (A_Index > totalNumHotkey) {
			displayType := DisplayVar[A_Index - totalNumHotkey]
		} else {
            displayType := SVASEDisplayVar[A_Index]
		}

        Gui, EditGui: Font, s10 Bold Underline, Segoe UI
        ; Creates two sections - Semantics and Tools
        if (A_Index == 1 && A_Index <= SVASENumHotkeys) {
            groupH := SVASENumHotkeys * 31
            Gui, EditGui: Add, Groupbox, xp+%semanticSectionX% yp+%semanticSectionY% w455 h%groupH% section, Semantics
        } else if (A_Index == (SVASENumHotkeys + 1) && A_Index > SVASENumHotkeys) {
            groupH := NumHotkeys * 29
            if (!SVASENumHotkeys) {
                Gui, EditGui: Add, Groupbox, xm+%editToolsPos% yp+%semanticSectionY% w%editToolsWidth% h%groupH% section, Tools
            } else {
                Gui, EditGui: Add, Groupbox, xp+100 ys w%editToolsWidth% h%groupH% section, Tools
            }
        }

        Gui, EditGui: Font, s10 Normal, Segoe UI
		
		if (A_Index <= totalNumHotkey) {
            Gui, EditGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (SVASE) %displayType%
        } else {
            Gui, EditGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc) %displayType%
        }

        Gui, EditGui: Font, s8, Segoe UI
		if (A_Index > SVASENumHotkeys) {
			Gui, EditGui: Add, Edit, Disabled vSVASEHotkeyName1%A_Index% w%editWidth% xp+155 yp
		} else {
			Gui, EditGui: Add, Edit, Disabled vSVASEHotkeyName1%A_Index% w%editWidth% xp+155 yp
		}
     

		
        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, xp+140 yp, Not customizable
        
        } else {
            Gui, EditGui: Add, Button, gBind1 v4Bind1%A_Index% xp+140 yp, Set Primary  
            Gui, EditGui: Add, Button, gReset v4Reset%A_Index% xp+75 yp, Reset Key
        }
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

        Gui, EditGui: Font, s10 Bold Underline, Segoe UI
        ; Creates two sections - Semantics and Tools
        if (A_Index == 1 && A_Index <= CuboidsNumHotkeys) {
            groupH := CuboidsNumHotkeys * 29
            Gui, EditGui: Add, Groupbox, xp+%semanticSectionX% yp+%semanticSectionY% w445 h%groupH% section, Semantics
        } else if (A_Index == (CuboidsNumHotkeys + 1) && A_Index > CuboidsNumHotkeys) {
            groupH := (CuboidsNumHotkeysA + NumHotkeys) * 29
            if (!CuboidsNumHotkeys) {
                Gui, EditGui: Add, Groupbox, xm+%editToolsPos% yp+10 w%editToolsWidth% h%groupH% section, Tools
            } else {
                Gui, EditGui: Add, Groupbox, xp+95 ys w%editToolsWidth% h%groupH% section, Tools
            }
        }

        Gui, EditGui: Font, s10 Normal, Segoe UI
		
		if (A_Index <= totalNumHotkey) {
            Gui, EditGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Cuboids) %displayType%
        } else {
            Gui, EditGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc) %displayType%
        }

        Gui, EditGui: Font, s8, Segoe UI
        Gui, EditGui: Add, Edit, Disabled vCuboidsHotkeyName1%A_Index% w%editWidth% xp+155 yp
     

		
        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, xp+140 yp, Not customizable
        
        } else {
            Gui, EditGui: Add, Button, gBind1 v5Bind1%A_Index% xp+140 yp, Set Primary  
            Gui, EditGui: Add, Button, gReset v5Reset%A_Index% xp+75 yp, Reset Key
        }
    }
    return
}

destroyEditGUI() {
    global
    editText := ""
	EnableHotkeys()
	Gui, EditGui: Destroy ; We cannot recreate the same gui. We must destroy or redisplay it.
	;Reload
    return
}
