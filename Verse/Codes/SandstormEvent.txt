
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
SandstormEvent := class(creative_device):
    @editable
        SandstormEffect: []vfx_spawner_device = array{}
    @editable
        SandstormAnimation: cinematic_sequence_device = cinematic_sequence_device{}
    @editable
        SandstormDamage: damage_volume_device = damage_volume_device{}
    @editable
        Slide: grind_powerup_device = grind_powerup_device{}
    EnableSandstorm(Agent:agent)<suspends>:void=
        for(Effect:SandstormEffect):
            Effect.Enable()
        SandstormAnimation.Play()
        Slide.Pickup(Agent)
        SandstormDamage.Enable()
        Sleep(45.0)
        for(Effect:SandstormEffect):
            Effect.Disable()
        SandstormAnimation.Stop()
        SandstormDamage.Disable()