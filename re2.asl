//Resident Evil 2 Remake Autosplitter
//By CursedToast 1/28/2019
//Last updated 1/28/2019

state("re2")
{
	int gamePauseState : "re2.exe", 0x0707A510,  0x408, 0xD8, 0x18, 0x20, 0x130;
	int map : "re2.exe", 0x0488A730,  0x1EC;
	int weaponSlot1 : "re2.exe", 0x70ACA88, 0x50, 0x98, 0x10, 0x20, 0x18, 0x10, 0x14;
	int itemSlot3 : "re2.exe", 0x070ACA88, 0x50, 0x98, 0x10, 0x30, 0x18, 0x10, 0x10;
	int bossHP : "re2.exe", 0x0707B758, 0x80, 0x88, 0x18, 0x1A0, 0x58;
	long active :  0x070ACAE0, 0x2E0, 0x218, 0x610, 0x710, 0x60, 0x18;
	long cutscene :  0x070ACAE0, 0x2E0, 0x218, 0x610, 0x710, 0x60, 0x20;
	long menu :  0x070ACAE0, 0x2E0, 0x218, 0x610, 0x710, 0x60, 0x28;
	long paused :  0x070ACAE0, 0x2E0, 0x218, 0x610, 0x710, 0x60, 0x30;
}

startup
{
	settings.Add("storageKey", false, "Storage Key");
	settings.Add("courtyardkey", false, "Courtyard Key");
	settings.Add("reachedRPDA", false, "Reached the RPD");
	settings.Add("spade", false, "Spade Key");
	settings.Add("gL", false, "Grenade Launcher");
	settings.Add("shotgun", false, "Shotgun");
	settings.Add("emptyDetonator", false, "Detonator (No Battery)");
	settings.Add("detonator", false, "Detonator");
	settings.Add("mechanicHandle", false, "Mechanic Handle");
	settings.Add("squareCrank", false, "Square Crank");
	settings.Add("redbook", false, "Red Book");
	settings.Add("weaponcard", false, "Weapons Locker Key Card");
	settings.Add("arm", false, "Statue's Left Arm");
	settings.Add("scepter", false, "Scepter");
	settings.Add("valve", false, "Valve Handle");
	settings.Add("jewel", false, "Red Jewel");
	settings.Add("jewelbox", false, "Bejewled Box");
	settings.Add("starsbadge", false, "S.T.A.R.S Badge");
	settings.Add("unicorn", false, "Unicorn Medallion");
	settings.Add("lion", false, "Lion Medallion");
	settings.Add("maiden", false, "Maiden Medallion");
	settings.Add("reachedSecretRoom", false, "Reached Secret Room");
	settings.Add("reachedGarage", false, "Reached Parking Garage");
	settings.Add("boltCutters", false, "Bolt Cutters");
	settings.Add("carkey", false, "Car Key");
	settings.Add("fuse1", false, "Fuse (Main Hall)");
	settings.Add("fuse2", false, "Fuse (Break Room Hallway)");
	settings.Add("largegear", false, "Large Gear");
	settings.Add("smallgear", false, "Small Gear");
	settings.Add("diamond", false, "Diamond Key");
	settings.Add("club", false, "Club Key");
	settings.Add("heart", false, "Heart Key");
	settings.Add("partA", false, "Boxed Electronic Part A");
	settings.Add("partB", false, "Boxed Electronic Part B");
	settings.Add("block", false, "Picture Block");
	settings.Add("scissors", false, "Scissors");
	settings.Add("orphanageKey", false, "Orphanage Key");
	settings.Add("parkingcard", false, "Parking Garage Key Card");
	settings.Add("exitedGarage", false, "Back on the Streets (leave parking garage)");
	settings.Add("reachedSewers", false, "Reached the Sewers");
	settings.Add("adaStart", false, "Ada Start");
	settings.Add("adaEnd", false, "Ada End");
	settings.Add("rook", false, "Rook Plug");
	settings.Add("queen", false, "Queen Plug");
	settings.Add("king", false, "King Plug");
	settings.Add("knight", false, "Knight Plug");
	settings.Add("bishop", false, "Bishop Plug");
	settings.Add("sewerKey", false, "Sewer Key");
	settings.Add("rescue", false, "Rescued Sherry/Ada");
	settings.Add("tbar", false, "T-Bar Valve Handle");
	settings.Add("modulator", false, "Signal Modulator");
	settings.Add("generalChip", false, "Wristband (Guest)");
	settings.Add("staffChip", false, "Wristband (General Staff)");
	settings.Add("seniorChip", false, "Wristband (Senior Staff)");
	settings.Add("g3", false, "G3 Battle Complete");
	settings.Add("chipAdmin", false, "Wristband (Admin)");
	settings.Add("dispenseEmpty", false, "Dispersal Cartridge (Empty)");
	settings.Add("dispenseSolution", false, "Dispersal Cartridge (Solution)");
	settings.Add("herbicide", false, "Dispersal Cartridge (Herbicide)");
	settings.Add("jointPlug", false, "Joint Plug");
	settings.Add("end", false, "End (Scenario A/First final boss of B)");
	settings.Add("trueEnd", false, "True End");
}

