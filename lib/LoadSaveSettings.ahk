; Write settings to the INI
SaveSettings(){
	;Msgbox, 262144,, Saving Settings...
	iniwrite, %versionNum%, %ININame%, Version, version
	iniwrite, %workflowCheck%, %ININame%, Version, workflow
	iniwrite, %disCamCheck%, %ININame%, Version, camera
	iniwrite, %darkMode%, %ININame%, Version, dark

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
		Loop % (LGNumHotkeys + LGNumHotkeysA + NumHotkeys) {
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

	Loop % globalNumHotkeys {
		; two sets

		name := globalHotkeyDisplayVar[A_Index]
		hkp := globalHotkeyList[A_Index].hkp
		hkp2 := globalHotkeyListRef[A_Index].hkp
		typep := globalHotkeyList[A_Index].typep
		
		iniwrite, %A_Index%, %ININame%, GlobalHotkeys, hk_%A_Index%_num
		iniwrite, %name%, %ININame%, GlobalHotkeys, hk_%A_Index%_name
		iniwrite, %hkp%, %ININame%, GlobalHotkeys, hk_%A_Index%_hkp
		iniwrite, %hkp2%, %ININame%, GlobalHotkeys, hk_%A_Index%_hkp2
		iniwrite, %typep%, %ININame%, GlobalHotkeys, hk_%A_Index%_typep
	}
	;; save Global, most likely will have two sets
	return
}

; Read settings from the INI
LoadSettings(){
	;Msgbox, 262144,, Loading Settings...
	IniRead, versionValue, %ININame%, Version, version
	IniRead, workflowValue, %ININame%, Version, workflow
	IniRead, disCameraValue, %ININame%, Version, camera
	IniRead, darkModeValue, %ININame%, Version, dark
	
	if (workflowValue != "ERROR") {
		workflowCheck := workflowValue
	}
	if (versionValue == "ERROR" || versionValue != versionNum) {
		msgbox, 262144,, A new version of this script has been detected. As a result some keybinds may have been changed. Please go to File > Reload Script. Please double check any keybinds after.
	}
	if (disCameraValue != "ERROR") {
		disCamCheck := disCameraValue
	}
	if (darkModeValue != "ERROR") {
		darkMode := darkModeValue
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

	Loop % (LGNumHotkeys + LGNumHotkeysA + NumHotkeys) {
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

	Loop % globalNumHotkeys {
		globalHotkeyList[A_Index] := DefaultHKObject
		globalHotkeyListRef[A_Index] := DefaultCustomObject
		globalHotkeyDisplayVar[A_Index] := ""
		IniRead, num, %ININame%, GlobalHotkeys, hk_%A_Index%_num,
		IniRead, name, %ININame%, GlobalHotkeys, hk_%A_Index%_name,
		IniRead, valp, %ININame% , GlobalHotkeys, hk_%A_Index%_hkp,
		IniRead, typep, %ININame%, GlobalHotkeys, hk_%A_Index%_typep,
		IniRead, valp2, %ININame%, GlobalHotkeys, hk_%A_Index%_hkp2,
		if (name != "ERROR") {
			if (name == "") {
				globalHotkeyDisplayVar[A_Index] := "Shortcut Name"
			} else {
				globalHotkeyDisplayVar[A_Index] := name
			}
		}
		if (valp != "ERROR") {
			IniRead, typep, %ININame%, GlobalHotkeys, hk_%A_Index%_typep, 0
			globalHotkeyList[A_Index] := {hkp: valp, typep: typep, status: 0}
		}
		if (valp2 != "ERROR") {
			IniRead, typep, %ININame%, GlobalHotkeys, hk_%A_Index%_typep, 0
			globalHotkeyListRef[A_Index] := {hkp: valp2}
		}
	}

	;; load Global, most likely will have two sets
	UpdateHotkeyControls()
	return
}