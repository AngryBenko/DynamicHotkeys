guiHeightModifier() {
	mult := 25
	fixedHeight := 240
	if (workflowCheck == "Line") {
		return (LINumHotkeys > NumHotkeys ? (LINumHotkeys * mult) + fixedHeight : (NumHotkeys * mult) + fixedHeight + 20)
	} else if (workflowCheck == "RE") {
		return (RENumHotkeys > NumHotkeys ? (RENumHotkeys * mult) + fixedHeight : (NumHotkeys * mult) + fixedHeight)
	} else if (workflowCheck == "LG") {
		return (LGNumHotkeys > (LGNumHotkeysA + NumHotkeys) ? (LGNumHotkeys * mult) + fixedHeight : ((LGNumHotkeysA + NumHotkeys) * mult) + fixedHeight + 10)
	} else if (workflowCheck == "SVA/SE") {
		return (SVASENumHotkeys > NumHotkeys ? (SVASENumHotkeys * mult) + fixedHeight : (NumHotkeys * mult) + fixedHeight)
	} else if (workflowCheck == "Cuboids") {
		return (CuboidsNumHotkeys > (CuboidsNumHotkeysA + NumHotkeys) ? (CuboidsNumHotkeys * mult) + fixedHeight : ((CuboidsNumHotkeysA + NumHotkeys) * mult) + fixedHeight + 30)
	}
}

guiWidthModifier() {
	fixedWidth := 400
	if (workflowCheck == "Line") {
		return guiColumnPos() + fixedWidth
	} else if (workflowCheck == "RE") {
		return guiColumnPos() + fixedWidth
	} else if (workflowCheck == "LG") {
		return guiColumnPos() + fixedWidth
	} else if (workflowCheck == "SVA/SE") {
		return guiColumnPos() + fixedWidth
	} else if (workflowCheck == "Cuboids") {
		return guiColumnPos() + fixedWidth 
	}
}

guiColumnPos() {
	if (workflowCheck == "Line") {
		return 460
	} else if (workflowCheck == "RE") {
		return 375
	} else if (workflowCheck == "LG") {
		return 350
	} else if (workflowCheck == "SVA/SE") {
		return 325
	} else if (workflowCheck == "Cuboids") {
		return 325
	}
}

updateCustomArray(outhk, ctrlnum) {
	tmp := {hkp: outhk}
	globalHotkeyListRef[ctrlnum] := tmp
	return
}

OptionChanged(){
	Gui, Submit, NoHide
	; Disable Hotkeys
	DisableHotkeys()

	EnableHotkeys()

	SaveSettings()

	updateFileMenu()
	return
}

DeleteHotkey(hk){
	HKVersionType := substr(A_GuiControl, 1, 1)

	DisableHotkeys()

	if (HKVersionType == 1) {
		LIHotkeyList[hk] := DefaultHKObject
	} else if (HKVersionType == 2) {
		REHotkeyList[hk] := DefaultHKObject
	} else if (HKVersionType == 3) {
		LGHotkeyList[hk] := DefaultHKObject
	} else if (HKVersionType == 4) {
		SVASEHotkeyList[hk] := DefaultHKObject
	} else if (HKVersionType == 5) {
		CuboidsHotkeyList[hk] := DefaultHKObject
	} else if (HKVersionType == 6) {
		if (substr(A_GuiControl, 7, 1) == "A") {
			globalHotkeyList[hk] := DefaultHKObject
		} else if (substr(A_GuiControl, 7, 1) == "B") {
			globalHotkeyListRef[hk] := {hkp: ""}
		}
	}

	
	UpdateHotkeyControls()
	OptionChanged()

	return
}

refreshUI() {
	global 
	destroyMainGUI()
	height := guiHeightModifier()
	width := guiWidthModifier()
	drawMainGUI()
	UpdateHotkeyControls()
	return
}


resetAllDefault() {
    soundbeep
	DisableHotkeys()

	if (workflowCheck == "Line") { ; Lines
		totalNumHotkey := LINumHotkeys + NumHotkeys
		Loop % (totalNumHotkey) {
			if (!(A_Index == (totalNumHotkey - 2) || A_Index == (totalNumHotkey - 1))) {
				LIHotkeyList[A_Index] :=  DefaultHKObject
			}
		}
	} else if (workflowCheck == "RE") { ; RE
		totalNumHotkey := RENumHotkeys + NumHotkeys
		Loop % (totalNumHotkey) {
			if (!(A_Index == (totalNumHotkey - 2) || A_Index == (totalNumHotkey - 1))) {
				REHotkeyList[A_Index] :=  DefaultHKObject
			}
		}
	} else if (workflowCheck == "LG") { ; LG
		totalNumHotkey := LGNumHotkeys + LGNumHotkeysA + NumHotkeys
		Loop % (totalNumHotkey) {
			if (!(A_Index == (totalNumHotkey - 2) || A_Index == (totalNumHotkey - 1))) {
				LGHotkeyList[A_Index] :=  DefaultHKObject
			}
		}
	} else if (workflowCheck == "SVA/SE") { ; SVA/SE
		totalNumHotkey := SVASENumHotkeys + NumHotkeys
		Loop % (totalNumHotkey) {
			if (!(A_Index == (totalNumHotkey - 2) || A_Index == (totalNumHotkey - 1))) {
				SVASEHotkeyList[A_Index] :=  DefaultHKObject
			}
		}
	} else if (workflowCheck == "Cuboids") {
		totalNumHotkey := CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys
        Loop % (totalNumHotkey) {
			if (!(A_Index == (totalNumHotkey - 2) || A_Index == (totalNumHotkey - 1))) {
				CuboidsHotkeyList[A_Index] :=  DefaultHKObject
			}
		}
    }

	Loop % globalNumHotkeys {
		globalHotkeyList[A_Index] := DefaultHKObject
		globalHotkeyListRef[A_Index] := DefaultCustomObject
		globalHotkeyDisplayVar[A_Index] := "Shortcut Name"
	}

	UpdateHotkeyControls()
	OptionChanged()

    return
}