init
{
	vars.inventoryPtr = IntPtr.Zero;
    vars.inventoryPtr = 0x070ACA88;
    vars.fas = 0;

    // Track inventory IDs
    current.inventory = new int[20];
    for (int i = 0; i < current.inventory.Length; ++i)
    {
        int itemID = 0;
        IntPtr ptr;
        new DeepPointer(vars.inventoryPtr, 0x50, 0x98, 0x10, 0x20 + (i * 8), 0x18, 0x10, 0x10).DerefOffsets(memory, out ptr);
        memory.ReadValue<int>(ptr, out itemID);
        current.inventory[i] = itemID;
    }
	
	// Track Weapon IDs
	current.weapons = new int[20];
    for (int i = 0; i < current.weapons.Length; ++i)
    {
        int weaponID = 0;
        IntPtr ptr;
        new DeepPointer(vars.inventoryPtr, 0x50, 0x98, 0x10, 0x20 + (i * 8), 0x18, 0x10, 0x14).DerefOffsets(memory, out ptr);
        memory.ReadValue<int>(ptr, out weaponID);
        current.weapons[i] = weaponID;
    }
}


start
{	
	if (current.map == 347 && current.gamePauseState == 1 || current.map == 219 && current.gamePauseState == 1)
	{
		return current.weaponSlot1 == 1 || current.weaponSlot1 == 9;
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
        new DeepPointer(vars.inventoryPtr, 0x50, 0x98, 0x10, 0x20 + (i * 8), 0x18, 0x10, 0x10).DerefOffsets(memory, out ptr);
        memory.ReadValue<int>(ptr, out itemID);
        current.inventory[i] = itemID;
    }

	// Track Weapon IDs 
	current.weapons = new int[20];
    for (int i = 0; i < current.weapons.Length; ++i) 
    {
        int weaponID = 0;
        IntPtr ptr;
        new DeepPointer(vars.inventoryPtr, 0x50, 0x98, 0x10, 0x20 + (i * 8), 0x18, 0x10, 0x14).DerefOffsets(memory, out ptr);
        memory.ReadValue<int>(ptr, out weaponID);
        current.weapons[i] = weaponID;
    }
	
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
		vars.exitedGarage = 0;
		vars.end = 0;
		vars.adaStart = 0;
		vars.adaEnd = 0;
		vars.rescue = 0;
		vars.g3 = 0;
		vars.trueEnd = 0;
		vars.onTrain = 0;
		vars.shotgun = 0;
		vars.gL = 0;
	}
}

