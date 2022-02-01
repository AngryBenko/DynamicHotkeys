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

preventKBMModifiers(select) {
	global
	modct := CurrentModifierCount()
	if (modct > 1) {
		if (HKModifierState["XBUTTON2"] || HKModifierState["XBUTTON1"] || HKModifierState["MBUTTON"]) {
			return 1
		}
	}

	if (select == 1) {
		if (HKModifierState["CTRL"] || HKModifierState["ALT"] || HKModifierState["SHIFT"] || HKModifierState["WIN"]) {
			return 2
		}
	}
	return false
}

;applyKeybind(HKVersionType, select, outhk, HKControlType, ctrlnum)
applyKeybind(type, select, outhk, HKControlType, ctrlnum) {
	; type will be used to determine if this is WF or GL specific
	; we can then test workflowCheck to see what the current WF is
	if (type == 1) {
		tmp := {hkp: outhk, typep: HKControlType, status: 0}
		LIHotkeyList[ctrlnum] := tmp
	} else if (type == 2) {
		tmp := {hkp: outhk, typep: HKControlType, status: 0}
		REHotkeyList[ctrlnum] := tmp
	} else if (type == 3) {
		tmp := {hkp: outhk, typep: HKControlType, status: 0}
		LGHotkeyList[ctrlnum] := tmp
	} else if (type == 4) {
		tmp := {hkp: outhk, typep: HKControlType, status: 0}
		SVASEHotkeyList[ctrlnum] := tmp
	} else if (type == 5) {
		tmp := {hkp: outhk, typep: HKControlType, status: 0}
		CuboidsHotkeyList[ctrlnum] := tmp
	} else if (type == 6) {
		tmp := {hkp: outhk, typep: HKControlType, status: 0}
		globalHotkeyList[ctrlnum] := tmp
	}

	; type == 6, apply globals
	return
}



Bind(ctrlnum, select){
	global

	; init vars
	HKControlType := 0 ; is HKControlType always 0?
	HKVersionType := substr(A_GuiControl, 1, 1)
	; HKVersionType determines what workflow to apply keybind.
	; 6 would be for global shortcuts
	HKModifierState := {xbutton2: 0, xbutton1: 0, mbutton: 0, ctrl: 0, alt: 0, shift: 0, win: 0}
    ;msgbox %HKVersionType%
	
	; Disable existing hotkeys
	DisableHotkeys()

	; Start Bind Mode - this starts detections for mouse buttons/special keys
	BindMode := True

	; Show the prompt
	if (select == 1) {
		prompt := "You must hold down a desired modifier button: ThumbButton1, ThumbButton2, or Middle Mouse Button.`n"
	} else if (select == 2) {
		prompt := "Please press and hold a modifier key (CTRL, ALT, SHIFT, WIN, ThumbButton1, ThumbButton2, or Middle Mouse Button)`n"
	}
	prompt .= "While holding one of the designated modifier buttons above, next press your desired key.`n"
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
		tmp := ""
		if (substr(ErrorLevel, 1, 7) == "EndKey:"){
			tmp := substr(ErrorLevel, 8)
			detectedkey := tmp
			if (tmp == "Escape") {
				detectedkey := ""
				; Start listening to key up event for Escape, to see if it was held
				hotkey, Escape up, EscapeReleased, ON
			}
		} else if (CurrentModifierCount() == 0) { ; Restriction: Must always be accompanied by set modifiers
			tmp := "Continue"
		}
	} Until (tmp != "Continue")

	; Hide prompt
	Gui, EditPrompt:Submit
	Gui, EditPrompt: Destroy

	; Stop listening to mouse
	BindMode := False

	; Process results

	; Data structure will have to store both hk
	; current : {hk: "", type: ""}
	; update: {hkp: "", typep: "", hks: "", types: ""}
	;
	if (detectedkey){
		outhk := BuildHotkeyString(detectedkey,HKControlType)
		tmp := {hk: outhk, type: HKControlType, status: 0}
		clash := 0
		prevent := preventKBMModifiers(select) 
	

		clash := detectClash(HKVersionType, outhk)

		if (prevent == 1) {
			msgbox, 262144,, You cannot use Mouse Buttons with Keyboard modifiers. Exiting...
		} else if (prevent == 2) {
			msgbox, 262144,, Please use ThumbButton1, ThumbButton2, or Middle Mouse Button for workflow shortcuts.
		} else if (clash) {
			; Ask if want to overwrite - Need Shortcut, keybind(s) OLD/NEW
			msgbox, 262144,, You cannot bind the same hotkey to two different actions. Exiting...
		} else {
			; =============================
			;FileAppend DID I GET HERE? ,*
			;FileAppend type: %HKVersionType% , *
			; Custom Keybinds
			; -> If the "name", apply the keybind as normal
			; -> If the hotkey, set to array to refer to the "name"
			; -> substr(A_GuiControl, 7, 1) ; v6Bind2B
			; -> B is the actual hotkey
			if (select == 2 && substr(A_GuiControl, 7, 1) == "B") {
				updateCustomArray(outhk, ctrlnum)
			} else {
				applyKeybind(HKVersionType, select, outhk, HKControlType, ctrlnum)
			}
			; updateCustomArray(HKVersionType, select, outhk, HKControlType, ctrlnum)
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