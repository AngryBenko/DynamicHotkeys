drawEditGUI() {
    global
	
	firstColumn := 5
    secondColumn := guiColumnPos() + 150
	if(workflowCheck == "SVA/SE") {
		editGuiWidth := width
	} else {
		editGuiWidth := width + 250
	}
	
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
	Gui, EditGui: Add, Text, cBlack yp+45 x185, 
    Gui, EditGui: -MinimizeBox +Resize
	ypos := 45

    drawEditWorkflowGUI()

    Gui, EditGui: Add, Button, gCloseEdit vCloseEdit xp+25 yp+35, Save
    Gui, EditGui: Show, Center w%editGuiWidth% h%height% x%xx% y%yy%, Edit Keybinds

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
    totalNumHotkey := LINumHotkeys
    Loop % (totalNumHotkey + NumHotkeys){
        if (A_Index > totalNumHotkey) {
			displayType := DisplayVar[A_Index - totalNumHotkey]
		} else {
            displayType := LIDisplayVar[A_Index]
		}

        Gui, EditGui: Font, s10, Segoe UI
		
		if (A_Index <= LINumHotkeys) {
            Gui, EditGui: Add, Text, x%firstColumn%, (Lines) %displayType%
        } else {
            if (!LINumHotkeys) {
                Gui, EditGui: Add, Text, x%firstColumn%, (Misc) %displayType%
            } else {
                if (A_Index > totalNumHotkey) {
					if (A_Index = (totalNumHotkey + NumHotkeys)) {
						Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Special)
					} else {
						Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Misc) %displayType%
					}
                } else {
                    Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Lines) %displayType%
                }
            }
        }

        Gui, EditGui: Font, s8, Segoe UI
		if (A_Index > LINumHotkeys) {
			Gui, EditGui: Add, Edit, Disabled vLIHotkeyName1%A_Index% w%editWidth% xp+155, None
		} else {
			Gui, EditGui: Add, Edit, Disabled vLIHotkeyName1%A_Index% w%editWidth% xp+275, None
		}
        Gui, EditGui: Font,, 

		
        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+140, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v1Bind1%A_Index% xp+140, Set Primary  
            Gui, EditGui: Add, Button, gReset v1Reset%A_Index% xp+70, Reset Key
        }
		
		if (A_Index >= LINumHotkeys) {
            ypos += 27
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

        Gui, EditGui: Font, s10, Segoe UI
		
		if (A_Index <= RENumHotkeys) {
            Gui, EditGui: Add, Text, x%firstColumn%, (RE) %displayType%
        } else {
            if (!RENumHotkeys) {
                Gui, EditGui: Add, Text, x%firstColumn%, (Misc) %displayType%
            } else {
                if (A_Index > totalNumHotkey) {
					if (A_Index = (totalNumHotkey + NumHotkeys)) {
						Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Special)
					} else {
						Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Misc) %displayType%
					}
                } else {
                    Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (RE) %displayType%
                }
            }
        }

        Gui, EditGui: Font, s8, Segoe UI
		if (A_Index > RENumHotkeys) {
			Gui, EditGui: Add, Edit, Disabled vREHotkeyName1%A_Index% w%editWidth% xp+155, None
		} else {
			Gui, EditGui: Add, Edit, Disabled vREHotkeyName1%A_Index% w%editWidth% xp+175, None
		}
        Gui, EditGui: Font,, 

		
        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+140, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v2Bind1%A_Index% xp+140, Set Primary  
            Gui, EditGui: Add, Button, gReset v2Reset%A_Index% xp+70, Reset Key
        }
		
		if (A_Index >= RENumHotkeys) {
            ypos += 27
        }
    }
    return
}

