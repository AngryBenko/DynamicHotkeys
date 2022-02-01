#SingleInstance, force
#NoEnv
#MaxHotkeysPerInterval 200
#MenuMaskkey vkE8
CoordMode, Mouse, Relative
;#InstallKeybdHook
;#InstallMouseHook

/*
TODO:
- CODE REFRACTORING TIME!
*/

#Include, %A_ScriptDir%\lib\HotkeyDistribution.ahk
#Include, %A_ScriptDir%\lib\HotkeyAction.ahk
#Include, %A_ScriptDir%\lib\MainGui.ahk
#Include, %A_ScriptDir%\lib\EditGui.ahk
#Include, %A_ScriptDir%\lib\AboutGui.ahk
#Include, %A_ScriptDir%\lib\SCReferenceGui.ahk
#Include, %A_ScriptDir%\lib\SSBGui.ahk
#Include, %A_ScriptDir%\lib\Utilities.ahk
#Include, %A_ScriptDir%\lib\Bind.ahk
#Include, %A_ScriptDir%\lib\SetupFixedHotkeys.ahk
#Include, %A_ScriptDir%\lib\LoadSaveSettings.ahk
#Include, %A_ScriptDir%\lib\EnableHotkeys.ahk
#Include, %A_ScriptDir%\lib\DisableHotkeys.ahk
#Include, %A_ScriptDir%\lib\UpdateHotkeyControls.ahk
#Include, %A_ScriptDir%\lib\Init.ahk
#Include, %A_ScriptDir%\lib\Lines.ahk
#Include, %A_ScriptDir%\lib\QuickToolTip.ahk
; scripted by Billy Yu
;
; ----- VK/Scan Codes ------
; VK | SC | Key 
; 60  052	Numpad0/NumpadIns
; 61  04F	Numpad1/NumpadEnd
; 62  050	Numpad2/NumpadDown
; 63  051	Numpad3/NumpadPgDn
; 64  04B   Numpad4/NumpadLeft
; 65  04C   Numpad5/NumpadClear
; 66  04D   Numpad6/NumpadRight
; 67  047   Numpad7/NumpadHome
; 68  048   Numpad8/NumpadUp
; 69  049   Numpad9/NumpadPgUp
;--------- TO-DO ------------
; 
;----------------------------
; Build list of "End Keys" for Input command
global EXTRA_KEY_LIST := "{Escape}"	; DO NOT REMOVE! - Used to quit binding
global EXTRA_KEY_LIST .= "{Ins}"
global ALL_EXTRA_KEY_LIST := ""
; Standard non-printables
global EXTRA_KEY_LIST .= "{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}"
;global EXTRA_KEY_LIST .= "{Left}{Right}{Up}{Down}"
;global EXTRA_KEY_LIST .= "{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BackSpace}{Pause}"
; Numpad - Numlock ON
;global EXTRA_KEY_LIST .= "{Numpad0}{Numpad1}{Numpad2}{Numpad3}{Numpad4}{Numpad5}{Numpad6}{Numpad7}{Numpad8}{Numpad9}{NumpadDot}{NumpadMult}{NumpadAdd}{NumpadSub}"
; Numpad - Numlock OFF
;global EXTRA_KEY_LIST .= "{NumpadIns}{NumpadEnd}{NumpadDown}{NumpadPgDn}{NumpadLeft}{NumpadClear}{NumpadRight}{NumpadHome}{NumpadUp}{NumpadPgUp}{NumpadDel}"
; Numpad - Common
;global EXTRA_KEY_LIST .= "{NumpadMult}{NumpadAdd}{NumpadSub}{NumpadDiv}{NumpadEnter}"
; Stuff we may or may not want to trap
;EXTRA_KEY_LIST .= "{Numlock}"
;global EXTRA_KEY_LIST .= "{Tab}{Enter}{Backspace}"
;EXTRA_KEY_LIST .= "{PrintScreen}"
; Browser keys
;EXTRA_KEY_LIST .= "{Browser_Back}{Browser_Forward}{Browser_Refresh}{Browser_Stop}{Browser_Search}{Browser_Favorites}{Browser_Home}"
; Media keys
;EXTRA_KEY_LIST .= "{Volume_Mute}{Volume_Down}{Volume_Up}{Media_Next}{Media_Prev}{Media_Stop}{Media_Play_Pause}"
; App Keys
;EXTRA_KEY_LIST .= "{Launch_Mail}{Launch_Media}{Launch_App1}{Launch_App2}"

; BindMode vars
global versionNum := "1.6" ; Major.Minor.Patch | Minor should change if we add new keybinds or change keybinds functionality
global HKControlType := 0
global HKModifierState := {}
global HKLastHotkey := 0 ; Time that Escape was pressed to exit key binding. Used to determine if Escape is held (Clear binding)
global DefaultHKObject := {hkp: "", typep: ""}
global DefaultCustomObject := {hkp: ""}

