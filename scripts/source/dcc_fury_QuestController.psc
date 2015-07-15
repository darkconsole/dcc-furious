Scriptname dcc_fury_QuestController extends Quest

;/*****************************************************************************
▄▄▄▄·  ▄▄▄· .▄▄ · ▄▄▄ .     ▄▄▄·▄▄▄  .▄▄▄   ▄▄▄·▄▄▄ .▄▄▄  ▄▄▄▄▄▪  ▄▄▄ ..▄▄ · 
▐█ ▀█▪▐█ ▀█ ▐█ ▀. ▀▄.▀·    ▐█ ▄█▀▄ █·▐▀•▀█ ▐█ ▄█▀▄.▀·▀▄ █·•██  ██ ▀▄.▀·▐█ ▀. 
▐█▀▀█▄▄█▀▀█ ▄▀▀▀█▄▐▀▀▪▄     ██▀·▐▀▀▄ █▌·.█▌ ██▀·▐▀▀▪▄▐▀▀▄  ▐█.▪▐█·▐▀▀▪▄▄▀▀▀█▄
██▄▪▐█▐█ ▪▐▌▐█▄▪▐█▐█▄▄▌    ▐█▪·•▐█•█▌▐█▪▄█·▐█▪·•▐█▄▄▌▐█•█▌ ▐█▌·▐█▌▐█▄▄▌▐█▄▪▐█
·▀▀▀▀  ▀  ▀  ▀▀▀▀  ▀▀▀     .▀   .▀  ▀·▀▀▀. .▀    ▀▀▀ .▀  ▀ ▀▀▀ ▀▀▀ ▀▀▀  ▀▀▀▀ 
*****************************************************************************/;

;; forms from the vanilla game we need to reference.

Actor Property Player Auto
Perk[] Property PerkShieldWall Auto


;/*****************************************************************************
• ▌ ▄ ·. .▄▄▄  ·▄▄▄▄       ▄▄▄·▄▄▄  .▄▄▄   ▄▄▄·▄▄▄ .▄▄▄  ▄▄▄▄▄▪  ▄▄▄ ..▄▄ · 
·██ ▐███▪▐▀•▀█ ██▪ ██     ▐█ ▄█▀▄ █·▐▀•▀█ ▐█ ▄█▀▄.▀·▀▄ █·•██  ██ ▀▄.▀·▐█ ▀. 
▐█ ▌▐▌▐█·█▌·.█▌▐█· ▐█▌     ██▀·▐▀▀▄ █▌·.█▌ ██▀·▐▀▀▪▄▐▀▀▄  ▐█.▪▐█·▐▀▀▪▄▄▀▀▀█▄
██ ██▌▐█▌▐█▪▄█·██. ██     ▐█▪·•▐█•█▌▐█▪▄█·▐█▪·•▐█▄▄▌▐█•█▌ ▐█▌·▐█▌▐█▄▄▌▐█▄▪▐█
▀▀  █▪▀▀▀·▀▀▀  ▀▀▀▀▀•     .▀   .▀  ▀·▀▀▀. .▀    ▀▀▀ .▀  ▀ ▀▀▀ ▀▀▀ ▀▀▀  ▀▀▀▀                           
*****************************************************************************/;

;; forms added by this mod.

ImagespaceModifier[] Property dcc_fury_ImodBloodHaze Auto

Spell Property dcc_fury_SpellBarbarian Auto
Spell Property dcc_fury_SpellBloodForBlood Auto
Spell Property dcc_fury_SpellEnrage Auto
Spell Property dcc_fury_SpellLockpick Auto
Spell Property dcc_fury_SpellShockwave Auto

;/*****************************************************************************
• ▌ ▄ ·. .▄▄▄  ·▄▄▄▄       ▄▄· .▄▄▄   ▐ ▄ ·▄▄▄▪   ▄▄ • 
·██ ▐███▪▐▀•▀█ ██▪ ██     ▐█ ▌▪▐▀•▀█ •█▌▐█▐▄▄·██ ▐█ ▀ ▪
▐█ ▌▐▌▐█·█▌·.█▌▐█· ▐█▌    ██ ▄▄█▌·.█▌▐█▐▐▌██▪ ▐█·▄█ ▀█▄
██ ██▌▐█▌▐█▪▄█·██. ██     ▐███▌▐█▪▄█·██▐█▌██▌.▐█▌▐█▄▪▐█
▀▀  █▪▀▀▀·▀▀▀. ▀▀▀▀▀•     ·▀▀▀ ·▀▀▀. ▀▀ █▪▀▀▀ ▀▀▀·▀▀▀▀ 
*****************************************************************************/;

