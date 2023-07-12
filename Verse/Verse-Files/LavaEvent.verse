
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
LavaEvent := class(creative_device):

    @editable
    LavaDamage: damage_volume_device = damage_volume_device{}
    
    @editable
    LavaAnimation: cinematic_sequence_device = cinematic_sequence_device{}

    EnableLava(Agent:agent)<suspends>:void=
        LavaAnimation.Play()
        LavaDamage.Enable()
        Sleep(45.0)
        LavaDamage.Disable()
        LavaAnimation.Stop()
        