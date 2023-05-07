//Resident Evil 2 Remake Autosplitter
//By CursedToast 1/28/2019
//Last updated 05/07/2023
//New Pointers by VideoGameRoulette & DeathHound

state("re2", "World Public RT 2023")
{
    int gameStartType : "re2.exe", 0x091AE100, 0x54;
	int scenerioTypeValue : "re2.exe", 0x091AE100, 0x1A0, 0x1C;
	int survivorType : "re2.exe", 0x091AD1F0, 0x50, 0x10, 0x20, 0x54;
	int playerCurrentHP : "re2.exe", 0x091AD1F0, 0x50, 0x10, 0x20, 0x230, 0x58;
	int playerMaxHP : "re2.exe", 0x091AD1F0, 0x50, 0x10, 0x20, 0x230, 0x54;
	int map : "re2.exe", 0x091A7F84;
	int loc : "re2.exe", 0x091A7F80;
	int bossCHP : "re2.exe", 0x091A6A08, 0x58, 0x10, 0x20, 0x218, 0xB8, 0x58;
	int bossHP : "re2.exe", 0x091A6A08, 0x58, 0x10, 0x20, 0x218, 0xB8, 0x54;
	byte isCutscene : "re2.exe", 0x091AEC78, 0x51;
	byte isPaused : "re2.exe", 0x091AEC78, 0x53;
	long active : "re2.exe", 0x091AEC78, 0x60, 0x18;
	long cutscene : "re2.exe", 0x091AEC78, 0x60, 0x20;
	long paused : "re2.exe", 0x091AEC78, 0x60, 0x30;
}

state("re2", "World DX11 2023")
{
    int gameStartType : "re2.exe", 0x070B9320, 0x54;
	int scenerioTypeValue : "re2.exe", 0x070B9320, 0x198, 0x1C;
	int survivorType : "re2.exe", 0x070AA850, 0x50, 0x10, 0x20, 0x54;
	int playerCurrentHP : "re2.exe", 0x070AA850, 0x50, 0x10, 0x20, 0x230, 0x58;
	int playerMaxHP : "re2.exe", 0x070AA850, 0x50, 0x10, 0x20, 0x230, 0x54;
	int map : "re2.exe", 0x070A7D84;
	int loc : "re2.exe", 0x070A7D80;
	int bossCHP : "re2.exe", 0x070A69E0, 0x58, 0x10, 0x20, 0x218, 0xB8, 0x58;
	int bossHP : "re2.exe", 0x070A69E0, 0x58, 0x10, 0x20, 0x218, 0xB8, 0x54;
	byte isCutscene : "re2.exe", 0x070AEBB8, 0x51;
	byte isPaused : "re2.exe", 0x070AEBB8, 0x53;
	int cutscene : "re2.exe", 0x070AEBB8, 0x51;
	long active : "re2.exe", 0x070AEBB8, 0x60, 0x18;
	long cutscene : "re2.exe", 0x070AEBB8, 0x60, 0x20;
	long paused : "re2.exe", 0x070AEBB8, 0x60, 0x30;
}

