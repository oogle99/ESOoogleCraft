OogleCraft = {}
OogleCraft.name = "OogleCraft"

local wm = WINDOW_MANAGER

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local OogleCraftWeaponSetQualityChoices = {
    "[Weapon Quality]",
    "White",
    "Green",
    "Blue",
    "Purple",
    "Yellow",
    "Orange"
}

local OogleCraftWeaponSetQualityFrame = wm:CreateTopLevelWindow("OogleCraftWeaponSetQualityDropWin")
    OogleCraftWeaponSetQualityFrame:SetAnchor(TOPLEFT)
    OogleCraftWeaponSetQualityFrame:SetDimensions(125, 50)
local OogleCraftWeaponSetQualityDropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponSetQualityDrop", OogleCraftWeaponSetQualityFrame, "ScrollCombobox")
    OogleCraftWeaponSetQualityDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1375 + 7, 155)
    OogleCraftWeaponSetQualityDropdownContainer:GetNamedChild("Dropdown"):SetWidth(500)
-- local selected = OogleCraftWeaponSetQualityDropdownContainer.name
local WeaponSetQualityDropdown = OogleCraftWeaponSetQualityDropdownContainer.dropdown
    WeaponSetQualityDropdown:SetSelectedItem("[Weapon Quality]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponSetQualityChoices do
    local entry = WeaponSetQualityDropdown:CreateItemEntry(OogleCraftWeaponSetQualityChoices[i]) -- [, OnItemSelect]
    WeaponSetQualityDropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Set Choices -------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponSetFrontBar1Choices = {
    "[Front Bar #1]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftWeaponSetFrontBar1Frame = wm:CreateTopLevelWindow("OogleCraftWeaponSetFrontBar1DropWin")
    OogleCraftWeaponSetFrontBar1Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponSetFrontBar1Frame:SetDimensions(125, 50)
local OogleCraftWeaponSetFrontBar1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponSetFrontBar1Drop", OogleCraftWeaponSetFrontBar1Frame, "ScrollCombobox")
    OogleCraftWeaponSetFrontBar1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1375 + 7, 180)
    OogleCraftWeaponSetFrontBar1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponSetFrontBar1DropdownContainer.name
local WeaponSetFrontBar1Dropdown = OogleCraftWeaponSetFrontBar1DropdownContainer.dropdown
    WeaponSetFrontBar1Dropdown:SetSelectedItem("[Front Bar #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponSetFrontBar1Choices do
    local entry = WeaponSetFrontBar1Dropdown:CreateItemEntry(OogleCraftWeaponSetFrontBar1Choices[i]) -- [, OnItemSelect]
    WeaponSetFrontBar1Dropdown:AddItem(entry)
end

local OogleCraftWeaponSetFrontBar2Choices = {
    "[Front Bar #2]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftWeaponSetFrontBar2Frame = wm:CreateTopLevelWindow("OogleCraftWeaponSetFrontBar2DropWin")
    OogleCraftWeaponSetFrontBar2Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponSetFrontBar2Frame:SetDimensions(125, 50)
local OogleCraftWeaponSetFrontBar2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponSetFrontBar2Drop", OogleCraftWeaponSetFrontBar2Frame, "ScrollCombobox")
    OogleCraftWeaponSetFrontBar2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1500 + 7, 180)
    OogleCraftWeaponSetFrontBar2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponSetFrontBar2DropdownContainer.name
local WeaponSetFrontBar2Dropdown = OogleCraftWeaponSetFrontBar2DropdownContainer.dropdown
    WeaponSetFrontBar2Dropdown:SetSelectedItem("[Front Bar #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponSetFrontBar2Choices do
    local entry = WeaponSetFrontBar2Dropdown:CreateItemEntry(OogleCraftWeaponSetFrontBar2Choices[i]) -- [, OnItemSelect]
    WeaponSetFrontBar2Dropdown:AddItem(entry)
end

local OogleCraftWeaponSetBackBar1Choices = {
    "[Back Bar #1]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftWeaponSetBackBar1Frame = wm:CreateTopLevelWindow("OogleCraftWeaponSetBackBar1DropWin")
    OogleCraftWeaponSetBackBar1Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponSetBackBar1Frame:SetDimensions(125, 50)
local OogleCraftWeaponSetBackBar1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponSetBackBar1Drop", OogleCraftWeaponSetBackBar1Frame, "ScrollCombobox")
    OogleCraftWeaponSetBackBar1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1625 + 7, 180)
    OogleCraftWeaponSetBackBar1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponSetBackBar1DropdownContainer.name
local WeaponSetBackBar1Dropdown = OogleCraftWeaponSetBackBar1DropdownContainer.dropdown
    WeaponSetBackBar1Dropdown:SetSelectedItem("[Back Bar #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponSetBackBar1Choices do
    local entry = WeaponSetBackBar1Dropdown:CreateItemEntry(OogleCraftWeaponSetBackBar1Choices[i]) -- [, OnItemSelect]
    WeaponSetBackBar1Dropdown:AddItem(entry)
end

local OogleCraftWeaponSetBackBar2Choices = {
    "[Back Bar #2]",
    "Set #1",
    "Set #2",
    "Set #3"
}

local OogleCraftWeaponSetBackBar2Frame = wm:CreateTopLevelWindow("OogleCraftWeaponSetBackBar2DropWin")
    OogleCraftWeaponSetBackBar2Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponSetBackBar2Frame:SetDimensions(125, 50)
local OogleCraftWeaponSetBackBar2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponSetBackBar2Drop", OogleCraftWeaponSetBackBar2Frame, "ScrollCombobox")
    OogleCraftWeaponSetBackBar2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1750 + 7, 180)
    OogleCraftWeaponSetBackBar2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponSetBackBar2DropdownContainer.name
local WeaponSetBackBar2Dropdown = OogleCraftWeaponSetBackBar2DropdownContainer.dropdown
    WeaponSetBackBar2Dropdown:SetSelectedItem("[Back Bar #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponSetBackBar2Choices do
    local entry = WeaponSetBackBar2Dropdown:CreateItemEntry(OogleCraftWeaponSetBackBar2Choices[i]) -- [, OnItemSelect]
    WeaponSetBackBar2Dropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Type Choices ------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponTypeFrontBar1Choices = {
    "[Front Bar #1]",
    "Axe",
    "Mace",
    "Sword",
    "Battle Axe",
    "Maul",
    "Greatsword",
    "Dagger",
    "Bow",
    "Inferno",
    "Ice",
    "Lightning",
    "Restoration"

}

local OogleCraftWeaponTypeFrontBar1Frame = wm:CreateTopLevelWindow("OogleCraftWeaponTypeFrontBar1DropWin")
    OogleCraftWeaponTypeFrontBar1Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponTypeFrontBar1Frame:SetDimensions(125, 50)
local OogleCraftWeaponTypeFrontBar1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponTypeFrontBar1Drop", OogleCraftWeaponTypeFrontBar1Frame, "ScrollCombobox")
    OogleCraftWeaponTypeFrontBar1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1375 + 7, 255)
    OogleCraftWeaponTypeFrontBar1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponTypeFrontBar1DropdownContainer.name
local WeaponTypeFrontBar1Dropdown = OogleCraftWeaponTypeFrontBar1DropdownContainer.dropdown
    WeaponTypeFrontBar1Dropdown:SetSelectedItem("[Front Bar #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponTypeFrontBar1Choices do
    local entry = WeaponTypeFrontBar1Dropdown:CreateItemEntry(OogleCraftWeaponTypeFrontBar1Choices[i]) -- [, OnItemSelect]
    WeaponTypeFrontBar1Dropdown:AddItem(entry)
end

local OogleCraftWeaponTypeFrontBar2Choices = {
    "[Front Bar #2]",
    "Axe",
    "Mace",
    "Sword",
    "Battle Axe",
    "Maul",
    "Greatsword",
    "Dagger",
    "Bow",
    "Inferno",
    "Ice",
    "Lightning",
    "Restoration"
}

local OogleCraftWeaponTypeFrontBar2Frame = wm:CreateTopLevelWindow("OogleCraftWeaponTypeFrontBar2DropWin")
    OogleCraftWeaponTypeFrontBar2Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponTypeFrontBar2Frame:SetDimensions(125, 50)
local OogleCraftWeaponTypeFrontBar2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponTypeFrontBar2Drop", OogleCraftWeaponTypeFrontBar2Frame, "ScrollCombobox")
    OogleCraftWeaponTypeFrontBar2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1500 + 7, 255)
    OogleCraftWeaponTypeFrontBar2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponTypeFrontBar2DropdownContainer.name
local WeaponTypeFrontBar2Dropdown = OogleCraftWeaponTypeFrontBar2DropdownContainer.dropdown
    WeaponTypeFrontBar2Dropdown:SetSelectedItem("[Front Bar #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponTypeFrontBar2Choices do
    local entry = WeaponTypeFrontBar2Dropdown:CreateItemEntry(OogleCraftWeaponTypeFrontBar2Choices[i]) -- [, OnItemSelect]
    WeaponTypeFrontBar2Dropdown:AddItem(entry)
end

local OogleCraftWeaponTypeBackBar1Choices = {
    "[Back Bar #1]",
    "Axe",
    "Mace",
    "Sword",
    "Battle Axe",
    "Maul",
    "Greatsword",
    "Dagger",
    "Bow",
    "Inferno",
    "Ice",
    "Lightning",
    "Restoration"
}

local OogleCraftWeaponTypeBackBar1Frame = wm:CreateTopLevelWindow("OogleCraftWeaponTypeBackBar1DropWin")
    OogleCraftWeaponTypeBackBar1Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponTypeBackBar1Frame:SetDimensions(125, 50)
local OogleCraftWeaponTypeBackBar1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponTypeBackBar1Drop", OogleCraftWeaponTypeBackBar1Frame, "ScrollCombobox")
    OogleCraftWeaponTypeBackBar1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1625 + 7, 255)
    OogleCraftWeaponTypeBackBar1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponTypeBackBar1DropdownContainer.name
local WeaponTypeBackBar1Dropdown = OogleCraftWeaponTypeBackBar1DropdownContainer.dropdown
    WeaponTypeBackBar1Dropdown:SetSelectedItem("[Back Bar #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponTypeBackBar1Choices do
    local entry = WeaponTypeBackBar1Dropdown:CreateItemEntry(OogleCraftWeaponTypeBackBar1Choices[i]) -- [, OnItemSelect]
    WeaponTypeBackBar1Dropdown:AddItem(entry)
end

local OogleCraftWeaponTypeBackBar2Choices = {
    "[Back Bar #2]",
    "Axe",
    "Mace",
    "Sword",
    "Battle Axe",
    "Maul",
    "Greatsword",
    "Dagger",
    "Bow",
    "Inferno",
    "Ice",
    "Lightning",
    "Restoration"
}

local OogleCraftWeaponTypeBackBar2Frame = wm:CreateTopLevelWindow("OogleCraftWeaponTypeBackBar2DropWin")
    OogleCraftWeaponTypeBackBar2Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponTypeBackBar2Frame:SetDimensions(125, 50)
local OogleCraftWeaponTypeBackBar2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponTypeBackBar2Drop", OogleCraftWeaponTypeBackBar2Frame, "ScrollCombobox")
    OogleCraftWeaponTypeBackBar2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1750 + 7, 255)
    OogleCraftWeaponTypeBackBar2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponTypeBackBar2DropdownContainer.name
local WeaponTypeBackBar2Dropdown = OogleCraftWeaponTypeBackBar2DropdownContainer.dropdown
    WeaponTypeBackBar2Dropdown:SetSelectedItem("[Back Bar #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponTypeBackBar2Choices do
    local entry = WeaponTypeBackBar2Dropdown:CreateItemEntry(OogleCraftWeaponTypeBackBar2Choices[i]) -- [, OnItemSelect]
    WeaponTypeBackBar2Dropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Trait Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponTraitFrontBar1Choices = {
    "[Front Bar #1]",
    "Powered",
    "Charged",
    "Precise",
    "Infused",
    "Defending",
    "Training",
    "Sharpened",
    "Decisive",
    "Nirnhoned"

}

local OogleCraftWeaponTraitFrontBar1Frame = wm:CreateTopLevelWindow("OogleCraftWeaponTraitFrontBar1DropWin")
    OogleCraftWeaponTraitFrontBar1Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponTraitFrontBar1Frame:SetDimensions(125, 50)
local OogleCraftWeaponTraitFrontBar1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponTraitFrontBar1Drop", OogleCraftWeaponTraitFrontBar1Frame, "ScrollCombobox")
    OogleCraftWeaponTraitFrontBar1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1375 + 7, 330)
    OogleCraftWeaponTraitFrontBar1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponTraitFrontBar1DropdownContainer.name
local WeaponTraitFrontBar1Dropdown = OogleCraftWeaponTraitFrontBar1DropdownContainer.dropdown
    WeaponTraitFrontBar1Dropdown:SetSelectedItem("[Front Bar #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponTraitFrontBar1Choices do
    local entry = WeaponTraitFrontBar1Dropdown:CreateItemEntry(OogleCraftWeaponTraitFrontBar1Choices[i]) -- [, OnItemSelect]
    WeaponTraitFrontBar1Dropdown:AddItem(entry)
end

local OogleCraftWeaponTraitFrontBar2Choices = {
    "[Front Bar #2]",
    "Powered",
    "Charged",
    "Precise",
    "Infused",
    "Defending",
    "Training",
    "Sharpened",
    "Decisive",
    "Nirnhoned"
}

local OogleCraftWeaponTraitFrontBar2Frame = wm:CreateTopLevelWindow("OogleCraftWeaponTraitFrontBar2DropWin")
    OogleCraftWeaponTraitFrontBar2Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponTraitFrontBar2Frame:SetDimensions(125, 50)
local OogleCraftWeaponTraitFrontBar2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponTraitFrontBar2Drop", OogleCraftWeaponTraitFrontBar2Frame, "ScrollCombobox")
    OogleCraftWeaponTraitFrontBar2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1500 + 7, 330)
    OogleCraftWeaponTraitFrontBar2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponTraitFrontBar2DropdownContainer.name
local WeaponTraitFrontBar2Dropdown = OogleCraftWeaponTraitFrontBar2DropdownContainer.dropdown
    WeaponTraitFrontBar2Dropdown:SetSelectedItem("[Front Bar #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponTraitFrontBar2Choices do
    local entry = WeaponTraitFrontBar2Dropdown:CreateItemEntry(OogleCraftWeaponTraitFrontBar2Choices[i]) -- [, OnItemSelect]
    WeaponTraitFrontBar2Dropdown:AddItem(entry)
end

local OogleCraftWeaponTraitBackBar1Choices = {
    "[Back Bar #1]",
    "Powered",
    "Charged",
    "Precise",
    "Infused",
    "Defending",
    "Training",
    "Sharpened",
    "Decisive",
    "Nirnhoned"
}

local OogleCraftWeaponTraitBackBar1Frame = wm:CreateTopLevelWindow("OogleCraftWeaponTraitBackBar1DropWin")
    OogleCraftWeaponTraitBackBar1Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponTraitBackBar1Frame:SetDimensions(125, 50)
local OogleCraftWeaponTraitBackBar1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponTraitBackBar1Drop", OogleCraftWeaponTraitBackBar1Frame, "ScrollCombobox")
    OogleCraftWeaponTraitBackBar1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1625 + 7, 330)
    OogleCraftWeaponTraitBackBar1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponTraitBackBar1DropdownContainer.name
local WeaponTraitBackBar1Dropdown = OogleCraftWeaponTraitBackBar1DropdownContainer.dropdown
    WeaponTraitBackBar1Dropdown:SetSelectedItem("[Back Bar #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponTraitBackBar1Choices do
    local entry = WeaponTraitBackBar1Dropdown:CreateItemEntry(OogleCraftWeaponTraitBackBar1Choices[i]) -- [, OnItemSelect]
    WeaponTraitBackBar1Dropdown:AddItem(entry)
end

local OogleCraftWeaponTraitBackBar2Choices = {
    "[Back Bar #2]",
    "Powered",
    "Charged",
    "Precise",
    "Infused",
    "Defending",
    "Training",
    "Sharpened",
    "Decisive",
    "Nirnhoned"
}

local OogleCraftWeaponTraitBackBar2Frame = wm:CreateTopLevelWindow("OogleCraftWeaponTraitBackBar2DropWin")
    OogleCraftWeaponTraitBackBar2Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponTraitBackBar2Frame:SetDimensions(125, 50)
local OogleCraftWeaponTraitBackBar2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponTraitBackBar2Drop", OogleCraftWeaponTraitBackBar2Frame, "ScrollCombobox")
    OogleCraftWeaponTraitBackBar2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1750 + 7, 330)
    OogleCraftWeaponTraitBackBar2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponTraitBackBar2DropdownContainer.name
local WeaponTraitBackBar2Dropdown = OogleCraftWeaponTraitBackBar2DropdownContainer.dropdown
    WeaponTraitBackBar2Dropdown:SetSelectedItem("[Back Bar #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponTraitBackBar2Choices do
    local entry = WeaponTraitBackBar2Dropdown:CreateItemEntry(OogleCraftWeaponTraitBackBar2Choices[i]) -- [, OnItemSelect]
    WeaponTraitBackBar2Dropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponEnchantQualityChoices = {
    "[Weapon Enchant Quality]",
    "White",
    "Green",
    "Blue",
    "Purple",
    "Yellow",
    "Orange"
}

local OogleCraftWeaponEnchantQualityFrame = wm:CreateTopLevelWindow("OogleCraftWeaponEnchantQualityDropWin")
    OogleCraftWeaponEnchantQualityFrame:SetAnchor(TOPLEFT)
    OogleCraftWeaponEnchantQualityFrame:SetDimensions(125, 50)
local OogleCraftWeaponEnchantQualityDropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponEnchantQualityDrop", OogleCraftWeaponEnchantQualityFrame, "ScrollCombobox")
    OogleCraftWeaponEnchantQualityDropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1375 + 7, 405)
    OogleCraftWeaponEnchantQualityDropdownContainer:GetNamedChild("Dropdown"):SetWidth(500)
-- local selected = OogleCraftWeaponEnchantQualityDropdownContainer.name
local WeaponEnchantQualityDropdown = OogleCraftWeaponEnchantQualityDropdownContainer.dropdown
    WeaponEnchantQualityDropdown:SetSelectedItem("[Weapon Enchant Quality]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponEnchantQualityChoices do
    local entry = WeaponEnchantQualityDropdown:CreateItemEntry(OogleCraftWeaponEnchantQualityChoices[i]) -- [, OnItemSelect]
    WeaponEnchantQualityDropdown:AddItem(entry)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Enchant Choices ---------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponEnchantFrontBar1Choices = {
    "[Front Bar #1]",
    "Absorb Health",
    "Absorb Magicka",
    "Absorb Stamina",
    "Decrease Health",
    "Poison",
    "Flame",
    "Frost",
    "Shock",
    "Foulness",
    "Crushing",
    "Weakening",
    "Weapon Damage",
    "Prismatic Onslaught"

}

local OogleCraftWeaponEnchantFrontBar1Frame = wm:CreateTopLevelWindow("OogleCraftWeaponEnchantFrontBar1DropWin")
    OogleCraftWeaponEnchantFrontBar1Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponEnchantFrontBar1Frame:SetDimensions(125, 50)
local OogleCraftWeaponEnchantFrontBar1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponEnchantFrontBar1Drop", OogleCraftWeaponEnchantFrontBar1Frame, "ScrollCombobox")
    OogleCraftWeaponEnchantFrontBar1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1375 + 7, 430)
    OogleCraftWeaponEnchantFrontBar1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponEnchantFrontBar1DropdownContainer.name
local WeaponEnchantFrontBar1Dropdown = OogleCraftWeaponEnchantFrontBar1DropdownContainer.dropdown
    WeaponEnchantFrontBar1Dropdown:SetSelectedItem("[Front Bar #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponEnchantFrontBar1Choices do
    local entry = WeaponEnchantFrontBar1Dropdown:CreateItemEntry(OogleCraftWeaponEnchantFrontBar1Choices[i]) -- [, OnItemSelect]
    WeaponEnchantFrontBar1Dropdown:AddItem(entry)
end

local OogleCraftWeaponEnchantFrontBar2Choices = {
    "[Front Bar #2]",
    "Absorb Health",
    "Absorb Magicka",
    "Absorb Stamina",
    "Decrease Health",
    "Poison",
    "Flame",
    "Frost",
    "Shock",
    "Foulness",
    "Crushing",
    "Weakening",
    "Weapon Damage",
    "Prismatic Onslaught"
}

local OogleCraftWeaponEnchantFrontBar2Frame = wm:CreateTopLevelWindow("OogleCraftWeaponEnchantFrontBar2DropWin")
    OogleCraftWeaponEnchantFrontBar2Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponEnchantFrontBar2Frame:SetDimensions(125, 50)
local OogleCraftWeaponEnchantFrontBar2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponEnchantFrontBar2Drop", OogleCraftWeaponEnchantFrontBar2Frame, "ScrollCombobox")
    OogleCraftWeaponEnchantFrontBar2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1500 + 7, 430)
    OogleCraftWeaponEnchantFrontBar2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponEnchantFrontBar2DropdownContainer.name
local WeaponEnchantFrontBar2Dropdown = OogleCraftWeaponEnchantFrontBar2DropdownContainer.dropdown
    WeaponEnchantFrontBar2Dropdown:SetSelectedItem("[Front Bar #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponEnchantFrontBar2Choices do
    local entry = WeaponEnchantFrontBar2Dropdown:CreateItemEntry(OogleCraftWeaponEnchantFrontBar2Choices[i]) -- [, OnItemSelect]
    WeaponEnchantFrontBar2Dropdown:AddItem(entry)
end

local OogleCraftWeaponEnchantBackBar1Choices = {
    "[Back Bar #1]",
    "Absorb Health",
    "Absorb Magicka",
    "Absorb Stamina",
    "Decrease Health",
    "Poison",
    "Flame",
    "Frost",
    "Shock",
    "Foulness",
    "Crushing",
    "Weakening",
    "Weapon Damage",
    "Prismatic Onslaught"
}

local OogleCraftWeaponEnchantBackBar1Frame = wm:CreateTopLevelWindow("OogleCraftWeaponEnchantBackBar1DropWin")
    OogleCraftWeaponEnchantBackBar1Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponEnchantBackBar1Frame:SetDimensions(125, 50)
local OogleCraftWeaponEnchantBackBar1DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponEnchantBackBar1Drop", OogleCraftWeaponEnchantBackBar1Frame, "ScrollCombobox")
    OogleCraftWeaponEnchantBackBar1DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1625 + 7, 430)
    OogleCraftWeaponEnchantBackBar1DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponEnchantBackBar1DropdownContainer.name
local WeaponEnchantBackBar1Dropdown = OogleCraftWeaponEnchantBackBar1DropdownContainer.dropdown
    WeaponEnchantBackBar1Dropdown:SetSelectedItem("[Back Bar #1]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponEnchantBackBar1Choices do
    local entry = WeaponEnchantBackBar1Dropdown:CreateItemEntry(OogleCraftWeaponEnchantBackBar1Choices[i]) -- [, OnItemSelect]
    WeaponEnchantBackBar1Dropdown:AddItem(entry)
end

local OogleCraftWeaponEnchantBackBar2Choices = {
    "[Back Bar #2]",
    "Absorb Health",
    "Absorb Magicka",
    "Absorb Stamina",
    "Decrease Health",
    "Poison",
    "Flame",
    "Frost",
    "Shock",
    "Foulness",
    "Crushing",
    "Weakening",
    "Weapon Damage",
    "Prismatic Onslaught"
}

local OogleCraftWeaponEnchantBackBar2Frame = wm:CreateTopLevelWindow("OogleCraftWeaponEnchantBackBar2DropWin")
    OogleCraftWeaponEnchantBackBar2Frame:SetAnchor(TOPLEFT)
    OogleCraftWeaponEnchantBackBar2Frame:SetDimensions(125, 50)
local OogleCraftWeaponEnchantBackBar2DropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeaponEnchantBackBar2Drop", OogleCraftWeaponEnchantBackBar2Frame, "ScrollCombobox")
    OogleCraftWeaponEnchantBackBar2DropdownContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, 1750 + 7, 430)
    OogleCraftWeaponEnchantBackBar2DropdownContainer:GetNamedChild("Dropdown"):SetWidth(125)
-- local selected = OogleCraftWeaponEnchantBackBar2DropdownContainer.name
local WeaponEnchantBackBar2Dropdown = OogleCraftWeaponEnchantBackBar2DropdownContainer.dropdown
    WeaponEnchantBackBar2Dropdown:SetSelectedItem("[Back Bar #2]")

--[[
local function OnItemSelect(_, choiceText, choice)
    d(choiceText, choice)
end
--]]

for i=1,#OogleCraftWeaponEnchantBackBar2Choices do
    local entry = WeaponEnchantBackBar2Dropdown:CreateItemEntry(OogleCraftWeaponEnchantBackBar2Choices[i]) -- [, OnItemSelect]
    WeaponEnchantBackBar2Dropdown:AddItem(entry)
end