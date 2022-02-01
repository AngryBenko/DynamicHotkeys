EnableHotkeys(){

	;Enable based on workflow, workflowCheck

	Loop % globalNumHotkeys {
		status := globalHotkeyList[A_Index].status
		hkp := globalHotkeyList[A_Index].hkp
		if ((hkp != "") && status == 0){
				prefix := BuildPrefix(globalHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey6, ON
				globalHotkeyList[A_Index].status := 1
			}
	}

	if (workflowCheck == "Line") {
		Loop % (LINumHotkeys + NumHotkeys){ ; ALways enable global
			status := LIHotkeyList[A_Index].status
			hkp := LIHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 0){
				prefix := BuildPrefix(LIHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey1, ON
				LIHotkeyList[A_Index].status := 1
			}
		}

	} else if (workflowCheck == "RE") {
		Loop % (RENumHotkeys + NumHotkeys){ ; ALways enable global
			status := REHotkeyList[A_Index].status
			hkp := REHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 0){
				prefix := BuildPrefix(REHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey2, ON
				REHotkeyList[A_Index].status := 1
			}
		}
	} else if (workflowCheck == "LG") {
		Loop % (LGNumHotkeys + LGNumHotkeysA + NumHotkeys){ ; ALways enable global
			status := LGHotkeyList[A_Index].status
			hkp := LGHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 0){
				prefix := BuildPrefix(LGHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey3, ON
				LGHotkeyList[A_Index].status := 1
			}
		}
	} else if (workflowCheck == "SVA/SE") {
		Loop % (SVASENumHotkeys + NumHotkeys){ ; ALways enable global
			status := SVASEHotkeyList[A_Index].status
			hkp := SVASEHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 0){
				prefix := BuildPrefix(SVASEHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey4, ON
				SVASEHotkeyList[A_Index].status := 1
			}
		}

	} else if (workflowCheck == "Cuboids") {
		Loop % (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys){ ; ALways enable global
			status := CuboidsHotkeyList[A_Index].status
			hkp := CuboidsHotkeyList[A_Index].hkp
			if ((hkp != "") && status == 0){
				prefix := BuildPrefix(CuboidsHotkeyList[A_Index])
				hotkey, %prefix%%hkp%, DoHotkey5, ON
				CuboidsHotkeyList[A_Index].status := 1
			}
		}

	}

	if (disCamCheck) {
		; LINES
		hkp := LIHotkeyList[(LINumHotkeys + NumHotkeys) - 2].hkp
		hotkey, %prefix%%hkp%, DoHotkey1, OFF
		LIHotkeyList[(LINumHotkeys + NumHotkeys) - 2].status := 0

		hkp := LIHotkeyList[(LINumHotkeys + NumHotkeys) - 1].hkp
		hotkey, %prefix%%hkp%, DoHotkey1, OFF
		LIHotkeyList[(LINumHotkeys + NumHotkeys) - 1].status := 0
		
		; RE
		hkp := REHotkeyList[(RENumHotkeys + NumHotkeys) - 2].hkp
		hotkey, %prefix%%hkp%, DoHotkey2, OFF
		REHotkeyList[(RENumHotkeys + NumHotkeys) - 2].status := 0

		hkp := REHotkeyList[(RENumHotkeys + NumHotkeys) - 1].hkp
		hotkey, %prefix%%hkp%, DoHotkey2, OFF
		REHotkeyList[(RENumHotkeys + NumHotkeys) - 1].status := 0
		
		; LG
		hkp := LGHotkeyList[(LGNumHotkeys + LGNumHotkeysA + NumHotkeys) - 2].hkp
		hotkey, %prefix%%hkp%, DoHotkey3, OFF
		LGHotkeyList[(LGNumHotkeys + LGNumHotkeysA + NumHotkeys) - 2].status := 0

		hkp := LGHotkeyList[(LGNumHotkeys + LGNumHotkeysA + NumHotkeys) - 1].hkp
		hotkey, %prefix%%hkp%, DoHotkey3, OFF
		LGHotkeyList[(LGNumHotkeys + LGNumHotkeysA + NumHotkeys) - 1].status := 0

		; SVA/SE
		hkp := SVASEHotkeyList[(SVASENumHotkeys + NumHotkeys) - 2].hkp
		hotkey, %prefix%%hkp%, DoHotkey4, OFF
		SVASEHotkeyList[(SVASENumHotkeys + NumHotkeys) - 2].status := 0

		hkp := SVASEHotkeyList[(SVASENumHotkeys + NumHotkeys) - 1].hkp
		hotkey, %prefix%%hkp%, DoHotkey4, OFF
		SVASEHotkeyList[(SVASENumHotkeys + NumHotkeys) - 1].status := 0

		;CUBOIDS
		hkp := CuboidsHotkeyList[(CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) - 2].hkp
		hotkey, %prefix%%hkp%, DoHotkey5, OFF
		CuboidsHotkeyList[(CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) - 2].status := 0

		hkp := CuboidsHotkeyList[(CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) - 1].hkp
		hotkey, %prefix%%hkp%, DoHotkey5, OFF
		CuboidsHotkeyList[(CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) - 1].status := 0
	}
	
	return
}