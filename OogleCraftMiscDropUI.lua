OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

_G.selectedItems = _G.selectedItems or {}


local wm = WINDOW_MANAGER  --just an upvalue

local function createDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraft" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
    dropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, xOffset + 7, yOffset)
    dropdownContainer:SetDimensions(125, 50)
    dropdownContainer:GetNamedChild("Dropdown"):SetWidth(dropWide)

    local dropdown = dropdownContainer.dropdown
    dropdown:SetSelectedItem(choices[1])

    dropdown:SetSortsItems(false)

    local function OnItemSelect(_, choiceText, choice)
    
        -- Check if the table for the current dropdown frame exists, if not, create it
        _G.selectedItems[oogleCraftDropdownFrameName] = _G.selectedItems[oogleCraftDropdownFrameName] or {}
        
        -- Check if the selected item does not already exists for the current dropdown frame
        for i, item in ipairs(_G.selectedItems[oogleCraftDropdownFrameName]) do
            if item ~= choiceText or item == choiceText then
                -- Remove the existing item from the table
                table.remove(_G.selectedItems[oogleCraftDropdownFrameName], i)
                break -- Exit the loop once the item is removed
            end
        end
        
        -- Store the selected item in the table corresponding to the current dropdown frame
        table.insert(_G.selectedItems[oogleCraftDropdownFrameName], choiceText)
        end
    
        for i=1,#choices do
            local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect) -- [, OnItemSelect]
            dropdown:AddItem(entry)
        end

    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect) -- [, OnItemSelect]
        dropdown:AddItem(entry)
    end
end

local buttonWM = WINDOW_MANAGER

local function createButton(oogleCraftButtonFrameName, buttonxOffset, buttonyOffset, buttonWide)
    local buttonContainer = wm:CreateControlFromVirtual("OogleCraft" .. oogleCraftButtonFrameName .. "Button", OogleCraftMainPanel, "AddToQueueButton")
    buttonContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, buttonxOffset + 7, buttonyOffset)
    buttonContainer:SetDimensions(125, 50)
    buttonContainer:GetNamedChild("Button"):SetWidth(buttonWide)

    buttonContainer:GetNamedChild("Button"):SetHandler("OnClicked", function()
        OogleCraft.addToQueue(oogleCraftButtonFrameName)
    end)
end

function OogleCraft.addToQueue(oogleCraftButtonFrameName)
    OogleCraft.addToQueueFunctionality(oogleCraftButtonFrameName)
end



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Dropdowns ----------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftLvlChoices = {
    "[Level]",
    "Research",
    "10",
    "20",
    "30",
    "40",
    "50",
    "CP 10",
    "CP 20",
    "CP 30",
    "CP 40",
    "CP 50",
    "CP 60",
    "CP 70",
    "CP 80",
    "CP 90",
    "CP 100",
    "CP 110",
    "CP 120",
    "CP 130",
    "CP 140",
    "CP 150",
    "CP 160"
}

local OogleCraftSet1ListChoices = {
    "[Set #1]",
    "Adept Rider",
    "Aetherial Ascension",
    "Alessia's Bulwark",
    "Ancient Dragonguard",
    "Armor Master",
    "Armor of the Seducer",
    "Ashen Grip",
    "Assassin's Guile",
    "Chimera's Rebuke",
    "Claw of the Forest Wraith",
    "Clever Alchemist",
    "Coldharbour's Favorite",
    "Critical Riposte",
    "Daedric Trickery",
    "Daring Corsair",
    "Dauntless Combatant",
    "Deadlands Demolisher",
    "Deadth's Wind",
    "Diamond's Victory",
    "Dragon's Appetite",
    "Druid's Braid",
    "Eternal Hunt",
    "Eyes of Mara",
    "Fortified Brass",
    "Grave-Stake Collector",
    "Heartland Conqueror",
    "Hist Bark",
    "Hist Whisperer",
    "Hunding's Rage",
    "Innate Axiom",
    "Iron Flask",
    "Kagrenac's Hope",
    "Kvatch Gladiator",
    "Law of Julianos",
    "Legacy of Karth",
    "Magnus' Gift",
    "Mechanical Acuity",
    "Might of the Lost Legion",
    "Morkuldin",
    "Naga Shaman",
    "New Moon Acolyte",
    "Night Mother's Gaze",
    "Night's Silence",
    "Noble's Conquest",
    "Nocturnal's Favor",
    "Oblivion's Foe",
    "Old Growth Brewer",
    "Order's Wrath",
    "Orgnum's Scales",
    "Pelinal's Wrath",
    "Red Eagle's Fury",
    "Redistributor",
    "Seeker Synthesis",
    "Senche-Raht's Grit",
    "Serpent's Disdain",
    "Shacklbreaker",
    "Shalidor's Curse",
    "Shattered Fate",
    "Sload's Semblance",
    "Song of Lamae",
    "Specter's Eye",
    "Spell Parasite",
    "Stuhn's Favor",
    "Tava's Favor",
    "Telvanni Efficiency",
    "Torug's Pact",
    "Trial by Fire",
    "Twice-Born Star",
    "Twilight's Embrace",
    "Unchained Aggressor",
    "Vampire's Kiss",
    "Varen's Legacy",
    "Vastarie's Tutelage",
    "Way of the Arena",
    "Whitestrake's Retribution",
    "Willow's Path",
    "Wretched Vitality"
}

