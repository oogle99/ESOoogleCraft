OogleCraftHideAll = {}

local windowIsHidden = false
function OogleCraftHideAll.toggleWindow()
    if windowIsHidden == false then
        windowIsHidden = true
        OogleCraftMainPanel:SetHidden(true)
     
        OogleCraftLvlDropWin:SetHidden(true)
        OogleCraftSet1ListDropWin:SetHidden(true)
        OogleCraftSet2ListDropWin:SetHidden(true)
        OogleCraftSet3ListDropWin:SetHidden(true)

        OogleCraftArmorSetQualityDropWin:SetHidden(true)

        OogleCraftArmorSetShieldDropWin:SetHidden(true)
        OogleCraftArmorSetChestDropWin:SetHidden(true)
        OogleCraftArmorSetFeetDropWin:SetHidden(true)
        OogleCraftArmorSetHandsDropWin:SetHidden(true)
        OogleCraftArmorSetLegsDropWin:SetHidden(true)
        OogleCraftArmorSetWaistDropWin:SetHidden(true)
        OogleCraftArmorSetHeadDropWin:SetHidden(true)
        OogleCraftArmorSetShouldersDropWin:SetHidden(true)

        OogleCraftArmorWeightChestDropWin:SetHidden(true)
        OogleCraftArmorWeightFeetDropWin:SetHidden(true)
        OogleCraftArmorWeightHandsDropWin:SetHidden(true)
        OogleCraftArmorWeightLegsDropWin:SetHidden(true)
        OogleCraftArmorWeightWaistDropWin:SetHidden(true)
        OogleCraftArmorWeightHeadDropWin:SetHidden(true)
        OogleCraftArmorWeightShouldersDropWin:SetHidden(true)

        OogleCraftArmorTraitShieldDropWin:SetHidden(true)
        OogleCraftArmorTraitChestDropWin:SetHidden(true)
        OogleCraftArmorTraitFeetDropWin:SetHidden(true)
        OogleCraftArmorTraitHandsDropWin:SetHidden(true)
        OogleCraftArmorTraitLegsDropWin:SetHidden(true)
        OogleCraftArmorTraitWaistDropWin:SetHidden(true)
        OogleCraftArmorTraitHeadDropWin:SetHidden(true)
        OogleCraftArmorTraitShouldersDropWin:SetHidden(true)

        OogleCraftArmorEnchantQualityDropWin:SetHidden(true)

        OogleCraftArmorEnchantShieldDropWin:SetHidden(true)
        OogleCraftArmorEnchantChestDropWin:SetHidden(true)
        OogleCraftArmorEnchantFeetDropWin:SetHidden(true)
        OogleCraftArmorEnchantHandsDropWin:SetHidden(true)
        OogleCraftArmorEnchantLegsDropWin:SetHidden(true)
        OogleCraftArmorEnchantWaistDropWin:SetHidden(true)
        OogleCraftArmorEnchantHeadDropWin:SetHidden(true)
        OogleCraftArmorEnchantShouldersDropWin:SetHidden(true)

        OogleCraftJewelrySetQualityDropWin:SetHidden(true)

        OogleCraftJewelrySetRing1DropWin:SetHidden(true)
        OogleCraftJewelrySetRing2DropWin:SetHidden(true)
        OogleCraftJewelrySetNecklaceDropWin:SetHidden(true)

        OogleCraftJewelryTraitRing1DropWin:SetHidden(true)
        OogleCraftJewelryTraitRing2DropWin:SetHidden(true)
        OogleCraftJewelryTraitNecklaceDropWin:SetHidden(true)

        OogleCraftJewelryEnchantQualityDropWin:SetHidden(true)

        OogleCraftJewelryEnchantRing1DropWin:SetHidden(true)
        OogleCraftJewelryEnchantRing2DropWin:SetHidden(true)
        OogleCraftJewelryEnchantNecklaceDropWin:SetHidden(true)

        OogleCraftWeaponSetQualityDropWin:SetHidden(true)

        OogleCraftWeaponSetFrontBar1DropWin:SetHidden(true)
        OogleCraftWeaponSetFrontBar2DropWin:SetHidden(true)
        OogleCraftWeaponSetBackBar1DropWin:SetHidden(true)
        OogleCraftWeaponSetBackBar2DropWin:SetHidden(true)

        OogleCraftWeaponTypeFrontBar1DropWin:SetHidden(true)
        OogleCraftWeaponTypeFrontBar2DropWin:SetHidden(true)
        OogleCraftWeaponTypeBackBar1DropWin:SetHidden(true)
        OogleCraftWeaponTypeBackBar2DropWin:SetHidden(true)

        OogleCraftWeaponTraitFrontBar1DropWin:SetHidden(true)
        OogleCraftWeaponTraitFrontBar2DropWin:SetHidden(true)
        OogleCraftWeaponTraitBackBar1DropWin:SetHidden(true)
        OogleCraftWeaponTraitBackBar2DropWin:SetHidden(true)

        OogleCraftWeaponEnchantQualityDropWin:SetHidden(true)

        OogleCraftWeaponEnchantFrontBar1DropWin:SetHidden(true)
        OogleCraftWeaponEnchantFrontBar2DropWin:SetHidden(true)
        OogleCraftWeaponEnchantBackBar1DropWin:SetHidden(true)
        OogleCraftWeaponEnchantBackBar2DropWin:SetHidden(true)

    else
        windowIsHidden = false
        OogleCraftMainPanel:SetHidden(false)

        OogleCraftLvlDropWin:SetHidden(false)
        OogleCraftSet1ListDropWin:SetHidden(false)
        OogleCraftSet2ListDropWin:SetHidden(false)
        OogleCraftSet3ListDropWin:SetHidden(false)

        OogleCraftArmorSetQualityDropWin:SetHidden(false)

        OogleCraftArmorSetShieldDropWin:SetHidden(false)
        OogleCraftArmorSetChestDropWin:SetHidden(false)
        OogleCraftArmorSetFeetDropWin:SetHidden(false)
        OogleCraftArmorSetHandsDropWin:SetHidden(false)
        OogleCraftArmorSetLegsDropWin:SetHidden(false)
        OogleCraftArmorSetWaistDropWin:SetHidden(false)
        OogleCraftArmorSetHeadDropWin:SetHidden(false)
        OogleCraftArmorSetShouldersDropWin:SetHidden(false)

        OogleCraftArmorWeightChestDropWin:SetHidden(false)
        OogleCraftArmorWeightFeetDropWin:SetHidden(false)
        OogleCraftArmorWeightHandsDropWin:SetHidden(false)
        OogleCraftArmorWeightLegsDropWin:SetHidden(false)
        OogleCraftArmorWeightWaistDropWin:SetHidden(false)
        OogleCraftArmorWeightHeadDropWin:SetHidden(false)
        OogleCraftArmorWeightShouldersDropWin:SetHidden(false)

        OogleCraftArmorTraitShieldDropWin:SetHidden(false)
        OogleCraftArmorTraitChestDropWin:SetHidden(false)
        OogleCraftArmorTraitFeetDropWin:SetHidden(false)
        OogleCraftArmorTraitHandsDropWin:SetHidden(false)
        OogleCraftArmorTraitLegsDropWin:SetHidden(false)
        OogleCraftArmorTraitWaistDropWin:SetHidden(false)
        OogleCraftArmorTraitHeadDropWin:SetHidden(false)
        OogleCraftArmorTraitShouldersDropWin:SetHidden(false)

        OogleCraftArmorEnchantQualityDropWin:SetHidden(false)

        OogleCraftArmorEnchantShieldDropWin:SetHidden(false)
        OogleCraftArmorEnchantChestDropWin:SetHidden(false)
        OogleCraftArmorEnchantFeetDropWin:SetHidden(false)
        OogleCraftArmorEnchantHandsDropWin:SetHidden(false)
        OogleCraftArmorEnchantLegsDropWin:SetHidden(false)
        OogleCraftArmorEnchantWaistDropWin:SetHidden(false)
        OogleCraftArmorEnchantHeadDropWin:SetHidden(false)
        OogleCraftArmorEnchantShouldersDropWin:SetHidden(false)

        OogleCraftJewelrySetQualityDropWin:SetHidden(false)

        OogleCraftJewelrySetRing1DropWin:SetHidden(false)
        OogleCraftJewelrySetRing2DropWin:SetHidden(false)
        OogleCraftJewelrySetNecklaceDropWin:SetHidden(false)

        OogleCraftJewelryTraitRing1DropWin:SetHidden(false)
        OogleCraftJewelryTraitRing2DropWin:SetHidden(false)
        OogleCraftJewelryTraitNecklaceDropWin:SetHidden(false)

        OogleCraftJewelryEnchantQualityDropWin:SetHidden(false)

        OogleCraftJewelryEnchantRing1DropWin:SetHidden(false)
        OogleCraftJewelryEnchantRing2DropWin:SetHidden(false)
        OogleCraftJewelryEnchantNecklaceDropWin:SetHidden(false)

        OogleCraftWeaponSetQualityDropWin:SetHidden(false)

        OogleCraftWeaponSetFrontBar1DropWin:SetHidden(false)
        OogleCraftWeaponSetFrontBar2DropWin:SetHidden(false)
        OogleCraftWeaponSetBackBar1DropWin:SetHidden(false)
        OogleCraftWeaponSetBackBar2DropWin:SetHidden(false)

        OogleCraftWeaponTypeFrontBar1DropWin:SetHidden(false)
        OogleCraftWeaponTypeFrontBar2DropWin:SetHidden(false)
        OogleCraftWeaponTypeBackBar1DropWin:SetHidden(false)
        OogleCraftWeaponTypeBackBar2DropWin:SetHidden(false)

        OogleCraftWeaponTraitFrontBar1DropWin:SetHidden(false)
        OogleCraftWeaponTraitFrontBar2DropWin:SetHidden(false)
        OogleCraftWeaponTraitBackBar1DropWin:SetHidden(false)
        OogleCraftWeaponTraitBackBar2DropWin:SetHidden(false)

        OogleCraftWeaponEnchantQualityDropWin:SetHidden(false)

        OogleCraftWeaponEnchantFrontBar1DropWin:SetHidden(false)
        OogleCraftWeaponEnchantFrontBar2DropWin:SetHidden(false)
        OogleCraftWeaponEnchantBackBar1DropWin:SetHidden(false)
        OogleCraftWeaponEnchantBackBar2DropWin:SetHidden(false)

    end
end