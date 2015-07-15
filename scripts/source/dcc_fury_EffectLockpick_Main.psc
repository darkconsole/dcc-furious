Scriptname dcc_fury_EffectLockpick_Main extends ActiveMagicEffect
{BARBARIAN LOCKPICKING}

Event OnEffectStart(Actor Me, Actor AlsoMe)
	If(Me != Game.GetPlayer())
		Return
	EndIf

	self.UnlockTargeted(Me)
	Return
EndEvent

Function UnlockTargeted(Actor Who)
{try and open the object currently under the crosshair. there is a 25% base
chance you will succeed, which is increased by your lockpicking skill. also
for the lulz, when you do open, we will bump your lockpicking skills.}

	ObjectReference What = Game.GetCurrentCrosshairRef()

	If(What == None || !What.IsLocked())
		Debug.Notification("This object does not seem to be locked.")
		Return
	EndIf

	If(!Who.PlayAnimationAndWait("attackStart","done"))
		Debug.Notification("debug: was unable to do animation.")
		Return
	EndIf

	If(Utility.RandomInt(1,100) < (25 + (Who.GetActorValue("Lockpicking") * 0.75)))
		What.Lock(False)

		Debug.Notification("The lock gives away. The object may now be opened.")
		If(Who == Game.GetPlayer())
			Game.IncrementSkill("Lockpicking")
		EndIf
	Else
		Debug.Notification("The lock holds.")
	EndIF

	Return
EndFunction
