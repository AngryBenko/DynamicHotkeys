; Write settings to the INI
SaveSettings(){
	;iniwrite, %swapCheck%, %ININame%, Version, swap
	;iniwrite, %laptopCheck%, %ININame%, Version, laptop
	iniwrite, %modCheck%, %ININame%, Version, radio
	iniwrite, %specialCheck%, %ININame%, Version, special
	iniwrite, %workflowCheck%, %ININame%, Version, workflow

	if (workflowCheck == "Line" || firstRun == 1) {
		Loop % (LINumHotkeys + NumHotkeys) {
			hkp := LIHotkeyList[A_Index].hkp
			typep := LIHotkeyList[A_Index].typep
			hks := LIHotkeyList[A_Index].hks
			types := LIHotkeyList[A_Index].types

			iniwrite, %A_Index%, %ININame%, LIHotkeys, hk_%A_Index%_num
			iniwrite, %hkp%, %ININame%, LIHotkeys, hk_%A_Index%_hkp
			iniwrite, %typep%, %ININame%, LIHotkeys, hk_%A_Index%_typep
			iniwrite, %hks%, %ININame%, LIHotkeys, hk_%A_Index%_hks
			iniwrite, %types%, %ININame%, LIHotkeys, hk_%A_Index%_types
		}
	}
	if (workflowCheck == "RE" || firstRun == 1) {
		Loop % (RENumHotkeys + NumHotkeys) {
			hkp := REHotkeyList[A_Index].hkp
			typep := REHotkeyList[A_Index].typep
			hks := REHotkeyList[A_Index].hks
			types := REHotkeyList[A_Index].types

			iniwrite, %A_Index%, %ININame%, REHotkeys, hk_%A_Index%_num
			iniwrite, %hkp%, %ININame%, REHotkeys, hk_%A_Index%_hkp
			iniwrite, %typep%, %ININame%, REHotkeys, hk_%A_Index%_typep
			iniwrite, %hks%, %ININame%, REHotkeys, hk_%A_Index%_hks
			iniwrite, %types%, %ININame%, REHotkeys, hk_%A_Index%_types
		}
	}
	if (workflowCheck == "LG" || firstRun == 1) {
		Loop % (LGNumHotkeys + NumHotkeys) {
			hkp := LGHotkeyList[A_Index].hkp
			typep := LGHotkeyList[A_Index].typep
			hks := LGHotkeyList[A_Index].hks
			types := LGHotkeyList[A_Index].types

			iniwrite, %A_Index%, %ININame%, LGHotkeys, hk_%A_Index%_num
			iniwrite, %hkp%, %ININame%, LGHotkeys, hk_%A_Index%_hkp
			iniwrite, %typep%, %ININame%, LGHotkeys, hk_%A_Index%_typep
			iniwrite, %hks%, %ININame%, LGHotkeys, hk_%A_Index%_hks
			iniwrite, %types%, %ININame%, LGHotkeys, hk_%A_Index%_types

		}
	}
	if (workflowCheck == "SVA/SE" || firstRun == 1) {
		Loop % (SVASENumHotkeys + NumHotkeys) {
			hkp := SVASEHotkeyList[A_Index].hkp
			typep := SVASEHotkeyList[A_Index].typep
			hks := SVASEHotkeyList[A_Index].hks
			types := SVASEHotkeyList[A_Index].types

			iniwrite, %A_Index%, %ININame%, SVASEHotkeys, hk_%A_Index%_num
			iniwrite, %hkp%, %ININame%, SVASEHotkeys, hk_%A_Index%_hkp
			iniwrite, %typep%, %ININame%, SVASEHotkeys, hk_%A_Index%_typep
			iniwrite, %hks%, %ININame%, SVASEHotkeys, hk_%A_Index%_hks
			iniwrite, %types%, %ININame%, SVASEHotkeys, hk_%A_Index%_types
		}
	}
	if (workflowCheck == "Cuboids" || firstRun == 1) {
		Loop % (CuboidsNumHotkeys + NumHotkeys) {
			hkp := CuboidsHotkeyList[A_Index].hkp
			typep := CuboidsHotkeyList[A_Index].typep
			hks := CuboidsHotkeyList[A_Index].hks
			types := CuboidsHotkeyList[A_Index].types

			iniwrite, %A_Index%, %ININame%, CuboidsHotkeys, hk_%A_Index%_num
			iniwrite, %hkp%, %ININame%, CuboidsHotkeys, hk_%A_Index%_hkp
			iniwrite, %typep%, %ININame%, CuboidsHotkeys, hk_%A_Index%_typep
			iniwrite, %hks%, %ININame%, CuboidsHotkeys, hk_%A_Index%_hks
			iniwrite, %types%, %ININame%, CuboidsHotkeys, hk_%A_Index%_types
		}
	}
	return
}

