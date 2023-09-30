//Resident Evil 2 Remake Autosplitter
//By CursedToast 1/28/2019
//Last updated 08/26/2023
//New Pointers by VideoGameRoulette & DeathHound

state("re2", "World Public RT 2023")
{
    int gameStartType : "re2.exe", 0x091AE1F0, 0x54;
    int scenerioTypeValue : "re2.exe", 0x091AE1F0, 0x1A0, 0x1C;
    int survivorType : "re2.exe", 0x091AD2C0, 0x50, 0x10, 0x20, 0x54;
    int playerCurrentHP : "re2.exe", 0x091AD2C0, 0x50, 0x10, 0x20, 0x230, 0x58;
    int playerMaxHP : "re2.exe", 0x091AD2C0, 0x50, 0x10, 0x20, 0x230, 0x54;
    int map : "re2.exe", 0x91A8074;
    int loc : "re2.exe", 0x91A8070;
    int bossCHP : "re2.exe", 0x091A6AF8, 0x58, 0x10, 0x20, 0x218, 0xB8, 0x58;
    int bossHP : "re2.exe", 0x091A6AF8, 0x58, 0x10, 0x20, 0x218, 0xB8, 0x54;
    byte isCutscene : "re2.exe", 0x091AED68, 0x51;
    byte isPaused : "re2.exe", 0x091AED68, 0x53;
    long active : "re2.exe", 0x091AED68, 0x60, 0x18;
    long cutscene : "re2.exe", 0x091AED68, 0x60, 0x20;
    long paused : "re2.exe", 0x091AED68, 0x60, 0x30;
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

state("re2", "Japanese DX11 2023")
{
    // Japanese pointers are the same was Worldwide
    int gameStartType : "re2.exe", 0x70B9320, 0x54;
    int scenerioTypeValue : "re2.exe", 0x70B9320, 0x198, 0x1C;
    int survivorType : "re2.exe", 0x70AA850, 0x50, 0x10, 0x20, 0x54;
    int playerCurrentHP : "re2.exe", 0x70AA850, 0x50, 0x10, 0x20, 0x230, 0x58;
    int playerMaxHP : "re2.exe", 0x70AA850, 0x50, 0x10, 0x20, 0x230, 0x54;
    int map : "re2.exe", 0x070A7D84;
    int loc : "re2.exe", 0x070A7D80;
    int bossCHP : "re2.exe", 0x70A69E0, 0x58, 0x10, 0x20, 0x218, 0xB8, 0x58;
    int bossHP : "re2.exe", 0x70A69E0, 0x58, 0x10, 0x20, 0x218, 0xB8, 0x54;
    byte isCutscene : "re2.exe", 0x70AEBB8, 0x51;
    byte isPaused : "re2.exe", 0x70AEBB8, 0x53;
    int cutscene : "re2.exe", 0x70AEBB8, 0x51;
    long active : "re2.exe", 0x70AEBB8, 0x60, 0x18;
    long cutscene : "re2.exe", 0x70AEBB8, 0x60, 0x20;
    long paused : "re2.exe", 0x70AEBB8, 0x60, 0x30;
}

state ("re2", "Japanese DX12 2023")
{
    // Japanese pointers are the same was Worldwide
    int gameStartType : "re2.exe", 0x91AE1F0, 0x54;
    int scenerioTypeValue : "re2.exe", 0x91AE1F0, 0x198, 0x1C;
    int survivorType : "re2.exe", 0x91AD2C0, 0x50, 0x10, 0x20, 0x54;
    int playerCurrentHP : "re2.exe", 0x91AD2C0, 0x50, 0x10, 0x20, 0x230, 0x58;
    int playerMaxHP : "re2.exe", 0x91AD2C0, 0x50, 0x10, 0x20, 0x230, 0x54;
    int map : "re2.exe", 0x91A8074;
    int loc : "re2.exe", 0x91A8070;
    int bossCHP : "re2.exe", 0x91A6AF8, 0x58, 0x10, 0x20, 0x218, 0xB8, 0x58;
    int bossHP : "re2.exe", 0x91A6AF8, 0x58, 0x10, 0x20, 0x218, 0xB8, 0x54;
    byte isCutscene : "re2.exe", 0x91AED68, 0x51;
    byte isPaused : "re2.exe", 0x91AED68, 0x53;
    int cutscene : "re2.exe", 0x91AED68, 0x51;
    long active : "re2.exe", 0x91AED68, 0x60, 0x18;
    long cutscene : "re2.exe", 0x91AED68, 0x60, 0x20;
    long paused : "re2.exe", 0x91AED68, 0x60, 0x30;
}

startup
{
    vars.logToFile = false;
    vars.logPath = "re2.log";
    vars.MAX_ITEMS = 20;
    vars.Splits = new List<string>();

    // International/Worldwide
    // DX11
    vars.re2WW_11055033 = new byte[32] { 0xF2, 0x6C, 0xDE, 0xBF, 0xFE, 0x66, 0x55, 0xD0, 0x5B, 0xF0, 0x04, 0x7F, 0x79, 0x39, 0xEA, 0x5E, 0x38, 0x36, 0x08, 0xAF, 0xF4, 0x60, 0x3C, 0xA3, 0xF0, 0xF3, 0x6A, 0x12, 0xDC, 0x56, 0x23, 0xCA };
    // DX12
    vars.re2WW_11026357 = new byte[32] { 0x6C, 0xAA, 0xA8, 0x15, 0xBF, 0x9E, 0x95, 0xF8, 0xA8, 0x41, 0xBC, 0x81, 0xFD, 0xF2, 0x9F, 0xEC, 0x55, 0xE8, 0x36, 0xC8, 0x7B, 0xAB, 0x8A, 0x76, 0xD5, 0x5C, 0x69, 0xBE, 0xF9, 0xAD, 0xA9, 0x41 };

    // Japanese - added censoring
    // DX11
    vars.re2JP_11055259 = new byte[32] { 0x42, 0x6A, 0x81, 0xD0, 0x16, 0x22, 0x2D, 0xB7, 0x0F, 0x13, 0xB6, 0x1B, 0x31, 0x10, 0xF9, 0x4C, 0x5E, 0xCA, 0x2A, 0xD3, 0x19, 0x48, 0xBE, 0x82, 0xAF, 0xFC, 0x82, 0x24, 0x10, 0x69, 0xC0, 0x5F };
    // DX12
    vars.re2JP_11636615 = new byte[32] { 0x81, 0x2E, 0x11, 0xDA, 0xFE, 0xD8, 0x5C, 0x96, 0x04, 0x6E, 0x52, 0x26, 0xAE, 0x98, 0x4B, 0xBE, 0xE6, 0x20, 0x3D, 0x7A, 0x18, 0x5A, 0x5F, 0xF4, 0xBA, 0x1B, 0xD3, 0x1E, 0xE4, 0x2F, 0x96, 0xD7 };

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
        print("[Debug " + timer.CurrentTime.GameTime.ToString() + "]: " + text);
        if (vars.logToFile)
            SaveLogs(vars.logPath, text);
    };
    vars.Log = DebugOutput;

    Action<string> ClearLogs = (filePath) => {
        if (vars.logToFile)
        {
            vars.Log("Clearing Logs");
            if (File.Exists(filePath))
                File.WriteAllLines(filePath, new string[0]);
        }
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

    vars.ItemID = new Dictionary<int,string> {
        {0x1F, "detonator"},
        {0x22, "emptyDetonator"},
        {0x4D, "storageKey"},
        {0x4F, "mechanicHandle"},
        {0x50, "squareCrank"},
        {0x51, "unicorn"},
        {0x52, "spade"},
        {0x53, "parkingcard"},
        {0x54, "weaponcard"},
        {0x56, "valve"},
        {0x57, "starsbadge"},
        {0x58, "scepter"},
        {0x5A, "jewel"},
        {0x5B, "jewelbox"},
        {0x5D, "bishop"},
        {0x5E, "rook"},
        {0x5F, "king"},
        {0x62, "block"},
        {0x72, "redbook"},
        {0x73, "arm"},
        {0x76, "lion"},
        {0x77, "diamond"},
        {0x78, "carkey"},
        {0x7C, "maiden"},
        {0x81, "smallgear"},
        {0x82, "largegear"},
        {0x83, "courtyardkey"},
        {0x84, "knight"},
        {0x86, "queen"},
        {0x87, "partA"},
        {0x88, "partB"},
        {0x9F, "orphanageKey"},
        {0xA0, "club"},
        {0xA9, "heart"},
        {0xB0, "tbar"},
        {0xB3, "dispenseEmpty"},
        {0xB4, "dispenseSolution"},
        {0xB5, "herbicide"},
        {0xB7, "jointPlug"},
        {0xBB, "chipAdmin"},
        {0xBD, "modulator"},
        {0xC2, "sewerKey"},
        {0xC3, "generalChipAda"},
        {0xC4, "staffChip"},
        {0xC5, "seniorChip"},
        {0xC8, "generalChipMain"},
        {0xC9, "staffChip"},
        {0xCA, "seniorChip"},
        {0xF0, "fuse1"},
        {0xF1, "fuse2"},
        {0xF3, "scissors"},
        {0xF4, "boltCutters"},
    };

    vars.WeaponID = new Dictionary<int,string> {
        {0x0B, "shotgun"},
        {0x2A, "gL"},
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
    initSettingGroupOption("generalChipAda", false, "Guest (Ada)", "wristgroup", "");
    initSettingGroupOption("generalChipMain", false, "Guest (Leon or Claire)", "wristgroup", "");
    initSettingGroupOption("staffChip", false, "General Staff", "wristgroup", "");
    initSettingGroupOption("seniorChip", false, "Senior Staff", "wristgroup", "");
    initSettingGroupOption("chipAdmin", false, "Admin (Claire Only)", "wristgroup", "");

    initSettingGroup("eventgroup", true, "Events", "Events to split when first picked up.");
    initSettingGroupOption("reachedRPD", false, "Reached the RPD", "eventgroup", "");
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
    initSettingGroupOption("endA", false, "End (Scenario A)", "eventgroup", "");
    initSettingGroupOption("endB", false, "End (Scenario B)", "eventgroup", "");

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
    
    initSettingGroup("deprecate", true, "Deprecated", "Deprecated items or events to split when first picked up.");
    initSettingGroupOption("redbook", false, "Red Book", "deprecate", "");
    initSettingGroupOption("arm", false, "Statue's Left Arm", "deprecate", "");
    initSettingGroupOption("scepter", false, "Scepter", "deprecate", "");
    initSettingGroupOption("jewel", false, "Red Jewel", "deprecate", "");
    initSettingGroupOption("jewelbox", false, "Bejewled Box", "deprecate", "");
    initSettingGroupOption("starsbadge", false, "S.T.A.R.S Badge", "deprecate", "");
    initSettingGroupOption("gL", false, "Grenade Launcher", "deprecate", "");
    initSettingGroupOption("shotgun", false, "Shotgun", "deprecate", "");
    initSettingGroupOption("adaLegacyStart", false, "Legacy Ada Start (Ladder)", "deprecate", "");
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
        UpdateVersion("World Public RT 2023", 0x91A6DC0);
    else if (Enumerable.SequenceEqual(checksum, vars.re2WW_11055033))
        UpdateVersion("World DX11 2023", 0x070B23A8);
    else if (Enumerable.SequenceEqual(checksum, vars.re2JP_11055259))
        UpdateVersion("Japanese DX11 2023", 0x70B23A8);
    else if (Enumerable.SequenceEqual(checksum, vars.re2JP_11636615))
        UpdateVersion("Japanese DX12 2023", 0x91A6DC0);
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
        vars.Splits.Clear();
}

split
{
    Func<string, bool> LogAndSplit = (splitId) => {
        vars.Splits.Add(splitId);
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
                    if (!vars.Splits.Contains("shotgun"))
                        return LogAndSplit("shotgun");
                    break;
                }
                case 0x0000002A:
                {
                    if (!vars.Splits.Contains("gL"))
                        return LogAndSplit("gL");
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
                    if (!vars.Splits.Contains("detonator"))
                        return LogAndSplit("detonator");
                    break;
                }
                case 0x00000022:
                {
                    if (!vars.Splits.Contains("emptyDetonator"))
                        return LogAndSplit("emptyDetonator");
                    break;
                }
                case 0x0000004D:
                {
                    if (!vars.Splits.Contains("storageKey"))
                        return LogAndSplit("storageKey");
                    break;
                }
                case 0x0000004F:
                {
                    if (!vars.Splits.Contains("mechanicHandle"))
                        return LogAndSplit("mechanicHandle");
                    break;
                }
                case 0x00000050:
                {
                    if (!vars.Splits.Contains("squareCrank"))
                        return LogAndSplit("squareCrank");
                    break;
                }
                case 0x00000051:
                {
                    if (!vars.Splits.Contains("unicorn"))
                        return LogAndSplit("unicorn");
                    break;
                }
                case 0x00000076:
                {
                    if (!vars.Splits.Contains("lion"))
                        return LogAndSplit("lion");
                    break;
                }
                case 0x0000007C:
                {
                    if (!vars.Splits.Contains("maiden"))
                        return LogAndSplit("maiden");
                    break;
                }
                case 0x00000052:
                {
                    if (!vars.Splits.Contains("spade"))
                        return LogAndSplit("spade");
                    break;
                }
                case 0x00000053:
                {
                    if (!vars.Splits.Contains("parkingcard"))
                        return LogAndSplit("parkingcard");
                    break;
                }
                case 0x00000054:
                {
                    if (!vars.Splits.Contains("weaponcard"))
                        return LogAndSplit("weaponcard");
                    break;
                }
                case 0x00000056:
                {
                    if (!vars.Splits.Contains("valve"))
                        return LogAndSplit("valve");
                    break;
                }
                case 0x00000057:
                {
                    if (!vars.Splits.Contains("starsbadge"))
                        return LogAndSplit("starsbadge");
                    break;
                }
                case 0x00000058:
                {
                    if (!vars.Splits.Contains("scepter"))
                        return LogAndSplit("scepter");
                    break;
                }
                case 0x0000005A:
                {
                    if (!vars.Splits.Contains("jewel"))
                        return LogAndSplit("jewel");
                    break;
                }
                case 0x0000005B:
                {
                    if (!vars.Splits.Contains("jewelbox"))
                        return LogAndSplit("jewelbox");
                    break;
                }
                case 0x0000005E:
                {
                    if (!vars.Splits.Contains("rook"))
                        return LogAndSplit("rook");
                    break;
                }
                case 0x0000005F:
                {
                    if (!vars.Splits.Contains("king"))
                        return LogAndSplit("king");
                    break;
                }
                case 0x00000084:
                {
                    if (!vars.Splits.Contains("knight"))
                        return LogAndSplit("knight");
                    break;
                }
                case 0x00000086:
                {
                    if (!vars.Splits.Contains("queen"))
                        return LogAndSplit("queen");
                    break;
                }
                case 0x0000005D:
                {
                    if (!vars.Splits.Contains("bishop"))
                        return LogAndSplit("bishop");
                    break;
                }
                case 0x00000062:
                {
                    if (!vars.Splits.Contains("block"))
                        return LogAndSplit("block");
                    break;
                }
                case 0x00000072:
                {
                    if (!vars.Splits.Contains("redbook"))
                        return LogAndSplit("redbook");
                    break;
                }
                case 0x00000073:
                {
                    if (!vars.Splits.Contains("arm"))
                        return LogAndSplit("arm");
                    break;
                }
                case 0x00000077:
                {
                    if (!vars.Splits.Contains("diamond"))
                        return LogAndSplit("diamond");
                    break;
                }
                case 0x00000078:
                {
                    if (!vars.Splits.Contains("carkey"))
                        return LogAndSplit("carkey");
                    break;
                }
                case 0x00000087:
                {
                    if (!vars.Splits.Contains("partA"))
                        return LogAndSplit("partA");
                    break;
                }
                case 0x00000088:
                {
                    if (!vars.Splits.Contains("partB"))
                        return LogAndSplit("partB");
                    break;
                }
                case 0x00000081:
                {
                    if (!vars.Splits.Contains("smallgear"))
                        return LogAndSplit("smallgear");
                    break;
                }
                case 0x00000082:
                {
                    if (!vars.Splits.Contains("largegear"))
                        return LogAndSplit("largegear");
                    break;
                }
                case 0x00000083:
                {
                    if (!vars.Splits.Contains("courtyardkey"))
                        return LogAndSplit("courtyardkey");
                    break;
                }
                case 0x0000009F:
                {
                    if (!vars.Splits.Contains("orphanageKey"))
                        return LogAndSplit("orphanageKey");
                    break;
                }
                case 0x000000A0:
                {
                    if (!vars.Splits.Contains("club"))
                        return LogAndSplit("club");
                    break;
                }
                case 0x000000A9:
                {
                    if (!vars.Splits.Contains("heart"))
                        return LogAndSplit("heart");
                    break;
                }
                case 0x000000B0:
                {
                    if (!vars.Splits.Contains("tbar"))
                        return LogAndSplit("tbar");
                    break;
                }
                case 0x000000B3:
                {
                    if (!vars.Splits.Contains("dispenseEmpty"))
                        return LogAndSplit("dispenseEmpty");
                    break;
                }
                case 0x000000B4:
                {
                    if (!vars.Splits.Contains("dispenseSolution"))
                        return LogAndSplit("dispenseSolution"); 
                    break;
                }
                case 0x000000B5:
                {
                    if (!vars.Splits.Contains("herbicide"))
                        return LogAndSplit("herbicide");
                    break;
                }
                case 0x000000B7:
                {
                    if (!vars.Splits.Contains("jointPlug"))
                        return LogAndSplit("jointPlug");
                    break;
                }
                case 0x000000BB:
                {
                    if (!vars.Splits.Contains("chipAdmin"))
                        return LogAndSplit("chipAdmin");
                    break;
                }
                case 0x000000BD:
                {
                    if (!vars.Splits.Contains("modulator"))
                        return LogAndSplit("modulator");
                    break;
                }
                case 0x000000C2:
                {
                    if (!vars.Splits.Contains("sewerKey"))
                        return LogAndSplit("sewerKey");
                    break;
                }
                case 0x000000C3:
                case 0x000000C8:
                {
                    if (!vars.Splits.Contains("generalChipAda") && current.survivorType == 2)
                        return LogAndSplit("generalChipAda");
                    if (!vars.Splits.Contains("generalChipMain") && (current.survivorType == 0 || current.survivorType == 1))
                        return LogAndSplit("generalChipMain");
                    break;
                }
                case 0x000000C4:
                case 0x000000C9:
                {
                    if (!vars.Splits.Contains("staffChip"))
                        return LogAndSplit("staffChip");
                    break;
                }
                case 0x000000C5:
                case 0x000000CA:
                {
                    if (!vars.Splits.Contains("seniorChip"))
                        return LogAndSplit("seniorChip");
                    break;
                }
                case 0x000000F0:
                {
                    if (!vars.Splits.Contains("fuse1"))
                        return LogAndSplit("fuse1");
                    break;
                }
                case 0x000000F1:
                {
                    if (!vars.Splits.Contains("fuse2"))
                        return LogAndSplit("fuse2");
                    break;
                }
                case 0x000000F3:
                {
                    if (!vars.Splits.Contains("scissors"))
                        return LogAndSplit("scissors");
                    break;
                }
                case 0x000000F4:
                    if (!vars.Splits.Contains("boltCutters"))
                        return LogAndSplit("boltCutters");
                    break;
                default:
                {
                    break; // No work to do.
                }
            }
        }
    }

    // G2 Start
    if (current.map == 335 && current.bossHP == 24000 && !vars.Splits.Contains("g2Start"))
        return LogAndSplit("g2Start");

    // G2 End
    if (current.map == 335 && !(current.bossHP >= 1) && vars.Splits.Contains("g2Start") && !vars.Splits.Contains("g2"))
        return LogAndSplit("g2");

    // G4 Start
    if (current.map == 421 && current.bossHP >= 3000000 && !vars.Splits.Contains("g4Start"))
        return LogAndSplit("g4Start");

    // G4 End and Alt Ending
    bool isG4Ending = current.isCutscene == 1 && current.map == 421 && vars.Splits.Contains("g4Start") && !vars.Splits.Contains("endA");
    bool isTyrantEnding = current.isCutscene == 1 && current.map == 422 && !vars.Splits.Contains("endA");
    if (isG4Ending || isTyrantEnding)
        return LogAndSplit("endA");

    // True Ending - G5
    //bool isSTyrantEnding = old.map == 422 && current.map == 422 && current.isCutscene == 1 && vars.Splits.Contains("end") && !vars.Splits.Contains("endB");
    bool isG5Ending = current.map == 421 && old.map == 423 && current.isCutscene == 1 && (vars.Splits.Contains("onTrain") || vars.Splits.Contains("endA")) && !vars.Splits.Contains("endB");
    if (isG5Ending)
        return LogAndSplit("endB");

    // Map splits
    if (current.map != old.map)
    {
        if (current.map == 312 && current.survivorType == 2 && vars.Splits.Contains("adaStart") && !vars.Splits.Contains("adaLegacyStart"))
            return LogAndSplit("adaLegacyStart");

        if ((current.map == 317 || (current.map == 377 && old.map == 407)) && !vars.Splits.Contains("reachedSewers"))
            return LogAndSplit("reachedSewers");

        if ((current.map == 112 || current.map == 261) && !vars.Splits.Contains("reachedRPD"))
        {
            if (current.scenerioTypeValue == 2 || current.scenerioTypeValue == 3)
                if (!vars.Splits.Contains("courtyardkey")) return false;
            return LogAndSplit("reachedRPD");
        }

        if (current.map == 277 && !vars.Splits.Contains("reachedGarage"))
            return LogAndSplit("reachedGarage");

        if (current.map == 350 && !vars.Splits.Contains("reachedSecretRoom"))
            return LogAndSplit("reachedSecretRoom");

        if (old.map == 277 && current.map == 351 && !vars.Splits.Contains("exitedGarage"))
            return LogAndSplit("exitedGarage");

        if ((current.map == 338 || (old.map == 0 && current.map == 335)) && !vars.Splits.Contains("rescue"))
            return LogAndSplit("rescue");

        if (current.map == 423 && !vars.Splits.Contains("onTrain"))
            vars.Splits.Add("onTrain");
        
        if (current.map == 0 && old.map == 330 && !vars.Splits.Contains("adaEnd"))
            return LogAndSplit("adaEnd");
    }

    // Character Swap splits
    if (current.map == 310 && current.survivorType == 2 && !vars.Splits.Contains("adaStart"))
        return LogAndSplit("adaStart");

    if (current.map == 363 && current.survivorType == 3 && !vars.Splits.Contains("sherryStart"))
        return LogAndSplit("sherryStart");

    // Cutscene Playing
    if (current.isCutscene == 1)
    {
        if (current.map == 353 && !vars.Splits.Contains("reachedG1") && current.bossCHP == 5000 && current.bossHP == 5000)
            vars.Splits.Add("reachedG1");
        if (current.map == 419 && !vars.Splits.Contains("reachedG3") && current.bossCHP == 15000 && current.bossHP == 15000)
            vars.Splits.Add("reachedG3");
    }

    // Cutscene Skipped
    if (current.isCutscene == 0 && old.isCutscene == 1 && current.isPaused == 0)
    {
        if (current.map == 353 && vars.Splits.Contains("reachedG1") && !vars.Splits.Contains("g1Start") && current.bossCHP == 5000 && current.bossHP == 5000)
            return LogAndSplit("g1Start");
        if (current.map == 419 && vars.Splits.Contains("reachedG3") && !vars.Splits.Contains("g3Start") && current.bossCHP == 15000 && current.bossHP == 15000)
            return LogAndSplit("g3Start");
    }
    else if (current.isCutscene == 1 && old.isCutscene == 0)
    {
        if (current.map == 353 && current.bossCHP == 0 && current.bossHP == 5000 && vars.Splits.Contains("g1Start") && !vars.Splits.Contains("g1"))
            return LogAndSplit("g1");
        if (current.map == 419 && current.bossCHP == 0 && current.bossHP == 15000 && vars.Splits.Contains("g3Start") && !vars.Splits.Contains("g3"))
            return LogAndSplit("g3");
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