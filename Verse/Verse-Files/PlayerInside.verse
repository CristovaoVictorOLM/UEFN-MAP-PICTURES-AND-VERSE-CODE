
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
PlayerInside := class(creative_device):

    @editable ClassChange: class_and_team_selector_device = class_and_team_selector_device{}
    @editable DefaultClass: class_and_team_selector_device = class_and_team_selector_device{}
    @editable InteriorZones: []mutator_zone_device = array{}
    @editable ExteriorZones: []mutator_zone_device = array{}
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        for(Enter:InteriorZones):
            Enter.AgentEntersEvent.Subscribe(Interior)
        for(Exit:ExteriorZones):
            Exit.AgentEntersEvent.Subscribe(Exterior)

    Interior(Agent:agent):void=
        ClassChange.ChangeClass(Agent)
        
    Exterior(Agent:agent):void=
        DefaultClass.ChangeClass(Agent)

   
        