Scriptname dcc_fury_Effect_PlaySound extends ActiveMagicEffect

Sound Property OnStart_Source Auto
Sound Property OnStart_Target Auto
Sound Property OnFinish_Source Auto
Sound Property OnFinish_Target Auto

Event OnEffectStart(Actor Target, Actor Caster)

	If(self.OnStart_Source != None && Caster != None)
		self.OnStart_Source.Play(Caster)
	EndIf

	If(self.OnStart_Target != None && Target != None)
		self.OnStart_Target.Play(Target)
	EndIf

	Return
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)

	If(self.OnFinish_Source != None && Caster != None)
		self.OnFinish_Source.Play(Caster)
	EndIf

	If(self.OnFinish_Target != None && Target != None)
		self.OnFinish_Target.Play(Target)
	EndIf

	Return
EndEvent