startup
{
	Action<string, bool, string, string> initSettingGroup = (key, enabled, title, description) => {
		settings.Add(key, enabled, title);
		settings.SetToolTip(key, description);
	};

	Action<string, bool, string, string, string> initSettingGroupOption = (key, enabled, title, description, group) => {
		settings.Add(key, true, title, group);
		settings.SetToolTip(key, description);
	};

	initSettingGroup("segments", false, "Segment Practice Start", "Enables or disables segmented start trigger for segmented practice.");

	initSettingGroup("keygroup", true, "Keys", "Key items to split when first picked up.");
	initSettingGroupOption("storageKey", false, "Storage Key", "Storage Key. Location: ??", "keygroup");
	settings.Add("courtyardkey", false, "Courtyard Key", "keygroup");
	settings.Add("spade", false, "Spade Key", "keygroup");
	settings.Add("diamond", false, "Diamond Key", "keygroup");
	settings.Add("club", false, "Club Key", "keygroup");
	settings.Add("heart", false, "Heart Key", "keygroup");
	settings.Add("weaponcard", false, "Weapons Locker Key Card", "keygroup");
	settings.Add("orphanageKey", false, "Orphanage Key", "keygroup");
	settings.Add("parkingcard", false, "Parking Garage Key Card", "keygroup");
	settings.Add("sewerKey", false, "Sewer Key", "keygroup");
	
	settings.Add("medalliongroup", true, "Medallions");
	settings.Add("unicorn", false, "Unicorn Medallion", "medalliongroup");
	settings.Add("maiden", false, "Maiden Medallion", "medalliongroup");
	settings.Add("lion", false, "Lion Medallion", "medalliongroup");
	
	
	settings.Add("fusegroup", true, "Fuses");
	settings.Add("fuse1", false, "Fuse (Main Hall)", "fusegroup");
	settings.Add("fuse2", false, "Fuse (Break Room Hallway)", "fusegroup");
	
	settings.Add("geargroup", true, "Gears");
	settings.Add("largegear", false, "Large Gear", "geargroup");
	settings.Add("smallgear", false, "Small Gear", "geargroup");
	
	settings.Add("electrogroup", true, "Electronic Parts");
	settings.Add("partA", false, "Boxed Electronic Part A", "electrogroup");
	settings.Add("partB", false, "Boxed Electronic Part B", "electrogroup");
	
	settings.Add("pluggroup", true, "Plugs");
	settings.Add("rook", false, "Rook Plug", "pluggroup");
	settings.Add("queen", false, "Queen Plug", "pluggroup");
	settings.Add("king", false, "King Plug", "pluggroup");
	settings.Add("knight", false, "Knight Plug", "pluggroup");
	settings.Add("bishop", false, "Bishop Plug", "pluggroup");
	
	settings.Add("dispensergroups", true, "Dispensers");
	settings.Add("dispenseEmpty", false, "Dispersal Cartridge (Empty)", "dispensergroups");
	settings.Add("dispenseSolution", false, "Dispersal Cartridge (Solution)", "dispensergroups");
	settings.Add("herbicide", false, "Dispersal Cartridge (Herbicide)", "dispensergroups");
	
	settings.Add("wristgroup", true, "Wristbands");
	settings.Add("generalChip", false, "Guest", "wristgroup");
	settings.Add("staffChip", false, "General Staff", "wristgroup");
	settings.Add("seniorChip", false, "Senior Staff", "wristgroup");
	settings.Add("chipAdmin", false, "Admin (Claire Only)", "wristgroup");
	
	settings.Add("eventgroup", true, "Events");
	settings.Add("reachedRPDA", false, "Reached the RPD (A Scenario only)", "eventgroup");
	settings.Add("reachedSecretRoom", false, "Reached Secret Room", "eventgroup");
	settings.Add("reachedGarage", false, "Reached Parking Garage", "eventgroup");
	settings.Add("exitedGarage", false, "Back on the Streets (leave parking garage)", "eventgroup");
	settings.Add("reachedSewers", false, "Reached the Sewers", "eventgroup");
	settings.Add("adaStart", false, "Ada Start", "eventgroup");
	settings.Add("adaEnd", false, "Ada End", "eventgroup");
	settings.Add("sherryStart", false, "Sherry Start", "eventgroup");
	settings.Add("rescue", false, "Rescued Sherry/Ada", "eventgroup");
	settings.Add("g1Start", true, "G1 Battle Start", "eventgroup");
	settings.Add("g2Start", true, "G2 Battle Start", "eventgroup");
	settings.Add("g3Start", true, "G3 Battle Start", "eventgroup");
	settings.Add("g4Start", true, "G4 Battle Start", "eventgroup");
	settings.Add("g1", true, "G1 Battle Complete", "eventgroup");
	settings.Add("g2", true, "G2 Battle Complete", "eventgroup");
	settings.Add("g3", false, "G3 Battle Complete", "eventgroup");
	settings.Add("end", false, "End (Scenario A/First final boss of B)", "eventgroup");
	settings.Add("trueEnd", false, "True End", "eventgroup");
	
	settings.Add("miscgroup", true, "Misc.");
	settings.Add("boltCutters", false, "Bolt Cutters", "miscgroup");
	settings.Add("emptyDetonator", false, "Detonator (No Battery)", "miscgroup");
	settings.Add("detonator", false, "Detonator", "miscgroup");
	settings.Add("mechanicHandle", false, "Mechanic Handle", "miscgroup");
	settings.Add("squareCrank", false, "Square Crank", "miscgroup");
	settings.Add("block", false, "Picture Block", "miscgroup");
	settings.Add("scissors", false, "Scissors", "miscgroup");
	settings.Add("valve", false, "Valve Handle", "miscgroup");
	settings.Add("tbar", false, "T-Bar Valve Handle", "miscgroup");
	settings.Add("modulator", false, "Signal Modulator", "miscgroup");
	settings.Add("jointPlug", false, "Joint Plug", "miscgroup");
	
	settings.Add("deprecate", true, "Deprecated");
	settings.Add("redbook", false, "Red Book", "deprecate");
	settings.Add("arm", false, "Statue's Left Arm", "deprecate");
	settings.Add("scepter", false, "Scepter", "deprecate");
	settings.Add("jewel", false, "Red Jewel", "deprecate");
	settings.Add("jewelbox", false, "Bejewled Box", "deprecate");
	settings.Add("starsbadge", false, "S.T.A.R.S Badge", "deprecate");
	settings.Add("gL", false, "Grenade Launcher", "deprecate");
	settings.Add("shotgun", false, "Shotgun", "deprecate");
}

