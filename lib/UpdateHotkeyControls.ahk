; Update the GUI controls with the hotkey names
; Added HotKeyName2 for secondary keybinds
UpdateHotkeyControls(){
	global
    
	GuiControl,  Choose, Workflow, %workflowCheck%
	GuiControl, MainGui: , Button%modCheck%, 1
	GuiControl,  Choose, SpecialChoice, %specialCheck%

	; Update based on WF

	if (workflowCheck == "Line") {
		Loop % (LINumHotkeys + NumHotkeys){ ; Always update global
			;tmp1 := BuildHotkeyName(LIHotkeyList[A_Index].hkp, LIHotkeyList[A_index].typep)
			;tmp2 := BuildHotkeyName(LIHotkeyList[A_Index].hks, LIHotkeyList[A_index].types)
			tmp1 := BuildHotKeyName(LIHotkeyList[A_Index].hkp, LIHotkeyList[A_index].typep)

			GuiControl, MainGui: , LIHotkeyName1%A_Index%, %tmp1%
			GuiControl, EditGui: , LIHotkeyName1%A_Index%, %tmp1%
		
			;tmp := LIHotkeyList[A_Index].block
			;GuiControl,, Block%A_Index%, %tmp%
		}
	} else if (workflowCheck == "RE") {
		Loop % (RENumHotkeys + NumHotkeys){ ; Always update global
			;tmp1 := BuildHotkeyName(REHotkeyList[A_Index].hkp, REHotkeyList[A_index].typep)
			;tmp2 := BuildHotkeyName(REHotkeyList[A_Index].hks, REHotkeyList[A_index].types)
			tmp1 := BuildHotKeyName(REHotkeyList[A_Index].hkp, REHotkeyList[A_index].typep)

			GuiControl, MainGui: , REHotkeyName1%A_Index%, %tmp1%
			GuiControl, EditGui: , REHotkeyName1%A_Index%, %tmp1%
		
			;tmp := REHotkeyList[A_Index].block
			;GuiControl,, Block%A_Index%, %tmp%
		}
	} else if (workflowCheck == "LG") {
		Loop % (LGNumHotkeys + NumHotkeys){ ; Always update global
			;tmp1 := BuildHotkeyName(LGHotkeyList[A_Index].hkp, LGHotkeyList[A_index].typep)
			;tmp2 := BuildHotkeyName(LGHotkeyList[A_Index].hks, LGHotkeyList[A_index].types)
			tmp1 := BuildHotKeyName(LGHotkeyList[A_Index].hkp, LGHotkeyList[A_index].typep)

			GuiControl, MainGui: , LGHotkeyName1%A_Index%, %tmp1%
			GuiControl, EditGui: , LGHotkeyName1%A_Index%, %tmp1%
		
			;tmp := LGHotkeyList[A_Index].block
			;GuiControl,, Block%A_Index%, %tmp%
		}
	} else if (workflowCheck == "SVA/SE") {
		Loop % (SVASENumHotkeys + NumHotkeys){ ; Always update global
			;tmp1 := BuildHotkeyName(SVASEHotkeyList[A_Index].hkp, SVASEHotkeyList[A_index].typep)
			;tmp2 := BuildHotkeyName(SVASEHotkeyList[A_Index].hks, SVASEHotkeyList[A_index].types)
			tmp1 := BuildHotKeyName(SVASEHotkeyList[A_Index].hkp, SVASEHotkeyList[A_index].typep)

			GuiControl, MainGui: , SVASEHotkeyName1%A_Index%, %tmp1%
			GuiControl, EditGui: , SVASEHotkeyName1%A_Index%, %tmp1%
		
			;tmp := SVASEHotkeyList[A_Index].block
			;GuiControl,, Block%A_Index%, %tmp%
		}
	} else if (workflowCheck == "Cuboids") {
		Loop % (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys){ ; Always update global
			;tmp1 := BuildHotkeyName(SVASEHotkeyList[A_Index].hkp, SVASEHotkeyList[A_index].typep)
			;tmp2 := BuildHotkeyName(SVASEHotkeyList[A_Index].hks, SVASEHotkeyList[A_index].types)
			tmp1 := BuildHotKeyName(CuboidsHotkeyList[A_Index].hkp, CuboidsHotkeyList[A_index].typep)

			GuiControl, MainGui: , CuboidsHotkeyName1%A_Index%, %tmp1%
			GuiControl, EditGui: , CuboidsHotkeyName1%A_Index%, %tmp1%
		
			;tmp := SVASEHotkeyList[A_Index].block
			;GuiControl,, Block%A_Index%, %tmp%
		}
	}
	
	return

}