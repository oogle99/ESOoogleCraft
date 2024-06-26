OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

OogleCraft.savedVariables = OogleCraft.savedVariables or {}
OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}

local LLC = LibLazyCrafting

local wm = WINDOW_MANAGER  --just an upvalue

local function createLvlDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    -- Creates the dropdown control with a (name, parent_control, inheritance)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraft" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
    -- Anchor to the parent_control with customizable location
    dropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, xOffset + 7, yOffset)
    -- Not sure if this is required since I am setting the dimensions later
    dropdownContainer:SetDimensions(125, 50)
    -- Get the actual dropdown that contains the entries and sets the width
    dropdownContainer:GetNamedChild("Dropdown"):SetWidth(dropWide)
    -- Condense the above to make the code easier to write and read
    local dropdown = dropdownContainer.dropdown

    -- Don't sort the entries because some dropdowns feel wrong being in alphabetical order
    dropdown:SetSortsItems(false)

    -- This function handles what happens when a selection is made
    -- Furthermore, (_, choiceText, choice) seem to API parameters
    -- (_, choiceText) outputs the name of the selected entry, not sure how or why, but what do I care, if it works, it works
    -- I could probably remove (choice), it doesn't seem to be hurting anything
    local function OnItemSelect(_, choiceText, choice)
        -- Double check that the savedVariables tables are initialized because ESO coding is super sensitive
        OogleCraft.savedVariables = OogleCraft.savedVariables or {}
        OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}
        OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName] = OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName] or {}

        -- SavedVariables overpopulation management
        for i, item in ipairs(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName]) do
            -- If you make any selection, remove the item from the savedVariables table
            -- This makes the table WAY easier to access
            if item ~= choiceText or item == choiceText then
                -- Remove the item from the table
                table.remove(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName], i)
                -- Exit the loop once the item is removed
                break
            end
        end

        -- Store the selected item in the table corresponding to the current dropdown frame
        table.insert(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName], choiceText)

        OogleCraft.setAllGlobals()
    end

    -- Populate the dropdown with entries, I have no idea how loops work, so this just works
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect)
        dropdown:AddItem(entry)
    end

        -- Here comes the most painful part
    -- This function handles the savedVariables and sets the dropdown selection based on the savedVariables
    function OogleCraft.LvlDropSelectedItem()
        -- Check if the nested table exists
        if OogleCraft.savedVariables.desiredInfo.Lvl then
            -- If so, set the desired result to a variable for readabilty
            local lvl = OogleCraft.savedVariables.desiredInfo.Lvl[1]
            -- And set every selection to a table
            -- I have to take the entries that comes from (choices) and compare them to the options in savedVariables
            -- So make a table of whats in (choices) compare that to (choices) and savedVariables, and if they match, set the selection
            local indexMap = {
                ["Research"] = 2,
                ["10"] = 3,
                ["20"] = 4,
                ["30"] = 5,
                ["40"] = 6,
                ["50"] = 7,
                ["CP 10"] = 8,
                ["CP 20"] = 9,
                ["CP 30"] = 10,
                ["CP 40"] = 11,
                ["CP 50"] = 12,
                ["CP 60"] = 13,
                ["CP 70"] = 14,
                ["CP 80"] = 15,
                ["CP 90"] = 16,
                ["CP 100"] = 17,
                ["CP 110"] = 18,
                ["CP 120"] = 19,
                ["CP 130"] = 20,
                ["CP 140"] = 21,
                ["CP 150"] = 22,
                ["CP 160"] = 23
            }
            -- I need the specific dropdown name or else it don't work
            -- Set the selection to the corresponding dropdown based on the indexMap and what's in the savedVariables
            -- Or, set it to (choices[1]) if something goes wrong
            OogleCraftLvlDrop.dropdown:SetSelectedItem(choices[indexMap[lvl] or 1])
        else
            -- If the savedVariables does not exist yet, set the selection to (choices[1])
            -- Also, you can get the specific name of each dropdown from the CreateControlFromVirtual() function
            -- The .dropdown is what handles the actual entries of the dropdowns
            OogleCraftLvlDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetLvlSelection()
        OogleCraftLvlDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createSet1ListDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraft" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
    dropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, xOffset + 7, yOffset)
    dropdownContainer:SetDimensions(125, 50)
    dropdownContainer:GetNamedChild("Dropdown"):SetWidth(dropWide)
    local dropdown = dropdownContainer.dropdown
    dropdown:SetSortsItems(false)
    local function OnItemSelect(_, choiceText, choice)
        OogleCraft.savedVariables = OogleCraft.savedVariables or {}
        OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}
        OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName] = OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName] or {}
        for i, item in ipairs(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName]) do
            if item ~= choiceText or item == choiceText then
                table.remove(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName], i)
                break
            end
        end
        table.insert(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName], choiceText)

        OogleCraft.setAllGlobals()
    end
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect)
        dropdown:AddItem(entry)
    end

    function OogleCraft.Set1ListDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.Set1List then
            local set1List = OogleCraft.savedVariables.desiredInfo.Set1List[1]
            local indexMap = {
                ["No Set"] = 2,
                ["Adept Rider"] = 3,
                ["Aetherial Ascension"] = 4,
                ["Alessia's Bulwark"] = 5,
                ["Ancient Dragonguard"] = 6,
                ["Armor Master"] = 7,
                ["Armor of the Seducer"] = 8,
                ["Ashen Grip"] = 9,
                ["Assassin's Guile"] = 10,
                ["Chimera's Rebuke"] = 11,
                ["Claw of the Forest Wraith"] = 12,
                ["Clever Alchemist"] = 13,
                ["Coldharbour's Favorite"] = 14,
                ["Critical Riposte"] = 15,
                ["Daedric Trickery"] = 16,
                ["Daring Corsair"] = 17,
                ["Dauntless Combatant"] = 18,
                ["Deadlands Demolisher"] = 19,
                ["Deadth's Wind"] = 20,
                ["Diamond's Victory"] = 21,
                ["Dragon's Appetite"] = 22,
                ["Druid's Braid"] = 23,
                ["Eternal Hunt"] = 24,
                ["Eyes of Mara"] = 25,
                ["Fortified Brass"] = 26,
                ["Grave-Stake Collector"] = 27,
                ["Heartland Conqueror"] = 28,
                ["Hist Bark"] = 29,
                ["Hist Whisperer"] = 30,
                ["Hunding's Rage"] = 31,
                ["Innate Axiom"] = 32,
                ["Iron Flask"] = 33,
                ["Kagrenac's Hope"] = 34,
                ["Kvatch Gladiator"] = 35,
                ["Law of Julianos"] = 36,
                ["Legacy of Karth"] = 37,
                ["Magnus' Gift"] = 38,
                ["Mechanical Acuity"] = 39,
                ["Might of the Lost Legion"] = 40,
                ["Morkuldin"] = 41,
                ["Naga Shaman"] = 42,
                ["New Moon Acolyte"] = 43,
                ["Night Mother's Gaze"] = 44,
                ["Night's Silence"] = 45,
                ["Noble's Conquest"] = 46,
                ["Nocturnal's Favor"] = 47,
                ["Oblivion's Foe"] = 48,
                ["Old Growth Brewer"] = 49,
                ["Order's Wrath"] = 50,
                ["Orgnum's Scales"] = 51,
                ["Pelinal's Wrath"] = 52,
                ["Red Eagle's Fury"] = 53,
                ["Redistributor"] = 54,
                ["Seeker Synthesis"] = 55,
                ["Senche-Raht's Grit"] = 56,
                ["Serpent's Disdain"] = 57,
                ["Shacklbreaker"] = 58,
                ["Shalidor's Curse"] = 59,
                ["Shattered Fate"] = 60,
                ["Sload's Semblance"] = 61,
                ["Song of Lamae"] = 62,
                ["Specter's Eye"] = 63,
                ["Spell Parasite"] = 64,
                ["Stuhn's Favor"] = 65,
                ["Tava's Favor"] = 66,
                ["Telvanni Efficiency"] = 67,
                ["Torug's Pact"] = 68,
                ["Trial by Fire"] = 69,
                ["Twice-Born Star"] = 70,
                ["Twilight's Embrace"] = 71,
                ["Unchained Aggressor"] = 72,
                ["Vampire's Kiss"] = 73,
                ["Varen's Legacy"] = 74,
                ["Vastarie's Tutelage"] = 75,
                ["Way of the Arena"] = 76,
                ["Whitestrake's Retribution"] = 77,
                ["Willow's Path"] = 78,
                ["Wretched Vitality"] = 79
            }
            OogleCraftSet1ListDrop.dropdown:SetSelectedItem(choices[indexMap[set1List] or 1])
        else
            OogleCraftSet1ListDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetSet1Selection()
        OogleCraftSet1ListDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createSet2ListDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraft" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
    dropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, xOffset + 7, yOffset)
    dropdownContainer:SetDimensions(125, 50)
    dropdownContainer:GetNamedChild("Dropdown"):SetWidth(dropWide)
    local dropdown = dropdownContainer.dropdown
    dropdown:SetSortsItems(false)
    local function OnItemSelect(_, choiceText, choice)
        OogleCraft.savedVariables = OogleCraft.savedVariables or {}
        OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}
        OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName] = OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName] or {}
        for i, item in ipairs(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName]) do
            if item ~= choiceText or item == choiceText then
                table.remove(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName], i)
                break
            end
        end
        table.insert(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName], choiceText)

        OogleCraft.setAllGlobals()
    end
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect)
        dropdown:AddItem(entry)
    end

    function OogleCraft.Set2ListDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.Set2List then
            local set2List = OogleCraft.savedVariables.desiredInfo.Set2List[1]
            local indexMap = {
                ["No Set"] = 2,
                ["Adept Rider"] = 3,
                ["Aetherial Ascension"] = 4,
                ["Alessia's Bulwark"] = 5,
                ["Ancient Dragonguard"] = 6,
                ["Armor Master"] = 7,
                ["Armor of the Seducer"] = 8,
                ["Ashen Grip"] = 9,
                ["Assassin's Guile"] = 10,
                ["Chimera's Rebuke"] = 11,
                ["Claw of the Forest Wraith"] = 12,
                ["Clever Alchemist"] = 13,
                ["Coldharbour's Favorite"] = 14,
                ["Critical Riposte"] = 15,
                ["Daedric Trickery"] = 16,
                ["Daring Corsair"] = 17,
                ["Dauntless Combatant"] = 18,
                ["Deadlands Demolisher"] = 19,
                ["Deadth's Wind"] = 20,
                ["Diamond's Victory"] = 21,
                ["Dragon's Appetite"] = 22,
                ["Druid's Braid"] = 23,
                ["Eternal Hunt"] = 24,
                ["Eyes of Mara"] = 25,
                ["Fortified Brass"] = 26,
                ["Grave-Stake Collector"] = 27,
                ["Heartland Conqueror"] = 28,
                ["Hist Bark"] = 29,
                ["Hist Whisperer"] = 30,
                ["Hunding's Rage"] = 31,
                ["Innate Axiom"] = 32,
                ["Iron Flask"] = 33,
                ["Kagrenac's Hope"] = 34,
                ["Kvatch Gladiator"] = 35,
                ["Law of Julianos"] = 36,
                ["Legacy of Karth"] = 37,
                ["Magnus' Gift"] = 38,
                ["Mechanical Acuity"] = 39,
                ["Might of the Lost Legion"] = 40,
                ["Morkuldin"] = 41,
                ["Naga Shaman"] = 42,
                ["New Moon Acolyte"] = 43,
                ["Night Mother's Gaze"] = 44,
                ["Night's Silence"] = 45,
                ["Noble's Conquest"] = 46,
                ["Nocturnal's Favor"] = 47,
                ["Oblivion's Foe"] = 48,
                ["Old Growth Brewer"] = 49,
                ["Order's Wrath"] = 50,
                ["Orgnum's Scales"] = 51,
                ["Pelinal's Wrath"] = 52,
                ["Red Eagle's Fury"] = 53,
                ["Redistributor"] = 54,
                ["Seeker Synthesis"] = 55,
                ["Senche-Raht's Grit"] = 56,
                ["Serpent's Disdain"] = 57,
                ["Shacklbreaker"] = 58,
                ["Shalidor's Curse"] = 59,
                ["Shattered Fate"] = 60,
                ["Sload's Semblance"] = 61,
                ["Song of Lamae"] = 62,
                ["Specter's Eye"] = 63,
                ["Spell Parasite"] = 64,
                ["Stuhn's Favor"] = 65,
                ["Tava's Favor"] = 66,
                ["Telvanni Efficiency"] = 67,
                ["Torug's Pact"] = 68,
                ["Trial by Fire"] = 69,
                ["Twice-Born Star"] = 70,
                ["Twilight's Embrace"] = 71,
                ["Unchained Aggressor"] = 72,
                ["Vampire's Kiss"] = 73,
                ["Varen's Legacy"] = 74,
                ["Vastarie's Tutelage"] = 75,
                ["Way of the Arena"] = 76,
                ["Whitestrake's Retribution"] = 77,
                ["Willow's Path"] = 78,
                ["Wretched Vitality"] = 79
            }
            OogleCraftSet2ListDrop.dropdown:SetSelectedItem(choices[indexMap[set2List] or 1])
        else
            OogleCraftSet2ListDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetSet2Selection()
        OogleCraftSet2ListDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createSet3ListDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraft" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
    dropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, xOffset + 7, yOffset)
    dropdownContainer:SetDimensions(125, 50)
    dropdownContainer:GetNamedChild("Dropdown"):SetWidth(dropWide)
    local dropdown = dropdownContainer.dropdown
    dropdown:SetSortsItems(false)
    local function OnItemSelect(_, choiceText, choice)
        OogleCraft.savedVariables = OogleCraft.savedVariables or {}
        OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}
        OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName] = OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName] or {}
        for i, item in ipairs(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName]) do
            if item ~= choiceText or item == choiceText then
                table.remove(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName], i)
                break
            end
        end
        table.insert(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName], choiceText)

        OogleCraft.setAllGlobals()
    end
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect)
        dropdown:AddItem(entry)
    end

    function OogleCraft.Set3ListDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.Set3List then
            local set3List = OogleCraft.savedVariables.desiredInfo.Set3List[1]
            local indexMap = {
                ["No Set"] = 2,
                ["Adept Rider"] = 3,
                ["Aetherial Ascension"] = 4,
                ["Alessia's Bulwark"] = 5,
                ["Ancient Dragonguard"] = 6,
                ["Armor Master"] = 7,
                ["Armor of the Seducer"] = 8,
                ["Ashen Grip"] = 9,
                ["Assassin's Guile"] = 10,
                ["Chimera's Rebuke"] = 11,
                ["Claw of the Forest Wraith"] = 12,
                ["Clever Alchemist"] = 13,
                ["Coldharbour's Favorite"] = 14,
                ["Critical Riposte"] = 15,
                ["Daedric Trickery"] = 16,
                ["Daring Corsair"] = 17,
                ["Dauntless Combatant"] = 18,
                ["Deadlands Demolisher"] = 19,
                ["Deadth's Wind"] = 20,
                ["Diamond's Victory"] = 21,
                ["Dragon's Appetite"] = 22,
                ["Druid's Braid"] = 23,
                ["Eternal Hunt"] = 24,
                ["Eyes of Mara"] = 25,
                ["Fortified Brass"] = 26,
                ["Grave-Stake Collector"] = 27,
                ["Heartland Conqueror"] = 28,
                ["Hist Bark"] = 29,
                ["Hist Whisperer"] = 30,
                ["Hunding's Rage"] = 31,
                ["Innate Axiom"] = 32,
                ["Iron Flask"] = 33,
                ["Kagrenac's Hope"] = 34,
                ["Kvatch Gladiator"] = 35,
                ["Law of Julianos"] = 36,
                ["Legacy of Karth"] = 37,
                ["Magnus' Gift"] = 38,
                ["Mechanical Acuity"] = 39,
                ["Might of the Lost Legion"] = 40,
                ["Morkuldin"] = 41,
                ["Naga Shaman"] = 42,
                ["New Moon Acolyte"] = 43,
                ["Night Mother's Gaze"] = 44,
                ["Night's Silence"] = 45,
                ["Noble's Conquest"] = 46,
                ["Nocturnal's Favor"] = 47,
                ["Oblivion's Foe"] = 48,
                ["Old Growth Brewer"] = 49,
                ["Order's Wrath"] = 50,
                ["Orgnum's Scales"] = 51,
                ["Pelinal's Wrath"] = 52,
                ["Red Eagle's Fury"] = 53,
                ["Redistributor"] = 54,
                ["Seeker Synthesis"] = 55,
                ["Senche-Raht's Grit"] = 56,
                ["Serpent's Disdain"] = 57,
                ["Shacklbreaker"] = 58,
                ["Shalidor's Curse"] = 59,
                ["Shattered Fate"] = 60,
                ["Sload's Semblance"] = 61,
                ["Song of Lamae"] = 62,
                ["Specter's Eye"] = 63,
                ["Spell Parasite"] = 64,
                ["Stuhn's Favor"] = 65,
                ["Tava's Favor"] = 66,
                ["Telvanni Efficiency"] = 67,
                ["Torug's Pact"] = 68,
                ["Trial by Fire"] = 69,
                ["Twice-Born Star"] = 70,
                ["Twilight's Embrace"] = 71,
                ["Unchained Aggressor"] = 72,
                ["Vampire's Kiss"] = 73,
                ["Varen's Legacy"] = 74,
                ["Vastarie's Tutelage"] = 75,
                ["Way of the Arena"] = 76,
                ["Whitestrake's Retribution"] = 77,
                ["Willow's Path"] = 78,
                ["Wretched Vitality"] = 79
            }
            OogleCraftSet3ListDrop.dropdown:SetSelectedItem(choices[indexMap[set3List] or 1])
        else
            OogleCraftSet3ListDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetSet3Selection()
        OogleCraftSet3ListDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createStyleListDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraft" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
    dropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, xOffset + 7, yOffset)
    dropdownContainer:SetDimensions(125, 50)
    dropdownContainer:GetNamedChild("Dropdown"):SetWidth(dropWide)
    local dropdown = dropdownContainer.dropdown
    dropdown:SetSortsItems(false)
    local function OnItemSelect(_, choiceText, choice)
        OogleCraft.savedVariables = OogleCraft.savedVariables or {}
        OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}
        OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName] = OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName] or {}
        for i, item in ipairs(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName]) do
            if item ~= choiceText or item == choiceText then
                table.remove(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName], i)
                break
            end
        end
        table.insert(OogleCraft.savedVariables.desiredInfo[oogleCraftDropdownFrameName], choiceText)

        OogleCraft.setAllGlobals()
    end
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect)
        dropdown:AddItem(entry)
    end

    function OogleCraft.StyleListDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.StyleList then
            local styleList = OogleCraft.savedVariables.desiredInfo.StyleList[1]
            local indexMap = {
                ["Abah's Watch"] = 2,
                ["Akaviri"] = 3,
                ["Aldmeri Dominion"] = 4,
                ["Ancestral Akaviri"] = 5,
                ["Ancestral Breton"] = 6,
                ["Ancestral High Elf"] = 7,
                ["Ancestral Nord"] = 8,
                ["Ancestral Orc"] = 9,
                ["Ancestral Reach"] = 10,
                ["Ancient Daedric"] = 11,
                ["Ancient Elf"] = 12,
                ["Ancient Orc"] = 13,
                ["Anequina"] = 14,
                ["Annihilarch's Chosen"] = 15,
                ["Apostle"] = 16,
                ["Argonian"] = 17,
                ["Arkthzand Armory"] = 18,
                ["Ascendant Order"] = 19,
                ["Ashlander"] = 20,
                ["Assassins League"] = 21,
                ["Barbaric"] = 22,
                ["Black Fin Legion"] = 23,
                ["Blackreach Vanguard"] = 24,
                ["Blessed Inheritor"] = 25,
                ["Bloodforge"] = 26,
                ["Breton"] = 27,
                ["Buoyant Armiger"] = 28,
                ["Celestial"] = 29,
                ["Clan Dreamcarver"] = 30,
                ["Coldsnap"] = 31,
                ["Crimson Oath"] = 32,
                ["Daedric"] = 33,
                ["Daggerfall Covenant"] = 34,
                ["Dark Brotherhood"] = 35,
                ["Dark Elf"] = 36,
                ["Dead Keeper"] = 37,
                ["Dead-Water"] = 38,
                ["Dragonguard"] = 39,
                ["Draugr"] = 40,
                ["Dreadhorn"] = 41,
                ["Dreadsails"] = 42,
                ["Dremora"] = 43,
                ["Dro-m'Athra"] = 44,
                ["Drowned Mariner"] = 45,
                ["Dwemer"] = 46,
                ["Ebonheart Pact"] = 47,
                ["Ebonshadow"] = 48,
                ["Ebony"] = 49,
                ["Elder Argonian"] = 50,
                ["Fang Lair"] = 51,
                ["Fargrave Guardian"] = 52,
                ["Firesong"] = 53,
                ["Glass"] = 54,
                ["Greymoor"] = 55,
                ["Grim Harlequin"] = 56,
                ["Hazardous Alchemy"] = 57,
                ["High Elf"] = 58,
                ["Hlaalu"] = 59,
                ["Hollowjack"] = 60,
                ["Honor Guard"] = 61,
                ["House Hexos"] = 62,
                ["House Mornard"] = 63,
                ["Huntsman"] = 64,
                ["Icereach Coven"] = 65,
                ["Imperial"] = 66,
                ["Ivory Brigade"] = 67,
                ["Khajiit"] = 68,
                ["Kindred's Concord"] = 69,
                ["Malacath"] = 70,
                ["Mazzatun"] = 71,
                ["Mercenary"] = 72,
                ["Meridian"] = 73,
                ["Militant Ordinator"] = 74,
                ["Minotaur"] = 75,
                ["Moongrave Fane"] = 76,
                ["Morag Tong"] = 77,
                ["New Moon Priest"] = 78,
                ["Nighthollow"] = 79,
                ["Nord"] = 80,
                ["Orcish"] = 81,
                ["Order of the Hour"] = 82,
                ["Outlaw"] = 83,
                ["Pellitine"] = 84,
                ["Primal"] = 85,
                ["Psijic"] = 86,
                ["Pyandonean"] = 87,
                ["Pyre Watch"] = 88,
                ["Ra Gada"] = 89,
                ["Redguard"] = 90,
                ["Redoran"] = 91,
                ["Refabricated"] = 92,
                ["Sapiarch"] = 93,
                ["Scalecaller"] = 94,
                ["Scribes of Mora"] = 95,
                ["Sea Giant"] = 96,
                ["Shield of Senchal"] = 97,
                ["Silken Ring"] = 98,
                ["Silver Dawn"] = 99,
                ["Silver Rose"] = 100,
                ["Skinchanger"] = 101,
                ["Soul-Shriven"] = 102,
                ["Stags of Z'en"] = 103,
                ["Stalhrim Frostcaster"] = 104,
                ["Steadfast Society"] = 105,
                ["Sul-Xan"] = 106,
                ["Sunspire"] = 107,
                ["Syrbanic Marine"] = 108,
                ["Systres Guardian"] = 109,
                ["Telvanni"] = 110,
                ["Thieves Guild"] = 111,
                ["Thorn Legion"] = 112,
                ["Trinimac"] = 113,
                ["True-Sworn"] = 114,
                ["Tsaesci"] = 115,
                ["Waking Flame"] = 116,
                ["Wayward Guardian"] = 117,
                ["Welkynar"] = 118,
                ["Wood Elf"] = 119,
                ["Worm Cult"] = 120,
                ["Xivkyn"] = 121,
                ["Y'ffre's Will"] = 122,
                ["Yokudan"] = 123
            }
            OogleCraftStyleListDrop.dropdown:SetSelectedItem(choices[indexMap[styleList] or 1])
        else
            OogleCraftStyleListDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetStyleListSelection()
        OogleCraftStyleListDrop.dropdown:SetSelectedItem(choices[1])
    end
