; Try to separate main gui from secondary gui
; ModCheck was removed to allow customize modifiers

drawMainGUI() {
    global

    editWidth := 130
    descWidth := editWidth + 10
    workflowPos := guiColumnPos() + 150
	horizontalLineWidth := width - 20
    tabWidth := width - 20
    toolsWidth := 375
    toolsPos := width / 4
    semanticSectionX := 10
    semanticSectionY := 27
    descriptorX := 10
    descriptorY := 27

    general := "Welcome to "
    general .= title
    general .= "!`n"
    general .= "Please select the appropriate workflow from the dropdown box on the right`n"
    general .= "Press the shortcuts below to apply types or to select tool.`n"
    general .= "To edit/setup shortcuts, go to File -> Edit Keybinds."
    important := "Closing this window will minimize to tray. Right Click the icon -> Show Window to bring the window back."

    if (workflowCheck == "Line") {
        important .= "`nIf you are in the Lines workflow, there there is no way to select 'None' semantic. Always double check your semantics! Thank you!"
    }

    if (darkMode) {
        Gui, MainGui: Color, c202020
        Gui, MainGui: Font, cE0E0E0
    }

    drawHeaderGUI()
	menuAttr()
    ;xOffset := StrLen(workflowCheck)
    Gui, MainGui: Font, s9 Normal, Segoe UI
    ;Gui, MainGui: Add, Tab3, xp yp+10 w%tabWidth%, General
    Gui, MainGui: Add, Tab3, xp yp+10 w%tabWidth%, General|Advanced
    Gui, MainGui: Tab, 1

    drawMainWorkflowGUI()
    drawAdvancedMainGUI()

    Gui, MainGui: +Resize -MaximizeBox
	Gui, MainGui: Show, Center w%width% h%height% , %Title% ; width and height are determined by guiWidthModifier and guiHeightModifier in Utilities.ahk

    return
}

drawAdvancedMainGUI() {
    global
    Gui, MainGui: Tab, 2
    Gui, MainGui: Font, s10 Bold, Segoe UI
    Gui, MainGui: Add, GroupBox, w450 h200 Section, Custom Hotkeys ; First GUI Control
    Loop, % globalNumHotkeys {
        Gui, MainGui: Font, s8 Bold, Segoe UI
        Gui, MainGui: Add, Text, vShortCutName%A_Index% xs+10 yp+30, Shortcut Name %A_Index%
        Gui, MainGui: Font, s8 Normal, Segoe UI
        Gui, MainGui: Add, Edit, vGlobalName%A_Index% w%editWidth% Disabled xp+100
        
        ;=====================================================================
        ; When assign a hotkey to be replaced, it needs to go into HotKeyDistribution. Array association?
        Gui, MainGui: Add, Text, xp+150, =>
        Gui, MainGui: Add, Edit, vGlobalKey%A_Index% w%editWidth% Disabled xp+40 yp
    }
    return
}

drawHeaderGUI() {
	global

    Gui, MainGui: Default
	Gui, MainGui: Font, s9 normal, Segoe UI
	Gui, MainGui: Add, Text,, %general%

	Gui, MainGui: Font, s9 bold, Segoe UI
	Gui, MainGui: Add, Text, xp+%workflowPos% , Workflow:
	Gui, MainGui: Add, DropDownList, vWorkflow gWorkflow ym, Line|RE|LG|SVA/SE|Cuboids
    
	;Gui, MainGui: Font, s10 bold, Segoe UI
	Gui, MainGui: Add, Text, xm , %important%
	Gui, MainGui: Add, Text, xm w%horizontalLineWidth% 0x10 ; 0x10 is etched gray line
	Gui, MainGui: Font, s10 normal, Segoe UI
	return
}

menuAttr(){
	Menu, FileMenu, Add, Edit Keybinds, EditGui
    Menu, FileMenu, Add, Dark Mode, DarkMode
    Menu, FileMenu, Add, Disable Camera Support, DisableCamera
    Menu, FileMenu, Add, Always on Top, ATop
	Menu, FileMenu, Add, Reload Script, Reload
	Menu, FileMenu, Add, ScreenShareBlocker, ssBlocker
    ;Menu, FileMenu, Add, On-Screen Display Hotkeys, OSDToggle
	Menu, FileMenu, Add, 
	Menu, FileMenu, Add, Exit App, CloseApp

    Menu, HelpMenu, Add, Shortcut Key Reference, SCReference
    Menu, HelpMenu, Add, About, About
	
	Menu, MyMenuBar, Add, &File, :FileMenu
	Menu, MyMenuBar, Add, &Help, :HelpMenu
	
	Gui, MainGui: Menu, MyMenuBar

    if (darkMode) {
        ;Menu, MyMenuBar, Color, 0x121212
    }
	
	Menu, Tray, NoStandard
	Menu, Tray, Add, Show Window, DisplayWindow
	Menu, Tray, Add, Show ScreenShareBlocker, DisplaySSB
	Menu, Tray, Add,  
	Menu, Tray, Add, Exit Application, CloseApp
	Menu, Tray, Default, Show Window
	
	return
}

