OogleCraft = {}
OogleCraft.name = "OogleCraft"

local wm = WINDOW_MANAGER  --just an upvalue
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Dropdowns ----------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftLvlChoices = {
    "Level",
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

}  --this is the table of choices to go in the dropdown

local OogleCraftLvlFrame = wm:CreateTopLevelWindow("OogleCraftLvlDropWin")  --this can be whatever toplevel frame you need it to be to anchor the dropdown stuff to
    OogleCraftLvlFrame:SetAnchor(TOPLEFT)
    OogleCraftLvlFrame:SetDimensions(125, 50)
local OogleCraftLvlDropdownContainer = wm:CreateControlFromVirtual("OogleCraftLvlDrop", OogleCraftLvlFrame, "ScrollCombobox")  --create your dropdown container using the template above
    OogleCraftLvlDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 0 + 7, 80)  --anchor this container however you need to
    OogleCraftLvlDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)  --change your dimensions if different from the template's (607, 30)
-- local lvlSelected = OogleCraftLvlDropdownContainer.name  --the template put the label in our container's table, you don't need this line unless you want it
local lvlDropdown = OogleCraftLvlDropdownContainer.dropdown  --the template put our actual dropdown object into our container's table. Here's a local reference so we don't have to keep doing a table look-up
    lvlDropdown:SetSelectedItem("Level")  --set your initial dropdown selection - usually taken from the saved variables

--[[
local function OnItemSelect(_, choiceText, choice)  --this is the callback function for when an item gets selected in the dropdown
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftLvlChoices do  --loop through your table to add the selections to the dropdown
    local entry = lvlDropdown:CreateItemEntry(OogleCraftLvlChoices[i]) -- [, OnItemSelect] --this really just creates a table with {name = choices[i], callback = OnItemSelect} - you may be able to skip this step and just pass the correctly formatted table into the below function...
    lvlDropdown:AddItem(entry)  --again, entry is just a table with the above args stored in it
end

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

local OogleCraftSet1ListFrame = wm:CreateTopLevelWindow("OogleCraftSet1ListDropWin")
    OogleCraftSet1ListFrame:SetAnchor(TOPLEFT)
    OogleCraftSet1ListFrame:SetDimensions(125, 50)
local OogleCraftSet1ListDropdownContainer = wm:CreateControlFromVirtual("OogleCraftSet1ListDrop", OogleCraftSet1ListFrame, "ScrollCombobox")
    OogleCraftSet1ListDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 125 + 7, 80)
    OogleCraftSet1ListDropdownContainer:GetNamedChild("Dropdown"):SetWidth(250)
-- local OogleCraftSet1ListSelected = OogleCraftSet1ListDropdownContainer.name
local Set1ListDropdown = OogleCraftSet1ListDropdownContainer.dropdown
    Set1ListDropdown:SetSelectedItem("[Set #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftSet1ListChoices do
    local entry = Set1ListDropdown:CreateItemEntry(OogleCraftSet1ListChoices[i]) -- , OnItemSelect
    Set1ListDropdown:AddItem(entry)
end

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

local OogleCraftSet2ListFrame = wm:CreateTopLevelWindow("OogleCraftSet2ListDropWin")
    OogleCraftSet2ListFrame:SetAnchor(TOPLEFT)
    OogleCraftSet2ListFrame:SetDimensions(125, 50)
local OogleCraftSet2ListDropdownContainer = wm:CreateControlFromVirtual("OogleCraftSet2ListDrop", OogleCraftSet2ListFrame, "ScrollCombobox")
    OogleCraftSet2ListDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 375 + 7, 80)
    OogleCraftSet2ListDropdownContainer:GetNamedChild("Dropdown"):SetWidth(250)
-- local selected = OogleCraftSet2ListDropdownContainer.name
local Set2ListDropdown = OogleCraftSet2ListDropdownContainer.dropdown
    Set2ListDropdown:SetSelectedItem("[Set #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftSet2ListChoices do
    local entry = Set2ListDropdown:CreateItemEntry(OogleCraftSet2ListChoices[i])
    Set2ListDropdown:AddItem(entry)
end

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

local OogleCraftSet3ListFrame = wm:CreateTopLevelWindow("OogleCraftSet3ListDropWin")
    OogleCraftSet3ListFrame:SetAnchor(TOPLEFT)
    OogleCraftSet3ListFrame:SetDimensions(125, 50)
local OogleCraftSet3ListDropdownContainer = wm:CreateControlFromVirtual("OogleCraftSet3ListDrop", OogleCraftSet3ListFrame, "ScrollCombobox")
    OogleCraftSet3ListDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 625 + 7, 80)
    OogleCraftSet3ListDropdownContainer:GetNamedChild("Dropdown"):SetWidth(250)
-- local selected = OogleCraftSet3ListDropdownContainer.name
local Set3ListDropdown = OogleCraftSet3ListDropdownContainer.dropdown
    Set3ListDropdown:SetSelectedItem("[Set #3]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftSet3ListChoices do
    local entry = Set3ListDropdown:CreateItemEntry(OogleCraftSet3ListChoices[i])
    Set3ListDropdown:AddItem(entry)
end