; Misc vars
global firstRun := 0
global Title := BuildTitleName()
global VersionVar := ["HotkeyList", "LIHotkeyList", "REHotkeyList", "LGHotkeyList", "SVASEHotkeyList"]
global DisplayVar := ["Spline", "Reverse Direction", "Reverse Region", "Satellite Tube", "Map Tiles", "Google Maps", "Cursor Mode", "Windows Snapshot", "First IF", "Last IF", "Label Search", "Bing Maps", "Negative ROI", "Neighboring ROI", "Nearby Labels", "Street View", "Level UP", "Level DOWN", "Camera Forward", "Camera Backward", "MS Teams Mute"]
global LIDisplayVar := ["Crosswalk Crosswalk-RF", "Dashed White", "Dashed Yellow", "Dashed Solid Yellow Suicide-RF", "Double Solid Yellow Bidirectional", "Inferred Parking", "Short Dashed White", "Short Dashed White Bike-RA", "Short Dashed White Shoulder-RA", "Solid Red Parking-RF", "Solid Red Shoulder-RF", "Solid Red Shoulder/Parking", "Solid White Bike-RA", "Solid White Bike/Shoulder", "Solid White Crosswalk-RF", "Solid White Shoulder-RA", "Solid White Stop-Semantic", "Solid Yellow Shoulder-RA"]
global LIDisplayVarAdd := []
global REDisplayVar := ["Road Boundary", "Median Flow-Separating", "Median Flow-Same", "Intersection Island", "Roundabout"]
global LGDisplayVar := ["Type Lane", "Type Left_Bounded", "Type Right_Bounded", "Type Connection", "Type Bidirectional", "Type Roundabout", "Type Guide"]
global LGDisplayVar2 := ["Connection Tool", "Auto Center"]
global SVASEDisplayVar := []

global CuboidsDisplayVar := ["Unknown", "Car", "MiniVan", "SUV", "Van", "Small_Truck", "Large_Truck", "Pickup", "Bus", "Animal", "Trailer", "Scooter", "Skateboard", "Wheelchair", "Other", "Bicycle", "Motorbike", "Pedestrian", "Train"]
global CuboidsDisplayVar2 := ["Image Lidar", "Stacked Lidar", "Isolate Cuboid", "Depth Dense", "Image Radar", "Cycle Keyframes", "Pitch", "Boundary Grid"]
global ININame := BuildIniName()
global LIHotkeyList := []
global REHotkeyList := []
global LGHotkeyList := []
global SVASEHotkeyList := []
global CuboidsHotkeyList := []

global globalHotkeyDisplayVar := []
global globalHotkeyList := []
global globalHotkeyListRef := []

global workflowCheck := "Line"
global prevWFCheck := "Line"

global NumHotkeys := DisplayVar.MaxIndex()
global LINumHotkeys := LIDisplayVar.MaxIndex()
global LINumHotkeysAdd := LIDisplayVarAdd.MaxIndex()
global RENumHotkeys := REDisplayVar.MaxIndex()
global LGNumHotkeys := LGDisplayVar.MaxIndex()
global LGNumHotkeysA := LGDisplayVar2.MaxIndex()
global SVASENumHotkeys := 0
global CuboidsNumHotkeys := CuboidsDisplayVar.MaxIndex()
global CuboidsNumHotkeysA := CuboidsDisplayVar2.MaxIndex()
global globalNumHotkeys := 5

global disCamCheck := True
global atopcheck := False
global darkMode := False

global switch := False
global confirm := False

global height := 0
global width := 0

; Create the GUI, using a Loop feature that auto updates the GUI


init()

drawMainGUI()

LoadSettings()

OptionChanged()

return ;

Reload:
	SetupFixedHotKeys()
	OptionChanged()
	Reload
	return

ATop:
	atopcheck := !atopcheck
	updateFileMenu()
	return

EditGui: ;Reduce Gui to functions
	drawEditGUI()
	return

DisableCamera:
	disCamCheck := !disCamCheck
	refreshUI()

	OptionChanged()
	return

DarkMode:
	darkMode := !darkMode
	refreshUI()
	OptionChanged()
	return

DisplaySSB:
ssBlocker:
	drawSSBGUI()
	return
	
MenuHandler:
	return

About:
	drawAboutGUI()
	return

SCReference:
	drawShortcutReferenceGUI()
	return

CloseAbout:
AboutGuiGuiClose:
	destroyAboutGUI()
	return

CloseEdit:
EditGuiGuiClose:
	destroyEditGUI()
	return

CloseReference:
ReferenceGuiGuiClose:
	destroyShortcutReferenceGUI()
	return

Yes:
No:
	switch := True
	confirm := A_GuiControl
	return

ResetAll:
	confirmationWindow()
	
	Loop {
		while (!switch) {
			Sleep 100
		}
		switch := False
		Gui, Confirm: Submit
		break
	}
	
	if (confirm == Yes) {
		resetAllDefault()
	}
	return

SSBGuiGuiClose:
	destroySSBGUI()
	return
	
CloseApp:
	ExitApp
	return
	
	
DisplayWindow:
	Gui, MainGui: Show
	return

