OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

local function getStaticPatternChoices()
    OogleCraft.shieldCraftingOverride = CRAFTING_TYPE_WOODWORKING
    OogleCraft.shieldPattern = 2

    OogleCraft.ringCraftingOverride = CRAFTING_TYPE_JEWELRYCRAFTING
    OogleCraft.ringPattern = 1

    OogleCraft.necklaceCraftingOverride = CRAFTING_TYPE_JEWELRYCRAFTING
    OogleCraft.necklacePattern = 2
end

local function getIsCP()
    local dropdown = OogleCraftLvlDrop.dropdown
    local selectedItem = dropdown:GetSelectedItem()

    OogleCraft.isCP = nil

    if selectedItem == "[Level]" then
        OogleCraft.isCP = nil
    else
        if selectedItem == "Research" or selectedItem == "10" or selectedItem == "20" or selectedItem == "30" or selectedItem == "40" or selectedItem == "50" then
            OogleCraft.isCP = false
        else
            OogleCraft.isCP = true
        end
    end
    --d(OogleCraft.isCP)
end

local function getDesiredLevel()
    local dropdown = OogleCraftLvlDrop.dropdown
    local selectedItem = dropdown:GetSelectedItem()
    local nonCpStrings = {"10", "20", "30", "40", "50"}
    local nonCpInts = {10, 20, 30, 40, 50}
    local isCpStrings = {"CP 10", "CP 20", "CP 30", "CP 40", "CP 50", "CP 60", "CP 70", "CP 80", "CP 90", "CP 100", "CP 110", "CP 120", "CP 130", "CP 140", "CP 150", "CP 160"}
    local isCpInts = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 160}

    OogleCraft.desiredLevel = nil

    if selectedItem == "Research" then
        OogleCraft.desiredLevel = 1
    else
        for index, value in ipairs(nonCpStrings) do
            if selectedItem == value then
                OogleCraft.desiredLevel = nonCpInts[index]
                break
            end
        end

        if OogleCraft.desiredLevel == nil then
            for index, value in ipairs(isCpStrings) do
                if selectedItem == value then
                    OogleCraft.desiredLevel = isCpInts[index]
                    break
                end
            end
        end
    end
    --d(OogleCraft.desiredLevel)
end

local function getDesiredSetName()
    local set1Dropdown = OogleCraftSet1ListDrop.dropdown
    local set2Dropdown = OogleCraftSet2ListDrop.dropdown
    local set3Dropdown = OogleCraftSet3ListDrop.dropdown

    local set1SelectedItem = set1Dropdown:GetSelectedItem()
    local set2SelectedItem = set2Dropdown:GetSelectedItem()
    local set3SelectedItem = set3Dropdown:GetSelectedItem()

    local setIndeces = OogleCraft.setIndeces

    OogleCraft.desiredSet1Name = nil
    OogleCraft.desiredSet2Name = nil
    OogleCraft.desiredSet3Name = nil

    if set1SelectedItem == "[Set #1]" then
        OogleCraft.desiredSet1Name = nil
    else
        if OogleCraft.desiredSet1Name == nil then
            for setName, index in pairs(setIndeces) do
                if set1SelectedItem == setName then
                    OogleCraft.desiredSet1Name = index
                    break
                end
            end
        end
    end
    if set2SelectedItem == "[Set #2]" then
        OogleCraft.desiredSet2Name = nil
    else
        if OogleCraft.desiredSet2Name == nil then
            for setName, index in pairs(setIndeces) do
                if set2SelectedItem == setName then
                    OogleCraft.desiredSet2Name = index
                    break
                end
            end
        end
    end
    if set3SelectedItem == "[Set #3]" then
        OogleCraft.desiredSet3Name = nil
    else
        if OogleCraft.desiredSet3Name == nil then
            for setName, index in pairs(setIndeces) do
                if set3SelectedItem == setName then
                    OogleCraft.desiredSet3Name = index
                    break
                end
            end
        end
    end

    --[[
    d("Set #1:")
    d(OogleCraft.desiredSet1Name)
    d("Set #2:")
    d(OogleCraft.desiredSet2Name)
    d("Set #3:")
    d(OogleCraft.desiredSet3Name)
    --]]
end

local function getDesiredStyleName()
    local dropdown = OogleCraftStyleListDrop.dropdown
    local selectedItem = dropdown:GetSelectedItem()
    local setIndeces = OogleCraft.styleIndeces

    OogleCraft.desiredStyleName = nil

    if selectedItem == "[Style]" then
        OogleCraft.desiredStyleName = nil
    else
        if OogleCraft.desiredStyleName == nil then
            for setName, index in pairs(setIndeces) do
                if selectedItem == setName then
                    OogleCraft.desiredStyleName = index
                    break
                end
            end
        end
    end
    --d(OogleCraft.desiredStyleName)
end

local function getDesiredArmorQuality()
    local dropdown = OogleCraftArmorArmorSetQualityDrop.dropdown
    local selectedItem = dropdown:GetSelectedItem()
    local qualityStrings = {"White", "Green", "Blue", "Purple", "Yellow"}
    local qualityIndeces = {1, 2, 3, 4, 5}

    OogleCraft.desiredArmorQuality = nil

    if selectedItem == "[Armor Quality]" then
        OogleCraft.desiredArmorQuality = nil
    else
        if OogleCraft.desiredArmorQuality == nil then
            for index, value in ipairs(qualityStrings) do
                if selectedItem == value then
                    OogleCraft.desiredArmorQuality = qualityIndeces[index]
                    break
                end
            end
        end
    end
    --d(OogleCraft.desiredArmorQuality)
end

local function getDesiredJewelryQuality()
    local dropdown = OogleCraftJewelryJewelrySetQualityDrop.dropdown
    local selectedItem = dropdown:GetSelectedItem()
    local qualityStrings = {"White", "Green", "Blue", "Purple", "Yellow"}
    local qualityIndeces = {1, 2, 3, 4, 5}

    OogleCraft.desiredJewelryQuality = nil

    if selectedItem == "[Jewelry Quality]" then
        OogleCraft.desiredJewelryQuality = nil
    else
        if OogleCraft.desiredJewelryQuality == nil then
            for index, value in ipairs(qualityStrings) do
                if selectedItem == value then
                    OogleCraft.desiredJewelryQuality = qualityIndeces[index]
                    break
                end
            end
        end
    end
    --d(OogleCraft.desiredJewelryQuality)
end

local function getDesiredWeaponQuality()
    local dropdown = OogleCraftWeaponWeaponSetQualityDrop.dropdown
    local selectedItem = dropdown:GetSelectedItem()
    local qualityStrings = {"White", "Green", "Blue", "Purple", "Yellow"}
    local qualityIndeces = {1, 2, 3, 4, 5}

    OogleCraft.desiredWeaponQuality = nil

    if selectedItem == "[Armor Quality]" then
        OogleCraft.desiredWeaponQuality = nil
    else
        if OogleCraft.desiredWeaponQuality == nil then
            for index, value in ipairs(qualityStrings) do
                if selectedItem == value then
                    OogleCraft.desiredWeaponQuality = qualityIndeces[index]
                    break
                end
            end
        end
    end
    --d(OogleCraft.desiredWeaponQuality)
end

local function getDesiredArmorEnchantQuality()
    local dropdown = OogleCraftArmorArmorEnchantQualityDrop.dropdown
    local selectedItem = dropdown:GetSelectedItem()
    local qualityStrings = {"White", "Green", "Blue", "Purple", "Yellow"}
    local qualityIndeces = {45850, 45851, 45852, 45853, 45854}

    OogleCraft.desiredArmorEnchantQuality = nil

    if selectedItem == "[Armor Enchant Quality]" or selectedItem == "None" then
        OogleCraft.desiredArmorEnchantQuality = nil
    else
        if OogleCraft.desiredArmorEnchantQuality == nil then
            for index, value in ipairs(qualityStrings) do
                if selectedItem == value then
                    OogleCraft.desiredArmorEnchantQuality = qualityIndeces[index]
                    break
                end
            end
        end
    end
    --d(OogleCraft.desiredArmorEnchantQuality)
end

