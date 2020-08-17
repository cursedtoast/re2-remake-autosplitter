// Resident Evil 2 Remake Autosplitter
// By CursedToast 1/28/2019, edited by Ero 8/17/2020
// Last updated 8/17/2020

state("re2", "12/18 Update") {
  int map            : 0x7097404;
  int weaponSlot1    : 0x70A17E0, 0x50, 0x98, 0x10, 0x20, 0x18, 0x10, 0x14;
  int bossHP         : 0x709D120, 0x248, 0x48, 0x4B8;
  int gamePauseState : 0x709E120, 0x50;
  long active        : 0x709E120, 0x60, 0x18;
  long cutscene      : 0x709E120, 0x60, 0x20;
  long paused        : 0x709E120, 0x60, 0x30;
}

state("re2", "4/23 Update") {
  int map            : 0x48FC170, 0x1DC;
  int weaponSlot1    : 0x709A630, 0x50, 0x98, 0x10, 0x20, 0x18, 0x10, 0x14;
  int bossHP         : 0x70926F0, 0x248, 0x48, 0x4B8;
  int gamePauseState : 0x70936F0, 0x50;
  long active        : 0x70936F0, 0x60, 0x18;
  long cutscene      : 0x70936F0, 0x60, 0x20;
  long paused        : 0x70936F0, 0x60, 0x30;
}

state("re2", "2/20 Update") {
  int map            : 0x4959168, 0x1DC;
  int weaponSlot1    : 0x70B0840, 0x50, 0x98, 0x10, 0x20, 0x18, 0x10, 0x14;
  int bossHP         : 0x70AF910, 0x248, 0x48, 0x4B8;
  int gamePauseState : 0x70B0910, 0x50;
  long active        : 0x70B0910, 0x60, 0x18;
  long cutscene      : 0x70B0910, 0x60, 0x20;
  long paused        : 0x70B0910, 0x60, 0x30;
}

state("re2", "2/15 Update") {
  int map            : 0x48D4370, 0x1EC;
  int weaponSlot1    : 0x70AFE10, 0x50, 0x98, 0x10, 0x20, 0x18, 0x10, 0x14;
  int bossHP         : 0x70AEEE8, 0x248, 0x48, 0x4B8;
  int gamePauseState : 0x70AFEE8, 0x50;
  long active        : 0x70AFEE8, 0x60, 0x18;
  long cutscene      : 0x70AFEE8, 0x60, 0x20;
  long paused        : 0x70AFEE8, 0x60, 0x30;
}

/*state("re2", "1.0") {
  int map            : 0x488A730, 0x1EC;
  int weaponSlot1    : 0x0ACA88, 0x50, 0x98, 0x10, 0x20, 0x18, 0x10, 0x14;
  int itemSlot3      : 0x70ACA88, 0x50, 0x98, 0x10, 0x30, 0x18, 0x10, 0x10;
  int bossHP         : 0x70ABAE0, 0x248, 0x48, 0x4B8;
  int gamePauseState : 0x70ACAE0, 0x50;
  long active        : 0x70ACAE0, 0x60, 0x18;
  long cutscene      : 0x70ACAE0, 0x60, 0x20;
  int menu           : 0x70ACAE0, 0x60, 0x28;
  long paused        : 0x70ACAE0, 0x60, 0x30;
}*/

