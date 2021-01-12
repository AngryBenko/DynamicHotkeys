init() {
	if (!FileExist(ININame)) { ;This was run for the first time
		SetupFixedHotKeys()
	} else {
		LoadSettings()
	}
	
	return
}