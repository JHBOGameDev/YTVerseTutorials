using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
 
<# CODE WRITTEN BY JHBOGameDev #>
 
resource_counter_device := class(creative_device):
 
    # Device that displays information about resources.
    @editable 
    ResourceHUD: hud_message_device = hud_message_device{}
 
    # Device that counts the players' resources.
    @editable 
    ResourceCounterConditionalButton : conditional_button_device = conditional_button_device{}
 
    # Used as a parameter by the hud message device to display text to players.
    ResourceMessage<localizes>(Amount : int) : message = "{Amount}"
 
    OnBegin<override>()<suspends>:void=
        ResourceCounterLoop()
 
    # Updates the resource count for each player.
    ResourceCounterLoop()<suspends> : void =
        loop:
            Sleep(0.0)
            for (Agent: GetPlayspace().GetPlayers()):
                ResourceHUD.Show(Agent, ResourceMessage(ResourceCounterConditionalButton.GetItemCount(Agent, 0)))