startup {
  settings.Add("keyGroup", true, "Keys");
    settings.Add("item77", false, "Storage Key", "keyGroup");
    settings.Add("item131", false, "Courtyard Key", "keyGroup");
    settings.Add("item82", false, "Spade Key", "keyGroup");
    settings.Add("item119", false, "Diamond Key", "keyGroup");
    settings.Add("item160", false, "Club Key", "keyGroup");
    settings.Add("item169", false, "Heart Key", "keyGroup");
    settings.Add("item84", false, "Locker Key Card", "keyGroup");
    settings.Add("item159", false, "Orphanage Key", "keyGroup");
    settings.Add("item83", false, "Parking Garage Key Card", "keyGroup");
    settings.Add("item194", false, "Sewer Key", "keyGroup");
    //settings.Add("item120", false, "Car Keys", "keyGroup");
  
  settings.Add("medallionGroup", true, "Medallions");
    settings.Add("item81", false, "Unicorn Medallion", "medallionGroup");
    settings.Add("item124", false, "Maiden Medallion", "medallionGroup");
    settings.Add("item118", false, "Lion Medallion", "medallionGroup");
  
  
  settings.Add("fuseGroup", true, "Fuses");
    settings.Add("item240", false, "Fuse (Main Hall)", "fuseGroup");
    settings.Add("item241", false, "Fuse (Break Room Hallway)", "fuseGroup");
  
  settings.Add("geargroup", true, "Gears");
    settings.Add("item130", false, "Large Gear", "geargroup");
    settings.Add("item129", false, "Small Gear", "geargroup");
    
  settings.Add("electrogroup", true, "Electronic Parts");
    settings.Add("item135", false, "Boxed Electronic Part A", "electrogroup");
    settings.Add("item136", false, "Boxed Electronic Part B", "electrogroup");
  
  settings.Add("pluggroup", true, "Plugs");
    settings.Add("item94", false, "Rook Plug", "pluggroup");
    settings.Add("item134", false, "Queen Plug", "pluggroup");
    settings.Add("item95", false, "King Plug", "pluggroup");
    settings.Add("item132", false, "Knight Plug", "pluggroup");
    settings.Add("item93", false, "Bishop Plug", "pluggroup");
  
  settings.Add("dispensergroups", true, "Dispensers");
    settings.Add("item179", false, "Dispersal Cartridge (Empty)", "dispensergroups");
    settings.Add("item180", false, "Dispersal Cartridge (Solution)", "dispensergroups");
    settings.Add("item181", false, "Dispersal Cartridge (Herbicide)", "dispensergroups");
  
  
  settings.Add("wristgroup", true, "Wristbands");
    settings.Add("item195or200", false, "Guest", "wristgroup");
    settings.Add("item196or201", false, "General Staff", "wristgroup");
    settings.Add("item197or202", false, "Senior Staff", "wristgroup");
    settings.Add("item187", false, "Admin (Claire Only)", "wristgroup");
  
  
  settings.Add("eventGroup", true, "Events");
    settings.Add("reachedRPD", false, "Reached the RPD", "eventGroup");
    settings.Add("map350", false, "Reached Secret Room", "eventGroup");
    settings.Add("map277", false, "Reached Parking Garage", "eventGroup");
    settings.Add("map277 to map351", false, "Back on the Streets (leave parking garage)", "eventGroup");
    settings.Add("reachedSewers", false, "Reached the Sewers", "eventGroup");
    settings.Add("adaStart", false, "Ada Start", "eventGroup");
    settings.Add("map330 to map0", false, "Ada End", "eventGroup");
    settings.Add("rescueCompleted", false, "Rescued Sherry/Ada", "eventGroup");
    settings.Add("g3", false, "G3 Battle Complete", "eventGroup");
    settings.Add("end", false, "End (Scenario A/ First final boss of B)", "eventGroup");
    settings.Add("trueEnd", false, "True End", "eventGroup");
  
  
  settings.Add("miscgroup", true, "Misc.");
    settings.Add("item244", false, "Bolt Cutters", "miscgroup");
    settings.Add("item34", false, "Detonator (No Battery)", "miscgroup");
    settings.Add("item31", false, "Detonator", "miscgroup");
    settings.Add("item79", false, "Mechanic Handle", "miscgroup");
    settings.Add("item80", false, "Square Crank", "miscgroup");
    settings.Add("item98", false, "Picture Block", "miscgroup");
    settings.Add("item243", false, "Scissors", "miscgroup");
    settings.Add("item86", false, "Valve Handle", "miscgroup");
    settings.Add("item176", false, "T-Bar Valve Handle", "miscgroup");
    settings.Add("item189", false, "Signal Modulator", "miscgroup");
    settings.Add("item183", false, "Joint Plug", "miscgroup");
  
  settings.Add("deprecate", true, "Deprecated");
    settings.Add("item114", false, "Red Book", "deprecate");
    settings.Add("item115", false, "Statue's Left Arm", "deprecate");
    settings.Add("item88", false, "Scepter", "deprecate");
    settings.Add("item90", false, "Red Jewel", "deprecate");
    settings.Add("item91", false, "Bejewled Box", "deprecate");
    settings.Add("item87", false, "S.T.A.R.S Badge", "deprecate");
    settings.Add("item42", false, "Grenade Launcher", "deprecate");
    settings.Add("item11", false, "Shotgun", "deprecate");
}

init {
  vars.inventoryPtr = IntPtr.Zero;
  switch (modules.First().ModuleMemorySize) {
    case (379510784):
      version = "2/20 Update";
      vars.inventoryPtr = 0x70B0840;
      break;
    case (374067200):
      version = "2/15 Update";
      vars.inventoryPtr = 0x70AFE10;
      break;
    case (124985344):
      version = "12/18 Update";
      vars.inventoryPtr = 0x70A17E0;
      break;
    default:
      version = "4/23 Update";
      vars.inventoryPtr = 0x709A630;
      break;
    /*default:
      version = "1.0";
      vars.inventoryPtr = 0x70ACA88;
      break;
    */
  }

  vars.onTrain = 0;
  vars.itemWatcher = new MemoryWatcherList();
  vars.completedSplits = new HashSet<string>();

  for (int i = 0; i <= 20; i++) {
    var itemOffset = 0x20 + i * 0x8;
    vars.itemWatcher.Add(new MemoryWatcher<int>(new DeepPointer(vars.inventoryPtr, 0x50, 0x98, 0x10, itemOffset, 0x18, 0x10, 0x10)) { Name = "item" + i.ToString() });
  }

  for (int i = 0; i <= 20; i++) {
    var itemOffset = 0x20 + i * 0x8;
    vars.itemWatcher.Add(new MemoryWatcher<int>(new DeepPointer(vars.inventoryPtr, 0x50, 0x98, 0x10, itemOffset, 0x18, 0x10, 0x14)) { Name = "weapon" + i.ToString() });
  }
}

