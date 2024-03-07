OogleCraft = {}
OogleCraft.name = "OogleCraft"

local wm = WINDOW_MANAGER

local function createDropdown(frameName, choices, xOffset, yOffset, dropWide)
    local frame = wm:CreateTopLevelWindow("OogleCraftArmor" .. frameName .. "DropWin")
    frame:SetAnchor(TOPLEFT)
    frame:SetDimensions(125, 50)

    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmor" .. frameName .. "Drop", frame, "ScrollCombobox")
    dropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, xOffset + 7, yOffset) -- y180
    dropdownContainer:GetNamedChild("Dropdown"):SetWidth(dropWide)

    local dropdown = dropdownContainer.dropdown
    dropdown:SetSelectedItem(choices[1])

    local function OnItemSelect(_, choiceText, choice)
        d(choiceText)
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

createDropdown("SetQuality", OogleCraftArmorSetQualityChoices, 0, 155, 1000)

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

createDropdown("SetShield", OogleCraftArmorSetShieldChoices, 0, 180, 125)
createDropdown("SetChest", OogleCraftArmorSetChestChoices, 125, 180, 125)
createDropdown("SetFeet", OogleCraftArmorSetFeetChoices, 250, 180, 125)
createDropdown("SetHands", OogleCraftArmorSetHandsChoices, 375, 180, 125)
createDropdown("SetLegs", OogleCraftArmorSetLegsChoices, 500, 180, 125)
createDropdown("SetWaist", OogleCraftArmorSetWaistChoices, 625, 180, 125)
createDropdown("SetHead", OogleCraftArmorSetHeadChoices, 750, 180, 125)
createDropdown("SetShoulders", OogleCraftArmorSetShouldersChoices, 875, 180, 125)

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

createDropdown("WeightChest", OogleCraftArmorWeightChestChoices, 125, 255, 125)
createDropdown("WeightFeet", OogleCraftArmorWeightFeetChoices, 250, 255, 125)
createDropdown("WeightHands", OogleCraftArmorWeightHandsChoices, 375, 255, 125)
createDropdown("WeightLegs", OogleCraftArmorWeightLegsChoices, 500, 255, 125)
createDropdown("WeightWaist", OogleCraftArmorWeightWaistChoices, 625, 255, 125)
createDropdown("WeightHead", OogleCraftArmorWeightHeadChoices, 750, 255, 125)
createDropdown("WeightShoulders", OogleCraftArmorWeightShouldersChoices, 875, 255, 125)

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

createDropdown("TraitShield", OogleCraftArmorTraitShieldChoices, 0, 330, 125)
createDropdown("TraitChest", OogleCraftArmorTraitChestChoices, 125, 330, 125)
createDropdown("TraitFeet", OogleCraftArmorTraitFeetChoices, 250, 330, 125)
createDropdown("TraitHands", OogleCraftArmorTraitHandsChoices, 375, 330, 125)
createDropdown("TraitLegs", OogleCraftArmorTraitLegsChoices, 500, 330, 125)
createDropdown("TraitWaist", OogleCraftArmorTraitWaistChoices, 625, 330, 125)
createDropdown("TraitHead", OogleCraftArmorTraitHeadChoices, 750, 330, 125)
createDropdown("TraitShoulders", OogleCraftArmorTraitShouldersChoices, 875, 330, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorEnchantQualityChoices = {"[Armor Enchant Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createDropdown("EnchantQuality", OogleCraftArmorEnchantQualityChoices, 0, 405, 1000)

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

createDropdown("EnchantShield", OogleCraftArmorEnchantShieldChoices, 0, 430, 125)
createDropdown("EnchantChest", OogleCraftArmorEnchantChestChoices, 125, 430, 125)
createDropdown("EnchantFeet", OogleCraftArmorEnchantFeetChoices, 250, 430, 125)
createDropdown("EnchantHands", OogleCraftArmorEnchantHandsChoices, 375, 430, 125)
createDropdown("EnchantLegs", OogleCraftArmorEnchantLegsChoices, 500, 430, 125)
createDropdown("EnchantWaist", OogleCraftArmorEnchantWaistChoices, 625, 430, 125)
createDropdown("EnchantHead", OogleCraftArmorEnchantHeadChoices, 750, 430, 125)
createDropdown("EnchantShoulders", OogleCraftArmorEnchantShouldersChoices, 875, 430, 125)
