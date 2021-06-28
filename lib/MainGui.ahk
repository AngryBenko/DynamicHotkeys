; Try to separate main gui from secondary gui
; ModCheck was removed to allow customize modifiers

drawMainGUI() {
    global

    firstColumn := 5
    secondColumn := guiColumnPos()
    editWidth := 130
    descWidth := editWidth + 10
    workflowPos := secondColumn + 150

    general := "Welcome to "
    general .= title
    general .= "!`n"
    general .= "Please select the appropriate workflow from the dropdow box on the right`n"
    general .= "Press the shortcuts below to apply types or to select tool.`n"
    general .= "To edit/setup shortcuts, go to File -> Edit Keybinds."
    important := "Please do not close this window for the script to work in the background!"

    drawHeaderGUI()
    ;xOffset := StrLen(workflowCheck)
    drawMainWorkflowGUI()

    Gui, MainGui: +Resize -MaximizeBox
	Gui, MainGui: Show, Center w%width% h%height% , %Title%
	Menu, Tray, Add, Show Window, DisplayWindow
	;Menu, Tray, Icon, 3dlego.ico
    return
}

drawHeaderGUI() {
	global

    ;Menu, FileMenu, Add, Minimize on Close, MinClose
	Menu, FileMenu, Add, Edit Keybinds, 2ndGui
    Menu, FileMenu, Add, Always on Top, ATop
	Menu, FileMenu, Add, Reload Script, Reload
	Menu, MyMenuBar, Add, &File, :FileMenu
	Menu, MyMenuBar, Add, &Help, Help
    Gui, MainGui: Default
	Gui, MainGui: Menu, MyMenuBar
	Gui, MainGui: Font, s9 normal, Segoe UI
	Gui, MainGui: Add, Text,, %general%

	Gui, MainGui: Font, s9 bold, Segoe UI
	Gui, MainGui: Add, Text, xp+%workflowPos% cBlack , Workflow:
	Gui, MainGui: Add, DropDownList, vWorkflow gWorkflow ym, Line|RE|LG|SVA/SE|Cuboids
    
	Gui, MainGui: Font, s10 bold, Segoe UI
	Gui, MainGui: Add, Text, cBlack xm , %important%
	Gui, MainGui: Font, s10 normal, Segoe UI
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
    /*
    if (minclosecheck) {
        Menu, FileMenu, Check, Minimize on Close
    } else {
        Menu, FileMenu, UnCheck, Minimize on Close
    }
    */
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
        
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index <= LINumHotkeys) {
            Gui, MainGui: Add, Text, x%firstColumn%, (Lines)
        } else {
            if (!LINumHotkeys) {
                Gui, MainGui: Add, Text, x%firstColumn%, (Misc)
            } else {
                Gui, MainGui: Add, Text, x%secondColumn% y%ypos%, (Misc)
            }
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vLIHotkeyName1%A_Index% w%editWidth% xp+65 , None
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index != LINumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack xp+%descWidth%, %displayType%
        } else {
            Gui, MainGui: Add, DropDownList, vSpecialChoice gSpecialChoice AltSubmit xp+%descWidth%, Custom|MSTeam Mute
        }

        if (A_Index >= LINumHotkeys) {
            ypos += 27
        }
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

        if (A_Index <= RENumHotkeys) {
            Gui, MainGui: Add, Text, x%firstColumn%, (RE)
        } else {
            if (!RENumHotkeys) {
                Gui, MainGui: Add, Text, x%firstColumn%, (Misc)
            } else {
                Gui, MainGui: Add, Text, x%secondColumn% y%ypos%, (Misc)
            }
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vREHotkeyName1%A_Index% w%editWidth% xp+65, None ; xp is the base
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index != RENumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack xp+%descWidth%, %displayType%
        } else {
            Gui, MainGui: Add, DropDownList, vSpecialChoice gSpecialChoice AltSubmit xp+%descWidth%, Custom|MSTeam Mute
        }

        if (A_Index >= RENumHotkeys) {
            ypos += 27
        }
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

        if (A_Index <= LGNumHotkeys) {
            Gui, MainGui: Add, Text, x%firstColumn%, (LG)
        } else {
            if (!LGNumHotkeys) {
                Gui, MainGui: Add, Text, x%firstColumn%, (Misc)
            } else {
                Gui, MainGui: Add, Text, x%secondColumn% y%ypos%, (Misc)
            }
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vLGHotkeyName1%A_Index% w%editWidth% xp+65, None ; xp is the base
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index != LGNumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack xp+%descWidth%, %displayType%
        } else {
            Gui, MainGui: Add, DropDownList, vSpecialChoice gSpecialChoice AltSubmit xp+%descWidth%, Custom|MSTeam Mute
        }

        if (A_Index >= LGNumHotkeys) {
            ypos += 27
        }
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

        if (A_Index <= SVASENumHotkeys) {
            Gui, MainGui: Add, Text, x%firstColumn%, (SVASE)
        } else {
            if (!SVASENumHotkeys) {
                Gui, MainGui: Add, Text, x%firstColumn%, (Misc)
            } else {
                Gui, MainGui: Add, Text, x%secondColumn% y%ypos%, (Misc)
            }
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vSVASEHotkeyName1%A_Index% w%editWidth% xp+65, None ; xp is the base
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index != SVASENumHotkeys + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack xp+%descWidth%, %displayType%
        } else {
            Gui, MainGui: Add, DropDownList, vSpecialChoice gSpecialChoice AltSubmit xp+%descWidth%, Custom|MSTeam Mute
        }

        if (A_Index >= SVASENumHotkeys) {
            ypos += 27
        }
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

        Gui, MainGui: Font, s10 Normal, Segoe UI

        if (A_Index <= CuboidsNumHotkeys) {
            Gui, MainGui: Add, Text, x%firstColumn%, (Cuboids)
        } else {
            if (!CuboidsNumHotkeys) {
                Gui, MainGui: Add, Text, x%firstColumn%, (Misc)
            } else {
                if (A_Index > totalNumHotkey) {
                    Gui, MainGui: Add, Text, x%secondColumn% y%ypos%, (Misc)
                } else {
                    Gui, MainGui: Add, Text, x%secondColumn% y%ypos%, (Cuboids)
                }
            }
        }

        Gui, MainGui: Font, s8, Segoe UI
        Gui, MainGui: Add, Edit, Disabled vCuboidsHotkeyName1%A_Index% w%editWidth% xp+65, None ; xp is the base
        Gui, MainGui: Font, s10, Segoe UI

        if (A_Index != totalNumHotkey + NumHotkeys) {
            Gui, MainGui: Add, Text, cBlack xp+%descWidth%, %displayType%
        } else {
            Gui, MainGui: Add, DropDownList, vSpecialChoice gSpecialChoice AltSubmit xp+%descWidth%, Custom|MSTeam Mute
        }

        if (A_Index >= CuboidsNumHotkeys) {
            ypos += 27
        }
    }
    return
}

destroyMainGUI() {
	global
	ypos := 67
    general := ""
	Gui, MainGui: Destroy
	return
}