updateFileMenu() {
    if (atopcheck) {
		Menu, FileMenu, Check, Always on Top
		Gui, MainGui: +AlwaysOnTop
	} else {
		Menu, FileMenu, UnCheck, Always on Top
		Gui, MainGui: -AlwaysOnTop
	}
    
    if (disCamCheck) {
        Menu, FileMenu, Check, Disable Camera Support
    } else {
        Menu, FileMenu, UnCheck, Disable Camera Support
    }

    if (darkMode) {
        Menu, FileMenu, Check, Dark Mode
    } else {
        Menu, FileMenu, UnCheck, Dark Mode
    }
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
	} else if (workflowCheck == "Cuboids") {
        drawMainCuboidsGUI()
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
        
        Gui, MainGui: Font, s10 Bold Underline, Segoe UI
        ; Creates two sections - Semantics and Tools
        if (A_Index == 1 && A_Index <= LINumHotkeys) {
            groupH := LINumHotkeys * 29
            Gui, MainGui: Add, Groupbox, xp+%semanticSectionX% yp+%semanticSectionY% w435 h%groupH% section, Semantics
        } else if (A_Index == (LINumHotkeys + 1) && A_Index > LINumHotkeys) {
            groupH := NumHotkeys * 29
            if (!LINumHotkeys) {
                Gui, MainGui: Add, Groupbox, xm+%toolsPos% yp+10 w%toolsWidth% h%groupH% section, Tools
            } else {
                Gui, MainGui: Add, Groupbox, xp+240 ys w%toolsWidth% h%groupH% section, Tools
            }
        }

        Gui, MainGui: Font, s10 Normal, Segoe UI
        if (A_Index <= LINumHotkeys) {
            Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Lines)
        } else {
            if (!LINumHotkeys) {
                Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc)
            } else {
                Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc)
            }
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vLIHotkeyName1%A_Index% w%editWidth% xp+50 yp 
        Gui, MainGui: Font, s10, Segoe UI

        Gui, MainGui: Add, Text, xp+%descWidth% yp, %displayType%
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

        Gui, MainGui: Font, s10 Bold Underline, Segoe UI
        ; Creates two sections - Semantics and Tools
        if (A_Index == 1 && A_Index <= RENumHotkeys) {
            groupH := RENumHotkeys * 33
            Gui, MainGui: Add, Groupbox, xp+%semanticSectionX% yp+%semanticSectionY% w350 h%groupH% section, Semantics
        } else if (A_Index == (RENumHotkeys + 1) && A_Index > RENumHotkeys) {
            groupH := NumHotkeys * 29
            if (!RENumHotkeys) {
                Gui, MainGui: Add, Groupbox, xm+%toolsPos% yp+10 w350 w%toolsWidth% h%groupH% section, Tools
            } else {
                Gui, MainGui: Add, Groupbox, xp+155 ys w%toolsWidth% h%groupH% section, Tools
            }
        }
    
        Gui, MainGui: Font, s10 Normal, Segoe UI

        if (A_Index <= RENumHotkeys) {
            Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (RE)
        } else {
            if (!RENumHotkeys) {
                Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc)
            } else {
                Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc)
            }
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vREHotkeyName1%A_Index% w%editWidth% xp+50 yp ; xp is the base
        Gui, MainGui: Font, s10, Segoe UI

        Gui, MainGui: Add, Text, xp+%descWidth% yp, %displayType%
	}
	return
}


