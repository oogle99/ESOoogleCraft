OogleCraft = {}
OogleCraft.name = "OogleCraft"

local wm = WINDOW_MANAGER

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local OogleCraftJewelrySetQualityChoices = {
    "[Jewelry Quality]",
    "White",
    "Green",
    "Blue",
    "Purple",
    "Yellow",
    "Orange"
}

local OogleCraftJewelrySetQualityFrame = wm:CreateTopLevelWindow("OogleCraftJewelrySetQualityDropWin")
    OogleCraftJewelrySetQualityFrame:SetAnchor(TOPLEFT)
    OogleCraftJewelrySetQualityFrame:SetDimensions(125, 50)
local OogleCraftJewelrySetQualityDropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelrySetQualityDrop", OogleCraftJewelrySetQualityFrame, "ScrollCombobox")
    OogleCraftJewelrySetQualityDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1000 + 7, 155)
    OogleCraftJewelrySetQualityDropdownContainer:GetNamedChild("Dropdown"):SetWidth(375)
-- local selected = OogleCraftJewelrySetQualityDropdownContainer.name
local JewelrySetQualityDropdown = OogleCraftJewelrySetQualityDropdownContainer.dropdown
    JewelrySetQualityDropdown:SetSelectedItem("[Jewelry Quality]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelrySetQualityChoices do
    local entry = JewelrySetQualityDropdown:CreateItemEntry(OogleCraftJewelrySetQualityChoices[i]) -- [, OnItemSelect]
    JewelrySetQualityDropdown:AddItem(entry)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Set Choices ------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelrySetRing1Choices = {
    "[Ring #1]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftJewelrySetRing1Frame = wm:CreateTopLevelWindow("OogleCraftJewelrySetRing1DropWin")
    OogleCraftJewelrySetRing1Frame:SetAnchor(TOPLEFT)
    OogleCraftJewelrySetRing1Frame:SetDimensions(125, 50)
local OogleCraftJewelrySetRing1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelrySetRing1Drop", OogleCraftJewelrySetRing1Frame, "ScrollCombobox")
    OogleCraftJewelrySetRing1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1000 + 7, 180)
    OogleCraftJewelrySetRing1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftJewelrySetRing1DropdownContainer.name
local JewelrySetRing1Dropdown = OogleCraftJewelrySetRing1DropdownContainer.dropdown
    JewelrySetRing1Dropdown:SetSelectedItem("[Ring #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelrySetRing1Choices do
    local entry = JewelrySetRing1Dropdown:CreateItemEntry(OogleCraftJewelrySetRing1Choices[i]) -- [, OnItemSelect]
    JewelrySetRing1Dropdown:AddItem(entry)
end

local OogleCraftJewelrySetRing2Choices = {
    "[Ring #2]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftJewelrySetRing2Frame = wm:CreateTopLevelWindow("OogleCraftJewelrySetRing2DropWin")
    OogleCraftJewelrySetRing2Frame:SetAnchor(TOPLEFT)
    OogleCraftJewelrySetRing2Frame:SetDimensions(125, 50)
local OogleCraftJewelrySetRing2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelrySetRing2Drop", OogleCraftJewelrySetRing2Frame, "ScrollCombobox")
    OogleCraftJewelrySetRing2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1125 + 7, 180)
    OogleCraftJewelrySetRing2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftJewelrySetRing2DropdownContainer.name
local JewelrySetRing2Dropdown = OogleCraftJewelrySetRing2DropdownContainer.dropdown
    JewelrySetRing2Dropdown:SetSelectedItem("[Ring #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelrySetRing2Choices do
    local entry = JewelrySetRing2Dropdown:CreateItemEntry(OogleCraftJewelrySetRing2Choices[i]) -- [, OnItemSelect]
    JewelrySetRing2Dropdown:AddItem(entry)
end

local OogleCraftJewelrySetNecklaceChoices = {
    "[Necklace]",
    "Set #1",
    "Set #2",
    "Set #3"

}

local OogleCraftJewelrySetNecklaceFrame = wm:CreateTopLevelWindow("OogleCraftJewelrySetNecklaceDropWin")
    OogleCraftJewelrySetNecklaceFrame:SetAnchor(TOPLEFT)
    OogleCraftJewelrySetNecklaceFrame:SetDimensions(125, 50)
local OogleCraftJewelrySetNecklaceDropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelrySetNecklaceDrop", OogleCraftJewelrySetNecklaceFrame, "ScrollCombobox")
    OogleCraftJewelrySetNecklaceDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1250 + 7, 180)
    OogleCraftJewelrySetNecklaceDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftJewelrySetNecklaceDropdownContainer.name
local JewelrySetNecklaceDropdown = OogleCraftJewelrySetNecklaceDropdownContainer.dropdown
    JewelrySetNecklaceDropdown:SetSelectedItem("[Necklace]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelrySetNecklaceChoices do
    local entry = JewelrySetNecklaceDropdown:CreateItemEntry(OogleCraftJewelrySetNecklaceChoices[i]) -- [, OnItemSelect]
    JewelrySetNecklaceDropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Trait Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryTraitRing1Choices = {
    "[Ring #1]",
    "Arcane",
    "Healthy",
    "Robust",
    "Triune",
    "Infused",
    "Protective",
    "Swift",
    "Harmony",
    "Bloodthirsty"

}

local OogleCraftJewelryTraitRing1Frame = wm:CreateTopLevelWindow("OogleCraftJewelryTraitRing1DropWin")
    OogleCraftJewelryTraitRing1Frame:SetAnchor(TOPLEFT)
    OogleCraftJewelryTraitRing1Frame:SetDimensions(125, 50)
local OogleCraftJewelryTraitRing1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelryTraitRing1Drop", OogleCraftJewelryTraitRing1Frame, "ScrollCombobox")
    OogleCraftJewelryTraitRing1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1000 + 7, 330)
    OogleCraftJewelryTraitRing1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftJewelryTraitRing1DropdownContainer.name
local JewelryTraitRing1Dropdown = OogleCraftJewelryTraitRing1DropdownContainer.dropdown
    JewelryTraitRing1Dropdown:SetSelectedItem("[Ring #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelryTraitRing1Choices do
    local entry = JewelryTraitRing1Dropdown:CreateItemEntry(OogleCraftJewelryTraitRing1Choices[i]) -- [, OnItemSelect]
    JewelryTraitRing1Dropdown:AddItem(entry)
end

local OogleCraftJewelryTraitRing2Choices = {
    "[Ring #2]",
    "Arcane",
    "Healthy",
    "Robust",
    "Triune",
    "Infused",
    "Protective",
    "Swift",
    "Harmony",
    "Bloodthirsty"

}

local OogleCraftJewelryTraitRing2Frame = wm:CreateTopLevelWindow("OogleCraftJewelryTraitRing2DropWin")
    OogleCraftJewelryTraitRing2Frame:SetAnchor(TOPLEFT)
    OogleCraftJewelryTraitRing2Frame:SetDimensions(125, 50)
local OogleCraftJewelryTraitRing2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelryTraitRing2Drop", OogleCraftJewelryTraitRing2Frame, "ScrollCombobox")
    OogleCraftJewelryTraitRing2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1125 + 7, 330)
    OogleCraftJewelryTraitRing2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftJewelryTraitRing2DropdownContainer.name
local JewelryTraitRing2Dropdown = OogleCraftJewelryTraitRing2DropdownContainer.dropdown
    JewelryTraitRing2Dropdown:SetSelectedItem("[Ring #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelryTraitRing2Choices do
    local entry = JewelryTraitRing2Dropdown:CreateItemEntry(OogleCraftJewelryTraitRing2Choices[i]) -- [, OnItemSelect]
    JewelryTraitRing2Dropdown:AddItem(entry)
end

local OogleCraftJewelryTraitNecklaceChoices = {
    "[Necklace]",
    "Arcane",
    "Healthy",
    "Robust",
    "Triune",
    "Infused",
    "Protective",
    "Swift",
    "Harmony",
    "Bloodthirsty"

}

local OogleCraftJewelryTraitNecklaceFrame = wm:CreateTopLevelWindow("OogleCraftJewelryTraitNecklaceDropWin")
    OogleCraftJewelryTraitNecklaceFrame:SetAnchor(TOPLEFT)
    OogleCraftJewelryTraitNecklaceFrame:SetDimensions(125, 50)
local OogleCraftJewelryTraitNecklaceDropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelryTraitNecklaceDrop", OogleCraftJewelryTraitNecklaceFrame, "ScrollCombobox")
    OogleCraftJewelryTraitNecklaceDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1250 + 7, 330)
    OogleCraftJewelryTraitNecklaceDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftJewelryTraitNecklaceDropdownContainer.name
local JewelryTraitNecklaceDropdown = OogleCraftJewelryTraitNecklaceDropdownContainer.dropdown
    JewelryTraitNecklaceDropdown:SetSelectedItem("[Necklace]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelryTraitNecklaceChoices do
    local entry = JewelryTraitNecklaceDropdown:CreateItemEntry(OogleCraftJewelryTraitNecklaceChoices[i]) -- [, OnItemSelect]
    JewelryTraitNecklaceDropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryEnchantQualityChoices = {
    "[Jewelry Enchant Quality]",
    "White",
    "Green",
    "Blue",
    "Purple",
    "Yellow",
    "Orange"
}

local OogleCraftJewelryEnchantQualityFrame = wm:CreateTopLevelWindow("OogleCraftJewelryEnchantQualityDropWin")
    OogleCraftJewelryEnchantQualityFrame:SetAnchor(TOPLEFT)
    OogleCraftJewelryEnchantQualityFrame:SetDimensions(125, 50)
local OogleCraftJewelryEnchantQualityDropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelryEnchantQualityDrop", OogleCraftJewelryEnchantQualityFrame, "ScrollCombobox")
    OogleCraftJewelryEnchantQualityDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1000 + 7, 405)
    OogleCraftJewelryEnchantQualityDropdownContainer:GetNamedChild("Dropdown"):SetWidth(375)
-- local selected = OogleCraftJewelryEnchantQualityDropdownContainer.name
local JewelryEnchantQualityDropdown = OogleCraftJewelryEnchantQualityDropdownContainer.dropdown
    JewelryEnchantQualityDropdown:SetSelectedItem("[Jewelry Enchant Quality]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelryEnchantQualityChoices do
    local entry = JewelryEnchantQualityDropdown:CreateItemEntry(OogleCraftJewelryEnchantQualityChoices[i]) -- [, OnItemSelect]
    JewelryEnchantQualityDropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Jewelry Enchant Choices --------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftJewelryEnchantRing1Choices = {
    "[Ring #1]",
    "Health Recovery",
    "Reduce Spell Cost",
    "Magicka Recovery",
    "Reduce Feat Cost",
    "Stamina Recovery",
    "Poison Resist",
    "Flame Resist",
    "Frost Resist",
    "Shock Resist",
    "Disease Resist",
    "Potion Speed",
    "Potion Boost",
    "Decrease Physical Harm",
    "Increase Physical Harm",
    "Decrease Spell Harm",
    "Increase Magical Harm",
    "Shielding",
    "Bashing",
    "Reduce Skill Cost",
    "Prismatic Recovery"

}

local OogleCraftJewelryEnchantRing1Frame = wm:CreateTopLevelWindow("OogleCraftJewelryEnchantRing1DropWin")
    OogleCraftJewelryEnchantRing1Frame:SetAnchor(TOPLEFT)
    OogleCraftJewelryEnchantRing1Frame:SetDimensions(125, 50)
local OogleCraftJewelryEnchantRing1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelryEnchantRing1Drop", OogleCraftJewelryEnchantRing1Frame, "ScrollCombobox")
    OogleCraftJewelryEnchantRing1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1000 + 7, 430)
    OogleCraftJewelryEnchantRing1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftJewelryEnchantRing1DropdownContainer.name
local JewelryEnchantRing1Dropdown = OogleCraftJewelryEnchantRing1DropdownContainer.dropdown
    JewelryEnchantRing1Dropdown:SetSelectedItem("[Ring #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelryEnchantRing1Choices do
    local entry = JewelryEnchantRing1Dropdown:CreateItemEntry(OogleCraftJewelryEnchantRing1Choices[i]) -- [, OnItemSelect]
    JewelryEnchantRing1Dropdown:AddItem(entry)
end

local OogleCraftJewelryEnchantRing2Choices = {
    "[Ring #2]",
    "Health Recovery",
    "Reduce Spell Cost",
    "Magicka Recovery",
    "Reduce Feat Cost",
    "Stamina Recovery",
    "Poison Resist",
    "Flame Resist",
    "Frost Resist",
    "Shock Resist",
    "Disease Resist",
    "Potion Speed",
    "Potion Boost",
    "Decrease Physical Harm",
    "Increase Physical Harm",
    "Decrease Spell Harm",
    "Increase Magical Harm",
    "Shielding",
    "Bashing",
    "Reduce Skill Cost",
    "Prismatic Recovery"

}

local OogleCraftJewelryEnchantRing2Frame = wm:CreateTopLevelWindow("OogleCraftJewelryEnchantRing2DropWin")
    OogleCraftJewelryEnchantRing2Frame:SetAnchor(TOPLEFT)
    OogleCraftJewelryEnchantRing2Frame:SetDimensions(125, 50)
local OogleCraftJewelryEnchantRing2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelryEnchantRing2Drop", OogleCraftJewelryEnchantRing2Frame, "ScrollCombobox")
    OogleCraftJewelryEnchantRing2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1125 + 7, 430)
    OogleCraftJewelryEnchantRing2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftJewelryEnchantRing2DropdownContainer.name
local JewelryEnchantRing2Dropdown = OogleCraftJewelryEnchantRing2DropdownContainer.dropdown
    JewelryEnchantRing2Dropdown:SetSelectedItem("[Ring #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelryEnchantRing2Choices do
    local entry = JewelryEnchantRing2Dropdown:CreateItemEntry(OogleCraftJewelryEnchantRing2Choices[i]) -- [, OnItemSelect]
    JewelryEnchantRing2Dropdown:AddItem(entry)
end

local OogleCraftJewelryEnchantNecklaceChoices = {
    "[Necklace]",
    "Health Recovery",
    "Reduce Spell Cost",
    "Magicka Recovery",
    "Reduce Feat Cost",
    "Stamina Recovery",
    "Poison Resist",
    "Flame Resist",
    "Frost Resist",
    "Shock Resist",
    "Disease Resist",
    "Potion Speed",
    "Potion Boost",
    "Decrease Physical Harm",
    "Increase Physical Harm",
    "Decrease Spell Harm",
    "Increase Magical Harm",
    "Shielding",
    "Bashing",
    "Reduce Skill Cost",
    "Prismatic Recovery"

}

local OogleCraftJewelryEnchantNecklaceFrame = wm:CreateTopLevelWindow("OogleCraftJewelryEnchantNecklaceDropWin")
    OogleCraftJewelryEnchantNecklaceFrame:SetAnchor(TOPLEFT)
    OogleCraftJewelryEnchantNecklaceFrame:SetDimensions(125, 50)
local OogleCraftJewelryEnchantNecklaceDropdownContainer = wm:CreateControlFromVirtual("OogleCraftJewelryEnchantNecklaceDrop", OogleCraftJewelryEnchantNecklaceFrame, "ScrollCombobox")
    OogleCraftJewelryEnchantNecklaceDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1250 + 7, 430)
    OogleCraftJewelryEnchantNecklaceDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftJewelryEnchantNecklaceDropdownContainer.name
local JewelryEnchantNecklaceDropdown = OogleCraftJewelryEnchantNecklaceDropdownContainer.dropdown
    JewelryEnchantNecklaceDropdown:SetSelectedItem("[Necklace]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftJewelryEnchantNecklaceChoices do
    local entry = JewelryEnchantNecklaceDropdown:CreateItemEntry(OogleCraftJewelryEnchantNecklaceChoices[i]) -- [, OnItemSelect]
    JewelryEnchantNecklaceDropdown:AddItem(entry)
end
