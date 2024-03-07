OogleCraft = {}
OogleCraft.name = "OogleCraft"

local wm = WINDOW_MANAGER

local function createDropdown(frameName, choices, xOffset, yOffset, dropWide)
    local frame = wm:CreateTopLevelWindow("OogleCraftWeapon" .. frameName .. "DropWin")
    frame:SetAnchor(TOPLEFT)
    frame:SetDimensions(125, 50)

    local dropdownContainer = wm:CreateControlFromVirtual("OogleCraftWeapon" .. frameName .. "Drop", frame, "ScrollCombobox")
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
--- Weapon Quality Choices ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponSetQualityChoices = {"[Weapon Quality]", "White", "Green", "Blue", "Purple", "Yellow", "Orange"}

createDropdown("SetQuality", OogleCraftWeaponSetQualityChoices, 1375, 155, 500)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Set Choices -------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponSetFrontBar1Choices = {"[Front Bar #1]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetFrontBar2Choices = {"[Front Bar #1]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetBackBar1Choices = {"[Front Bar #1]", "Set #1", "Set #2", "Set #3"}
local OogleCraftWeaponSetBackBar2Choices = {"[Front Bar #1]", "Set #1", "Set #2", "Set #3"}

createDropdown("SetFrontBar1", OogleCraftWeaponSetFrontBar1Choices, 1375, 180, 125)
createDropdown("SetFrontBar2", OogleCraftWeaponSetFrontBar2Choices, 1500, 180, 125)
createDropdown("SetBackBar1", OogleCraftWeaponSetBackBar1Choices, 1625, 180, 125)
createDropdown("SetBackBar2", OogleCraftWeaponSetBackBar2Choices, 1750, 180, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Type Choices ------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponTypeFrontBar1Choices = {"[Front Bar #1]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeFrontBar2Choices = {"[Front Bar #2]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeBackBar1Choices = {"[Back Bar #1]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}
local OogleCraftWeaponTypeBackBar2Choices = {"[Back Bar #2]", "Axe", "Mace", "Sword", "Battle Axe", "Maul", "Greatsword", "Dagger", "Bow", "Inferno", "Ice", "Lightning", "Restoration"}

createDropdown("TypeFrontBar1", OogleCraftWeaponTypeFrontBar1Choices, 1375, 255, 125)
createDropdown("TypeFrontBar2", OogleCraftWeaponTypeFrontBar2Choices, 1500, 255, 125)
createDropdown("TypeBackBar1", OogleCraftWeaponTypeBackBar1Choices, 1625, 255, 125)
createDropdown("TypeBackBar2", OogleCraftWeaponTypeBackBar2Choices, 1750, 255, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Trait Choices -----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponTraitFrontBar1Choices = {"[Front Bar #1]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitFrontBar2Choices = {"[Front Bar #2]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitBackBar1Choices = {"[Back Bar #1]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}
local OogleCraftWeaponTraitBackBar2Choices = {"[Back Bar #2]", "Powered", "Charged", "Precise", "Infused", "Defending", "Training", "Sharpened", "Decisive", "Nirnhoned"}

createDropdown("TraitFrontBar1", OogleCraftWeaponTraitFrontBar1Choices, 1375, 330, 125)
createDropdown("TraitFrontBar2", OogleCraftWeaponTraitFrontBar2Choices, 1500, 330, 125)
createDropdown("TraitBackBar1", OogleCraftWeaponTraitBackBar1Choices, 1625, 330, 125)
createDropdown("TraitBackBar2", OogleCraftWeaponTraitBackBar2Choices, 1750, 330, 125)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Enchant Quality ----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponEnchantQualityChoices = {"[Weapon Enchant Quality]", "White", "Green", "Blue", "Purple", "Yellow"}

createDropdown("EnchantQuality", OogleCraftWeaponEnchantQualityChoices, 1375, 405, 500)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Weapon Enchant Choices ---------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local OogleCraftWeaponEnchantFrontBar1Choices = {"[Front Bar #1]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantFrontBar2Choices = {"[Front Bar #2]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantBackBar1Choices = {"[Back Bar #1]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}
local OogleCraftWeaponEnchantBackBar2Choices = {"[Back Bar #2]", "Absorb Health", "Absorb Magicka", "Absorb Stamina", "Decrease Health", "Poison", "Flame", "Frost", "Shock", "Foulness", "Crushing", "Weakening", "Weapon Damage", "Prismatic Onslaught"}

createDropdown("EnchantFrontBar1", OogleCraftWeaponEnchantFrontBar1Choices, 1375, 430, 125)
createDropdown("EnchantFrontBar2", OogleCraftWeaponEnchantFrontBar2Choices, 1500, 430, 125)
createDropdown("EnchantBackBar1", OogleCraftWeaponEnchantBackBar1Choices, 1625, 430, 125)
createDropdown("EnchantBackBar2", OogleCraftWeaponEnchantBackBar2Choices, 1750, 430, 125)
