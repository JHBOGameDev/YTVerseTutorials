using { /Verse.org/Simulation }
using { /Verse.org/Colors }
using { /Fortnite.com/UI }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }
 
<# CODE WRITTEN BY JHBOGameDev #>
 
# Constructor
MakeResourceUI<constructor><public>(InPlayer : agent) := resource_ui:
    MayBePlayerUI := option{GetPlayerUI[player[InPlayer]]}   
 
resource_ui := class:
    <# This block runs for each instance of the resource_ui class.
	  We can setup the canvas once here. #>
        block:       
            set ResourceTextBlock = text_block{DefaultText := ResourceMessage, DefaultTextColor := NamedColors.Red} 
            set Canvas = canvas:
                Slots := array:
                    canvas_slot:                    
                        Anchors := anchors{Minimum := vector2{X := 0.06, Y := 0.5}, Maximum := vector2{X := 0.06, Y := 0.5}} 
                        Offsets := margin{Top := 0.0, Left := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.5, Y := 0.5}
                        SizeToContent := true
                        Widget := ResourceTextBlock
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X := 0.06, Y := 0.5}, Maximum := vector2{X := 0.06, Y := 0.5}} 
                        Offsets := margin{Top := 0.0, Left := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.5, Y := 0.5}
                        SizeToContent := true
                        Widget := ResourceTextureBlock
 
    # Used to add widget to players.
    MayBePlayerUI<internal> : ?player_ui = false
 
    # Message showing the initial value of resources to players.
    ResourceMessage<localizes> : message = "0"
 
    # Image that will be displayed in the players' UI.
    ResourceTextureBlock : texture_block = texture_block{DefaultImage :=  Textures.T_ExampleImage, DefaultDesiredSize := vector2{ X := 200.0, Y := 100.0}}    
 
    var Canvas<private> : canvas = canvas{}
 
    # Resource text to be displayed in the players' UI.
    var ResourceTextBlock : text_block = text_block{}    
 
    # Parameter used by ResourceTextBlock to update the text in the UI to the players.
    StringToMessage<localizes>(value:int) : message = "{value}"    
 
    AddWidget<public>() : void =
        if (PlayerUI := MayBePlayerUI?):
            PlayerUI.AddWidget(Canvas)     
 
    UpdateResourceText<public>(Amount : int) : void =
        if (PlayerUI := MayBePlayerUI?):            
            ResourceTextBlock.SetText(StringToMessage(Amount))
