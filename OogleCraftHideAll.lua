OogleCraft = OogleCraft or {}


function OogleCraft_OnCraftingStationInteract(eventCode, craftingType)
    OogleCraftMainPanel:SetHidden(false)
    OogleCraft.windowIsHidden = false
end

function OogleCraft_OnEndCraftingStationInteract(eventCode, craftingType)
    OogleCraftMainPanel:SetHidden(true)
    OogleCraft.windowIsHidden = true
end

OogleCraft.windowIsHidden = true
function OogleCraft.toggleWindow()
    if OogleCraft.windowIsHidden == false then
        OogleCraft.windowIsHidden = true

        local elementsToHide = {
            OogleCraftMainPanel
        }

        for _, element in ipairs(elementsToHide) do
            element:SetHidden(true)
        end

    else
        OogleCraft.windowIsHidden = false

            local elementsToUnHide = {
            OogleCraftMainPanel
        }

        for _, element in ipairs(elementsToUnHide) do
            element:SetHidden(false)
        end

    end
end
