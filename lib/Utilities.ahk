guiHeightModifier() {
	mult := 25
	fixedHeight := 150
	if (workflowCheck == "Line") {
		return (LINumHotkeys > NumHotkeys ? (LINumHotkeys * mult) + fixedHeight : (NumHotkeys * mult) + fixedHeight)
	} else if (workflowCheck == "RE") {
		return (RENumHotkeys > NumHotkeys ? (RENumHotkeys * mult) + fixedHeight : (NumHotkeys * mult) + fixedHeight)
	} else if (workflowCheck == "LG") {
		return (LGNumHotkeys > NumHotkeys ? (LGNumHotkeys * mult) + fixedHeight : (NumHotkeys * mult) + fixedHeight)
	} else if (workflowCheck == "SVA/SE") {
		return (SVASENumHotkeys > NumHotkeys ? (SVASENumHotkeys * mult) + fixedHeight : (NumHotkeys * mult) + fixedHeight)
	} else if (workflowCheck == "Cuboids") {
		return (CuboidsNumHotkeys > NumHotkeys ? (CuboidsNumHotkeys * mult) + fixedHeight : (NumHotkeys * mult) + fixedHeight)
	}
}

guiWidthModifier() {
	fixedWidth := 375
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
		return 450
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

getMinClose() {
	global
	if (minclosecheck) {
		Gui, Cancel
	} else {
		ExitApp
	}
	return
}

OptionChanged(){
	Gui, Submit, NoHide
	; Disable Hotkeys
	DisableHotkeys()

	EnableHotkeys()

	SaveSettings()

	return
}

DeleteHotkey(hk){
	HKVersionType := substr(A_GuiControl, 1, 1)

	soundbeep
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
	}

	
	UpdateHotkeyControls()
	OptionChanged()

	return
}



; Builds the prefix for a given hotkey object
BuildPrefix(hk){
	prefix := "~"
	;if (!hk.block){
	;	prefix .= "~"
	;}
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


BuildIniName(){
	tmp := A_Scriptname
	Stringsplit, tmp, tmp,.
	ini_name := ""
	last := ""
	Loop, % tmp0
	{
		; build the string up to the last period (.)
		if (last != ""){
			if (ini_name != ""){
				ini_name := ini_name "."
			}
			ini_name := ini_name last
		}
		last := tmp%A_Index%
	}
	;this.ini_name := ini_name ".ini"
	return ini_name ".ini"

}

BuildHotkeyString(str, type := 0){

	outhk := ""
	modct := CurrentModifierCount()

	if (type == 1 || type == 4) {
		outhk := str
	} else {
		if (modct) {
			modifiers := ["XBUTTON2", "XBUTTON1", "MBUTTON"]

			Loop, 3 {
				key := modifiers[A_Index]
				value := HKModifierState[modifiers[A_Index]]
				if (value) {
					if (key == "XBUTTON2") {
						outhk .= "xbutton2 & "
					} else if (Key == "XBUTTON1") {
						outhk .= "xbutton1 & "
					} else if (key == "MBUTTON") {
						outhk .= "mbutton  & "
					}
				}
			}
		}
		outhk .= str
	}

	/*
	;FileAppend String: %str%`n, *
	if (type == 4) { ; Reserved for SPECIAL
		outhk := str
	} else if (type == 1) { ; Middle
		outhk := "mbutton  & "
		outhk .= str
	} else if (type == 2) { ; Thumb1
		outhk := "xbutton2 & "
		if (str == "xbutton2") {
			str := "xbutton1"
		}
		outhk .= str
	} else if (type == 3) { ; Thumb2
		outhk := "xbutton1 & "
		if (str == "xbutton1") {
			str := "xbutton2"
		}
		outhk .= str
	}
	*/

	return outhk
}

BuildHotKeyName(hk, ctrltype){
	/*
	TODO:
	Remove ctrltype 4
	*/

	outstr := ""
	stringupper, hk, hk
	;FileAppend, %ctrltype%, *
	if (hk != "") {
		outstr := hk
		if (ctrltype == 5) { ; Fixed hotkey
			tmp2 := substr(hk, 9)
			outstr := "Space + "
			outstr .= tmp2
		} else if (ctrltype == 4) { ; RESERVERD FOR SPECIAL
			if (hk == "XBUTTON1") {
				outstr := "Thumb2"
			} else if (hk == "XBUTTON2") {
				outstr := "Thumb1"
			} else if (hk == "ENTER") {
				outstr := "Enter"
			} else {
				;stringupper, hk, hk
				outstr := hk
			}
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

			/*
			;stringupper, tmp2, tmp2
			if (ctrltype == 1) {
				outstr := "Middle + "
				if (tmp2 == "XBUTTON1") { ; handle thumb2 paired with m,x1,x2
					tmp2 := "Thumb2"
				} else if (tmp2 == "XBUTTON2") {
					tmp2 := "Thumb1"
				}
			} else if (ctrltype == 2) {
				outstr := "Thumb1 + "
				if (tmp2 == "XBUTTON1") {
					tmp2 := "Thumb2"
				} else if (tmp2 == "XBUTTON2") {
					tmp2 := "Thumb1"
				}
			} else if (ctrltype == 3) {
				outstr := "Thumb2 + "
				if (tmp2 == "XBUTTON1") {
					tmp2 := "Thumb2"
				} else if (tmp2 == "XBUTTON2") {
					tmp2 := "Thumb1"
				}
			}
			outstr .= tmp2
			*/
		}
	} else {
		outstr := "None"
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
	} 
	return
}

; Counts how many modifier keys are currently held
CurrentModifierCount(){
	global HKModifierState

	return HKModifierState.xbutton2 + HKModifierState.xbutton1 + HKModifierState.mbutton
}