NameSubmit:
	Gui, EditName: Submit

	globalHotkeyDisplayVar[substr(A_GuiControl, 8)] := NameSubmit
	
	UpdateHotkeyControls()
	SaveSettings()
	Gui, EditName: Destroy
	return
	
Workflow:
	global workflowCheck
	
	; depending on the workflow, change GUI and load proper settings
	Gui, Submit, NoHide
	
	prevWFCheck := workflowCheck
	workflowCheck := Workflow

	refreshUI()

	OptionChanged()
	
	return

; -------------- Keybinds ------------------------
; Test that bound hotkeys work
DoHotkey1:
	shortcutAutoDist(substr(A_ThisLabel, 9))
	return

DoHotkey2:
	shortcutAutoDist(substr(A_ThisLabel, 9))
	return

DoHotkey3:
	shortcutAutoDist(substr(A_ThisLabel, 9))
	return

DoHotkey4:
	shortcutAutoDist(substr(A_ThisLabel, 9))
	return

DoHotkey5:
	shortcutAutoDist(substr(A_ThisLabel, 9))
	return

DoHotkey6: ; global custom hotkeys
	shortcutAutoDist(substr(A_ThisLabel, 9))
	;MsgBox, Sussy
	return

TeamsMute:
	teamsmute()
	;msgbox TEAMSMUTE
	return

; Something changed - rebuild
OptionChanged:
	OptionChanged()
	return

; Detects a pressed key combination
Bind1:
	Bind(substr(A_GuiControl,7), 1) 
	return

Bind2:
	Bind(substr(A_GuiControl,8), 2)
	return
	
CustomHKName:
	changeCustomHKName(substr(A_GuiControl, 8))
	return

Reset:
	if (substr(A_GuiControl,1,1) == 6) {
		DeleteHotKey(substr(A_GuiControl, 8))
	} else {
		DeleteHotKey(substr(A_GuiControl, 7))
	}
	return


EscapeReleased:
	hotkey, Escape up, EscapeReleased, OFF
	return

; Enables User-Defined Hotkeys
; ======= Development Tools ===========

F3::
	OptionChanged()
	Reload
	return


^!h::
	quickToolTip()
	return

~LButton Up::
	/*
	hwnd := WinExist("ahk_class tooltips_class32")
	MouseGetPos, x, y, win
	if (win == hwnd) {
		removeToolTip()
	}
	*/
	removeToolTip()
	return

#If BindMode ; This is will allow mouse buttons and enter to be solo keybinds
	; Detect down of modifier keys
	*lctrl::
	*rctrl::
	*lalt::
	*ralt::
	*lshift::
	*rshift::
	*lwin::
	*rwin::
	*xbutton2::
	*xbutton1::
	*mbutton::
		mod := substr(A_ThisHotkey, 2)
		SetModifier(mod, 1)
		return
	
	; Detect up of modifier keys
	/*
	*xbutton2 up::
	*xbutton1 up::
	*mbutton up::
		mod := substr(substr(A_ThisHotkey, 2), 1, strlen(A_ThisHotkey) - 4)
		ct := CurrentModifierCount()
		;FileAppend, %ct%, *
		if (CurrentModifierCount() == 1) {
			HKControlType := 1
			HKSecondaryInput := mod

			Send {Escape}
		}

		SetModifier(mod, 0)
		return
	*/
	/*
	xbutton1::
	xbutton2::
		global HKControlType := 4
		global HKSecondaryInput := A_ThisHotkey
		Send {Escape}
		return
	enter::
		global HKControlType := 4
		global HKSecondaryInput := A_ThisHotkey
		Send {Escape}
		return
		*/
	/*
	*lctrl::
	*rctrl::
	*lalt::
	*ralt::
	*lshift::
	*rshift::
	*lwin::
	*rwin::
		mod := substr(A_ThisHotkey,2)
		SetModifier(mod,1)
		return

	; Detect key up of modifier keys
	*lctrl up::
	*rctrl up::
	*lalt up::
	*ralt up::
	*lshift up::
	*rshift up::
	*lwin up::
	*rwin up::
		; Strip * from beginning, " up" from end etc
		mod := substr(substr(A_ThisHotkey,2),1,strlen(A_ThisHotkey) -4)
		if (CurrentModifierCount() == 1){
			; If CurrentModifierCount is 1 when an up is received, then that is a Solitary Modifier
			; It cannot be a modifier + normal key, as this code would have quit on keydown of normal key

			HKControlType := 1
			HKSecondaryInput := mod

			; Send Escape - This will cause the Input command to quit with an EndKey of Escape
			; But we stored the modifier key, so we will know it was not really escape
			Send {Escape}
		}
		SetModifier(mod,0)
		return

	; Detect Mouse buttons
	lbutton::
	rbutton::
	mbutton::
	xbutton1::
	xbutton2::
	wheelup::
	wheeldown::
	wheelleft::
	wheelright::
		HKControlType := 2
		HKSecondaryInput := A_ThisHotkey
		Send {Escape}
		return
	*/
#If