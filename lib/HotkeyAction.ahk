; These functions are called from HotkeyAction.ahk


spline() {
	SendInput, {i}
	return
}

connTool() {
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

mapTiles() {
	SendInput, {Alt down}{Shift down}{g}{Alt up}{Shift up}
	return
}

googleMaps() {
	SendInput, {Ctrl down}{Shift down}{m}{Ctrl up}{Shift up}
	return
}

winSnapshot() {
	SendInput, {LWin down}{Shift down}{s}{LWin up}{Shift up}
	return
}

streetView() {
	SendInput, {Ctrl down}{Shift down}{s}{Ctrl up}{Shift up}
	return
}

levelUp() {
    SendInput, {Alt down}{2}{Alt up}
    return
}

levelDown() {
    SendInput, {Alt down}{1}{Alt up}
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

bingMap() {
	SendInput, {Alt down}{m}{Alt up}
	return
}

negativeROI() {
	SendInput, {Alt down}{y}{Alt up}
	return
}

neighborROI() {
	SendInput, {Alt down}{Shift down}{n}{Shift up}{Alt up}
	return
}

nearbyLabels() {
	SendInput, {Shift down}{n}{Shift up}
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

labelSearch() {
	SendInput, {Alt down}{Shift down}{=}{Shift up}{Alt up}
	return
}

autoCenter() {
	SendInput, {Ctrl down}{x}{Ctrl up}
	return
}

teamsmute() {
	WinGet TID, ID, ahk_exe Teams.exe
	WinActivate ahk_id %TID%
	Sleep, 200
	;SendInput, {Ctrl down}{Shift down}{m}{Ctrl up}{Shift up}
	SendInput ^+m
	
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
	;msgbox Pressed %y%
	return
}

globalShortcut(x) {
	tmp := globalHotKeyListRef[x].hkp
	SendLevel, 1
	; "xbutton1 & 1"
	; "mbutton & 1"
	if (InStr(tmp, "&")) {
		hkArray := StrSplit(tmp, "&", A_Space)
		tmp1 := hkArray[1]
		tmp2 := hkArray[2]
		Send, {%tmp1% down}{%tmp2%}{%tmp1% up}
		return
	}
	
	Send, %tmp%
	return
}