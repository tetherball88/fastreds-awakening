;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname TTFA_JourneyQuest Extends Quest Hidden

;BEGIN ALIAS PROPERTY Boti
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boti Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fastred
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fastred Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jofthor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jofthor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Klimmek
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Klimmek Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bassianus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bassianus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dinya
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dinya Auto
;END ALIAS PROPERTY

Scene Property TTFA_JourneyQuestParentsConfront  Auto  

Scene Property TTFA_JourneyQuestParentsKeepTraveling  Auto  

Scene Property TTFA_JourneyQuestSuitorsKeepTraveling  Auto  

Spell Property TTFA_DistanceTriggerAbility  Auto  

GlobalVariable Property TTFA_FastredRomance  Auto 

Faction Property PotentialMarriageFaction  Auto
Faction Property PotentialFollowerFaction  Auto
DialogueFollowerScript Property DialogueFollower  Auto

QF_T02_000211D5 Property t02 Auto

int travelDialogue = -1

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
    ; stage 45
    RegisterForSingleUpdateGameTime(TTFA_Utils.GetTravelDialoguesWaitTime(4))
    SwitchTravelTalkObjective(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
    ; stage 40
    SwitchTravelTalkObjective(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
    ; stage 50 rejected
    ReturnToIvarstead()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
    ; stage 0
    SetObjectiveDisplayed(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
    ; stage 200. Quest complete and Fastred has to choose vanilla endings
    VanillaFinishQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; stage 75
    Actor Fastred = Alias_Fastred.GetActorRef()
    int newRank = 3
    if(TTFA_FastredRomance.GetValue())
        newRank = 4
        Fastred.AddToFaction(PotentialMarriageFaction)
    else
        BlockVanillaPaths()
    endif
    Fastred.SetRelationshipRank(Alias_Player.GetActorRef(), newRank)
    TTFA_JourneyQuestParentsKeepTraveling.ForceStart()
    SetObjectiveCompleted(55)
    SetObjectiveDisplayed(75, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
    ; stage 25
    Alias_Fastred.GetActorRef().SetRelationshipRank(Alias_Player.GetActorRef(), 2)
    RegisterForSingleUpdateGameTime(TTFA_Utils.GetTravelDialoguesWaitTime(2))
    SwitchTravelTalkObjective(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
    ; stage 15
    Alias_Fastred.GetActorRef().SetRelationshipRank(Alias_Player.GetActorRef(), 1)
    RegisterForSingleUpdateGameTime(TTFA_Utils.GetTravelDialoguesWaitTime(1))
    SetObjectiveCompleted(10)
    SetObjectiveDisplayed(15, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
    ; stage 47
    SwitchTravelTalkObjective(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
    ; stage 55
    SetObjectiveCompleted(50)
    SetObjectiveDisplayed(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
    ; stage 20
    SwitchTravelTalkObjective(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
    ; stage 50 feel same way
    Alias_Fastred.GetActorRef().SetRelationshipRank(Alias_Player.GetActorRef(), 4)
    ReturnToIvarstead()
    ; Block vanilla paths, Fastred chose player
    BlockVanillaPaths()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
    ; stage 300
    VanillaFinishQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
    ; stage 35
    RegisterForSingleUpdateGameTime(TTFA_Utils.GetTravelDialoguesWaitTime(3))
    SwitchTravelTalkObjective(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
    ; stage 90 non-romance
    AlternativeFinishQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
    ; stage 10
    TTFA_JourneyQuestParentsConfront.ForceStart()
    SetObjectiveCompleted(0)
    SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
    ; stage 30
    SwitchTravelTalkObjective(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
    ; stage 85
    SetObjectiveCompleted(80)
    SetObjectiveDisplayed(85)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; stage 80
    TTFA_JourneyQuestSuitorsKeepTraveling.ForceStart()
    SetObjectiveCompleted(75)
    SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
    ; stage 90 romance
    AlternativeFinishQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Event OnUpdateGameTime()
    if(travelDialogue == -1)
        travelDialogue = 0
        SetStage(20)
    elseif(travelDialogue == 0)
        travelDialogue = 1
        SetStage(30)
    elseif(travelDialogue == 1)
        travelDialogue = 2
        SetStage(40)
    elseif(travelDialogue == 2)
        travelDialogue = 3
        SetStage(47)
    endif
EndEvent

Function SwitchTravelTalkObjective(bool travel) 
    if(travel)
        SetObjectiveDisplayed(20, false)
        SetObjectiveDisplayed(15, true, true)
    else
        SetObjectiveDisplayed(20, true, true)
        SetObjectiveDisplayed(15, false)
    endif
EndFunction

Function ReturnToIvarstead()
    SetObjectiveCompleted(15)
    SetObjectiveCompleted(20)
    SetObjectiveDisplayed(50)
    Alias_Player.GetActorRef().AddSpell(TTFA_DistanceTriggerAbility)
EndFunction

Function VanillaFinishQuest()
    CompleteAllObjectives()
    CompleteQuest()
    Stop()
EndFunction

Function AlternativeFinishQuest()
    ; finish book of love fastred's stage
    t02.SetObjectiveCompleted(10, 1)
    t02.SetObjectiveCompleted(20, 1)
    t02.SetStage(30)

    ; Finish our quest
    CompleteAllObjectives()
    CompleteQuest()

    Actor Fastred = Alias_Fastred.GetActorRef()
    DialogueFollower.SetFollower(Fastred)
    Fastred.AddToFaction(PotentialFollowerFaction)


    Stop()
EndFunction

Function BlockVanillaPaths()
    t02.setStage(25)
    t02.SetObjectiveFailed(20)
    t02.SetObjectiveFailed(25)
EndFunction