end

function OogleCraft.PopulateMiscDropdowns()
    OogleCraft.LvlDropSelectedItem()
    OogleCraft.Set1ListDropSelectedItem()
    OogleCraft.Set2ListDropSelectedItem()
    OogleCraft.Set3ListDropSelectedItem()
    OogleCraft.StyleListDropSelectedItem()
end

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

    --d(oogleCraftButtonFrameName)
    if oogleCraftButtonFrameName == "ShieldQueue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.shieldPattern, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setShieldTrait, false, OogleCraft.shieldCraftingOverride, OogleCraft.setShieldNumber, OogleCraft.desiredArmorQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.shieldPattern, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setShieldTrait, false, OogleCraft.shieldCraftingOverride, OogleCraft.setShieldNumber, OogleCraft.desiredArmorQuality, true, nil, OogleCraft.setShieldPotencyIndex, OogleCraft.setShieldEssenceIndex, OogleCraft.desiredArmorEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "ChestQueue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setChestWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setChestTrait, false, OogleCraft.setChestCraftingOverride, OogleCraft.setChestNumber, OogleCraft.desiredArmorQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setChestWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setChestTrait, false, OogleCraft.setChestCraftingOverride, OogleCraft.setChestNumber, OogleCraft.desiredArmorQuality, true, nil, OogleCraft.setChestPotencyIndex, OogleCraft.setChestEssenceIndex, OogleCraft.desiredArmorEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "FeetQueue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setFeetWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setFeetTrait, false, OogleCraft.setFeetCraftingOverride, OogleCraft.setFeetNumber, OogleCraft.desiredArmorQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setFeetWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setFeetTrait, false, OogleCraft.setFeetCraftingOverride, OogleCraft.setFeetNumber, OogleCraft.desiredArmorQuality, true, nil, OogleCraft.setFeetPotencyIndex, OogleCraft.setFeetEssenceIndex, OogleCraft.desiredArmorEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "HandsQueue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setHandsWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setHandsTrait, false, OogleCraft.setHandsCraftingOverride, OogleCraft.setHandsNumber, OogleCraft.desiredArmorQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setHandsWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setHandsTrait, false, OogleCraft.setHandsCraftingOverride, OogleCraft.setHandsNumber, OogleCraft.desiredArmorQuality, true, nil, OogleCraft.setHandsPotencyIndex, OogleCraft.setHandsEssenceIndex, OogleCraft.desiredArmorEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "LegsQueue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setLegsWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setLegsTrait, false, OogleCraft.setLegsCraftingOverride, OogleCraft.setLegsNumber, OogleCraft.desiredArmorQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setLegsWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setLegsTrait, false, OogleCraft.setLegsCraftingOverride, OogleCraft.setLegsNumber, OogleCraft.desiredArmorQuality, true, nil, OogleCraft.setLegsPotencyIndex, OogleCraft.setLegsEssenceIndex, OogleCraft.desiredArmorEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "WaistQueue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setWaistWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setWaistTrait, false, OogleCraft.setWaistCraftingOverride, OogleCraft.setWaistNumber, OogleCraft.desiredArmorQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setWaistWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setWaistTrait, false, OogleCraft.setWaistCraftingOverride, OogleCraft.setWaistNumber, OogleCraft.desiredArmorQuality, true, nil, OogleCraft.setWaistPotencyIndex, OogleCraft.setWaistEssenceIndex, OogleCraft.desiredArmorEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "HeadQueue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setHeadWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setHeadTrait, false, OogleCraft.setHeadCraftingOverride, OogleCraft.setHeadNumber, OogleCraft.desiredArmorQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setHeadWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setHeadTrait, false, OogleCraft.setHeadCraftingOverride, OogleCraft.setHeadNumber, OogleCraft.desiredArmorQuality, true, nil, OogleCraft.setHeadPotencyIndex, OogleCraft.setHeadEssenceIndex, OogleCraft.desiredArmorEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "ShouldersQueue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setShouldersWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setShouldersTrait, false, OogleCraft.setShouldersCraftingOverride, OogleCraft.setShouldersNumber, OogleCraft.desiredArmorQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setShouldersWeight, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setShouldersTrait, false, OogleCraft.setShouldersCraftingOverride, OogleCraft.setShouldersNumber, OogleCraft.desiredArmorQuality, true, nil, OogleCraft.setShouldersPotencyIndex, OogleCraft.setShouldersEssenceIndex, OogleCraft.desiredArmorEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "Ring1Queue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.ringPattern, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setRing1Trait, false, OogleCraft.ringCraftingOverride, OogleCraft.setRing1Number, OogleCraft.desiredJewelryQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.ringPattern, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setRing1Trait, false, OogleCraft.ringCraftingOverride, OogleCraft.setRing1Number, OogleCraft.desiredJewelryQuality, true, nil, OogleCraft.setRing1PotencyIndex, OogleCraft.setRing1EssenceIndex, OogleCraft.desiredJewelryEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "Ring2Queue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.ringPattern, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setRing2Trait, false, OogleCraft.ringCraftingOverride, OogleCraft.setRing2Number, OogleCraft.desiredJewelryQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.ringPattern, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setRing2Trait, false, OogleCraft.ringCraftingOverride, OogleCraft.setRing2Number, OogleCraft.desiredJewelryQuality, true, nil, OogleCraft.setRing2PotencyIndex, OogleCraft.setRing2EssenceIndex, OogleCraft.desiredJewelryEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "NecklaceQueue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.necklacePattern, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setNecklaceTrait, false, OogleCraft.necklaceCraftingOverride, OogleCraft.setNecklaceNumber, OogleCraft.desiredJewelryQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.necklacePattern, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setNecklaceTrait, false, OogleCraft.necklaceCraftingOverride, OogleCraft.setNecklaceNumber, OogleCraft.desiredJewelryQuality, true, nil, OogleCraft.setNecklacePotencyIndex, OogleCraft.setNecklaceEssenceIndex, OogleCraft.desiredJewelryEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "FrontBar1Queue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setFB1Type, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setFB1Trait, false, OogleCraft.setFB1CraftingOverride, OogleCraft.setFB1Number, OogleCraft.desiredWeaponQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setFB1Type, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setFB1Trait, false, OogleCraft.setFB1CraftingOverride, OogleCraft.setFB1Number, OogleCraft.desiredWeaponQuality, true, nil, OogleCraft.setFB1PotencyIndex, OogleCraft.setFB1EssenceIndex, OogleCraft.desiredWeaponEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "FrontBar2Queue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setFB2Type, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setFB2Trait, false, OogleCraft.setFB2CraftingOverride, OogleCraft.setFB2Number, OogleCraft.desiredWeaponQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setFB2Type, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setFB2Trait, false, OogleCraft.setFB2CraftingOverride, OogleCraft.setFB2Number, OogleCraft.desiredWeaponQuality, true, nil, OogleCraft.setFB2PotencyIndex, OogleCraft.setFB2EssenceIndex, OogleCraft.desiredWeaponEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "BackBar1Queue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setBB1Type, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setBB1Trait, false, OogleCraft.setBB1CraftingOverride, OogleCraft.setBB1Number, OogleCraft.desiredWeaponQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setBB1Type, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setBB1Trait, false, OogleCraft.setBB1CraftingOverride, OogleCraft.setBB1Number, OogleCraft.desiredWeaponQuality, true, nil, OogleCraft.setBB1PotencyIndex, OogleCraft.setBB1EssenceIndex, OogleCraft.desiredWeaponEnchantQuality, 1)
        end
    end
    if oogleCraftButtonFrameName == "BackBar2Queue" then
        OogleCraft.setAllGlobals()
        if OogleCraft.desiredArmorEnchantQuality == nil then
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setBB2Type, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setBB2Trait, false, OogleCraft.setBB2CraftingOverride, OogleCraft.setBB2Number, OogleCraft.desiredWeaponQuality, true, nil, nil, nil, nil, 1)
        else
            OogleCraft.LLC:CraftSmithingItemByLevel(OogleCraft.setBB2Type, OogleCraft.isCP, OogleCraft.desiredLevel, OogleCraft.desiredStyleName, OogleCraft.setBB2Trait, false, OogleCraft.setBB2CraftingOverride, OogleCraft.setBB2Number, OogleCraft.desiredWeaponQuality, true, nil, OogleCraft.setBB2PotencyIndex, OogleCraft.setBB2EssenceIndex, OogleCraft.desiredWeaponEnchantQuality, 1)
        end
    end
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
    "No Set",
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
    "No Set",
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
    "No Set",
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