local function getDesiredJewelryEnchantQuality()
    local dropdown = OogleCraftJewelryJewelryEnchantQualityDrop.dropdown
    local selectedItem = dropdown:GetSelectedItem()
    local qualityStrings = {"White", "Green", "Blue", "Purple", "Yellow"}
    local qualityIndeces = {45850, 45851, 45852, 45853, 45854}

    OogleCraft.desiredJewelryEnchantQuality = nil

    if selectedItem == "[Jewelry Enchant Quality]" or selectedItem == "None" then
        OogleCraft.desiredJewelryEnchantQuality = nil
    else
        if OogleCraft.desiredJewelryEnchantQuality == nil then
            for index, value in ipairs(qualityStrings) do
                if selectedItem == value then
                    OogleCraft.desiredJewelryEnchantQuality = qualityIndeces[index]
                    break
                end
            end
        end
    end
    --d(OogleCraft.desiredJewelryEnchantQuality)
end

local function getDesiredWeaponEnchantQuality()
    local dropdown = OogleCraftWeaponWeaponEnchantQualityDrop.dropdown
    local selectedItem = dropdown:GetSelectedItem()
    local qualityStrings = {"White", "Green", "Blue", "Purple", "Yellow"}
    local qualityIndeces = {45850, 45851, 45852, 45853, 45854}

    OogleCraft.desiredWeaponEnchantQuality = nil

    if selectedItem == "[Weapon Enchant Quality]" or selectedItem == "None" then
        OogleCraft.desiredWeaponEnchantQuality = nil
    else
        if OogleCraft.desiredWeaponEnchantQuality == nil then
            for index, value in ipairs(qualityStrings) do
                if selectedItem == value then
                    OogleCraft.desiredWeaponEnchantQuality = qualityIndeces[index]
                    break
                end
            end
        end
    end
    --d(OogleCraft.desiredWeaponEnchantQuality)
end

local function getArmorSetNumber()

    getDesiredSetName()

    local shieldDropdown = OogleCraftArmorSetShieldDrop.dropdown
    local chestDropdown = OogleCraftArmorSetChestDrop.dropdown
    local feetDropdown = OogleCraftArmorSetFeetDrop.dropdown
    local handsDropdown = OogleCraftArmorSetHandsDrop.dropdown
    local legsDropdown = OogleCraftArmorSetLegsDrop.dropdown
    local waistDropdown = OogleCraftArmorSetWaistDrop.dropdown
    local headDropdown = OogleCraftArmorSetHeadDrop.dropdown
    local shouldersDropdown = OogleCraftArmorSetShouldersDrop.dropdown

    local shieldSelectedItem = shieldDropdown:GetSelectedItem()
    local chestSelectedItem = chestDropdown:GetSelectedItem()
    local feetSelectedItem = feetDropdown:GetSelectedItem()
    local handsSelectedItem = handsDropdown:GetSelectedItem()
    local legsSelectedItem = legsDropdown:GetSelectedItem()
    local waistSelectedItem = waistDropdown:GetSelectedItem()
    local headSelectedItem = headDropdown:GetSelectedItem()
    local shouldersSelectedItem = shouldersDropdown:GetSelectedItem()

    OogleCraft.setShieldNumber = nil
    OogleCraft.setChestNumber = nil
    OogleCraft.setFeetNumber = nil
    OogleCraft.setHandsNumber = nil
    OogleCraft.setLegsNumber = nil
    OogleCraft.setWaistNumber = nil
    OogleCraft.setHeadNumber = nil
    OogleCraft.setShouldersNumber = nil

    if shieldSelectedItem == "[Set#]" then
        OogleCraft.setShieldNumber = nil
    elseif shieldSelectedItem == "Set #1" then
        OogleCraft.setShieldNumber = OogleCraft.desiredSet1Name
    elseif shieldSelectedItem == "Set #2" then
        OogleCraft.setShieldNumber = OogleCraft.desiredSet2Name
    elseif shieldSelectedItem == "Set #3" then
        OogleCraft.setShieldNumber = OogleCraft.desiredSet3Name
    end

    if chestSelectedItem == "[Set#]" then
        OogleCraft.setChestNumber = nil
    elseif chestSelectedItem == "Set #1" then
        OogleCraft.setChestNumber = OogleCraft.desiredSet1Name
    elseif chestSelectedItem == "Set #2" then
        OogleCraft.setChestNumber = OogleCraft.desiredSet2Name
    elseif chestSelectedItem == "Set #3" then
        OogleCraft.setChestNumber = OogleCraft.desiredSet3Name
    end

    if feetSelectedItem == "[Set#]" then
        OogleCraft.setFeetNumber = nil
    elseif feetSelectedItem == "Set #1" then
        OogleCraft.setFeetNumber = OogleCraft.desiredSet1Name
    elseif feetSelectedItem == "Set #2" then
        OogleCraft.setFeetNumber = OogleCraft.desiredSet2Name
    elseif feetSelectedItem == "Set #3" then
        OogleCraft.setFeetNumber = OogleCraft.desiredSet3Name
    end

    if handsSelectedItem == "[Set#]" then
        OogleCraft.setHandsNumber = nil
    elseif handsSelectedItem == "Set #1" then
        OogleCraft.setHandsNumber = OogleCraft.desiredSet1Name
    elseif handsSelectedItem == "Set #2" then
        OogleCraft.setHandsNumber = OogleCraft.desiredSet2Name
    elseif handsSelectedItem == "Set #3" then
        OogleCraft.setHandsNumber = OogleCraft.desiredSet3Name
    end

    if legsSelectedItem == "[Set#]" then
        OogleCraft.setLegsNumber = nil
    elseif legsSelectedItem == "Set #1" then
        OogleCraft.setLegsNumber = OogleCraft.desiredSet1Name
    elseif legsSelectedItem == "Set #2" then
        OogleCraft.setLegsNumber = OogleCraft.desiredSet2Name
    elseif legsSelectedItem == "Set #3" then
        OogleCraft.setLegsNumber = OogleCraft.desiredSet3Name
    end

    if waistSelectedItem == "[Set#]" then
        OogleCraft.setWaistNumber = nil
    elseif waistSelectedItem == "Set #1" then
        OogleCraft.setWaistNumber = OogleCraft.desiredSet1Name
    elseif waistSelectedItem == "Set #2" then
        OogleCraft.setWaistNumber = OogleCraft.desiredSet2Name
    elseif waistSelectedItem == "Set #3" then
        OogleCraft.setWaistNumber = OogleCraft.desiredSet3Name
    end

    if headSelectedItem == "[Set#]" then
        OogleCraft.setHeadNumber = nil
    elseif headSelectedItem == "Set #1" then
        OogleCraft.setHeadNumber = OogleCraft.desiredSet1Name
    elseif headSelectedItem == "Set #2" then
        OogleCraft.setHeadNumber = OogleCraft.desiredSet2Name
    elseif headSelectedItem == "Set #3" then
        OogleCraft.setHeadNumber = OogleCraft.desiredSet3Name
    end

    if shouldersSelectedItem == "[Set#]" then
        OogleCraft.setShouldersNumber = nil
    elseif shouldersSelectedItem == "Set #1" then
        OogleCraft.setShouldersNumber = OogleCraft.desiredSet1Name
    elseif shouldersSelectedItem == "Set #2" then
        OogleCraft.setShouldersNumber = OogleCraft.desiredSet2Name
    elseif shouldersSelectedItem == "Set #3" then
        OogleCraft.setShouldersNumber = OogleCraft.desiredSet3Name
    end

    --[[
    d("Shield:")
    d(OogleCraft.setShieldNumber)
    d("Chest:")
    d(OogleCraft.setChestNumber)
    d("Feet:")
    d(OogleCraft.setFeetNumber)
    d("Hands:")
    d(OogleCraft.setHandsNumber)
    d("Legs:")
    d(OogleCraft.setLegsNumber)
    d("Waist:")
    d(OogleCraft.setWaistNumber)
    d("Head:")
    d(OogleCraft.setHeadNumber)
    d("Shoulders:")
    d(OogleCraft.setShouldersNumber)
    --]]
end

