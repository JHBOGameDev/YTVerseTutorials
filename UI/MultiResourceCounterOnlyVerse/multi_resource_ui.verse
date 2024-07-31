using { /Verse.org/Simulation }
using { /Verse.org/Colors }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }
 
<# CODE WRITTEN BY JHBOGameDev #>
 
# Constructor
MakeMultiResourceUI<constructor><public>(InPlayer : agent) := multi_resource_ui:
    MayBePlayerUI := option{GetPlayerUI[player[InPlayer]]} 

multi_resource_ui := class:
    <# This block runs for each instance of the multi_resource_ui class.
	  We can setup the canvas once here. #>
        block:       
            set Resource1TextBlock = text_block{DefaultText := ResourceMessage, DefaultTextColor := NamedColors.White, DefaultShadowOffset:=option{vector2{X:=2.5,Y:=2.5}}, DefaultShadowColor:=NamedColors.Black} 
            set Resource2TextBlock = text_block{DefaultText := ResourceMessage, DefaultTextColor := NamedColors.White, DefaultShadowOffset:=option{vector2{X:=2.5,Y:=2.5}}, DefaultShadowColor:=NamedColors.Green} 
            set Resource3TextBlock = text_block{DefaultText := ResourceMessage, DefaultTextColor := NamedColors.White, DefaultShadowOffset:=option{vector2{X:=2.5,Y:=2.5}}, DefaultShadowColor:=NamedColors.Orange} 
            set Canvas = canvas:
                Slots := array:
                    # Resource 1
                    canvas_slot:                    
                        Anchors := anchors{Minimum := vector2{X := 0.099, Y := 0.5}, Maximum := vector2{X := 0.099, Y := 0.5}} 
                        Offsets := margin{Top := 0.0, Left := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.5, Y := 0.5}
                        SizeToContent := true
                        Widget := Resource1TextBlock
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X :=  0.099, Y := 0.5}, Maximum := vector2{X :=   0.099, Y := 0.5}} 
                        Offsets := margin{Top := 0.0, Left := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.5, Y := 0.5}
                        SizeToContent := true
                        Widget := Resource1TextureBlock
                    # Resource 2
                    canvas_slot:                    
                        Anchors := anchors{Minimum := vector2{X := 0.099, Y := 0.6}, Maximum := vector2{X := 0.099, Y := 0.6}} 
                        Offsets := margin{Top := 0.0, Left := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.5, Y := 0.5}
                        SizeToContent := true
                        Widget := Resource2TextBlock
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X :=   0.099, Y := 0.6}, Maximum := vector2{X :=  0.099, Y := 0.6}} 
                        Offsets := margin{Top := 0.0, Left := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.5, Y := 0.5}
                        SizeToContent := true
                        Widget := Resource2TextureBlock
                    # Resource 3
                    canvas_slot:                    
                        Anchors := anchors{Minimum := vector2{X := 0.099, Y := 0.7}, Maximum := vector2{X := 0.099, Y := 0.7}} 
                        Offsets := margin{Top := 0.0, Left := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.5, Y := 0.5}
                        SizeToContent := true
                        Widget := Resource3TextBlock
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X :=  0.099, Y := 0.7}, Maximum := vector2{X :=  0.099, Y := 0.7}} 
                        Offsets := margin{Top := 0.0, Left := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.5, Y := 0.5}
                        SizeToContent := true
                        Widget := Resource3TextureBlock
 
    # Used to add widget to players.
    MayBePlayerUI<internal> : ?player_ui = false
 
    # Message showing the initial value of resources to players.
    ResourceMessage<localizes> : message = "0"   
 
    # Image 1 that will be displayed in the players' UI.
    Resource1TextureBlock : texture_block = texture_block{DefaultImage :=  Textures.T_Resource_Bar_1, DefaultDesiredSize := vector2{ X := 350.0, Y := 50.0}} 
    
    # Image 2 that will be displayed in the players' UI.
    Resource2TextureBlock : texture_block = texture_block{DefaultImage :=  Textures.T_Resource_Bar_2, DefaultDesiredSize := vector2{ X := 350.0, Y := 50.0}} 
    
    # Image 3 that will be displayed in the players' UI.
    Resource3TextureBlock : texture_block = texture_block{DefaultImage :=  Textures.T_Resource_Bar_3, DefaultDesiredSize := vector2{ X := 350.0, Y := 50.0}}  
 
    var Canvas<private> : canvas = canvas{}
 
    # Resource 1 text to be displayed in the players' UI.
    var Resource1TextBlock : text_block = text_block{} 
    
    # Resource 2 text to be displayed in the players' UI.
    var Resource2TextBlock : text_block = text_block{}

    # Resource 3 text to be displayed in the players' UI.
    var Resource3TextBlock : text_block = text_block{}    
 
    # Parameter used by ResourceTextBlock to update the text in the UI to the players.
    StringToMessage<localizes>(value:int) : message = "{value}"    
 
    AddWidget<public>() : void =
        if (PlayerUI := MayBePlayerUI?):
            PlayerUI.AddWidget(Canvas)  
            Resource1TextBlock.SetShadowOpacity(1.0)   
            Resource2TextBlock.SetShadowOpacity(1.0)  
            Resource3TextBlock.SetShadowOpacity(1.0)  
 
    UpdateResource1Text<public>(Amount : int) : void =
        if (PlayerUI := MayBePlayerUI?):            
            Resource1TextBlock.SetText(StringToMessage(Amount))

    UpdateResource2Text<public>(Amount : int) : void =
        if (PlayerUI := MayBePlayerUI?):            
            Resource2TextBlock.SetText(StringToMessage(Amount))

    UpdateResource3Text<public>(Amount : int) : void =
        if (PlayerUI := MayBePlayerUI?):            
            Resource3TextBlock.SetText(StringToMessage(Amount)) 