createLvlDropdown("Lvl", OogleCraftLvlChoices, 0, 25, 160)
createSet1ListDropdown("Set1List", OogleCraftSet1ListChoices, 160, 25, 240)
createSet2ListDropdown("Set2List", OogleCraftSet2ListChoices, 400, 25, 240)
createSet3ListDropdown("Set3List", OogleCraftSet3ListChoices, 640, 25, 240)
createStyleListDropdown("StyleList", OogleCraftStyleListChoices, 880, 25, 320)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Buttons ------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

createButton("ShieldQueue", 0, 305, 80)
createButton("ChestQueue", 80, 305, 80)
createButton("FeetQueue", 160, 305, 80)
createButton("HandsQueue", 240, 305, 80)
createButton("LegsQueue", 320, 305, 80)
createButton("WaistQueue", 400, 305, 80)
createButton("HeadQueue", 480, 305, 80)
createButton("ShouldersQueue", 560, 305, 80)
createButton("Ring1Queue", 640, 305, 80)
createButton("Ring2Queue", 720, 305, 80)
createButton("NecklaceQueue", 800, 305, 80)
createButton("FrontBar1Queue", 880, 305, 80)
createButton("FrontBar2Queue", 960, 305, 80)
createButton("BackBar1Queue", 1040, 305, 80)
createButton("BackBar2Queue", 1120, 305, 80)
