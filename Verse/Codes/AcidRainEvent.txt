
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
AcidRainEvent := class(creative_device):
    @editable
    RainDamage: damage_volume_device = damage_volume_device{}
    @editable
    RainEffect: []vfx_spawner_device = array{}
    @editable
    RainAnimation: cinematic_sequence_device = cinematic_sequence_device{}

    EnableRain(Agent:agent)<suspends>:void=
        for(Effect:RainEffect):
            Effect.Enable()
        RainDamage.Enable()
        RainAnimation.Play()
        Sleep(45.0)
        for(Effect:RainEffect):
            Effect.Disable()
        RainAnimation.Stop()
        RainDamage.Disable()
