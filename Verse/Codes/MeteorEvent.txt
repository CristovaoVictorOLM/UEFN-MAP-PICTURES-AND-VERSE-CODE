
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
MeteorEvent := class(creative_device):
    @editable
    MeteorDamage: []explosive_device = array{}
    var count:int = 0
    @editable
    MeteorAnimation: cinematic_sequence_device = cinematic_sequence_device{}

    EnableMeteor(Agent:agent)<suspends>:void=
        MeteorAnimation.Play()
        loop:
            for(Explosive:MeteorDamage):
                Explosive.Explode(Agent)
                Explosive.Reset()
                Sleep(0.1)
            set count+=1
                Print("{count}")
                if(count>=21):
                    break
        MeteorAnimation.Stop()
        for(Explosive:MeteorDamage):
            Explosive.Reset()
           