local function getJewelrySetNumber()

    getDesiredSetName()

    local ring1Dropdown = OogleCraftJewelrySetRing1Drop.dropdown
    local ring2Dropdown = OogleCraftJewelrySetRing2Drop.dropdown
    local necklaceDropdown = OogleCraftJewelrySetNecklaceDrop.dropdown

    local ring1SelectedItem = ring1Dropdown:GetSelectedItem()
    local ring2SelectedItem = ring2Dropdown:GetSelectedItem()
    local necklaceSelectedItem = necklaceDropdown:GetSelectedItem()

    OogleCraft.setRing1Number = nil
    OogleCraft.setRing2Number = nil
    OogleCraft.setNecklaceNumber = nil

    if ring1SelectedItem == "[Set#]" then
        OogleCraft.setRing1Number = nil
    elseif ring1SelectedItem == "Set #1" then
        OogleCraft.setRing1Number = OogleCraft.desiredSet1Name
    elseif ring1SelectedItem == "Set #2" then
        OogleCraft.setRing1Number = OogleCraft.desiredSet2Name
    elseif ring1SelectedItem == "Set #3" then
        OogleCraft.setRing1Number = OogleCraft.desiredSet3Name
    end

    if ring2SelectedItem == "[Set#]" then
        OogleCraft.setRing2Number = nil
    elseif ring2SelectedItem == "Set #1" then
        OogleCraft.setRing2Number = OogleCraft.desiredSet1Name
    elseif ring2SelectedItem == "Set #2" then
        OogleCraft.setRing2Number = OogleCraft.desiredSet2Name
    elseif ring2SelectedItem == "Set #3" then
        OogleCraft.setRing2Number = OogleCraft.desiredSet3Name
    end

    if necklaceSelectedItem == "[Set#]" then
        OogleCraft.setNecklaceNumber = nil
    elseif necklaceSelectedItem == "Set #1" then
        OogleCraft.setNecklaceNumber = OogleCraft.desiredSet1Name
    elseif necklaceSelectedItem == "Set #2" then
        OogleCraft.setNecklaceNumber = OogleCraft.desiredSet2Name
    elseif necklaceSelectedItem == "Set #3" then
        OogleCraft.setNecklaceNumber = OogleCraft.desiredSet3Name
    end

--[[
    d("Ring1:")
    d(OogleCraft.setRing1Number)
    d("Ring2:")
    d(OogleCraft.setRing2Number)
    d("Necklace:")
    d(OogleCraft.setNecklaceNumber)
    --]]
end

local function getWeaponSetNumber()

    getDesiredSetName()

    local fb1Dropdown = OogleCraftWeaponSetFrontBar1Drop.dropdown
    local fb2Dropdown = OogleCraftWeaponSetFrontBar2Drop.dropdown
    local bb1Dropdown = OogleCraftWeaponSetBackBar1Drop.dropdown
    local bb2Dropdown = OogleCraftWeaponSetBackBar2Drop.dropdown

    local fb1SelectedItem = fb1Dropdown:GetSelectedItem()
    local fb2SelectedItem = fb2Dropdown:GetSelectedItem()
    local bb1SelectedItem = bb1Dropdown:GetSelectedItem()
    local bb2SelectedItem = bb2Dropdown:GetSelectedItem()

    OogleCraft.setFB1Number = nil
    OogleCraft.setFB2Number = nil
    OogleCraft.setBB1Number = nil
    OogleCraft.setBB2Number = nil

    if fb1SelectedItem == "[Set#]" then
        OogleCraft.setFB1Number = nil
    elseif fb1SelectedItem == "Set #1" then
        OogleCraft.setFB1Number = OogleCraft.desiredSet1Name
    elseif fb1SelectedItem == "Set #2" then
        OogleCraft.setFB1Number = OogleCraft.desiredSet2Name
    elseif fb1SelectedItem == "Set #3" then
        OogleCraft.setFB1Number = OogleCraft.desiredSet3Name
    end

    if fb2SelectedItem == "[Set#]" then
        OogleCraft.setFB2Number = nil
    elseif fb2SelectedItem == "Set #1" then
        OogleCraft.setFB2Number = OogleCraft.desiredSet1Name
    elseif fb2SelectedItem == "Set #2" then
        OogleCraft.setFB2Number = OogleCraft.desiredSet2Name
    elseif fb2SelectedItem == "Set #3" then
        OogleCraft.setFB2Number = OogleCraft.desiredSet3Name
    end

    if bb1SelectedItem == "[Set#]" then
        OogleCraft.setBB1Number = nil
    elseif bb1SelectedItem == "Set #1" then
        OogleCraft.setBB1Number = OogleCraft.desiredSet1Name
    elseif bb1SelectedItem == "Set #2" then
        OogleCraft.setBB1Number = OogleCraft.desiredSet2Name
    elseif bb1SelectedItem == "Set #3" then
        OogleCraft.setBB1Number = OogleCraft.desiredSet3Name
    end

    if bb2SelectedItem == "[Set#]" then
        OogleCraft.setBB2Number = nil
    elseif bb2SelectedItem == "Set #1" then
        OogleCraft.setBB2Number = OogleCraft.desiredSet1Name
    elseif bb2SelectedItem == "Set #2" then
        OogleCraft.setBB2Number = OogleCraft.desiredSet2Name
    elseif bb2SelectedItem == "Set #3" then
        OogleCraft.setBB2Number = OogleCraft.desiredSet3Name
    end

    --[[
    d("FB1:")
    d(OogleCraft.setFB1Number)
    d("FB2:")
    d(OogleCraft.setFB2Number)
    d("BB1:")
    d(OogleCraft.setBB1Number)
    d("BB2:")
    d(OogleCraft.setBB2Number)
    --]]
end

