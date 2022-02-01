drawSSBGUI() {
	global
	
	Gui, MainGui: +LastFound
	Gui, SSBGui: +Resize +AlwaysOnTop -MaximizeBox -MinimizeBox
	Gui, SSBGui: Show, Center w300 h100, ~
	
	return
}

destroySSBGUI() {
	global
		Gui, SSBGui: Destroy
	return
}