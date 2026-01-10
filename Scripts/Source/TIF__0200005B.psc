;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0200005B Extends TopicInfo Hidden

Faction Property MarriageAskedFaction Auto
QF_RelationshipMarriageCourti_00074793 Property RelationshipMarriage Auto

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
    ; player proposed to Fastred
    akSpeaker.AddtoFaction(MarriageAskedFaction)
    RelationshipMarriage.Alias_LoveInterest.ForceRefTo(akSpeaker)
    RelationshipMarriage.SetStage(20)

;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
