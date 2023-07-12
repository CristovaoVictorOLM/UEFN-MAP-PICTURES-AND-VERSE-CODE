
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
TornadoEvent := class(creative_device):

    @editable
    TornadoDamage: []damage_volume_device = array{}

    @editable
    TornadoEffect: []vfx_spawner_device = array{}
    
    @editable
    TornadoAnimation: cinematic_sequence_device = cinematic_sequence_device{}

    EnableTornado(Agent:agent)<suspends>:void=
        TornadoAnimation.Play()
        for(Tornado:TornadoEffect):
            Tornado.Enable()
        for(Tornado: TornadoDamage):
            Tornado.Enable()
        Sleep(45.0)
        for(Tornado: TornadoDamage):
            Tornado.Disable()
        for(Tornado:TornadoEffect):
            Tornado.Disable()
        TornadoAnimation.Stop()