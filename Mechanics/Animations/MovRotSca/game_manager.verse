using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }

<# CODE WRITTEN BY JHBOGameDev #>

game_manager := class(creative_device):

    @editable
    PropMov: creative_prop = creative_prop{}

    @editable
    NewLocation : vector3 = vector3{}

    @editable
    PropRot: creative_prop = creative_prop{}
    
    @editable
    PropSca: creative_prop = creative_prop{}

    AnimationManager : animation_manager = animation_manager{}

    OnBegin<override>()<suspends>:void=
        AnimationManager.SetMovement(PropMov, NewLocation)
        AnimationManager.SetRotation(PropRot)
        AnimationManager.SetScale(PropSca) 
        AnimationManager.SetScale(PropSca)    
