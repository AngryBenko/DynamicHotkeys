; Disables User-Defined Hotkeys
DisableHotkeys(){
	if (prevWFCheck == "Line" || workflowCheck == "Line") {
		Loop % (LINumHotkeys + NumHotkeys){ ; global
			status := LIHotkeyList[A_Index].status
			hkp := LIHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				;FileAppend DISABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(LIHotkeyList[A_Index])
				if (A_Index != (LINumHotkeys + NumHotkeys)) {
					;Msgbox % "REMOVING: " prefix "," hk
					;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, OFF
					hotkey, %prefix%%hkp%, DoHotkey1, OFF
				} else {
					if (specialCheck == 2) {
						hotkey, %hkp%, TeamsMute, OFF
					}
					hotkey, %hkp%, DoHotkey1, OFF
				}	
				LIHotkeyList[A_Index].status := 0
			}
		}
	}
	
	if (prevWFCheck == "RE" || workflowCheck == "RE") {
		Loop % (RENumHotkeys + NumHotkeys){ ; global
			status := REHotkeyList[A_Index].status
			hkp := REHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				;FileAppend DISABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(REHotkeyList[A_Index])
				if (A_Index != (RENumHotkeys + NumHotkeys)) {
					;Msgbox % "REMOVING: " prefix "," hk
					;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, OFF
					hotkey, %prefix%%hkp%, DoHotkey2, OFF
					;hotkey, %hk%, DoHotkey%A_Index%, OFF
				} else {
					if (specialCheck == 2) {
						hotkey, %hkp%, TeamsMute, OFF
					}
					hotkey, %hkp%, DoHotkey2, OFF
				}
				REHotkeyList[A_Index].status := 0
			}
		}
	}

	if (prevWFCheck == "LG" || workflowCheck == "LG") {
		Loop % (LGNumHotkeys + NumHotkeys){ ; global
			status := LGHotkeyList[A_Index].status
			hkp := LGHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				;FileAppend DISABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(LGHotkeyList[A_Index])
				if (A_Index != (LGNumHotkeys + NumHotkeys)) {
					;Msgbox % "REMOVING: " prefix "," hk
					;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, OFF
					hotkey, %prefix%%hkp%, DoHotkey3, OFF
					;hotkey, %hk%, DoHotkey%A_Index%, OFF
				} else {
					if (specialCheck == 2) {
						hotkey, %hkp%, TeamsMute, OFF
					}
					hotkey, %hkp%, DoHotkey3, OFF
				}
				LGHotkeyList[A_Index].status := 0
			}
		}
	}

	if (prevWFCheck == "SVA/SE" || workflowCheck == "SVA/SE") {
		Loop % (SVASENumHotkeys + NumHotkeys){ ; global
			status := SVASEHotkeyList[A_Index].status
			hkp := SVASEHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				;FileAppend DISABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(SVASEHotkeyList[A_Index])
				if (A_Index != (SVASENumHotkeys + NumHotkeys)) {
					;Msgbox % "REMOVING: " prefix "," hk
					;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, OFF
					hotkey, %prefix%%hkp%, DoHotkey4, OFF
					;hotkey, %hk%, DoHotkey%A_Index%, OFF
				} else {
					if (specialCheck == 2) {
						hotkey, %hkp%, TeamsMute, OFF
					}
					hotkey, %hkp%, DoHotkey4, OFF
				}
				SVASEHotkeyList[A_Index].status := 0
			}
		}
	}
	
	if (prevWFCheck == "Cuboids" || workflowCheck == "Cuboids") {
		Loop % (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys){ ; global
			status := CuboidsHotkeyList[A_Index].status
			hkp := CuboidsHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				;FileAppend DISABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(CuboidsHotkeyList[A_Index])
				if (A_Index != (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys)) {
					;Msgbox % "REMOVING: " prefix "," hk
					;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, OFF
					hotkey, %prefix%%hkp%, DoHotKey5, OFF
					;hotkey, %hk%, DoHotkey%A_Index%, OFF
				} else {
					if (specialCheck == 2) {
						hotkey, %hkp%, TeamsMute, OFF
					}
					hotkey, %hkp%, DoHotKey5, OFF
				}
				CuboidsHotkeyList[A_Index].status := 0
			}
		}
	}

	return
}