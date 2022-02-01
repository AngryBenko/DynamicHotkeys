drawAboutGUI() {
    global

    Gui, MainGui: +LastFound
    WinGetPos, xxx, yyy
    xxx += 100
    yyy += 100
    aboutText := "Welcome to FLIDE 3D AllinOne v" versionNum "`n"
    aboutText .= "This script was based off James Shultz script `n"
    aboutText .= "Please visit the user manunal on Lane Graph Home Page for further information.`n"
	aboutText .= "If you encounter any incorrect keybinds, go to File > Reload Script.`n"
    aboutText .= "If you still require further assistance, please reach out to Billy Yu. @bilyu`n"

    if (darkMode) {
        Gui, AboutGui: Color, c202020
        Gui, AboutGui: Font, ce0e0e0
    }

    Gui, AboutGui: Font, s10 Normal, Segoe UI
    Gui, AboutGui: Add, Text, ,%aboutText%
    Gui, AboutGui: +AlwaysOnTop
    Gui, AboutGui: -MinimizeBox

    Gui, AboutGui: Show, x%xxx% y%yyy%, Help

    return
}

destroyAboutGUI() {
    global
    aboutText := ""
	Gui, AboutGui: Destroy
    return
}