split
{
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
						return settings["detonator"];
					}
					break;
				}
				case 0x00000022:
				{
					if (vars.emptyDetonator == 0)
					{
						vars.emptyDetonator = 1;
						return settings["emptyDetonator"];
					}
					break;
				}
				case 0x0000004D:
				{
					if (vars.storageKey == 0)
					{
						vars.storageKey = 1;
						return settings["storageKey"];
					}
					break;
				}
				case 0x0000004F:
				{
					if (vars.mechanicHandle == 0)
					{
						vars.mechanicHandle = 1;
						return settings["mechanicHandle"];
					}
					break;
				}
				case 0x00000050:
				{
					if (vars.squareCrank == 0)
					{
						vars.squareCrank = 1;
						return settings["squareCrank"];
					}
					break;
				}
				case 0x00000051:
				{
					if (vars.unicorn == 0)
					{
						vars.unicorn = 1;
						return settings["unicorn"];
					}
					break;
				}
				case 0x00000076:
				{
					if (vars.lion == 0)
					{
						vars.lion = 1;
						return settings["lion"];
					}
					break;
				}
				case 0x0000007C:
				{
					if (vars.maiden == 0)
					{
						vars.maiden = 1;
						return settings["maiden"];
					}
					break;
				}
				case 0x00000052:
				{
					if (vars.spade == 0)
					{
						vars.spade = 1;
						return settings["spade"];
					}
					break;
				}
				case 0x00000053:
				{
					if (vars.parkingcard == 0)
					{
						vars.parkingcard = 1;
						return settings["parkingcard"];
					}
					break;
				}
				case 0x00000054:
				{
					if (vars.weaponcard == 0)
					{
						vars.weaponcard = 1;
						return settings["weaponcard"];
					}
					break;
				}
				case 0x00000056:
				{
					if (vars.valve == 0)
					{
						vars.valve = 1;
						return settings["valve"];
					}
					break;
				}
				case 0x00000057:
				{
					if (vars.starsbadge == 0)
					{
						vars.starsbadge = 1;
						return settings["starsbadge"];
					}
					break;
				}
				case 0x00000058:
				{
					if (vars.scepter == 0)
					{
						vars.scepter = 1;
						return settings["scepter"];
					}
					break;
				}
				case 0x0000005A:
				{
					if (vars.jewel == 0)
					{
						vars.jewel = 1;
						return settings["jewel"];
					}
					break;
				}
				case 0x0000005B:
				{
					if (vars.jewelbox == 0)
					{
						vars.jewelbox = 1;
						return settings["jewelbox"];
					}
					break;
				}
				case 0x0000005E:
				{
					if (vars.rook == 0)
					{
						vars.rook = 1;
						return settings["rook"];
					}
					break;
				}
				case 0x0000005F:
				{
					if (vars.king == 0)
					{
						vars.king = 1;
						return settings["king"];
					}
					break;
				}
				case 0x00000084:
				{
					if (vars.knight == 0)
					{
						vars.knight = 1;
						return settings["knight"];
					}
					break;
				}
				case 0x00000086:
				{
					if (vars.queen == 0)
					{
						vars.queen = 1;
						return settings["queen"];
					}
					break;
				}
				case 0x0000005D:
				{
					if (vars.bishop == 0)
					{
						vars.bishop = 1;
						return settings["bishop"];
					}
					break;
				}
				case 0x00000062:
				{
					if (vars.block == 0)
					{
						vars.block = 1;
						return settings["block"];
					}
					break;
				}
				case 0x00000072:
				{
					if (vars.redbook == 0)
					{
						vars.redbook = 1;
						return settings["redbook"];
					}
					break;
				}
				case 0x00000073:
				{
					if (vars.arm == 0)
					{
						vars.arm = 1;
						return settings["arm"];
					}
					break;
				}
				case 0x00000077:
				{
					if (vars.diamond == 0)
					{
						vars.diamond = 1;
						return settings["diamond"];
					}
					break;
				}
				case 0x00000078:
				{
					if (vars.carkey == 0)
					{
						vars.carkey = 1;
						return settings["carkey"];
					}
					break;
				}
				case 0x00000087:
				{
					if (vars.partA == 0)
					{
						vars.partA = 1;
						return settings["partA"];
					}
					break;
				}
				case 0x00000088:
				{
					if (vars.partB == 0)
					{
						vars.partB = 1;
						return settings["partB"];
					}
					break;
				}
				case 0x00000081:
				{
					if (vars.smallgear == 0)
					{
						vars.smallgear = 1;
						return settings["smallgear"];
					}
					break;
				}
				case 0x00000082:
				{
					if (vars.largegear == 0)
					{
						vars.largegear = 1;
						return settings["largegear"];
					}
					break;
				}
				case 0x00000083:
				{
					if (vars.courtyardkey == 0)
					{
						vars.courtyardkey = 1;
						return settings["courtyardkey"];
					}
					break;
				}
				case 0x0000009F:
				{
					if (vars.orphanageKey == 0)
					{
						vars.orphanageKey = 1;
						return settings["orphanageKey"];
					}
					break;
				}
				case 0x000000A0:
				{
					if (vars.club == 0)
					{
						vars.club = 1;
						return settings["club"];
					}
					break;
				}
				case 0x000000A9:
				{
					if (vars.heart == 0)
					{
						vars.heart = 1;
						return settings["heart"];
					}
					break;
				}
				case 0x000000B0:
				{
					if (vars.tbar == 0)
					{
						vars.tbar = 1;
						return settings["tbar"];
					}
					break;
				}
				case 0x000000B3:
				{
					if (vars.dispenseEmpty == 0)
					{
						vars.dispenseEmpty = 1;
						return settings["dispenseEmpty"];
					}
					break;
				}
				case 0x000000B4:
				{
					if (vars.dispenseSolution == 0)
					{
						vars.dispenseSolution = 1;
						return settings["dispenseSolution"]; 
					}
					break;
				}
				case 0x000000B5:
				{
					if (vars.herbicide == 0)
					{
						vars.herbicide = 1;
						return settings["herbicide"];
					}
					break;
				}
				case 0x000000B7:
				{
					if (vars.jointPlug == 0)
					{
						vars.jointPlug = 1;
						return settings["jointPlug"];
					}
					break;
				}
				case 0x000000BB:
				{
					if (vars.chipAdmin == 0)
					{
						vars.chipAdmin = 1;
						return settings["chipAdmin"];
					}
					break;
				}
				case 0x000000BD:
				{
					if (vars.modulator == 0)
					{
						vars.modulator = 1;
						return settings["modulator"];
					}
					break;
				}
				case 0x000000C2:
				{
					if (vars.sewerKey == 0)
					{
						vars.sewerKey = 1;
						return settings["sewerKey"];
					}
					break;
				}
				case 0x000000C3:
				{
					if (vars.generalChip == 0)
					{
						vars.generalChip = 1;
						return settings["generalChip"];
					}
					break;
				}
				case 0x000000C8:
				{
					if (vars.generalChip == 0)
					{
						vars.generalChip = 1;
						return settings["generalChip"];
					}
					break;
				}
				case 0x000000C4:
				{
					if (vars.staffChip == 0)
					{
						vars.staffChip = 1;
						return settings["staffChip"];
					}
					break;
				}
				case 0x000000C9:
				{
					if (vars.staffChip == 0)
					{
						vars.staffChip = 1;
						return settings["staffChip"];
					} 
					break;
				}
				case 0x000000C5:
				{
					if (vars.seniorChip == 0)
					{
						vars.seniorChip = 1;
						return settings["seniorChip"];
					}
					break;
				}
				case 0x000000CA:
				{
					if (vars.seniorChip == 0)
					{
						vars.seniorChip = 1;
						return settings["seniorChip"];
					}
					break;
				}
				case 0x000000F0:
				{
					if (vars.fuse1 == 0)
					{
						vars.fuse1 = 1;
						return settings["fuse1"];
					}
					break;
				}
				case 0x000000F1:
				{
					if (vars.fuse2 == 0)
					{
						vars.fuse2 = 1;
						return settings["fuse2"];
					}
					break;
				}
				case 0x000000F3:
				{
					if (vars.scissors == 0)
					{
						vars.scissors = 1;
						return settings["scissors"];
					}
					break;
				}
				case 0x000000F4:
				{
					if (vars.boltCutters == 0)
					{
						vars.boltCutters = 1;
						return settings["boltCutters"];
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
						return settings["shotgun"];
					}
					break;
				}
				case 0x0000002A:
				{
					if (vars.gL == 0)
					{
						vars.gL = 1;
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
	
	
	// Map splits
	if (current.map != old.map)
	{
		if (current.map == 317 && vars.reachedSewers == 0 || current.map == 377 && old.map == 407 && vars.reachedSewers == 0)
		{
			vars.reachedSewers = 1;
			return settings["reachedSewers"];
		}
		
		if (current.map == 310 && current.weaponSlot1 == 8 && vars.adaStart == 0)
		{
			vars.adaStart = 1;
			return settings["adaStart"];
		}
		
		if (current.map == 112 && vars.reachedRPDA == 0 && current.gamePauseState == 1 || current.map == 261 && vars.reachedRPDA == 0)
		{
			vars.reachedRPDA = 1;
			return settings["reachedRPDA"];
		}
		
		if (current.map == 277 && vars.reachedGarage == 0)
		{
			vars.reachedGarage = 1;
			return settings["reachedGarage"];
		}
		
		if (current.map == 350 && vars.reachedSecretRoom == 0)
		{
			vars.reachedSecretRoom = 1;
			return settings["reachedSecretRoom"];
		}
		
		if (old.map == 277 && current.map == 351 && vars.exitedGarage == 0)
		{
			vars.exitedGarage = 1;
			return settings["exitedGarage"];
		}
		
		if (current.map == 338 && vars.rescue == 0 || old.map == 0 && current.map == 335 && vars.rescue == 0)
		{
			vars.rescue = 1;
			return settings["rescue"];
		}
		
		if (current.map == 419 && current.gamePauseState == 257)
		{
			vars.g3 = 1;
			return settings["g3"];
		}
		
		if (current.map == 423 && vars.onTrain == 0)
		{
			vars.onTrain = 1;
		}
		if (current.map == 0 && old.map == 330 && vars.adaEnd == 0)
		{
			vars.adaEnd = 1;
			return settings["adaEnd"];
		}
	}
	
	//End split
	if (current.map == 421 && old.bossHP >= 50000 && !(current.bossHP >= 50000) && vars.end == 0 || current.map == 422 && current.gamePauseState == 257 && vars.end == 0)
	{
		vars.end = 1;
		return settings["end"];
	}
	
	if (current.map == 422 && vars.onTrain == 1 && current.gamePauseState == 257 && vars.trueEnd == 0)
	{
		vars.trueEnd = 1;
		return settings["trueEnd"];
	}
}

gameTime
{
	return TimeSpan.FromSeconds((current.active - current.cutscene - current.paused) / 1000000.0);
}

isLoading
{
	return true;
	//return current.gamePauseState != 1 && current.gamePauseState != 65537;
}
