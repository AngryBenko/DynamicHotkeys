; Update the GUI controls with the hotkey names
; Added HotKeyName2 for secondary keybinds
UpdateHotkeyControls(){
	global
    
	GuiControl,  Choose, Workflow, %workflowCheck%

	; Update based on WF

	Loop % globalNumHotkeys {
		tmp1 := BuildHotKeyName(globalHotkeyList[A_Index].hkp, globalHotkeyList[A_Index].typep)
		tmp2 := BuildHotKeyName(globalHotkeyListRef[A_Index].hkp, 6)  

		tmpname := globalHotkeyDisplayVar[A_Index]


		GuiControl, MainGui: , ShortCutName%A_Index%, %tmpname%
		GuiControl, EditGui: , ShortCutName%A_Index%, %tmpname%

		if (tmp1 == "") {
			tmp1 = "Hotkey A"
		}
		if (tmp2 == "" ) {
			tmp2 = "Hotkey B"
		}

		GuiControl, MainGui: , GlobalName%A_Index%, %tmp1%
		GuiControl, MainGui: , GlobalKey%A_Index%, %tmp2%

		GuiControl, EditGui: , GlobalName%A_Index%, %tmp1%
		GuiControl, EditGui: , GlobalKey%A_Index%, %tmp2%
	}

	if (workflowCheck == "Line") {
		Loop % (LINumHotkeys + NumHotkeys){ ; Always update global
			tmp1 := BuildHotKeyName(LIHotkeyList[A_Index].hkp, LIHotkeyList[A_index].typep)

			GuiControl, MainGui: , LIHotkeyName1%A_Index%, %tmp1%
			GuiControl, EditGui: , LIHotkeyName1%A_Index%, %tmp1%
		}
	} else if (workflowCheck == "RE") {
		Loop % (RENumHotkeys + NumHotkeys){ ; Always update global
			tmp1 := BuildHotKeyName(REHotkeyList[A_Index].hkp, REHotkeyList[A_index].typep)

			GuiControl, MainGui: , REHotkeyName1%A_Index%, %tmp1%
			GuiControl, EditGui: , REHotkeyName1%A_Index%, %tmp1%
		}
	} else if (workflowCheck == "LG") {
		Loop % (LGNumHotkeys + LGNumHotkeysA + NumHotkeys){ ; Always update global
			tmp1 := BuildHotKeyName(LGHotkeyList[A_Index].hkp, LGHotkeyList[A_index].typep)

			GuiControl, MainGui: , LGHotkeyName1%A_Index%, %tmp1%
			GuiControl, EditGui: , LGHotkeyName1%A_Index%, %tmp1%
		}
	} else if (workflowCheck == "SVA/SE") {
		Loop % (SVASENumHotkeys + NumHotkeys){ ; Always update global
			tmp1 := BuildHotKeyName(SVASEHotkeyList[A_Index].hkp, SVASEHotkeyList[A_index].typep)

			GuiControl, MainGui: , SVASEHotkeyName1%A_Index%, %tmp1%
			GuiControl, EditGui: , SVASEHotkeyName1%A_Index%, %tmp1%
		}
	} else if (workflowCheck == "Cuboids") {
		Loop % (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys){ ; Always update global
			tmp1 := BuildHotKeyName(CuboidsHotkeyList[A_Index].hkp, CuboidsHotkeyList[A_index].typep)

			GuiControl, MainGui: , CuboidsHotkeyName1%A_Index%, %tmp1%
			GuiControl, EditGui: , CuboidsHotkeyName1%A_Index%, %tmp1%
		}
	}
	
	if (disCamCheck) {
		LIIndex1 := (LINumHotkeys + NumHotkeys) - 2
		LIIndex2 := (LINumHotkeys + NumHotkeys) - 1

		REIndex1 := (RENumHotkeys + NumHotkeys) - 2
		REIndex2 := (RENumHotkeys + NumHotkeys) - 1
		
		LGIndex1 := (LGNumHotkeys + LGNumHotkeysA + NumHotkeys) - 2
		LGIndex2 := (LGNumHotkeys + LGNumHotkeysA + NumHotkeys) - 1

		SVASEIndex1 := (SVASENumHotkeys + NumHotkeys) - 2
		SVASEIndex2 := (SVASENumHotkeys + NumHotkeys) - 1

		CuboidsIndex1 := (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) - 2
		CuboidsIndex2 := (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) - 1

		
		GuiControl, MainGui: , LIHotkeyName1%LIIndex1%, Disabled
		GuiControl, MainGui: , LIHotkeyName1%LIIndex2%, Disabled
		
		GuiControl, MainGui: , REHotkeyName1%REIndex1%, Disabled
		GuiControl, MainGui: , REHotkeyName1%REIndex2%, Disabled
		
		GuiControl, MainGui: , LGHotkeyName1%LGIndex1%, Disabled
		GuiControl, MainGui: , LGHotkeyName1%LGIndex2%, Disabled
		
		GuiControl, MainGui: , SVASEHotkeyName1%SVASEIndex1%, Disabled
		GuiControl, MainGui: , SVASEHotkeyName1%SVASEIndex2%, Disabled

		GuiControl, MainGui: , CuboidsHotkeyName1%CuboidsIndex1%, Disabled
		GuiControl, MainGui: , CuboidsHotkeyName1%CuboidsIndex2%, Disabled
	} 
	
	return

}