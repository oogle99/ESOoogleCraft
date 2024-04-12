OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

OogleCraft.savedVariables = OogleCraft.savedVariables or {}
OogleCraft.savedVariables.desiredInfo = OogleCraft.savedVariables.desiredInfo or {}

function OogleCraft.RestorePosition()
    local left = OogleCraft.savedVariables.left
    local top = OogleCraft.savedVariables.top

    OogleCraftMainPanel:ClearAnchors()
    OogleCraftMainPanel:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, left, top)
end

function OogleCraft.Initialize()
    -- Initialize savedVariables
    OogleCraft.savedVariables = ZO_SavedVars:NewCharacterIdSettings("OogleCraftSavedVariables", 1, nil, {})
    -- Initialize Keybind
    ZO_CreateStringId("SI_BINDING_NAME_OogleCraftHideAll", "|cEECA2AHide All|r")
    -- Initialize savedVariables savedLocation
    OogleCraft.RestorePosition()
end

function OogleCraft.OnAddOnLoaded(event, addonName)
    -- If it's my addon, then do this
    if addonName == OogleCraft.name then
        -- Call Initialize
        OogleCraft.Initialize()
        -- Set the desired savedVariables nested table to a variable to improve readabilty
        local oogleCraftDesiredInfo = OogleCraft.savedVariables.desiredInfo

        -- If the desired savedVariables nested table exists, set the dropdown selections
        if oogleCraftDesiredInfo then
            OogleCraft.PopulateMiscDropdowns()

            OogleCraft.PopulateArmorDropdowns()
            OogleCraft.PopulateJewelryDropdowns()
            OogleCraft.PopulateWeaponDropdowns()

           -- Unregister the EVENT_ADD_ON_LOADED
            EVENT_MANAGER:UnregisterForEvent(OogleCraft.name, EVENT_ADD_ON_LOADED)
        else
            -- If the desired savedVariables nested table DOES NOT exist
            -- Call the OnAddonLoaded function again, then wait 100 milliseconds
            -- For some reason, this nested table does not exist right away
            -- Therefore, a work around had to be implemented to allow the table to create
            zo_callLater(function() OogleCraft.OnAddonLoaded(event, addonName) end, 100)
            -- Trust me, this is the BACKBONE of the ENTIRE addon
        end
    end
end

EVENT_MANAGER:RegisterForEvent(OogleCraft.name, EVENT_ADD_ON_LOADED, OogleCraft.OnAddOnLoaded)

function OogleCraft.OnWindowMoveStop()
    OogleCraft.savedVariables.left = OogleCraftMainPanel:GetLeft()
    OogleCraft.savedVariables.top = OogleCraftMainPanel:GetTop()
end

function OogleCraft.ClearDropdownSavedVariables()
    OogleCraft.savedVariables.desiredInfo = {}

    OogleCraft.ResetLvlSelection()
    OogleCraft.ResetSet1Selection()
    OogleCraft.ResetSet2Selection()
    OogleCraft.ResetSet3Selection()
    OogleCraft.ResetStyleListSelection()

    OogleCraft.ResetWeaponSetQualitySelection()
    OogleCraft.ResetWeaponSetNumberSelection()
    OogleCraft.ResetWeaponTypeSelection()
    OogleCraft.ResetWeaponTraitSelection()
    OogleCraft.ResetWeaponEnchantQualitySelection()
    OogleCraft.ResetWeaponEnchantSelection()

    OogleCraft.ResetJewelrySetQualitySelection()
    OogleCraft.ResetJewelrySetNumberSelection()
    OogleCraft.ResetJewelryTraitSelection()
    OogleCraft.ResetJewelryEnchantQualitySelection()
    OogleCraft.ResetJewelryTraitSelection()

    OogleCraft.ResetArmorSetQualitySelection()
    OogleCraft.ResetArmorSetNumberSelection()
    OogleCraft.ResetArmorWeightSelection()
    OogleCraft.ResetArmorTraitSelection()
    OogleCraft.ResetArmorEnchantQualitySelection()
    OogleCraft.ResetArmorEnchantSelection()

    d("Saved variables cleared.")
