OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

_G.selectedItems = _G.selectedItems or {}

local wm = WINDOW_MANAGER

local function createDropdown(oogleCraftDropdownFrameName, choices, xOffset, yOffset, dropWide)
    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelry" .. oogleCraftDropdownFrameName .. "Drop", OogleCraftMainPanel, "ScrollCombobox")
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
--- Jewelry Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelrySetQualityChoices = {"[Jewelry Quality]", "White", "Green", "Blue", "Purple", "Yellow", "Orange"}

createDropdown("JewelrySetQuality", OogleCraftJewelrySetQualityChoices, 1000, 145, 375)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Set Choices ------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelrySetRing1Choices = {"[Ring #1]", "Set #1", "Set #2", "Set #3"}
local OogleCraftJewelrySetRing2Choices = {"[Ring #2]", "Set #1", "Set #2", "Set #3"}
local OogleCraftJewelrySetNecklaceChoices = {"[Necklace]", "Set #1", "Set #2", "Set #3"}

createDropdown("SetRing1", OogleCraftJewelrySetRing1Choices, 1000, 170, 125)
createDropdown("SetRing2", OogleCraftJewelrySetRing2Choices, 1125, 170, 125)
createDropdown("SetNecklace", OogleCraftJewelrySetNecklaceChoices, 1250, 170, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Trait Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryTraitRing1Choices = {"[Ring #1]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}
local OogleCraftJewelryTraitRing2Choices = {"[Ring #2]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}
local OogleCraftJewelryTraitNecklaceChoices = {"[Necklace]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}

createDropdown("TraitRing1", OogleCraftJewelryTraitRing1Choices, 1000, 320, 125)
createDropdown("TraitRing2", OogleCraftJewelryTraitRing2Choices, 1125, 320, 125)
createDropdown("TraitNecklace", OogleCraftJewelryTraitNecklaceChoices, 1250, 320, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryEnchantQualityChoices = {"[Jewelry Enchant Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createDropdown("JewelryEnchantQuality", OogleCraftJewelryEnchantQualityChoices, 1000, 395, 375)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Enchant Choices --------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryEnchantRing1Choices = {"[Ring #1]", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}
local OogleCraftJewelryEnchantRing2Choices = {"[Ring #2]", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}
local OogleCraftJewelryEnchantNecklaceChoices = {"[Necklace]", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}

createDropdown("EnchantRing1", OogleCraftJewelryEnchantRing1Choices, 1000, 420, 125)
createDropdown("EnchantRing2", OogleCraftJewelryEnchantRing2Choices, 1125, 420, 125)
createDropdown("EnchantNecklace", OogleCraftJewelryEnchantNecklaceChoices, 1250, 420, 125)
