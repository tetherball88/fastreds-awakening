scriptname TTFA_Utils

int Function GetTravelDialoguesWaitTime(int time) Global
    if(time == 1)
        return JsonUtil.GetPathIntValue("../TT_FastredsAwakening/config.json", "ttfa_travel_dialogues_wait_time_first", 6)
    endif
    if(time == 2)
        return JsonUtil.GetPathIntValue("../TT_FastredsAwakening/config.json", "ttfa_travel_dialogues_wait_time_second", 6)
    endif
    if(time == 3)
        return JsonUtil.GetPathIntValue("../TT_FastredsAwakening/config.json", "ttfa_travel_dialogues_wait_time_third", 12)
    endif
    if(time == 4)
        return JsonUtil.GetPathIntValue("../TT_FastredsAwakening/config.json", "ttfa_travel_dialogues_wait_time_fourth", 24)
    endif
EndFunction