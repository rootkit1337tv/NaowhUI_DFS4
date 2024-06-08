local _G = _G

local AceAddon = _G.LibStub("AceAddon-3.0")

local AddOnName, Engine = ...
local NUI = AceAddon:NewAddon(AddOnName, "AceComm-3.0", "AceConsole-3.0", "AceEvent-3.0")

Engine[1] = NUI
Engine[2] = {}
_G.NaowhUI = Engine

do
	function NUI:AddonCompartmentFunc()
		NUI:RunInstaller()
	end

	_G.NaowhUI_AddonCompartmentFunc = NUI.AddonCompartmentFunc
end

function NUI:OnEnable()
	self:Initialize()
end

function NUI:OnInitialize()
	local LibStub = LibStub
	local IncompatibleAddOns = {
		"ElvUI_SLE",
		"ElvUI_WindTools",
		"NaowhUI_Installer",
		"SharedMedia_Naowh"
	}

	self.db = LibStub("AceDB-3.0"):New("NaowhDB")

	if (self.db.global and not self.db.global.version) or type(self.db.global.version) == "string" or (self.db.global.version <= 20240501 or self.db.global.version == 99999999) then
		self.db:ResetDB()
	end

	for _,v in ipairs(IncompatibleAddOns) do
		if self:IsAddOnEnabled(v) then
			C_AddOns.DisableAddOn(v)
		end
	end

	for k in pairs(self.RegisteredEvents) do
		self:RegisterEvent(k, "HandleEvents")
	end

	LibStub("AceConfig-3.0"):RegisterOptionsTable("NaowhUI", self.options)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("NaowhUI")
	self:RegisterChatCommand("nui", "HandleChatCommand")
	self:RegisterComm("nui")
end