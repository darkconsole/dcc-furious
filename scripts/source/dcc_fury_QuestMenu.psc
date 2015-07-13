Scriptname dcc_fury_QuestMenu extends SKI_ConfigBase

dcc_fury_QuestController Property Furious Auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Int Function GetVersion()
	Return 1
EndFunction

Event OnGameReload()
	parent.OnGameReload()

	;; game load things here.

	Return
EndEvent

Event OnVersionUpdate(Int ver)
	self.OnConfigInit()
	Return
EndEvent

Event OnConfigInit()
	self.Pages = new String[1]
	self.Pages[0] = "General"
	Return
EndEvent

Event OnConfigOpen()
	self.OnConfigInit()
	Return
EndEvent

Event OnConfigClose()
	Return
EndEvent

Event OnPageReset(string page)
	self.UnloadCustomContent()

	If(Page == "General")
		self.ShowPageGeneral()
	Else
		self.ShowPageIntro()
	EndIf

	Return
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnOptionSelect(Int Item)
	Bool Val
	Bool SetVal = True

	If(Item == ItemBarbarian)
		SetVal = False
		If(Furious.IsBarbarian(Furious.Player))
			Furious.UnmakeBarbarian(Furious.Player)
		Else
			Furious.MakeBarbarian(Furious.Player)
		EndIf

		Debug.MessageBox("Close to menus to complete the change.")
		Utility.Wait(0.5)
	EndIf

	If(SetVal)
		self.SetToggleOptionValue(Item,Val)
	EndIf

	Return
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnOptionSliderOpen(Int Item)
	Float val
	Float min
	Float max
	Float interval

	;;

	SetSliderDialogStartValue(val)
	SetSliderDialogRange(min,max)
	SetSliderDialogInterval(interval)
	Return
EndEvent

Event OnOptionSliderAccept(Int Item, Float Val)
	String Fmt

	;;

	SetSliderOptionValue(Item,Val,Fmt)
	Return
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnOptionHighlight(Int Item)

	If(Item == ItemBarbarian)
		self.SetInfoText("Toggle your barbarian status on/off. You will need to quit the MCM for the change to take effect.")
	Else
		self.SetInfoText("Furious")
	EndIf

	Return
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function ShowPageIntro()
	LoadCustomContent("dcc-furious/splash.dds")
	Return
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Int ItemBarbarian

Function ShowPageGeneral()
	SetTitleText("General Settings")
	SetCursorFillMode(TOP_TO_BOTTOM)

	SetCursorPosition(0)
	AddHeaderOption("Basic")
	ItemBarbarian = AddToggleOption("I AM BARBARIAN",Furious.IsBarbarian(Furious.Player))

	Return
EndFunction
