Scriptname dcc_fury_EffectEnrage_Main extends ActiveMagicEffect
{Instantly restore 25% of your fury, and generate 2% per second afterwards, at the cost of health.}

dcc_fury_QuestController Property Furious Auto

Actor Property Me Auto Hidden

Event OnEffectStart(Actor target, Actor caster)
	self.Me = target

	Furious.ModActorValuePercent(self.Me,"Health",((Furious.OptEnrageActive/100)*-1))
	Furious.ModActorValuePercent(self.Me,"Magicka",(Furious.OptEnrageActive/100))
	self.OnUpdate()

	Return
EndEvent

Event OnUpdate()
	Furious.ModActorValuePercent(self.Me,"Health",((Furious.OptEnragePassive/100)*-1))
	Furious.ModActorValuePercent(self.Me,"Magicka",(Furious.OptEnragePassive/100))
	self.RegisterForSingleUpdate(1.0)
	Return
EndEvent
