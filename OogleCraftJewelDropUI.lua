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
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelrySetQualityChoices = {"[Jewelry Quality]", "White", "Green", "Blue", "Purple", "Yellow", "Orange"}

createDropdown("JewelrySetQuality", OogleCraftJewelrySetQualityChoices, 640, 145, 240)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Set Choices ------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelrySetRing1Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftJewelrySetRing2Choices = {"[Set#]", "Set #1", "Set #2", "Set #3"}
local OogleCraftJewelrySetNecklaceChoices = {"[Set#]", "Set #1", "Set #2", "Set #3"}

createDropdown("SetRing1", OogleCraftJewelrySetRing1Choices, 640, 170, 80)
createDropdown("SetRing2", OogleCraftJewelrySetRing2Choices, 720, 170, 80)
createDropdown("SetNecklace", OogleCraftJewelrySetNecklaceChoices, 800, 170, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Trait Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryTraitRing1Choices = {"[Trait]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}
local OogleCraftJewelryTraitRing2Choices = {"[Trait]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}
local OogleCraftJewelryTraitNecklaceChoices = {"[Trait]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}

createDropdown("TraitRing1", OogleCraftJewelryTraitRing1Choices, 640, 320, 80)
createDropdown("TraitRing2", OogleCraftJewelryTraitRing2Choices, 720, 320, 80)
createDropdown("TraitNecklace", OogleCraftJewelryTraitNecklaceChoices, 800, 320, 80)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryEnchantQualityChoices = {"[Jewelry Enchant Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createDropdown("JewelryEnchantQuality", OogleCraftJewelryEnchantQualityChoices, 640, 395, 240)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Enchant Choices --------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryEnchantRing1Choices = {"[Ench.]", "None", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}
local OogleCraftJewelryEnchantRing2Choices = {"[Ench.]", "None", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}
local OogleCraftJewelryEnchantNecklaceChoices = {"[Ench.]", "None", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}

createDropdown("EnchantRing1", OogleCraftJewelryEnchantRing1Choices, 640, 420, 80)
createDropdown("EnchantRing2", OogleCraftJewelryEnchantRing2Choices, 720, 420, 80)
createDropdown("EnchantNecklace", OogleCraftJewelryEnchantNecklaceChoices, 800, 420, 80)
