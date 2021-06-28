#SingleInstance, force
#NoEnv
#MaxHotkeysPerInterval 200
#MenuMaskkey vkE8
;#InstallKeybdHook
;#InstallMouseHook

/*
TODO:
- Add support for mmo mouse
- New added hotkeys
	- Pitch | Alt + Q/E
	- Cycle Keyframes | Ctrl + Arrow
	- Boundary Grid | Ctrl + Shift + G
*/

#Include, %A_ScriptDir%\lib\hotkeyAction.ahk
#Include, %A_ScriptDir%\lib\mainGui.ahk
#Include, %A_ScriptDir%\lib\EditGui.ahk
#Include, %A_ScriptDir%\lib\HelpGui.ahk
#Include, %A_ScriptDir%\lib\Utilities.ahk
#Include, %A_ScriptDir%\lib\Bind.ahk
#Include, %A_ScriptDir%\lib\SetupFixedHotkeys.ahk
#Include, %A_ScriptDir%\lib\LoadSaveSettings.ahk
#Include, %A_ScriptDir%\lib\EnableHotkeys.ahk
#Include, %A_ScriptDir%\lib\DisableHotkeys.ahk
#Include, %A_ScriptDir%\lib\UpdateHotkeyControls.ahk
#Include, %A_ScriptDir%\lib\Init.ahk
#Include, %A_ScriptDir%\lib\Lines.ahk
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
; Standard non-printables
;global EXTRA_KEY_LIST .= "{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}"
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
global versionNum := 1.1
global HKControlType := 0
global HKModifierState := {}
global HKLastHotkey := 0 ; Time that Escape was pressed to exit key binding. Used to determine if Escape is held (Clear binding)
global DefaultHKObject := {hkp: "", typep: ""}

; Misc vars
global firstRun := 0
global Title := "FLIDE 3D AllinOne"
global VersionVar := ["HotkeyList", "LIHotkeyList", "REHotkeyList", "LGHotkeyList", "SVASEHotkeyList"]
global DisplayVar := ["Spline", "Connection Tool", "Reverse Direction", "Reverse Region", "Satellite Tube", "Google Tiles", "Cursor Mode", "Windows Snapshot", "First IF", "Last IF", "Camera Forward", "Camera Backward"]
global LIDisplayVar := ["Double Solid Yellow Median", "Solid Yellow Median", "Dashed White", "Solid White Shoulder", "Solid White Line Crosswalk", "Solid White Line Crosswalk/Intersection", "Crosswalk Crosswalk-Region", "Crosswalk Crosswalk/Intersection", "Double Solid Yellow Bidirectional", "Inferred Parking", "Dashed Solid Yellow Suicide", "Solid White Bike Region", "Solid White Bike/Shoulder", "Short Dashed Normal", "Short Dashed Bike", "Short Dashed Shoulder", "Solid White Intersection"]
global LIDisplayVarAdd := ["Solid White Parking", "Inferred Shoulder/Parking", "Inferred Cross/'Unknown", "Inferred CW/Parking", "Reversible Parking Line", "Dashed Bidirectional Yellow Line", "Solid Bidirectional White Line", "Solid Bidirecttional Yellow Line"]
global REDisplayVar := ["Road Boundary", "Median Flow-Separating", "Median Flow-Same", "Intersection Island", "Roundabout", "Under_Roof"]
global LGDisplayVar := ["Type Lane", "Type Left_Bounded", "Type Right_Bounded", "Type Connection", "Type Bidirectional", "Type Roundabout", "Type Guide"]
/*

*/
global CuboidsDisplayVar := ["Unknown", "Car", "MiniVan", "SUV", "Van", "Small_Truck", "Large_Truck", "Pickup", "Bus", "Animal", "Trailer", "Scooter", "Skateboard", "Wheelchair", "Other", "Bicycle", "Motorbike", "Pedestrian", "Train"]
global CuboidsDisplayVar2 := ["Image Lidar", "Stacked Lidar", "Isolate Cuboid", "Depth Dense", "Image Radar", "Cycle Keyframes", "Pitch", "Boundary Grid"]
global ININame := BuildIniName()
global LIHotkeyList := []
global REHotkeyList := []
global LGHotkeyList := []
global SVASEHotkeyList := []
global CuboidsHotkeyList := []

