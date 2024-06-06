using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

game_manager := class(creative_device):

    @editable
    ResourceCounterConButton : conditional_button_device = conditional_button_device{}

    var ResourceUIMap : [agent]resource_ui = map{}

    OnBegin<override>()<suspends>:void=
        CreatePlayersUI()
        GetPlayspace().PlayerAddedEvent().Subscribe(OnPlayerAdded)
        ResourceCounterLoop()

    OnPlayerAdded(Agent : agent): void=
        AddUItoPlayer(Agent)

    AddUItoPlayer<private>(Agent : agent): void=
        ResourceUI := MakeResourceUI(Agent)
        if (set ResourceUIMap[Agent] = ResourceUI, AgentResourceUI := ResourceUIMap[Agent]):
            AgentResourceUI.AddWidget()
            
    CreatePlayersUI<private>(): void=
        AllPlayers := GetPlayspace().GetPlayers()
        for (Player : AllPlayers):
            if (Agent := agent[Player]):
                AddUItoPlayer(Agent)

    ResourceCounterLoop<private>()<suspends>: void=
        loop:
            Sleep(0.0)
            for (Agent : GetPlayspace().GetPlayers()):
                if (AgentResourceUI := ResourceUIMap[Agent]):
                    AgentResourceUI.UpdateResourceText(ResourceCounterConButton.GetItemCount(Agent,0))
