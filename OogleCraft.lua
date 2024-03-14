OogleCraft = OogleCraft or {}
OogleCraft.name = "OogleCraft"

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

function OogleCraft.onItemSelectFunctionality(oogleCraftDropdownFrameName, choiceText)
    --d(oogleCraftDropdownFrameName, choiceText)


OogleCraftDropdownChoice = OogleCraftConstantDropdownChoices[oogleCraftDropdownFrameName]

    if OogleCraftDropdownChoice then

        if OogleCraftDropdownChoice[choiceText] then
            d(OogleCraftDropdownChoice[choiceText])

        else
            d("Me thinks mehaps messed up somewhere.")
        end
    end
end


function OogleCraft.addToQueueFunctionality(oogleCraftButtonFrameName)
    local setQualityChoices = OogleCraftConstantDropdownChoices["ArmorSetQuality"]
    d(oogleCraftButtonFrameName)
    if oogleCraftButtonFrameName == "ShieldQueue" then
        d(setQualityChoices["White"])
    end
end
