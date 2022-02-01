; Disables User-Defined Hotkeys
DisableHotkeys(){
	Loop % globalNumHotkeys {
		status := globalHotkeyList[A_Index].status
			hkp := globalHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				prefix := BuildPrefix(globalHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey6, OFF
				globalHotkeyList[A_Index].status := 0
			}
	}
	
	if (prevWFCheck == "Line" || workflowCheck == "Line") {
		Loop % (LINumHotkeys + NumHotkeys){ ; global
			status := LIHotkeyList[A_Index].status
			hkp := LIHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				prefix := BuildPrefix(LIHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey1, OFF
				LIHotkeyList[A_Index].status := 0
			}
		}
	}
	
	if (prevWFCheck == "RE" || workflowCheck == "RE") {
		Loop % (RENumHotkeys + NumHotkeys){ ; global
			status := REHotkeyList[A_Index].status
			hkp := REHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				prefix := BuildPrefix(REHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey2, OFF
				REHotkeyList[A_Index].status := 0
			}
		}
	}

	if (prevWFCheck == "LG" || workflowCheck == "LG") {
		Loop % (LGNumHotkeys + LGNumHotkeysA + NumHotkeys){ ; global
			status := LGHotkeyList[A_Index].status
			hkp := LGHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				prefix := BuildPrefix(LGHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey3, OFF
				LGHotkeyList[A_Index].status := 0
			}
		}
	}

	if (prevWFCheck == "SVA/SE" || workflowCheck == "SVA/SE") {
		Loop % (SVASENumHotkeys + NumHotkeys){ ; global
			status := SVASEHotkeyList[A_Index].status
			hkp := SVASEHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				prefix := BuildPrefix(SVASEHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey4, OFF
				SVASEHotkeyList[A_Index].status := 0
			}
		}
	}
	
	if (prevWFCheck == "Cuboids" || workflowCheck == "Cuboids") {
		Loop % (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys){ ; global
			status := CuboidsHotkeyList[A_Index].status
			hkp := CuboidsHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 1){
				prefix := BuildPrefix(CuboidsHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotKey5, OFF
				CuboidsHotkeyList[A_Index].status := 0
			}
		}
	}

	return
}