init
{
	vars.inventoryPtr = IntPtr.Zero;
	print("=== Module Memory Size === " + modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
		default:
            version = "World DX11 2023";
            vars.inventoryPtr = 0x070B23A8;
            break;
		case (163291136):
			version = "World Public RT 2023";
			vars.inventoryPtr = 0x091A6CD0;
			break;
	}

    // Track inventory IDs
    current.inventory = new int[20];
    for (int i = 0; i < current.inventory.Length; ++i)
    {
        int itemID = 0;
        IntPtr ptr;
        new DeepPointer(vars.inventoryPtr, 0x58, 0x10, 0x20, 0x98, 0x10, 0x20 + (i * 8), 0x18, 0x10, 0x10).DerefOffsets(memory, out ptr);
        memory.ReadValue<int>(ptr, out itemID);
        current.inventory[i] = itemID;
    }
	
	// Track Weapon IDs
	current.weapons = new int[20];
    for (int i = 0; i < current.weapons.Length; ++i)
    {
        int weaponID = 0;
        IntPtr ptr;
        new DeepPointer(vars.inventoryPtr, 0x58, 0x10, 0x20, 0x98, 0x10, 0x20 + (i * 8), 0x18, 0x10, 0x14).DerefOffsets(memory, out ptr);
        memory.ReadValue<int>(ptr, out weaponID);
        current.weapons[i] = weaponID;
    }
}

start
{
	// isNewGameStart conditions
	bool locationsReset = current.map == 0 && current.loc == 0;
	bool isPlayerInit = old.playerMaxHP != 1200 && current.playerCurrentHP == 1200 && current.playerMaxHP == 1200;
	bool isNewGameInit = old.gameStartType == 1 && current.gameStartType == 1;

	// New Game Run Started
	bool isNewGameStart = locationsReset && isPlayerInit && isNewGameInit;

	// Segmented Runs Started
	bool isSegmentedStart = settings["segments"] && current.gameStartType == 2;

	// Start Conditions
	if (isNewGameStart || isSegmentedStart)
	{
		print(isNewGameStart ? "New Game Timer Started" : "Load Game Timer Started");
		return true;
	}
}

reset
{
	// isResetting conditions
	bool hasLocation = current.loc != 0 && current.map != 0;
	bool isPlayerHP0 = current.playerCurrentHP == 0 && current.playerMaxHP == 0;
	bool isTitleScreen = current.gameStartType == 0;

	// Exited to Title Screen
	bool exitedToTitle = hasLocation && isPlayerHP0 && isTitleScreen;

	// Reset Conditions
	if (exitedToTitle)
	{
		print("Exited To Title Resetting Timer");
		return true;
	}
}

