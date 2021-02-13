detectClash(type, tmp) { ; only compare if HK is not empty
	if (type == 1) {
		Loop % (LINumHotkeys + NumHotkeys){ ; check if there are any clashes between global hotkeys
			if (StripPrefix(LIHotkeyList[A_Index].hkp) == StripPrefix(tmp)){
				prehkp := LIHotkeyList[A_Index].hkp
				prehks := LIHotkeyList[A_Index].hks
				pretmp := tmp
				;FileAppend Pre: %prehkp% | %prehks% | %pretmp%, *
				return 1
			}
		}
	} else if (type == 2) {
		Loop % (RENumHotkeys + NumHotkeys){ ; check if there are any clashes between global hotkeys
			if (StripPrefix(REHotkeyList[A_Index].hkp) == StripPrefix(tmp)){
				prehkp := REHotkeyList[A_Index].hkp
				prehks := REHotkeyList[A_Index].hks
				pretmp := tmp
				;FileAppend Pre: %prehkp% | %prehks% | %pretmp%, *
				return 1
			}
		}
	} else if (type == 3) {
		Loop % (LGNumHotkeys + NumHotkeys){ ; check if there are any clashes between global hotkeys
			if (StripPrefix(LGHotkeyList[A_Index].hkp) == StripPrefix(tmp)){
				prehkp := LGHotkeyList[A_Index].hkp
				prehks := LGHotkeyList[A_Index].hks
				pretmp := tmp
				;FileAppend Pre: %prehkp% | %prehks% | %pretmp%, *
				return 1
			}
		}
	} else if (type == 4) {
		Loop % (SVASENumHotkeys + NumHotkeys){ ; check if there are any clashes between global hotkeys
			if (StripPrefix(SVASEHotkeyList[A_Index].hkp) == StripPrefix(tmp)){
				prehkp := SVASEHotkeyList[A_Index].hkp
				prehks := SVASEHotkeyList[A_Index].hks
				pretmp := tmp
				;FileAppend Pre: %prehkp% | %prehks% | %pretmp%, *
				return 1
			}
		}
	} else if (type == 5) {
		Loop % (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys){ ; check if there are any clashes between global hotkeys
			if (StripPrefix(CuboidsHotkeyList[A_Index].hkp) == StripPrefix(tmp)){
				prehkp := CuboidsHotkeyList[A_Index].hkp
				prehks := CuboidsHotkeyList[A_Index].hks
				pretmp := tmp
				;FileAppend Pre: %prehkp% | %prehks% | %pretmp%, *
				return 1
			}
		}
	}
}

;applyKeybind(HKVersionType, select, outhk, HKControlType, ctrlnum)
applyKeybind(type, select, outhk, HKControlType, ctrlnum) {
	; type will be used to determine if this is WF or GL specific
	; we can then test workflowCheck to see what the current WF is
	if (type == 1) {
		if (select == 1) { ; select primary or secondary
			;FileAppend DID I GET HERE? ,*
			tmp := {hkp: outhk, typep: HKControlType, status: 0}
		} else {
			tmp := {hkp: LIHotkeyList[ctrlnum].hkp, typep: LIHotkeyList[ctrlnum].typep, hks: outhk, types: HKControlType, status: 0}
		}
		LIHotkeyList[ctrlnum] := tmp
	} else if (type == 2) {
		if (select == 1) { ; select primary or secondary
			tmp := {hkp: outhk, typep: HKControlType, status: 0}
		} else {
			tmp := {hkp: REHotkeyList[ctrlnum].hkp, typep: REHotkeyList[ctrlnum].typep, hks: outhk, types: HKControlType, status: 0}
		}
		REHotkeyList[ctrlnum] := tmp
	} else if (type == 3) {
		if (select == 1) { ; select primary or secondary
			tmp := {hkp: outhk, typep: HKControlType, status: 0}
		} else {
			tmp := {hkp: LGHotkeyList[ctrlnum].hkp, typep: LGHotkeyList[ctrlnum].typep, hks: outhk, types: HKControlType, status: 0}
		}
		LGHotkeyList[ctrlnum] := tmp
	} else if (type == 4) {
		if (select == 1) { ; select primary or secondary
			tmp := {hkp: outhk, typep: HKControlType, status: 0}
		} else {
			tmp := {hkp: SVASEHotkeyList[ctrlnum].hkp, typep: SVASEHotkeyList[ctrlnum].typep, hks: outhk, types: HKControlType, status: 0}
		}
		SVASEHotkeyList[ctrlnum] := tmp
	} else if (type == 5) {
		if (select == 1) { ; select primary or secondary
			tmp := {hkp: outhk, typep: HKControlType, status: 0}
		} else {
			tmp := {hkp: CuboidsHotkeyList[ctrlnum].hkp, typep: CuboidsHotkeyList[ctrlnum].typep, hks: outhk, types: HKControlType, status: 0}
		}
		CuboidsHotkeyList[ctrlnum] := tmp
	}
	return
}

