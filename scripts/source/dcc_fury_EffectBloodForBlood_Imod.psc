Scriptname dcc_fury_EffectBloodForBlood_Imod extends ActiveMagicEffect
{it turns out ability effects do not trigger image space modifiers when their
conditions toggle them on and off. so now i have to have a stupid script do
this shit.}

Int Property Level Auto
dcc_fury_QuestController Property Furious Auto

Event OnEffectStart(Actor target, Actor Caster)

	;; writing my own fade because the cross-fade chain is a half finished or
	;; only half accessable pos.

	Float pow = 0.0
	While(pow <= 1.0)
		Furious.dcc_fury_ImodBloodHaze[self.Level].Apply(pow)
		Utility.Wait(0.1)

		pow += 0.1
	EndWhile	

	Return
EndEvent

Event OnEffectFinish(Actor target, Actor caster)
	Utility.Wait(1.5)

	If(target.GetActorValuePercentage("Health") >= 0.5)
		Float pow = 1.0
		While(pow >= 0.0)
			Furious.dcc_fury_ImodBloodHaze[self.Level].Apply(pow)
			Utility.Wait(0.1)

			pow -= 0.1
		EndWhile
	EndIf

	Furious.dcc_fury_ImodBloodHaze[self.Level].Remove()
	Return
EndEvent
