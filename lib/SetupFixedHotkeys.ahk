SetupFixedHotKeys() {
	HKControlType := 5
	tmp1 := {hkp: "alt & wheelup", typep: HKControlType, hks: "", types: "", status: 0}
	tmp2 := {hkp: "alt & wheeldown", typep: HKControlType, hks: "", types: "", status: 0}
	
	LIHotkeyList[(LINumHotkeys + NumHotkeys) - 2] := tmp1
	LIHotkeyList[(LINumHotkeys + NumHotkeys) - 1] := tmp2
	REHotkeyList[(RENumHotkeys + NumHotkeys) - 2] := tmp1
	REHotkeyList[(RENumHotkeys + NumHotkeys) - 1] := tmp2
	LGHotkeyList[(LGNumHotkeys + NumHotkeys) - 2] := tmp1
	LGHotkeyList[(LGNumHotkeys + NumHotkeys) - 1] := tmp2
	SVASEHotkeyList[(SVASENumHotkeys + NumHotkeys) - 2] := tmp1
	SVASEHotkeyList[(SVASENumHotkeys + NumHotkeys) - 1] := tmp2
	
	;OptionChanged()
	;UpdateHotkeyControls()
	SaveSettings()
}