update
{
	// Track inventory IDs
    current.inventory = new int[20];
    for (int i = 0; i < current.inventory.Length; ++i)
    {
        int itemID = 0;
        IntPtr ptr;
        new DeepPointer(vars.inventoryPtr, 0x58, 0x10, 0x20, 0x98, 0x10, 0x20 + (i * 8), 0x18, 0x10, 0x10).DerefOffsets(memory, out ptr);
        memory.ReadValue<int>(ptr, out itemID);
        current.inventory[i] = itemID;
    }

	// Track Weapon IDs 
	current.weapons = new int[20];
    for (int i = 0; i < current.weapons.Length; ++i) 
    {
        int weaponID = 0;
        IntPtr ptr;
        new DeepPointer(vars.inventoryPtr, 0x58, 0x10, 0x20, 0x98, 0x10, 0x20 + (i * 8), 0x18, 0x10, 0x10).DerefOffsets(memory, out ptr);
        memory.ReadValue<int>(ptr, out weaponID);
        current.weapons[i] = weaponID;
    }
	
	// Initialize Global Run Variables
	if (timer.CurrentPhase == TimerPhase.NotRunning)
	{
		vars.detonator = 0;
		vars.emptyDetonator = 0;
		vars.storageKey = 0;
		vars.mechanicHandle = 0;
		vars.squareCrank = 0;
		vars.unicorn = 0;
		vars.lion = 0;
		vars.maiden = 0;
		vars.spade = 0;
		vars.parkingcard = 0;
		vars.weaponcard = 0;
		vars.valve = 0;
		vars.starsbadge = 0;
		vars.scepter = 0;
		vars.jewel = 0;
		vars.jewelbox = 0;
		vars.rook = 0;
		vars.king = 0;
		vars.knight = 0;
		vars.queen = 0;
		vars.bishop = 0;
		vars.block = 0;
		vars.redbook = 0;
		vars.arm = 0;
		vars.diamond = 0;
		vars.carkey = 0;
		vars.partA = 0;
		vars.partB = 0;
		vars.smallgear = 0;
		vars.largegear = 0;
		vars.courtyardkey = 0;
		vars.orphanageKey = 0;
		vars.club = 0;
		vars.heart = 0;
		vars.tbar = 0;
		vars.dispenseEmpty = 0;
		vars.dispenseSolution = 0;
		vars.herbicide = 0;
		vars.jointPlug = 0;
		vars.chipAdmin = 0;
		vars.staffChip = 0;
		vars.chip = 0;
		vars.modulator = 0;
		vars.sewerKey = 0;
		vars.generalChip = 0;
		vars.seniorChip = 0;
		vars.fuse1 = 0;
		vars.fuse2 = 0;
		vars.scissors = 0;
		vars.boltCutters = 0;
		vars.reachedSewers = 0;
		vars.reachedRPDA = 0;
		vars.reachedGarage = 0;
		vars.reachedSecretRoom = 0;
		vars.reachedG1 = 0;
		vars.g1Start = 0;
		vars.g2Start = 0;
		vars.g1CutsceneSkipped = 0;
		vars.g1 = 0;
		vars.g2 = 0;
		vars.exitedGarage = 0;
		vars.end = 0;
		vars.adaStart = 0;
		vars.adaEnd = 0;
		vars.sherryStart = 0;
		vars.rescue = 0;
		vars.reachedG3 = 0;
		vars.g3Start = 0;
		vars.g3CutsceneSkipped = 0;
		vars.g3 = 0;
		vars.g4Start = 0;
		vars.trueEnd = 0;
		vars.onTrain = 0;
		vars.shotgun = 0;
		vars.gL = 0;
	}
}

