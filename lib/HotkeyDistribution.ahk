searchHotkey(verType){ 
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
		Loop % (LGNumHotkeys + LGNumHotkeysA + NumHotkeys) {
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
	} else if (verType == 6) {
		Loop % globalNumHotkeys {
			if (globalHotkeyList[A_Index].hkp == StripPrefix(temp)) {
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
			generalShortcut(labelNum - LINumHotkeys)
		} else {
			LIShortcut(labelNum)
		}
	} else if (verType == 2) {
		if (labelNum > RENumHotkeys) {
			generalShortcut(labelNum - RENumHotkeys)
		} else {
			shortcut(labelNum, verType)
		}
	} else if (verType == 3) {
		if (labelNum > LGNumHotkeys + LGNumHotkeysA) {
			generalShortcut(labelNum - (LGNumHotkeys + LGNumHotkeysA))
		} else {
			if (labelNum <= LGNumHotkeys) {
				shortcut(labelNum, verType)
			} else {
				LGShortcut(labelNum - LGNumHotkeys)
			}
		}
	} else if (verType == 4) {
		if (labelNum > SVASENumHotkeys) {
			generalShortcut(labelNum - SVASENumHotkeys)
		} else {
			shortcut(labelNum, verType)
		}
	} else if (verType == 5) {
		if (labelNum > CuboidsNumHotkeys + CuboidsNumHotkeysA) { ; Cuboids uses letters
			generalShortcut(labelNum - (CuboidsNumHotkeys + CuboidsNumHotkeysA))
		} else {
			;cuboidShortcut(labelnum)
			if (labelNum <= CuboidsNumHotkeys) {
				shortcut(labelNum, verType)
			} else {
				cuboidsShortcut(labelNum - CuboidsNumHotkeys)
			}
		}
	} else if (verType == 6) {
		globalShortcut(labelNum)
	}
	; else verType == 6; global custom hotkeys
	; LG, shortct()
	; Search for hotkey. globalShortcut(labelNum).
	; 	-> It would search for the same index as the assosicated array to trigger the hotkey. (Stored as a string?)
	;	-> Does SendInput, work with variables?

	; SVASE

	return
}


LIShortcut(x) {
	if (x == 1) { 
		crosswalkCW()
	} else if (x == 2) { 
		dashedWhite()
	} else if (x == 3) { 
		dashedYellow()
	} else if (x == 4) { 
		dashedSolidYellowSuicide()
	} else if (x == 5) { 
		doubleSolidYellowBi()
	} else if (x == 6) { 
		infParking()
	} else if (x == 7) { 
		shortDashedWhite()
	} else if (x == 8) { 
		shortDashedWhiteBike()
	} else if (x == 9) { 
		shortDashedWhiteShoulder()
	} else if (x == 10) { 
		solidRedParking()
	} else if (x == 11) { 
		solidRedShoulder()
	} else if (x == 12) { 
		solidRedShoulderParking()
	} else if (x == 13) { 
		solidWhiteBike()
	} else if (x == 14) { 
		solidWhiteBikeShoulder()
	} else if (x == 15) { 
		solidWhiteCW()
	} else if (x == 16) { 
		solidWhiteShoulder()
	} else if (x == 17) { 
		solidWhiteStop()
	} else if (x == 18) {
		solidYellowShoulder()
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

LGShortcut(x) {
	if (x == 1) {
		connTool()
	} else if (x == 2) {
		autoCenter()
	}
	return
}

generalShortcut(x) {
	if (x == 1) {
		spline()
	} else if (x == 2) {
		revDir()
	} else if (x == 3) {
		revReg()
	} else if (x == 4) {
		satTube()
	} else if (x == 5) {
		mapTiles()
	} else if (x == 6) {
		googleMaps()
	} else if (x == 7) {
		curMode()
	} else if (x == 8) {
		winSnapshot()
	} else if (x == 9) {
		firstIFR()
	} else if (x == 10) {
		lastIFR()
	} else if (x == 11) {
		labelSearch()
	} else if (x == 12) {
		bingMap()
	} else if (x == 13) {
		negativeROI()
	} else if (x == 14) {
		neighborROI()
	} else if (x == 15) {
		nearbyLabels()
	} else if (x == 16) {
		streetView()
	} else if (x == 17) {
		levelUp()
	} else if (x == 18) {
		levelDown()
	} else if (x == 19) {
		camForward()
	} else if (x == 20) {
		camBackward()
	} else if (x == 21) {
		teamsmute()
	}
	return
}

