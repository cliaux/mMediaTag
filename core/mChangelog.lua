local E, L, V, P, G = unpack(ElvUI)
local mPlugin = "mMediaTag"
local mMT = E:GetModule(mPlugin)
local mSkin = E:GetModule("Skins")
local addon, ns = ...

--Lua functions
local format = format

--Variables
local ChangelogText =
	"## [ver. 2.91] - 16.12.2022\n\n|CFFFF7F50### Update|r\n- |CFFDFFF00FIX|r NP-Healtmarker Auto range toggel not working\n- |CFFDFFF00FIX|r Custom Unitframe BG Textures\n- |CFFDFFF00FIX|r Profession Datatext Tooltip\n- |CFFDFFF00FIX|r Nil error in tooltip icons\n- |CFFDFFF00FIX|r Custom custom class color\n- |CFFDFFF00FIX|r Dock Icons Guild, Friends and Durability\n- |CFF40E0D0UPDATE|r Api change for intterupt on cd\n- |CFF40E0D0UPDATE|r Update Healthmarkers NPC IDs for DF S1\n- |CFF40E0D0UPDATE|r Add more functions for Dock Volume\n- |CFFDE3163REMOVE|r VolumeDisplay\n- |CFFDE3163REMOVE|r SL Currencys\n\n\n|CFFFF7F50### Added|r\n- |CFF6495EDNEW|r Statusbar Textures R - Series\n- |CFF6495EDNEW|r DF Currencys, Dragon Isles Supplies, Elemental Overflow\n- |CFF6495EDNEW|r Fonts Inter, Lemon, Oregano, Oswald, Ubuntu, Noto Sans\n- |CFF6495EDNEW|r Custom color for each Dock Icon\n- |CFF6495EDNEW|r Tooltip icon for mounts and toys in Retail\n- |CFF6495EDNEW|r Add more Tooltip infos for Dock Collection, Achievement\n- |CFF6495EDNEW|r Tag mLevelSmart:hideMax and mLevel:hideMax hides Player level on max level"

function mMT:Changelog(opt)
	local Frame = CreateFrame("Frame", "mMediaTagChangelog", E.UIParent, "BackdropTemplate")
	Frame:Point("CENTER")
	Frame:Size(400, 500)
	Frame:CreateBackdrop("Transparent")
	Frame:SetMovable(true)
	Frame:EnableMouse(true)
	Frame:RegisterForDrag("LeftButton")
	Frame:SetScript("OnDragStart", Frame.StartMoving)
	Frame:SetScript("OnDragStop", Frame.StopMovingOrSizing)
	Frame:SetClampedToScreen(true)
	Frame.mLogo = Frame:CreateTexture(nil, "ARTWORK")
	Frame.mLogo:Point("TOPLEFT", 72, -2)
	Frame.mLogo:Point("BOTTOMRIGHT", -72, 434)
	Frame.mLogo:SetTexture("Interface\\AddOns\\ElvUI_mMediaTag\\media\\misc\\logo.tga")
	Frame.UpperBar = Frame:CreateTexture(nil, "ARTWORK")
	Frame.UpperBar:Point("TOPLEFT", 72, -2)
	Frame.UpperBar:Point("BOTTOMRIGHT", -72, 434)
	Frame.UpperBar:SetTexture("Interface\\AddOns\\ElvUI_mMediaTag\\media\\misc\\logo.tga")

	local Font = GameFontHighlightSmall:GetFont()

	local Label1 = Frame:CreateFontString("ChangelogTitel", "OVERLAY", "GameTooltipText")
	Label1:SetFont(Font, 24)
	Label1:SetPoint("TOPLEFT", 20, -70)
	Label1:SetText(format("|CFF58D68D%s|r", L["Changelog:"]))

	local Label2 = Frame:CreateFontString("ChangelogText", "OVERLAY", "GameTooltipText")
	Label2:SetFont(Font, 14)
	Label2:SetPoint("TOPLEFT", 20, -120)
	Label2:SetWidth(360)
	Label2:SetText(ChangelogText)

	local Close = CreateFrame("Button", "CloseButton", Frame, BackdropTemplateMixin and "BackdropTemplate")
	Close:Point("BOTTOM", Frame, "BOTTOM", 0, 10)
	Close:SetText(CLOSE)
	Close:Size(80, 20)
	Close:SetScript("OnClick", function()
		E.db[mPlugin].mPluginVersion = ns.mVersion
		Frame:Hide()

		if opt then
			E:ToggleOptions()
		end
	end)

	local CloseButtonText = Close:CreateFontString("ChangelogText", "OVERLAY", "GameTooltipText")
	CloseButtonText:SetFont(Font, 14)
	CloseButtonText:SetPoint("CENTER")
	CloseButtonText:SetText("|CFFE74C3CClose|r")

	mSkin:HandleButton(Close)

	if opt then
		E:ToggleOptions()
	end
end