;; values which are intended to be changable via the mcm.

Float Property OptRageRegenHitBase  =  10.0 Auto Hidden
Float Property OptRageRegenHitPower =  20.0 Auto Hidden
Float Property OptRageRegenHitBash  =  5.0  Auto Hidden
Float Property OptRageRegenHitRange =  10.0 Auto Hidden
Float Property OptRageRegenHitSpell =  15.0 Auto Hidden
Float Property OptRageRegenHitEnch  =  5.0  Auto Hidden
Float Property OptRageRegenBlock    =  5.0  Auto Hidden
Float Property OptRageRegenCombat   =  1.0  Auto Hidden
Float Property OptRageRegenIdle     = -2.0  Auto Hidden

Float Property OptEnrageActive = 0.25 Auto Hidden
Float Property OptEnragePassive = 0.01 Auto Hidden

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;/*****************************************************************************
• ▌ ▄ ·. .▄▄▄  ·▄▄▄▄      • ▌ ▄ ·.  ▄▄ • • ▌ ▄ ·. ▄▄▄▄▄     ▄▄▄·  ▄▄▄·▪▄  
·██ ▐███▪▐▀•▀█ ██▪ ██     ·██ ▐███▪▐█ ▀ ▪·██ ▐███▪•██      ▐█ ▀█ ▐█ ▄█ █ 
▐█ ▌▐▌▐█·█▌·.█▌▐█· ▐█▌    ▐█ ▌▐▌▐█·▄█ ▀█▄▐█ ▌▐▌▐█· ▐█.▪    ▄█▀▀█  ██▀·▐█·
██ ██▌▐█▌▐█▪▄█·██. ██     ██ ██▌▐█▌▐█▄▪▐███ ██▌▐█▌ ▐█▌·    ▐█ ▪▐▌▐█▪·•▐█▌
▀▀  █▪▀▀▀·▀▀▀. ▀▀▀▀▀•     ▀▀  █▪▀▀▀·▀▀▀▀ ▀▀  █▪▀▀▀ ▀▀▀      ▀  ▀ .▀   ▀▀▀
*****************************************************************************/;

Event Init()
{catch when the mod is first installed.}

	self.ResetMod_Values()

	Return
EndEvent

Function ResetMod()
{reset the entire mod to the default state.}

	self.ResetMod_Values()
	self.ResetMod_Quests()

	Return
EndFunction

Function ResetMod_Quests()
{request any quests involved.}

	self.Reset()
	self.Stop()
	self.Start()

	Return
EndFunction

Function ResetMod_Values()
{return all values to a default state.}

	self.OptRageRegenHitBase = 10.0
	self.OptRageRegenHitPower = 20.0
	self.OptRageRegenHitBash = 5.0
	self.OptRageRegenHitRange = 10.0
	self.OptRageRegenHitSpell = 15.0
	self.OptRageRegenHitEnch = 5.0
	self.OptRageRegenBlock = 5.0
	self.OptRageRegenCombat = 1.0
	self.OptRageRegenIdle = -2.0

	Return
EndFunction

;/*****************************************************************************
 ▄▄▄·  ▄▄· ▄▄▄▄▄.▄▄▄  ▄▄▄       ▌ ▐· ▄▄▄· ▄▄▌  ▄• ▄▌▄▄▄ .     ▄▄▄·  ▄▄▄·▪▄  
▐█ ▀█ ▐█ ▌▪•██  ▐▀•▀█ ▀▄ █·    ▪█·█▌▐█ ▀█ ██•  █▪ █▌▀▄.▀·    ▐█ ▀█ ▐█ ▄█ █ 
▄█▀▀█ ██ ▄▄ ▐█.▪█▌·.█▌▐▀▀▄     ▐█▐█•▄█▀▀█ ██▪  █▌  ▌▐▀▀▪▄    ▄█▀▀█  ██▀·▐█·
▐█ ▪▐▌▐███▌ ▐█▌·▐█▪▄█·▐█•█▌     ███ ▐█ ▪▐▌▐█▌  ▐█▄█▌▐█▄▄▌    ▐█ ▪▐▌▐█▪·•▐█▌
 ▀  ▀ ·▀▀▀  ▀▀▀ ·▀▀█. .▀  ▀    . ▀   ▀  ▀ .▀▀▀▀ ▀▀▀  ▀▀▀      ▀  ▀ .▀   ▀▀▀
*****************************************************************************/;

