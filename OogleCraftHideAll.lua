OogleCraft = OogleCraft or {}

local windowIsHidden = false
function OogleCraft.toggleWindow()
    if windowIsHidden == false then
        windowIsHidden = true

        local elementsToHide = {
            OogleCraftMainPanel,

            OogleCraftLvlDropWin,
            OogleCraftSet1ListDropWin,
            OogleCraftSet2ListDropWin,
            OogleCraftSet3ListDropWin,
            OogleCraftStyleListDropWin,

            OogleCraftShieldQueueButtonWin,
            OogleCraftChestQueueButtonWin,
            OogleCraftFeetQueueButtonWin,
            OogleCraftHandsQueueButtonWin,
            OogleCraftLegsQueueButtonWin,
            OogleCraftWaistQueueButtonWin,
            OogleCraftHeadQueueButtonWin,
            OogleCraftShouldersQueueButtonWin,
            OogleCraftRing1QueueButtonWin,
            OogleCraftRing2QueueButtonWin,
            OogleCraftNecklaceQueueButtonWin,
            OogleCraftFrontBar1QueueButtonWin,
            OogleCraftFrontBar2QueueButtonWin,
            OogleCraftBackBar1QueueButtonWin,
            OogleCraftBackBar2QueueButtonWin,

            OogleCraftArmorSetQualityDropWin,

            OogleCraftArmorSetShieldDropWin,
            OogleCraftArmorSetChestDropWin,
            OogleCraftArmorSetFeetDropWin,
            OogleCraftArmorSetHandsDropWin,
            OogleCraftArmorSetLegsDropWin,
            OogleCraftArmorSetWaistDropWin,
            OogleCraftArmorSetHeadDropWin,
            OogleCraftArmorSetShouldersDropWin,

            OogleCraftArmorWeightChestDropWin,
            OogleCraftArmorWeightFeetDropWin,
            OogleCraftArmorWeightHandsDropWin,
            OogleCraftArmorWeightLegsDropWin,
            OogleCraftArmorWeightWaistDropWin,
            OogleCraftArmorWeightHeadDropWin,
            OogleCraftArmorWeightShouldersDropWin,

            OogleCraftArmorTraitShieldDropWin,
            OogleCraftArmorTraitChestDropWin,
            OogleCraftArmorTraitFeetDropWin,
            OogleCraftArmorTraitHandsDropWin,
            OogleCraftArmorTraitLegsDropWin,
            OogleCraftArmorTraitWaistDropWin,
            OogleCraftArmorTraitHeadDropWin,
            OogleCraftArmorTraitShouldersDropWin,

            OogleCraftArmorEnchantQualityDropWin,

            OogleCraftArmorEnchantShieldDropWin,
            OogleCraftArmorEnchantChestDropWin,
            OogleCraftArmorEnchantFeetDropWin,
            OogleCraftArmorEnchantHandsDropWin,
            OogleCraftArmorEnchantLegsDropWin,
            OogleCraftArmorEnchantWaistDropWin,
            OogleCraftArmorEnchantHeadDropWin,
            OogleCraftArmorEnchantShouldersDropWin,

            OogleCraftJewelrySetQualityDropWin,

            OogleCraftJewelrySetRing1DropWin,
            OogleCraftJewelrySetRing2DropWin,
            OogleCraftJewelrySetNecklaceDropWin,

            OogleCraftJewelryTraitRing1DropWin,
            OogleCraftJewelryTraitRing2DropWin,
            OogleCraftJewelryTraitNecklaceDropWin,

            OogleCraftJewelryEnchantQualityDropWin,

            OogleCraftJewelryEnchantRing1DropWin,
            OogleCraftJewelryEnchantRing2DropWin,
            OogleCraftJewelryEnchantNecklaceDropWin,

            OogleCraftWeaponSetQualityDropWin,

            OogleCraftWeaponSetFrontBar1DropWin,
            OogleCraftWeaponSetFrontBar2DropWin,
            OogleCraftWeaponSetBackBar1DropWin,
            OogleCraftWeaponSetBackBar2DropWin,

            OogleCraftWeaponTypeFrontBar1DropWin,
            OogleCraftWeaponTypeFrontBar2DropWin,
            OogleCraftWeaponTypeBackBar1DropWin,
            OogleCraftWeaponTypeBackBar2DropWin,

            OogleCraftWeaponTraitFrontBar1DropWin,
            OogleCraftWeaponTraitFrontBar2DropWin,
            OogleCraftWeaponTraitBackBar1DropWin,
            OogleCraftWeaponTraitBackBar2DropWin,

            OogleCraftWeaponEnchantQualityDropWin,

            OogleCraftWeaponEnchantFrontBar1DropWin,
            OogleCraftWeaponEnchantFrontBar2DropWin,
            OogleCraftWeaponEnchantBackBar1DropWin,
            OogleCraftWeaponEnchantBackBar2DropWin
        }

        for _, element in ipairs(elementsToHide) do
            element:SetHidden(true)
        end

    else
        windowIsHidden = false

            local elementsToUnHide = {
            OogleCraftMainPanel,

            OogleCraftLvlDropWin,
            OogleCraftSet1ListDropWin,
            OogleCraftSet2ListDropWin,
            OogleCraftSet3ListDropWin,
            OogleCraftStyleListDropWin,

            OogleCraftShieldQueueButtonWin,
            OogleCraftChestQueueButtonWin,
            OogleCraftFeetQueueButtonWin,
            OogleCraftHandsQueueButtonWin,
            OogleCraftLegsQueueButtonWin,
            OogleCraftWaistQueueButtonWin,
            OogleCraftHeadQueueButtonWin,
            OogleCraftShouldersQueueButtonWin,
            OogleCraftRing1QueueButtonWin,
            OogleCraftRing2QueueButtonWin,
            OogleCraftNecklaceQueueButtonWin,
            OogleCraftFrontBar1QueueButtonWin,
            OogleCraftFrontBar2QueueButtonWin,
            OogleCraftBackBar1QueueButtonWin,
            OogleCraftBackBar2QueueButtonWin,

            OogleCraftArmorSetQualityDropWin,

            OogleCraftArmorSetShieldDropWin,
            OogleCraftArmorSetChestDropWin,
            OogleCraftArmorSetFeetDropWin,
            OogleCraftArmorSetHandsDropWin,
            OogleCraftArmorSetLegsDropWin,
            OogleCraftArmorSetWaistDropWin,
            OogleCraftArmorSetHeadDropWin,
            OogleCraftArmorSetShouldersDropWin,

            OogleCraftArmorWeightChestDropWin,
            OogleCraftArmorWeightFeetDropWin,
            OogleCraftArmorWeightHandsDropWin,
            OogleCraftArmorWeightLegsDropWin,
            OogleCraftArmorWeightWaistDropWin,
            OogleCraftArmorWeightHeadDropWin,
            OogleCraftArmorWeightShouldersDropWin,

            OogleCraftArmorTraitShieldDropWin,
            OogleCraftArmorTraitChestDropWin,
            OogleCraftArmorTraitFeetDropWin,
            OogleCraftArmorTraitHandsDropWin,
            OogleCraftArmorTraitLegsDropWin,
            OogleCraftArmorTraitWaistDropWin,
            OogleCraftArmorTraitHeadDropWin,
            OogleCraftArmorTraitShouldersDropWin,

            OogleCraftArmorEnchantQualityDropWin,

            OogleCraftArmorEnchantShieldDropWin,
            OogleCraftArmorEnchantChestDropWin,
            OogleCraftArmorEnchantFeetDropWin,
            OogleCraftArmorEnchantHandsDropWin,
            OogleCraftArmorEnchantLegsDropWin,
            OogleCraftArmorEnchantWaistDropWin,
            OogleCraftArmorEnchantHeadDropWin,
            OogleCraftArmorEnchantShouldersDropWin,

            OogleCraftJewelrySetQualityDropWin,

            OogleCraftJewelrySetRing1DropWin,
            OogleCraftJewelrySetRing2DropWin,
            OogleCraftJewelrySetNecklaceDropWin,

            OogleCraftJewelryTraitRing1DropWin,
            OogleCraftJewelryTraitRing2DropWin,
            OogleCraftJewelryTraitNecklaceDropWin,

            OogleCraftJewelryEnchantQualityDropWin,

            OogleCraftJewelryEnchantRing1DropWin,
            OogleCraftJewelryEnchantRing2DropWin,
            OogleCraftJewelryEnchantNecklaceDropWin,

            OogleCraftWeaponSetQualityDropWin,

            OogleCraftWeaponSetFrontBar1DropWin,
            OogleCraftWeaponSetFrontBar2DropWin,
            OogleCraftWeaponSetBackBar1DropWin,
            OogleCraftWeaponSetBackBar2DropWin,

            OogleCraftWeaponTypeFrontBar1DropWin,
            OogleCraftWeaponTypeFrontBar2DropWin,
            OogleCraftWeaponTypeBackBar1DropWin,
            OogleCraftWeaponTypeBackBar2DropWin,

            OogleCraftWeaponTraitFrontBar1DropWin,
            OogleCraftWeaponTraitFrontBar2DropWin,
            OogleCraftWeaponTraitBackBar1DropWin,
            OogleCraftWeaponTraitBackBar2DropWin,

            OogleCraftWeaponEnchantQualityDropWin,

            OogleCraftWeaponEnchantFrontBar1DropWin,
            OogleCraftWeaponEnchantFrontBar2DropWin,
            OogleCraftWeaponEnchantBackBar1DropWin,
            OogleCraftWeaponEnchantBackBar2DropWin
        }

        for _, element in ipairs(elementsToUnHide) do
            element:SetHidden(false)
        end

    end
end