local function getArmorWeight()

    local chestDropdown = OogleCraftArmorWeightChestDrop.dropdown
    local feetDropdown = OogleCraftArmorWeightFeetDrop.dropdown
    local handsDropdown = OogleCraftArmorWeightHandsDrop.dropdown
    local legsDropdown = OogleCraftArmorWeightLegsDrop.dropdown
    local waistDropdown = OogleCraftArmorWeightWaistDrop.dropdown
    local headDropdown = OogleCraftArmorWeightHeadDrop.dropdown
    local shouldersDropdown = OogleCraftArmorWeightShouldersDrop.dropdown

    local chestSelectedItem = chestDropdown:GetSelectedItem()
    local feetSelectedItem = feetDropdown:GetSelectedItem()
    local handsSelectedItem = handsDropdown:GetSelectedItem()
    local legsSelectedItem = legsDropdown:GetSelectedItem()
    local waistSelectedItem = waistDropdown:GetSelectedItem()
    local headSelectedItem = headDropdown:GetSelectedItem()
    local shouldersSelectedItem = shouldersDropdown:GetSelectedItem()

    OogleCraft.setChestWeight = nil
    OogleCraft.setFeetWeight = nil
    OogleCraft.setHandsWeight = nil
    OogleCraft.setLegsWeight = nil
    OogleCraft.setWaistWeight = nil
    OogleCraft.setHeadWeight = nil
    OogleCraft.setShouldersWeight = nil

    OogleCraft.setChestCraftingOverride = nil
    OogleCraft.setFeetCraftingOverride = nil
    OogleCraft.setHandsCraftingOverride = nil
    OogleCraft.setLegsCraftingOverride = nil
    OogleCraft.setWaistCraftingOverride = nil
    OogleCraft.setHeadCraftingOverride = nil
    OogleCraft.setShouldersCraftingOverride = nil

    if chestSelectedItem == "[Wgt.]" then
        OogleCraft.setChestCraftingOverride =   nil
        OogleCraft.setChestWeight =             nil
    elseif chestSelectedItem == "Light" then
        OogleCraft.setChestCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setChestWeight =             2
    elseif chestSelectedItem == "Medium" then
        OogleCraft.setChestCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setChestWeight =             9
    elseif chestSelectedItem == "Heavy" then
        OogleCraft.setChestCraftingOverride =   CRAFTING_TYPE_BLACKSMITHING
        OogleCraft.setChestWeight =             8
    end

    if feetSelectedItem == "[Wgt.]" then
        OogleCraft.setFeetCraftingOverride =   nil
        OogleCraft.setFeetWeight =             nil
    elseif feetSelectedItem == "Light" then
        OogleCraft.setFeetCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setFeetWeight =             3
    elseif feetSelectedItem == "Medium" then
        OogleCraft.setFeetCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setFeetWeight =             10
    elseif feetSelectedItem == "Heavy" then
        OogleCraft.setFeetCraftingOverride =   CRAFTING_TYPE_BLACKSMITHING
        OogleCraft.setFeetWeight =             9
    end

    if handsSelectedItem == "[Wgt.]" then
        OogleCraft.setHandsCraftingOverride =   nil
        OogleCraft.setHandsWeight =             nil
    elseif handsSelectedItem == "Light" then
        OogleCraft.setHandsCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setHandsWeight =             4
    elseif handsSelectedItem == "Medium" then
        OogleCraft.setHandsCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setHandsWeight =             11
    elseif handsSelectedItem == "Heavy" then
        OogleCraft.setHandsCraftingOverride =   CRAFTING_TYPE_BLACKSMITHING
        OogleCraft.setHandsWeight =             10
    end

    if legsSelectedItem == "[Wgt.]" then
        OogleCraft.setLegsCraftingOverride =   nil
        OogleCraft.setLegsWeight =             nil
    elseif legsSelectedItem == "Light" then
        OogleCraft.setLegsCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setLegsWeight =             6
    elseif legsSelectedItem == "Medium" then
        OogleCraft.setLegsCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setLegsWeight =             13
    elseif legsSelectedItem == "Heavy" then
        OogleCraft.setLegsCraftingOverride =   CRAFTING_TYPE_BLACKSMITHING
        OogleCraft.setLegsWeight =             12
    end

    if waistSelectedItem == "[Wgt.]" then
        OogleCraft.setWaistCraftingOverride =   nil
        OogleCraft.setWaistWeight =             nil
    elseif waistSelectedItem == "Light" then
        OogleCraft.setWaistCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setWaistWeight =             8
    elseif waistSelectedItem == "Medium" then
        OogleCraft.setWaistCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setWaistWeight =             15
    elseif waistSelectedItem == "Heavy" then
        OogleCraft.setWaistCraftingOverride =   CRAFTING_TYPE_BLACKSMITHING
        OogleCraft.setWaistWeight =             14
    end

    if headSelectedItem == "[Wgt.]" then
        OogleCraft.setHeadCraftingOverride =   nil
        OogleCraft.setHeadWeight =             nil
    elseif headSelectedItem == "Light" then
        OogleCraft.setHeadCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setHeadWeight =             5
    elseif headSelectedItem == "Medium" then
        OogleCraft.setHeadCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setHeadWeight =             12
    elseif headSelectedItem == "Heavy" then
        OogleCraft.setHeadCraftingOverride =   CRAFTING_TYPE_BLACKSMITHING
        OogleCraft.setHeadWeight =             11
    end

    if shouldersSelectedItem == "[Wgt.]" then
        OogleCraft.setShouldersCraftingOverride =   nil
        OogleCraft.setShouldersWeight =             nil
    elseif shouldersSelectedItem == "Light" then
        OogleCraft.setShouldersCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setShouldersWeight =             7
    elseif shouldersSelectedItem == "Medium" then
        OogleCraft.setShouldersCraftingOverride =   CRAFTING_TYPE_CLOTHIER
        OogleCraft.setShouldersWeight =             14
    elseif shouldersSelectedItem == "Heavy" then
        OogleCraft.setShouldersCraftingOverride =   CRAFTING_TYPE_BLACKSMITHING
        OogleCraft.setShouldersWeight =             13
    end

    --[[
    d("Chest:")
    d(OogleCraft.setChestWeight)
    d(OogleCraft.setChestCraftingOverride)
    d("Feet:")
    d(OogleCraft.setFeetWeight)
    d(OogleCraft.setFeetCraftingOverride)
    d("Hands:")
    d(OogleCraft.setHandsWeight)
    d(OogleCraft.setHandsCraftingOverride)
    d("Legs:")
    d(OogleCraft.setLegsWeight)
    d(OogleCraft.setLegsCraftingOverride)
    d("Waist:")
    d(OogleCraft.setWaistWeight)
    d(OogleCraft.setWaistCraftingOverride)
    d("Head:")
    d(OogleCraft.setHeadWeight)
    d(OogleCraft.setHeadCraftingOverride)
    d("Shoulders:")
    d(OogleCraft.setShouldersWeight)
    d(OogleCraft.setShouldersCraftingOverride)
    --]]
end

local function getWeaponType()
    local fb1Dropdown = OogleCraftWeaponTypeFrontBar1Drop.dropdown
    local fb2Dropdown = OogleCraftWeaponTypeFrontBar2Drop.dropdown
    local bb1Dropdown = OogleCraftWeaponTypeBackBar1Drop.dropdown
    local bb2Dropdown = OogleCraftWeaponTypeBackBar2Drop.dropdown

    local fb1SelectedItem = fb1Dropdown:GetSelectedItem()
    local fb2SelectedItem = fb2Dropdown:GetSelectedItem()
    local bb1SelectedItem = bb1Dropdown:GetSelectedItem()
    local bb2SelectedItem = bb2Dropdown:GetSelectedItem()

    local typeIndeces = OogleCraft.weaponTypeIndeces

    OogleCraft.setFB1Type = nil
    OogleCraft.setFB2Type = nil
    OogleCraft.setBB1Type = nil
    OogleCraft.setBB2Type = nil

    if fb1SelectedItem == "[Type]" then
        OogleCraft.setFB1Type = nil
    else
        if OogleCraft.setFB1Type == nil then
            for typeName, index in pairs(typeIndeces) do
                if fb1SelectedItem == typeName then
                    OogleCraft.setFB1Type = index
                    break
                end
            end
        end
    end

    if fb2SelectedItem == "[Type]" then
        OogleCraft.setFB2Type = nil
    else
        if OogleCraft.setFB2Type == nil then
            for typeName, index in pairs(typeIndeces) do
                if fb2SelectedItem == typeName then
                    OogleCraft.setFB2Type = index
                    break
                end
            end
        end
    end

    if bb1SelectedItem == "[Type]" then
        OogleCraft.setBB1Type = nil
    else
        if OogleCraft.setBB1Type == nil then
            for typeName, index in pairs(typeIndeces) do
                if bb1SelectedItem == typeName then
                    OogleCraft.setBB1Type = index
                    break
                end
            end
        end
    end

    if bb2SelectedItem == "[Type]" then
        OogleCraft.setBB2Type = nil
    else
        if OogleCraft.setBB2Type == nil then
            for typeName, index in pairs(typeIndeces) do
                if bb2SelectedItem == typeName then
                    OogleCraft.setBB2Type = index
                    break
                end
            end
        end
    end

--[[
    d("FB1 Type:")
    d(OogleCraft.setFB1Type)
    d("FB2 Type:")
    d(OogleCraft.setFB2Type)
    d("BB1 Type:")
    d(OogleCraft.setBB1Type)
    d("BB2 Type:")
    d(OogleCraft.setBB2Type)
    --]]
end

