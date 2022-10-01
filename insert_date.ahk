;. 引数うけとり
date_prefix := "<monthcal$%&>"
date_num = %1%
if ( date_num == "today" )
	date_num := ""
xpix = %2%
if ( xpix == "" )
	xpix := "Center"
ypix = %3%
if ( ypix == "" )
	ypix := "Center"

;. GUI
Gui, +AlwaysOnTop -Caption
Gui, Add, MonthCal, vdate_num +Theme, %date_num%
Gui, Add, Button, W80 X20 Default, OK
Gui, Add, Button, W80 X+0, Cancel
Gui, Add, Button, W20 X+0 gHelp, ?
Gui, Show, X%xpix% Y%ypix%, test
Return

;. 割り込み
ButtonOK:
	Gui, Submit
	date_num := date_prefix . date_num
	FileAppend, %date_num%, *
ButtonCancel:
GuiEscape:
GuiClose:
  Gui, Destroy
  ExitApp
Return

Help:
	run, %A_ScriptDir%\readme.html
Return
