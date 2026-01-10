Scriptname TTFA_MainController extends Quest

Quest Property t02  Auto
Quest Property TTFA_JourneyQst  Auto  

Event OnInit()
    Maintenance()
EndEvent

Function Maintenance()
    if(t02.GetCurrentStageID() < 30)
        bool shouldRegister = TTFA_JourneyQst.IsRunning()
        if(t02.IsStageDone(20))
            StartJourneyQuest()
        else
            PO3_Events_Form.RegisterForQuestStage(self, t02)
            shouldRegister = true
        endif

        if(shouldRegister)
            PO3_Events_Form.RegisterForQuestStage(self, t02)
        endif
    endif
EndFunction

Event OnQuestStageChange(Quest akQuest, Int aiNewStage)
    ; talked to Fastred first time
    if(akQuest == t02)
        if(aiNewStage == 20)
            StartJourneyQuest()
        elseif(TTFA_JourneyQst.GetCurrentStageID() < 90 && aiNewStage == 30)
            TTFA_JourneyQst.SetStage(200)
        endif
        
    endif
EndEvent

Function StartJourneyQuest()
    if(!TTFA_JourneyQst.IsRunning())
        TTFA_JourneyQst.SetStage(0)
    endif
EndFunction



