drawHelpGUI() {
    global

    Gui, MainGui: +LastFound
    WinGetPos, xxx, yyy
    xxx += 100
    yyy += 100
    helpText := "Welcome to FLIDE 3D LG Helper v2.0`n"
    helpText .= "Please visit the documentation for further information.`n"
	helpText .= "If you encounter any incorrect keybinds, go to File > Reload Script.`n"
    helpText .= "If you still require further assistance, please reach out to Billy Yu. @bilyu`n"
    Gui, HelpGui: Add, Text, ,%helpText%
    Gui, HelpGui: +AlwaysOnTop
    Gui, HelpGui: Add, Button, gCloseHelp vCloseHelp xp+5 yp+60, Close
    Gui, HelpGui: -MinimizeBox

    Gui, HelpGui: Show, x%xxx% y%yyy%

    return
}

destoryHelpGUI() {
    global
    helpText := ""
	Gui, HelpGui: Destroy
    return
}