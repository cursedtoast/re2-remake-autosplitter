//Resident Evil 2 Remake Autosplitter
//By CursedToast 1/28/2019
//Last updated 05/08/2023
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
    vars.logToFile = false;
    vars.logPath = "re2.log";
    vars.MAX_ITEMS = 20;

    // DX11
    vars.re2WW_11055033 = new byte[32] { 0xF2, 0x6C, 0xDE, 0xBF, 0xFE, 0x66, 0x55, 0xD0, 0x5B, 0xF0, 0x04, 0x7F, 0x79, 0x39, 0xEA, 0x5E, 0x38, 0x36, 0x08, 0xAF, 0xF4, 0x60, 0x3C, 0xA3, 0xF0, 0xF3, 0x6A, 0x12, 0xDC, 0x56, 0x23, 0xCA };
    // DX12
    vars.re2WW_11026357 = new byte[32] { 0xA6, 0xE7, 0x20, 0xDB, 0xA2, 0x01, 0xAB, 0xEA, 0x9A, 0xCC, 0x05, 0xCF, 0xAF, 0x1E, 0xDA, 0x46, 0x0C, 0xA7, 0xF7, 0x29, 0x25, 0x57, 0xF5, 0x71, 0x85, 0x7A, 0xD2, 0xB0, 0xE5, 0x54, 0x13, 0x54 };

    Action<string, bool, string, string> initSettingGroup = (key, enabled, title, description) => {
        settings.Add(key, enabled, title);
        settings.SetToolTip(key, description);
    };

    Action<string, bool, string, string, string> initSettingGroupOption = (key, enabled, title, group, description) => {
        settings.Add(key, true, title, group);
        settings.SetToolTip(key, description);
    };

    Action<string, string> SaveLogs = (filePath, text) => {
        if (!File.Exists(filePath)) {
            // Create a new file with the specified name
            using (StreamWriter sw = File.CreateText(filePath))
                sw.WriteLine(text);
        }
        else {
            // Append the new line to the file
            using (StreamWriter sw = File.AppendText(filePath))
                sw.WriteLine(text);
        }
    };
    vars.LogsSave = SaveLogs;

    Action<string> DebugOutput = (text) => {
        print("[Debug " + timer.CurrentTime.GameTime.ToString(@"hh\:mm\:ss") + "]: " + text);
        if (vars.logToFile)
            SaveLogs(vars.logPath, text);
    };
    vars.Log = DebugOutput;

    Action<string> ClearLogs = (filePath) => {
        vars.Log("Clearing Logs");
        if (File.Exists(filePath))
            File.WriteAllLines(filePath, new string[0]);
    };
    vars.LogsClear = ClearLogs;

    Func<byte[], string> OutputVersionString = (checksum) => {
        StringBuilder sb = new StringBuilder("vars.re2??_00000000 = new byte[32] { ");
        for (int i = 0; i < checksum.Length; i++)
        {
            sb.AppendFormat("0x{0:X2}", checksum[i]);
            if (i < checksum.Length - 1)
                sb.Append(", ");
        }
        sb.Append(" };");
        return sb.ToString();
    };
    vars.OutputVersion = OutputVersionString;

    Func<ProcessModuleWow64Safe, byte[]> CalcModuleHash = (module) => {
        vars.Log("Calcuating hash of "+module.FileName);
        byte[] checksum = new byte[32];
        using (var hashFunc = System.Security.Cryptography.SHA256.Create())
            using (var fs = new FileStream(module.FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite | FileShare.Delete))
                checksum = hashFunc.ComputeHash(fs);
        return checksum;
    };
    vars.CalcModuleHash = CalcModuleHash;

    vars.GetStartType = new Dictionary<int,string> {
        {0, "Main Menu"},
        {1, "New Game"},
        {2, "Load Game"},
        {3, "Back New Game"},
    };

    vars.GetCharacter = new Dictionary<int,string> {
        {0, "Leon"},
        {1, "Claire"},
        {2, "Ada"},
        {3, "Sherry"},
    };

    initSettingGroup("logToFile", false, "Debug Logging", "Toggles the DebugOutput to output 10 latest logs to log file");
    initSettingGroup("segments", false, "Segment Practice Start", "Enables or disables segmented start trigger for segmented practice.");

    initSettingGroup("keygroup", true, "Keys", "Key items to split when first picked up.");
    initSettingGroupOption("storageKey", false, "Storage Key", "keygroup", "");
    initSettingGroupOption("courtyardkey", false, "Courtyard Key", "keygroup", "");
    initSettingGroupOption("spade", false, "Spade Key", "keygroup", "");
    initSettingGroupOption("diamond", false, "Diamond Key", "keygroup", "");
    initSettingGroupOption("club", false, "Club Key", "keygroup", "");
    initSettingGroupOption("heart", false, "Heart Key", "keygroup", "");
    initSettingGroupOption("weaponcard", false, "Weapons Locker Key Card", "keygroup", "");
    initSettingGroupOption("orphanageKey", false, "Orphanage Key", "keygroup", "");
    initSettingGroupOption("parkingcard", false, "Parking Garage Key Card", "keygroup", "");
    initSettingGroupOption("sewerKey", false, "Sewer Key", "keygroup", "");

    initSettingGroup("medalliongroup", true, "Medallions", "Medallion items to split when first picked up.");
    initSettingGroupOption("unicorn", false, "Unicorn Medallion", "medalliongroup", "");
    initSettingGroupOption("maiden", false, "Maiden Medallion", "medalliongroup", "");
    initSettingGroupOption("lion", false, "Lion Medallion", "medalliongroup", "");

    initSettingGroup("fusegroup", true, "Fuses", "Fuse items to split when first picked up.");
    initSettingGroupOption("fuse1", false, "Fuse (Main Hall)", "fusegroup", "");
    initSettingGroupOption("fuse2", false, "Fuse (Break Room Hallway)", "fusegroup", "");

    initSettingGroup("geargroup", true, "Gears", "Gear items to split when first picked up.");
    initSettingGroupOption("largegear", false, "Large Gear", "geargroup", "");
    initSettingGroupOption("smallgear", false, "Small Gear", "geargroup", "");

    initSettingGroup("electrogroup", true, "Electronic Parts", "Electronic Parts to split when first picked up.");
    initSettingGroupOption("partA", false, "Boxed Electronic Part A", "electrogroup", "");
    initSettingGroupOption("partB", false, "Boxed Electronic Part B", "electrogroup", "");

    initSettingGroup("pluggroup", true, "Plugs", "Plug items to split when first picked up.");
    initSettingGroupOption("rook", false, "Rook Plug", "pluggroup", "");
    initSettingGroupOption("queen", false, "Queen Plug", "pluggroup", "");
    initSettingGroupOption("king", false, "King Plug", "pluggroup", "");
    initSettingGroupOption("knight", false, "Knight Plug", "pluggroup", "");
    initSettingGroupOption("bishop", false, "Bishop Plug", "pluggroup", "");

    initSettingGroup("dispensergroups", true, "Dispensers", "Dispenser items to split when first picked up.");
    initSettingGroupOption("dispenseEmpty", false, "Dispersal Cartridge (Empty)", "dispensergroups", "");
    initSettingGroupOption("dispenseSolution", false, "Dispersal Cartridge (Solution)", "dispensergroups", "");
    initSettingGroupOption("herbicide", false, "Dispersal Cartridge (Herbicide)", "dispensergroups", "");

    initSettingGroup("wristgroup", true, "Wristbands", "Wristband items to split when first picked up.");
    initSettingGroupOption("generalChip", false, "Guest", "wristgroup", "");
    initSettingGroupOption("staffChip", false, "General Staff", "wristgroup", "");
    initSettingGroupOption("seniorChip", false, "Senior Staff", "wristgroup", "");
    initSettingGroupOption("chipAdmin", false, "Admin (Claire Only)", "wristgroup", "");

    initSettingGroup("eventgroup", true, "Events", "Events to split when first picked up.");
    initSettingGroupOption("reachedRPDA", false, "Reached the RPD (A Scenario only)", "eventgroup", "");
    initSettingGroupOption("reachedSecretRoom", false, "Reached Secret Room", "eventgroup", "");
    initSettingGroupOption("reachedGarage", false, "Reached Parking Garage", "eventgroup", "");
    initSettingGroupOption("exitedGarage", false, "Back on the Streets (leave parking garage)", "eventgroup", "");
    initSettingGroupOption("reachedSewers", false, "Reached the Sewers", "eventgroup", "");
    initSettingGroupOption("adaStart", false, "Ada Start", "eventgroup", "");
    initSettingGroupOption("adaEnd", false, "Ada End", "eventgroup", "");
    initSettingGroupOption("sherryStart", false, "Sherry Start", "eventgroup", "");
    initSettingGroupOption("rescue", false, "Rescued Sherry/Ada", "eventgroup", "");
    initSettingGroupOption("g1Start", true, "G1 Battle Start", "eventgroup", "");
    initSettingGroupOption("g2Start", true, "G2 Battle Start", "eventgroup", "");
    initSettingGroupOption("g3Start", true, "G3 Battle Start", "eventgroup", "");
    initSettingGroupOption("g4Start", true, "G4 Battle Start", "eventgroup", "");
    initSettingGroupOption("g1", true, "G1 Battle Complete", "eventgroup", "");
    initSettingGroupOption("g2", true, "G2 Battle Complete", "eventgroup", "");
    initSettingGroupOption("g3", false, "G3 Battle Complete", "eventgroup", "");
    initSettingGroupOption("end", false, "End (Scenario A/First final boss of B)", "eventgroup", "");
    initSettingGroupOption("trueEnd", false, "True End", "eventgroup", "");

    initSettingGroup("miscgroup", true, "Misc.", "Misc items to split when first picked up.");
    initSettingGroupOption("boltCutters", false, "Bolt Cutters", "miscgroup", "");
    initSettingGroupOption("emptyDetonator", false, "Detonator (No Battery)", "miscgroup", "");
    initSettingGroupOption("detonator", false, "Detonator", "miscgroup", "");
    initSettingGroupOption("mechanicHandle", false, "Mechanic Handle", "miscgroup", "");
    initSettingGroupOption("squareCrank", false, "Square Crank", "miscgroup", "");
    initSettingGroupOption("block", false, "Picture Block", "miscgroup", "");
    initSettingGroupOption("scissors", false, "Scissors", "miscgroup", "");
    initSettingGroupOption("valve", false, "Valve Handle", "miscgroup", "");
    initSettingGroupOption("tbar", false, "T-Bar Valve Handle", "miscgroup", "");
    initSettingGroupOption("modulator", false, "Signal Modulator", "miscgroup", "");
    initSettingGroupOption("jointPlug", false, "Joint Plug", "miscgroup", "");
    
    initSettingGroup("deprecate", true, "Deprecated", "Deprecated items to split when first picked up.");
    initSettingGroupOption("redbook", false, "Red Book", "deprecate", "");
    initSettingGroupOption("arm", false, "Statue's Left Arm", "deprecate", "");
    initSettingGroupOption("scepter", false, "Scepter", "deprecate", "");
    initSettingGroupOption("jewel", false, "Red Jewel", "deprecate", "");
    initSettingGroupOption("jewelbox", false, "Bejewled Box", "deprecate", "");
    initSettingGroupOption("starsbadge", false, "S.T.A.R.S Badge", "deprecate", "");
    initSettingGroupOption("gL", false, "Grenade Launcher", "deprecate", "");
    initSettingGroupOption("shotgun", false, "Shotgun", "deprecate", "");
}