drawEditLGGUI() {
    global
    totalNumHotkey := LGNumHotkeys
    Loop % (totalNumHotkey + NumHotkeys){
        if (A_Index > totalNumHotkey) {
			displayType := DisplayVar[A_Index - totalNumHotkey]
		} else {
            displayType := LGDisplayVar[A_Index]
		}

        Gui, EditGui: Font, s10, Segoe UI
		
		if (A_Index <= LGNumHotkeys) {
            Gui, EditGui: Add, Text, x%firstColumn%, (LG) %displayType%
        } else {
            if (!LGNumHotkeys) {
                Gui, EditGui: Add, Text, x%firstColumn%, (Misc) %displayType%
            } else {
                if (A_Index > totalNumHotkey) {
					if (A_Index = (totalNumHotkey + NumHotkeys)) {
						Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Special)
					} else {
						Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Misc) %displayType%
					}
                } else {
                    Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (LG) %displayType%
                }
            }
        }

        Gui, EditGui: Font, s8, Segoe UI
		if (A_Index > LGNumHotkeys) {
			Gui, EditGui: Add, Edit, Disabled vLGHotkeyName1%A_Index% w%editWidth% xp+155, None
		} else {
			Gui, EditGui: Add, Edit, Disabled vLGHotkeyName1%A_Index% w%editWidth% xp+155, None
		}
        Gui, EditGui: Font,, 

		
        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+140, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v3Bind1%A_Index% xp+140, Set Primary  
            Gui, EditGui: Add, Button, gReset v3Reset%A_Index% xp+70, Reset Key
        }
		
		if (A_Index >= LGNumHotkeys) {
            ypos += 27
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

        Gui, EditGui: Font, s10, Segoe UI
		
		if (A_Index <= SVASENumHotkeys) {
            Gui, EditGui: Add, Text, x%firstColumn%, (SVASE) %displayType%
        } else {
            if (!SVASENumHotkeys) {
                Gui, EditGui: Add, Text, x%firstColumn%, (Misc) %displayType%
            } else {
                if (A_Index > totalNumHotkey) {
					if (A_Index = (totalNumHotkey + NumHotkeys)) {
						Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Special)
					} else {
						Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Misc) %displayType%
					}
                } else {
                    Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (SVASE) %displayType%
                }
            }
        }

        Gui, EditGui: Font, s8, Segoe UI
		if (A_Index > SVASENumHotkeys) {
			Gui, EditGui: Add, Edit, Disabled vSVASEHotkeyName1%A_Index% w%editWidth% xp+155, None
		} else {
			Gui, EditGui: Add, Edit, Disabled vSVASEHotkeyName1%A_Index% w%editWidth% xp+155, None
		}
        Gui, EditGui: Font,, 

		
        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+140, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v4Bind1%A_Index% xp+140, Set Primary  
            Gui, EditGui: Add, Button, gReset v4Reset%A_Index% xp+70, Reset Key
        }
		
		if (A_Index >= SVASENumHotkeys) {
            ypos += 27
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

        Gui, EditGui: Font, s10, Segoe UI
		
		if (A_Index <= CuboidsNumHotkeys) {
            Gui, EditGui: Add, Text, x%firstColumn%, (Cuboids) %displayType%
        } else {
            if (!CuboidsNumHotkeys) {
                Gui, EditGui: Add, Text, x%firstColumn%, (Misc) %displayType%
            } else {
                if (A_Index > totalNumHotkey) {
					if (A_Index = (totalNumHotkey + NumHotkeys)) {
						Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Special)
					} else {
						Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Misc) %displayType%
					}
                } else {
                    Gui, EditGui: Add, Text, x%secondColumn% y%ypos%, (Cuboids) %displayType%
                }
            }
        }

        Gui, EditGui: Font, s8, Segoe UI
        Gui, EditGui: Add, Edit, Disabled vCuboidsHotkeyName1%A_Index% w%editWidth% xp+155, None
        Gui, EditGui: Font,, 

		
        if (A_Index < (totalNumHotkey + NumHotkeys) && A_Index > ((totalNumHotkey + NumHotkeys) - 3)) {
            Gui, EditGui: Font, s10 bold, Segoe UI
            Gui, EditGui: Add, text, cBlack xp+140, Not customizable
            Gui, EditGui: Font,,
        } else {
            Gui, EditGui: Add, Button, gBind1 v5Bind1%A_Index% xp+140, Set Primary  
            Gui, EditGui: Add, Button, gReset v5Reset%A_Index% xp+70, Reset Key
        }
		
		if (A_Index >= CuboidsNumHotkeys) {
            ypos += 27
        }
    }
    return
}

destoryEditGUI() {
    global
	ypos := 45
    editText := ""
	EnableHotkeys()
	Gui, EditGui: Destroy ; We cannot recreate the same gui. We must destroy or redisplay it.
	;Reload
    return
}