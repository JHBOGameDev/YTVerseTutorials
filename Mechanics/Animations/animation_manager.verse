using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Fortnite.com/Devices/CreativeAnimation }
using { /Fortnite.com/Devices/CreativeAnimation/InterpolationTypes }

<# CODE WRITTEN BY JHBOGameDev #>

animation_manager := class:   

    # Moves a creative prop from its current position to a target position.
    SetMovement<public>(Prop:creative_prop, TargetLocation:vector3):void=  
        NewLocation := TargetLocation - Prop.GetTransform().Translation       
        var AnimationKeyFrames: keyframe_delta = keyframe_delta
        {
            DeltaLocation := NewLocation
            DeltaRotation := IdentityRotation()
            DeltaScale := vector3{X:=1.0, Y:=1.0, Z:=1.0}
            Time := 2.0
            Interpolation := Linear
        }
        if (AnimationController := Prop.GetAnimationController[]):
            AnimationController.MovementCompleteEvent.Subscribe(OnMovementAnimationCompleted)
            MovementKeyFrames : []keyframe_delta = array{ AnimationKeyFrames }
            AnimationController.SetAnimation(MovementKeyFrames, ?Mode:=animation_mode.PingPong)
            AnimationController.Play()

    OnMovementAnimationCompleted(): void= 
        Print("Movement animation is completed") 

    SetRotation<public>(Prop:creative_prop):void=
        var AnimationKeyFrames : []keyframe_delta = array
        {
            RotationKeyFrame1 : keyframe_delta = keyframe_delta
            {
                DeltaLocation := vector3{X:=0.0, Y:=0.0, Z:=0.0}
                DeltaRotation := rotation{}.ApplyPitch(-90.0)
                #DeltaRotation := MakeRotationFromYawPitchRollDegrees(0.0,-90.0,0.0)
                DeltaScale := vector3{X:=1.0, Y:=1.0, Z:=1.0}
                Time := 2.0
                Interpolation := Linear
            }
            RotationKeyFrame2 : keyframe_delta = keyframe_delta
            {
                DeltaLocation := vector3{X:=0.0, Y:=0.0, Z:=0.0}
                DeltaRotation := rotation{}.ApplyPitch(90.0)
                #DeltaRotation := MakeRotationFromYawPitchRollDegrees(0.0,90.0,0.0)
                DeltaScale := vector3{X:=1.0, Y:=1.0, Z:=1.0}
                Time := 2.0
                Interpolation := Linear
            }
        }
        if (AnimationController := Prop.GetAnimationController[]):
            AnimationController.MovementCompleteEvent.Subscribe(OnRotationAnimationCompleted)
            RotationKeyFrames : []keyframe_delta = AnimationKeyFrames
            AnimationController.SetAnimation(RotationKeyFrames, ?Mode:=animation_mode.PingPong)
            AnimationController.Play()
            
    OnRotationAnimationCompleted(): void= 
        Print("Rotation animation is completed") 

    SetScale<public>(Prop:creative_prop):void=
        var AnimationKeyFrames : []keyframe_delta = array
        {
            ScaleKeyFrame1 : keyframe_delta = keyframe_delta
            {
                DeltaLocation := vector3{X:=0.0, Y:=0.0, Z:=0.0}
                DeltaRotation := IdentityRotation()
                DeltaScale := vector3{X:=0.66, Y:=0.66, Z:=0.66}
                Time := 2.0
                Interpolation := Linear
            }
            ScaleKeyFrame2 : keyframe_delta = keyframe_delta
            {
                DeltaLocation := vector3{X:=0.0, Y:=0.0, Z:=0.0}
                DeltaRotation := IdentityRotation()
                DeltaScale := vector3{X:=1.5, Y:=1.5, Z:=1.5}
                Time := 2.0
                Interpolation := Linear
            }
        }
        if (AnimationController := Prop.GetAnimationController[]):
            AnimationController.MovementCompleteEvent.Subscribe(OnScaleAnimationCompleted)
            ScaleKeyFrames : []keyframe_delta = AnimationKeyFrames
            AnimationController.SetAnimation(ScaleKeyFrames, ?Mode:=animation_mode.PingPong)
            AnimationController.Play()

    OnScaleAnimationCompleted(): void= 
        Print("Scale animation is completed") 
