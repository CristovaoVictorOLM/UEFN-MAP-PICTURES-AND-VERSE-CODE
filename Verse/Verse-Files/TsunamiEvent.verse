
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
TsunamiEvent := class(creative_device):
    @editable 
        TsunamiWater: water_device = water_device{}
    @editable 
        TsunamiWaterRising: water_device = water_device{}
    @editable
        TsunamiAnimation: cinematic_sequence_device = cinematic_sequence_device{}


        EnableTsunami(Agent:agent)<suspends>:void=
            TsunamiWater.Enable()
            TsunamiWaterRising.Enable()
            TsunamiAnimation.Play()
                
            Sleep(45.0)

            TsunamiAnimation.Stop()
            TsunamiWater.Disable()
            TsunamiWaterRising.Disable()

    