local OogleCraftSet2ListChoices = {
    "[Set #2]",
    "Adept Rider",
    "Aetherial Ascension",
    "Alessia's Bulwark",
    "Ancient Dragonguard",
    "Armor Master",
    "Armor of the Seducer",
    "Ashen Grip",
    "Assassin's Guile",
    "Chimera's Rebuke",
    "Claw of the Forest Wraith",
    "Clever Alchemist",
    "Coldharbour's Favorite",
    "Critical Riposte",
    "Daedric Trickery",
    "Daring Corsair",
    "Dauntless Combatant",
    "Deadlands Demolisher",
    "Deadth's Wind",
    "Diamond's Victory",
    "Dragon's Appetite",
    "Druid's Braid",
    "Eternal Hunt",
    "Eyes of Mara",
    "Fortified Brass",
    "Grave-Stake Collector",
    "Heartland Conqueror",
    "Hist Bark",
    "Hist Whisperer",
    "Hunding's Rage",
    "Innate Axiom",
    "Iron Flask",
    "Kagrenac's Hope",
    "Kvatch Gladiator",
    "Law of Julianos",
    "Legacy of Karth",
    "Magnus' Gift",
    "Mechanical Acuity",
    "Might of the Lost Legion",
    "Morkuldin",
    "Naga Shaman",
    "New Moon Acolyte",
    "Night Mother's Gaze",
    "Night's Silence",
    "Noble's Conquest",
    "Nocturnal's Favor",
    "Oblivion's Foe",
    "Old Growth Brewer",
    "Order's Wrath",
    "Orgnum's Scales",
    "Pelinal's Wrath",
    "Red Eagle's Fury",
    "Redistributor",
    "Seeker Synthesis",
    "Senche-Raht's Grit",
    "Serpent's Disdain",
    "Shacklbreaker",
    "Shalidor's Curse",
    "Shattered Fate",
    "Sload's Semblance",
    "Song of Lamae",
    "Specter's Eye",
    "Spell Parasite",
    "Stuhn's Favor",
    "Tava's Favor",
    "Telvanni Efficiency",
    "Torug's Pact",
    "Trial by Fire",
    "Twice-Born Star",
    "Twilight's Embrace",
    "Unchained Aggressor",
    "Vampire's Kiss",
    "Varen's Legacy",
    "Vastarie's Tutelage",
    "Way of the Arena",
    "Whitestrake's Retribution",
    "Willow's Path",
    "Wretched Vitality"
}

local OogleCraftSet3ListChoices = {
    "[Set #3]",
    "Adept Rider",
    "Aetherial Ascension",
    "Alessia's Bulwark",
    "Ancient Dragonguard",
    "Armor Master",
    "Armor of the Seducer",
    "Ashen Grip",
    "Assassin's Guile",
    "Chimera's Rebuke",
    "Claw of the Forest Wraith",
    "Clever Alchemist",
    "Coldharbour's Favorite",
    "Critical Riposte",
    "Daedric Trickery",
    "Daring Corsair",
    "Dauntless Combatant",
    "Deadlands Demolisher",
    "Deadth's Wind",
    "Diamond's Victory",
    "Dragon's Appetite",
    "Druid's Braid",
    "Eternal Hunt",
    "Eyes of Mara",
    "Fortified Brass",
    "Grave-Stake Collector",
    "Heartland Conqueror",
    "Hist Bark",
    "Hist Whisperer",
    "Hunding's Rage",
    "Innate Axiom",
    "Iron Flask",
    "Kagrenac's Hope",
    "Kvatch Gladiator",
    "Law of Julianos",
    "Legacy of Karth",
    "Magnus' Gift",
    "Mechanical Acuity",
    "Might of the Lost Legion",
    "Morkuldin",
    "Naga Shaman",
    "New Moon Acolyte",
    "Night Mother's Gaze",
    "Night's Silence",
    "Noble's Conquest",
    "Nocturnal's Favor",
    "Oblivion's Foe",
    "Old Growth Brewer",
    "Order's Wrath",
    "Orgnum's Scales",
    "Pelinal's Wrath",
    "Red Eagle's Fury",
    "Redistributor",
    "Seeker Synthesis",
    "Senche-Raht's Grit",
    "Serpent's Disdain",
    "Shacklbreaker",
    "Shalidor's Curse",
    "Shattered Fate",
    "Sload's Semblance",
    "Song of Lamae",
    "Specter's Eye",
    "Spell Parasite",
    "Stuhn's Favor",
    "Tava's Favor",
    "Telvanni Efficiency",
    "Torug's Pact",
    "Trial by Fire",
    "Twice-Born Star",
    "Twilight's Embrace",
    "Unchained Aggressor",
    "Vampire's Kiss",
    "Varen's Legacy",
    "Vastarie's Tutelage",
    "Way of the Arena",
    "Whitestrake's Retribution",
    "Willow's Path",
    "Wretched Vitality"
}

