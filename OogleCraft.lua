OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

_G.selectedItems = _G.selectedItems or {}

function OogleCraft.RestorePosition()
    OogleCraftMainPanel:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, left, top)
end

function OogleCraft.Initialize()

end

function OogleCraft.OnAddOnLoaded(event, addonName)
    if addonName == OogleCraft.name then
        OogleCraft.Initialize()

        EVENT_MANAGER:UnregisterForEvent(OogleCraft.name, EVENT_ADD_ON_LOADED)
    end
end

EVENT_MANAGER:RegisterForEvent(OogleCraft.name, EVENT_ADD_ON_LOADED, OogleCraft.OnAddOnLoaded)


function OogleCraft.addToQueueFunctionality(oogleCraftButtonFrameName)
    d(oogleCraftButtonFrameName)
    
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
        local setSelection = _G.selectedItems[setSelectionKey]

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


        for _, tableKey in ipairs(tables) do
            local selectedItems = _G.selectedItems[tableKey] or {}
            local message = "No items selected for " .. tableKey

            if next(selectedItems) then
                for _, item in ipairs(selectedItems) do
                    d(item)
                end
            else
                d(message)
            end
        end
    end

