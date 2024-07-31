using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

<# CODE WRITTEN BY JHBOGameDev #>

game_manager := class(creative_device):

    @editable
    MultiResourceCounterConButton : conditional_button_device = conditional_button_device{}

    var MultiResourceUIMap : [agent]multi_resource_ui = map{}

    OnBegin<override>()<suspends>:void=
        CreatePlayersUI()
        GetPlayspace().PlayerAddedEvent().Subscribe(OnPlayerAdded)
        ResourceCounterLoop()

    # Called when a player joins the game.
    OnPlayerAdded(Agent : agent): void=
        AddUItoPlayer(Agent)

    AddUItoPlayer<private>(Agent : agent): void=
        MultiResourceUI := MakeMultiResourceUI(Agent)
        if (set MultiResourceUIMap[Agent] = MultiResourceUI, AgentResourceUI := MultiResourceUIMap[Agent]):
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
                if (AgentResourceUI := MultiResourceUIMap[Agent]):
                    AgentResourceUI.UpdateResource1Text(MultiResourceCounterConButton.GetItemCount(Agent,0))
                    AgentResourceUI.UpdateResource2Text(MultiResourceCounterConButton.GetItemCount(Agent,1))
                    AgentResourceUI.UpdateResource3Text(MultiResourceCounterConButton.GetItemCount(Agent,2))