local OogleCraftStyleListChoices = {
    "[Style]",
    "Abah's Watch",
    "Akaviri",
    "Aldmeri Dominion",
    "Ancestral Akaviri",
    "Ancestral Breton",
    "Ancestral High Elf",
    "Ancestral Nord",
    "Ancestral Orc",
    "Ancestral Reach",
    "Ancient Daedric",
    "Ancient Elf",
    "Ancient Orc",
    "Anequina",
    "Annihilarch's Chosen",
    "Apostle",
    "Argonian",
    "Arkthzand Armory",
    "Ascendant Order",
    "Ashlander",
    "Assassins League",
    "Barbaric",
    "Black Fin Legion",
    "Blackreach Vanguard",
    "Blessed Inheritor",
    "Bloodforge",
    "Breton",
    "Buoyant Armiger",
    "Celestial",
    "Clan Dreamcarver",
    "Coldsnap",
    "Crimson Oath",
    "Daedric",
    "Daggerfall Covenant",
    "Dark Brotherhood",
    "Dark Elf",
    "Dead Keeper",
    "Dead-Water",
    "Dragonguard",
    "Draugr",
    "Dreadhorn",
    "Dreadsails",
    "Dremora",
    "Dro-m'Athra",
    "Drowned Mariner",
    "Dwemer",
    "Ebonheart Pact",
    "Ebonshadow",
    "Ebony",
    "Elder Argonian",
    "Fang Lair",
    "Fargrave Guardian",
    "Firesong",
    "Glass",
    "Greymoor",
    "Grim Harlequin",
    "Hazardous Alchemy",
    "High Elf",
    "Hlaalu",
    "Hollowjack",
    "Honor Guard",
    "House Hexos",
    "House Mornard",
    "Huntsman",
    "Icereach Coven",
    "Imperial",
    "Ivory Brigade",
    "Khajiit",
    "Kindred's Concord",
    "Malacath",
    "Mazzatun",
    "Mercenary",
    "Meridian",
    "Militant Ordinator",
    "Minotaur",
    "Moongrave Fane",
    "Morag Tong",
    "New Moon Priest",
    "Nighthollow",
    "Nord",
    "Orcish",
    "Order of the Hour",
    "Outlaw",
    "Pellitine",
    "Primal",
    "Psijic",
    "Pyandonean",
    "Pyre Watch",
    "Ra Gada",
    "Redguard",
    "Redoran",
    "Refabricated",
    "Sapiarch",
    "Scalecaller",
    "Scribes of Mora",
    "Sea Giant",
    "Shield of Senchal",
    "Silken Ring",
    "Silver Dawn",
    "Silver Rose",
    "Skinchanger",
    "Soul-Shriven",
    "Stags of Z'en",
    "Stalhrim Frostcaster",
    "Steadfast Society",
    "Sul-Xan",
    "Sunspire",
    "Syrbanic Marine",
    "Systres Guardian",
    "Telvanni",
    "Thieves Guild",
    "Thorn Legion",
    "Trinimac",
    "True-Sworn",
    "Tsaesci",
    "Waking Flame",
    "Wayward Guardian",
    "Welkynar",
    "Wood Elf",
    "Worm Cult",
    "Xivkyn",
    "Y'ffre's Will",
    "Yokudan"
}

createDropdown("Lvl", OogleCraftLvlChoices, 0, 70, 160)
createDropdown("Set1List", OogleCraftSet1ListChoices, 160, 70, 240)
createDropdown("Set2List", OogleCraftSet2ListChoices, 400, 70, 240)
createDropdown("Set3List", OogleCraftSet3ListChoices, 640, 70, 240)
createDropdown("StyleList", OogleCraftStyleListChoices, 880, 70, 320)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Buttons ------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

createButton("ShieldQueue", 0, 470, 80)
createButton("ChestQueue", 80, 470, 80)
createButton("FeetQueue", 160, 470, 80)
createButton("HandsQueue", 240, 470, 80)
createButton("LegsQueue", 320, 470, 80)
createButton("WaistQueue", 400, 470, 80)
createButton("HeadQueue", 480, 470, 80)
createButton("ShouldersQueue", 560, 470, 80)
createButton("Ring1Queue", 640, 470, 80)
createButton("Ring2Queue", 720, 470, 80)
createButton("NecklaceQueue", 800, 470, 80)
createButton("FrontBar1Queue", 880, 470, 80)
createButton("FrontBar2Queue", 960, 470, 80)
createButton("BackBar1Queue", 1040, 470, 80)
createButton("BackBar2Queue", 1120, 470, 80)