;; these are functions to handle dealing with modifying actor values like
;; Health, Stamina, and Magicka. They may not be too applicable for the other
;; actor values. they will use the restore and damage apis to trigger the api
;; to update when it needs to.

Function ModActorValue(Actor who, String What, Float Amount)
{modify the actor value by the specified amount, triggering ui updates.}

	If(Amount > 0)
		Who.RestoreActorValue( What, Amount )
	Else
		Who.DamageActorValue( What, Amount )
	EndIf

	Return
EndFunction

Function ModActorValuePercent(Actor Who, String What, Float Percent)
{same as ModActorValue but instead will operate on a percentage of their total
pool for the value.}

	If(Percent > 0)
		Who.RestoreActorValue( What, (Who.GetBaseActorValue(What) * Percent) )
	Else
		Who.DamageActorValue( What, (Who.GetBaseActorValue(What) * (Percent*-1)) )
	EndIf

	Return
EndFunction

Function ModActorValuePercentCurrent(Actor Who, String What, Float Percent)
{same as ModActorValue but instead will operate on a percentage of their total
pool for the value.}

	If(Percent > 0)
		Who.RestoreActorValue( What, (Who.GetActorValuePercentage(What) * Percent) )
	Else
		Who.DamageActorValue( What, (Who.GetActorValuePercentage(What) * (Percent*-1)) )
	EndIf

	Return
EndFunction

;/*****************************************************************************
 ▄▄▄·  ▄▄· ▄▄▄▄▄.▄▄▄  ▄▄▄      • ▌ ▄ ·.  ▄▄ • • ▌ ▄ ·. ▄▄▄▄▄
▐█ ▀█ ▐█ ▌▪•██  ▐▀•▀█ ▀▄ █·    ·██ ▐███▪▐█ ▀ ▪·██ ▐███▪•██  
▄█▀▀█ ██ ▄▄ ▐█.▪█▌·.█▌▐▀▀▄     ▐█ ▌▐▌▐█·▄█ ▀█▄▐█ ▌▐▌▐█· ▐█.▪
▐█ ▪▐▌▐███▌ ▐█▌·▐█▪▄█·▐█•█▌    ██ ██▌▐█▌▐█▄▪▐███ ██▌▐█▌ ▐█▌·
 ▀  ▀ ·▀▀▀  ▀▀▀ ·▀▀▀. .▀  ▀    ▀▀  █▪▀▀▀·▀▀▀▀ ▀▀  █▪▀▀▀ ▀▀▀ 
*****************************************************************************/;

;; check and handle if a specified actor is a barbarian as well as handle
;; making them or unmaking them. this will include setting up any base values
;; and adding the core spell set.

Bool Function IsBarbarian(Actor Who)
{a simple check to see if an actor is a barbarian. we are just going to check
for the presense of the main barbarian buff spell to determine this.}

	Return Who.HasSpell(self.dcc_fury_SpellBarbarian)
EndFunction

Function MakeBarbarian(Actor Who)
{convert an actor into a barbaric actor.}

	Debug.Notification(Who.GetDisplayName() + " has become a Barbarian")
	Who.ForceActorValue("MagickaRateMult",0.0)
	Who.AddSpell(self.dcc_fury_SpellBarbarian,True)
	Who.AddSpell(self.dcc_fury_SpellBloodForBlood,False)
	Who.AddSpell(self.dcc_fury_SpellEnrage,False)
	Who.AddSpell(self.dcc_fury_SpellLockpick,False)
	Who.AddSpell(self.dcc_fury_SpellShockwave,False)

	Return
EndFunction

Function UnmakeBarbarian(Actor Who)
{restore an actor to normal boring skyrim citizen status.}

	Debug.Notification(Who.GetDisplayName() + " is no longer a Barbarian")
	Who.ForceActorValue("MagickaRateMult",100.0)
	Who.RemoveSpell(self.dcc_fury_SpellBarbarian)
	Who.RemoveSpell(self.dcc_fury_SpellBloodForBlood)
	Who.RemoveSpell(self.dcc_fury_SpellEnrage)
	Who.RemoveSpell(self.dcc_fury_SpellLockpick)
	Who.RemoveSpell(self.dcc_fury_SpellShockwave)

	Return
EndFunction

