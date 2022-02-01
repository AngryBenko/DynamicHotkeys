quickToolTip(){
    testString := getToolTipText()
	ToolTip, %testString%,,,1 
	return
}

getToolTipText() {
    tempString := ""
    if (workflowCheck == "Line") { ; Lines
        LIIndex1 := (LINumHotkeys + NumHotkeys) - 2
        LIIndex2 := (LINumHotkeys + NumHotkeys) - 1
		Loop % (LINumHotkeys + NumHotkeys) {
            if (A_Index == LIIndex1 || A_Index == LIIndex2) {
                Continue
            }
            if (LIHotKeyList[A_Index].hkp != "") {
                tempString .= BuildHotKeyName(LIHotKeyList[A_Index].hkp, LIHotkeyList[A_Index].typep)

                if (A_Index > LINumHotkeys) {
                    displayType := DisplayVar[A_Index - LINumHotkeys]
                } else {
                    displayType := LIDisplayVar[A_Index]
                }
                tempString .= " | " displayType "`n"
            }
        }
	} else if (workflowCheck == "RE") { ; RE
        REIndex1 := (RENumHotkeys + NumHotkeys) - 2
		REIndex2 := (RENumHotkeys + NumHotkeys) - 1
        Loop % (RENumHotkeys + NumHotkeys) {
            if (A_Index == REIndex1 || A_Index == REIndex2) {
                Continue
            }
            if (REHotkeyList[A_Index].hkp != "") {
                tempString .= BuildHotKeyName(REHotkeyList[A_Index].hkp, REHotkeyList[A_Index].typep)

                if (A_Index > RENumHotkeys) {
                    displayType := DisplayVar[A_Index - RENumHotkeys]
                } else {
                    displayType := REDisplayVar[A_Index]
                }
                tempString .= " | " displayType "`n"
            }
        }
	} else if (workflowCheck == "LG") { ; LG
        totalNumHotkey := LGNumHotkeys + LGNumHotkeysA
        LGIndex1 := (LGNumHotkeys + LGNumHotkeysA + NumHotkeys) - 2
		LGIndex2 := (LGNumHotkeys + LGNumHotkeysA + NumHotkeys) - 1
        Loop % (totalNumHotkey + NumHotkeys) {
            if (A_Index == LGIndex1 || A_Index == LGIndex2) {
                Continue
            }
            if (LGHotkeyList[A_Index].hkp != "") {
                tempString .= BuildHotKeyName(LGHotkeyList[A_Index].hkp, LGHotkeyList[A_Index].typep)

                if (A_Index > totalNumHotkey) {
                    displayType := DisplayVar[A_Index - totalNumHotkey]
                } else {
                    if (A_Index > LGNumHotkeys) {
                        displayType := LGDisplayVar2[A_Index - LGNumHotkeys]
                    } else {
                        displayType := LGDisplayVar[A_Index]
                    }
                }
                tempString .= " | " displayType "`n"
            }
        }
	} else if (workflowCheck == "SVA/SE") { ; SVA/SE
        SVASEIndex1 := (SVASENumHotkeys + NumHotkeys) - 2
		SVASEIndex2 := (SVASENumHotkeys + NumHotkeys) - 1
        Loop % (SVASENumHotkeys + NumHotkeys) {
            if (A_Index == SVASEIndex1 || A_Index == SVASEIndex2) {
                Continue
            }
            if (SVASEHotkeyList[A_Index].hkp != "") {
                tempString .= BuildHotKeyName(SVASEHotkeyList[A_Index].hkp, SVASEHotkeyList[A_Index].typep)

                if (A_Index > SVASENumHotkeys) {
                    displayType := DisplayVar[A_Index - SVASENumHotkeys]
                } else {
                    displayType := SVASEDisplayVar[A_Index]
                }
                tempString .= " | " displayType "`n"
            }
        }
	} else if (workflowCheck == "Cuboids") {
        totalNumHotkey := CuboidsNumHotkeys + CuboidsNumHotkeysA
        CuboidsIndex1 := (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) - 2
		CuboidsIndex2 := (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) - 1
        Loop % (totalNumHotkey + NumHotkeys) {
            if (A_Index == CuboidsIndex1 || A_Index == CuboidsIndex2) {
                Continue
            }
            if (CuboidsHotkeyList[A_Index].hkp != "") {
                tempString .= BuildHotKeyName(CuboidsHotkeyList[A_Index].hkp, CuboidsHotkeyList[A_Index].typep)

                if (A_Index > totalNumHotkey) {
                    displayType := DisplayVar[A_Index - totalNumHotkey]
                } else {
                    if (A_Index > CuboidsNumHotkeys) {
                        displayType := CuboidsDisplayVar2[A_Index - CuboidsNumHotkeys]
                    } else {
                        displayType := CuboidsDisplayVar[A_Index]
                    }
                }
                tempString .= " | " displayType "`n"
            }
        }
    }

    Loop % 5 {
        ; Add advanced keybinds to tooltip
        if (globalHotkeyList[A_Index].hkp != "") {
            tempString .= BuildHotKeyName(globalHotkeyList[A_Index].hkp, globalHotkeyList[A_Index].typep)

            displayType := globalHotkeyDisplayVar[A_Index]

            tempString .= " | " displayType "`n"
        }
    }

    return tempString
}

removeToolTip() {
	ToolTip,,,,1
	return
}