end

function OogleCraft.createClearDropdownButton(oogleCraftClearButtonFrameName, buttonxOffset, buttonyOffset, buttonWide)
    local buttonContainer = WINDOW_MANAGER:CreateControlFromVirtual("OogleCraft" .. oogleCraftClearButtonFrameName .. "Button", OogleCraftMainPanel, "ClearQueueButton")
    buttonContainer:SetAnchor(TOPLEFT, OogleCraftMainPanel, TOPLEFT, buttonxOffset + 7, buttonyOffset)
    buttonContainer:SetDimensions(125, 50)
    buttonContainer:GetNamedChild("Button"):SetWidth(buttonWide)

    buttonContainer:GetNamedChild("Button"):SetHandler("OnClicked", function()
        OogleCraft.ClearDropdownSavedVariables()
    end)
end

OogleCraft.createClearDropdownButton("ClearDropdowns", 507, -11, 200)

function OogleCraft.addToQueueFunctionality(oogleCraftButtonFrameName)
    -- Define a map of queue types and their corresponding tables
    local queueTypes = {
        ["ShieldQueue"] = {
            "Lvl",
            "StyleList",
            "ArmorSetQuality",
            "TraitShield",
            "ArmorEnchantQuality",
            "EnchantShield"
        },
        ["ChestQueue"] = {
            "Lvl",
            "StyleList",
            "ArmorSetQuality",
            "WeightChest",
            "TraitChest",
            "ArmorEnchantQuality",
            "EnchantChest"
        },
        ["FeetQueue"] = {
            "Lvl",
            "StyleList",
            "ArmorSetQuality",
            "WeightFeet",
            "TraitFeet",
            "ArmorEnchantQuality",
            "EnchantFeet"
        },
        ["HandsQueue"] = {
            "Lvl",
            "StyleList",
            "ArmorSetQuality",
            "WeightHands",
            "TraitHands",
            "ArmorEnchantQuality",
            "EnchantHands"
        },
        ["LegsQueue"] = {
            "Lvl",
            "StyleList",
            "ArmorSetQuality",
            "WeightLegs",
            "TraitLegs",
            "ArmorEnchantQuality",
            "EnchantLegs"
        },
        ["WaistQueue"] = {
            "Lvl",
            "StyleList",
            "ArmorSetQuality",
            "WeightWaist",
            "TraitWaist",
            "ArmorEnchantQuality",
            "EnchantWaist"
        },
        ["HeadQueue"] = {
            "Lvl",
            "StyleList",
            "ArmorSetQuality",
            "WeightHead",
            "TraitHead",
            "ArmorEnchantQuality",
            "EnchantHead"
        },
        ["ShouldersQueue"] = {
            "Lvl",
            "StyleList",
            "ArmorSetQuality",
            "WeightShoulders",
            "TraitShoulders",
            "ArmorEnchantQuality",
            "EnchantShoulders"
        },
        ["Ring1Queue"] = {
            "Lvl",
            "StyleList",
            "JewelrySetQuality",
            "TraitRing1",
            "JewelryEnchantQuality",
            "EnchantRing1"
        },
        ["Ring2Queue"] = {
            "Lvl",
            "StyleList",
            "JewelrySetQuality",
            "TraitRing2",
            "JewelryEnchantQuality",
            "EnchantRing2"
        },
        ["NecklaceQueue"] = {
            "Lvl",
            "StyleList",
            "JewelrySetQuality",
            "TraitNecklace",
            "JewelryEnchantQuality",
            "EnchantNecklace"
        },
        ["FrontBar1Queue"] = {
            "Lvl",
            "StyleList",
            "WeaponSetQuality",
            "TypeFrontBar1",
            "TraitFrontBar1",
            "WeaponEnchantQuality",
            "EnchantFrontBar1"
        },
        ["FrontBar2Queue"] = {
            "Lvl",
            "StyleList",
            "WeaponSetQuality",
            "TypeFrontBar2",
            "TraitFrontBar2",
            "WeaponEnchantQuality",
            "EnchantFrontBar2"
        },
        ["BackBar1Queue"] = {
            "Lvl",
            "StyleList",
            "WeaponSetQuality",
            "TypeBackBar1",
            "TraitBackBar1",
            "WeaponEnchantQuality",
            "EnchantBackBar1"
        },
        ["BackBar2Queue"] = {
            "Lvl",
            "StyleList",
            "WeaponSetQuality",
            "TypeBackBar2",
            "TraitBackBar2",
            "WeaponEnchantQuality",
            "EnchantBackBar2"
        }
    }

    -- Define a lookup table for queue names and their corresponding selection keys
        local queueSelectionKeys = {
            ["ShieldQueue"] = "SetShield",
            ["ChestQueue"] = "SetChest",
            ["LegsQueue"] = "SetLegs",
            ["FeetQueue"] = "SetFeet",
            ["HandsQueue"] = "SetHands",
            ["WaistQueue"] = "SetWaist",
            ["HeadQueue"] = "SetHead",
            ["ShouldersQueue"] = "SetShoulders",
            ["Ring1Queue"] = "SetRing1",
            ["Ring2Queue"] = "SetRing2",
            ["NecklaceQueue"] = "SetNecklace",
            ["FrontBar1Queue"] = "SetFrontBar1",
            ["FrontBar2Queue"] = "SetFrontBar2",
            ["BackBar1Queue"] = "SetBackBar1",
            ["BackBar2Queue"] = "SetBackBar2"
        }

        -- Use the lookup table to get the selection key based on the queue name
        local setSelectionKey = queueSelectionKeys[oogleCraftButtonFrameName]

        -- Get the selected items based on the selection key
        local setSelection = OogleCraft.savedVariables.desiredInfo[setSelectionKey]

        -- Determine the corresponding "Set#List" based on the selected "Set" item
        local setListTable = "Set1List"  -- Default to "Set1List"
        if setSelection then
            if setSelection[1] == "Set #2" then
                setListTable = "Set2List"
            elseif setSelection[1] == "Set #3" then
                setListTable = "Set3List"
            end
        end

        -- Add the selected "Set#List" to the table of queue items
        local tables = queueTypes[oogleCraftButtonFrameName]
        if tables then
            table.insert(tables, setListTable)
        end

        local nextMessageY = 0  -- Keep track of the next message's vertical position

        function ShowMessageOnGUI(message, color)
            -- Create a label or other UI element
            local label = WINDOW_MANAGER:CreateControl(nil, OogleCraftMainPanel, CT_LABEL)
            label:SetText(message)
            label:SetAnchor(TOPLEFT, OogleCraftMainPanel, BOTTOMLEFT, 607 + 7, nextMessageY + 3.5)
            label:SetFont("ZoFontGame")
            
            -- Set text color
            if color then
                label:SetColor(color[1] or 1, color[2] or 1, color[3] or 1, color[4] or 1)
            else
                label:SetColor(1, 1, 0, 1)  -- Default to yellow
            end
            
            label:SetDrawLayer(1)
            
            -- Update the next message's vertical position for the next message
            nextMessageY = nextMessageY + label:GetHeight() + 2.5  -- Adjust spacing between messages
            
            -- Schedule a function to remove the label after a few seconds
            zo_callLater(function() label:SetHidden(true) end, 3000)  -- Hide the label after 3 seconds (3000 milliseconds)
        end

        for _, tableKey in ipairs(tables) do
            local selectedItems = OogleCraft.savedVariables.desiredInfo[tableKey] or {}
            local message = "No items selected for " .. tableKey

            if next(selectedItems) then
                for _, item in ipairs(selectedItems) do
                    d(item)
                end
            else
                --d(message)
                -- Display message on the GUI
                ShowMessageOnGUI(oogleCraftButtonFrameName, {1, 0, 0, 1})
                ShowMessageOnGUI(message)
            end
        end
    end
