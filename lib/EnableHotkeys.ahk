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
			if ((hkp != "") && status == 0){
				;FileAppend ENABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(LIHotkeyList[A_Index])
				if (A_Index != (LINumHotkeys + NumHotkeys)) {
					;prefix := BuildPrefix(LIHotkeyList[A_Index])
					;Msgbox % "ADDING: " prefix "," hk
					hotkey, %prefix%%hkp%, DoHotkey1, ON
					;hotkey, %prefix%%hks%, DoHotkey%A_Index%, ON
				} else {
					if (specialCheck == 2) {
						hotkey, %hkp%, TeamsMute, ON
					} else {
						hotkey, %hkp%, DoHotkey1, ON
					}
				}
				LIHotkeyList[A_Index].status := 1
			}
		}
	} else if (workflowCheck == "RE") {
		Loop % (RENumHotkeys + NumHotkeys){ ; ALways enable global
			status := REHotkeyList[A_Index].status
			hkp := REHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 0){
				;FileAppend ENABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(REHotkeyList[A_Index])
				if (A_Index != (RENumHotkeys + NumHotkeys)) {
					;prefix := BuildPrefix(REHotkeyList[A_Index])
					;Msgbox % "ADDING: " prefix "," hk
					hotkey, %prefix%%hkp%, DoHotkey2, ON
					;hotkey, %prefix%%hks%, DoHotkey%A_Index%, ON
				} else {
					if (specialCheck == 2) {
						hotkey, %hkp%, TeamsMute, ON
					} else {
						hotkey, %hkp%, DoHotkey2, ON
					}
				}
				
				REHotkeyList[A_Index].status := 1
			}
		}
	} else if (workflowCheck == "LG") {
		Loop % (LGNumHotkeys + NumHotkeys){ ; ALways enable global
			status := LGHotkeyList[A_Index].status
			hkp := LGHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 0){
				;FileAppend ENABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(LGHotkeyList[A_Index])
				if (A_Index != (LGNumHotkeys + NumHotkeys)) {
					;prefix := BuildPrefix(LGHotkeyList[A_Index])
					;Msgbox % "ADDING: " prefix "," hk
					hotkey, %prefix%%hkp%, DoHotkey3, ON
					;hotkey, %prefix%%hks%, DoHotkey%A_Index%, ON

				} else {
					if (specialCheck == 2) {
						hotkey, %hkp%, TeamsMute, ON
					} else {
						hotkey, %hkp%, DoHotkey3, ON
					}
				}
				
				LGHotkeyList[A_Index].status := 1
			}
		}
	} else if (workflowCheck == "SVA/SE") {
		Loop % (SVASENumHotkeys + NumHotkeys){ ; ALways enable global
			status := SVASEHotkeyList[A_Index].status
			hkp := SVASEHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 0){
				;FileAppend ENABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(SVASEHotkeyList[A_Index])
				if (A_Index != (SVASENumHotkeys + NumHotkeys)) {
					;prefix := BuildPrefix(SVASEHotkeyList[A_Index])
					;Msgbox % "ADDING: " prefix "," hk
					hotkey, %prefix%%hkp%, DoHotkey4, ON
				} else {
					if (specialCheck == 2) {
						hotkey, %hkp%, TeamsMute, ON
					} else {
						hotkey, %hkp%, DoHotkey4, ON
					}
				}
				SVASEHotkeyList[A_Index].status := 1
			}
		}
	} else if (workflowCheck == "Cuboids") {
		Loop % (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys){ ; ALways enable global
			status := CuboidsHotkeyList[A_Index].status
			hkp := CuboidsHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 0){
				;FileAppend ENABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(CuboidsHotkeyList[A_Index])
				if (A_Index != (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys)) {
					;prefix := BuildPrefix(CuboidsHotkeyList[A_Index])
					;Msgbox % "ADDING: " prefix "," hk
					hotkey, %prefix%%hkp%, DoHotkey5, ON
					;hotkey, %prefix%%hks%, DoHotkey%A_Index%, ON
				} else {
					if (specialCheck == 2) {
						hotkey, %hkp%, TeamsMute, ON
					} else {
						hotkey, %hkp%, DoHotkey5, ON
					}
				}
				CuboidsHotkeyList[A_Index].status := 1
			}
		}
	}
	
	return
}