; Example: Tab control:

Global MyCheckbox
Global MyRadio
Global MyEdit

Hotkey, ^+r, abreJanela


Gui, Add, Tab2,, First Tab|Second Tab|Third Tab  ; Tab2 vs. Tab requires [v1.0.47.05+].
Gui, Add, Checkbox, vMyCheckbox, Sample checkbox
Gui, Tab, 2
Gui, Add, Radio, vMyRadio, Sample radio1
Gui, Add, Radio,, Sample radio2
Gui, Tab, 3
Gui, Add, Edit, vMyEdit r5  ; r5 means 5 rows tall.
Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.
Gui, Add, Button, default xm, Close  ; xm puts it at the bottom left corner.

abreJanela()
{
    
    Gui, Show
    return

    ButtonClose:
    GuiClose:
    GuiEscape:
    Gui, Submit  ; Save each control's contents to its associated variable.
    MsgBox You entered:`n%MyCheckbox%`n%MyRadio%`n%MyEdit%

    return
}