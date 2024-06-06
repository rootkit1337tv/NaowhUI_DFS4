local NaowhUI = select(2, ...)
local NUI = unpack(NaowhUI)

NUI.InstallerData = {
	Title = format("%s %s", NUI.title, "Installation"),
	Name = NUI.title,
	tutorialImage = "Interface\\AddOns\\NaowhUI\\Core\\Media\\Textures\\NaowhUILogo.tga",
	Pages = {
		[1] = function()
			if NUI.db.global.profiles then
				PluginInstallFrame.SubTitle:SetFormattedText("Welcome to %s", NUI.title)
				PluginInstallFrame.Desc1:SetText("To load your selected NaowhUI profiles onto this character, click on 'Load Profiles'.")
				PluginInstallFrame.Desc2:SetText("To run the installation process again in order to update your profiles to their latest versions or to reinstall NaowhUI, click on 'Continue'.\nTo skip the installation process and hide this frame, click on 'Skip Process'.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:LoadProfiles() end)
				PluginInstallFrame.Option1:SetText("Load Profiles")
				PluginInstallFrame.Option2:Show()
				PluginInstallFrame.Option2:SetScript("OnClick", NUI.InstallComplete)
				PluginInstallFrame.Option2:SetText("Skip Process")
			else
				PluginInstallFrame.SubTitle:SetFormattedText("Welcome to %s", NUI.title)
				PluginInstallFrame.Desc1:SetText("This installation process will guide you through the setup of NaowhUI.\nTo get started, click on 'Continue'.\nTo skip the installation process and hide this frame, click on 'Skip Process'.")
				PluginInstallFrame.Desc2:SetText("You can skip the setup of profiles you do not want by clicking on 'Continue' without setting them up.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", NUI.InstallComplete)
				PluginInstallFrame.Option1:SetText("Skip Process")
			end
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText("ElvUI")
			PluginInstallFrame.Desc1:SetText("Click on the button below representing the ElvUI layout of your choice.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:Setup("ElvUI", true, "normal") end)
			PluginInstallFrame.Option1:SetText("Normal")
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript("OnClick", function() NUI:Setup("ElvUI", true, "dark") end)
			PluginInstallFrame.Option2:SetText("Dark")
		end,
		[3] = function()
			if NUI:IsAddOnEnabled("BigWigs") then
				PluginInstallFrame.SubTitle:SetText("BigWigs")
				PluginInstallFrame.Desc1:SetText("Click on the button below to setup Naowh's BigWigs profile.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:Setup("BigWigs", true) end)
				PluginInstallFrame.Option1:SetText("Setup BigWigs")
			else
				PluginInstallFrame.SubTitle:SetText("BigWigs is not enabled, please enable it to unlock this step.")
			end
		end,
		[4] = function()
			if NUI:IsAddOnEnabled("Details") then
				PluginInstallFrame.SubTitle:SetText("Details")
				PluginInstallFrame.Desc1:SetText("Click on the button below to setup Naowh's Details profile.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:Setup("Details", true) end)
				PluginInstallFrame.Option1:SetText("Setup Details")
			else
				PluginInstallFrame.SubTitle:SetText("Details is not enabled, please enable it to unlock this step.")
			end
		end,
		[5] = function()
			if NUI:IsAddOnEnabled("HidingBar") then
				PluginInstallFrame.SubTitle:SetText("HidingBar")
				PluginInstallFrame.Desc1:SetText("Click on the button below to setup Naowh's HidingBar profile.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:Setup("HidingBar", true) end)
				PluginInstallFrame.Option1:SetText("Setup HidingBar")
			else
				PluginInstallFrame.SubTitle:SetText("HidingBar is not enabled, please enable it to unlock this step.")
			end
		end,
		[6] = function()
			if NUI:IsAddOnEnabled("MRT") then
				PluginInstallFrame.SubTitle:SetText("MRT")
				PluginInstallFrame.Desc1:SetText("Click on the button below to setup Naowh's MRT profile.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:Setup("MRT", true) end)
				PluginInstallFrame.Option1:SetText("Setup MRT")
			else
				PluginInstallFrame.SubTitle:SetText("MRT is not enabled, please enable it to unlock this step.")
			end
		end,
		[7] = function()
			if NUI:IsAddOnEnabled("NameplateAuras") then
				PluginInstallFrame.SubTitle:SetText("NameplateAuras")
				PluginInstallFrame.Desc1:SetText("Click on the button below to setup Naowh's NameplateAuras profile.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:Setup("NameplateAuras", true) end )
				PluginInstallFrame.Option1:SetText("Setup NameplateAuras")
			else
				PluginInstallFrame.SubTitle:SetText("NameplateAuras is not enabled, please enable it to unlock this step.")
			end
		end,
		[8] = function()
			if NUI:IsAddOnEnabled("OmniCD") then
				PluginInstallFrame.SubTitle:SetText("OmniCD")
				PluginInstallFrame.Desc1:SetText("Click on the button below to setup Naowh's OmniCD profile.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:Setup("OmniCD", true) end)
				PluginInstallFrame.Option1:SetText("Setup OmniCD")
			else
				PluginInstallFrame.SubTitle:SetText("OmniCD is not enabled, please enable it to unlock this step.")
			end
		end,
		[9] = function()
			if NUI:IsAddOnEnabled("Plater") then
				PluginInstallFrame.SubTitle:SetText("Plater")
				PluginInstallFrame.Desc1:SetText("Click on the button below to setup Naowh's Plater profile.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:Setup("Plater", true) end)
				PluginInstallFrame.Option1:SetText("Setup Plater")
			else
				PluginInstallFrame.SubTitle:SetText("Plater is not enabled, please enable it to unlock this step.")
			end
		end,
		[10] = function()
			if NUI:IsAddOnEnabled("WarpDeplete") then
				PluginInstallFrame.SubTitle:SetText("WarpDeplete")
				PluginInstallFrame.Desc1:SetText("Click on the button below to setup Naowh's WarpDeplete profile.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:Setup("WarpDeplete", true) end)
				PluginInstallFrame.Option1:SetText("Setup WarpDeplete")
			else
				PluginInstallFrame.SubTitle:SetText("WarpDeplete is not enabled, please enable it to unlock this step.")
			end
		end,
		[11] = function()
			if NUI:IsAddOnEnabled("WeakAuras") then
				PluginInstallFrame.SubTitle:SetText("WeakAuras")
				PluginInstallFrame.Desc1:SetText("Click on the button below to setup Naowh's WeakAuras.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:Setup("WeakAuras", true) end)
				PluginInstallFrame.Option1:SetText("Setup WeakAuras")
			else
				PluginInstallFrame.SubTitle:SetText("WeakAuras is not enabled, please enable it to unlock this step.")
			end
		end,
		[12] = function()
			if NUI:IsAddOnEnabled("WeakAuras") then
				PluginInstallFrame.SubTitle:SetText("Class WeakAuras")
				PluginInstallFrame.Desc1:SetText("Click on the button below to select your Class WeakAuras.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", function()
					local InterfaceOptionsFrame_OpenToCategory = InterfaceOptionsFrame_OpenToCategory

					if InterfaceOptionsFrame_OpenToCategory then
						InterfaceOptionsFrame_OpenToCategory("NaowhUI")
					else
						Settings.OpenToCategory("NaowhUI")
					end

					PluginInstallFrame:SetFrameLevel(279)
					PluginInstallFrame:SetFrameStrata("MEDIUM")
				end)
				PluginInstallFrame.Option1:SetText("Open Settings")
			else
				PluginInstallFrame.SubTitle:SetText("WeakAuras is not enabled, please enable it to unlock this step.")
			end
		end,
		[13] = function()
			PluginInstallFrame.SubTitle:SetText("Installation Complete")
			PluginInstallFrame.Desc1:SetText("You have completed the installation process.")
			PluginInstallFrame.Desc2:SetText("Please click on the button below to reload your UI. This will ensure everything is working as expected.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", NUI.InstallComplete)
			PluginInstallFrame.Option1:SetText("Finished")
		end,
	},
	StepTitles = {
		[1] = "Welcome",
		[2] = "ElvUI",
		[3] = "BigWigs",
		[4] = "Details",
		[5] = "HidingBar",
		[6] = "MRT",
		[7] = "NameplateAuras",
		[8] = "OmniCD",
		[9] = "Plater",
		[10] = "WarpDeplete",
		[11] = "WeakAuras",
		[12] = "Class WeakAuras",
		[13] = "Installation Complete",
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "RIGHT",
}