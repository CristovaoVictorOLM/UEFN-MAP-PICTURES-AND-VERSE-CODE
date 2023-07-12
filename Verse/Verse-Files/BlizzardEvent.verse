
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
BlizzardEvent := class(creative_device):
    @editable
        BlizzardEffect: []vfx_spawner_device = array{}
    @editable
        BlizzardAnimation: cinematic_sequence_device = cinematic_sequence_device{}
    @editable
        BlizzardDamage: damage_volume_device = damage_volume_device{}
    @editable
        Slide: grind_powerup_device = grind_powerup_device{}
    EnableBlizzard(Agent:agent)<suspends>:void=
        for(Effect:BlizzardEffect):
            Effect.Enable()
        BlizzardAnimation.Play()
        Slide.Pickup(Agent)
        BlizzardDamage.Enable()
        Sleep(45.0)
        for(Effect:BlizzardEffect):
            Effect.Disable()
        BlizzardAnimation.Stop()
        BlizzardDamage.Disable()
