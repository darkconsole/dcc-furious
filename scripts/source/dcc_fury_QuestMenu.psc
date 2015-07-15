Scriptname dcc_fury_QuestMenu extends SKI_ConfigBase
dcc_fury_QuestController Property Furious Auto

;/*
• ▌ ▄ ·. ▄▄▄ . ▐ ▄ ▄• ▄▌    • ▌ ▄ ·.  ▄▄ • • ▌ ▄ ·. ▄▄▄▄▄
·██ ▐███▪▀▄.▀·•█▌▐██▪██▌    ·██ ▐███▪▐█ ▀ ▪·██ ▐███▪•██  
▐█ ▌▐▌▐█·▐▀▀▪▄▐█▐▐▌█▌▐█▌    ▐█ ▌▐▌▐█·▄█ ▀█▄▐█ ▌▐▌▐█· ▐█.▪
██ ██▌▐█▌▐█▄▄▌██▐█▌▐█▄█▌    ██ ██▌▐█▌▐█▄▪▐███ ██▌▐█▌ ▐█▌·
▀▀  █▪▀▀▀ ▀▀▀ ▀▀ █▪ ▀▀▀     ▀▀  █▪▀▀▀·▀▀▀▀ ▀▀  █▪▀▀▀ ▀▀▀ 
*/;

Int Function GetVersion()
	Return 1
EndFunction

Event OnGameReload()
{things to do when the game is loaded from disk.}

	parent.OnGameReload()

	;; ...

	Return
EndEvent

Event OnConfigInit()
{things to do when the menu initalises (is opening)}

	self.Pages = new String[2]
	self.Pages[0] = "General"
	self.Pages[1] = "Advanced"
	Return
EndEvent

Event OnConfigOpen()
{things to do when the menu actually opens.}

	self.OnConfigInit()
	Return
EndEvent

Event OnConfigClose()
{things to do when the menu closes.}

	Return
EndEvent

Event OnPageReset(string page)
{when a different tab is selected in the menu.}

	self.UnloadCustomContent()

	If(Page == "General")
		self.ShowPageGeneral()
	ElseIf(Page == "Advanced")
		self.ShowPageAdvanced()
	Else
		self.ShowPageIntro()
	EndIf

	Return
EndEvent

;/*
 ▄▄·  ▄ .▄▄▄▄ . ▄▄· ▄ •▄ ▄▄▄▄· .▄▄▄  ▐▄• ▄     ▄▄▄▄▄.▄▄▄   ▄▄ •  ▄▄ • ▄▄▌  ▄▄▄ .
▐█ ▌▪██▪▐█▀▄.▀·▐█ ▌▪█▌▄▌▪▐█ ▀█▪▐▀•▀█  █▌█▌▪    •██  ▐▀•▀█ ▐█ ▀ ▪▐█ ▀ ▪██•  ▀▄.▀·
██ ▄▄██▀▐█▐▀▀▪▄██ ▄▄▐▀▀▄·▐█▀▀█▄█▌·.█▌ ·██·      ▐█.▪█▌·.█▌▄█ ▀█▄▄█ ▀█▄██▪  ▐▀▀▪▄
▐███▌██▌▐▀▐█▄▄▌▐███▌▐█.█▌██▄▪▐█▐█▪▄█·▪▐█·█▌     ▐█▌·▐█▪▄█·▐█▄▪▐█▐█▄▪▐█▐█▌▐▌▐█▄▄▌
·▀▀▀ ▀▀▀ · ▀▀▀ ·▀▀▀ ·▀  ▀·▀▀▀▀ ·▀▀▀. •▀▀ ▀▀     ▀▀▀ ·▀▀▀. ·▀▀▀▀ ·▀▀▀▀ .▀▀▀  ▀▀▀ 
*/;

