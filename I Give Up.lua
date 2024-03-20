OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"


--_G.selectedItems = _G.selectedItems or {}

OogleCraft.savedVariables = OogleCraft.savedVariables or {}
OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}
--OogleCraft.variableHolder = OogleCraft.savedVariables.selectedItems or {}
--    /script d(OogleCraft.savedVariables.desiredInfo["TraitShield"][1])
local wm = WINDOW_MANAGER

local function createDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide, savedVariables)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmor" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
    dropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, xOffset + 7, yOffset)
    dropdownContainer:SetDimensions(125, 50)
    dropdownContainer:GetNamedChild("Dropdown"):SetWidth(dropWide)

    local savedVariables = savedVariables or OogleCraft.savedVariables
    local dropdown = dropdownContainer.dropdown

    local dropdownFrameData = savedVariables.desiredInfo[oogleCraftDropdownFrameName]
    if dropdownFrameData ~= nil and dropdownFrameData[1] ~= nil then
        dropdown:SetSelectedItem(dropdownFrameData[1])
    else
        dropdown:SetSelectedItem(choices[1])
    end
    

    dropdown:SetSortsItems(false)

    local function OnItemSelect(_, choiceText, choice)
        savedVariables.desiredInfo = savedVariables.desiredInfo or {}
        -- Ensure the choices for the dropdown are stored
        -- Check if the table for the current dropdown frame exists, if not, create it
        savedVariables.desiredInfo[oogleCraftDropdownFrameName] = savedVariables.desiredInfo[oogleCraftDropdownFrameName] or {}
    
        -- Check if the selected item does not already exist for the current dropdown frame
        for i, item in ipairs(savedVariables.desiredInfo[oogleCraftDropdownFrameName]) do
            if item ~= choiceText or item == choiceText then
                -- Remove the existing item from the table
                table.remove(savedVariables.desiredInfo[oogleCraftDropdownFrameName], i)
                break -- Exit the loop once the item is removed
            end
        end
        
        -- Store the selected item in the table corresponding to the current dropdown frame
        table.insert(savedVariables.desiredInfo[oogleCraftDropdownFrameName], choiceText)
        d(oogleCraftDropdownFrameName, choiceText)

    
        --[[
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
        --]]
    end
    
    for i=1,#choices do
        local entry = dropdown:CreateItemEntry(choices[i], OnItemSelect) -- [, OnItemSelect]
        dropdown:AddItem(entry)
    end
    
    
    
    
end

-- Add the Icon to the Background and shrink the width to HOPEFULLY match

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorSetQualityChoices = {"[Armor Quality]", "White", "Green", "Blue", "Purple", "Yellow", "Orange"}

createDropdown("ArmorSetQuality", OogleCraftArmorSetQualityChoices, 0, 145, 640, OogleCraft.savedVariables)

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

createDropdown("SetShield", OogleCraftArmorSetShieldChoices, 0, 170, 80)
createDropdown("SetChest", OogleCraftArmorSetChestChoices, 80, 170, 80)
createDropdown("SetFeet", OogleCraftArmorSetFeetChoices, 160, 170, 80)
createDropdown("SetHands", OogleCraftArmorSetHandsChoices, 240, 170, 80)
createDropdown("SetLegs", OogleCraftArmorSetLegsChoices, 320, 170, 80)
createDropdown("SetWaist", OogleCraftArmorSetWaistChoices, 400, 170, 80)
createDropdown("SetHead", OogleCraftArmorSetHeadChoices, 480, 170, 80)
createDropdown("SetShoulders", OogleCraftArmorSetShouldersChoices, 560, 170, 80)

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

createDropdown("WeightChest", OogleCraftArmorWeightChestChoices, 80, 245, 80)
createDropdown("WeightFeet", OogleCraftArmorWeightFeetChoices, 160, 245, 80)
createDropdown("WeightHands", OogleCraftArmorWeightHandsChoices, 240, 245, 80)
createDropdown("WeightLegs", OogleCraftArmorWeightLegsChoices, 320, 245, 80)
createDropdown("WeightWaist", OogleCraftArmorWeightWaistChoices, 400, 245, 80)
createDropdown("WeightHead", OogleCraftArmorWeightHeadChoices, 480, 245, 80)
createDropdown("WeightShoulders", OogleCraftArmorWeightShouldersChoices, 560, 245, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Trait Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorTraitShieldChoices = {"[Trait]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitChestChoices = {"[Trait]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitFeetChoices = {"[Trait]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitHandsChoices = {"[Trait]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitLegsChoices = {"[Trait]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitWaistChoices = {"[Trait]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitHeadChoices = {"[Trait]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}
local OogleCraftArmorTraitShouldersChoices = {"[Trait]", "Sturdy", "Impenetrable", "Reinforced", "Well-fitted", "Training", "Infused", "Invigorating", "Divines", "Nirnhoned"}

createDropdown("TraitShield", OogleCraftArmorTraitShieldChoices, 0, 320, 80)
createDropdown("TraitChest", OogleCraftArmorTraitChestChoices, 80, 320, 80)
createDropdown("TraitFeet", OogleCraftArmorTraitFeetChoices, 160, 320, 80)
createDropdown("TraitHands", OogleCraftArmorTraitHandsChoices, 240, 320, 80)
createDropdown("TraitLegs", OogleCraftArmorTraitLegsChoices, 320, 320, 80)
createDropdown("TraitWaist", OogleCraftArmorTraitWaistChoices, 400, 320, 80)
createDropdown("TraitHead", OogleCraftArmorTraitHeadChoices, 480, 320, 80)
createDropdown("TraitShoulders", OogleCraftArmorTraitShouldersChoices, 560, 320, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorEnchantQualityChoices = {"[Armor Enchant Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createDropdown("ArmorEnchantQuality", OogleCraftArmorEnchantQualityChoices, 0, 395, 640)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Enchant Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorEnchantShieldChoices = {"[Ench.]", "None", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantChestChoices = {"[Ench.]", "None", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantFeetChoices = {"[Ench.]", "None", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantHandsChoices = {"[Ench.]", "None", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantLegsChoices = {"[Ench.]", "None", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantWaistChoices = {"[Ench.]", "None", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantHeadChoices = {"[Ench.]", "None", "Health", "Magicka", "Stamina", "Prismatic Defense"}
local OogleCraftArmorEnchantShouldersChoices = {"[Ench.]", "None", "Health", "Magicka", "Stamina", "Prismatic Defense"}

createDropdown("EnchantShield", OogleCraftArmorEnchantShieldChoices, 0, 420, 80)
createDropdown("EnchantChest", OogleCraftArmorEnchantChestChoices, 80, 420, 80)
createDropdown("EnchantFeet", OogleCraftArmorEnchantFeetChoices, 160, 420, 80)
createDropdown("EnchantHands", OogleCraftArmorEnchantHandsChoices, 240, 420, 80)
createDropdown("EnchantLegs", OogleCraftArmorEnchantLegsChoices, 320, 420, 80)
createDropdown("EnchantWaist", OogleCraftArmorEnchantWaistChoices, 400, 420, 80)
createDropdown("EnchantHead", OogleCraftArmorEnchantHeadChoices, 480, 420, 80)
createDropdown("EnchantShoulders", OogleCraftArmorEnchantShouldersChoices, 560, 420, 80)