start {
  if (
    current.gamePauseState == 1 &&
    (current.map == 219 || current.map == 347) &&
    (current.weaponSlot1 == 1 || current.weaponSlot1 == 9)
    ) {
      vars.completedSplits.Clear();
      return true;
  }
}

split {
  // Item Splits
  vars.itemWatcher.UpdateAll(game);
  for (int i = 0; i <= 20; i++) {
    var itemID = "item" + i.ToString();
    var weapID = "weapon" + i.ToString();

    if (vars.itemWatcher[itemID].Changed) {
      if (
        settings["item" + vars.itemWatcher[itemID].Current.ToString()] &&
        !(vars.completedSplits.Contains("item" + vars.itemWatcher[itemID].Current.ToString()))
        ) {
          vars.completedSplits.Add("item" + vars.itemWatcher[itemID].Current.ToString());
          return true;
      } else if (
        settings["item" + vars.itemWatcher[itemID].Current.ToString() + "or" + (vars.itemWatcher[itemID].Current + 5).ToString()] &&
        !(vars.completedSplits.Contains("item" + vars.itemWatcher[itemID].Current.ToString() + "or" + (vars.itemWatcher[itemID].Current + 5).ToString()))
        ) {
          vars.completedSplits.Add("item" + vars.itemWatcher[itemID].Current.ToString() + "or" + (vars.itemWatcher[itemID].Current + 5).ToString());
          return true;
      } else if (
        settings["item" + (vars.itemWatcher[itemID].Current - 5).ToString() + "or" + vars.itemWatcher[itemID].Current.ToString()] &&
        !(vars.completedSplits.Contains("item" + (vars.itemWatcher[itemID].Current - 5).ToString() + "or" + vars.itemWatcher[itemID].Current.ToString()))
        ) {
          vars.completedSplits.Add("item" + (vars.itemWatcher[itemID].Current - 5).ToString() + "or" + vars.itemWatcher[itemID].Current.ToString());
          return true;
        }
    } else if (
      vars.itemWatcher[weapID].Changed &&
      settings["item" + vars.itemWatcher[weapID].Current.ToString()] &&
      !(vars.completedSplits.Contains("weap" + vars.itemWatcher[weapID].Current.ToString()))
      ) {
        vars.completedSplits.Add("weap" + vars.itemWatcher[weapID].Current.ToString());
        return true;
    }
  }

  // Map Splits
  if (current.map != old.map) {
    if (current.map == 423 && vars.onTrain == 0) {
      vars.onTrain = 1;
    }

    if (
      settings["map" + current.map.ToString()] &&
      !(vars.completedSplits.Contains("map" + current.map.ToString()))
      ) {
        vars.completedSplits.Add("map" + current.map.ToString());
        return true;
    } else if (
      settings["map" + old.map.ToString() + " to map" + current.map.ToString()] &&
      !(vars.completedSplits.Contains(old.map.ToString() + "toMap" + current.map.ToString()))
      ) {
        vars.completedSplits.Add(old.map.ToString() + "toMap" + current.map.ToString());
        return true;
    } else if (
      settings["adaStart"] && current.map == 310 && current.weaponSlot1 == 8 &&
      !(vars.completedSplits.Contains("adaStart"))
      ) {
        vars.completedSplits.Add("adaStart");
        return true;
    }

    if (
      settings["reachedSewers"] && (current.map == 317 || current.map == 377 && old.map == 407) &&
      !(vars.completedSplits.Contains("reachedSewers"))
      ) {
        vars.completedSplits.Add("reachedSewers");
        return true;
    } else if (
      settings["reachedRPD"] && (current.map == 112 && old.map == 219 || current.map == 261) &&
      !(vars.completedSplits.Contains("reachedRPD"))
      ) {
        vars.completedSplits.Add("reachedRPD");
        return true;
    } else if (
      settings["rescueCompleted"] && (current.map == 338  || old.map == 0 && current.map == 335) &&
      !(vars.completedSplits.Contains("rescueCompleted"))
      ) {
        vars.completedSplits.Add("rescueCompleted");
        return true;
    }
  }

  // Ending Splits (can only ever occur once, do not require a check)
  return
    settings["g3"] && current.map == 419 && current.bossHP < 1 ||
    settings["end"] && (current.map == 421 && old.bossHP >= 50000 && current.bossHP < 50000 || current.map == 422 && current.gamePauseState == 257) ||
    settings["trueEnd"] && vars.onTrain == 1 && (current.map == 422 && current.gamePauseState == 257 || current.map == 421 && old.map == 423);
}

gameTime {
  return TimeSpan.FromSeconds((current.active - current.cutscene - current.paused) / 1000000.0);
}

isLoading {
  return true;
  //return current.gamePauseState != 1 && current.gamePauseState != 65537;
}
