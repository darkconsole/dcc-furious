Scriptname dcc_fury_EffectBloodForBlood_Imod extends ActiveMagicEffect
{it turns out ability effects do not trigger image space modifiers when their
conditions toggle them on and off. so now i have to have a stupid script do
this shit.}

Int Property Level Auto
dcc_fury_QuestController Property Furious Auto

Event OnEffectStart(Actor target, Actor Caster)
	Furious.dcc_fury_ImodBloodHaze[self.Level].ApplyCrossFade(1.0)
	Return
EndEvent

Event OnEffectFinish(Actor target, Actor caster)
	Utility.Wait(1.5)
	Furious.dcc_fury_ImodBloodHaze[self.Level].Remove()
	Return
EndEvent