init
{
    // Initialize Version
    vars.inventoryPtr = IntPtr.Zero;

    // Update Version Info and Inventory Pointer
    Action<string, int> UpdateVersion = (ver, address) => {
        version = ver;
        vars.inventoryPtr = address;
    };

    byte[] checksum = vars.CalcModuleHash(modules.First());
    if (Enumerable.SequenceEqual(checksum, vars.re2WW_11026357))
        UpdateVersion("World Public RT 2023", 0x091A6CD0);
    else if (Enumerable.SequenceEqual(checksum, vars.re2WW_11055033))
        UpdateVersion("World DX11 2023", 0x070B23A8);
    else
    {
        vars.LogsSave("re2Version.log", vars.OutputVersion(checksum));
        UpdateVersion("Unknown", 0x0);
    }

    // Initialize Inventory 
    // Gets ItemID from given index of the array in game memory
    Func<int, int> GetItemID = (idx) => {
        int id = 0;
        IntPtr ptr;
        new DeepPointer(vars.inventoryPtr, 0x58, 0x10, 0x20, 0x98, 0x10, 0x20 + (idx * 8), 0x18, 0x10, 0x10).DerefOffsets(memory, out ptr);
        memory.ReadValue<int>(ptr, out id);
        return id;
    };
    vars.GetItemID = GetItemID;

    // Gets WeaponID from given index of the array in game memory
    Func<int, int> GetWeaponID = (idx) => {
        int id = 0;
        IntPtr ptr;
        new DeepPointer(vars.inventoryPtr, 0x58, 0x10, 0x20, 0x98, 0x10, 0x20 + (idx * 8), 0x18, 0x10, 0x14).DerefOffsets(memory, out ptr);
        memory.ReadValue<int>(ptr, out id);
        return id;
    };
    vars.GetWeaponID = GetWeaponID;
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
        vars.LogsClear(vars.logPath);
        vars.Log(isNewGameStart ? "New Game Timer Started" : "Load Game Timer Started");
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
        vars.Log("Exited To Title Resetting Timer");
        return true;
    }
}