Event OnOptionSelect(Int Item)
	Bool Val

	If(Item == ItemBarbarian)
	;; BARBARIAN ENABLE
	;; handle making or unmaking the player a barbarian. this is a special
	;; option which will cause the menu to require a close for it to
	;; complete.

		If(Furious.IsBarbarian(Furious.Player))
			self.SetToggleOptionValue(Item,False)
			Furious.UnmakeBarbarian(Furious.Player)
		Else
			self.SetToggleOptionValue(Item,True)
			Furious.MakeBarbarian(Furious.Player)
		EndIf
		Debug.MessageBox("Close the menus to complete the change.")
		Utility.Wait(0.25)
		Return

	ElseIf(Item == ItemUpdatePlayer)
	;; BARBARIAN UPDATE
	;; handle updating an existing barbarian. all it is really doing is
	;; turning it off and then on again. but this way you can update after
	;; an update without having to menu twice.

		self.SetToggleOptionValue(Item,True)
		Debug.MessageBox("Close the menus to complete the update.")
		Utility.Wait(0.25)

		Furious.UnmakeBarbarian(Furious.Player)
		Utility.Wait(0.25)
		Furious.MakeBarbarian(Furious.Player)
		Return

	EndIf

	self.SetToggleOptionValue(Item,Val)
	Return
EndEvent

;/*
.▄▄ · ▄▄▌  ▪  ·▄▄▄▄  ▄▄▄ .▄▄▄      .▄▄▄   ▄▄▄·▄▄▄ . ▐ ▄ 
▐█ ▀. ██•  ██ ██▪ ██ ▀▄.▀·▀▄ █·    ▐▀•▀█ ▐█ ▄█▀▄.▀·•█▌▐█
▄▀▀▀█▄██▪  ▐█·▐█· ▐█▌▐▀▀▪▄▐▀▀▄     █▌·.█▌ ██▀·▐▀▀▪▄▐█▐▐▌
▐█▄▪▐█▐█▌▐▌▐█▌██. ██ ▐█▄▄▌▐█•█▌    ▐█▪▄█·▐█▪·•▐█▄▄▌██▐█▌
 ▀▀▀▀ .▀▀▀ ▀▀▀▀▀▀▀▀•  ▀▀▀ .▀  ▀    ·▀▀█. .▀    ▀▀▀ ▀▀ █▪
*/;

Event OnOptionSliderOpen(Int Item)
	Float Val
	Float Min
	Float Max
	Float Interval

	If(Item == ItemRageRegenCombat)
		Val = Furious.OptRageRegenCombat
		Min = 0.0
		Max = 5.0
		Interval = 0.1
	ElseIf(Item == ItemRageRegenIdle)
		Val = Furious.OptRageRegenIdle
		Min = 0.0
		Max = 5.0
		Interval = 0.1
	ElseIf(Item == ItemRageRegenBlock)
		Val = Furious.OptRageRegenBlock
		Min = 0.0
		Max = 20.0
	ElseIf(Item == ItemRageRegenHitBase)
		Val = Furious.OptRageRegenHitBase
		Min = 0.0
		Max = 20.0
	ElseIf(Item == ItemRageRegenHitPower)
		Val = Furious.OptRageRegenHitPower
		Min = 0.0
		Max = 40.0
	ElseIf(Item == ItemRageRegenHitBash)
		Val = Furious.OptRageRegenHitBash
		Min = 0.0
		Max = 20.0
	ElseIf(Item == ItemRageRegenHitSpell)
		Val = Furious.OptRageRegenHitSpell
		Min = 0.0
		Max = 30.0
	ElseIf(Item == ItemRageRegenHitEnch)
		Val = Furious.OptRageRegenHitEnch
		Min = 0.0
		Max = 10.0
	ElseIf(Item == ItemEnrageActive)
		Val = Furious.OptEnrageActive
		Min = 0.0
		Max = 50.0
	ElseIf(Item == ItemEnragePassive)
		Val = Furious.OptEnragePassive
		Min = 0.0
		Max = 10.0
	EndIf

	SetSliderDialogStartValue(Val)
	SetSliderDialogRange(Min,Max)
	SetSliderDialogInterval(Interval)
	Return
EndEvent

