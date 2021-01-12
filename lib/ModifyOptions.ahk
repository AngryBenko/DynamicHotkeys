ModifyOptions() { ; modify options based on modCheck
	global HotkeyList
	global modCheck
	global NumHotkeys
	global specialCheck

	; Check for INI
	; 1 = Middle, 2 = Thumb1, 3 = Thumb2

	Loop % (LINumHotkeys + NumHotkeys) {
		tmphkp := LIHotkeyList[A_Index].hkp
		tmphks := LIHotkeyList[A_Index].hks
		; Add prevention of changing fixed hotkeys
		if (A_Index != (LINumHotkeys + NumHotkeys) && !(A_Index < (LINumHotkeys + NumHotkeys) && A_Index > ((LINumHotkeys + NumHotkeys) - 3))) {
			outhkp := ""
			outhks := ""
			;FileAppend BOTH: %A_Index% | %tmphkp% AND %tmphks%`n, *
			if (tmphkp != "" && tmphks != "") {
				tmphkp := substr(tmphkp, 12)
				tmphks := substr(tmphks, 12)
				outhkp := BuildHotkeyString(tmphkp, modCheck)
				outhks := BuildHotkeyString(tmphks, modCheck)
				LIHotkeyList[A_Index].hkp := outhkp
				LIHotkeyList[A_Index].hks := outhks

				LIHotkeyList[A_Index].typep := modCheck
				LIHotkeyList[A_Index].types := modCheck
			} else if (tmphkp != "") {
				tmphkp := substr(tmphkp, 12)
				outhkp := BuildHotkeyString(tmphkp, modCheck)
				LIHotkeyList[A_Index].hkp := outhkp
				LIHotkeyList[A_Index].typep := modCheck
			} else if (tmphks != ""){
				tmphks := substr(tmphks, 12)
				outhks := BuildHotkeyString(tmphks, modCheck)
				LIHotkeyList[A_Index].hks := outhks
				LIHotkeyList[A_Index].types := modCheck
			}
			; Now we have to update the hotkey list
		}
		
		;FileAppend outhkp: %outhkp%`n, *
		;FileAppend outhks: %outhks%`n, *
	}
	
	Loop % (RENumHotkeys + NumHotkeys) {
		tmphkp := REHotkeyList[A_Index].hkp
		tmphks := REHotkeyList[A_Index].hks
		; Add prevention of changing fixed hotkeys
		if (A_Index != (RENumHotkeys + NumHotkeys) && !(A_Index < (RENumHotkeys + NumHotkeys) && A_Index > ((RENumHotkeys + NumHotkeys) - 3))) {
			outhkp := ""
			outhks := ""
			;FileAppend BOTH: %A_Index% | %tmphkp% AND %tmphks%`n, *
			if (tmphkp != "" && tmphks != "") {
				tmphkp := substr(tmphkp, 12)
				tmphks := substr(tmphks, 12)
				outhkp := BuildHotkeyString(tmphkp, modCheck)
				outhks := BuildHotkeyString(tmphks, modCheck)
				REHotkeyList[A_Index].hkp := outhkp
				REHotkeyList[A_Index].hks := outhks

				REHotkeyList[A_Index].typep := modCheck
				REHotkeyList[A_Index].types := modCheck
			} else if (tmphkp != "") {
				tmphkp := substr(tmphkp, 12)
				outhkp := BuildHotkeyString(tmphkp, modCheck)
				REHotkeyList[A_Index].hkp := outhkp
				REHotkeyList[A_Index].typep := modCheck
			} else if (tmphks != ""){
				tmphks := substr(tmphks, 12)
				outhks := BuildHotkeyString(tmphks, modCheck)
				REHotkeyList[A_Index].hks := outhks
				REHotkeyList[A_Index].types := modCheck
			}
			; Now we have to update the hotkey list
		}
		
		;FileAppend outhkp: %outhkp%`n, *
		;FileAppend outhks: %outhks%`n, *
	}

	Loop % (LGNumHotkeys + NumHotkeys) {
		tmphkp := LGHotkeyList[A_Index].hkp
		tmphks := LGHotkeyList[A_Index].hks
		; Add prevention of changing fixed hotkeys
		if (A_Index != (LGNumHotkeys + NumHotkeys) && !(A_Index < (LGNumHotkeys + NumHotkeys) && A_Index > ((LGNumHotkeys + NumHotkeys) - 3))) {
			outhkp := ""
			outhks := ""
			;FileAppend BOTH: %A_Index% | %tmphkp% AND %tmphks%`n, *
			if (tmphkp != "" && tmphks != "") {
				tmphkp := substr(tmphkp, 12)
				tmphks := substr(tmphks, 12)
				outhkp := BuildHotkeyString(tmphkp, modCheck)
				outhks := BuildHotkeyString(tmphks, modCheck)
				LGHotkeyList[A_Index].hkp := outhkp
				LGHotkeyList[A_Index].hks := outhks

				LGHotkeyList[A_Index].typep := modCheck
				LGHotkeyList[A_Index].types := modCheck
			} else if (tmphkp != "") {
				tmphkp := substr(tmphkp, 12)
				outhkp := BuildHotkeyString(tmphkp, modCheck)
				LGHotkeyList[A_Index].hkp := outhkp
				LGHotkeyList[A_Index].typep := modCheck
			} else if (tmphks != ""){
				tmphks := substr(tmphks, 12)
				outhks := BuildHotkeyString(tmphks, modCheck)
				LGHotkeyList[A_Index].hks := outhks
				LGHotkeyList[A_Index].types := modCheck
			}
			; Now we have to update the hotkey list
		}
		
		;FileAppend outhkp: %outhkp%`n, *
		;FileAppend outhks: %outhks%`n, *
	}

	Loop % (SVASENumHotkeys + NumHotkeys) {
		tmphkp := SVASEHotkeyList[A_Index].hkp
		tmphks := SVASEHotkeyList[A_Index].hks
		; Add prevention of changing fixed hotkeys
		if (A_Index != (SVASENumHotkeys + NumHotkeys) && !(A_Index < (SVASENumHotkeys + NumHotkeys) && A_Index > ((SVASENumHotkeys + NumHotkeys) - 3))) {
			outhkp := ""
			outhks := ""
			;FileAppend BOTH: %A_Index% | %tmphkp% AND %tmphks%`n, *
			if (tmphkp != "" && tmphks != "") {
				tmphkp := substr(tmphkp, 12)
				tmphks := substr(tmphks, 12)
				outhkp := BuildHotkeyString(tmphkp, modCheck)
				outhks := BuildHotkeyString(tmphks, modCheck)
				SVASEHotkeyList[A_Index].hkp := outhkp
				SVASEHotkeyList[A_Index].hks := outhks

				SVASEHotkeyList[A_Index].typep := modCheck
				SVASEHotkeyList[A_Index].types := modCheck
			} else if (tmphkp != "") {
				tmphkp := substr(tmphkp, 12)
				outhkp := BuildHotkeyString(tmphkp, modCheck)
				SVASEHotkeyList[A_Index].hkp := outhkp
				SVASEHotkeyList[A_Index].typep := modCheck
			} else if (tmphks != ""){
				tmphks := substr(tmphks, 12)
				outhks := BuildHotkeyString(tmphks, modCheck)
				SVASEHotkeyList[A_Index].hks := outhks
				SVASEHotkeyList[A_Index].types := modCheck
			}
			; Now we have to update the hotkey list
		}
		
		;FileAppend outhkp: %outhkp%`n, *
		;FileAppend outhks: %outhks%`n, *
	}
	return
}