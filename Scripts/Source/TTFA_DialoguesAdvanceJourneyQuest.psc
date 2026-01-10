;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
scriptname TTFA_DialoguesAdvanceJourneyQuest extends TopicInfo hidden

Int Property NewStage Auto 
GlobalVariable Property TTFA_FastredRomance  Auto 
GlobalVariable Property TTFA_FastredFollower  Auto  

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
;BEGIN CODE
    if(TTFA_FastredRomance)
        TTFA_FastredRomance.SetValue(1)
    endif
    if(TTFA_FastredFollower)
        TTFA_FastredFollower.SetValue(1)
    endif

    GetOwningQuest().SetStage(NewStage)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment