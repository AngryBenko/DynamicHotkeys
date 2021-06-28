; Write settings to the INI
SaveSettings(){
	;iniwrite, %swapCheck%, %ININame%, Version, swap
	;iniwrite, %laptopCheck%, %ININame%, Version, laptop
	iniwrite, %versionNum%, %ININame%, Version, version
	iniwrite, %modCheck%, %ININame%, Version, radio
	iniwrite, %specialCheck%, %ININame%, Version, special
	iniwrite, %workflowCheck%, %ININame%, Version, workflow

	if (workflowCheck == "Line" || firstRun == 1) {
		Loop % (LINumHotkeys + NumHotkeys) {
			hkp := LIHotkeyList[A_Index].hkp
			typep := LIHotkeyList[A_Index].typep

			iniwrite, %A_Index%, %ININame%, LIHotkeys, hk_%A_Index%_num
			iniwrite, %hkp%, %ININame%, LIHotkeys, hk_%A_Index%_hkp
			iniwrite, %typep%, %ININame%, LIHotkeys, hk_%A_Index%_typep
		}
	}
	if (workflowCheck == "RE" || firstRun == 1) {
		Loop % (RENumHotkeys + NumHotkeys) {
			hkp := REHotkeyList[A_Index].hkp
			typep := REHotkeyList[A_Index].typep

			iniwrite, %A_Index%, %ININame%, REHotkeys, hk_%A_Index%_num
			iniwrite, %hkp%, %ININame%, REHotkeys, hk_%A_Index%_hkp
			iniwrite, %typep%, %ININame%, REHotkeys, hk_%A_Index%_typep
		}
	}
	if (workflowCheck == "LG" || firstRun == 1) {
		Loop % (LGNumHotkeys + NumHotkeys) {
			hkp := LGHotkeyList[A_Index].hkp
			typep := LGHotkeyList[A_Index].typep

			iniwrite, %A_Index%, %ININame%, LGHotkeys, hk_%A_Index%_num
			iniwrite, %hkp%, %ININame%, LGHotkeys, hk_%A_Index%_hkp
			iniwrite, %typep%, %ININame%, LGHotkeys, hk_%A_Index%_typep

		}
	}
	if (workflowCheck == "SVA/SE" || firstRun == 1) {
		Loop % (SVASENumHotkeys + NumHotkeys) {
			hkp := SVASEHotkeyList[A_Index].hkp
			typep := SVASEHotkeyList[A_Index].typep

			iniwrite, %A_Index%, %ININame%, SVASEHotkeys, hk_%A_Index%_num
			iniwrite, %hkp%, %ININame%, SVASEHotkeys, hk_%A_Index%_hkp
			iniwrite, %typep%, %ININame%, SVASEHotkeys, hk_%A_Index%_typep
		}
	}
	if (workflowCheck == "Cuboids" || firstRun == 1) {
		Loop % (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) {
			hkp := CuboidsHotkeyList[A_Index].hkp
			typep := CuboidsHotkeyList[A_Index].typep

			iniwrite, %A_Index%, %ININame%, CuboidsHotkeys, hk_%A_Index%_num
			iniwrite, %hkp%, %ININame%, CuboidsHotkeys, hk_%A_Index%_hkp
			iniwrite, %typep%, %ININame%, CuboidsHotkeys, hk_%A_Index%_typep
		}
	}
	return
}

; Read settings from the INI
LoadSettings(){
	;global DefaultHKObject
	;IniRead, laptopValue, %ININame%, Version, laptop
	;IniRead, swapValue, %ININame%, Version, swap
	IniRead, versionValue, %ININame%, Version, version
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
	if (versionValue == "ERROR" || versionValue != versionNum) {
		msgbox, 262144,, A new version of this script has been detected. Please go to File > Reload Script. Please double check any keybinds after.
	}

	Loop % (LINumHotkeys + NumHotkeys) {
		LIHotkeyList[A_Index] := DefaultHKObject
		IniRead, num, %ININame%, LIHotkeys, hk_%A_Index%_num,
		IniRead, valp, %ININame% , LIHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, LIHotkeys, hk_%A_Index%_typep,
		if (valp != "ERROR"){
			;IniRead, block, %ININame% , LIHotkeys, hk_%A_Index%_block, 0
			IniRead, typep, %ININame%, LIHotkeys, hk_%A_Index%_typep, 0
			LIHotkeyList[A_Index] := {hkp: valp, typep: typep, status: 0}
		}
	}

	Loop % (RENumHotkeys + NumHotkeys) {
		REHotkeyList[A_Index] := DefaultHKObject
		IniRead, num, %ININame%, REHotkeys, hk_%A_Index%_num,
		IniRead, valp, %ININame% , REHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, REHotkeys, hk_%A_Index%_typep,
		if (valp != "ERROR"){
			;IniRead, block, %ININame% , REHotkeys, hk_%A_Index%_block, 0
			IniRead, typep, %ININame%, REHotkeys, hk_%A_Index%_typep, 0
			REHotkeyList[A_Index] := {hkp: valp, typep: typep, status: 0}
		}
	}

	Loop % (LGNumHotkeys + NumHotkeys) {
		LGHotkeyList[A_Index] := DefaultHKObject
		IniRead, num, %ININame%, LGHotkeys, hk_%A_Index%_num,
		IniRead, valp, %ININame% , LGHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, LGHotkeys, hk_%A_Index%_typep,
		if (valp != "ERROR"){
			;IniRead, block, %ININame% , LGHotkeys, hk_%A_Index%_block, 0
			IniRead, typep, %ININame%, LGHotkeys, hk_%A_Index%_typep, 0
			LGHotkeyList[A_Index] := {hkp: valp, typep: typep, status: 0}
		}
	}

	Loop % (SVASENumHotkeys + NumHotkeys) {
		SVASEHotkeyList[A_Index] := DefaultHKObject
		IniRead, num, %ININame%, SVASEHotkeys, hk_%A_Index%_num,
		IniRead, valp, %ININame% , SVASEHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, SVASEHotkeys, hk_%A_Index%_typep,
		if (valp != "ERROR"){
			;IniRead, block, %ININame% , SVASEHotkeys, hk_%A_Index%_block, 0
			IniRead, typep, %ININame%, SVASEHotkeys, hk_%A_Index%_typep, 0
			SVASEHotkeyList[A_Index] := {hkp: valp, typep: typep, status: 0}
		}
	}

	Loop % (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) {
		CuboidsHotkeyList[A_Index] := DefaultHKObject
		IniRead, num, %ININame%, CuboidsHotkeys, hk_%A_Index%_num,
		IniRead, valp, %ININame% , CuboidsHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, CuboidsHotkeys, hk_%A_Index%_typep,
		if (valp != "ERROR"){
			;IniRead, block, %ININame% , CuboidsHotkeys, hk_%A_Index%_block, 0
			IniRead, typep, %ININame%, CuboidsHotkeys, hk_%A_Index%_typep, 0
			CuboidsHotkeyList[A_Index] := {hkp: valp, typep: typep, status: 0}
		}
	}

	UpdateHotkeyControls()
}