drawMainLGGUI() {
    global
    totalNumHotkey := LGNumHotkeys + LGNumHotkeysA
    Loop % (totalNumHotkey + NumHotkeys) {
        if (A_Index > totalNumHotkey) {
			displayType := DisplayVar[A_Index - totalNumHotkey]
		} else {
            if (A_Index > LGNumHotkeys) {
                displayType := LGDisplayVar2[A_Index - LGNumHotkeys]
            } else {
                displayType := LGDisplayVar[A_Index]
            }
		}

        Gui, MainGui: Font, s10 Bold Underline, Segoe UI
        ; Creates two sections - Semantics and Tools
        if (A_Index == 1 && A_Index <= LGNumHotkeys) {
            groupH := LGNumHotkeys * 33
            Gui, MainGui: Add, Groupbox, xp+%semanticSectionX% yp+%semanticSectionY% w325 h%groupH% section, Semantics
        } else if (A_Index == (LGNumHotkeys + 1) && A_Index > LGNumHotkeys) {
            groupH := (LGNumHotkeysA + NumHotkeys) * 29
            if (!LGNumHotkeys) {
                Gui, MainGui: Add, Groupbox, xm+%toolsPos% yp+10 w%toolsWidth% h%groupH% section, Tools
            } else {
                Gui, MainGui: Add, Groupbox, xp+130 ys w%toolsWidth% h%groupH% section, Tools
            }
        }

        Gui, MainGui: Font, s10 Normal, Segoe UI
        if (A_Index <= totalNumHotkey) { ; Add Semantics section
            Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (LG)
        } else {
            Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc)
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vLGHotkeyName1%A_Index% w%editWidth% xp+50 yp ; xp is the base
        Gui, MainGui: Font, s10, Segoe UI
        
        Gui, MainGui: Add, Text, xp+%descWidth% yp, %displayType%
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

        Gui, MainGui: Font, s10 Bold Underline, Segoe UI
        ; Creates two sections - Semantics and Tools
        if (A_Index == 1 && A_Index <= SVASENumHotkeys) {
            groupH := SVASENumHotkeys * 31
            Gui, MainGui: Add, Groupbox, xp+%semanticSectionX% yp+%semanticSectionY% w325 h%groupH% section, Semantics
        } else if (A_Index == (SVASENumHotkeys + 1) && A_Index > SVASENumHotkeys) {
            groupH := NumHotkeys * 29
            if (!SVASENumHotkeys) {
                Gui, MainGui: Add, Groupbox, xm+%toolsPos% yp+%semanticSectionY% w%toolsWidth% h%groupH% section, Tools
            } else {
                Gui, MainGui: Add, Groupbox, xp+130 ys w%toolsWidth% h%groupH% section, Tools
            }
        }

        Gui, MainGui: Font, s10 Normal, Segoe UI

        if (A_Index <= SVASENumHotkeys) {
            Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (SVASE)
        } else {
            Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc)
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vSVASEHotkeyName1%A_Index% w%editWidth% xp+50 ; xp is the base
        Gui, MainGui: Font, s10, Segoe UI

        Gui, MainGui: Add, Text, xp+%descWidth% yp, %displayType%
	}
	return
}

drawMainCuboidsGUI() {
    global
    totalNumHotkey := CuboidsNumHotkeys + CuboidsNumHotkeysA
    Loop % (totalNumHotkey + NumHotkeys) {
        if (A_Index > totalNumHotkey) {
			displayType := DisplayVar[A_Index - totalNumHotkey]
		} else {
            if (A_Index > CuboidsNumHotkeys) {
                displayType := CuboidsDisplayVar2[A_Index - CuboidsNumHotkeys]
            } else {
                displayType := CuboidsDisplayVar[A_Index]
            }
		}

        Gui, MainGui: Font, s10 Bold Underline, Segoe UI
        ; Creates two sections - Semantics and Tools
        if (A_Index == 1 && A_Index <= CuboidsNumHotkeys) {
            groupH := CuboidsNumHotkeys * 29
            Gui, MainGui: Add, Groupbox, xp+%semanticSectionX% yp+%semanticSectionY% w305 h%groupH% section, Semantics
        } else if (A_Index == (CuboidsNumHotkeys + 1) && A_Index > CuboidsNumHotkeys) {
            groupH := (CuboidsNumHotkeysA + NumHotkeys) * 29
            if(!CuboidsNumHotkeys) {
                Gui, MainGui: Add, Groupbox, xm+%toolsPos% yp+10 w%toolsWidth% h%groupH% section, Tools
            } else {
                Gui, MainGui: Add, Groupbox, xp+95 ys w%toolsWidth% h%groupH% section, Tools
            }
        }

        Gui, MainGui: Font, s10 Normal, Segoe UI

        if (A_Index <= CuboidsNumHotkeys) {
            Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Cuboids)
        } else {
            if (!CuboidsNumHotkeys) {
                Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc)
            } else {
                if (A_Index > totalNumHotkey) {
                    Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Misc)
                } else {
                    Gui, MainGui: Add, Text, xs+%descriptorX% yp+%descriptorY%, (Cuboids)
                }
            }
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vCuboidsHotkeyName1%A_Index% w%editWidth% xp+65 yp ; xp is the base
        Gui, MainGui: Font, s10, Segoe UI

        Gui, MainGui: Add, Text, xp+%descWidth% yp, %displayType%


    }
    return
}

destroyMainGUI() {
	global
    general := ""
	Gui, MainGui: Destroy
	Menu, Tray, DeleteAll
	Menu, FileMenu, DeleteAll
	return
}