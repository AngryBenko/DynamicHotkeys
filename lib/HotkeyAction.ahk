

searchHotkey(verType){ 
	;msgbox %A_ThisHotkey% %A_ThisLabel%
	temp = %A_ThisHotkey%
	
	if (verType == 1) {
		Loop % (LINumHotkeys + NumHotkeys) {
			if (LIHotkeyList[A_Index].hkp == StripPrefix(temp) || LIHotkeyList[A_Index].hks == StripPrefix(temp)) {
				return %A_Index%
			}
		}
	} else if (verType == 2) {
		Loop % (RENumHotkeys + NumHotkeys) {
			if (REHotkeyList[A_Index].hkp == StripPrefix(temp) || REHotkeyList[A_Index].hks == StripPrefix(temp)) {
				return %A_Index%
			}
		}
	} else if (verType == 3) {
		Loop % (LGNumHotkeys + NumHotkeys) {
			if (LGHotkeyList[A_Index].hkp == StripPrefix(temp) || LGHotkeyList[A_Index].hks == StripPrefix(temp)) {
				return %A_Index%
			}
		}
	} else if (verType == 4) {
		Loop % (SVASENumHotkeys + NumHotkeys) {
			if (SVASEHotkeyList[A_Index].hkp == StripPrefix(temp) || SVASEHotkeyList[A_Index].hks == StripPrefix(temp)) {
				return %A_Index%
			}
		}
	} else if (verType == 5) {
		Loop % (CuboidsNumHotkeys + NumHotkeys) {
			if (CuboidsHotkeyList[A_Index].hkp == StripPrefix(temp) || CuboidsHotkeyList[A_Index].hks == StripPrefix(temp)) {
				return %A_Index%
			}
		}
	}

}

shortcutAutoDist(verType) {

	;check which WF was pressed
	
	labelNum := searchHotkey(verType)
	

	; LI
	; new function
	; RE, shortcut()
	if (verType == 1) {
		if (labelNum > LINumHotkeys) {
			globalShortcut(labelNum - LINumHotkeys)
		} else {
			LIShortcut(labelNum)
		}
	} else if (verType == 2) {
		if (labelNum > RENumHotkeys) {
			globalShortcut(labelNum - RENumHotkeys)
		} else {
			shortcut(labelNum)
		}
	} else if (verType == 3) {
		if (labelNum > LGNumHotkeys) {
			globalShortcut(labelNum - LGNumHotkeys)
		} else {
			shortcut(labelNum)
		}
	} else if (verType == 4) {
		if (labelNum > SVASENumHotkeys) {
			globalShortcut(labelNum - SVASENumHotkeys)
		} else {
			shortcut(labelNum)
		}
	} else if (verType == 5) {
		if (labelNum > CuboidsNumHotkeys) { ; Cuboids uses letters
			globalShortcut(labelNum - CuboidsNumHotkeys)
		} else {
			cuboidShortcut(labelnum)
			;shortcut(labelNum)
		}
	}
	; LG, shortct()

	; SVASE

	return
}

LIShortcut(x) {
	if (x == 1) { 
		doubleSolidYellowMedianRF()
	} else if (x == 2) { 
		solidYellowMRF()
	} else if (x == 3) { 
		dashedWhite()
	} else if (x == 4) { 
		solidWhiteShoulderRA()
	} else if (x == 5) { 
		solidWhiteCWRF()
	} else if (x == 6) { 
		solidWhiteCWInt()
	} else if (x == 7) { 
		cwCWRF()		
	} else if (x == 8) { 
		cwCWInt()
	} else if (x == 9) { 
		doubleSolidYellowBid()
	} else if (x == 10) { 
		infParkingRA()
	} else if (x == 11) { 
		dashedSolidYellowSuicideRF()
	} else if (x == 12) { 
		solidWhiteBikeRA()
	} else if (x == 13) { 
		solidWhiteBikeShoulder()
	} else if (x == 14) { 
		shortDashed()
	} else if (x == 15) { 
		shortDashedBikeRA()
	} else if (x == 16) { 
		shortDashedShoulderRA()
	} else if (x == 17) { 
		solidWhiteInt()
	}

	return
}

globalShortcut(x) {
	if (x == 1) {
		spline()
	} else if (x == 2) {
		conTool()
	} else if (x == 3) {
		revDir()
	} else if (x == 4) {
		revReg()
	} else if (x == 5) {
		satTube()
	} else if (x == 6) {
		googleTiles()
	} else if (x == 7) {
		winSnapshot()
	} else if (x == 8) {
		camForward()
	} else if (x == 9) {
		camBackward()
	} else if (x == 10) {
		special()
	}
	return
}

cuboidShortcut(x) {
	y := x
	if (x == 10) {
		y := 0
	} else if (x == 11) {
		y := "a"
	} else if (x == 12) {
		y := "b"
	} else if (x == 13) {
		y := "c"
	} else if (x == 14) {
		y := "d"
	} else if (x == 15) {
		y := "e"
	} else if (x == 16) {
		y := "f"
	} else if (x == 17) {
		y := "g"
	} else if (x == 18) { ; Cuboids 'J' results in Unknown
		y := "h"
	} else if (x == 19) {
		y := "i"
	} else if (x == 20) {
		y := "l"
	}
	SendInput, .1%y%
	return
}

shortcut(x) { ; Check if x is number
	y := x + 1
	SendInput, .1%y%
	;msgbox Pressed shortcut %x%
	return
}

special() {
	if (workflowCheck == "Line") {
		sec := LIHotkeyList[LINumHotkeys + NumHotkeys].hks
	} else if (workflowCheck == "RE") {
		sec := REHotkeyList[RENumHotkeys + NumHotkeys].hks
	} else if (workflowCheck == "LG") {
		sec := LGHotkeyList[LGNumHotkeys + NumHotkeys].hks
	} else if (workflowCheck == "SVA/SE") {
		sec := SVASEHotkeyList[SVASENumHotkeys + NumHotkeys].hks
	} else if (workflowCheck == "Cuboids") {
		sec := CuboidsHotkeyList[CuboidsNumHotkeys + NumHotkeys].hks
	}

	if (sec == "") {
		msgbox (Special) secondary keybind must not be empty...
	} else {
		;msgbox Pressed special shortcut. Sending {%sec%}
		Send, {%sec%}
	}
	
	return
}

spline() {
	SendInput, {i}
	return
}

conTool() {
	SendInput, {j}
	return
}

revDir() {
	SendInput, {[}
	return
}

revReg() {
	SendInput, {]}
	return
}


satTube() {
	SendInput, {Alt down}{Shift down}{t}{Alt up}{Shift up}
	return
}

googleTiles() {
	SendInput, {Alt down}{Shift down}{g}{Alt up}{Shift up}
	return
}

winSnapshot() {
	SendInput, {LWin down}{Shift down}{s}{LWin up}{Shift up}
	return
}

camForward() {
	if (GetKeyState("Shift", "P")) {
		SendInput, {Shift down}{Right}{Shift up}
	} else {
		SendInput, {Right}
	}
}

camBackward() {
	if (GetKeyState("Shift", "P")) {
		SendInput, {Shift down}{Left}{Shift up}
	} else {
		SendInput, {Left}
	}
}

teamsmute() {
	
	WinGet TID, ID, ahk_exe Teams.exe
	WinActivate ahk_id %TID%
	Sleep, 200
	SendInput, ^+m
	
	;msgbox Hello
	return
}