local function getWeaponCraftingOverride()
    local fb1Dropdown = OogleCraftWeaponTypeFrontBar1Drop.dropdown
    local fb2Dropdown = OogleCraftWeaponTypeFrontBar2Drop.dropdown
    local bb1Dropdown = OogleCraftWeaponTypeBackBar1Drop.dropdown
    local bb2Dropdown = OogleCraftWeaponTypeBackBar2Drop.dropdown

    local fb1SelectedItem = fb1Dropdown:GetSelectedItem()
    local fb2SelectedItem = fb2Dropdown:GetSelectedItem()
    local bb1SelectedItem = bb1Dropdown:GetSelectedItem()
    local bb2SelectedItem = bb2Dropdown:GetSelectedItem()

    OogleCraft.setFB1CraftingOverride = nil
    OogleCraft.setFB2CraftingOverride = nil
    OogleCraft.setBB1CraftingOverride = nil
    OogleCraft.setBB2CraftingOverride = nil

    if fb1SelectedItem == "[Type]" then
        OogleCraft.setFB1CraftingOverride =     nil
    elseif fb1SelectedItem == "Axe" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb1SelectedItem == "Mace" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb1SelectedItem == "Sword" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb1SelectedItem == "Battle Axe" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb1SelectedItem == "Maul" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb1SelectedItem == "Greatsword" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb1SelectedItem == "Dagger" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb1SelectedItem == "Bow" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif fb1SelectedItem == "Inferno" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif fb1SelectedItem == "Ice" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif fb1SelectedItem == "Lightning" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif fb1SelectedItem == "Restoration" then
        OogleCraft.setFB1CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    end

    if fb2SelectedItem == "[Type]" then
        OogleCraft.setFB2CraftingOverride =     nil
    elseif fb2SelectedItem == "Axe" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb2SelectedItem == "Mace" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb2SelectedItem == "Sword" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb2SelectedItem == "Battle Axe" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb2SelectedItem == "Maul" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb2SelectedItem == "Greatsword" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb2SelectedItem == "Dagger" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif fb2SelectedItem == "Bow" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif fb2SelectedItem == "Inferno" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif fb2SelectedItem == "Ice" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif fb2SelectedItem == "Lightning" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif fb2SelectedItem == "Restoration" then
        OogleCraft.setFB2CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    end

    if bb1SelectedItem == "[Type]" then
        OogleCraft.setBB1CraftingOverride =     nil
    elseif bb1SelectedItem == "Axe" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb1SelectedItem == "Mace" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb1SelectedItem == "Sword" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb1SelectedItem == "Battle Axe" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb1SelectedItem == "Maul" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb1SelectedItem == "Greatsword" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb1SelectedItem == "Dagger" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb1SelectedItem == "Bow" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif bb1SelectedItem == "Inferno" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif bb1SelectedItem == "Ice" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif bb1SelectedItem == "Lightning" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif bb1SelectedItem == "Restoration" then
        OogleCraft.setBB1CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    end

    if bb2SelectedItem == "[Type]" then
        OogleCraft.setBB2CraftingOverride =     nil
    elseif bb2SelectedItem == "Axe" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb2SelectedItem == "Mace" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb2SelectedItem == "Sword" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb2SelectedItem == "Battle Axe" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb2SelectedItem == "Maul" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb2SelectedItem == "Greatsword" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb2SelectedItem == "Dagger" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_BLACKSMITHING
    elseif bb2SelectedItem == "Bow" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif bb2SelectedItem == "Inferno" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif bb2SelectedItem == "Ice" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif bb2SelectedItem == "Lightning" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    elseif bb2SelectedItem == "Restoration" then
        OogleCraft.setBB2CraftingOverride =     CRAFTING_TYPE_WOODWORKING
    end

    --[[
    d("FB1 Override:")
    d(OogleCraft.setFB1CraftingOverride)
    d("FB2 Override:")
    d(OogleCraft.setFB2CraftingOverride)
    d("BB1 Override:")
    d(OogleCraft.setBB1CraftingOverride)
    d("BB2 Override:")
    d(OogleCraft.setBB2CraftingOverride)
    --]]
end

local function getArmorTrait()
    local shieldDropdown = OogleCraftArmorTraitShieldDrop.dropdown
    local chestDropdown = OogleCraftArmorTraitChestDrop.dropdown
    local feetDropdown = OogleCraftArmorTraitFeetDrop.dropdown
    local handsDropdown = OogleCraftArmorTraitHandsDrop.dropdown
    local legsDropdown = OogleCraftArmorTraitLegsDrop.dropdown
    local waistDropdown = OogleCraftArmorTraitWaistDrop.dropdown
    local headDropdown = OogleCraftArmorTraitHeadDrop.dropdown
    local shouldersDropdown = OogleCraftArmorTraitShouldersDrop.dropdown

    local shieldSelectedItem = shieldDropdown:GetSelectedItem()
    local chestSelectedItem = chestDropdown:GetSelectedItem()
    local feetSelectedItem = feetDropdown:GetSelectedItem()
    local handsSelectedItem = handsDropdown:GetSelectedItem()
    local legsSelectedItem = legsDropdown:GetSelectedItem()
    local waistSelectedItem = waistDropdown:GetSelectedItem()
    local headSelectedItem = headDropdown:GetSelectedItem()
    local shouldersSelectedItem = shouldersDropdown:GetSelectedItem()

    local traitIndeces = OogleCraft.armorTraitIndeces

    OogleCraft.setShieldTrait = nil
    OogleCraft.setChestTrait = nil
    OogleCraft.setFeetTrait = nil
    OogleCraft.setHandsTrait = nil
    OogleCraft.setLegsTrait = nil
    OogleCraft.setWaistTrait = nil
    OogleCraft.setHeadTrait = nil
    OogleCraft.setShouldersTrait = nil

    if shieldSelectedItem == "[Trait]" then
        OogleCraft.setShieldTrait = nil
    else
        if OogleCraft.setShieldTrait == nil then
            for traitName, index in pairs(traitIndeces) do
                if shieldSelectedItem == traitName then
                    OogleCraft.setShieldTrait = index
                    break
                end
            end
        end
    end
    if chestSelectedItem == "[Trait]" then
        OogleCraft.setChestTrait = nil
    else
        if OogleCraft.setChestTrait == nil then
            for traitName, index in pairs(traitIndeces) do
                if chestSelectedItem == traitName then
                    OogleCraft.setChestTrait = index
                    break
                end
            end
        end
    end
    if feetSelectedItem == "[Trait]" then
        OogleCraft.setFeetTrait = nil
    else
        if OogleCraft.setFeetTrait == nil then
            for traitName, index in pairs(traitIndeces) do
                if feetSelectedItem == traitName then
                    OogleCraft.setFeetTrait = index
                    break
                end
            end
        end
    end
    if handsSelectedItem == "[Trait]" then
        OogleCraft.setHandsTrait = nil
    else
        if OogleCraft.setHandsTrait == nil then
            for traitName, index in pairs(traitIndeces) do
                if handsSelectedItem == traitName then
                    OogleCraft.setHandsTrait = index
                    break
                end
            end
        end
    end
    if legsSelectedItem == "[Trait]" then
        OogleCraft.setLegsTrait = nil
    else
        if OogleCraft.setLegsTrait == nil then
            for traitName, index in pairs(traitIndeces) do
                if legsSelectedItem == traitName then
                    OogleCraft.setLegsTrait = index
                    break
                end
            end
        end
    end
    if waistSelectedItem == "[Trait]" then
        OogleCraft.setWaistTrait = nil
    else
        if OogleCraft.setWaistTrait == nil then
            for traitName, index in pairs(traitIndeces) do
                if waistSelectedItem == traitName then
                    OogleCraft.setWaistTrait = index
                    break
                end
            end
        end
    end
    if headSelectedItem == "[Trait]" then
        OogleCraft.setHeadTrait = nil
    else
        if OogleCraft.setHeadTrait == nil then
            for traitName, index in pairs(traitIndeces) do
                if headSelectedItem == traitName then
                    OogleCraft.setHeadTrait = index
                    break
                end
            end
        end
    end
    if shouldersSelectedItem == "[Trait]" then
        OogleCraft.setShouldersTrait = nil
    else
        if OogleCraft.setShouldersTrait == nil then
            for traitName, index in pairs(traitIndeces) do
                if shouldersSelectedItem == traitName then
                    OogleCraft.setShouldersTrait = index
                    break
                end
            end
        end
    end

    --[[
    d("Shield:")
    d(OogleCraft.setShieldTrait)
    d("Chest:")
    d(OogleCraft.setChestTrait)
    d("Feet:")
    d(OogleCraft.setFeetTrait)
    d("Hands:")
    d(OogleCraft.setHandsTrait)
    d("Legs:")
    d(OogleCraft.setLegsTrait)
    d("Waist:")
    d(OogleCraft.setWaistTrait)
    d("Head:")
    d(OogleCraft.setHeadTrait)
    d("Shoulders:")
    d(OogleCraft.setShouldersTrait)
    --]]
end

local function getJewelryTrait()
    local ring1Dropdown = OogleCraftJewelryTraitRing1Drop.dropdown
    local ring2Dropdown =OogleCraftJewelryTraitRing2Drop.dropdown
    local necklaceDropdown =OogleCraftJewelryTraitNecklaceDrop.dropdown

    local ring1SelectedItem = ring1Dropdown:GetSelectedItem()
    local ring2SelectedItem = ring2Dropdown:GetSelectedItem()
    local necklaceSelectedItem = necklaceDropdown:GetSelectedItem()

    local traitIndeces = OogleCraft.jewelryTraitIndeces

    OogleCraft.setRing1Trait = nil
    OogleCraft.setRing2Trait = nil
    OogleCraft.setNecklaceTrait = nil

    if ring1SelectedItem == "[Trait]" then
        OogleCraft.setRing1Trait = nil
    else
        if OogleCraft.setRing1Trait == nil then
            for traitName, index in pairs(traitIndeces) do
                if ring1SelectedItem == traitName then
                    OogleCraft.setRing1Trait = index
                    break
                end
            end
        end
    end
    if ring2SelectedItem == "[Trait]" then
        OogleCraft.setRing2Trait = nil
    else
        if OogleCraft.setRing2Trait == nil then
            for traitName, index in pairs(traitIndeces) do
                if ring2SelectedItem == traitName then
                    OogleCraft.setRing2Trait = index
                    break
                end
            end
        end
    end
    if necklaceSelectedItem == "[Trait]" then
        OogleCraft.setNecklaceTrait = nil
    else
        if OogleCraft.setNecklaceTrait == nil then
            for traitName, index in pairs(traitIndeces) do
                if necklaceSelectedItem == traitName then
                    OogleCraft.setNecklaceTrait = index
                    break
                end
            end
        end
    end

    --[[
    d("Ring1:")
    d(OogleCraft.setRing1Trait)
    d("Ring2:")
    d(OogleCraft.setRing2Trait)
    d("Necklace:")
    d(OogleCraft.setNecklaceTrait)
    --]]
