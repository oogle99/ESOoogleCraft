--[[
    CREATOR'S NOTE:
    There seems to be a two step process when it comes to addon loading.
    Creation and Permanence.
    The creation of the dropdowns gives each one unique names, and user interaction
    proves that each dropdown keeps its own name.
    However, after they have been made, any attempt to access the oogleCraftDropdownFrameName,
    or (choices) seems to be troublesome.
    Hence why I elected to use multiple, basically identicle createDropdown() functions.

    For example, when just working with the ArmorSetQuality dropdown, everything worked great.
    The savedVariables were setting how I wanted to, but with just the simple act of adding
    the set# dropdowns, everything broke.

    It seems, that even though every dropdown has a unique name, once the code runs through,
    the only thing it remembers, the permanence, is the last created dropdown. So, ArmorSetQuality would somehow
    start out with "Set#" as its default and oogleCraftDropdownFrameName was "setShoulders".
    It would aslo refuse to work with the savedVariables anymore, understandably so, since it was no
    longer a ArmorSetQuality variable.

    So, to remedy this probably well known problem that I am just now learning about, each dropdownType
    will get its own createDropdown() function. Wish I knew how to make this more condensed, but I am
    lazy, and have no idea how to learn to be proficient with Lua. Plus, if it loads fine, be like Todd Howard.

    "It just works."
--]]

OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

OogleCraft.savedVariables = OogleCraft.savedVariables or {}
OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}

-- WINDOW_MANAGER is an API function, it allows the creation of controls in Lua... I think
local wm = WINDOW_MANAGER

