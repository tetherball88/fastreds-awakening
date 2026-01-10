;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__010000C0 Extends TopicInfo Hidden

Scene Property TTFA_JourneyQuestRomanceFastredDinya  Auto  

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
    ; start Fastred Dinya dialogue
    TTFA_JourneyQuestRomanceFastredDinya.ForceStart()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
