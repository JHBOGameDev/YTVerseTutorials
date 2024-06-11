using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

<# CODE WRITTEN BY JHBOGameDev #>

double_pump_power :=  class(creative_device):

    @editable
    ShotgunRemover : item_remover_device = item_remover_device{}

    @editable
    ShotgunGranter : item_granter_device = item_granter_device{}

    @editable
    PlayerMarker : player_marker_device = player_marker_device{}

    @editable
    PlayerSpawner : player_spawner_device = player_spawner_device{}        
        
    OnBegin<override>()<suspends>:void=
        PlayerSpawner.SpawnedEvent.Subscribe(OnPlayerSpawned)   
        PlayerMarker.FirstItemValueChangedEvent.Subscribe(OnFirstItemValueChanged) 
        
    OnPlayerSpawned(Agent : agent): void=
        AddPowerTo(Agent)

    OnFirstItemValueChanged(Agent : agent): void=
        ShotgunRemover.Remove(Agent)
        ShotgunGranter.GrantItem(Agent)

    AddPowerTo(Agent : agent) : void= 
        PlayerMarker.Attach(Agent) 