local function createArmorSetQualityDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    -- Creates the dropdown control with a (name, parent_control, inheritance)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmor" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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
    function OogleCraft.ArmorQualityDropSelectedItem()
        -- Check if the nested table exists
        if OogleCraft.savedVariables.desiredInfo.ArmorSetQuality then
            -- If so, set the desired result to a variable for readabilty
            local armorSetQuality = OogleCraft.savedVariables.desiredInfo.ArmorSetQuality[1]
            -- And set every selection to a table
            -- I have to take the entries that comes from (choices) and compare them to the options in savedVariables
            -- So make a table of whats in (choices) compare that to (choices) and savedVariables, and if they match, set the selection
            local indexMap = {
                White = 2,
                Green = 3,
                Blue = 4,
                Purple = 5,
                Yellow = 6
            }
            -- I need the specific dropdown name or else it don't work
            -- Set the selection to the corresponding dropdown based on the indexMap and what's in the savedVariables
            -- Or, set it to (choices[1]) if something goes wrong
            OogleCraftArmorArmorSetQualityDrop.dropdown:SetSelectedItem(choices[indexMap[armorSetQuality] or 1])
        else
            -- If the savedVariables does not exist yet, set the selection to (choices[1])
            -- Also, you can get the specific name of each dropdown from the CreateControlFromVirtual() function
            -- The .dropdown is what handles the actual entries of the dropdowns
            OogleCraftArmorArmorSetQualityDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetArmorSetQualitySelection()
        OogleCraftArmorArmorSetQualityDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createArmorSetNumberDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmor" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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

    function OogleCraft.ArmorSetShieldDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetShield then
            local setShield = OogleCraft.savedVariables.desiredInfo.SetShield[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftArmorSetShieldDrop.dropdown:SetSelectedItem(choices[indexMap[setShield] or 1])
        else
            OogleCraftArmorSetShieldDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorSetChestDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetChest then
            local setChest = OogleCraft.savedVariables.desiredInfo.SetChest[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftArmorSetChestDrop.dropdown:SetSelectedItem(choices[indexMap[setChest] or 1])
        else
            OogleCraftArmorSetChestDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorSetFeetDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetFeet then
            local setFeet = OogleCraft.savedVariables.desiredInfo.SetFeet[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftArmorSetFeetDrop.dropdown:SetSelectedItem(choices[indexMap[setFeet] or 1])
        else
            OogleCraftArmorSetFeetDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorSetHandsDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetHands then
            local setHands = OogleCraft.savedVariables.desiredInfo.SetHands[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftArmorSetHandsDrop.dropdown:SetSelectedItem(choices[indexMap[setHands] or 1])
        else
            OogleCraftArmorSetHandsDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorSetLegsDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetLegs then
            local setLegs = OogleCraft.savedVariables.desiredInfo.SetLegs[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftArmorSetLegsDrop.dropdown:SetSelectedItem(choices[indexMap[setLegs] or 1])
        else
            OogleCraftArmorSetLegsDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorSetWaistDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetWaist then
            local setWaist = OogleCraft.savedVariables.desiredInfo.SetWaist[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftArmorSetWaistDrop.dropdown:SetSelectedItem(choices[indexMap[setWaist] or 1])
        else
            OogleCraftArmorSetWaistDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorSetHeadDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetHead then
            local setHead = OogleCraft.savedVariables.desiredInfo.SetHead[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftArmorSetHeadDrop.dropdown:SetSelectedItem(choices[indexMap[setHead] or 1])
        else
            OogleCraftArmorSetHeadDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorSetShouldersDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetShoulders then
            local setShoulders = OogleCraft.savedVariables.desiredInfo.SetShoulders[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftArmorSetShouldersDrop.dropdown:SetSelectedItem(choices[indexMap[setShoulders] or 1])
        else
            OogleCraftArmorSetShouldersDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetArmorSetNumberSelection()
        OogleCraftArmorSetShieldDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorSetChestDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorSetFeetDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorSetHandsDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorSetLegsDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorSetWaistDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorSetHeadDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorSetShouldersDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createArmorWeightDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmor" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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

    function OogleCraft.ArmorWeightChestDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.WeightChest then
            local weightChest = OogleCraft.savedVariables.desiredInfo.WeightChest[1]
            local indexMap = {
                ["Light"] = 2,
                ["Medium"] = 3,
                ["Heavy"] = 4
            }
            OogleCraftArmorWeightChestDrop.dropdown:SetSelectedItem(choices[indexMap[weightChest] or 1])
        else
            OogleCraftArmorWeightChestDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorWeightFeetDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.WeightFeet then
            local weightFeet = OogleCraft.savedVariables.desiredInfo.WeightFeet[1]
            local indexMap = {
                ["Light"] = 2,
                ["Medium"] = 3,
                ["Heavy"] = 4
            }
            OogleCraftArmorWeightFeetDrop.dropdown:SetSelectedItem(choices[indexMap[weightFeet] or 1])
        else
            OogleCraftArmorWeightFeetDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorWeightHandsDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.WeightHands then
            local weightHands = OogleCraft.savedVariables.desiredInfo.WeightHands[1]
            local indexMap = {
                ["Light"] = 2,
                ["Medium"] = 3,
                ["Heavy"] = 4
            }
            OogleCraftArmorWeightHandsDrop.dropdown:SetSelectedItem(choices[indexMap[weightHands] or 1])
        else
            OogleCraftArmorWeightHandsDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorWeightLegsDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.WeightLegs then
            local weightLegs = OogleCraft.savedVariables.desiredInfo.WeightLegs[1]
            local indexMap = {
                ["Light"] = 2,
                ["Medium"] = 3,
                ["Heavy"] = 4
            }
            OogleCraftArmorWeightLegsDrop.dropdown:SetSelectedItem(choices[indexMap[weightLegs] or 1])
        else
            OogleCraftArmorWeightLegsDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorWeightWaistDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.WeightWaist then
            local weightWaist = OogleCraft.savedVariables.desiredInfo.WeightWaist[1]
            local indexMap = {
                ["Light"] = 2,
                ["Medium"] = 3,
                ["Heavy"] = 4
            }
            OogleCraftArmorWeightWaistDrop.dropdown:SetSelectedItem(choices[indexMap[weightWaist] or 1])
        else
            OogleCraftArmorWeightWaistDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorWeightHeadDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.WeightHead then
            local weightHead = OogleCraft.savedVariables.desiredInfo.WeightHead[1]
            local indexMap = {
                ["Light"] = 2,
                ["Medium"] = 3,
                ["Heavy"]= 4
            }
            OogleCraftArmorWeightHeadDrop.dropdown:SetSelectedItem(choices[indexMap[weightHead] or 1])
        else
            OogleCraftArmorWeightHeadDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorWeightShouldersDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.WeightShoulders then
            local weightShoulders = OogleCraft.savedVariables.desiredInfo.WeightShoulders[1]
            local indexMap = {
                ["Light"] = 2,
                ["Medium"] = 3,
                ["Heavy"]= 4
            }
            OogleCraftArmorWeightShouldersDrop.dropdown:SetSelectedItem(choices[indexMap[weightShoulders] or 1])
        else
            OogleCraftArmorWeightShouldersDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetArmorWeightSelection()
        OogleCraftArmorWeightChestDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorWeightFeetDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorWeightHandsDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorWeightLegsDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorWeightWaistDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorWeightHeadDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorWeightShouldersDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createArmorTraitDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmor" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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

    function OogleCraft.ArmorTraitShieldDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitShield then
            local traitShield = OogleCraft.savedVariables.desiredInfo.TraitShield[1]
            local indexMap = {
                ["None"] = 2,
                ["Sturdy"] = 3,
                ["Impenetrable"] = 4,
                ["Reinforced"] = 5,
                ["Well-fitted"] = 6,
                ["Training"] = 7,
                ["Infused"] = 8,
                ["Invigorating"] = 9,
                ["Divines"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftArmorTraitShieldDrop.dropdown:SetSelectedItem(choices[indexMap[traitShield] or 1])
        else
            OogleCraftArmorTraitShieldDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorTraitChestDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitChest then
            local traitChest = OogleCraft.savedVariables.desiredInfo.TraitChest[1]
            local indexMap = {
                ["None"] = 2,
                ["Sturdy"] = 3,
                ["Impenetrable"] = 4,
                ["Reinforced"] = 5,
                ["Well-fitted"] = 6,
                ["Training"] = 7,
                ["Infused"] = 8,
                ["Invigorating"] = 9,
                ["Divines"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftArmorTraitChestDrop.dropdown:SetSelectedItem(choices[indexMap[traitChest] or 1])
        else
            OogleCraftArmorTraitChestDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorTraitFeetDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitFeet then
            local traitFeet = OogleCraft.savedVariables.desiredInfo.TraitFeet[1]
            local indexMap = {
                ["None"] = 2,
                ["Sturdy"] = 3,
                ["Impenetrable"] = 4,
                ["Reinforced"] = 5,
                ["Well-fitted"] = 6,
                ["Training"] = 7,
                ["Infused"] = 8,
                ["Invigorating"] = 9,
                ["Divines"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftArmorTraitFeetDrop.dropdown:SetSelectedItem(choices[indexMap[traitFeet] or 1])
        else
            OogleCraftArmorTraitFeetDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorTraitHandsDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitHands then
            local traitHands = OogleCraft.savedVariables.desiredInfo.TraitHands[1]
            local indexMap = {
                ["None"] = 2,
                ["Sturdy"] = 3,
                ["Impenetrable"] = 4,
                ["Reinforced"] = 5,
                ["Well-fitted"] = 6,
                ["Training"] = 7,
                ["Infused"] = 8,
                ["Invigorating"] = 9,
                ["Divines"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftArmorTraitHandsDrop.dropdown:SetSelectedItem(choices[indexMap[traitHands] or 1])
        else
            OogleCraftArmorTraitHandsDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorSetTraitLegsSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitLegs then
            local traitLegs = OogleCraft.savedVariables.desiredInfo.TraitLegs[1]
            local indexMap = {
                ["None"] = 2,
                ["Sturdy"] = 3,
                ["Impenetrable"] = 4,
                ["Reinforced"] = 5,
                ["Well-fitted"] = 6,
                ["Training"] = 7,
                ["Infused"] = 8,
                ["Invigorating"] = 9,
                ["Divines"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftArmorTraitLegsDrop.dropdown:SetSelectedItem(choices[indexMap[traitLegs] or 1])
        else
            OogleCraftArmorTraitLegsDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorTraitWaistDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitWaist then
            local traitWaist = OogleCraft.savedVariables.desiredInfo.TraitWaist[1]
            local indexMap = {
                ["None"] = 2,
                ["Sturdy"] = 3,
                ["Impenetrable"] = 4,
                ["Reinforced"] = 5,
                ["Well-fitted"] = 6,
                ["Training"] = 7,
                ["Infused"] = 8,
                ["Invigorating"] = 9,
                ["Divines"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftArmorTraitWaistDrop.dropdown:SetSelectedItem(choices[indexMap[traitWaist] or 1])
        else
            OogleCraftArmorTraitWaistDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorTraitHeadDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitHead then
            local traitHead = OogleCraft.savedVariables.desiredInfo.TraitHead[1]
            local indexMap = {
                ["None"] = 2,
                ["Sturdy"] = 3,
                ["Impenetrable"] = 4,
                ["Reinforced"] = 5,
                ["Well-fitted"] = 6,
                ["Training"] = 7,
                ["Infused"] = 8,
                ["Invigorating"] = 9,
                ["Divines"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftArmorTraitHeadDrop.dropdown:SetSelectedItem(choices[indexMap[traitHead] or 1])
        else
            OogleCraftArmorTraitHeadDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorTraitShouldersDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitShoulders then
            local traitShoulders = OogleCraft.savedVariables.desiredInfo.TraitShoulders[1]
            local indexMap = {
                ["None"] = 2,
                ["Sturdy"] = 3,
                ["Impenetrable"] = 4,
                ["Reinforced"] = 5,
                ["Well-fitted"] = 6,
                ["Training"] = 7,
                ["Infused"] = 8,
                ["Invigorating"] = 9,
                ["Divines"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftArmorTraitShouldersDrop.dropdown:SetSelectedItem(choices[indexMap[traitShoulders] or 1])
        else
            OogleCraftArmorTraitShouldersDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetArmorTraitSelection()
        OogleCraftArmorTraitShieldDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorTraitChestDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorTraitFeetDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorTraitHandsDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorTraitLegsDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorTraitWaistDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorTraitHeadDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorTraitShouldersDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createArmorEnchantQualityDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmor" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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

    function OogleCraft.ArmorEnchantQualityDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.ArmorEnchantQuality then
            local armorEnchantQuality = OogleCraft.savedVariables.desiredInfo.ArmorEnchantQuality[1]
            local indexMap = {
                None = 2,
                White = 3,
                Green = 4,
                Blue = 5,
                Purple = 6,
                Yellow = 7
            }
            OogleCraftArmorArmorEnchantQualityDrop.dropdown:SetSelectedItem(choices[indexMap[armorEnchantQuality] or 1])
        else
            OogleCraftArmorArmorEnchantQualityDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetArmorEnchantQualitySelection()
        OogleCraftArmorArmorEnchantQualityDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createArmorEnchantDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmor" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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

    function OogleCraft.ArmorEnchantShieldDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantShield then
            local enchantShield = OogleCraft.savedVariables.desiredInfo.EnchantShield[1]
            local indexMap = {
                ["Health"] = 2,
                ["Magicka"] = 3,
                ["Stamina"] = 4,
                ["Prismatic Defense"] = 5
            }
            OogleCraftArmorEnchantShieldDrop.dropdown:SetSelectedItem(choices[indexMap[enchantShield] or 1])
        else
            OogleCraftArmorEnchantShieldDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorEnchantChestDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantChest then
            local enchantChest = OogleCraft.savedVariables.desiredInfo.EnchantChest[1]
            local indexMap = {
                ["Health"] = 2,
                ["Magicka"] = 3,
                ["Stamina"] = 4,
                ["Prismatic Defense"] = 5
            }
            OogleCraftArmorEnchantChestDrop.dropdown:SetSelectedItem(choices[indexMap[enchantChest] or 1])
        else
            OogleCraftArmorEnchantChestDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorEnchantFeetDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantFeet then
            local enchantFeet = OogleCraft.savedVariables.desiredInfo.EnchantFeet[1]
            local indexMap = {
                ["Health"] = 2,
                ["Magicka"] = 3,
                ["Stamina"] = 4,
                ["Prismatic Defense"] = 5
            }
            OogleCraftArmorEnchantFeetDrop.dropdown:SetSelectedItem(choices[indexMap[enchantFeet] or 1])
        else
            OogleCraftArmorEnchantFeetDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorEnchantHandsDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantHands then
            local enchantHands = OogleCraft.savedVariables.desiredInfo.EnchantHands[1]
            local indexMap = {
                ["Health"] = 2,
                ["Magicka"] = 3,
                ["Stamina"] = 4,
                ["Prismatic Defense"] = 5
            }
            OogleCraftArmorEnchantHandsDrop.dropdown:SetSelectedItem(choices[indexMap[enchantHands] or 1])
        else
            OogleCraftArmorEnchantHandsDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorSetEnchantLegsSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantLegs then
            local enchantLegs = OogleCraft.savedVariables.desiredInfo.EnchantLegs[1]
            local indexMap = {
                ["Health"] = 2,
                ["Magicka"] = 3,
                ["Stamina"] = 4,
                ["Prismatic Defense"] = 5
            }
            OogleCraftArmorEnchantLegsDrop.dropdown:SetSelectedItem(choices[indexMap[enchantLegs] or 1])
        else
            OogleCraftArmorEnchantLegsDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorEnchantWaistDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantWaist then
            local enchantWaist = OogleCraft.savedVariables.desiredInfo.EnchantWaist[1]
            local indexMap = {
                ["Health"] = 2,
                ["Magicka"] = 3,
                ["Stamina"] = 4,
                ["Prismatic Defense"] = 5
            }
            OogleCraftArmorEnchantWaistDrop.dropdown:SetSelectedItem(choices[indexMap[enchantWaist] or 1])
        else
            OogleCraftArmorEnchantWaistDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorEnchantHeadDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantHead then
            local enchantHead = OogleCraft.savedVariables.desiredInfo.EnchantHead[1]
            local indexMap = {
                ["Health"] = 2,
                ["Magicka"] = 3,
                ["Stamina"] = 4,
                ["Prismatic Defense"] = 5
            }
            OogleCraftArmorEnchantHeadDrop.dropdown:SetSelectedItem(choices[indexMap[enchantHead] or 1])
        else
            OogleCraftArmorEnchantHeadDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ArmorEnchantShouldersDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantShoulders then
            local enchantShoulders = OogleCraft.savedVariables.desiredInfo.EnchantShoulders[1]
            local indexMap = {
                ["Health"] = 2,
                ["Magicka"] = 3,
                ["Stamina"] = 4,
                ["Prismatic Defense"] = 5
            }
            OogleCraftArmorEnchantShouldersDrop.dropdown:SetSelectedItem(choices[indexMap[enchantShoulders] or 1])
        else
            OogleCraftArmorEnchantShouldersDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetArmorEnchantSelection()
        OogleCraftArmorEnchantShieldDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorEnchantChestDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorEnchantFeetDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorEnchantHandsDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorEnchantLegsDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorEnchantWaistDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorEnchantHeadDrop.dropdown:SetSelectedItem(choices[1])
        OogleCraftArmorEnchantShouldersDrop.dropdown:SetSelectedItem(choices[1])
    end
end

function OogleCraft.PopulateArmorDropdowns()
    OogleCraft.ArmorQualityDropSelectedItem()

    OogleCraft.ArmorSetShieldDropSelectedItem()
    OogleCraft.ArmorSetChestDropSelectedItem()
    OogleCraft.ArmorSetFeetDropSelectedItem()
    OogleCraft.ArmorSetHandsDropSelectedItem()
    OogleCraft.ArmorSetLegsDropSelectedItem()
    OogleCraft.ArmorSetWaistDropSelectedItem()
    OogleCraft.ArmorSetHeadDropSelectedItem()
    OogleCraft.ArmorSetShouldersDropSelectedItem()

    OogleCraft.ArmorWeightChestDropSelectedItem()
    OogleCraft.ArmorWeightFeetDropSelectedItem()
    OogleCraft.ArmorWeightHandsDropSelectedItem()
    OogleCraft.ArmorWeightLegsDropSelectedItem()
    OogleCraft.ArmorWeightWaistDropSelectedItem()
    OogleCraft.ArmorWeightHeadDropSelectedItem()
    OogleCraft.ArmorWeightShouldersDropSelectedItem()

    OogleCraft.ArmorTraitShieldDropSelectedItem()
    OogleCraft.ArmorTraitChestDropSelectedItem()
    OogleCraft.ArmorTraitFeetDropSelectedItem()
    OogleCraft.ArmorTraitHandsDropSelectedItem()
    OogleCraft.ArmorSetTraitLegsSelectedItem()
    OogleCraft.ArmorTraitWaistDropSelectedItem()
    OogleCraft.ArmorTraitHeadDropSelectedItem()
    OogleCraft.ArmorTraitShouldersDropSelectedItem()

    OogleCraft.ArmorEnchantQualityDropSelectedItem()

    OogleCraft.ArmorEnchantShieldDropSelectedItem()
    OogleCraft.ArmorEnchantChestDropSelectedItem()
    OogleCraft.ArmorEnchantFeetDropSelectedItem()
    OogleCraft.ArmorEnchantHandsDropSelectedItem()
    OogleCraft.ArmorSetEnchantLegsSelectedItem()
    OogleCraft.ArmorEnchantWaistDropSelectedItem()
    OogleCraft.ArmorEnchantHeadDropSelectedItem()
    OogleCraft.ArmorEnchantShouldersDropSelectedItem()
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorSetQualityChoices = {"[Armor Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createArmorSetQualityDropdown("ArmorSetQuality", OogleCraftArmorSetQualityChoices, 0, 95, 640)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Set Choices --------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorSetShieldChoices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetChestChoices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetFeetChoices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetHandsChoices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetLegsChoices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetWaistChoices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetHeadChoices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetShouldersChoices = {"[Set#]", "Set #1", "Set #2", "Set #3"}

createArmorSetNumberDropdown("SetShield", OogleCraftArmorSetShieldChoices, 0, 125, 80)
createArmorSetNumberDropdown("SetChest", OogleCraftArmorSetChestChoices, 80, 125, 80)
createArmorSetNumberDropdown("SetFeet", OogleCraftArmorSetFeetChoices, 160, 125, 80)
createArmorSetNumberDropdown("SetHands", OogleCraftArmorSetHandsChoices, 240, 125, 80)
createArmorSetNumberDropdown("SetLegs", OogleCraftArmorSetLegsChoices, 320, 125, 80)
createArmorSetNumberDropdown("SetWaist", OogleCraftArmorSetWaistChoices, 400, 125, 80)
createArmorSetNumberDropdown("SetHead", OogleCraftArmorSetHeadChoices, 480, 125, 80)
createArmorSetNumberDropdown("SetShoulders", OogleCraftArmorSetShouldersChoices, 560, 125, 80)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Weight Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorWeightChestChoices = {"[Wgt.]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightFeetChoices = {"[Wgt.]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightHandsChoices = {"[Wgt.]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightLegsChoices = {"[Wgt.]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightWaistChoices = {"[Wgt.]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightHeadChoices = {"[Wgt.]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightShouldersChoices = {"[Wgt.]", "Light", "Medium", "Heavy"}

createArmorWeightDropdown("WeightChest", OogleCraftArmorWeightChestChoices, 80, 155, 80)
createArmorWeightDropdown("WeightFeet", OogleCraftArmorWeightFeetChoices, 160, 155, 80)
createArmorWeightDropdown("WeightHands", OogleCraftArmorWeightHandsChoices, 240, 155, 80)
createArmorWeightDropdown("WeightLegs", OogleCraftArmorWeightLegsChoices, 320, 155, 80)
createArmorWeightDropdown("WeightWaist", OogleCraftArmorWeightWaistChoices, 400, 155, 80)
createArmorWeightDropdown("WeightHead", OogleCraftArmorWeightHeadChoices, 480, 155, 80)
createArmorWeightDropdown("WeightShoulders", OogleCraftArmorWeightShouldersChoices, 560, 155, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Trait Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorTraitShieldChoices = {"[Trait]", "None", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitChestChoices = {"[Trait]", "None", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitFeetChoices = {"[Trait]", "None", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitHandsChoices = {"[Trait]", "None", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitLegsChoices = {"[Trait]", "None", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitWaistChoices = {"[Trait]", "None", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitHeadChoices = {"[Trait]", "None", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitShouldersChoices = {"[Trait]", "None", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}

createArmorTraitDropdown("TraitShield", OogleCraftArmorTraitShieldChoices, 0, 185, 80)
createArmorTraitDropdown("TraitChest", OogleCraftArmorTraitChestChoices, 80, 185, 80)
createArmorTraitDropdown("TraitFeet", OogleCraftArmorTraitFeetChoices, 160, 185, 80)
createArmorTraitDropdown("TraitHands", OogleCraftArmorTraitHandsChoices, 240, 185, 80)
createArmorTraitDropdown("TraitLegs", OogleCraftArmorTraitLegsChoices, 320, 185, 80)
createArmorTraitDropdown("TraitWaist", OogleCraftArmorTraitWaistChoices, 400, 185, 80)
createArmorTraitDropdown("TraitHead", OogleCraftArmorTraitHeadChoices, 480, 185, 80)
createArmorTraitDropdown("TraitShoulders", OogleCraftArmorTraitShouldersChoices, 560, 185, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorEnchantQualityChoices = {"[Armor Enchant Quality]", "None", "White", "Green", "Blue", "Purple", "Yellow"}

createArmorEnchantQualityDropdown("ArmorEnchantQuality", OogleCraftArmorEnchantQualityChoices, 0, 245, 640)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Enchant Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorEnchantShieldChoices = {"[Ench.]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantChestChoices = {"[Ench.]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantFeetChoices = {"[Ench.]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantHandsChoices = {"[Ench.]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantLegsChoices = {"[Ench.]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantWaistChoices = {"[Ench.]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantHeadChoices = {"[Ench.]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantShouldersChoices = {"[Ench.]", "Health", "Magicka", "Stamina", "Prismatic Defense"}

createArmorEnchantDropdown("EnchantShield", OogleCraftArmorEnchantShieldChoices, 0, 275, 80)
createArmorEnchantDropdown("EnchantChest", OogleCraftArmorEnchantChestChoices, 80, 275, 80)
createArmorEnchantDropdown("EnchantFeet", OogleCraftArmorEnchantFeetChoices, 160, 275, 80)
createArmorEnchantDropdown("EnchantHands", OogleCraftArmorEnchantHandsChoices, 240, 275, 80)
createArmorEnchantDropdown("EnchantLegs", OogleCraftArmorEnchantLegsChoices, 320, 275, 80)
createArmorEnchantDropdown("EnchantWaist", OogleCraftArmorEnchantWaistChoices, 400, 275, 80)
createArmorEnchantDropdown("EnchantHead", OogleCraftArmorEnchantHeadChoices, 480, 275, 80)
createArmorEnchantDropdown("EnchantShoulders", OogleCraftArmorEnchantShouldersChoices, 560, 275, 80)