; Read settings from the INI
LoadSettings(){
	;global DefaultHKObject
	;IniRead, laptopValue, %ININame%, Version, laptop
	;IniRead, swapValue, %ININame%, Version, swap
	IniRead, radioValue, %ININame%, Version, radio
	IniRead, specialValue, %ININame%, Version, special
	IniRead, workflowValue, %ININame%, Version, workflow
	if (radioValue != "ERROR") {
		modCheck := radioValue
	}
	if (specialValue != "ERROR") {
		specialCheck := specialValue
	}
	if (workflowValue != "ERROR") {
		workflowCheck := workflowValue
	}

	Loop % (LINumHotkeys + NumHotkeys) {
		LIHotkeyList[A_Index] := DefaultHKObject
		IniRead, num, %ININame%, LIHotkeys, hk_%A_Index%_num,
		IniRead, valp, %ININame% , LIHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, LIHotkeys, hk_%A_Index%_typep,
		IniRead, vals, %ININame% , LIHotkeys, hk_%A_Index%_hks,
		IniRead, types, %ININame%, LIHotkeys, hk_%A_Index%_types,
		if (valp != "ERROR" && vals != "ERROR"){
			;IniRead, block, %ININame% , LIHotkeys, hk_%A_Index%_block, 0
			IniRead, typep, %ININame%, LIHotkeys, hk_%A_Index%_typep, 0
			IniRead, types, %ININame%, LIHotkeys, hk_%A_Index%_types, 0
			LIHotkeyList[A_Index] := {hkp: valp, typep: typep, hks: vals, types: types, status: 0}
		} else if (valp != "ERROR") {
			IniRead, typep, %ININame%, LIHotkeys, hk_%A_Index%_typep, 0
			LIHotkeyList[A_Index] := {hkp: valp, typep: typep, hks: "", types: "", status: 0}
		} else if (vals != "ERROR") {
			IniRead, types, %ININame%, LIHotkeys, hk_%A_Index%_types, 0
			LIHotkeyList[A_Index] := {hkp: "", typep: "", hks: vals, types: types, status: 0}
		}
	}

	Loop % (RENumHotkeys + NumHotkeys) {
		REHotkeyList[A_Index] := DefaultHKObject
		IniRead, num, %ININame%, REHotkeys, hk_%A_Index%_num,
		IniRead, valp, %ININame% , REHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, REHotkeys, hk_%A_Index%_typep,
		IniRead, vals, %ININame% , REHotkeys, hk_%A_Index%_hks,
		IniRead, types, %ININame%, REHotkeys, hk_%A_Index%_types,
		if (valp != "ERROR" && vals != "ERROR"){
			;IniRead, block, %ININame% , REHotkeys, hk_%A_Index%_block, 0
			IniRead, typep, %ININame%, REHotkeys, hk_%A_Index%_typep, 0
			IniRead, types, %ININame%, REHotkeys, hk_%A_Index%_types, 0
			REHotkeyList[A_Index] := {hkp: valp, typep: typep, hks: vals, types: types, status: 0}
		} else if (valp != "ERROR") {
			IniRead, typep, %ININame%, REHotkeys, hk_%A_Index%_typep, 0
			REHotkeyList[A_Index] := {hkp: valp, typep: typep, hks: "", types: "", status: 0}
		} else if (vals != "ERROR") {
			IniRead, types, %ININame%, REHotkeys, hk_%A_Index%_types, 0
			REHotkeyList[A_Index] := {hkp: "", typep: "", hks: vals, types: types, status: 0}
		}
	}

	Loop % (LGNumHotkeys + NumHotkeys) {
		LGHotkeyList[A_Index] := DefaultHKObject
		IniRead, num, %ININame%, LGHotkeys, hk_%A_Index%_num,
		IniRead, valp, %ININame% , LGHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, LGHotkeys, hk_%A_Index%_typep,
		IniRead, vals, %ININame% , LGHotkeys, hk_%A_Index%_hks,
		IniRead, types, %ININame%, LGHotkeys, hk_%A_Index%_types,
		if (valp != "ERROR" && vals != "ERROR"){
			;IniRead, block, %ININame% , LGHotkeys, hk_%A_Index%_block, 0
			IniRead, typep, %ININame%, LGHotkeys, hk_%A_Index%_typep, 0
			IniRead, types, %ININame%, LGHotkeys, hk_%A_Index%_types, 0
			LGHotkeyList[A_Index] := {hkp: valp, typep: typep, hks: vals, types: types, status: 0}
		} else if (valp != "ERROR") {
			IniRead, typep, %ININame%, LGHotkeys, hk_%A_Index%_typep, 0
			LGHotkeyList[A_Index] := {hkp: valp, typep: typep, hks: "", types: "", status: 0}
		} else if (vals != "ERROR") {
			IniRead, types, %ININame%, LGHotkeys, hk_%A_Index%_types, 0
			LGHotkeyList[A_Index] := {hkp: "", typep: "", hks: vals, types: types, status: 0}
		}
	}

	Loop % (SVASENumHotkeys + NumHotkeys) {
		SVASEHotkeyList[A_Index] := DefaultHKObject
		IniRead, num, %ININame%, SVASEHotkeys, hk_%A_Index%_num,
		IniRead, valp, %ININame% , SVASEHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, SVASEHotkeys, hk_%A_Index%_typep,
		IniRead, vals, %ININame% , SVASEHotkeys, hk_%A_Index%_hks,
		IniRead, types, %ININame%, SVASEHotkeys, hk_%A_Index%_types,
		if (valp != "ERROR" && vals != "ERROR"){
			;IniRead, block, %ININame% , SVASEHotkeys, hk_%A_Index%_block, 0
			IniRead, typep, %ININame%, SVASEHotkeys, hk_%A_Index%_typep, 0
			IniRead, types, %ININame%, SVASEHotkeys, hk_%A_Index%_types, 0
			SVASEHotkeyList[A_Index] := {hkp: valp, typep: typep, hks: vals, types: types, status: 0}
		} else if (valp != "ERROR") {
			IniRead, typep, %ININame%, SVASEHotkeys, hk_%A_Index%_typep, 0
			SVASEHotkeyList[A_Index] := {hkp: valp, typep: typep, hks: "", types: "", status: 0}
		} else if (vals != "ERROR") {
			IniRead, types, %ININame%, SVASEHotkeys, hk_%A_Index%_types, 0
			SVASEHotkeyList[A_Index] := {hkp: "", typep: "", hks: vals, types: types, status: 0}
		}
	}

	Loop % (CuboidsNumHotkeys + NumHotkeys) {
		CuboidsHotkeyList[A_Index] := DefaultHKObject
		IniRead, num, %ININame%, CuboidsHotkeys, hk_%A_Index%_num,
		IniRead, valp, %ININame% , CuboidsHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, CuboidsHotkeys, hk_%A_Index%_typep,
		IniRead, vals, %ININame% , CuboidsHotkeys, hk_%A_Index%_hks,
		IniRead, types, %ININame%, CuboidsHotkeys, hk_%A_Index%_types,
		if (valp != "ERROR" && vals != "ERROR"){
			;IniRead, block, %ININame% , CuboidsHotkeys, hk_%A_Index%_block, 0
			IniRead, typep, %ININame%, CuboidsHotkeys, hk_%A_Index%_typep, 0
			IniRead, types, %ININame%, CuboidsHotkeys, hk_%A_Index%_types, 0
			CuboidsHotkeyList[A_Index] := {hkp: valp, typep: typep, hks: vals, types: types, status: 0}
		} else if (valp != "ERROR") {
			IniRead, typep, %ININame%, CuboidsHotkeys, hk_%A_Index%_typep, 0
			CuboidsHotkeyList[A_Index] := {hkp: valp, typep: typep, hks: "", types: "", status: 0}
		} else if (vals != "ERROR") {
			IniRead, types, %ININame%, CuboidsHotkeys, hk_%A_Index%_types, 0
			CuboidsHotkeyList[A_Index] := {hkp: "", typep: "", hks: vals, types: types, status: 0}
		}
	}

	UpdateHotkeyControls()
}