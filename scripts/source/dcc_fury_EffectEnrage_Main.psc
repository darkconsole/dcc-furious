Scriptname dcc_fury_EffectEnrage_Main extends ActiveMagicEffect
{Instantly restore 25% of your fury, and generate 2% per second afterwards, at the cost of health.}

dcc_fury_QuestController Property Furious Auto

Actor Property Me Auto Hidden

Event OnEffectStart(Actor target, Actor caster)
	self.Me = target

	Furious.ModActorValuePercent(self.Me,"Health",-0.25)
	Furious.ModActorValuePercent(self.Me,"Magicka",0.25)
	self.OnUpdate()

	Return
EndEvent

Event OnUpdate()
	Furious.ModActorValuePercent(self.Me,"Health",-0.01)
	Furious.ModActorValuePercent(self.Me,"Magicka",0.01)
	self.RegisterForSingleUpdate(1.0)
	Return
EndEvent
