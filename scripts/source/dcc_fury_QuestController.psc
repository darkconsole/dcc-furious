Scriptname dcc_fury_QuestController extends Quest

Actor Property Player Auto

Perk[] Property PerkShieldWall Auto

ImagespaceModifier[] Property dcc_fury_ImodBloodHaze Auto
Spell Property dcc_fury_SpellBarbarian Auto
Spell Property dcc_fury_SpellBloodForBlood Auto
Spell Property dcc_fury_SpellEnrage Auto
Spell Property dcc_fury_SpellLockpick Auto
Spell Property dcc_fury_SpellShockwave Auto

Bool Function IsBarbarian(Actor Who)
	Return Who.HasSpell(self.dcc_fury_SpellBarbarian)
EndFunction

Function MakeBarbarian(Actor Who)
{give all the barb spells.}

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
{remove all barb spells.}

	Debug.Notification(Who.GetDisplayName() + " is no longer a Barbarian")
	Who.ForceActorValue("MagickaRateMult",100.0)
	Who.RemoveSpell(self.dcc_fury_SpellBarbarian)
	Who.RemoveSpell(self.dcc_fury_SpellBloodForBlood)
	Who.RemoveSpell(self.dcc_fury_SpellEnrage)
	Who.RemoveSpell(self.dcc_fury_SpellLockpick)
	Who.RemoveSpell(self.dcc_fury_SpellShockwave)

	Return
EndFunction

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