;/*
.▄▄ · ▄▄▌  ▪  ·▄▄▄▄  ▄▄▄ .▄▄▄       ▄▄▄·  ▄▄·  ▄▄· ▄▄▄ . ▄▄▄·▄▄▄▄▄
▐█ ▀. ██•  ██ ██▪ ██ ▀▄.▀·▀▄ █·    ▐█ ▀█ ▐█ ▌▪▐█ ▌▪▀▄.▀·▐█ ▄█•██  
▄▀▀▀█▄██▪  ▐█·▐█· ▐█▌▐▀▀▪▄▐▀▀▄     ▄█▀▀█ ██ ▄▄██ ▄▄▐▀▀▪▄ ██▀· ▐█.▪
▐█▄▪▐█▐█▌▐▌▐█▌██. ██ ▐█▄▄▌▐█•█▌    ▐█ ▪▐▌▐███▌▐███▌▐█▄▄▌▐█▪·• ▐█▌·
 ▀▀▀▀ .▀▀▀ ▀▀▀▀▀▀▀▀•  ▀▀▀ .▀  ▀     ▀  ▀ ·▀▀▀ ·▀▀▀  ▀▀▀ .▀    ▀▀▀ 
*/;

Event OnOptionSliderAccept(Int Item, Float Val)
	String Fmt

	If(Item == ItemRageRegenCombat)
		Furious.OptRageRegenCombat = Val
		Fmt = "{1}%"
	ElseIf(Item == ItemRageRegenIdle)
		Val = Val * -1
		Furious.OptRageRegenIdle = Val
		Fmt = "{1}%"
	ElseIf(Item == ItemRageRegenBlock)
		Furious.OptRageRegenBlock = Val
		Fmt = "{1}%"
	ElseIf(Item == ItemRageRegenHitBase)
		Furious.OptRageRegenHitBase = Val
		Fmt = "{1}%"
	ElseIf(Item == ItemRageRegenHitPower)
		Furious.OptRageRegenHitPower = Val
		Fmt = "{1}%"
	ElseIf(Item == ItemRageRegenHitBash)
		Furious.OptRageRegenHitBash = Val
		Fmt = "{1}%"
	ElseIf(Item == ItemRageRegenHitRange)
		Furious.OptRageRegenHitRange = Val
		Fmt = "{1}%"
	ElseIf(Item == ItemRageRegenHitSpell)
		Furious.OptRageRegenHitSpell = Val
		Fmt = "{1}%"
	ElseIf(Item == ItemRageRegenHitEnch)
		Furious.OptRageRegenHitEnch = Val
		Fmt = "{1}%"
	ElseIf(Item == ItemEnrageActive)
		Furious.OptEnrageActive = Val
		Fmt = "{1}%"
	ElseIf(Item == ItemEnragePassive)
		Furious.OptEnragePassive = Val
		Fmt = "{1}%"
	EndIf

	SetSliderOptionValue(Item,Val,Fmt)
	Return
EndEvent

;/*
▄▄▄▄▄.▄▄▄  .▄▄▄  ▄▄▌  ▄▄▄▄▄▪   ▄▄▄·.▄▄ · 
•██  ▐▀•▀█ ▐▀•▀█ ██•  •██  ██ ▐█ ▄█▐█ ▀. 
 ▐█.▪█▌·.█▌█▌·.█▌██▪   ▐█.▪▐█· ██▀·▄▀▀▀█▄
 ▐█▌·▐█▪▄█·▐█▪▄█·▐█▌▐▌ ▐█▌·▐█▌▐█▪·•▐█▄▪▐█
 ▀▀▀ ·▀▀█. ·▀▀█. .▀▀▀  ▀▀▀ ▀▀▀.▀    ▀▀▀▀ 
*/;

