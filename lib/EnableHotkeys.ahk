EnableHotkeys(){
	global HotkeyList
	global NumHotkeys
	global specialCheck
	global workflowCheck

	;Enable based on workflow, workflowCheck

	if (workflowCheck == "Line") {
		Loop % (LINumHotkeys + NumHotkeys){ ; ALways enable global
			status := LIHotkeyList[A_Index].status
			hkp := LIHotkeyList[A_Index].hkp
			hks := LIHotkeyList[A_Index].hks
			if ((hkp != "" || hks != "") && status == 0){
				;FileAppend ENABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(LIHotkeyList[A_Index])
				if (A_Index != (LINumHotkeys + NumHotkeys)) {
					if (hkp != "" && hks != "") {
						hotkey, %prefix%%hkp%, DoHotkey1, ON
						hotkey, %prefix%%hks%, DoHotkey1, ON
					} else if (hkp != "") {
						;prefix := BuildPrefix(LIHotkeyList[A_Index])
						;Msgbox % "ADDING: " prefix "," hk
						hotkey, %prefix%%hkp%, DoHotkey1, ON
						;hotkey, %prefix%%hks%, DoHotkey%A_Index%, ON
					} else if (hks != "") {
						;prefix := BuildPrefix(LIHotkeyList[A_Index])
						;Msgbox % "ADDING: " prefix "," hk
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, ON
						hotkey, %prefix%%hks%, DoHotkey1, ON
					}
				} else {
					if (hkp != "") {
						if (specialCheck == 2) {
							if (hks != "") {
								hotkey, %hkp% & %hks%, TeamsMute, ON
							} else {
								hotkey, %hkp%, TeamsMute, ON
							}
						} else {
							hotkey, %hkp%, DoHotkey1, ON
						}
						
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, ON
					}
				}
				LIHotkeyList[A_Index].status := 1
			}
		}
	} else if (workflowCheck == "RE") {
		Loop % (RENumHotkeys + NumHotkeys){ ; ALways enable global
			status := REHotkeyList[A_Index].status
			hkp := REHotkeyList[A_Index].hkp
			hks := REHotkeyList[A_Index].hks
			if ((hkp != "" || hks != "") && status == 0){
				;FileAppend ENABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(REHotkeyList[A_Index])
				if (A_Index != (RENumHotkeys + NumHotkeys)) {
					if (hkp != "" && hks != "") {
						hotkey, %prefix%%hkp%, DoHotkey2, ON
						hotkey, %prefix%%hks%, DoHotkey2, ON
					} else if (hkp != "") {
						;prefix := BuildPrefix(REHotkeyList[A_Index])
						;Msgbox % "ADDING: " prefix "," hk
						hotkey, %prefix%%hkp%, DoHotkey2, ON
						;hotkey, %prefix%%hks%, DoHotkey%A_Index%, ON
					} else if (hks != "") {
						;prefix := BuildPrefix(REHotkeyList[A_Index])
						;Msgbox % "ADDING: " prefix "," hk
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, ON
						hotkey, %prefix%%hks%, DoHotkey2, ON
					}
				} else {
					if (hkp != "") {
						if (specialCheck == 2) {
							if (hks != "") {
								hotkey, %hkp% & %hks%, TeamsMute, ON
							} else {
								hotkey, %hkp%, TeamsMute, ON
							}
						} else {
							hotkey, %hkp%, DoHotkey2, ON
						}
						
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, ON
					}
				}
				
				REHotkeyList[A_Index].status := 1
			}
		}
	} else if (workflowCheck == "LG") {
		Loop % (LGNumHotkeys + NumHotkeys){ ; ALways enable global
			status := LGHotkeyList[A_Index].status
			hkp := LGHotkeyList[A_Index].hkp
			hks := LGHotkeyList[A_Index].hks
			if ((hkp != "" || hks != "") && status == 0){
				;FileAppend ENABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(LGHotkeyList[A_Index])
				if (A_Index != (LGNumHotkeys + NumHotkeys)) {
					if (hkp != "" && hks != "") {
						hotkey, %prefix%%hkp%, DoHotkey3, ON
						hotkey, %prefix%%hks%, DoHotkey3, ON
					} else if (hkp != "") {
						;prefix := BuildPrefix(LGHotkeyList[A_Index])
						;Msgbox % "ADDING: " prefix "," hk
						hotkey, %prefix%%hkp%, DoHotkey3, ON
						;hotkey, %prefix%%hks%, DoHotkey%A_Index%, ON
					} else if (hks != "") {
						;prefix := BuildPrefix(LGHotkeyList[A_Index])
						;Msgbox % "ADDING: " prefix "," hk
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, ON
						hotkey, %prefix%%hks%, DoHotkey3, ON
					}
				} else {
					if (hkp != "") {
						if (specialCheck == 2) {
							if (hks != "") {
								hotkey, %hkp% & %hks%, TeamsMute, ON
							} else {
								hotkey, %hkp%, TeamsMute, ON
							}
						} else {
							hotkey, %hkp%, DoHotkey3, ON
						}
						
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, ON
					}
				}
				
				LGHotkeyList[A_Index].status := 1
			}
		}
	} else if (workflowCheck == "SVA/SE") {
		Loop % (SVASENumHotkeys + NumHotkeys){ ; ALways enable global
			status := SVASEHotkeyList[A_Index].status
			hkp := SVASEHotkeyList[A_Index].hkp
			hks := SVASEHotkeyList[A_Index].hks
			if ((hkp != "" || hks != "") && status == 0){
				;FileAppend ENABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(SVASEHotkeyList[A_Index])
				if (A_Index != (SVASENumHotkeys + NumHotkeys)) {
					if (hkp != "" && hks != "") {
						hotkey, %prefix%%hkp%, DoHotkey4, ON
						hotkey, %prefix%%hks%, DoHotkey4, ON
					} else if (hkp != "") {
						;prefix := BuildPrefix(SVASEHotkeyList[A_Index])
						;Msgbox % "ADDING: " prefix "," hk
						hotkey, %prefix%%hkp%, DoHotkey4, ON
						;hotkey, %prefix%%hks%, DoHotkey%A_Index%, ON
					} else if (hks != "") {
						;prefix := BuildPrefix(SVASEHotkeyList[A_Index])
						;Msgbox % "ADDING: " prefix "," hk
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, ON
						hotkey, %prefix%%hks%, DoHotkey4, ON
					}
				} else {
					if (hkp != "") {
						if (specialCheck == 2) {
							if (hks != "") {
								hotkey, %hkp% & %hks%, TeamsMute, ON
							} else {
								hotkey, %hkp%, TeamsMute, ON
							}
						} else {
							hotkey, %hkp%, DoHotkey4, ON
						}
						
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, ON
					}
				}
				SVASEHotkeyList[A_Index].status := 1
			}
		}
	} else if (workflowCheck == "Cuboids") {
		Loop % (CuboidsNumHotkeys + NumHotkeys){ ; ALways enable global
			status := CuboidsHotkeyList[A_Index].status
			hkp := CuboidsHotkeyList[A_Index].hkp
			hks := CuboidsHotkeyList[A_Index].hks
			if ((hkp != "" || hks != "") && status == 0){
				;FileAppend ENABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(CuboidsHotkeyList[A_Index])
				if (A_Index != (CuboidsNumHotkeys + NumHotkeys)) {
					if (hkp != "" && hks != "") {
						hotkey, %prefix%%hkp%, DoHotkey5, ON
						hotkey, %prefix%%hks%, DoHotkey5, ON
					} else if (hkp != "") {
						;prefix := BuildPrefix(CuboidsHotkeyList[A_Index])
						;Msgbox % "ADDING: " prefix "," hk
						hotkey, %prefix%%hkp%, DoHotkey5, ON
						;hotkey, %prefix%%hks%, DoHotkey%A_Index%, ON
					} else if (hks != "") {
						;prefix := BuildPrefix(CuboidsHotkeyList[A_Index])
						;Msgbox % "ADDING: " prefix "," hk
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, ON
						hotkey, %prefix%%hks%, DoHotkey5, ON
					}
				} else {
					if (hkp != "") {
						if (specialCheck == 2) {
							if (hks != "") {
								hotkey, %hkp% & %hks%, TeamsMute, ON
							} else {
								hotkey, %hkp%, TeamsMute, ON
							}
						} else {
							hotkey, %hkp%, DoHotkey5, ON
						}
						
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, ON
					}
				}
				CuboidsHotkeyList[A_Index].status := 1
			}
		}
	}
	
	return
}