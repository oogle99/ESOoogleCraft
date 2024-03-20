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

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponSetQualityChoices = {"[Weapon Quality]", "White", "Green", "Blue", "Purple", "Yellow", "Orange"}

createDropdown("WeaponSetQuality", OogleCraftWeaponSetQualityChoices, 880, 145, 320)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Set Choices -------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponSetFrontBar1Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetFrontBar2Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetBackBar1Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetBackBar2Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}

createDropdown("SetFrontBar1", OogleCraftWeaponSetFrontBar1Choices, 880, 170, 80)
createDropdown("SetFrontBar2", OogleCraftWeaponSetFrontBar2Choices, 960, 170, 80)
createDropdown("SetBackBar1", OogleCraftWeaponSetBackBar1Choices, 1040, 170, 80)
createDropdown("SetBackBar2", OogleCraftWeaponSetBackBar2Choices, 1120, 170, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Type Choices ------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponTypeFrontBar1Choices = {"[Type]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeFrontBar2Choices = {"[Type]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeBackBar1Choices = {"[Type]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeBackBar2Choices = {"[Type]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}

createDropdown("TypeFrontBar1", OogleCraftWeaponTypeFrontBar1Choices, 880, 245, 80)
createDropdown("TypeFrontBar2", OogleCraftWeaponTypeFrontBar2Choices, 960, 245, 80)
createDropdown("TypeBackBar1", OogleCraftWeaponTypeBackBar1Choices, 1040, 245, 80)
createDropdown("TypeBackBar2", OogleCraftWeaponTypeBackBar2Choices, 1120, 245, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Trait Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponTraitFrontBar1Choices = {"[Trait]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitFrontBar2Choices = {"[Trait]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitBackBar1Choices = {"[Trait]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitBackBar2Choices = {"[Trait]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}

createDropdown("TraitFrontBar1", OogleCraftWeaponTraitFrontBar1Choices, 880, 320, 80)
createDropdown("TraitFrontBar2", OogleCraftWeaponTraitFrontBar2Choices, 960, 320, 80)
createDropdown("TraitBackBar1", OogleCraftWeaponTraitBackBar1Choices, 1040, 320, 80)
createDropdown("TraitBackBar2", OogleCraftWeaponTraitBackBar2Choices, 1120, 320, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponEnchantQualityChoices = {"[Weapon Enchant Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createDropdown("WeaponEnchantQuality", OogleCraftWeaponEnchantQualityChoices, 880, 395, 320)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Enchant Choices ---------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponEnchantFrontBar1Choices = {"[Ench.]", "None", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantFrontBar2Choices = {"[Ench.]", "None", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantBackBar1Choices = {"[Ench.]", "None", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantBackBar2Choices = {"[Ench.]", "None", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}

createDropdown("EnchantFrontBar1", OogleCraftWeaponEnchantFrontBar1Choices, 880, 420, 80)
createDropdown("EnchantFrontBar2", OogleCraftWeaponEnchantFrontBar2Choices, 960, 420, 80)
createDropdown("EnchantBackBar1", OogleCraftWeaponEnchantBackBar1Choices, 1040, 420, 80)
createDropdown("EnchantBackBar2", OogleCraftWeaponEnchantBackBar2Choices, 1120, 420, 80)
