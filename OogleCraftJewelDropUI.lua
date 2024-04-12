OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

OogleCraft.savedVariables = OogleCraft.savedVariables or {}
OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}

local wm = WINDOW_MANAGER

local function createJewelrySetQualityDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    -- Creates the dropdown control with a (name, parent_control, inheritance)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelry" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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
    end

    -- Populate the dropdown with entries, I have no idea how loops work, so this just works
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect)
        dropdown:AddItem(entry)
    end

        -- Here comes the most painful part
    -- This function handles the savedVariables and sets the dropdown selection based on the savedVariables
    function OogleCraft.JewelrySetQualityDropSelectedItem()
        -- Check if the nested table exists
        if OogleCraft.savedVariables.desiredInfo.JewelrySetQuality then
            -- If so, set the desired result to a variable for readabilty
            local jewelrySetQuality = OogleCraft.savedVariables.desiredInfo.JewelrySetQuality[1]
            -- And set every selection to a table
            -- I have to take the entries that comes from (choices) and compare them to the options in savedVariables
            -- So make a table of whats in (choices) compare that to (choices) and savedVariables, and if they match, set the selection
            local indexMap = {
                White = 2,
                Green = 3,
                Blue = 4,
                Purple = 5,
                Yellow = 6,
                Orange = 7
            }
            -- I need the specific dropdown name or else it don't work
            -- Set the selection to the corresponding dropdown based on the indexMap and what's in the savedVariables
            -- Or, set it to (choices[1]) if something goes wrong
            OogleCraftJewelryJewelrySetQualityDrop.dropdown:SetSelectedItem(choices[indexMap[jewelrySetQuality] or 1])
        else
            -- If the savedVariables does not exist yet, set the selection to (choices[1])
            -- Also, you can get the specific name of each dropdown from the CreateControlFromVirtual() function
            -- The .dropdown is what handles the actual entries of the dropdowns
            OogleCraftJewelryJewelrySetQualityDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    -- Clearing functionality
    function OogleCraft.ResetJewelrySetQualitySelection()
        OogleCraftJewelryJewelrySetQualityDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createJewelrySetNumberDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelry" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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
    end
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect)
        dropdown:AddItem(entry)
    end

    function OogleCraft.JewelrySetRing1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetRing1 then
            local setRing1 = OogleCraft.savedVariables.desiredInfo.SetRing1[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftJewelrySetRing1Drop.dropdown:SetSelectedItem(choices[indexMap[setRing1] or 1])
        else
            OogleCraftJewelrySetRing1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.JewelrySetRing2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetRing2 then
            local setRing2 = OogleCraft.savedVariables.desiredInfo.SetRing2[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftJewelrySetRing2Drop.dropdown:SetSelectedItem(choices[indexMap[setRing2] or 1])
        else
            OogleCraftJewelrySetRing2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.JewelrySetNecklaceDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetNecklace then
            local setNecklace = OogleCraft.savedVariables.desiredInfo.SetNecklace[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftJewelrySetNecklaceDrop.dropdown:SetSelectedItem(choices[indexMap[setNecklace] or 1])
        else
            OogleCraftJewelrySetNecklaceDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetJewelrySetNumberSelection()
        OogleCraftJewelrySetRing1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftJewelrySetRing2Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftJewelrySetNecklaceDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createJewelryTraitDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelry" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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
    end
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect)
        dropdown:AddItem(entry)
    end

    function OogleCraft.JewelryTraitRing1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitRing1 then
            local traitRing1 = OogleCraft.savedVariables.desiredInfo.TraitRing1[1]
            local indexMap = {
                ["Arcane"] = 2,
                ["Healthy"] = 3,
                ["Robust"] = 4,
                ["Triune"] = 5,
                ["Infused"] = 6,
                ["Protective"] = 7,
                ["Swift"] = 8,
                ["Harmony"] = 9,
                ["Bloodthirsty"] = 10
            }
            OogleCraftJewelryTraitRing1Drop.dropdown:SetSelectedItem(choices[indexMap[traitRing1] or 1])
        else
            OogleCraftJewelryTraitRing1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.JewelryTraitRing2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitRing2 then
            local traitRing2 = OogleCraft.savedVariables.desiredInfo.TraitRing2[1]
            local indexMap = {
                ["Arcane"] = 2,
                ["Healthy"] = 3,
                ["Robust"] = 4,
                ["Triune"] = 5,
                ["Infused"] = 6,
                ["Protective"] = 7,
                ["Swift"] = 8,
                ["Harmony"] = 9,
                ["Bloodthirsty"] = 10
            }
            OogleCraftJewelryTraitRing2Drop.dropdown:SetSelectedItem(choices[indexMap[traitRing2] or 1])
        else
            OogleCraftJewelryTraitRing2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.JewelryTraitNecklaceDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitNecklace then
            local traitNecklace = OogleCraft.savedVariables.desiredInfo.TraitNecklace[1]
            local indexMap = {
                ["Arcane"] = 2,
                ["Healthy"] = 3,
                ["Robust"] = 4,
                ["Triune"] = 5,
                ["Infused"] = 6,
                ["Protective"] = 7,
                ["Swift"] = 8,
                ["Harmony"] = 9,
                ["Bloodthirsty"] = 10
            }
            OogleCraftJewelryTraitNecklaceDrop.dropdown:SetSelectedItem(choices[indexMap[traitNecklace] or 1])
        else
            OogleCraftJewelryTraitNecklaceDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetJewelryTraitSelection()
        OogleCraftJewelryTraitRing1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftJewelryTraitRing2Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftJewelryTraitNecklaceDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createJewelryEnchantQualityDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelry" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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
    end
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect)
        dropdown:AddItem(entry)
    end

    function OogleCraft.JewelryEnchantQualityDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.JewelryEnchantQuality then
            local jewelryEnchantQuality = OogleCraft.savedVariables.desiredInfo.JewelryEnchantQuality[1]
            local indexMap = {
                White = 2,
                Green = 3,
                Blue = 4,
                Purple = 5,
                Yellow = 6,
                Orange = 7
            }
            OogleCraftJewelryJewelryEnchantQualityDrop.dropdown:SetSelectedItem(choices[indexMap[jewelryEnchantQuality] or 1])
        else
            OogleCraftJewelryJewelryEnchantQualityDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetJewelryEnchantQualitySelection()
        OogleCraftJewelryJewelryEnchantQualityDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createJewelryEnchantDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelry" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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
    end
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect)
        dropdown:AddItem(entry)
    end

    function OogleCraft.JewelryEnchantRing1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantRing1 then
            local enchantRing1 = OogleCraft.savedVariables.desiredInfo.EnchantRing1[1]
            local indexMap = {
                 ["None"] = 2,
                 ["Health Recovery"] = 3,
                 ["Reduce Spell Cost"] = 4,
                 ["Magicka Recovery"] = 5,
                 ["Reduce Feat Cost"] = 6,
                 ["Stamina Recovery"] = 7,
                 ["Poison Resist"] = 8,
                 ["Flame Resist"] = 9,
                 ["Frost Resist"] = 10,
                 ["Shock Resist"] = 11,
                 ["Disease Resist"] = 12,
                 ["Potion Speed"] = 13,
                 ["Potion Boost"] = 14,
                 ["Decrease Physical Harm"] = 15,
                 ["Increase Physical Harm"] = 16,
                 ["Decrease Spell Harm"] = 17,
                 ["Increase Magical Harm"] = 18,
                 ["Shielding"] = 19,
                 ["Bashing"] = 20,
                 ["Reduce Skill Cost"] = 21,
                 ["Prismatic Recovery"] = 22
            }
            OogleCraftJewelryEnchantRing1Drop.dropdown:SetSelectedItem(choices[indexMap[enchantRing1] or 1])
        else
            OogleCraftJewelryEnchantRing1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.JewelryEnchantRing2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantRing2 then
            local enchantRing2 = OogleCraft.savedVariables.desiredInfo.EnchantRing2[1]
            local indexMap = {
                ["None"] = 2,
                ["Health Recovery"] = 3,
                ["Reduce Spell Cost"] = 4,
                ["Magicka Recovery"] = 5,
                ["Reduce Feat Cost"] = 6,
                ["Stamina Recovery"] = 7,
                ["Poison Resist"] = 8,
                ["Flame Resist"] = 9,
                ["Frost Resist"] = 10,
                ["Shock Resist"] = 11,
                ["Disease Resist"] = 12,
                ["Potion Speed"] = 13,
                ["Potion Boost"] = 14,
                ["Decrease Physical Harm"] = 15,
                ["Increase Physical Harm"] = 16,
                ["Decrease Spell Harm"] = 17,
                ["Increase Magical Harm"] = 18,
                ["Shielding"] = 19,
                ["Bashing"] = 20,
                ["Reduce Skill Cost"] = 21,
                ["Prismatic Recovery"] = 22
           }
            OogleCraftJewelryEnchantRing2Drop.dropdown:SetSelectedItem(choices[indexMap[enchantRing2] or 1])
        else
            OogleCraftJewelryEnchantRing2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.JewelryEnchantNecklaceDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantNecklace then
            local enchantNecklace = OogleCraft.savedVariables.desiredInfo.EnchantNecklace[1]
            local indexMap = {
                ["None"] = 2,
                ["Health Recovery"] = 3,
                ["Reduce Spell Cost"] = 4,
                ["Magicka Recovery"] = 5,
                ["Reduce Feat Cost"] = 6,
                ["Stamina Recovery"] = 7,
                ["Poison Resist"] = 8,
                ["Flame Resist"] = 9,
                ["Frost Resist"] = 10,
                ["Shock Resist"] = 11,
                ["Disease Resist"] = 12,
                ["Potion Speed"] = 13,
                ["Potion Boost"] = 14,
                ["Decrease Physical Harm"] = 15,
                ["Increase Physical Harm"] = 16,
                ["Decrease Spell Harm"] = 17,
                ["Increase Magical Harm"] = 18,
                ["Shielding"] = 19,
                ["Bashing"] = 20,
                ["Reduce Skill Cost"] = 21,
                ["Prismatic Recovery"] = 22
           }
            OogleCraftJewelryEnchantNecklaceDrop.dropdown:SetSelectedItem(choices[indexMap[enchantNecklace] or 1])
        else
            OogleCraftJewelryEnchantNecklaceDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetJewelryTraitSelection()
        OogleCraftJewelryTraitRing1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftJewelryTraitRing2Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftJewelryTraitNecklaceDrop.dropdown:SetSelectedItem(choices[1])
    end
