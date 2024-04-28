OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

OogleCraft.savedVariables = OogleCraft.savedVariables or {}
OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}

local wm = WINDOW_MANAGER

local function createWeaponSetQualityDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    -- Creates the dropdown control with a (name, parent_control, inheritance)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeapon" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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
    function OogleCraft.WeaponSetQualityDropSelectedItem()
        -- Check if the nested table exists
        if OogleCraft.savedVariables.desiredInfo.WeaponSetQuality then
            -- If so, set the desired result to a variable for readabilty
            local weaponSetQuality = OogleCraft.savedVariables.desiredInfo.WeaponSetQuality[1]
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
            OogleCraftWeaponWeaponSetQualityDrop.dropdown:SetSelectedItem(choices[indexMap[weaponSetQuality] or 1])
        else
            -- If the savedVariables does not exist yet, set the selection to (choices[1])
            -- Also, you can get the specific name of each dropdown from the CreateControlFromVirtual() function
            -- The .dropdown is what handles the actual entries of the dropdowns
            OogleCraftWeaponWeaponSetQualityDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetWeaponSetQualitySelection()
        OogleCraftWeaponWeaponSetQualityDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createWeaponSetNumberDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeapon" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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

    function OogleCraft.WeaponSetFrontBar1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetFrontBar1 then
            local setFrontBar1 = OogleCraft.savedVariables.desiredInfo.SetFrontBar1[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftWeaponSetFrontBar1Drop.dropdown:SetSelectedItem(choices[indexMap[setFrontBar1] or 1])
        else
            OogleCraftWeaponSetFrontBar1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponSetFrontBar2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetFrontBar2 then
            local setFrontBar2 = OogleCraft.savedVariables.desiredInfo.SetFrontBar2[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftWeaponSetFrontBar2Drop.dropdown:SetSelectedItem(choices[indexMap[setFrontBar2] or 1])
        else
            OogleCraftWeaponSetFrontBar2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponSetBackBar1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetBackBar1 then
            local setBackBar1 = OogleCraft.savedVariables.desiredInfo.SetBackBar1[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftWeaponSetBackBar1Drop.dropdown:SetSelectedItem(choices[indexMap[setBackBar1] or 1])
        else
            OogleCraftWeaponSetBackBar1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponSetBackBar2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.SetBackBar2 then
            local setBackBar2 = OogleCraft.savedVariables.desiredInfo.SetBackBar2[1]
            local indexMap = {
                ["Set #1"] = 2,
                ["Set #2"] = 3,
                ["Set #3"] = 4
            }
            OogleCraftWeaponSetBackBar2Drop.dropdown:SetSelectedItem(choices[indexMap[setBackBar2] or 1])
        else
            OogleCraftWeaponSetBackBar2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetWeaponSetNumberSelection()
        OogleCraftWeaponSetFrontBar1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponSetFrontBar2Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponSetBackBar1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponSetBackBar2Drop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createWeaponTypeDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeapon" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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

    function OogleCraft.WeaponTypeFrontBar1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TypeFrontBar1 then
            local typeFrontBar1 = OogleCraft.savedVariables.desiredInfo.TypeFrontBar1[1]
            local indexMap = {
                ["Axe"] = 2,
                ["Mace"] = 3,
                ["Sword"] = 4,
                ["Battle Axe"] = 5,
                ["Maul"] = 6,
                ["Greatsword"] = 7,
                ["Dagger"] = 8,
                ["Bow"] = 9,
                ["Inferno"] = 10,
                ["Ice"] = 11,
                ["Lightning"] = 12,
                ["Restoration"] = 13
            }
            OogleCraftWeaponTypeFrontBar1Drop.dropdown:SetSelectedItem(choices[indexMap[typeFrontBar1] or 1])
        else
            OogleCraftWeaponTypeFrontBar1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponTypeFrontBar2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TypeFrontBar2 then
            local typeFrontBar2 = OogleCraft.savedVariables.desiredInfo.TypeFrontBar2[1]
            local indexMap = {
                ["Axe"] = 2,
                ["Mace"] = 3,
                ["Sword"] = 4,
                ["Battle Axe"] = 5,
                ["Maul"] = 6,
                ["Greatsword"] = 7,
                ["Dagger"] = 8,
                ["Bow"] = 9,
                ["Inferno"] = 10,
                ["Ice"] = 11,
                ["Lightning"] = 12,
                ["Restoration"] = 13
            }
            OogleCraftWeaponTypeFrontBar2Drop.dropdown:SetSelectedItem(choices[indexMap[typeFrontBar2] or 1])
        else
            OogleCraftWeaponTypeFrontBar2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponTypeBackBar1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TypeBackBar1 then
            local typeBackBar1 = OogleCraft.savedVariables.desiredInfo.TypeBackBar1[1]
            local indexMap = {
                ["Axe"] = 2,
                ["Mace"] = 3,
                ["Sword"] = 4,
                ["Battle Axe"] = 5,
                ["Maul"] = 6,
                ["Greatsword"] = 7,
                ["Dagger"] = 8,
                ["Bow"] = 9,
                ["Inferno"] = 10,
                ["Ice"] = 11,
                ["Lightning"] = 12,
                ["Restoration"] = 13
            }
            OogleCraftWeaponTypeBackBar1Drop.dropdown:SetSelectedItem(choices[indexMap[typeBackBar1] or 1])
        else
            OogleCraftWeaponTypeBackBar1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponTypeBackBar2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TypeBackBar2 then
            local typeBackBar2 = OogleCraft.savedVariables.desiredInfo.TypeBackBar2[1]
            local indexMap = {
                ["Axe"] = 2,
                ["Mace"] = 3,
                ["Sword"] = 4,
                ["Battle Axe"] = 5,
                ["Maul"] = 6,
                ["Greatsword"] = 7,
                ["Dagger"] = 8,
                ["Bow"] = 9,
                ["Inferno"] = 10,
                ["Ice"] = 11,
                ["Lightning"] = 12,
                ["Restoration"] = 13
            }
            OogleCraftWeaponTypeBackBar2Drop.dropdown:SetSelectedItem(choices[indexMap[typeBackBar2] or 1])
        else
            OogleCraftWeaponTypeBackBar2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetWeaponTypeSelection()
        OogleCraftWeaponTypeFrontBar1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponTypeFrontBar2Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponTypeBackBar1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponTypeBackBar2Drop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createWeaponTraitDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeapon" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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

    function OogleCraft.WeaponTraitFrontBar1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitFrontBar1 then
            local traitFrontBar1 = OogleCraft.savedVariables.desiredInfo.TraitFrontBar1[1]
            local indexMap = {
                ["None"] = 2,
                ["Powered"] = 3,
                ["Charged"] = 4,
                ["Precise"] = 5,
                ["Infused"] = 6,
                ["Defending"] = 7,
                ["Training"] = 8,
                ["Sharpened"] = 9,
                ["Decisive"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftWeaponTraitFrontBar1Drop.dropdown:SetSelectedItem(choices[indexMap[traitFrontBar1] or 1])
        else
            OogleCraftWeaponTraitFrontBar1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponTraitFrontBar2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitFrontBar2 then
            local traitFrontBar2 = OogleCraft.savedVariables.desiredInfo.TraitFrontBar2[1]
            local indexMap = {
                ["None"] = 2,
                ["Powered"] = 3,
                ["Charged"] = 4,
                ["Precise"] = 5,
                ["Infused"] = 6,
                ["Defending"] = 7,
                ["Training"] = 8,
                ["Sharpened"] = 9,
                ["Decisive"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftWeaponTraitFrontBar2Drop.dropdown:SetSelectedItem(choices[indexMap[traitFrontBar2] or 1])
        else
            OogleCraftWeaponTraitFrontBar2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponTraitBackBar1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitBackBar1 then
            local traitBackBar1 = OogleCraft.savedVariables.desiredInfo.TraitBackBar1[1]
            local indexMap = {
                ["None"] = 2,
                ["Powered"] = 3,
                ["Charged"] = 4,
                ["Precise"] = 5,
                ["Infused"] = 6,
                ["Defending"] = 7,
                ["Training"] = 8,
                ["Sharpened"] = 9,
                ["Decisive"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftWeaponTraitBackBar1Drop.dropdown:SetSelectedItem(choices[indexMap[traitBackBar1] or 1])
        else
            OogleCraftWeaponTraitBackBar1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponTraitBackBar2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.TraitBackBar2 then
            local traitBackBar2 = OogleCraft.savedVariables.desiredInfo.TraitBackBar2[1]
            local indexMap = {
                ["None"] = 2,
                ["Powered"] = 3,
                ["Charged"] = 4,
                ["Precise"] = 5,
                ["Infused"] = 6,
                ["Defending"] = 7,
                ["Training"] = 8,
                ["Sharpened"] = 9,
                ["Decisive"] = 10,
                ["Nirnhoned"] = 11
            }
            OogleCraftWeaponTraitBackBar2Drop.dropdown:SetSelectedItem(choices[indexMap[traitBackBar2] or 1])
        else
            OogleCraftWeaponTraitBackBar2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetWeaponTraitSelection()
        OogleCraftWeaponTraitFrontBar1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponTraitFrontBar2Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponTraitBackBar1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponTraitBackBar2Drop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createWeaponEnchantQualityDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeapon" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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

    function OogleCraft.WeaponEnchantQualityDropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.WeaponEnchantQuality then
            local weaponEnchantQuality = OogleCraft.savedVariables.desiredInfo.WeaponEnchantQuality[1]
            local indexMap = {
                None = 2,
                White = 3,
                Green = 4,
                Blue = 5,
                Purple = 6,
                Yellow = 7
            }
            OogleCraftWeaponWeaponEnchantQualityDrop.dropdown:SetSelectedItem(choices[indexMap[weaponEnchantQuality] or 1])
        else
            OogleCraftWeaponWeaponEnchantQualityDrop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetWeaponEnchantQualitySelection()
        OogleCraftWeaponWeaponEnchantQualityDrop.dropdown:SetSelectedItem(choices[1])
    end
end

local function createWeaponEnchantDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeapon" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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

    function OogleCraft.WeaponEnchantFrontBar1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantFrontBar1 then
            local enchantFrontBar1 = OogleCraft.savedVariables.desiredInfo.EnchantFrontBar1[1]
            local indexMap = {
                ["Absorb Health"] = 2,
                ["Absorb Magicka"] = 3,
                ["Absorb Stamina"] = 4,
                ["Decrease Health"] = 5,
                ["Poison"] = 6,
                ["Flame"] = 7,
                ["Frost"] = 8,
                ["Shock"] = 9,
                ["Foulness"] = 10,
                ["Crushing"] = 11,
                ["Weakening"] = 12,
                ["Weapon Damage"] = 13,
                ["Prismatic Onslaught"] = 14
            }
            OogleCraftWeaponEnchantFrontBar1Drop.dropdown:SetSelectedItem(choices[indexMap[enchantFrontBar1] or 1])
        else
            OogleCraftWeaponEnchantFrontBar1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponEnchantFrontBar2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantFrontBar2 then
            local enchantFrontBar2 = OogleCraft.savedVariables.desiredInfo.EnchantFrontBar2[1]
            local indexMap = {
                ["Absorb Health"] = 2,
                ["Absorb Magicka"] = 3,
                ["Absorb Stamina"] = 4,
                ["Decrease Health"] = 5,
                ["Poison"] = 6,
                ["Flame"] = 7,
                ["Frost"] = 8,
                ["Shock"] = 9,
                ["Foulness"] = 10,
                ["Crushing"] = 11,
                ["Weakening"] = 12,
                ["Weapon Damage"] = 13,
                ["Prismatic Onslaught"] = 14
            }
            OogleCraftWeaponEnchantFrontBar2Drop.dropdown:SetSelectedItem(choices[indexMap[enchantFrontBar2] or 1])
        else
            OogleCraftWeaponEnchantFrontBar2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponEnchantBackBar1DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantBackBar1 then
            local enchantBackBar1 = OogleCraft.savedVariables.desiredInfo.EnchantBackBar1[1]
            local indexMap = {
                ["Absorb Health"] = 2,
                ["Absorb Magicka"] = 3,
                ["Absorb Stamina"] = 4,
                ["Decrease Health"] = 5,
                ["Poison"] = 6,
                ["Flame"] = 7,
                ["Frost"] = 8,
                ["Shock"] = 9,
                ["Foulness"] = 10,
                ["Crushing"] = 11,
                ["Weakening"] = 12,
                ["Weapon Damage"] = 13,
                ["Prismatic Onslaught"] = 14
            }
            OogleCraftWeaponEnchantBackBar1Drop.dropdown:SetSelectedItem(choices[indexMap[enchantBackBar1] or 1])
        else
            OogleCraftWeaponEnchantBackBar1Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.WeaponEnchantBackBar2DropSelectedItem()
        if OogleCraft.savedVariables.desiredInfo.EnchantBackBar2 then
            local enchantBackBar2 = OogleCraft.savedVariables.desiredInfo.EnchantBackBar2[1]
            local indexMap = {
                ["Absorb Health"] = 2,
                ["Absorb Magicka"] = 3,
                ["Absorb Stamina"] = 4,
                ["Decrease Health"] = 5,
                ["Poison"] = 6,
                ["Flame"] = 7,
                ["Frost"] = 8,
                ["Shock"] = 9,
                ["Foulness"] = 10,
                ["Crushing"] = 11,
                ["Weakening"] = 12,
                ["Weapon Damage"] = 13,
                ["Prismatic Onslaught"] = 14
            }
            OogleCraftWeaponEnchantBackBar2Drop.dropdown:SetSelectedItem(choices[indexMap[enchantBackBar2] or 1])
        else
            OogleCraftWeaponEnchantBackBar2Drop.dropdown:SetSelectedItem(choices[1])
        end
    end

    function OogleCraft.ResetWeaponEnchantSelection()
        OogleCraftWeaponEnchantFrontBar1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponEnchantFrontBar2Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponEnchantBackBar1Drop.dropdown:SetSelectedItem(choices[1])
        OogleCraftWeaponEnchantBackBar2Drop.dropdown:SetSelectedItem(choices[1])
    end
end

function OogleCraft.PopulateWeaponDropdowns()
    OogleCraft.WeaponSetQualityDropSelectedItem()

    OogleCraft.WeaponSetFrontBar1DropSelectedItem()
    OogleCraft.WeaponSetFrontBar2DropSelectedItem()
    OogleCraft.WeaponSetBackBar1DropSelectedItem()
    OogleCraft.WeaponSetBackBar2DropSelectedItem()

    OogleCraft.WeaponTypeFrontBar1DropSelectedItem()
    OogleCraft.WeaponTypeFrontBar2DropSelectedItem()
    OogleCraft.WeaponTypeBackBar1DropSelectedItem()
    OogleCraft.WeaponTypeBackBar2DropSelectedItem()

    OogleCraft.WeaponTraitFrontBar1DropSelectedItem()
    OogleCraft.WeaponTraitFrontBar2DropSelectedItem()
    OogleCraft.WeaponTraitBackBar1DropSelectedItem()
    OogleCraft.WeaponTraitBackBar2DropSelectedItem()

    OogleCraft.WeaponEnchantQualityDropSelectedItem()

    OogleCraft.WeaponEnchantFrontBar1DropSelectedItem()
    OogleCraft.WeaponEnchantFrontBar2DropSelectedItem()
    OogleCraft.WeaponEnchantBackBar1DropSelectedItem()
    OogleCraft.WeaponEnchantBackBar2DropSelectedItem()
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponSetQualityChoices = {"[Weapon Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createWeaponSetQualityDropdown("WeaponSetQuality", OogleCraftWeaponSetQualityChoices, 880, 95, 320)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Set Choices -------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponSetFrontBar1Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetFrontBar2Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetBackBar1Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetBackBar2Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}

createWeaponSetNumberDropdown("SetFrontBar1", OogleCraftWeaponSetFrontBar1Choices, 880, 125, 80)
createWeaponSetNumberDropdown("SetFrontBar2", OogleCraftWeaponSetFrontBar2Choices, 960, 125, 80)
createWeaponSetNumberDropdown("SetBackBar1", OogleCraftWeaponSetBackBar1Choices, 1040, 125, 80)
createWeaponSetNumberDropdown("SetBackBar2", OogleCraftWeaponSetBackBar2Choices, 1120, 125, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Type Choices ------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponTypeFrontBar1Choices = {"[Type]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeFrontBar2Choices = {"[Type]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeBackBar1Choices = {"[Type]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeBackBar2Choices = {"[Type]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}

createWeaponTypeDropdown("TypeFrontBar1", OogleCraftWeaponTypeFrontBar1Choices, 880, 155, 80)
createWeaponTypeDropdown("TypeFrontBar2", OogleCraftWeaponTypeFrontBar2Choices, 960, 155, 80)
createWeaponTypeDropdown("TypeBackBar1", OogleCraftWeaponTypeBackBar1Choices, 1040, 155, 80)
createWeaponTypeDropdown("TypeBackBar2", OogleCraftWeaponTypeBackBar2Choices, 1120, 155, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Trait Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponTraitFrontBar1Choices = {"[Trait]", "None", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitFrontBar2Choices = {"[Trait]", "None", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitBackBar1Choices = {"[Trait]", "None", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitBackBar2Choices = {"[Trait]", "None", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}

createWeaponTraitDropdown("TraitFrontBar1", OogleCraftWeaponTraitFrontBar1Choices, 880, 185, 80)
createWeaponTraitDropdown("TraitFrontBar2", OogleCraftWeaponTraitFrontBar2Choices, 960, 185, 80)
createWeaponTraitDropdown("TraitBackBar1", OogleCraftWeaponTraitBackBar1Choices, 1040, 185, 80)
createWeaponTraitDropdown("TraitBackBar2", OogleCraftWeaponTraitBackBar2Choices, 1120, 185, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponEnchantQualityChoices = {"[Weapon Enchant Quality]", "None", "White", "Green", "Blue", "Purple", "Yellow"}

createWeaponEnchantQualityDropdown("WeaponEnchantQuality", OogleCraftWeaponEnchantQualityChoices, 880, 245, 320)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Enchant Choices ---------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponEnchantFrontBar1Choices = {"[Ench.]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantFrontBar2Choices = {"[Ench.]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantBackBar1Choices = {"[Ench.]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantBackBar2Choices = {"[Ench.]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}

createWeaponEnchantDropdown("EnchantFrontBar1", OogleCraftWeaponEnchantFrontBar1Choices, 880, 275, 80)
createWeaponEnchantDropdown("EnchantFrontBar2", OogleCraftWeaponEnchantFrontBar2Choices, 960, 275, 80)
createWeaponEnchantDropdown("EnchantBackBar1", OogleCraftWeaponEnchantBackBar1Choices, 1040, 275, 80)
createWeaponEnchantDropdown("EnchantBackBar2", OogleCraftWeaponEnchantBackBar2Choices, 1120, 275, 80)
