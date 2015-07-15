Scriptname dcc_fury_EffectBarbarian_Main extends ActiveMagicEffect
{handles fury regen.}

dcc_fury_QuestController Property Furious Auto

Actor Property Me Auto Hidden

Event OnEffectStart(Actor target, Actor caster)
	self.Me = target
	self.OnUpdate()
	Return
EndEvent

Event OnHit(ObjectReference Who, Form What, Projectile Bullet, Bool Power, Bool Sneak, Bool Bash, Bool Blocked)
{as far as we can tell there is no way to determine how much you were hit for,
at least not with an actual not ghetto way. until that discovery is made we
will gain fury based on a percentage of our max fury.}

	float Value = (Furious.OptRageRegenHitBase/100)

	;; getting hit by a power attack is really going to piss you off.
	If(Power)
		Value += (Furious.OptRageRegenHitPower/100)
	EndIf

	;; getting bashed will make you a little more angry.
	If(Bash)
		Value += (Furious.OptRageRegenHitBash/100)
	EndIf

	;; ranged weapons are for cowards. barbarians hate cowards.
	If(Bullet != None)
		Value += (Furious.OptRageRegenHitRange/100)
	EndIf

	;; the only things barbarians hate more than archers, are mages.
	If(What as Spell != None)
		Value += (Furious.OptRageRegenHitSpell/100)
	EndIf

	;; magic in general is for assholes.
	If(What as Enchantment != None)
		Value += (Furious.OptRageRegenHitEnch/100)
	EndIf

	;; each point in the shield wall perk will increase fury generated
	;; on successful blocks by 5%.
	If(Blocked)
		int b = 0
		While(b < Furious.PerkShieldWall.Length)
			If(self.Me.HasPerk(Furious.PerkShieldWall[b]))
				Value += (Furious.OptRageRegenBlock/100)
			EndIf
			b += 1
		EndWhile
	EndIf

	Furious.ModActorValuePercent(self.Me,"Magicka",Value)	
	Return
EndEvent

Event OnUpdate()
{handle passive range generation and drain.}

	If(!self.Me.IsInCombat())
		Furious.ModActorValuePercent(self.Me,"Magicka",(Furious.OptRageRegenIdle/100))
	Else
		Furious.ModActorValuePercent(self.Me,"Magicka",(Furious.OptRageRegenCombat/100))
	EndIf

	;; this is...
	self.Me.ForceActorValue("MagickaRateMult",0.0)
	;; ...a dumb crutch until i figure out if it is possible to 0 out regen
	;; via magic effect. initial tests were less than stellar.
	;; update - this isn't so bad afterall, as it will break the mana regen
	;; potions for us, which is a behaviour we do infact want.

	self.RegisterForSingleUpdate(1.0)
	Return
EndEvent