end

local function getWeaponTrait()
    local fb1Dropdown = OogleCraftWeaponTraitFrontBar1Drop.dropdown
    local fb2Dropdown = OogleCraftWeaponTraitFrontBar2Drop.dropdown
    local bb1Dropdown = OogleCraftWeaponTraitBackBar1Drop.dropdown
    local bb2Dropdown = OogleCraftWeaponTraitBackBar2Drop.dropdown

    local fb1SelectedItem = fb1Dropdown:GetSelectedItem()
    local fb2SelectedItem = fb2Dropdown:GetSelectedItem()
    local bb1SelectedItem = bb1Dropdown:GetSelectedItem()
    local bb2SelectedItem = bb2Dropdown:GetSelectedItem()
    
    local traitIndeces = OogleCraft.weaponTraitIndeces

    OogleCraft.setFB1Trait = nil
    OogleCraft.setFB2Trait = nil
    OogleCraft.setBB1Trait = nil
    OogleCraft.setBB2Trait = nil

    if fb1SelectedItem == "[Trait]" then
        OogleCraft.setFB1Trait = nil
    else
        if OogleCraft.setFB1Trait == nil then
            for traitName, index in pairs(traitIndeces) do
                if fb1SelectedItem == traitName then
                    OogleCraft.setFB1Trait = index
                    break
                end
            end
        end
    end
    if fb2SelectedItem == "[Trait]" then
        OogleCraft.setFB2Trait = nil
    else
        if OogleCraft.setFB2Trait == nil then
            for traitName, index in pairs(traitIndeces) do
                if fb2SelectedItem == traitName then
                    OogleCraft.setFB2Trait = index
                    break
                end
            end
        end
    end
    if bb1SelectedItem == "[Trait]" then
        OogleCraft.setBB1Trait = nil
    else
        if OogleCraft.setBB1Trait == nil then
            for traitName, index in pairs(traitIndeces) do
                if bb1SelectedItem == traitName then
                    OogleCraft.setBB1Trait = index
                    break
                end
            end
        end
    end
    if bb2SelectedItem == "[Trait]" then
        OogleCraft.setBB2Trait = nil
    else
        if OogleCraft.setBB2Trait == nil then
            for traitName, index in pairs(traitIndeces) do
                if bb2SelectedItem == traitName then
                    OogleCraft.setBB2Trait = index
                    break
                end
            end
        end
    end

    --[[
    d("FB1:")
    d(OogleCraft.setFB1Trait)
    d("FB2:")
    d(OogleCraft.setFB2Trait)
    d("BB1:")
    d(OogleCraft.setBB1Trait)
    d("BB2:")
    d(OogleCraft.setBB2Trait)
    --]]
end

local function getArmorEnchantPotencyAndEssenceIndex()
    getDesiredLevel()

    local shieldDropdown = OogleCraftArmorEnchantShieldDrop.dropdown
    local chestDropdown = OogleCraftArmorEnchantChestDrop.dropdown
    local feetDropdown = OogleCraftArmorEnchantFeetDrop.dropdown
    local handsDropdown = OogleCraftArmorEnchantHandsDrop.dropdown
    local legsDropdown = OogleCraftArmorEnchantLegsDrop.dropdown
    local waistDropdown = OogleCraftArmorEnchantWaistDrop.dropdown
    local headDropdown = OogleCraftArmorEnchantHeadDrop.dropdown
    local shouldersDropdown = OogleCraftArmorEnchantShouldersDrop.dropdown
    local lvlDropdown = OogleCraftLvlDrop.dropdown

    local shieldSelectedItem = shieldDropdown:GetSelectedItem()
    local chestSelectedItem = chestDropdown:GetSelectedItem()
    local feetSelectedItem = feetDropdown:GetSelectedItem()
    local handsSelectedItem = handsDropdown:GetSelectedItem()
    local legsSelectedItem = legsDropdown:GetSelectedItem()
    local waistSelectedItem = waistDropdown:GetSelectedItem()
    local headSelectedItem = headDropdown:GetSelectedItem()
    local shouldersSelectedItem = shouldersDropdown:GetSelectedItem()
    local lvlSelectedItem = lvlDropdown:GetSelectedItem()

    OogleCraft.setShieldPotencyIndex = nil
    OogleCraft.setChestPotencyIndex = nil
    OogleCraft.setFeetPotencyIndex = nil
    OogleCraft.setHandsPotencyIndex = nil
    OogleCraft.setLegsPotencyIndex = nil
    OogleCraft.setWaistPotencyIndex = nil
    OogleCraft.setHeadPotencyIndex = nil
    OogleCraft.setShouldersPotencyIndex = nil

    OogleCraft.setShieldEssenceIndex = nil
    OogleCraft.setChestEssenceIndex = nil
    OogleCraft.setFeetEssenceIndex = nil
    OogleCraft.setHandsEssenceIndex = nil
    OogleCraft.setLegsEssenceIndex = nil
    OogleCraft.setWaistEssenceIndex = nil
    OogleCraft.setHeadEssenceIndex = nil
    OogleCraft.setShouldersEssenceIndex = nil

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setShieldPotencyIndex = nil
    else
        for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
            if lvlSelectedItem == enchantEssence then
                OogleCraft.setShieldPotencyIndex = index
                break
            end
        end

        if shieldSelectedItem == "[Ench.]" then
            OogleCraft.setShieldEssenceIndex = nil
        else
            if OogleCraft.setShieldEssenceIndex == nil and OogleCraft.desiredArmorEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantArmorEssence) do
                    if shieldSelectedItem == enchantName then
                        OogleCraft.setShieldEssenceIndex = index
                        break
                    end
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setChestPotencyIndex = nil
    else
        for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
            if lvlSelectedItem == enchantEssence then
                OogleCraft.setChestPotencyIndex = index
                break
            end
        end

        if chestSelectedItem == "[Ench.]" then
            OogleCraft.setChestEssenceIndex = nil
        else
            if OogleCraft.setChestEssenceIndex == nil and OogleCraft.desiredArmorEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantArmorEssence) do
                    if shieldSelectedItem == enchantName then
                        OogleCraft.setChestEssenceIndex = index
                        break
                    end
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setFeetPotencyIndex = nil
    else
        for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
            if lvlSelectedItem == enchantEssence then
                OogleCraft.setFeetPotencyIndex = index
                break
            end
        end

        if feetSelectedItem == "[Ench.]" then
            OogleCraft.setFeetEssenceIndex = nil
        else
            if OogleCraft.setFeetEssenceIndex == nil and OogleCraft.desiredArmorEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantArmorEssence) do
                    if shieldSelectedItem == enchantName then
                        OogleCraft.setFeetEssenceIndex = index
                        break
                    end
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setHandsPotencyIndex = nil
    else
        for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
            if lvlSelectedItem == enchantEssence then
                OogleCraft.setHandsPotencyIndex = index
                break
            end
        end

        if handsSelectedItem == "[Ench.]" then
            OogleCraft.setHandsEssenceIndex = nil
        else
            if OogleCraft.setHandsEssenceIndex == nil and OogleCraft.desiredArmorEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantArmorEssence) do
                    if shieldSelectedItem == enchantName then
                        OogleCraft.setHandsEssenceIndex = index
                        break
                    end
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setLegsPotencyIndex = nil
    else
        for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
            if lvlSelectedItem == enchantEssence then
                OogleCraft.setLegsPotencyIndex = index
                break
            end
        end

        if legsSelectedItem == "[Ench.]" then
            OogleCraft.setLegsEssenceIndex = nil
        else
            if OogleCraft.setLegsEssenceIndex == nil and OogleCraft.desiredArmorEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantArmorEssence) do
                    if shieldSelectedItem == enchantName then
                        OogleCraft.setLegsEssenceIndex = index
                        break
                    end
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setWaistPotencyIndex = nil
    else
        for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
            if lvlSelectedItem == enchantEssence then
                OogleCraft.setWaistPotencyIndex = index
                break
            end
        end

        if waistSelectedItem == "[Ench.]" then
            OogleCraft.setWaistEssenceIndex = nil
        else
            if OogleCraft.setWaistEssenceIndex == nil and OogleCraft.desiredArmorEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantArmorEssence) do
                    if shieldSelectedItem == enchantName then
                        OogleCraft.setWaistEssenceIndex = index
                        break
                    end
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setHeadPotencyIndex = nil
    else
        for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
            if lvlSelectedItem == enchantEssence then
                OogleCraft.setHeadPotencyIndex = index
                break
            end
        end

        if headSelectedItem == "[Ench.]" then
            OogleCraft.setHeadEssenceIndex = nil
        else
            if OogleCraft.setHeadEssenceIndex == nil and OogleCraft.desiredArmorEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantArmorEssence) do
                    if shieldSelectedItem == enchantName then
                        OogleCraft.setHeadEssenceIndex = index
                        break
                    end
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setShouldersPotencyIndex = nil
    else
        for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
            if lvlSelectedItem == enchantEssence then
                OogleCraft.setShouldersPotencyIndex = index
                break
            end
        end

        if shouldersSelectedItem == "[Ench.]" then
            OogleCraft.setShouldersEssenceIndex = nil
        else
            if OogleCraft.setShouldersEssenceIndex == nil and OogleCraft.desiredArmorEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantArmorEssence) do
                    if shieldSelectedItem == enchantName then
                        OogleCraft.setShouldersEssenceIndex = index
                        break
                    end
                end
            end
        end
    end

    --[[
    d("Shield-------------")
    d("Potency:")
    d(OogleCraft.setShieldPotencyIndex)
    d("Essence")
    d(OogleCraft.setShieldEssenceIndex)
    d("Chest--------------")
    d("Potency:")
    d(OogleCraft.setChestPotencyIndex)
    d("Essence")
    d(OogleCraft.setChestEssenceIndex)
    d("Feet---------------")
    d("Potency:")
    d(OogleCraft.setFeetPotencyIndex)
    d("Essence")
    d(OogleCraft.setFeetEssenceIndex)
    d("Hands--------------")
    d("Potency:")
    d(OogleCraft.setHandsPotencyIndex)
    d("Essence")
    d(OogleCraft.setHandsEssenceIndex)
    d("Legs---------------")
    d("Potency:")
    d(OogleCraft.setLegsPotencyIndex)
    d("Essence")
    d(OogleCraft.setLegsEssenceIndex)
    d("Waist--------------")
    d("Potency:")
    d(OogleCraft.setWaistPotencyIndex)
    d("Essence")
    d(OogleCraft.setWaistEssenceIndex)
    d("Head---------------")
    d("Potency:")
    d(OogleCraft.setHeadPotencyIndex)
    d("Essence")
    d(OogleCraft.setHeadEssenceIndex)
    d("Shoulders----------")
    d("Potency:")
    d(OogleCraft.setShouldersPotencyIndex)
    d("Essence")
    d(OogleCraft.setShouldersEssenceIndex)
    --]]
