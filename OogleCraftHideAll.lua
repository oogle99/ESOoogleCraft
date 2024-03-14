OogleCraft = OogleCraft or {}

local windowIsHidden = false
function OogleCraft.toggleWindow()
    if windowIsHidden == false then
        windowIsHidden = true

        local elementsToHide = {
            OogleCraftMainPanel
        }

        for _, element in ipairs(elementsToHide) do
            element:SetHidden(true)
        end

    else
        windowIsHidden = false

            local elementsToUnHide = {
            OogleCraftMainPanel
        }

        for _, element in ipairs(elementsToUnHide) do
            element:SetHidden(false)
        end

    end
end
