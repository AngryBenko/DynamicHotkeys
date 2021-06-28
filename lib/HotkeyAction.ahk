searchHotkey(verType){ 
	;msgbox %A_ThisHotkey% %A_ThisLabel%
	temp = %A_ThisHotkey%
	
	if (verType == 1) {
		Loop % (LINumHotkeys + NumHotkeys) {
			if (LIHotkeyList[A_Index].hkp == StripPrefix(temp)) {
				return %A_Index%
			}
		}
	} else if (verType == 2) {
		Loop % (RENumHotkeys + NumHotkeys) {
			if (REHotkeyList[A_Index].hkp == StripPrefix(temp)) {
				return %A_Index%
			}
		}
	} else if (verType == 3) {
		Loop % (LGNumHotkeys + NumHotkeys) {
			if (LGHotkeyList[A_Index].hkp == StripPrefix(temp)) {
				return %A_Index%
			}
		}
	} else if (verType == 4) {
		Loop % (SVASENumHotkeys + NumHotkeys) {
			if (SVASEHotkeyList[A_Index].hkp == StripPrefix(temp)) {
				return %A_Index%
			}
		}
	} else if (verType == 5) {
		Loop % (CuboidsNumHotkeys + CuboidsNumHotkeysA + NumHotkeys) {
			if (CuboidsHotkeyList[A_Index].hkp == StripPrefix(temp)) {
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
			shortcut(labelNum, verType)
		}
	} else if (verType == 3) {
		if (labelNum > LGNumHotkeys) {
			globalShortcut(labelNum - LGNumHotkeys)
		} else {
			shortcut(labelNum, verType)
		}
	} else if (verType == 4) {
		if (labelNum > SVASENumHotkeys) {
			globalShortcut(labelNum - SVASENumHotkeys)
		} else {
			shortcut(labelNum, verType)
		}
	} else if (verType == 5) {
		if (labelNum > CuboidsNumHotkeys + CuboidsNumHotkeysA) { ; Cuboids uses letters
			globalShortcut(labelNum - (CuboidsNumHotkeys + CuboidsNumHotkeysA))
		} else {
			;cuboidShortcut(labelnum)
			if (labelNum < CuboidsNumHotkeys) {
				shortcut(labelNum, verType)
			} else {
				cuboidsShortcut(labelNum - CuboidsNumHotkeys)
			}
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

cuboidsShortcut(x) {
	if (x == 1) {
		imageLidar()
	} else if (x == 2) {
		stackLidar()
	} else if (x == 3) {
		isoBoid()
	} else if (x == 4) {
		depthDense()
	} else if (x == 5) {
		imageRadar()
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
		curMode()
	} else if (x == 8) {
		winSnapshot()
	} else if (x == 9) {
		firstIFR()
	} else if (x == 10) {
		lastIFR()
	} else if (x == 11) {
		camForward()
	} else if (x == 12) {
		camBackward()
	} else if (x == 13) {
		special()
	}
	return
}

shortcut(x, verType) { ; Check if x is number
	if (verType == 5) { ; Cuboids
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
			y := "g"
		} else if (x == 17) {
			y := "h"
		} else if (x == 18) { ; Cuboids 'J' results in Unknown
			y := "i"
		} else if (x == 19) {
			y := "l"
		}
	} else {
		y := x + 1
	}
	SendInput, .1%y%
	;msgbox Pressed
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

curMode() {
	SendInput, {Alt Down}{Shift down}{s}{Alt up}{Shift up}
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

firstIFR() {
	SendInput, {Alt down}{[}{Alt up}
	return
}

lastIFR() {
	SendInput, {Alt down}{]}{Alt up}
	return
}

cycleKF() {
	SendInput, {Ctrl down}{}{Ctrl up}
	;left arrow right arrow
	return
}

camForward() {
	BlockInput,  On
	SendInput, {Right}
	Sleep, 35
	BlockInput, Off
	return
}

camBackward() {
	BlockInput,  On
	SendInput, {Left}
	Sleep, 35
	BlockInput, Off
	return
}

teamsmute() {
	WinGet TID, ID, ahk_exe Teams.exe
	WinActivate ahk_id %TID%
	Sleep, 200
	SendInput, ^+m
	
	;msgbox Hello
	return
}

boundGrid() {
	SendInput, {Ctrl down}{Shift down}{g}{Ctrl up}{Shift up}
	return
}

pitchUP() {
	SendInput {Alt down}{q}{Alt up}
	return
}
pitchDOWN() {
	SendInput {Alt down}{e}{Alt up}
	return
}

imageLidar() {
	SendInput, {Ctrl Down}{Shift down}{l}{Ctrl up}{Shift up}
	return
}

imageRadar() {
	SendInput, {Ctrl Down}{Shift down}{d}{Ctrl up}{Shift up}
	return
}

depthDense() {
	SendInput, {Alt Down}{Shift Down}{p}{Alt Up}{Shift Up}
	return
}

stackLidar() {
	SendInput, {Alt Down}{l}{Alt up}
	return
}

isoBoid() {
	SendInput, {Alt Down}{u}{Alt up}
	return
}