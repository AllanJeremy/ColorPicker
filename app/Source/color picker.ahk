/*
	Color picker for windows
	Right click your mouse while pressing Ctrl and get the color of the pixels under the mouse copied to the clipboard.
	Code by Martin@mxdapps
*/

#SingleInstance,force
#Persistent
default = _hex

;edit the menu
menu,tray,nostandard
menu,Output,add,HEX
menu,Output,add,RGB
menu,tray,add,Output,:Output
menu,tray,add
menu,tray,add,Quit
return


;right click function
^RButton::
MouseGetPos,x,y
PixelGetColor,var,x,y,rgb
StringReplace,hex,var,0x,`#,all
SplitRGBColor(var, Red, Green, Blue)
rgb = rgb(%red%,%green%,%blue%)
if default = _hex
	color := hex
else
	color := rgb
Clipboard := color
TrayTip,%color%,Color copied to clipboard
return

hex:
default=_hex
TrayTip,Color Picker,Your color will be saved as Hex e.g. #FAFAFA
return

rgb:
default=_rgb
TrayTip,Color Picker,Your color will be saved as RGB e.g. rgb(222`,222`,222)
return

quit:
ExitApp

;get RGB
SplitRGBColor(RGBColor, ByRef Red, ByRef Green, ByRef Blue)
{
    Red := RGBColor >> 16 & 0xFF
    Green := RGBColor >> 8 & 0xFF
    Blue := RGBColor & 0xFF
}
