init() {
	global
	if (!FileExist(ININame)) { ;This was run for the first time
		; Does not update for all workflows; Should probably createa an init var for save settings
		firstRun := 1
		SetupFixedHotKeys()
		SaveSettings()
	} else {
		firstRun := 0
		LoadSettings()
		height := guiHeightModifier()
		width := guiWidthModifier()
	}
	
	return
}