Event OnOptionHighlight(Int Item)

	If(Item == ItemBarbarian)
		self.SetInfoText("Toggle your barbarian status on/off. You will need to quit the MCM for the change to take effect.")
	ElseIf(Item == ItemUpdatePlayer)
		self.SetInfoText("Do this if you updated the mod to make sure you have the newest spells n shit.")
	ElseIf(Item == ItemRageRegenCombat)
		self.SetInfoText("This is how much rage you generate passively just by being in combat per second. (% of max)")
	ElseIf(Item == ItemRageRegenIdle)
		self.SetInfoText("This is how much rage you lose passively by not being in combat per second. (% of max)")
	ElseIf(Item == ItemRageRegenHitBase)
		self.SetInfoText("How much rage you generate everytime you are hit. (% of max)")
	ElseIf(Item == ItemRageRegenHitPower)
		self.SetInfoText("How much ADDITIONAL rage you generate if hit by a power attack. (% of max)")
	ElseIf(Item == ItemRageRegenHitBash)
		self.SetInfoText("How much ADDITIONAL rage you generate if hit by a shield bash. (% of max)")
	ElseIf(Item == ItemRageRegenHitRange)
		self.SetInfoText("How much ADDITIONAL rage you generate if hit by a ranged attack. (% of max)")
	ElseIf(Item == ItemRageRegenHitSpell)
		self.SetInfoText("How much ADDITIONAL rage you generate if hit by a magick attack. (% of max)")
	ElseIf(Item == ItemRageRegenHitEnch)
		self.SetInfoText("How much ADDITIONAL rage you generate if hit by an enchanted weapon, per enchantment. (% of max)")
	ElseIf(Item == ItemRageRegenBlock)
		self.SetInfoText("How much ADDITIONAL rage you generate when successfully blocking an attack. You get this much more rage for each point into the Shield Wall perk you have spent. (% of max)")
	ElseIf(Item == ItemEnrageActive)
		self.SetInfoText("How much rage you gain (and health you lose) when you Enrage.")
	ElseIf(Item == ItemEnragePassive)
		self.SetInfoText("How much rage you gain (and health you lose) per second after Enrage.")
	Else
		self.SetInfoText("Furious")
	EndIf

	Return
EndEvent

;/*
▪   ▐ ▄ ▄▄▄▄▄▄▄▄  .▄▄▄      ▄▄▄▄▄ ▄▄▄· ▄▄▄▄· 
██ •█▌▐█•██  ▀▄ █·▐▀•▀█     •██  ▐█ ▀█ ▐█ ▀█▪
▐█·▐█▐▐▌ ▐█.▪▐▀▀▄ █▌·.█▌     ▐█.▪▄█▀▀█ ▐█▀▀█▄
▐█▌██▐█▌ ▐█▌·▐█•█▌▐█▪▄█·     ▐█▌·▐█ ▪▐▌██▄▪▐█
▀▀▀▀▀ █▪ ▀▀▀ .▀  ▀·▀▀█.      ▀▀▀  ▀  ▀ ·▀▀▀▀ 
*/;

Function ShowPageIntro()
	LoadCustomContent("dcc-furious/splash.dds")
	Return
EndFunction

;/*
 ▄▄ • ▄▄▄ . ▐ ▄ ▄▄▄ .▄▄▄   ▄▄▄· ▄▄▌      ▄▄▄▄▄ ▄▄▄· ▄▄▄▄· 
▐█ ▀ ▪▀▄.▀·•█▌▐█▀▄.▀·▀▄ █·▐█ ▀█ ██•      •██  ▐█ ▀█ ▐█ ▀█▪
▄█ ▀█▄▐▀▀▪▄▐█▐▐▌▐▀▀▪▄▐▀▀▄ ▄█▀▀█ ██▪       ▐█.▪▄█▀▀█ ▐█▀▀█▄
▐█▄▪▐█▐█▄▄▌██▐█▌▐█▄▄▌▐█•█▌▐█ ▪▐▌▐█▌▐▌     ▐█▌·▐█ ▪▐▌██▄▪▐█
·▀▀▀▀  ▀▀▀ ▀▀ █▪ ▀▀▀ .▀  ▀ ▀  ▀ .▀▀▀      ▀▀▀  ▀  ▀ ·▀▀▀▀ 
*/;

Int ItemBarbarian
Int ItemUpdatePlayer

