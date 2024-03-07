OogleCraft = {}
OogleCraft.name = "OogleCraft"

local wm = WINDOW_MANAGER

local function createDropdown(frameName, choices, xOffset, yOffset, dropWide)
    local frame = wm:CreateTopLevelWindow("OogleCraftJewelry" .. frameName .. "DropWin")
    frame:SetAnchor(TOPLEFT)
    frame:SetDimensions(125, 50)

    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelry" .. frameName .. "Drop", frame, "ScrollCombobox")
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
--- Jewelry Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelrySetQualityChoices = {"[Jewelry Quality]", "White", "Green", "Blue", "Purple", "Yellow", "Orange"}

createDropdown("SetQuality", OogleCraftJewelrySetQualityChoices, 1000, 155, 375)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Set Choices ------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelrySetRing1Choices = {"[Ring #1]", "Set #1", "Set #2", "Set #3"}
local OogleCraftJewelrySetRing2Choices = {"[Ring #2]", "Set #1", "Set #2", "Set #3"}
local OogleCraftJewelrySetNecklaceChoices = {"[Necklace]", "Set #1", "Set #2", "Set #3"}

createDropdown("SetRing1", OogleCraftJewelrySetRing1Choices, 1000, 180, 125)
createDropdown("SetRing2", OogleCraftJewelrySetRing2Choices, 1125, 180, 125)
createDropdown("SetNecklace", OogleCraftJewelrySetNecklaceChoices, 1250, 180, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Trait Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryTraitRing1Choices = {"[Ring #1]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}
local OogleCraftJewelryTraitRing2Choices = {"[Ring #2]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}
local OogleCraftJewelryTraitNecklaceChoices = {"[Necklace]", "Arcane", "Healthy", "Robust", "Triune", "Infused", "Protective", "Swift", "Harmony", "Bloodthirsty"}

createDropdown("TraitRing1", OogleCraftJewelryTraitRing1Choices, 1000, 330, 125)
createDropdown("TraitRing2", OogleCraftJewelryTraitRing2Choices, 1125, 330, 125)
createDropdown("TraitNecklace", OogleCraftJewelryTraitNecklaceChoices, 1250, 330, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryEnchantQualityChoices = {"[Jewelry Enchant Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createDropdown("EnchantQuality", OogleCraftJewelryEnchantQualityChoices, 1000, 405, 375)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Enchant Choices --------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryEnchantRing1Choices = {"[Ring #1]", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}
local OogleCraftJewelryEnchantRing2Choices = {"[Ring #2]", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}
local OogleCraftJewelryEnchantNecklaceChoices = {"[Necklace]", "Health Recovery", "Reduce Spell Cost", "Magicka Recovery", "Reduce Feat Cost", "Stamina Recovery", "Poison Resist", "Flame Resist", "Frost Resist", "Shock Resist", "Disease Resist", "Potion Speed", "Potion Boost", "Decrease Physical Harm", "Increase Physical Harm", "Decrease Spell Harm", "Increase Magical Harm", "Shielding", "Bashing", "Reduce Skill Cost", "Prismatic Recovery"}

createDropdown("EnchantRing1", OogleCraftJewelryEnchantRing1Choices, 1000, 430, 125)
createDropdown("EnchantRing2", OogleCraftJewelryEnchantRing2Choices, 1125, 430, 125)
createDropdown("EnchantNecklace", OogleCraftJewelryEnchantNecklaceChoices, 1250, 430, 125)
