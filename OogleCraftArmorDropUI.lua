OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

_G.selectedItems = _G.selectedItems or {}

local wm = WINDOW_MANAGER

local function createDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmor" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorSetQualityChoices = {"[Armor Quality]", "White", "Green", "Blue", "Purple", "Yellow", "Orange"}

createDropdown("ArmorSetQuality", OogleCraftArmorSetQualityChoices, 0, 145, 1000)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Set Choices --------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorSetShieldChoices = {"[Shield]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetChestChoices = {"[Chest]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetFeetChoices = {"[Feet]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetHandsChoices = {"[Hands]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetLegsChoices = {"[Legs]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetWaistChoices = {"[Waist]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetHeadChoices = {"[Head]", "Set #1", "Set #2", "Set #3"}
local OogleCraftArmorSetShouldersChoices = {"[Shoulders]", "Set #1", "Set #2", "Set #3"}

createDropdown("SetShield", OogleCraftArmorSetShieldChoices, 0, 170, 125)
createDropdown("SetChest", OogleCraftArmorSetChestChoices, 125, 170, 125)
createDropdown("SetFeet", OogleCraftArmorSetFeetChoices, 250, 170, 125)
createDropdown("SetHands", OogleCraftArmorSetHandsChoices, 375, 170, 125)
createDropdown("SetLegs", OogleCraftArmorSetLegsChoices, 500, 170, 125)
createDropdown("SetWaist", OogleCraftArmorSetWaistChoices, 625, 170, 125)
createDropdown("SetHead", OogleCraftArmorSetHeadChoices, 750, 170, 125)
createDropdown("SetShoulders", OogleCraftArmorSetShouldersChoices, 875, 170, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Weight Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorWeightChestChoices = {"[Chest]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightFeetChoices = {"[Feet]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightHandsChoices = {"[Hands]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightLegsChoices = {"[Legs]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightWaistChoices = {"[Waist]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightHeadChoices = {"[Head]", "Light", "Medium", "Heavy"}
local OogleCraftArmorWeightShouldersChoices = {"[Shoulders]", "Light", "Medium", "Heavy"}

createDropdown("WeightChest", OogleCraftArmorWeightChestChoices, 125, 245, 125)
createDropdown("WeightFeet", OogleCraftArmorWeightFeetChoices, 250, 245, 125)
createDropdown("WeightHands", OogleCraftArmorWeightHandsChoices, 375, 245, 125)
createDropdown("WeightLegs", OogleCraftArmorWeightLegsChoices, 500, 245, 125)
createDropdown("WeightWaist", OogleCraftArmorWeightWaistChoices, 625, 245, 125)
createDropdown("WeightHead", OogleCraftArmorWeightHeadChoices, 750, 245, 125)
createDropdown("WeightShoulders", OogleCraftArmorWeightShouldersChoices, 875, 245, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Trait Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorTraitShieldChoices = {"[Shield]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitChestChoices = {"[Chest]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitFeetChoices = {"[Feet]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitHandsChoices = {"[Hands]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitLegsChoices = {"[Legs]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitWaistChoices = {"[Waist]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitHeadChoices = {"[Head]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitShouldersChoices = {"[Shoulders]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}

createDropdown("TraitShield", OogleCraftArmorTraitShieldChoices, 0, 320, 125)
createDropdown("TraitChest", OogleCraftArmorTraitChestChoices, 125, 320, 125)
createDropdown("TraitFeet", OogleCraftArmorTraitFeetChoices, 250, 320, 125)
createDropdown("TraitHands", OogleCraftArmorTraitHandsChoices, 375, 320, 125)
createDropdown("TraitLegs", OogleCraftArmorTraitLegsChoices, 500, 320, 125)
createDropdown("TraitWaist", OogleCraftArmorTraitWaistChoices, 625, 320, 125)
createDropdown("TraitHead", OogleCraftArmorTraitHeadChoices, 750, 320, 125)
createDropdown("TraitShoulders", OogleCraftArmorTraitShouldersChoices, 875, 320, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorEnchantQualityChoices = {"[Armor Enchant Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createDropdown("ArmorEnchantQuality", OogleCraftArmorEnchantQualityChoices, 0, 395, 1000)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Enchant Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorEnchantShieldChoices = {"[Shield]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantChestChoices = {"[Chest]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantFeetChoices = {"[Feet]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantHandsChoices = {"[Hands]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantLegsChoices = {"[Legs]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantWaistChoices = {"[Waist]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantHeadChoices = {"[Head]", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantShouldersChoices = {"[Shoulders]", "Health", "Magicka", "Stamina", "Prismatic Defense"}

createDropdown("EnchantShield", OogleCraftArmorEnchantShieldChoices, 0, 420, 125)
createDropdown("EnchantChest", OogleCraftArmorEnchantChestChoices, 125, 420, 125)
createDropdown("EnchantFeet", OogleCraftArmorEnchantFeetChoices, 250, 420, 125)
createDropdown("EnchantHands", OogleCraftArmorEnchantHandsChoices, 375, 420, 125)
createDropdown("EnchantLegs", OogleCraftArmorEnchantLegsChoices, 500, 420, 125)
createDropdown("EnchantWaist", OogleCraftArmorEnchantWaistChoices, 625, 420, 125)
createDropdown("EnchantHead", OogleCraftArmorEnchantHeadChoices, 750, 420, 125)
createDropdown("EnchantShoulders", OogleCraftArmorEnchantShouldersChoices, 875, 420, 125)
