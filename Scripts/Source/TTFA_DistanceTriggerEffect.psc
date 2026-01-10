Scriptname TTFA_DistanceTriggerEffect extends ActiveMagicEffect  

TTFA_JourneyQuest Property TTFA_JourneyQst Auto
Spell Property TTFA_DistanceTriggerAbility  Auto  

; triggers this effect when it's close enough to target, replacement to trigger box to not change wrold cell and avoid merge conflicts with other mods
; it sets ability with this effect only for particular stages and removes it each time effect is applied
Event OnEffectStart(Actor akTarget, Actor akCaster)
    if(TTFA_JourneyQst.GetStage() == 50)
        TTFA_JourneyQst.SetStage(55)
    endif
    akTarget.RemoveSpell(TTFA_DistanceTriggerAbility)
EndEvent


