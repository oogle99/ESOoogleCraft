OogleCraft = {}
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



