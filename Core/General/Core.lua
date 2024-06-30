local NaowhUI = select(2, ...)
local NUI = unpack(NaowhUI)

local tonumber, tostring = tonumber, tostring
local format = format

local ReloadUI = ReloadUI

local StaticPopupDialogs = StaticPopupDialogs
local OnAccept = OnAccept
local StaticPopup_Show = StaticPopup_Show
local C_AddOns_IsAddOnLoaded = C_AddOns.IsAddOnLoaded
local CommReceived

NUI.title = format("|cff0091edNaowh|r|cffffa300UI|r")
NUI.version = tonumber(C_AddOns.GetAddOnMetadata("NaowhUI", "Version"))
NUI.myname = UnitName("player")
NUI.myrealm = GetRealmName()
NUI.mynameRealm = format("%s - %s", NUI.myname, NUI.myrealm):gsub(" ","")

NUI.RegisteredEvents = {
	["CHAT_MSG_GUILD"] = "GUILD",
	["CHAT_MSG_GUILD_ACHIEVEMENT"] = "GUILD",
	["CHAT_MSG_GUILD_ITEM_LOOTED"] = "GUILD",
	["GROUP_ROSTER_UPDATE"] = "INSTANCE_CHAT"
}

local function DoubleConfirmation(PassedFunction)
	StaticPopupDialogs["DoubleConfirmation"] = {
		text = "Are you sure? This step is irreversible!",
		button1 = "Yes",
		button2 = "No",
		OnAccept = function() PassedFunction() end,
		StartDelay = function() return 3 end,
	}
	StaticPopup_Show("DoubleConfirmation")
end

function NUI:OpenToCategory()
	if NUI.Retail then
		Settings.OpenToCategory("NaowhUI")
	else
		InterfaceOptionsFrame_OpenToCategory("NaowhUI")
	end
end

function NUI:RunInstaller()
	if C_AddOns_IsAddOnLoaded("ElvUI") then
		local E = unpack(ElvUI)

		E:GetModule("PluginInstaller"):Queue(self.InstallerData)
	else
		self:OpenToCategory()
	end
end

function NUI:LoadProfiles(PassedProfiles, import)
	local PassedProfiles = PassedProfiles or NUI.db.global.profiles

	for k,v in pairs(PassedProfiles) do
		if C_AddOns_IsAddOnLoaded(k) and k == "ElvUI" and type(v) == "string" then
			NUI:Setup(k, import, v)
		elseif C_AddOns_IsAddOnLoaded(k) then
			NUI:Setup(k, import)
		end
	end

	if import then
		NUI:InstallComplete()
	else
		if not NUI.db.char.installed then
			NUI.db.char.installed = true
		end

		ReloadUI()
	end
end

function NUI:Initialize()
	if C_AddOns_IsAddOnLoaded("Details") then
		local _detalhes = _detalhes

		if _detalhes.is_first_run then
			if #_detalhes.custom == 0 then
				_detalhes:AddDefaultCustomDisplays()
			end

			_detalhes.is_first_run = false
		end

		if _detalhes.is_version_first_run then
			_detalhes.is_version_first_run = false
		end

		if _detalhes.character_first_run then
			_detalhes.character_first_run = false
		end
	end

	if C_AddOns_IsAddOnLoaded("ElvUI") then
		local E = unpack(ElvUI)

		if E.InstallFrame and E.InstallFrame:IsShown() then
			E.InstallFrame:Hide()

			E.private.install_complete = E.version
		end

		if not E.global.ignoreIncompatible then
			E.global.ignoreIncompatible = true
		end
	end

	if self.db.global.profiles and not self.db.char.installed then
		StaticPopupDialogs["LoadProfiles"] = {
			text = "Do you want to load your selected NaowhUI profiles onto this character?",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function() self:LoadProfiles() end,
			OnCancel = function() self.db.char.installed = true end,
		}
		StaticPopup_Show("LoadProfiles")
	end
end

function NUI:HandleChatCommand(input)
	if input == "install" then
		self:RunInstaller()
	elseif input == "update" then
		local SelectedProfiles = self.db.global.profiles

		if SelectedProfiles then
			self:Warning("|cffff0000!!WARNING!!|r\n\nThis step will overwrite your current profile settings. Proceed at your own discretion.", function() self:LoadProfiles(SelectedProfiles, true) end)
		else
			self:Print("Your database is empty, please install at least one profile to use this command.")
		end
	end
end

function NUI:OnCommReceived(prefix, message)
	if prefix == "nui" and tonumber(message) > self.version and tonumber(message) ~= 99999999 and not CommReceived then
		self:Print("Your AddOn is out of date. Please update it by following the steps in ui-guide.")

		CommReceived = true
	end
end

function NUI:HandleEvents(eventName)
	self:SendCommMessage("nui", tostring(self.version), self.RegisteredEvents[eventName])
end

function NUI:InstallComplete()
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	if not NUI.db.char.installed then
		NUI.db.char.installed = true
	end

	if not NUI.db.global.version or NUI.db.global.version < NUI.version then
		NUI.db.global.version = NUI.version
	end

	ReloadUI()
end

function NUI:Warning(string, PassedFunction)
	StaticPopupDialogs["Warning"] = {
		text = string,
		button1 = "Yes",
		button2 = "No",
		OnAccept = function() DoubleConfirmation(PassedFunction) end,
	}
	StaticPopup_Show("Warning")
end