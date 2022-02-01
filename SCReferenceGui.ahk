drawShortcutReferenceGUI() {
    global

    Gui, MainGui: +LastFound
    WinGetPos, xxx, yyy
    xxx += 100
    yyy += 100
    referenceText := "Shortcut Key Reference`n"
    referenceArray := ["J.Connection Tool", "Alt + x.Auto Center", "I.Spline", "[.Reverse Direction", "].Reverse Region", "Alt + Shift + T.Satellite Tube", "Alt + Shift + G.Google Tiles", "Alt + Shift + S.Cursor Mode", "Win + Shift + S.Windows Snapshot", "Alt + [.First IF", "Alt + ].Last IF", "Alt + Shift + =.Label Search", "Alt + M.Bing Maps", "Alt + Y.Negative ROI/ROI","Alt + Shift + N.Neighboring ROI", "Alt + S.Solo Mode", "Alt + A.QA Grid", "Ctrl + Alt + Q.Grid Lines"]

    Gui, ReferenceGui: Add, Text, ,%referenceText%
    Gui, ReferenceGui: Add, Listview, r20 w400 -Multi -LV0x10 Grid ReadOnly, Key|Action
    Gui, ReferenceGui:Default
 
    Loop % referenceArray.MaxIndex() {
        wordArray := StrSplit(referenceArray[A_Index], ".")
        LV_Add(, wordArray[1], wordArray[2])
    }

    LV_ModifyCol(1, 100)
    Gui, ReferenceGui: +AlwaysOnTop
    ;Gui, ReferenceGui: Add, Button, gCloseHelp vCloseHelp xp+5 yp+60, Close
    Gui, ReferenceGui: -MinimizeBox

    Gui, ReferenceGui: Show, x%xxx% y%yyy%, Help

    return
}

destroyShortcutReferenceGUI() {
    global
    referenceText := ""
    referenceArray := []
	Gui, ReferenceGui: Destroy
    GUi, MainGui: Default
    return
}