Function ShowPageGeneral()
	self.SetTitleText("General Settings")
	self.SetCursorFillMode(TOP_TO_BOTTOM)

	self.SetCursorPosition(0)
	self.AddHeaderOption("Mod Setup")
	ItemBarbarian = self.AddToggleOption("BARBARIAN ENABLE",Furious.IsBarbarian(Furious.Player))
	ItemUpdatePlayer = self.AddToggleOption("BARBARIAN UPGRADE",False)

	Return
EndFunction

;/*
 ▄▄▄· ·▄▄▄▄   ▌ ▐· ▄▄▄·  ▐ ▄  ▄▄· ▄▄▄ .·▄▄▄▄      ▄▄▄▄▄ ▄▄▄· ▄▄▄▄· 
▐█ ▀█ ██▪ ██ ▪█·█▌▐█ ▀█ •█▌▐█▐█ ▌▪▀▄.▀·██▪ ██     •██  ▐█ ▀█ ▐█ ▀█▪
▄█▀▀█ ▐█· ▐█▌▐█▐█•▄█▀▀█ ▐█▐▐▌██ ▄▄▐▀▀▪▄▐█· ▐█▌     ▐█.▪▄█▀▀█ ▐█▀▀█▄
▐█ ▪▐▌██. ██  ███ ▐█ ▪▐▌██▐█▌▐███▌▐█▄▄▌██. ██      ▐█▌·▐█ ▪▐▌██▄▪▐█
 ▀  ▀ ▀▀▀▀▀• . ▀   ▀  ▀ ▀▀ █▪·▀▀▀  ▀▀▀ ▀▀▀▀▀•      ▀▀▀  ▀  ▀ ·▀▀▀▀ 
*/;

Int ItemRageRegenCombat
Int ItemRageRegenIdle
Int ItemRageRegenBlock
Int ItemRageRegenHitBase
Int ItemRageRegenHitPower
Int ItemRageRegenHitBash
Int ItemRageRegenHitRange
Int ItemRageRegenHitSpell
Int ItemRageRegenHitEnch
Int ItemEnrageActive
Int ItemEnragePassive

Function ShowPageAdvanced()
	self.SetTitleText("Advanced Settings")
	self.SetCursorFillMode(LEFT_TO_RIGHT)
	self.SetCursorPosition(0)

	self.AddHeaderOption("Rage Generation")
		self.AddEmptyOption()
	ItemRageRegenCombat = self.AddSliderOption("In Combat",Furious.OptRageRegenCombat,"{1}%")
		ItemRageRegenIdle = self.AddSliderOption("Out of Combat",Furious.OptRageRegenCombat,"{1}%")

	self.AddHeaderOption("Rage Gen When Hit")
		self.AddEmptyOption()
	ItemRageRegenHitBase = self.AddSliderOption("By Normal Attack",Furious.OptRageRegenHitBase,"{1}%")
		ItemRageRegenHitPower = self.AddSliderOption("By Power Attack",Furious.OptRageRegenHitPower,"{1}%")
	ItemRageRegenHitBash = self.AddSliderOption("By Bash Attack",Furious.OptRageRegenHitBash,"{1}%")
		ItemRageRegenHitRange = self.AddSliderOption("By Ranged Attack",Furious.OptRageRegenHitRange,"{1}%")
	ItemRageRegenHitSpell = self.AddSliderOption("By Magick",Furious.OptRageRegenHitSpell,"{1}%")
		ItemRageRegenHitEnch = self.AddSliderOption("By Enchanted Items",Furious.OptRageRegenHitEnch,"{1}%")
	ItemRageRegenHitEnch = self.AddSliderOption("Is Blocked (Shield Wall Perk)",Furious.OptRageRegenHitEnch,"{1}%")
		self.AddEmptyOption()

	self.AddHeaderOption("Spell: Enrage")
		self.AddEmptyOption()
	ItemEnrageActive = self.AddSliderOption("Initial Rage Gain",Furious.OptEnrageActive,"{1}%")
		ItemEnragePassive = self.AddSliderOption("Passive Rage Gain",Furious.OptEnragePassive,"{1}%")

	Return
EndFunction
