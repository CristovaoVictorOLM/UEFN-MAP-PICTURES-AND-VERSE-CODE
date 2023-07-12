
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using{  /Verse.org/Random}

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
EventChooser := class(creative_device):
    #-----------DisastersCode---------------------------------
    @editable
        BlizzardDisaster: BlizzardEvent = BlizzardEvent{}
    @editable
        RainDisaster: AcidRainEvent = AcidRainEvent{}
     @editable
        LavaDisaster: LavaEvent = LavaEvent{}
    @editable 
        TornadoDisaster: TornadoEvent = TornadoEvent{}
    @editable
        MeteorDisaster: MeteorEvent = MeteorEvent{}
    @editable 
        TsunamiDisaster: TsunamiEvent = TsunamiEvent{}
    @editable 
        WildFireDisaster: WildFireEvent = WildFireEvent{}
    #---------------------------------------------------------
    @editable
        Blizz: button_device = button_device{}
    @editable
        Rain: button_device = button_device{}
    @editable
        Lava: button_device = button_device{}
    @editable
        Meteors: button_device = button_device{}
    @editable
        Tsunami: button_device = button_device{}
    @editable
        Wildfire: button_device = button_device{}
    @editable
        Tornado: button_device = button_device{}

    var Eventnum:int = 0
    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        AllPlayers := GetPlayspace().GetPlayers()
        Blizz.InteractedWithEvent.Subscribe(StartBlizzard)
        Rain.InteractedWithEvent.Subscribe(StartRain)
        Lava.InteractedWithEvent.Subscribe(StartLava)
        Meteors.InteractedWithEvent.Subscribe(StartMeteors)
        Tsunami.InteractedWithEvent.Subscribe(StartTsunami)
        Wildfire.InteractedWithEvent.Subscribe(StartWildfire)
        Tornado.InteractedWithEvent.Subscribe(StartTornado)
        RandomDisaster()
        Print("{Eventnum}")
        
    RandomDisaster():int=
        set Eventnum= GetRandomInt(1,8)
        return Eventnum

    StartBlizzard(Agent:agent):void=
        AllPlayers := GetPlayspace().GetPlayers()
        for(Player: AllPlayers):
            spawn{BlizzardDisaster.EnableBlizzard(Player)}

    StartRain(Agent:agent):void=
        AllPlayers := GetPlayspace().GetPlayers()
        for(Player: AllPlayers):
            spawn{RainDisaster.EnableRain(Player)}

    StartLava(Agent:agent):void=
        AllPlayers := GetPlayspace().GetPlayers()
        for(Player: AllPlayers):
            spawn{LavaDisaster.EnableLava(Player)}

    StartTornado(Agent:agent):void=
        AllPlayers := GetPlayspace().GetPlayers()
        for(Player: AllPlayers):
            spawn{TornadoDisaster.EnableTornado(Player)}

    StartMeteors(Agent:agent):void=
        AllPlayers := GetPlayspace().GetPlayers()
        for(Player: AllPlayers):
            spawn{MeteorDisaster.EnableMeteor(Player)}

    StartTsunami(Agent:agent):void=
        AllPlayers := GetPlayspace().GetPlayers()
        for(Player: AllPlayers):
            spawn{TsunamiDisaster.EnableTsunami(Player)}

    StartWildfire(Agent:agent):void=
        AllPlayers := GetPlayspace().GetPlayers()
        for(Player: AllPlayers):
            spawn{WildFireDisaster.EnableWildfire(Player)}


    