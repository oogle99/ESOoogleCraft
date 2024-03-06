OogleCraft = {}
OogleCraft.name = "OogleCraft"

local wm = WINDOW_MANAGER

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local OogleCraftArmorSetQualityChoices = {
    "[Armor Quality]",
    "White",
    "Green",
    "Blue",
    "Purple",
    "Yellow",
    "Orange"
}

local OogleCraftArmorSetQualityFrame = wm:CreateTopLevelWindow("OogleCraftArmorSetQualityDropWin")
    OogleCraftArmorSetQualityFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorSetQualityFrame:SetDimensions(125, 50)
local OogleCraftArmorSetQualityDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorSetQualityDrop", OogleCraftArmorSetQualityFrame, "ScrollCombobox")
    OogleCraftArmorSetQualityDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 0 + 7, 155)
    OogleCraftArmorSetQualityDropdownContainer:GetNamedChild("Dropdown"):SetWidth(1000)
-- local selected = OogleCraftArmorSetQualityDropdownContainer.name
local ArmorSetQualityDropdown = OogleCraftArmorSetQualityDropdownContainer.dropdown
    ArmorSetQualityDropdown:SetSelectedItem("[Armor Quality]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorSetQualityChoices do
    local entry = ArmorSetQualityDropdown:CreateItemEntry(OogleCraftArmorSetQualityChoices[i]) -- [, OnItemSelect]
    ArmorSetQualityDropdown:AddItem(entry)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Set Choices --------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorSetShieldChoices = {
    "[Shield]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftArmorSetShieldFrame = wm:CreateTopLevelWindow("OogleCraftArmorSetShieldDropWin")
    OogleCraftArmorSetShieldFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorSetShieldFrame:SetDimensions(125, 50)
local OogleCraftArmorSetShieldDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorSetShieldDrop", OogleCraftArmorSetShieldFrame, "ScrollCombobox")
    OogleCraftArmorSetShieldDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 0 + 7, 180)
    OogleCraftArmorSetShieldDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorSetShieldDropdownContainer.name
local ArmorSetShieldDropdown = OogleCraftArmorSetShieldDropdownContainer.dropdown
    ArmorSetShieldDropdown:SetSelectedItem("[Shield]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorSetShieldChoices do
    local entry = ArmorSetShieldDropdown:CreateItemEntry(OogleCraftArmorSetShieldChoices[i]) -- [, OnItemSelect]
    ArmorSetShieldDropdown:AddItem(entry)
end

local OogleCraftArmorSetChestChoices = {
    "[Chest]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftArmorSetChestFrame = wm:CreateTopLevelWindow("OogleCraftArmorSetChestDropWin")
    OogleCraftArmorSetChestFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorSetChestFrame:SetDimensions(125, 50)
local OogleCraftArmorSetChestDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorSetChestDrop", OogleCraftArmorSetChestFrame, "ScrollCombobox")
    OogleCraftArmorSetChestDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 125 + 7, 180)
    OogleCraftArmorSetChestDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorSetChestDropdownContainer.name
local ArmorSetChestDropdown = OogleCraftArmorSetChestDropdownContainer.dropdown
    ArmorSetChestDropdown:SetSelectedItem("[Chest]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorSetChestChoices do
    local entry = ArmorSetChestDropdown:CreateItemEntry(OogleCraftArmorSetChestChoices[i]) -- [, OnItemSelect]
    ArmorSetChestDropdown:AddItem(entry)
end

local OogleCraftArmorSetFeetChoices = {
    "[Feet]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftArmorSetFeetFrame = wm:CreateTopLevelWindow("OogleCraftArmorSetFeetDropWin")
    OogleCraftArmorSetFeetFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorSetFeetFrame:SetDimensions(125, 50)
local OogleCraftArmorSetFeetDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorSetFeetDrop", OogleCraftArmorSetFeetFrame, "ScrollCombobox")
    OogleCraftArmorSetFeetDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 250 + 7, 180)
    OogleCraftArmorSetFeetDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorSetFeetDropdownContainer.name
local ArmorSetFeetDropdown = OogleCraftArmorSetFeetDropdownContainer.dropdown
    ArmorSetFeetDropdown:SetSelectedItem("[Feet]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorSetFeetChoices do
    local entry = ArmorSetFeetDropdown:CreateItemEntry(OogleCraftArmorSetFeetChoices[i]) -- [, OnItemSelect]
    ArmorSetFeetDropdown:AddItem(entry)
end

local OogleCraftArmorSetHandsChoices = {
    "[Hands]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftArmorSetHandsFrame = wm:CreateTopLevelWindow("OogleCraftArmorSetHandsDropWin")
    OogleCraftArmorSetHandsFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorSetHandsFrame:SetDimensions(125, 50)
local OogleCraftArmorSetHandsDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorSetHandsDrop", OogleCraftArmorSetHandsFrame, "ScrollCombobox")
    OogleCraftArmorSetHandsDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 375 + 7, 180)
    OogleCraftArmorSetHandsDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorSetHandsDropdownContainer.name
local ArmorSetHandsDropdown = OogleCraftArmorSetHandsDropdownContainer.dropdown
    ArmorSetHandsDropdown:SetSelectedItem("[Hands]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorSetHandsChoices do
    local entry = ArmorSetHandsDropdown:CreateItemEntry(OogleCraftArmorSetHandsChoices[i]) -- [, OnItemSelect]
    ArmorSetHandsDropdown:AddItem(entry)
end

local OogleCraftArmorSetLegsChoices = {
    "[Legs]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftArmorSetLegsFrame = wm:CreateTopLevelWindow("OogleCraftArmorSetLegsDropWin")
    OogleCraftArmorSetLegsFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorSetLegsFrame:SetDimensions(125, 50)
local OogleCraftArmorSetLegsDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorSetLegsDrop", OogleCraftArmorSetLegsFrame, "ScrollCombobox")
    OogleCraftArmorSetLegsDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 500 + 7, 180)
    OogleCraftArmorSetLegsDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorSetLegsDropdownContainer.name
local ArmorSetLegsDropdown = OogleCraftArmorSetLegsDropdownContainer.dropdown
    ArmorSetLegsDropdown:SetSelectedItem("[Legs]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorSetLegsChoices do
    local entry = ArmorSetLegsDropdown:CreateItemEntry(OogleCraftArmorSetLegsChoices[i]) -- [, OnItemSelect]
    ArmorSetLegsDropdown:AddItem(entry)
end

local OogleCraftArmorSetWaistChoices = {
    "[Waist]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftArmorSetWaistFrame = wm:CreateTopLevelWindow("OogleCraftArmorSetWaistDropWin")
    OogleCraftArmorSetWaistFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorSetWaistFrame:SetDimensions(125, 50)
local OogleCraftArmorSetWaistDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorSetWaistDrop", OogleCraftArmorSetWaistFrame, "ScrollCombobox")
    OogleCraftArmorSetWaistDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 625 + 7, 180)
    OogleCraftArmorSetWaistDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorSetWaistDropdownContainer.name
local ArmorSetWaistDropdown = OogleCraftArmorSetWaistDropdownContainer.dropdown
    ArmorSetWaistDropdown:SetSelectedItem("[Waist]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorSetWaistChoices do
    local entry = ArmorSetWaistDropdown:CreateItemEntry(OogleCraftArmorSetWaistChoices[i]) -- [, OnItemSelect]
    ArmorSetWaistDropdown:AddItem(entry)
end

local OogleCraftArmorSetHeadChoices = {
    "[Head]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftArmorSetHeadFrame = wm:CreateTopLevelWindow("OogleCraftArmorSetHeadDropWin")
    OogleCraftArmorSetHeadFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorSetHeadFrame:SetDimensions(125, 50)
local OogleCraftArmorSetHeadDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorSetHeadDrop", OogleCraftArmorSetHeadFrame, "ScrollCombobox")
    OogleCraftArmorSetHeadDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 750 + 7, 180)
    OogleCraftArmorSetHeadDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorSetHeadDropdownContainer.name
local ArmorSetHeadDropdown = OogleCraftArmorSetHeadDropdownContainer.dropdown
    ArmorSetHeadDropdown:SetSelectedItem("[Head]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorSetHeadChoices do
    local entry = ArmorSetHeadDropdown:CreateItemEntry(OogleCraftArmorSetHeadChoices[i]) -- [, OnItemSelect]
    ArmorSetHeadDropdown:AddItem(entry)
end

local OogleCraftArmorSetShouldersChoices = {
    "[Shoulders]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftArmorSetShouldersFrame = wm:CreateTopLevelWindow("OogleCraftArmorSetShouldersDropWin")
    OogleCraftArmorSetShouldersFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorSetShouldersFrame:SetDimensions(125, 50)
local OogleCraftArmorSetShouldersDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorSetShouldersDrop", OogleCraftArmorSetShouldersFrame, "ScrollCombobox")
    OogleCraftArmorSetShouldersDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 875 + 7, 180)
    OogleCraftArmorSetShouldersDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorSetShouldersDropdownContainer.name
local ArmorSetShouldersDropdown = OogleCraftArmorSetShouldersDropdownContainer.dropdown
    ArmorSetShouldersDropdown:SetSelectedItem("[Shoulders]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorSetShouldersChoices do
    local entry = ArmorSetShouldersDropdown:CreateItemEntry(OogleCraftArmorSetShouldersChoices[i]) -- [, OnItemSelect]
    ArmorSetShouldersDropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Weight Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorWeightChestChoices = {
    "[Chest]",
    "Light",
    "Medium",
    "Heavy"
}

local OogleCraftArmorWeightChestFrame = wm:CreateTopLevelWindow("OogleCraftArmorWeightChestDropWin")
    OogleCraftArmorWeightChestFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorWeightChestFrame:SetDimensions(125, 50)
local OogleCraftArmorWeightChestDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorWeightChestDrop", OogleCraftArmorWeightChestFrame, "ScrollCombobox")
    OogleCraftArmorWeightChestDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 125 + 7, 255)
    OogleCraftArmorWeightChestDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorWeightChestDropdownContainer.name
local ArmorWeightChestDropdown = OogleCraftArmorWeightChestDropdownContainer.dropdown
    ArmorWeightChestDropdown:SetSelectedItem("[Chest]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorWeightChestChoices do
    local entry = ArmorWeightChestDropdown:CreateItemEntry(OogleCraftArmorWeightChestChoices[i]) -- [, OnItemSelect]
    ArmorWeightChestDropdown:AddItem(entry)
end

local OogleCraftArmorWeightFeetChoices = {
    "[Feet]",
    "Light",
    "Medium",
    "Heavy"
}

local OogleCraftArmorWeightFeetFrame = wm:CreateTopLevelWindow("OogleCraftArmorWeightFeetDropWin")
    OogleCraftArmorWeightFeetFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorWeightFeetFrame:SetDimensions(125, 50)
local OogleCraftArmorWeightFeetDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorWeightFeetDrop", OogleCraftArmorWeightFeetFrame, "ScrollCombobox")
    OogleCraftArmorWeightFeetDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 250 + 7, 255)
    OogleCraftArmorWeightFeetDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorWeightFeetDropdownContainer.name
local ArmorWeightFeetDropdown = OogleCraftArmorWeightFeetDropdownContainer.dropdown
    ArmorWeightFeetDropdown:SetSelectedItem("[Feet]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorWeightFeetChoices do
    local entry = ArmorWeightFeetDropdown:CreateItemEntry(OogleCraftArmorWeightFeetChoices[i]) -- [, OnItemSelect]
    ArmorWeightFeetDropdown:AddItem(entry)
end

local OogleCraftArmorWeightHandsChoices = {
    "[Hands]",
    "Light",
    "Medium",
    "Heavy"
}

local OogleCraftArmorWeightHandsFrame = wm:CreateTopLevelWindow("OogleCraftArmorWeightHandsDropWin")
    OogleCraftArmorWeightHandsFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorWeightHandsFrame:SetDimensions(125, 50)
local OogleCraftArmorWeightHandsDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorWeightHandsDrop", OogleCraftArmorWeightHandsFrame, "ScrollCombobox")
    OogleCraftArmorWeightHandsDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 375 + 7, 255)
    OogleCraftArmorWeightHandsDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorWeightHandsDropdownContainer.name
local ArmorWeightHandsDropdown = OogleCraftArmorWeightHandsDropdownContainer.dropdown
    ArmorWeightHandsDropdown:SetSelectedItem("[Hands]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorWeightHandsChoices do
    local entry = ArmorWeightHandsDropdown:CreateItemEntry(OogleCraftArmorWeightHandsChoices[i]) -- [, OnItemSelect]
    ArmorWeightHandsDropdown:AddItem(entry)
end

local OogleCraftArmorWeightLegsChoices = {
    "[Legs]",
    "Light",
    "Medium",
    "Heavy"
}

local OogleCraftArmorWeightLegsFrame = wm:CreateTopLevelWindow("OogleCraftArmorWeightLegsDropWin")
    OogleCraftArmorWeightLegsFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorWeightLegsFrame:SetDimensions(125, 50)
local OogleCraftArmorWeightLegsDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorWeightLegsDrop", OogleCraftArmorWeightLegsFrame, "ScrollCombobox")
    OogleCraftArmorWeightLegsDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 500 + 7, 255)
    OogleCraftArmorWeightLegsDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorWeightLegsDropdownContainer.name
local ArmorWeightLegsDropdown = OogleCraftArmorWeightLegsDropdownContainer.dropdown
    ArmorWeightLegsDropdown:SetSelectedItem("[Legs]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorWeightLegsChoices do
    local entry = ArmorWeightLegsDropdown:CreateItemEntry(OogleCraftArmorWeightLegsChoices[i]) -- [, OnItemSelect]
    ArmorWeightLegsDropdown:AddItem(entry)
end

local OogleCraftArmorWeightWaistChoices = {
    "[Waist]",
    "Light",
    "Medium",
    "Heavy"
}

local OogleCraftArmorWeightWaistFrame = wm:CreateTopLevelWindow("OogleCraftArmorWeightWaistDropWin")
    OogleCraftArmorWeightWaistFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorWeightWaistFrame:SetDimensions(125, 50)
local OogleCraftArmorWeightWaistDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorWeightWaistDrop", OogleCraftArmorWeightWaistFrame, "ScrollCombobox")
    OogleCraftArmorWeightWaistDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 625 + 7, 255)
    OogleCraftArmorWeightWaistDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorWeightWaistDropdownContainer.name
local ArmorWeightWaistDropdown = OogleCraftArmorWeightWaistDropdownContainer.dropdown
    ArmorWeightWaistDropdown:SetSelectedItem("[Waist]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorWeightWaistChoices do
    local entry = ArmorWeightWaistDropdown:CreateItemEntry(OogleCraftArmorWeightWaistChoices[i]) -- [, OnItemSelect]
    ArmorWeightWaistDropdown:AddItem(entry)
end

local OogleCraftArmorWeightHeadChoices = {
    "[Head]",
    "Light",
    "Medium",
    "Heavy"
}

local OogleCraftArmorWeightHeadFrame = wm:CreateTopLevelWindow("OogleCraftArmorWeightHeadDropWin")
    OogleCraftArmorWeightHeadFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorWeightHeadFrame:SetDimensions(125, 50)
local OogleCraftArmorWeightHeadDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorWeightHeadDrop", OogleCraftArmorWeightHeadFrame, "ScrollCombobox")
    OogleCraftArmorWeightHeadDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 750 + 7, 255)
    OogleCraftArmorWeightHeadDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorWeightHeadDropdownContainer.name
local ArmorWeightHeadDropdown = OogleCraftArmorWeightHeadDropdownContainer.dropdown
    ArmorWeightHeadDropdown:SetSelectedItem("[Head]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorWeightHeadChoices do
    local entry = ArmorWeightHeadDropdown:CreateItemEntry(OogleCraftArmorWeightHeadChoices[i]) -- [, OnItemSelect]
    ArmorWeightHeadDropdown:AddItem(entry)
end

local OogleCraftArmorWeightShouldersChoices = {
    "[Shoulders]",
    "Light",
    "Medium",
    "Heavy"
}

local OogleCraftArmorWeightShouldersFrame = wm:CreateTopLevelWindow("OogleCraftArmorWeightShouldersDropWin")
    OogleCraftArmorWeightShouldersFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorWeightShouldersFrame:SetDimensions(125, 50)
local OogleCraftArmorWeightShouldersDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorWeightShouldersDrop", OogleCraftArmorWeightShouldersFrame, "ScrollCombobox")
    OogleCraftArmorWeightShouldersDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 875 + 7, 255)
    OogleCraftArmorWeightShouldersDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorWeightShouldersDropdownContainer.name
local ArmorWeightShouldersDropdown = OogleCraftArmorWeightShouldersDropdownContainer.dropdown
    ArmorWeightShouldersDropdown:SetSelectedItem("[Shoulders]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorWeightShouldersChoices do
    local entry = ArmorWeightShouldersDropdown:CreateItemEntry(OogleCraftArmorWeightShouldersChoices[i]) -- [, OnItemSelect]
    ArmorWeightShouldersDropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Trait Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorTraitShieldChoices = {
    "[Shield]",
    "Sturdy",
    "Impenetrable",
    "Reinforced",
    "Well-fitted",
    "Training",
    "Infused",
    "Invigorating",
    "Divines",
    "Nirnhoned"
}

local OogleCraftArmorTraitShieldFrame = wm:CreateTopLevelWindow("OogleCraftArmorTraitShieldDropWin")
    OogleCraftArmorTraitShieldFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorTraitShieldFrame:SetDimensions(125, 50)
local OogleCraftArmorTraitShieldDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorTraitShieldDrop", OogleCraftArmorTraitShieldFrame, "ScrollCombobox")
    OogleCraftArmorTraitShieldDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 0 + 7, 330)
    OogleCraftArmorTraitShieldDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorTraitShieldDropdownContainer.name
local ArmorTraitShieldDropdown = OogleCraftArmorTraitShieldDropdownContainer.dropdown
    ArmorTraitShieldDropdown:SetSelectedItem("[Shield]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorTraitShieldChoices do
    local entry = ArmorTraitShieldDropdown:CreateItemEntry(OogleCraftArmorTraitShieldChoices[i]) -- [, OnItemSelect]
    ArmorTraitShieldDropdown:AddItem(entry)
end

local OogleCraftArmorTraitChestChoices = {
    "[Chest]",
    "Sturdy",
    "Impenetrable",
    "Reinforced",
    "Well-fitted",
    "Training",
    "Infused",
    "Invigorating",
    "Divines",
    "Nirnhoned"

}

local OogleCraftArmorTraitChestFrame = wm:CreateTopLevelWindow("OogleCraftArmorTraitChestDropWin")
    OogleCraftArmorTraitChestFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorTraitChestFrame:SetDimensions(125, 50)
local OogleCraftArmorTraitChestDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorTraitChestDrop", OogleCraftArmorTraitChestFrame, "ScrollCombobox")
    OogleCraftArmorTraitChestDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 125 + 7, 330)
    OogleCraftArmorTraitChestDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorTraitChestDropdownContainer.name
local ArmorTraitChestDropdown = OogleCraftArmorTraitChestDropdownContainer.dropdown
    ArmorTraitChestDropdown:SetSelectedItem("[Chest]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorTraitChestChoices do
    local entry = ArmorTraitChestDropdown:CreateItemEntry(OogleCraftArmorTraitChestChoices[i]) -- [, OnItemSelect]
    ArmorTraitChestDropdown:AddItem(entry)
end

local OogleCraftArmorTraitFeetChoices = {
    "[Feet]",
    "Sturdy",
    "Impenetrable",
    "Reinforced",
    "Well-fitted",
    "Training",
    "Infused",
    "Invigorating",
    "Divines",
    "Nirnhoned"

}

local OogleCraftArmorTraitFeetFrame = wm:CreateTopLevelWindow("OogleCraftArmorTraitFeetDropWin")
    OogleCraftArmorTraitFeetFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorTraitFeetFrame:SetDimensions(125, 50)
local OogleCraftArmorTraitFeetDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorTraitFeetDrop", OogleCraftArmorTraitFeetFrame, "ScrollCombobox")
    OogleCraftArmorTraitFeetDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 250 + 7, 330)
    OogleCraftArmorTraitFeetDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorTraitFeetDropdownContainer.name
local ArmorTraitFeetDropdown = OogleCraftArmorTraitFeetDropdownContainer.dropdown
    ArmorTraitFeetDropdown:SetSelectedItem("[Feet]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorTraitFeetChoices do
    local entry = ArmorTraitFeetDropdown:CreateItemEntry(OogleCraftArmorTraitFeetChoices[i]) -- [, OnItemSelect]
    ArmorTraitFeetDropdown:AddItem(entry)
end

local OogleCraftArmorTraitHandsChoices = {
    "[Hands]",
    "Sturdy",
    "Impenetrable",
    "Reinforced",
    "Well-fitted",
    "Training",
    "Infused",
    "Invigorating",
    "Divines",
    "Nirnhoned"

}

local OogleCraftArmorTraitHandsFrame = wm:CreateTopLevelWindow("OogleCraftArmorTraitHandsDropWin")
    OogleCraftArmorTraitHandsFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorTraitHandsFrame:SetDimensions(125, 50)
local OogleCraftArmorTraitHandsDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorTraitHandsDrop", OogleCraftArmorTraitHandsFrame, "ScrollCombobox")
    OogleCraftArmorTraitHandsDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 375 + 7, 330)
    OogleCraftArmorTraitHandsDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorTraitHandsDropdownContainer.name
local ArmorTraitHandsDropdown = OogleCraftArmorTraitHandsDropdownContainer.dropdown
    ArmorTraitHandsDropdown:SetSelectedItem("[Hands]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorTraitHandsChoices do
    local entry = ArmorTraitHandsDropdown:CreateItemEntry(OogleCraftArmorTraitHandsChoices[i]) -- [, OnItemSelect]
    ArmorTraitHandsDropdown:AddItem(entry)
end

local OogleCraftArmorTraitLegsChoices = {
    "[Legs]",
    "Sturdy",
    "Impenetrable",
    "Reinforced",
    "Well-fitted",
    "Training",
    "Infused",
    "Invigorating",
    "Divines",
    "Nirnhoned"

}

local OogleCraftArmorTraitLegsFrame = wm:CreateTopLevelWindow("OogleCraftArmorTraitLegsDropWin")
    OogleCraftArmorTraitLegsFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorTraitLegsFrame:SetDimensions(125, 50)
local OogleCraftArmorTraitLegsDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorTraitLegsDrop", OogleCraftArmorTraitLegsFrame, "ScrollCombobox")
    OogleCraftArmorTraitLegsDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 500 + 7, 330)
    OogleCraftArmorTraitLegsDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorTraitLegsDropdownContainer.name
local ArmorTraitLegsDropdown = OogleCraftArmorTraitLegsDropdownContainer.dropdown
    ArmorTraitLegsDropdown:SetSelectedItem("[Legs]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorTraitLegsChoices do
    local entry = ArmorTraitLegsDropdown:CreateItemEntry(OogleCraftArmorTraitLegsChoices[i]) -- [, OnItemSelect]
    ArmorTraitLegsDropdown:AddItem(entry)
end

local OogleCraftArmorTraitWaistChoices = {
    "[Waist]",
    "Sturdy",
    "Impenetrable",
    "Reinforced",
    "Well-fitted",
    "Training",
    "Infused",
    "Invigorating",
    "Divines",
    "Nirnhoned"

}

local OogleCraftArmorTraitWaistFrame = wm:CreateTopLevelWindow("OogleCraftArmorTraitWaistDropWin")
    OogleCraftArmorTraitWaistFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorTraitWaistFrame:SetDimensions(125, 50)
local OogleCraftArmorTraitWaistDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorTraitWaistDrop", OogleCraftArmorTraitWaistFrame, "ScrollCombobox")
    OogleCraftArmorTraitWaistDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 625 + 7, 330)
    OogleCraftArmorTraitWaistDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorTraitWaistDropdownContainer.name
local ArmorTraitWaistDropdown = OogleCraftArmorTraitWaistDropdownContainer.dropdown
    ArmorTraitWaistDropdown:SetSelectedItem("[Waist]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorTraitWaistChoices do
    local entry = ArmorTraitWaistDropdown:CreateItemEntry(OogleCraftArmorTraitWaistChoices[i]) -- [, OnItemSelect]
    ArmorTraitWaistDropdown:AddItem(entry)
end

local OogleCraftArmorTraitHeadChoices = {
    "[Head]",
    "Sturdy",
    "Impenetrable",
    "Reinforced",
    "Well-fitted",
    "Training",
    "Infused",
    "Invigorating",
    "Divines",
    "Nirnhoned"

}

local OogleCraftArmorTraitHeadFrame = wm:CreateTopLevelWindow("OogleCraftArmorTraitHeadDropWin")
    OogleCraftArmorTraitHeadFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorTraitHeadFrame:SetDimensions(125, 50)
local OogleCraftArmorTraitHeadDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorTraitHeadDrop", OogleCraftArmorTraitHeadFrame, "ScrollCombobox")
    OogleCraftArmorTraitHeadDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 750 + 7, 330)
    OogleCraftArmorTraitHeadDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorTraitHeadDropdownContainer.name
local ArmorTraitHeadDropdown = OogleCraftArmorTraitHeadDropdownContainer.dropdown
    ArmorTraitHeadDropdown:SetSelectedItem("[Head]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorTraitHeadChoices do
    local entry = ArmorTraitHeadDropdown:CreateItemEntry(OogleCraftArmorTraitHeadChoices[i]) -- [, OnItemSelect]
    ArmorTraitHeadDropdown:AddItem(entry)
end

local OogleCraftArmorTraitShouldersChoices = {
    "[Shoulders]",
    "Sturdy",
    "Impenetrable",
    "Reinforced",
    "Well-fitted",
    "Training",
    "Infused",
    "Invigorating",
    "Divines",
    "Nirnhoned"

}

local OogleCraftArmorTraitShouldersFrame = wm:CreateTopLevelWindow("OogleCraftArmorTraitShouldersDropWin")
    OogleCraftArmorTraitShouldersFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorTraitShouldersFrame:SetDimensions(125, 50)
local OogleCraftArmorTraitShouldersDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorTraitShouldersDrop", OogleCraftArmorTraitShouldersFrame, "ScrollCombobox")
    OogleCraftArmorTraitShouldersDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 875 + 7, 330)
    OogleCraftArmorTraitShouldersDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorTraitShouldersDropdownContainer.name
local ArmorTraitShouldersDropdown = OogleCraftArmorTraitShouldersDropdownContainer.dropdown
    ArmorTraitShouldersDropdown:SetSelectedItem("[Shoulders]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorTraitShouldersChoices do
    local entry = ArmorTraitShouldersDropdown:CreateItemEntry(OogleCraftArmorTraitShouldersChoices[i]) -- [, OnItemSelect]
    ArmorTraitShouldersDropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorEnchantQualityChoices = {
    "[Armor Enchant Quality]",
    "White",
    "Green",
    "Blue",
    "Purple",
    "Yellow",
    "Orange"
}

local OogleCraftArmorEnchantQualityFrame = wm:CreateTopLevelWindow("OogleCraftArmorEnchantQualityDropWin")
    OogleCraftArmorEnchantQualityFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorEnchantQualityFrame:SetDimensions(125, 50)
local OogleCraftArmorEnchantQualityDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorEnchantQualityDrop", OogleCraftArmorEnchantQualityFrame, "ScrollCombobox")
    OogleCraftArmorEnchantQualityDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 0 + 7, 405)
    OogleCraftArmorEnchantQualityDropdownContainer:GetNamedChild("Dropdown"):SetWidth(1000)
-- local selected = OogleCraftArmorEnchantQualityDropdownContainer.name
local ArmorEnchantQualityDropdown = OogleCraftArmorEnchantQualityDropdownContainer.dropdown
    ArmorEnchantQualityDropdown:SetSelectedItem("[Armor Enchant Quality]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorEnchantQualityChoices do
    local entry = ArmorEnchantQualityDropdown:CreateItemEntry(OogleCraftArmorEnchantQualityChoices[i]) -- [, OnItemSelect]
    ArmorEnchantQualityDropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Armor Enchant Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftArmorEnchantShieldChoices = {
    "[Shield]",
    "Health",
    "Magicka",
    "Stamina",
    "Prismatic Defense"

}

local OogleCraftArmorEnchantShieldFrame = wm:CreateTopLevelWindow("OogleCraftArmorEnchantShieldDropWin")
    OogleCraftArmorEnchantShieldFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorEnchantShieldFrame:SetDimensions(125, 50)
local OogleCraftArmorEnchantShieldDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorEnchantShieldDrop", OogleCraftArmorEnchantShieldFrame, "ScrollCombobox")
    OogleCraftArmorEnchantShieldDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 0 + 7, 430)
    OogleCraftArmorEnchantShieldDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorEnchantShieldDropdownContainer.name
local ArmorEnchantShieldDropdown = OogleCraftArmorEnchantShieldDropdownContainer.dropdown
    ArmorEnchantShieldDropdown:SetSelectedItem("[Shield]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorEnchantShieldChoices do
    local entry = ArmorEnchantShieldDropdown:CreateItemEntry(OogleCraftArmorEnchantShieldChoices[i]) -- [, OnItemSelect]
    ArmorEnchantShieldDropdown:AddItem(entry)
end

local OogleCraftArmorEnchantChestChoices = {
    "[Chest]",
    "Health",
    "Magicka",
    "Stamina",
    "Prismatic Defense"

}

local OogleCraftArmorEnchantChestFrame = wm:CreateTopLevelWindow("OogleCraftArmorEnchantChestDropWin")
    OogleCraftArmorEnchantChestFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorEnchantChestFrame:SetDimensions(125, 50)
local OogleCraftArmorEnchantChestDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorEnchantChestDrop", OogleCraftArmorEnchantChestFrame, "ScrollCombobox")
    OogleCraftArmorEnchantChestDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 125 + 7, 430)
    OogleCraftArmorEnchantChestDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorEnchantChestDropdownContainer.name
local ArmorEnchantChestDropdown = OogleCraftArmorEnchantChestDropdownContainer.dropdown
    ArmorEnchantChestDropdown:SetSelectedItem("[Chest]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorEnchantChestChoices do
    local entry = ArmorEnchantChestDropdown:CreateItemEntry(OogleCraftArmorEnchantChestChoices[i]) -- [, OnItemSelect]
    ArmorEnchantChestDropdown:AddItem(entry)
end

local OogleCraftArmorEnchantFeetChoices = {
    "[Feet]",
    "Health",
    "Magicka",
    "Stamina",
    "Prismatic Defense"

}

local OogleCraftArmorEnchantFeetFrame = wm:CreateTopLevelWindow("OogleCraftArmorEnchantFeetDropWin")
    OogleCraftArmorEnchantFeetFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorEnchantFeetFrame:SetDimensions(125, 50)
local OogleCraftArmorEnchantFeetDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorEnchantFeetDrop", OogleCraftArmorEnchantFeetFrame, "ScrollCombobox")
    OogleCraftArmorEnchantFeetDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 250 + 7, 430)
    OogleCraftArmorEnchantFeetDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorEnchantFeetDropdownContainer.name
local ArmorEnchantFeetDropdown = OogleCraftArmorEnchantFeetDropdownContainer.dropdown
    ArmorEnchantFeetDropdown:SetSelectedItem("[Feet]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorEnchantFeetChoices do
    local entry = ArmorEnchantFeetDropdown:CreateItemEntry(OogleCraftArmorEnchantFeetChoices[i]) -- [, OnItemSelect]
    ArmorEnchantFeetDropdown:AddItem(entry)
end

local OogleCraftArmorEnchantHandsChoices = {
    "[Hands]",
    "Health",
    "Magicka",
    "Stamina",
    "Prismatic Defense"

}

local OogleCraftArmorEnchantHandsFrame = wm:CreateTopLevelWindow("OogleCraftArmorEnchantHandsDropWin")
    OogleCraftArmorEnchantHandsFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorEnchantHandsFrame:SetDimensions(125, 50)
local OogleCraftArmorEnchantHandsDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorEnchantHandsDrop", OogleCraftArmorEnchantHandsFrame, "ScrollCombobox")
    OogleCraftArmorEnchantHandsDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 375 + 7, 430)
    OogleCraftArmorEnchantHandsDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorEnchantHandsDropdownContainer.name
local ArmorEnchantHandsDropdown = OogleCraftArmorEnchantHandsDropdownContainer.dropdown
    ArmorEnchantHandsDropdown:SetSelectedItem("[Hands]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorEnchantHandsChoices do
    local entry = ArmorEnchantHandsDropdown:CreateItemEntry(OogleCraftArmorEnchantHandsChoices[i]) -- [, OnItemSelect]
    ArmorEnchantHandsDropdown:AddItem(entry)
end

local OogleCraftArmorEnchantLegsChoices = {
    "[Legs]",
    "Health",
    "Magicka",
    "Stamina",
    "Prismatic Defense"

}

local OogleCraftArmorEnchantLegsFrame = wm:CreateTopLevelWindow("OogleCraftArmorEnchantLegsDropWin")
    OogleCraftArmorEnchantLegsFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorEnchantLegsFrame:SetDimensions(125, 50)
local OogleCraftArmorEnchantLegsDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorEnchantLegsDrop", OogleCraftArmorEnchantLegsFrame, "ScrollCombobox")
    OogleCraftArmorEnchantLegsDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 500 + 7, 430)
    OogleCraftArmorEnchantLegsDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorEnchantLegsDropdownContainer.name
local ArmorEnchantLegsDropdown = OogleCraftArmorEnchantLegsDropdownContainer.dropdown
    ArmorEnchantLegsDropdown:SetSelectedItem("[Legs]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorEnchantLegsChoices do
    local entry = ArmorEnchantLegsDropdown:CreateItemEntry(OogleCraftArmorEnchantLegsChoices[i]) -- [, OnItemSelect]
    ArmorEnchantLegsDropdown:AddItem(entry)
end

local OogleCraftArmorEnchantWaistChoices = {
    "[Waist]",
    "Health",
    "Magicka",
    "Stamina",
    "Prismatic Defense"

}

local OogleCraftArmorEnchantWaistFrame = wm:CreateTopLevelWindow("OogleCraftArmorEnchantWaistDropWin")
    OogleCraftArmorEnchantWaistFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorEnchantWaistFrame:SetDimensions(125, 50)
local OogleCraftArmorEnchantWaistDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorEnchantWaistDrop", OogleCraftArmorEnchantWaistFrame, "ScrollCombobox")
    OogleCraftArmorEnchantWaistDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 625 + 7, 430)
    OogleCraftArmorEnchantWaistDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorEnchantWaistDropdownContainer.name
local ArmorEnchantWaistDropdown = OogleCraftArmorEnchantWaistDropdownContainer.dropdown
    ArmorEnchantWaistDropdown:SetSelectedItem("[Waist]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorEnchantWaistChoices do
    local entry = ArmorEnchantWaistDropdown:CreateItemEntry(OogleCraftArmorEnchantWaistChoices[i]) -- [, OnItemSelect]
    ArmorEnchantWaistDropdown:AddItem(entry)
end

local OogleCraftArmorEnchantHeadChoices = {
    "[Head]",
    "Health",
    "Magicka",
    "Stamina",
    "Prismatic Defense"

}

local OogleCraftArmorEnchantHeadFrame = wm:CreateTopLevelWindow("OogleCraftArmorEnchantHeadDropWin")
    OogleCraftArmorEnchantHeadFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorEnchantHeadFrame:SetDimensions(125, 50)
local OogleCraftArmorEnchantHeadDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorEnchantHeadDrop", OogleCraftArmorEnchantHeadFrame, "ScrollCombobox")
    OogleCraftArmorEnchantHeadDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 750 + 7, 430)
    OogleCraftArmorEnchantHeadDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorEnchantHeadDropdownContainer.name
local ArmorEnchantHeadDropdown = OogleCraftArmorEnchantHeadDropdownContainer.dropdown
    ArmorEnchantHeadDropdown:SetSelectedItem("[Head]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorEnchantHeadChoices do
    local entry = ArmorEnchantHeadDropdown:CreateItemEntry(OogleCraftArmorEnchantHeadChoices[i]) -- [, OnItemSelect]
    ArmorEnchantHeadDropdown:AddItem(entry)
end

local OogleCraftArmorEnchantShouldersChoices = {
    "[Shoulders]",
    "Health",
    "Magicka",
    "Stamina",
    "Prismatic Defense"

}

local OogleCraftArmorEnchantShouldersFrame = wm:CreateTopLevelWindow("OogleCraftArmorEnchantShouldersDropWin")
    OogleCraftArmorEnchantShouldersFrame:SetAnchor(TOPLEFT)
    OogleCraftArmorEnchantShouldersFrame:SetDimensions(125, 50)
local OogleCraftArmorEnchantShouldersDropdownContainer = wm:CreateControlFromVirtual("OogleCraftArmorEnchantShouldersDrop", OogleCraftArmorEnchantShouldersFrame, "ScrollCombobox")
    OogleCraftArmorEnchantShouldersDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 875 + 7, 430)
    OogleCraftArmorEnchantShouldersDropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftArmorEnchantShouldersDropdownContainer.name
local ArmorEnchantShouldersDropdown = OogleCraftArmorEnchantShouldersDropdownContainer.dropdown
    ArmorEnchantShouldersDropdown:SetSelectedItem("[Shoulders]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftArmorEnchantShouldersChoices do
    local entry = ArmorEnchantShouldersDropdown:CreateItemEntry(OogleCraftArmorEnchantShouldersChoices[i]) -- [, OnItemSelect]
    ArmorEnchantShouldersDropdown:AddItem(entry)
end

