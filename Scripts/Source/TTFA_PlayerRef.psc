Scriptname TTFA_PlayerRef extends ReferenceAlias

Event OnPlayerLoadGame()
    MiscUtil.PrintConsole("TTFA: OnPlayerLoadGame - notifying main controller to run maintenance:"+ GetActorRef())
    TTFA_MainController mainController = self.GetOwningQuest() as TTFA_MainController
    mainController.Maintenance()
EndEvent