update
{
    vars.logToFile = settings["logToFile"];
    if (version == "Unknown")
        return false;

    if (current.isCutscene != old.isCutscene)
        vars.Log("Cutscene " + (current.isCutscene == 1 ? "Started" : "Ended"));

    if (current.survivorType != old.survivorType)
        vars.Log("Character Set To " + vars.GetCharacter[current.survivorType]);

    if (current.gameStartType != old.gameStartType)
        vars.Log("Game Start Type Set To " + vars.GetStartType[current.gameStartType]);

    if (current.map != old.map)
        vars.Log("Map ID Set To " + current.map);

    if (current.loc != old.loc)
        vars.Log("Location ID Set To " + current.loc + " Map ID Set To " + current.map);

    if (current.map != old.map)
        vars.Log("Map ID Set To " + current.map);

    // Track inventory IDs
    current.inventory = new int[vars.MAX_ITEMS];
    current.weapons = new int[vars.MAX_ITEMS];
    for (int i = 0; i < vars.MAX_ITEMS; ++i)
    {
        current.inventory[i] = vars.GetItemID(i);
        current.weapons[i] = vars.GetWeaponID(i);
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
          vars.Log("Splitting: " + splitId);
          return settings[splitId];
    };

    int[] currentInventory = (current.inventory as int[]);
    int[] oldInventory = (old.inventory as int[]); // throws error first update, will be fine afterwards.

    int[] currentWeapons = (current.weapons as int[]);
    int[] oldWeapons = (old.weapons as int[]); // throws error first update, will be fine afterwards.

    for (int i = 0; i < currentInventory.Length; i++)
    {
        // Weapon splits
        if (currentWeapons[i] != oldWeapons[i])
        {
            switch (currentWeapons[i])
            {
                case 0x0000000B:
                {
                    if (vars.shotgun == 0)
                    {
                        vars.shotgun = 1;
                        return LogAndSplit("shotgun");
                    }
                    break;
                }
                case 0x0000002A:
                {
                    if (vars.gL == 0)
                    {
                        vars.gL = 1;
                        return LogAndSplit("gL");
                    }
                    break;
                }
                default:
                {
                    break; // No work to do.
                }
            }
        }

        // Item splits
        if (currentInventory[i] != oldInventory[i])
        {
            switch (currentInventory[i])
            {
                case 0x0000001F:
                {
                    if (vars.detonator == 0)
                    {
                        vars.detonator = 1;
                        return LogAndSplit("detonator");
                    }
                    break;
                }
                case 0x00000022:
                {
                    if (vars.emptyDetonator == 0)
                    {
                        vars.emptyDetonator = 1;
                        return LogAndSplit("emptyDetonator");
                    }
                    break;
                }
                case 0x0000004D:
                {
                    if (vars.storageKey == 0)
                    {
                        vars.storageKey = 1;
                        return LogAndSplit("storageKey");
                    }
                    break;
                }
                case 0x0000004F:
                {
                    if (vars.mechanicHandle == 0)
                    {
                        vars.mechanicHandle = 1;
                        return LogAndSplit("mechanicHandle");
                    }
                    break;
                }
                case 0x00000050:
                {
                    if (vars.squareCrank == 0)
                    {
                        vars.squareCrank = 1;
                        return LogAndSplit("squareCrank");
                    }
                    break;
                }
                case 0x00000051:
                {
                    if (vars.unicorn == 0)
                    {
                        vars.unicorn = 1;
                        return LogAndSplit("unicorn");
                    }
                    break;
                }
                case 0x00000076:
                {
                    if (vars.lion == 0)
                    {
                        vars.lion = 1;
                        return LogAndSplit("lion");
                    }
                    break;
                }
                case 0x0000007C:
                {
                    if (vars.maiden == 0)
                    {
                        vars.maiden = 1;
                        return LogAndSplit("maiden");
                    }
                    break;
                }
                case 0x00000052:
                {
                    if (vars.spade == 0)
                    {
                        vars.spade = 1;
                        return LogAndSplit("spade");
                    }
                    break;
                }
                case 0x00000053:
                {
                    if (vars.parkingcard == 0)
                    {
                        vars.parkingcard = 1;
                        return LogAndSplit("parkingcard");
                    }
                    break;
                }
                case 0x00000054:
                {
                    if (vars.weaponcard == 0)
                    {
                        vars.weaponcard = 1;
                        return LogAndSplit("weaponcard");
                    }
                    break;
                }
                case 0x00000056:
                {
                    if (vars.valve == 0)
                    {
                        vars.valve = 1;
                        return LogAndSplit("valve");
                    }
                    break;
                }
                case 0x00000057:
                {
                    if (vars.starsbadge == 0)
                    {
                        vars.starsbadge = 1;
                        return LogAndSplit("starsbadge");
                    }
                    break;
                }
                case 0x00000058:
                {
                    if (vars.scepter == 0)
                    {
                        vars.scepter = 1;
                        return LogAndSplit("scepter");
                    }
                    break;
                }
                case 0x0000005A:
                {
                    if (vars.jewel == 0)
                    {
                        vars.jewel = 1;
                        return LogAndSplit("jewel");
                    }
                    break;
                }
                case 0x0000005B:
                {
                    if (vars.jewelbox == 0)
                    {
                        vars.jewelbox = 1;
                        return LogAndSplit("jewelbox");
                    }
                    break;
                }
                case 0x0000005E:
                {
                    if (vars.rook == 0)
                    {
                        vars.rook = 1;
                        return LogAndSplit("rook");
                    }
                    break;
                }
                case 0x0000005F:
                {
                    if (vars.king == 0)
                    {
                        vars.king = 1;
                        return LogAndSplit("king");
                    }
                    break;
                }
                case 0x00000084:
                {
                    if (vars.knight == 0)
                    {
                        vars.knight = 1;
                        return LogAndSplit("knight");
                    }
                    break;
                }
                case 0x00000086:
                {
                    if (vars.queen == 0)
                    {
                        vars.queen = 1;
                        return LogAndSplit("queen");
                    }
                    break;
                }
                case 0x0000005D:
                {
                    if (vars.bishop == 0)
                    {
                        vars.bishop = 1;
                        return LogAndSplit("bishop");
                    }
                    break;
                }
                case 0x00000062:
                {
                    if (vars.block == 0)
                    {
                        vars.block = 1;
                        return LogAndSplit("block");
                    }
                    break;
                }
                case 0x00000072:
                {
                    if (vars.redbook == 0)
                    {
                        vars.redbook = 1;
                        return LogAndSplit("redbook");
                    }
                    break;
                }
                case 0x00000073:
                {
                    if (vars.arm == 0)
                    {
                        vars.arm = 1;
                        return LogAndSplit("arm");
                    }
                    break;
                }
                case 0x00000077:
                {
                    if (vars.diamond == 0)
                    {
                        vars.diamond = 1;
                        return LogAndSplit("diamond");
                    }
                    break;
                }
                case 0x00000078:
                {
                    if (vars.carkey == 0)
                    {
                        vars.carkey = 1;
                        return LogAndSplit("carkey");
                    }
                    break;
                }
                case 0x00000087:
                {
                    if (vars.partA == 0)
                    {
                        vars.partA = 1;
                        return LogAndSplit("partA");
                    }
                    break;
                }
                case 0x00000088:
                {
                    if (vars.partB == 0)
                    {
                        vars.partB = 1;
                        return LogAndSplit("partB");
                    }
                    break;
                }
                case 0x00000081:
                {
                    if (vars.smallgear == 0)
                    {
                        vars.smallgear = 1;
                        return LogAndSplit("smallgear");
                    }
                    break;
                }
                case 0x00000082:
                {
                    if (vars.largegear == 0)
                    {
                        vars.largegear = 1;
                        return LogAndSplit("largegear");
                    }
                    break;
                }
                case 0x00000083:
                {
                    if (vars.courtyardkey == 0)
                    {
                        vars.courtyardkey = 1;
                        return LogAndSplit("courtyardkey");
                    }
                    break;
                }
                case 0x0000009F:
                {
                    if (vars.orphanageKey == 0)
                    {
                        vars.orphanageKey = 1;
                        return LogAndSplit("orphanageKey");
                    }
                    break;
                }
                case 0x000000A0:
                {
                    if (vars.club == 0)
                    {
                        vars.club = 1;
                        return LogAndSplit("club");
                    }
                    break;
                }
                case 0x000000A9:
                {
                    if (vars.heart == 0)
                    {
                        vars.heart = 1;
                        return LogAndSplit("heart");
                    }
                    break;
                }
                case 0x000000B0:
                {
                    if (vars.tbar == 0)
                    {
                        vars.tbar = 1;
                        return LogAndSplit("tbar");
                    }
                    break;
                }
                case 0x000000B3:
                {
                    if (vars.dispenseEmpty == 0)
                    {
                        vars.dispenseEmpty = 1;
                        return LogAndSplit("dispenseEmpty");
                    }
                    break;
                }
                case 0x000000B4:
                {
                    if (vars.dispenseSolution == 0)
                    {
                        vars.dispenseSolution = 1;
                        return LogAndSplit("dispenseSolution"); 
                    }
                    break;
                }
                case 0x000000B5:
                {
                    if (vars.herbicide == 0)
                    {
                        vars.herbicide = 1;
                        return LogAndSplit("herbicide");
                    }
                    break;
                }
                case 0x000000B7:
                {
                    if (vars.jointPlug == 0)
                    {
                        vars.jointPlug = 1;
                        return LogAndSplit("jointPlug");
                    }
                    break;
                }
                case 0x000000BB:
                {
                    if (vars.chipAdmin == 0)
                    {
                        vars.chipAdmin = 1;
                        return LogAndSplit("chipAdmin");
                    }
                    break;
                }
                case 0x000000BD:
                {
                    if (vars.modulator == 0)
                    {
                        vars.modulator = 1;
                        return LogAndSplit("modulator");
                    }
                    break;
                }
                case 0x000000C2:
                {
                    if (vars.sewerKey == 0)
                    {
                        vars.sewerKey = 1;
                        return LogAndSplit("sewerKey");
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
                        return LogAndSplit("generalChip");
                    }
                    break;
                }
                case 0x000000C4:
                case 0x000000C9:
                {
                    if (vars.staffChip == 0)
                    {
                        vars.staffChip = 1;
                        return LogAndSplit("staffChip");
                    }
                    break;
                }
                case 0x000000C5:
                case 0x000000CA:
                {
                    if (vars.seniorChip == 0)
                    {
                        vars.seniorChip = 1;
                        return LogAndSplit("seniorChip");
                    }
                    break;
                }
                case 0x000000F0:
                {
                    if (vars.fuse1 == 0)
                    {
                        vars.fuse1 = 1;
                        return LogAndSplit("fuse1");
                    }
                    break;
                }
                case 0x000000F1:
                {
                    if (vars.fuse2 == 0)
                    {
                        vars.fuse2 = 1;
                        return LogAndSplit("fuse2");
                    }
                    break;
                }
                case 0x000000F3:
                {
                    if (vars.scissors == 0)
                    {
                        vars.scissors = 1;
                        return LogAndSplit("scissors");
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

    // G3 End
    if (current.map == 419 && !(current.bossCHP >= 1) && vars.g3Start == 1 && vars.g3 == 0)
    {
        vars.g3 = 1;
        return LogAndSplit("g3");
    }

    // G2 Start
    if (current.map == 335 && !(current.bossHP == 24000) && vars.g2Start == 0)
    {
        vars.g2Start = 1;
        return LogAndSplit("g2Start");
    }

    // G2 End
    if (current.map == 335 && !(current.bossHP >= 1) && vars.g2Start == 1 && vars.g2 == 0)
    {
        vars.g2 = 1;
        return LogAndSplit("g2");
    }

    // G4 Start
    if (current.map == 421 && current.bossHP >= 3000000 && vars.g4Start == 0)
    {
        vars.g4Start = 1;
        return LogAndSplit("g4Start");
    }

    // G4 End and Alt Ending
    bool isG4Ending = current.isCutscene == 1 && current.map == 421 && vars.g4Start == 1 && vars.end == 0;
    bool isOtherEnding = old.map == 373 && current.map == 422 && vars.end == 0;

    if (isG4Ending || isOtherEnding)
    {
        vars.end = 1;
        return LogAndSplit("end");
    }

    // True Endings?
    bool isSTyrantEnding = old.map == 422 && current.map == 422 && vars.end == 1 && vars.trueEnd == 0 && current.isCutscene == 1;
    bool isG5Ending = current.map == 421 && vars.onTrain == 1 && old.map == 423 && vars.trueEnd == 0 && current.isCutscene == 1;
    if (isSTyrantEnding || isG5Ending)
    {
        vars.trueEnd = 1;
        return LogAndSplit("trueEnd");
    }

    // Map splits
    if (current.map != old.map)
    {
        if (current.map == 317 && vars.reachedSewers == 0 || current.map == 377 && old.map == 407 && vars.reachedSewers == 0)
        {
            vars.reachedSewers = 1;
            return LogAndSplit("reachedSewers");
        }

        if (current.map == 112 && vars.reachedRPDA == 0 || current.map == 261 && vars.reachedRPDA == 0)
        {
            // Check is Scenerio B and Does Not Have Courtyard Key
            if (current.scenerioTypeValue == 2 || current.scenerioTypeValue == 3)
                if (vars.courtyardkey == 0) return false;

            vars.reachedRPDA = 1;
            return LogAndSplit("reachedRPDA");
        }

        if (current.map == 277 && vars.reachedGarage == 0)
        {
            vars.reachedGarage = 1;
            return LogAndSplit("reachedGarage");
        }

        if (current.map == 350 && vars.reachedSecretRoom == 0)
        {
            vars.reachedSecretRoom = 1;
            return LogAndSplit("reachedSecretRoom");
        }

        if (old.map == 277 && current.map == 351 && vars.exitedGarage == 0)
        {
            vars.exitedGarage = 1;
            return LogAndSplit("exitedGarage");
        }

        if (current.map == 338 && vars.rescue == 0 || old.map == 0 && current.map == 335 && vars.rescue == 0)
        {
            vars.rescue = 1;
            return LogAndSplit("rescue");
        }

        if (current.map == 423 && vars.onTrain == 0)
        {
            vars.onTrain = 1;
        }
        if (current.map == 0 && old.map == 330 && vars.adaEnd == 0)
        {
            vars.adaEnd = 1;
            return LogAndSplit("adaEnd");
        }
    }

    // Character Swap splits
    if (current.map == 310 && current.survivorType == 2 && vars.adaStart == 0)
    {
        vars.adaStart = 1;
        return LogAndSplit("adaStart");
    }

    if (current.map == 363 && current.survivorType == 3 && vars.sherryStart == 0)
    {
        vars.sherryStart = 1;
        return LogAndSplit("sherryStart");
    }

    // Cutscene Playing
    if (current.isCutscene == 1)
    {
        if (current.map == 353 && vars.reachedG1 == 0)
        {
            vars.reachedG1 = 1;
        }
        if (current.map == 419 && vars.reachedG3 == 0)
        {
            vars.reachedG3 = 1;
        }
    }

    // Cutscene Paused For Skipping
    if (current.isPaused == 1)
    {
        if (current.map == 353 && vars.reachedG1 == 1 && vars.g1CutsceneSkipped == 0)
            vars.g1CutsceneSkipped = 1;
    }

    if (current.map == 419 && vars.reachedG3 == 1 && vars.g3CutsceneSkipped == 0)
        vars.g3CutsceneSkipped = 1;

    // Cutscene Skipped
    if (current.isCutscene == 0 && current.isPaused == 0)
    {
        if (current.map == 353 && vars.g1CutsceneSkipped == 1 && vars.g1Start == 0)
        {
            vars.g1Start = 1;
            return LogAndSplit("g1Start");
        }
        if (current.map == 419 && vars.g3CutsceneSkipped == 1 && vars.g3Start == 0)
        {
            vars.g3Start = 1;
            return LogAndSplit("g3Start");
        }
        if (current.map == 353 && !(current.bossHP >= 1) && vars.g1Start == 1 && vars.g1 == 0)
        {
            vars.g1 = 1;
            return LogAndSplit("g1");
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