global modCheck := 2
global specialCheck := 2
global workflowCheck := "Line"
global prevWFCheck := "Line"
global camDisable1 := 0
global camDisable2 := 0

global NumHotkeys := 13 ; 13
global LINumHotkeys := 17
global LINumHotkeysAdd := 8
global RENumHotkeys := 6
global LGNumHotkeys := 7
global SVASENumHotkeys := 0
global CuboidsNumHotkeys := 19
global CuboidsNumHotkeysA := 5


global ypos := 67
global xOffset := 0

global atopcheck := 0
global minclosecheck := 0

height := 0
width := 0

; Create the GUI, using a Loop feature that auto updates the GUI

;general .= "General Info`n"

;LoadSettings()

init()
; call heightmod
height := guiHeightModifier()
width := guiWidthModifier()
/*
drawHeaderGUI()

drawWorkflowGUI(1)
*/
drawMainGUI()
;drawGlobalGUI()
; Set GUI State
LoadSettings()
;SaveSettings()
;SetupFixedHotKeys()

; Enable defined hotkeys
EnableHotkeys()

;SaveSettings()

return ;

MinClose:
	minclosecheck := !minclosecheck
	updateFileMenu()
	return

ATop:
	atopcheck := !atopcheck
	updateFileMenu()
	return

2ndGui: ;Reduce Gui to functions
	drawEditGUI()
	return

MenuHandler:
	return

Reload:
	SetupFixedHotKeys()
	OptionChanged()
	Reload
	return

Help:
	drawHelpGUI()
	return

CloseHelp:
HelpGuiGuiClose:
	destoryHelpGUI()
	return

CloseEdit:
EditGuiGuiClose:
	destoryEditGUI()
	return

	/*
MainGuiGuiClose:
	;getMinClose()
	ExitApp
	return
	*/
	
DisplayWindow:
	Gui, MainGui: Show
	return
	
Workflow:
	global workflowCheck
	
	; depending on the workflow, change GUI and load proper settings
	Gui, Submit, NoHide
	
	prevWFCheck := workflowCheck
	workflowCheck := Workflow

	destroyMainGUI()
	; redraw GUI
	global height := guiHeightModifier()
	global width := guiWidthModifier()
	drawMainGUI()
	/*
	drawHeaderGUI()
	drawWorkflowGUI()
	*/
	;drawGlobalGUI()
	UpdateHotkeyControls()

	OptionChanged()
	
	return
	
CamCheck:
	Gui, Submit, NoHide
	
	workflowCheck := Workflow

	OptionChanged()
	UpdateHotkeyControls()
	return

SpecialChoice:
	global specialCheck

	Gui, Submit, Nohide

	prevWFCheck := workflowCheck
	specialCheck := SpecialChoice

	;FileAppend SPECIAL: %specialCheck%`n, *
	;GuiControl, MainGui: Disable, SpecialChoice
	UpdateHotkeyControls()
	OptionChanged()

	;GuiControl, MainGui: Enable, SpecialChoice
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
	Bind(substr(A_GuiControl,7), 2) ; param: 1 or 2 (prim or sec)
	return


Reset:
	DeleteHotKey(substr(A_GuiControl, 7))
	return

HKEnable:
	;HKEnable(substr(A_GuiControl, 10,))
	return

EscapeReleased:
	hotkey, Escape up, EscapeReleased, OFF
	return

; Enables User-Defined Hotkeys


#If BindMode ; This is will allow mouse buttons and enter to be solo keybinds
	; Detect down of modifier keys
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
#If
