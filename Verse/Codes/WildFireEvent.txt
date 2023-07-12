
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
WildFireEvent := class(creative_device):
    @editable FireDamage: damage_volume_device = damage_volume_device{}
    @editable SafeClass: class_and_team_selector_device = class_and_team_selector_device{}
    @editable DefaultClass: class_and_team_selector_device = class_and_team_selector_device{}
    @editable FireSafeZone: []mutator_zone_device = array{}
    @editable SmokeFireEffect: []vfx_spawner_device = array{}

        EnableWildfire(Agent:agent)<suspends>:void=

            for(Enter:FireSafeZone):
                Enter.Enable()
                Enter.AgentEntersEvent.Subscribe(SafeZone)

                for(Exits:FireSafeZone):
                    Enter.AgentExitsEvent.Subscribe(OutSafeZone)
            FireDamage.Enable()
            
            for(Effect:SmokeFireEffect):
                Effect.Enable()
            Sleep(45.0)

            for(Effect:SmokeFireEffect):
                Effect.Disable()

                for(Disable:FireSafeZone):
                    Disable.Disable()
            FireDamage.Disable()

        SafeZone(Agent:agent):void=
            SafeClass.ChangeClass(Agent)

        OutSafeZone(Agent:agent):void=
            DefaultClass.ChangeClass(Agent)