end

function OogleCraft.PopulateJewelryDropdowns()
    OogleCraft.JewelrySetQualityDropSelectedItem()

    OogleCraft.JewelrySetRing1DropSelectedItem()
    OogleCraft.JewelrySetRing2DropSelectedItem()
    OogleCraft.JewelrySetNecklaceDropSelectedItem()

    OogleCraft.JewelryTraitRing1DropSelectedItem()
    OogleCraft.JewelryTraitRing2DropSelectedItem()
    OogleCraft.JewelryTraitNecklaceDropSelectedItem()

    OogleCraft.JewelryEnchantQualityDropSelectedItem()

    OogleCraft.JewelryEnchantRing1DropSelectedItem()
    OogleCraft.JewelryEnchantRing2DropSelectedItem()
    OogleCraft.JewelryEnchantNecklaceDropSelectedItem()
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelrySetQualityChoices = {"[Jewelry Quality]", "White", "Green", "Blue", "Purple", "Yellow", "Orange"}

createJewelrySetQualityDropdown("JewelrySetQuality", OogleCraftJewelrySetQualityChoices, 640, 95, 240)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Set Choices ------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelrySetRing1Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftJewelrySetRing2Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftJewelrySetNecklaceChoices = {"[Set#]", "Set #1", "Set #2", "Set #3"}