; Builds the prefix for a given hotkey object
BuildPrefix(hk){
	prefix := "~"
	return prefix
}

; Removes ~ * etc prefixes (But NOT modifiers!) from a hotkey object for comparison
StripPrefix(hk){
	Loop {
		chr := substr(hk,1,1)
		if (chr == "~" || chr == "*" || chr == "$"){
			hk := substr(hk,2)
		} else {
			break
		}
	}
	return hk
}

BuildTitleName() {
	return substr(A_ScriptName, 1, -4)
}

BuildIniName(){
	return substr(A_Scriptname, 1, 17) ".ini"
}

BuildHotkeyString(str, type := 0){

	outhk := ""
	modct := CurrentModifierCount()

	if (type == 1 || type == 4) {
		outhk := str
	} else {
		if (modct) {
			;modifiers := ["XBUTTON2", "XBUTTON1", "MBUTTON"]
			modifiers := ["XBUTTON2", "XBUTTON1", "MBUTTON", "CTRL","ALT","SHIFT","WIN"]

			Loop, 7 {
				key := modifiers[A_Index]
				value := HKModifierState[modifiers[A_Index]]
				if (value) {
					if (key == "XBUTTON2") {
						outhk .= "xbutton2 & "
					} else if (key == "XBUTTON1") {
						outhk .= "xbutton1 & "
					} else if (key == "MBUTTON") {
						outhk .= "mbutton  & "
					} else if (key == "CTRL") {
						outhk .= "^"
					} else if (key == "ALT") {
						outhk .= "!"
					} else if (key == "SHIFT") {
						outhk .= "+"
					} else if (key == "WIN") {
						outhk .= "#"
					}
				}
			}
		}
		outhk .= str
	}

	return outhk
}

BuildHotKeyName(hk, ctrltype){

	outstr := ""
	modctr := 0
	stringupper, hk, hk
	
	if (substr(hk,1,1) == "^" || substr(hk,1,1) == "!" || substr(hk,1,1) == "+" || substr(hk,1,1) == "#"){
		Loop % strlen(hk) {
			chr := substr(hk,1,1)
			mod := 0

			if (chr == "^"){
				; Ctrl
				mod := "CTRL"
				modctr++
			} else if (chr == "!"){
				; Alt
				mod := "ALT"
				modctr++
			} else if (chr == "+"){
				; Shift
				mod := "SHIFT"
				modctr++
			} else if (chr == "#"){
				; Win
				mod := "WIN"
				modctr++
			} else {
				break
			}
			if (mod){
				if (modctr > 1){
					outstr .= " + "
				}
				outstr .= mod
				; shift character out
				hk := substr(hk,2)
			}
		} 
	}
	if (modctr) {
		outstr .= " + "
		outstr .= hk
	} else if (hk != "") {
		outstr := hk
		if (ctrltype == 5) { ; Fixed hotkey
			tmp2 := substr(hk, 9)
			outstr := "Space + "
			outstr .= tmp2
		} else  {
			tmp2 := substr(hk, 12)
			tmp1 := substr(hk, 1,8)
			if (tmp1 == "XBUTTON1") {
				if (ctrltype == 1) {
					outstr := "Thumb2"
				} else {
					outstr := "Thumb2 + "
					outstr .= tmp2
				}
			} else if (tmp1 == "XBUTTON2") {
				if (ctrltype == 1) {
					outstr := "Thumb1"
				} else {
					outstr := "Thumb1 + "
					outstr .= tmp2
				}
			} else if (tmp1 == "MBUTTON ") {
				if (ctrltype == 1) {
					outstr := "Middle"
				} else {
					outstr := "Middle + "
					outstr .= tmp2
				}
			}
		}
	} else {
		;outstr := "None"
	}

	return outstr
}

; Sets the state of the HKModifierState object to reflect the state of the modifier keys
SetModifier(hk,state){
	global HKModifierState

	if (hk == "xbutton2") {
		HKModifierState.xbutton2 := state
	} else if (hk == "xbutton1") {
		HKModifierState.xbutton1 := state
	} else if (hk == "mbutton") {
		HKModifierState.mbutton := state
	} else if (hk == "lctrl" || hk == "rctrl") {
		HKModifierState.ctrl := state
	} else if (hk == "lalt" || hk == "ralt") {
		HKModifierState.alt := state
	} else if (hk == "lshift" || hk == "rshift") {
		HKModifierState.shift := state
	} else if (hk == "lwin" || hk == "rwin") {
		HKModifierState.win := state
	}
	
	return
}

; Counts how many modifier keys are currently held
CurrentModifierCount(){
	global 

	return HKModifierState.xbutton2 + HKModifierState.xbutton1 + HKModifierState.mbutton + HKModifierState.ctrl + HKModifierState.alt + HKModifierState.shift + HKModifierState.win
}