split
{
	Func<string, bool> LogAndSplit = (splitId) => {
  		print("Splitting: " + splitId);
  		return settings[splitId];
	};
	
	// Item splits
    int[] currentInventory = (current.inventory as int[]);
    int[] oldInventory = (old.inventory as int[]); // throws error first update, will be fine afterwards.

    for (int i = 0; i < currentInventory.Length; i++)
    {
        if (currentInventory[i] != oldInventory[i])
        {
			switch (currentInventory[i])
            {
				case 0x0000001F:
				{
					if (vars.detonator == 0)
					{
						vars.detonator = 1;
						print("detonator");
						return settings["detonator"];
					}
					break;
				}
				case 0x00000022:
				{
					if (vars.emptyDetonator == 0)
					{
						vars.emptyDetonator = 1;
						print("emptyDetonator");
						return settings["emptyDetonator"];
					}
					break;
				}
				case 0x0000004D:
				{
					if (vars.storageKey == 0)
					{
						vars.storageKey = 1;
						print("storageKey");
						return settings["storageKey"];
					}
					break;
				}
				case 0x0000004F:
				{
					if (vars.mechanicHandle == 0)
					{
						vars.mechanicHandle = 1;
						print("mechanicHandle");
						return settings["mechanicHandle"];
					}
					break;
				}
				case 0x00000050:
				{
					if (vars.squareCrank == 0)
					{
						vars.squareCrank = 1;
						print("squareCrank");
						return settings["squareCrank"];
					}
					break;
				}
				case 0x00000051:
				{
					if (vars.unicorn == 0)
					{
						vars.unicorn = 1;
						print("unicorn");
						return settings["unicorn"];
					}
					break;
				}
				case 0x00000076:
				{
					if (vars.lion == 0)
					{
						vars.lion = 1;
						print("lion");
						return settings["lion"];
					}
					break;
				}
				case 0x0000007C:
				{
					if (vars.maiden == 0)
					{
						vars.maiden = 1;
						print("maiden");
						return settings["maiden"];
					}
					break;
				}
				case 0x00000052:
				{
					if (vars.spade == 0)
					{
						vars.spade = 1;
						print("spade");
						return settings["spade"];
					}
					break;
				}
				case 0x00000053:
				{
					if (vars.parkingcard == 0)
					{
						vars.parkingcard = 1;
						print("parkingcard");
						return settings["parkingcard"];
					}
					break;
				}
				case 0x00000054:
				{
					if (vars.weaponcard == 0)
					{
						vars.weaponcard = 1;
						print("weaponcard");
						return settings["weaponcard"];
					}
					break;
				}
				case 0x00000056:
				{
					if (vars.valve == 0)
					{
						vars.valve = 1;
						print("valve");
						return settings["valve"];
					}
					break;
				}
				case 0x00000057:
				{
					if (vars.starsbadge == 0)
					{
						vars.starsbadge = 1;
						print("starsbadge");
						return settings["starsbadge"];
					}
					break;
				}
				case 0x00000058:
				{
					if (vars.scepter == 0)
					{
						vars.scepter = 1;
						print("scepter");
						return settings["scepter"];
					}
					break;
				}
				case 0x0000005A:
				{
					if (vars.jewel == 0)
					{
						vars.jewel = 1;
						print("jewel");
						return settings["jewel"];
					}
					break;
				}
				case 0x0000005B:
				{
					if (vars.jewelbox == 0)
					{
						vars.jewelbox = 1;
						print("jewelbox");
						return settings["jewelbox"];
					}
					break;
				}
				case 0x0000005E:
				{
					if (vars.rook == 0)
					{
						vars.rook = 1;
						print("rook");
						return settings["rook"];
					}
					break;
				}
				case 0x0000005F:
				{
					if (vars.king == 0)
					{
						vars.king = 1;
						print("king");
						return settings["king"];
					}
					break;
				}
				case 0x00000084:
				{
					if (vars.knight == 0)
					{
						vars.knight = 1;
						print("knight");
						return settings["knight"];
					}
					break;
				}
				case 0x00000086:
				{
					if (vars.queen == 0)
					{
						vars.queen = 1;
						print("queen");
						return settings["queen"];
					}
					break;
				}
				case 0x0000005D:
				{
					if (vars.bishop == 0)
					{
						vars.bishop = 1;
						print("bishop");
						return settings["bishop"];
					}
					break;
				}
				case 0x00000062:
				{
					if (vars.block == 0)
					{
						vars.block = 1;
						print("block");
						return settings["block"];
					}
					break;
				}
				case 0x00000072:
				{
					if (vars.redbook == 0)
					{
						vars.redbook = 1;
						print("redbook");
						return settings["redbook"];
					}
					break;
				}
				case 0x00000073:
				{
					if (vars.arm == 0)
					{
						vars.arm = 1;
						print("arm");
						return settings["arm"];
					}
					break;
				}
				case 0x00000077:
				{
					if (vars.diamond == 0)
					{
						vars.diamond = 1;
						print("diamond");
						return settings["diamond"];
					}
					break;
				}
				case 0x00000078:
				{
					if (vars.carkey == 0)
					{
						vars.carkey = 1;
						print("carkey");
						return settings["carkey"];
					}
					break;
				}
				case 0x00000087:
				{
					if (vars.partA == 0)
					{
						vars.partA = 1;
						print("partA");
						return settings["partA"];
					}
					break;
				}
				case 0x00000088:
				{
					if (vars.partB == 0)
					{
						vars.partB = 1;
						print("partB");
						return settings["partB"];
					}
					break;
				}
				case 0x00000081:
				{
					if (vars.smallgear == 0)
					{
						vars.smallgear = 1;
						print("smallgear");
						return settings["smallgear"];
					}
					break;
				}
				case 0x00000082:
				{
					if (vars.largegear == 0)
					{
						vars.largegear = 1;
						print("largegear");
						return settings["largegear"];
					}
					break;
				}
				case 0x00000083:
				{
					if (vars.courtyardkey == 0)
					{
						vars.courtyardkey = 1;
						print("courtyardkey");
						return settings["courtyardkey"];
					}
					break;
				}
				case 0x0000009F:
				{
					if (vars.orphanageKey == 0)
					{
						vars.orphanageKey = 1;
						print("orphanageKey");
						return settings["orphanageKey"];
					}
					break;
				}
				case 0x000000A0:
				{
					if (vars.club == 0)
					{
						vars.club = 1;
						print("club");
						return settings["club"];
					}
					break;
				}
				case 0x000000A9:
				{
					if (vars.heart == 0)
					{
						vars.heart = 1;
						print("heart");
						return settings["heart"];
					}
					break;
				}
				case 0x000000B0:
				{
					if (vars.tbar == 0)
					{
						vars.tbar = 1;
						print("tbar");
						return settings["tbar"];
					}
					break;
				}
				case 0x000000B3:
				{
					if (vars.dispenseEmpty == 0)
					{
						vars.dispenseEmpty = 1;
						print("dispenseEmpty");
						return settings["dispenseEmpty"];
					}
					break;
				}
				case 0x000000B4:
				{
					if (vars.dispenseSolution == 0)
					{
						vars.dispenseSolution = 1;
						print("dispenseSolution");
						return settings["dispenseSolution"]; 
					}
					break;
				}
				case 0x000000B5:
				{
					if (vars.herbicide == 0)
					{
						vars.herbicide = 1;
						print("herbicide");
						return settings["herbicide"];
					}
					break;
				}
				case 0x000000B7:
				{
					if (vars.jointPlug == 0)
					{
						vars.jointPlug = 1;
						print("jointPlug");
						return settings["jointPlug"];
					}
					break;
				}
				case 0x000000BB:
				{
					if (vars.chipAdmin == 0)
					{
						vars.chipAdmin = 1;
						print("chipAdmin");
						return settings["chipAdmin"];
					}
					break;
				}
				case 0x000000BD:
				{
					if (vars.modulator == 0)
					{
						vars.modulator = 1;
						print("modulator");
						return settings["modulator"];
					}
					break;
				}
				case 0x000000C2:
				{
					if (vars.sewerKey == 0)
					{
						vars.sewerKey = 1;
						print("sewerKey");
						return settings["sewerKey"];
					}
					break;
				}
				case 0x000000C3:
				case 0x000000C8:
				{
					// check if leon so it doesnt split on ada
					if (vars.generalChip == 0 && (current.survivorType == 0 || current.survivorType == 1))
					{
						vars.generalChip = 1;
						print("generalChip");
						return settings["generalChip"];
					}
					break;
				}
				case 0x000000C4:
				case 0x000000C9:
				{
					if (vars.staffChip == 0)
					{
						vars.staffChip = 1;
						print("staffChip");
						return settings["staffChip"];
					}
					break;
				}
				case 0x000000C5:
				case 0x000000CA:
				{
					if (vars.seniorChip == 0)
					{
						vars.seniorChip = 1;
						print("seniorChip");
						return settings["seniorChip"];
					}
					break;
				}
				case 0x000000F0:
				{
					if (vars.fuse1 == 0)
					{
						vars.fuse1 = 1;
						print("fuse1");
						return settings["fuse1"];
					}
					break;
				}
				case 0x000000F1:
				{
					if (vars.fuse2 == 0)
					{
						vars.fuse2 = 1;
						print("fuse2");
						return settings["fuse2"];
					}
					break;
				}
				case 0x000000F3:
				{
					if (vars.scissors == 0)
					{
						vars.scissors = 1;
						print("scissors");
						return settings["scissors"];
					}
					break;
				}
				case 0x000000F4:
					if (vars.boltCutters == 0)
					{
						vars.boltCutters = 1;
						return LogAndSplit("boltCutters");
					}
					break;
                default:
                {
                    break; // No work to do.
                }
            }
        }
    }
	
	// Weapon splits
    int[] currentWeapons = (current.weapons as int[]);
    int[] oldWeapons = (old.weapons as int[]); // throws error first update, will be fine afterwards.

    for (int i = 0; i < currentWeapons.Length; i++)
    {
        if (currentWeapons[i] != oldWeapons[i])
        {
			switch (currentWeapons[i])
            {
				case 0x0000000B:
				{
					if (vars.shotgun == 0)
					{
						vars.shotgun = 1;
						print("shotgun");
						return settings["shotgun"];
					}
					break;
				}
				case 0x0000002A:
				{
					if (vars.gL == 0)
					{
						vars.gL = 1;
						print("gL");
						return settings["gL"];
					}
					break;
				}
                default:
                {
                    break; // No work to do.
                }
            }
        }
    }

	// G3 End
	if (current.map == 419 && !(current.bossCHP >= 1) && vars.g3Start == 1 && vars.g3 == 0)
	{
		vars.g3 = 1;
		print("g3");
		return settings["g3"];
	}

	// G2 Start
	if (current.map == 335 && !(current.bossHP == 24000) && vars.g2Start == 0)
	{
		vars.g2Start = 1;
		print("g2Start");
		return settings["g2Start"];
	}

	// G2 End
	if (current.map == 335 && !(current.bossHP >= 1) && vars.g2Start == 1 && vars.g2 == 0)
	{
		vars.g2 = 1;
		print("g2");
		return settings["g2"];
	}

	// G4 Start
	if (current.map == 421 && current.bossHP >= 3000000 && vars.g4Start == 0)
	{
		vars.g4Start = 1;
		print("g4Start");
		return settings["g4Start"];
	}

	// G4 End and Alt Ending
	bool isG4Ending = current.isCutscene == 1 && current.map == 421 && vars.g4Start == 1 && vars.end == 0;
	bool isOtherEnding = old.map == 373 && current.map == 422 && vars.end == 0;

	if (isG4Ending || isOtherEnding)
	{
		vars.end = 1;
		print("end");
		return settings["end"];
	}
	
	// True Endings?
	bool isSTyrantEnding = old.map == 422 && current.map == 422 && vars.end == 1 && vars.trueEnd == 0 && current.isCutscene == 1;
	bool isG5Ending = current.map == 421 && vars.onTrain == 1 && old.map == 423 && vars.trueEnd == 0 && current.isCutscene == 1;
	if (isSTyrantEnding || isG5Ending)
	{
		vars.trueEnd = 1;
		print("trueEnd");
		return settings["trueEnd"];
	}

	// Map splits
	if (current.map != old.map)
	{
		if (current.map == 317 && vars.reachedSewers == 0 || current.map == 377 && old.map == 407 && vars.reachedSewers == 0)
		{
			vars.reachedSewers = 1;
			print("reachedSewers");
			return settings["reachedSewers"];
		}

		if (current.map == 112 && vars.reachedRPDA == 0 || current.map == 261 && vars.reachedRPDA == 0)
		{
			// Check is Scenerio B and Does Not Have Courtyard Key
			if (current.scenerioTypeValue == 2 || current.scenerioTypeValue == 3)
				if (vars.courtyardkey == 0) return false;

			vars.reachedRPDA = 1;
			print("reachedRPDA");
			return settings["reachedRPDA"];
		}
		
		if (current.map == 277 && vars.reachedGarage == 0)
		{
			vars.reachedGarage = 1;
			print("reachedGarage");
			return settings["reachedGarage"];
		}
		
		if (current.map == 350 && vars.reachedSecretRoom == 0)
		{
			vars.reachedSecretRoom = 1;
			print("reachedSecretRoom");
			return settings["reachedSecretRoom"];
		}

		if (old.map == 277 && current.map == 351 && vars.exitedGarage == 0)
		{
			vars.exitedGarage = 1;
			print("exitedGarage");
			return settings["exitedGarage"];
		}
		
		if (current.map == 338 && vars.rescue == 0 || old.map == 0 && current.map == 335 && vars.rescue == 0)
		{
			vars.rescue = 1;
			print("rescue");
			return settings["rescue"];
		}
		
		if (current.map == 423 && vars.onTrain == 0)
		{
			vars.onTrain = 1;
			print("onTrain");
		}
		if (current.map == 0 && old.map == 330 && vars.adaEnd == 0)
		{
			vars.adaEnd = 1;
			print("adaEnd");
			return settings["adaEnd"];
		}
	}

	// Character Swap splits
	if (current.map == 310 && current.survivorType == 2 && vars.adaStart == 0)
	{
		vars.adaStart = 1;
		print("adaStart");
		return settings["adaStart"];
	}

	if (current.map == 363 && current.survivorType == 3 && vars.sherryStart == 0)
	{
		vars.sherryStart = 1;
		print("sherryStart");
		return settings["sherryStart"];
	}

	// Cutscene Playing
	if (current.isCutscene == 1)
	{
		if (current.map == 353 && vars.reachedG1 == 0)
		{
			vars.reachedG1 = 1;
			print("reachedG1");
		}
		if (current.map == 419 && vars.reachedG3 == 0)
		{
			vars.reachedG3 = 1;
			print("reachedG3");
		}
	}

	// Cutscene Paused For Skipping
	if (current.isPaused == 1)
	{
		if (current.map == 353 && vars.reachedG1 == 1 && vars.g1CutsceneSkipped == 0)
		{
			vars.g1CutsceneSkipped = 1;
			print("g1CutsceneSkipped");
		}
		
	}

	if (current.map == 419 && vars.reachedG3 == 1 && vars.g3CutsceneSkipped == 0)
	{
		vars.g3CutsceneSkipped = 1;
		print("g3CutsceneSkipped");
	}

	// Cutscene Skipped
	if (current.isCutscene == 0 && current.isPaused == 0)
	{
		if (current.map == 353 && vars.g1CutsceneSkipped == 1 && vars.g1Start == 0)
		{
			vars.g1Start = 1;
			print("g1Start");
			return settings["g1Start"];
		}
		if (current.map == 419 && vars.g3CutsceneSkipped == 1 && vars.g3Start == 0)
		{
			vars.g3Start = 1;
			print("g3Start");
			return settings["g3Start"];
		}
		if (current.map == 353 && !(current.bossHP >= 1) && vars.g1Start == 1 && vars.g1 == 0)
		{
			vars.g1 = 1;
			print("g1");
			return settings["g1"];
		}
	}
}

gameTime
{
	return TimeSpan.FromSeconds((current.active - current.cutscene - current.paused) / 1000000.0);
}

isLoading
{
	return true;
}