createJewelrySetNumberDropdown("SetRing1", OogleCraftJewelrySetRing1Choices, 640, 125, 80)
createJewelrySetNumberDropdown("SetRing2", OogleCraftJewelrySetRing2Choices, 720, 125, 80)
createJewelrySetNumberDropdown("SetNecklace", OogleCraftJewelrySetNecklaceChoices, 800, 125, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Trait Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryTraitRing1Choices = {"[Trait]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}
local OogleCraftJewelryTraitRing2Choices = {"[Trait]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}
local OogleCraftJewelryTraitNecklaceChoices = {"[Trait]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}

createJewelryTraitDropdown("TraitRing1", OogleCraftJewelryTraitRing1Choices, 640, 185, 80)
createJewelryTraitDropdown("TraitRing2", OogleCraftJewelryTraitRing2Choices, 720, 185, 80)
createJewelryTraitDropdown("TraitNecklace", OogleCraftJewelryTraitNecklaceChoices, 800, 185, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryEnchantQualityChoices = {"[Jewelry Enchant Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createJewelryEnchantQualityDropdown("JewelryEnchantQuality", OogleCraftJewelryEnchantQualityChoices, 640, 245, 240)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Enchant Choices --------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryEnchantRing1Choices = {"[Ench.]", "None", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}
local OogleCraftJewelryEnchantRing2Choices = {"[Ench.]", "None", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}
local OogleCraftJewelryEnchantNecklaceChoices = {"[Ench.]", "None", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}

createJewelryEnchantDropdown("EnchantRing1", OogleCraftJewelryEnchantRing1Choices, 640, 275, 80)
createJewelryEnchantDropdown("EnchantRing2", OogleCraftJewelryEnchantRing2Choices, 720, 275, 80)
createJewelryEnchantDropdown("EnchantNecklace", OogleCraftJewelryEnchantNecklaceChoices, 800, 275, 80)
