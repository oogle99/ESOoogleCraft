OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

_G.selectedItems = _G.selectedItems or {}

local wm = WINDOW_MANAGER

local function createDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeapon" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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
            if item ~= choiceText then
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

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponSetQualityChoices = {"[Weapon Quality]", "White", "Green", "Blue", "Purple", "Yellow", "Orange"}

createDropdown("WeaponSetQuality", OogleCraftWeaponSetQualityChoices, 1375, 145, 500)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Set Choices -------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponSetFrontBar1Choices = {"[Front Bar #1]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetFrontBar2Choices = {"[Front Bar #1]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetBackBar1Choices = {"[Front Bar #1]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetBackBar2Choices = {"[Front Bar #1]", "Set #1", "Set #2", "Set #3"}

createDropdown("SetFrontBar1", OogleCraftWeaponSetFrontBar1Choices, 1375, 170, 125)
createDropdown("SetFrontBar2", OogleCraftWeaponSetFrontBar2Choices, 1500, 170, 125)
createDropdown("SetBackBar1", OogleCraftWeaponSetBackBar1Choices, 1625, 170, 125)
createDropdown("SetBackBar2", OogleCraftWeaponSetBackBar2Choices, 1750, 170, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Type Choices ------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponTypeFrontBar1Choices = {"[Front Bar #1]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeFrontBar2Choices = {"[Front Bar #2]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeBackBar1Choices = {"[Back Bar #1]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeBackBar2Choices = {"[Back Bar #2]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}

createDropdown("TypeFrontBar1", OogleCraftWeaponTypeFrontBar1Choices, 1375, 245, 125)
createDropdown("TypeFrontBar2", OogleCraftWeaponTypeFrontBar2Choices, 1500, 245, 125)
createDropdown("TypeBackBar1", OogleCraftWeaponTypeBackBar1Choices, 1625, 245, 125)
createDropdown("TypeBackBar2", OogleCraftWeaponTypeBackBar2Choices, 1750, 245, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Trait Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponTraitFrontBar1Choices = {"[Front Bar #1]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitFrontBar2Choices = {"[Front Bar #2]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitBackBar1Choices = {"[Back Bar #1]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitBackBar2Choices = {"[Back Bar #2]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}

createDropdown("TraitFrontBar1", OogleCraftWeaponTraitFrontBar1Choices, 1375, 320, 125)
createDropdown("TraitFrontBar2", OogleCraftWeaponTraitFrontBar2Choices, 1500, 320, 125)
createDropdown("TraitBackBar1", OogleCraftWeaponTraitBackBar1Choices, 1625, 320, 125)
createDropdown("TraitBackBar2", OogleCraftWeaponTraitBackBar2Choices, 1750, 320, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponEnchantQualityChoices = {"[Weapon Enchant Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createDropdown("WeaponEnchantQuality", OogleCraftWeaponEnchantQualityChoices, 1375, 395, 500)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Enchant Choices ---------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponEnchantFrontBar1Choices = {"[Front Bar #1]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantFrontBar2Choices = {"[Front Bar #2]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantBackBar1Choices = {"[Back Bar #1]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantBackBar2Choices = {"[Back Bar #2]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}

createDropdown("EnchantFrontBar1", OogleCraftWeaponEnchantFrontBar1Choices, 1375, 420, 125)
createDropdown("EnchantFrontBar2", OogleCraftWeaponEnchantFrontBar2Choices, 1500, 420, 125)
createDropdown("EnchantBackBar1", OogleCraftWeaponEnchantBackBar1Choices, 1625, 420, 125)
createDropdown("EnchantBackBar2", OogleCraftWeaponEnchantBackBar2Choices, 1750, 420, 125)
