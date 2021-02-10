; Disables User-Defined Hotkeys
DisableHotkeys(){
	if (prevWFCheck == "Line" || workflowCheck == "Line") {
		Loop % (LINumHotkeys + NumHotkeys){ ; global
			status := LIHotkeyList[A_Index].status
			hkp := LIHotkeyList[A_Index].hkp
			hks := LIHotkeyList[A_Index].hks
			if ((hkp != "" || hks != "") && status == 1){
				;FileAppend DISABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(LIHotkeyList[A_Index])
				if (A_Index != (LINumHotkeys + NumHotkeys)) {
					if (hkp != "" && hks != "") {
						;Msgbox % "REMOVING: " prefix "," hk
						hotkey, %prefix%%hkp%, DoHotkey1, OFF
						hotkey, %prefix%%hks%, DoHotkey1, OFF
						;hotkey, %prefix%%hks%, DoHotkey%A_Index%, OFF
						;hotkey, %hk%, DoHotkey%A_Index%, OFF
					} else if (hkp != "") {
						;Msgbox % "REMOVING: " prefix "," hk
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, OFF
						hotkey, %prefix%%hkp%, DoHotkey1, OFF
						;hotkey, %hk%, DoHotkey%A_Index%, OFF
					} else if (hks != "") {
						;FileAppend special: %hks%`n, *
						;hotkey, %hkp%, DoHotkey%A_Index%, OFF
						hotkey, %prefix%%hks%, DoHotkey1, OFF
					}
				} else {
					if (hkp != "") {
						if (specialCheck == 2) {
							if (hks != "") {
								hotkey, %hkp% & %hks%, TeamsMute, OFF
							} else {
								hotkey, %hkp%, TeamsMute, OFF
							}
						}
						hotkey, %hkp%, DoHotkey1, OFF
					}
				}
				
				
				LIHotkeyList[A_Index].status := 0
			}
		}
	}
	
	if (prevWFCheck == "RE" || workflowCheck == "RE") {
		Loop % (RENumHotkeys + NumHotkeys){ ; global
			status := REHotkeyList[A_Index].status
			hkp := REHotkeyList[A_Index].hkp
			hks := REHotkeyList[A_Index].hks
			if ((hkp != "" || hks != "") && status == 1){
				;FileAppend DISABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(REHotkeyList[A_Index])
				if (A_Index != (RENumHotkeys + NumHotkeys)) {
					if (hkp != "" && hks != "") {
						;Msgbox % "REMOVING: " prefix "," hk
						hotkey, %prefix%%hkp%, DoHotkey2, OFF
						hotkey, %prefix%%hks%, DoHotkey2, OFF
						;hotkey, %prefix%%hks%, DoHotkey%A_Index%, OFF
						;hotkey, %hk%, DoHotkey%A_Index%, OFF
					} else if (hkp != "") {
						;Msgbox % "REMOVING: " prefix "," hk
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, OFF
						hotkey, %prefix%%hkp%, DoHotkey2, OFF
						;hotkey, %hk%, DoHotkey%A_Index%, OFF
					} else if (hks != "") {
						;FileAppend special: %hks%`n, *
						;hotkey, %hkp%, DoHotkey%A_Index%, OFF
						hotkey, %prefix%%hks%, DoHotkey2, OFF
					}
				} else {
					if (hkp != "") {
						if (specialCheck == 2) {
							if (hks != "") {
								hotkey, %hkp% & %hks%, TeamsMute, OFF
							} else {
								hotkey, %hkp%, TeamsMute, OFF
							}
						}
						hotkey, %hkp%, DoHotkey2, OFF
					}
				}
				
				
				REHotkeyList[A_Index].status := 0
			}
		}
	}
	
	if (prevWFCheck == "LG" || workflowCheck == "LG") {
		Loop % (LGNumHotkeys + NumHotkeys){ ; global
			status := LGHotkeyList[A_Index].status
			hkp := LGHotkeyList[A_Index].hkp
			hks := LGHotkeyList[A_Index].hks
			if ((hkp != "" || hks != "") && status == 1){
				;FileAppend DISABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(LGHotkeyList[A_Index])
				if (A_Index != (LGNumHotkeys + NumHotkeys)) {
					if (hkp != "" && hks != "") {
						;Msgbox % "REMOVING: " prefix "," hk
						hotkey, %prefix%%hkp%, DoHotkey3, OFF
						hotkey, %prefix%%hks%, DoHotkey3, OFF
						;hotkey, %prefix%%hks%, DoHotkey%A_Index%, OFF
						;hotkey, %hk%, DoHotkey%A_Index%, OFF
					} else if (hkp != "") {
						;Msgbox % "REMOVING: " prefix "," hk
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, OFF
						hotkey, %prefix%%hkp%, DoHotkey3, OFF
						;hotkey, %hk%, DoHotkey%A_Index%, OFF
					} else if (hks != "") {
						;FileAppend special: %hks%`n, *
						;hotkey, %hkp%, DoHotkey%A_Index%, OFF
						hotkey, %prefix%%hks%, DoHotkey3, OFF
					}
				} else {
					if (hkp != "") {
						if (specialCheck == 2) {
							if (hks != "") {
								hotkey, %hkp% & %hks%, TeamsMute, OFF
							} else {
								hotkey, %hkp%, TeamsMute, OFF
							}
						}
						hotkey, %hkp%, DoHotkey3, OFF
					}
				}
				LGHotkeyList[A_Index].status := 0
			}
		}
	}
	
	if (prevWFCheck == "SVA/SE" || workflowCheck == "SVA/SE") {
		Loop % (SVASENumHotkeys + NumHotkeys){ ; global
			status := SVASEHotkeyList[A_Index].status
			hkp := SVASEHotkeyList[A_Index].hkp
			hks := SVASEHotkeyList[A_Index].hks
			if ((hkp != "" || hks != "") && status == 1){
				;FileAppend DISABLE`n, *
				;FileAppend hkp: %hkp%`n, *
				;FileAppend hks: %hks%`n, *
				prefix := BuildPrefix(SVASEHotkeyList[A_Index])
				if (A_Index != (SVASENumHotkeys + NumHotkeys)) {
					if (hkp != "" && hks != "") {
						;Msgbox % "REMOVING: " prefix "," hk
						hotkey, %prefix%%hkp%, DoHotkey4, OFF
						hotkey, %prefix%%hks%, DoHotkey4, OFF
						;hotkey, %prefix%%hks%, DoHotkey%A_Index%, OFF
						;hotkey, %hk%, DoHotkey%A_Index%, OFF
					} else if (hkp != "") {
						;Msgbox % "REMOVING: " prefix "," hk
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, OFF
						hotkey, %prefix%%hkp%, DoHotkey4, OFF
						;hotkey, %hk%, DoHotkey%A_Index%, OFF
					} else if (hks != "") {
						;FileAppend special: %hks%`n, *
						;hotkey, %hkp%, DoHotkey%A_Index%, OFF
						hotkey, %prefix%%hks%, DoHotkey4, OFF
					}
				} else {
					if (hkp != "") {
						if (specialCheck == 2) {
							if (hks != "") {
								hotkey, %hkp% & %hks%, TeamsMute, OFF
							} else {
								hotkey, %hkp%, TeamsMute, OFF
							}
						}
						hotkey, %hkp%, DoHotkey4, OFF
					}
				}
				SVASEHotkeyList[A_Index].status := 0
			}
		}
	}
	
	if (prevWFCheck == "Cuboids" || workflowCheck == "Cuboids") {
		Loop % (CuboidsNumHotkeys + NumHotkeys){ ; global
			status := CuboidsHotkeyList[A_Index].status
			hkp := CuboidsHotkeyList[A_Index].hkp
			hks := CuboidsHotkeyList[A_Index].hks
			if ((hkp != "" || hks != "") && status == 1){
				prefix := BuildPrefix(CuboidsHotkeyList[A_Index])
				if (A_Index != (CuboidsNumHotkeys + NumHotkeys)) {
					if (hkp != "" && hks != "") {
						;Msgbox % "REMOVING: " prefix "," hk
						hotkey, %prefix%%hkp%, DoHotkey5, OFF
						hotkey, %prefix%%hks%, DoHotkey5, OFF
						;hotkey, %prefix%%hks%, DoHotkey%A_Index%, OFF
						;hotkey, %hk%, DoHotkey%A_Index%, OFF
					} else if (hkp != "") {
						;Msgbox % "REMOVING: " prefix "," hk
						;hotkey, %prefix%%hkp%, DoHotkey%A_Index%, OFF
						hotkey, %prefix%%hkp%, DoHotkey5, OFF
						;hotkey, %hk%, DoHotkey%A_Index%, OFF
					} else if (hks != "") {
						;FileAppend special: %hks%`n, *
						;hotkey, %hkp%, DoHotkey%A_Index%, OFF
						hotkey, %prefix%%hks%, DoHotkey5, OFF
					}
				} else {
					if (hkp != "") {
						if (specialCheck == 2) {
							if (hks != "") {
								hotkey, %hkp% & %hks%, TeamsMute, OFF
							} else {
								hotkey, %hkp%, TeamsMute, OFF
							}
						}
						hotkey, %hkp%, DoHotkey5, OFF
					}
				}
				CuboidsHotkeyList[A_Index].status := 0
			}
		}
	}
	return
}