end

local function getJewelryEnchantPotencyAndEssenceIndex()
    getDesiredLevel()
    getDesiredJewelryEnchantQuality()

    local ring1Dropdown = OogleCraftJewelryEnchantRing1Drop.dropdown
    local ring2Dropdown = OogleCraftJewelryEnchantRing2Drop.dropdown
    local necklaceDropdown = OogleCraftJewelryEnchantNecklaceDrop.dropdown
    local lvlDropdown = OogleCraftLvlDrop.dropdown

    local ring1SelectedItem = ring1Dropdown:GetSelectedItem()
    local ring2SelectedItem = ring2Dropdown:GetSelectedItem()
    local necklaceSelectedItem = necklaceDropdown:GetSelectedItem()
    local lvlSelectedItem = lvlDropdown:GetSelectedItem()

    OogleCraft.setRing1PotencyIndex = nil
    OogleCraft.setRing2PotencyIndex = nil
    OogleCraft.setNecklacePotencyIndex = nil

    OogleCraft.setRing1EssenceIndex = nil
    OogleCraft.setRing2EssenceIndex = nil
    OogleCraft.setNecklaceEssenceIndex = nil

    local isRing1Additive
    local isRing2Additive
    local isNecklaceAdditive

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setRing1PotencyIndex = nil
    else
        if ring1SelectedItem == "[Ench.]" then
            OogleCraft.setRing1EssenceIndex = nil
        else
            if OogleCraft.setRing1EssenceIndex == nil and OogleCraft.desiredJewelryEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantJewelryAdditiveEssence) do
                    if ring1SelectedItem == enchantName then
                        OogleCraft.setRing1EssenceIndex = index
                        isRing1Additive = true
                        break
                    end
                end
            end
            if OogleCraft.setRing1EssenceIndex == nil and OogleCraft.desiredJewelryEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantJewelrySubtractiveEssence) do
                    if ring1SelectedItem == enchantName then
                        OogleCraft.setRing1EssenceIndex = index
                        isRing1Additive = false
                        break
                    end
                end
            end
        end
        if isRing1Additive == true then
            for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setRing1PotencyIndex = index
                    break
                end
            end
        end
        if isRing1Additive == false then
            for enchantEssence, index in pairs(OogleCraft.enchantSubtractivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setRing1PotencyIndex = index
                    break
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setRing2PotencyIndex = nil
    else
        if ring2SelectedItem == "[Ench.]" then
            OogleCraft.setRing2EssenceIndex = nil
        else
            if OogleCraft.setRing2EssenceIndex == nil and OogleCraft.desiredJewelryEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantJewelryAdditiveEssence) do
                    if ring2SelectedItem == enchantName then
                        OogleCraft.setRing2EssenceIndex = index
                        isRing2Additive = true
                        break
                    end
                end
            end
            if OogleCraft.setRing2EssenceIndex == nil and OogleCraft.desiredJewelryEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantJewelrySubtractiveEssence) do
                    if ring2SelectedItem == enchantName then
                        OogleCraft.setRing2EssenceIndex = index
                        isRing2Additive = false
                        break
                    end
                end
            end
        end
        if isRing2Additive == true then
            for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setRing2PotencyIndex = index
                    break
                end
            end
        end
        if isRing2Additive == false then
            for enchantEssence, index in pairs(OogleCraft.enchantSubtractivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setRing2PotencyIndex = index
                    break
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setNecklacePotencyIndex = nil
    else
        if necklaceSelectedItem == "[Ench.]" then
            OogleCraft.setNecklaceEssenceIndex = nil
        else
            if OogleCraft.setNecklaceEssenceIndex == nil and OogleCraft.desiredJewelryEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantJewelryAdditiveEssence) do
                    if necklaceSelectedItem == enchantName then
                        OogleCraft.setNecklaceEssenceIndex = index
                        isNecklaceAdditive = true
                        break
                    end
                end
            end
            if OogleCraft.setNecklaceEssenceIndex == nil and OogleCraft.desiredJewelryEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantJewelrySubtractiveEssence) do
                    if necklaceSelectedItem == enchantName then
                        OogleCraft.setNecklaceEssenceIndex = index
                        isNecklaceAdditive = false
                        break
                    end
                end
            end
        end
        if isNecklaceAdditive == true then
            for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setNecklacePotencyIndex = index
                    break
                end
            end
        end
        if isNecklaceAdditive == false then
            for enchantEssence, index in pairs(OogleCraft.enchantSubtractivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setNecklacePotencyIndex = index
                    break
                end
            end
        end
    end

    --[[
    d("Ring1--------------")
    d("Is Additive?")
    d(isRing1Additive)
    d("Ring1 Potency")
    d(OogleCraft.setRing1PotencyIndex)
    d("Ring1 Essence")
    d(OogleCraft.setRing1EssenceIndex)
    d("Ring2--------------")
    d("Is Additive?")
    d(isRing2Additive)
    d("Potency")
    d(OogleCraft.setRing2PotencyIndex)
    d("Essence")
    d(OogleCraft.setRing2EssenceIndex)
    d("Necklace-----------")
    d("Is Additive?")
    d(isNecklaceAdditive)
    d("Potency")
    d(OogleCraft.setNecklacePotencyIndex)
    d("Essence")
    d(OogleCraft.setNecklaceEssenceIndex)
    --]]
end

local function getWeaponEnchantPotencyAndEssenceIndex()
    getDesiredLevel()
    getDesiredWeaponEnchantQuality()

    local fb1Dropdown = OogleCraftWeaponEnchantFrontBar1Drop.dropdown
    local fb2Dropdown = OogleCraftWeaponEnchantFrontBar2Drop.dropdown
    local bb1Dropdown = OogleCraftWeaponEnchantBackBar1Drop.dropdown
    local bb2Dropdown = OogleCraftWeaponEnchantBackBar2Drop.dropdown
    local lvlDropdown = OogleCraftLvlDrop.dropdown

    local fb1SelectedItem = fb1Dropdown:GetSelectedItem()
    local fb2SelectedItem = fb2Dropdown:GetSelectedItem()
    local bb1SelectedItem = bb1Dropdown:GetSelectedItem()
    local bb2SelectedItem = bb2Dropdown:GetSelectedItem()
    local lvlSelectedItem = lvlDropdown:GetSelectedItem()

    OogleCraft.setFB1PotencyIndex = nil
    OogleCraft.setFB2PotencyIndex = nil
    OogleCraft.setBB1PotencyIndex = nil
    OogleCraft.setBB2PotencyIndex = nil

    OogleCraft.setFB1EssenceIndex = nil
    OogleCraft.setFB2EssenceIndex = nil
    OogleCraft.setBB1EssenceIndex = nil
    OogleCraft.setBB2EssenceIndex = nil

    local isFB1Additive
    local isFB2Additive
    local isBB1Additive
    local isBB2Additive

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setFB1PotencyIndex = nil
    else
        if fb1SelectedItem == "[Ench.]" then
            OogleCraft.setFB1EssenceIndex = nil
        else
            if OogleCraft.setFB1EssenceIndex == nil and OogleCraft.desiredWeaponEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantWeaponAdditiveEssence) do
                    if fb1SelectedItem == enchantName then
                        OogleCraft.setFB1EssenceIndex = index
                        isFB1Additive = true
                        break
                    end
                end
            end
            if OogleCraft.setFB1EssenceIndex == nil and OogleCraft.desiredWeaponEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantWeaponSubtractiveEssence) do
                    if fb1SelectedItem == enchantName then
                        OogleCraft.setFB1EssenceIndex = index
                        isFB1Additive = false
                        break
                    end
                end
            end
        end
        if isFB1Additive == true then
            for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setFB1PotencyIndex = index
                    break
                end
            end
        end
        if isFB1Additive == false then
            for enchantEssence, index in pairs(OogleCraft.enchantSubtractivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setFB1PotencyIndex = index
                    break
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setFB2PotencyIndex = nil
    else
        if fb2SelectedItem == "[Ench.]" then
            OogleCraft.setFB2EssenceIndex = nil
        else
            if OogleCraft.setFB2EssenceIndex == nil and OogleCraft.desiredWeaponEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantWeaponAdditiveEssence) do
                    if fb2SelectedItem == enchantName then
                        OogleCraft.setFB2EssenceIndex = index
                        isFB2Additive = true
                        break
                    end
                end
            end
            if OogleCraft.setFB2EssenceIndex == nil and OogleCraft.desiredWeaponEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantWeaponSubtractiveEssence) do
                    if fb2SelectedItem == enchantName then
                        OogleCraft.setFB2EssenceIndex = index
                        isFB2Additive = false
                        break
                    end
                end
            end
        end
        if isFB2Additive == true then
            for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setFB2PotencyIndex = index
                    break
                end
            end
        end
        if isFB2Additive == false then
            for enchantEssence, index in pairs(OogleCraft.enchantSubtractivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setFB2PotencyIndex = index
                    break
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setBB1PotencyIndex = nil
    else
        if bb1SelectedItem == "[Ench.]" then
            OogleCraft.setBB1EssenceIndex = nil
        else
            if OogleCraft.setBB1EssenceIndex == nil and OogleCraft.desiredWeaponEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantWeaponAdditiveEssence) do
                    if bb1SelectedItem == enchantName then
                        OogleCraft.setBB1EssenceIndex = index
                        isBB1Additive = true
                        break
                    end
                end
            end
            if OogleCraft.setBB1EssenceIndex == nil and OogleCraft.desiredWeaponEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantWeaponSubtractiveEssence) do
                    if bb1SelectedItem == enchantName then
                        OogleCraft.setBB1EssenceIndex = index
                        isBB1Additive = false
                        break
                    end
                end
            end
        end
        if isBB1Additive == true then
            for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setBB1PotencyIndex = index
                    break
                end
            end
        end
        if isBB1Additive == false then
            for enchantEssence, index in pairs(OogleCraft.enchantSubtractivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setBB1PotencyIndex = index
                    break
                end
            end
        end
    end

    if lvlSelectedItem == "[Level]" then
        OogleCraft.setBB2PotencyIndex = nil
    else
        if bb2SelectedItem == "[Ench.]" then
            OogleCraft.setBB2EssenceIndex = nil
        else
            if OogleCraft.setBB2EssenceIndex == nil and OogleCraft.desiredWeaponEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantWeaponAdditiveEssence) do
                    if bb2SelectedItem == enchantName then
                        OogleCraft.setBB2EssenceIndex = index
                        isBB2Additive = true
                        break
                    end
                end
            end
            if OogleCraft.setBB2EssenceIndex == nil and OogleCraft.desiredWeaponEnchantQuality ~= nil then
                for enchantName, index in pairs(OogleCraft.enchantWeaponSubtractiveEssence) do
                    if bb2SelectedItem == enchantName then
                        OogleCraft.setBB2EssenceIndex = index
                        isBB2Additive = false
                        break
                    end
                end
            end
        end
        if isBB2Additive == true then
            for enchantEssence, index in pairs(OogleCraft.enchantAdditivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setBB2PotencyIndex = index
                    break
                end
            end
        end
        if isBB2Additive == false then
            for enchantEssence, index in pairs(OogleCraft.enchantSubtractivePotencyLvls) do
                if lvlSelectedItem == enchantEssence then
                    OogleCraft.setBB2PotencyIndex = index
                    break
                end
            end
        end
    end

    --[[
    d("FB1----------------")
    d("Is Additive?")
    d(isFB1Additive)
    d("Potency:")
    d(OogleCraft.setFB1PotencyIndex)
    d("Essence")
    d(OogleCraft.setFB1EssenceIndex)
    d("FB2----------------")
    d("Is Additive?")
    d(isFB2Additive)
    d("Potency:")
    d(OogleCraft.setFB2PotencyIndex)
    d("Essence")
    d(OogleCraft.setFB2EssenceIndex)
    d("BB1----------------")
    d("Is Additive?")
    d(isBB1Additive)
    d("Potency:")
    d(OogleCraft.setBB1PotencyIndex)
    d("Essence")
    d(OogleCraft.setBB1EssenceIndex)
    d("BB2----------------")
    d(isBB2Additive)
    d("Potency:")
    d(OogleCraft.setBB2PotencyIndex)
    d("Essence")
    d(OogleCraft.setBB2EssenceIndex)
    --]]
end

function OogleCraft.setAllGlobals()
    getStaticPatternChoices()
    getIsCP()
    getDesiredLevel()
    getDesiredSetName()
    getDesiredStyleName()
    getDesiredArmorQuality()
    getDesiredJewelryQuality()
    getDesiredWeaponQuality()
    getDesiredArmorEnchantQuality()
    getDesiredJewelryEnchantQuality()
    getDesiredWeaponEnchantQuality()
    getArmorSetNumber()
    getJewelrySetNumber()
    getWeaponSetNumber()
    getArmorWeight()
    getWeaponType()
    getWeaponCraftingOverride()
    getArmorTrait()
    getJewelryTrait()
    getWeaponTrait()
    getArmorEnchantPotencyAndEssenceIndex()
    getJewelryEnchantPotencyAndEssenceIndex()
    getWeaponEnchantPotencyAndEssenceIndex()
end