Bind(ctrlnum, select){
	global BindMode
	global EXTRA_KEY_LIST
	global HKLastHotkey
	global HotkeyList
	global HKControlType
	global HKSecondaryInput
	global modCheck
	global NumHotkeys

	; init vars
	HKControlType := 0
	HKVersionType := substr(A_GuiControl, 1, 1)
	HKModifierState := {xbutton2: 0, xbutton1: 0, mbutton: 0}
    ;msgbox %HKVersionType%
	
	; Disable existing hotkeys
	DisableHotkeys()

	; Start Bind Mode - this starts detections for mouse buttons/special keys
	BindMode := 1

	; Show the prompt
	prompt .= "You must hold down a desired modifier button: ThumbButton1, ThumbButton2, or Middle Mouse Button.`n"
	prompt .= "While holding one of the designated modifier buttons above, next press your desired key.`n"
	prompt .= "(Special) is reserved custom keybinds. Ignore unless you know what you are doing.`n"
	prompt .= "Supports most keyboard keys.`n"
	prompt .= "`nHit Escape to cancel."
	Gui, EditGui: +LastFound
	WinGetPos xxx, yyy
	xxx += 25
	yyy += 200
	Gui, EditPrompt: Add, Text, Center, %prompt%
	Gui, EditPrompt: -Border +AlwaysOnTop
	Gui, EditPrompt: Show, x%xxx% y%yyy%

	outhk := ""

	;L1: maximum allowed lenght of input, in this case only 1 input
	;When text reaches this length, input will be terminated and ErrorLevel will be set to
	; "Max" unless the text matches one of the MatchList phrases (EXTRAKEYLIST)
	; set to "Match"
	Loop {
		Input, detectedkey, L1, %EXTRA_KEY_LIST% ; EXTRA_KET_LIST determines the Endkey
		;FileAppend, %detectedkey%, *
		tmp := ""

		if (substr(ErrorLevel, 1, 7) == "EndKey:"){
			tmp := substr(ErrorLevel, 8)
			detectedkey := tmp
			if (tmp == "Escape") {
				if (HKControlType > 0) {
					detectedkey := HKSecondaryInput
				} else {
					detectedkey := ""
					; Start listening to key up event for Escape, to see if it was held
					hotkey, Escape up, EscapeReleased, ON
				}
			}
		} else if (CurrentModifierCount() == 0) { ; Restriction: Must always be accompanied by set modifiers
			tmp := "Continue"
		}
	} Until (tmp != "Continue")

	; Hide prompt
	Gui, EditPrompt:Submit

	; Stop listening to mouse
	BindMode := 0

	; Process results

	; Data structure will have to store both hk
	; current : {hk: "", type: ""}
	; update: {hkp: "", typep: "", hks: "", types: ""}
	;
	if (detectedkey){
		; Update the hotkey object
		;outhk := BuildHotkeyString(detectedkey,HKControlType)
		;FileAppend TypeB: %HKControlType%`n, *
		;HKControlType := modCheck
		;FileAppend RADIO: %modCheck%`n, *

		/*
		TODO:
		Remove HKControltype 4
		*/
		
		/*
		if (ctrlnum == (LINumHotkeys + NumHotkeys) && workflowCheck == "Line") {
			HKControlType := 4
		} else if (ctrnum == (RENumHotkeys + NumHotkeys) && workflowCheck == "RE") {
			HKControlType := 4
		} else if (ctrlnum == (LGNumHotkeys + NumHotkeys) && workflowCheck == "LG") {
			HKControlType := 4
		} else if (ctrlnum == (SVASENumHotkeys + NumHotkeys) && workflowCheck == "SVASE") {
			HKControlType := 4
		}
		*/
		
		;FileAppend TypeA: %HKControlType%`n, *
		outhk := BuildHotkeyString(detectedkey,HKControlType)
		tmp := {hk: outhk, type: HKControlType, status: 0}
		clash := 0
		prevent := 0

		if (detectedkey == "enter" && HKControlType != 4) { ; Add prevention for special keybinds to only take thumb2
			; detectedkey == "enter" && HKControlType != 4
			prevent := 1
		}
		if (HKControlType == 4 && specialCheck != 1 && select == 2) {
			prevent := 3
		}

		clash := detectClash(HKVersionType, outhk)

		if (prevent == 1) {
			msgbox 'Enter' key is reserved for special keybind. Exiting...
		} else if (prevent == 2) {
			msgbox %detectedkey% is restricted with special keybind. Exiting...
		} else if (prevent == 3) {
			msgbox Please select 'Custom' from drop down list if you want to use secondary keybind for (Special)
		} else if (clash) {
			; Ask if want to overwrite - Need Shortcut, keybind(s) OLD/NEW
			msgbox You cannot bind the same hotkey to two different actions. Exiting...
		} else {
			; =============================
			;FileAppend DID I GET HERE? ,*
			;FileAppend type: %HKVersionType% , *
			applyKeybind(HKVersionType, select, outhk, HKControlType, ctrlnum)

		}
		UpdateHotkeyControls()
		; Rebuild rest of hotkey object, save settings etc
		;OptionChanged()
		; Write settings to INI file
		SaveSettings()

		; Update the GUI control
		;UpdateHotkeyControls()

		; Enable the hotkeys
		;EnableHotkeys()
	} else {
		; Escape was pressed - resotre original hotkey, if any
		EnableHotkeys()
	}
	return
}