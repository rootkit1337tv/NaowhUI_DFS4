local NaowhUI = select(2, ...)
local NUI = unpack(NaowhUI)

function NUI:Setup(addon, import, layout)
	local pairs = pairs
	local LibStub = LibStub
	local tinsert = tinsert
	local PluginInstallStepComplete = PluginInstallStepComplete

	if addon == "BigWigs" then
		if import then
			if not BigWigs3DB then
				BigWigs3DB = {}
				BigWigs3DB.namespaces = {}
				BigWigs3DB.profiles = {}
			end

			if not BigWigs3DB.profiles.Naowh then
				BigWigs3DB.profiles.Naowh = {}
			end
	
			for k,v in pairs(self.BigWigsData.namespaces) do
				if v.profiles and v.profiles.Naowh then
					if not BigWigs3DB.namespaces[k] or not BigWigs3DB.namespaces[k].profiles then
						BigWigs3DB.namespaces[k] = {}
						BigWigs3DB.namespaces[k].profiles = {}
					end
	
					BigWigs3DB.namespaces[k].profiles.Naowh = v.profiles.Naowh
				end
			end
		end
	
		local AddOnProfiles = BigWigs3DB.profiles

		if AddOnProfiles.Naowh then
			local db = LibStub("AceDB-3.0"):New(BigWigs3DB)

			if not self.db.global.profiles then
				self.db.global.profiles = {}
			end

			if not self.db.global.profiles.BigWigs then
				self.db.global.profiles.BigWigs = true
			end

			db:SetProfile("Naowh")
		else
			self.db.global.profiles.BigWigs = nil
		end
	elseif addon == "Details" then
		local _detalhes = _detalhes

		if import then
			_detalhes_global.__profiles.Naowh = self.DetailsData
		end

		if _detalhes_global.__profiles.Naowh then
			if not self.db.global.profiles then
				self.db.global.profiles = {}
			end

			if not self.db.global.profiles.Details then
				self.db.global.profiles.Details = true
			end

			_detalhes:ApplyProfile("Naowh")
		else
			self.db.global.profiles.Details = nil
		end
	elseif addon == "ElvUI" then
		local ElvDB = ElvDB
		local E = unpack(ElvUI)

		if import then
			if layout == "normal" then
				ElvDB.profiles.Naowh = self.ElvUINormalData
			elseif layout == "dark" then
				ElvDB.profiles["Naowh Dark"] = self.ElvUIDarkData
			end

			E:SetupCVars(noDisplayMsg)

			ElvDB.global.general.UIScale = 0.71
		end

		if ElvDB.profiles.Naowh or ElvDB.profiles["Naowh Dark"] then
			if not self.db.global.profiles then
				self.db.global.profiles = {}
			end

			if layout == "normal" and ElvDB.profiles.Naowh then
				if not self.db.global.profiles.ElvUI then
					self.db.global.profiles.ElvUI = "normal"
				end
	
				E.data:SetProfile("Naowh")
			elseif layout == "dark" and ElvDB.profiles["Naowh Dark"] then
				if not self.db.global.profiles.ElvUI then
					self.db.global.profiles.ElvUI = "dark"
				end
	
				E.data:SetProfile("Naowh Dark")
			end
	
			E:StaggeredUpdateAll()
	
			E.private.general.chatBubbleFont = "Naowh"
			E.private.general.chatBubbleFontOutline = "OUTLINE"
			E.private.general.chatBubbleFontSize = 11
			E.private.general.chatBubbles = "disabled"
			E.private.general.dmgfont = "GothamNarrowUltra"
			E.private.general.namefont = "Naowh"
			E.private.nameplates.enable = false
		else
			self.db.global.profiles.ElvUI = nil
		end
	elseif addon == "HidingBar" then
		if import then
			local HidingBarDatabase = {}

			if not self.db.global.profiles then
				self.db.global.profiles = {}
			end
		
			if not self.db.global.profiles.HidingBar then
				self.db.global.profiles.HidingBar = true
			end

			for _,v in ipairs(HidingBarDB.profiles) do
				if v.name ~= "Naowh" then
					v.isDefault = nil
		
					tinsert(HidingBarDatabase, v)
				end
			end
		
			tinsert(HidingBarDatabase, self.HidingBarData)
		
			HidingBarDB.profiles = HidingBarDatabase
		end
	elseif addon == "MRT" then
		if import then
			local MRTProfile = VMRT.Profile or "default"
			local IgnoredKeys = {
				["Addon"]=true,
				["Attendance"] = true,
				["Encounter"] = true,
				["LootHistory"] = true,
				["Profile"]=true,
				["ProfileKeys"]=true,
				["Profiles"]=true,
				["Reminder"] = true,
				["Reminder2"] = true
			}

			VMRT.Profiles[MRTProfile] = {}

			if VMRT.Profile ~= "Naowh" then
				VMRT.Profile = "Naowh"
			end

			for k,v in pairs(VMRT) do
				if not IgnoredKeys[k] then
					VMRT.Profiles[MRTProfile][k] = v
					VMRT[k] = nil
				end
			end

			for k,v in pairs(self.MRTData) do
				if not IgnoredKeys[k] then
					VMRT[k] = v
				end
			end
		end

		if VMRT.Profile == "Naowh" or VMRT.Profiles.Naowh then
			if VMRT.ProfileKeys[self.mynameRealm] ~= "Naowh" then
				VMRT.ProfileKeys[self.mynameRealm] = "Naowh"
			end

			if not self.db.global.profiles then
				self.db.global.profiles = {}
			end

			if not self.db.global.profiles.MRT then
				self.db.global.profiles.MRT = true
			end
		else
			self.db.global.profiles.MRT = nil
		end
	elseif addon == "NameplateAuras" then
		local NameplateAurasAceDB = NameplateAurasAceDB

		if import then
			NameplateAurasAceDB.profiles.Naowh = self.NameplateAurasData
		end

		if NameplateAurasAceDB.profiles.Naowh then
			local db = LibStub("AceDB-3.0"):New(NameplateAurasAceDB)

			if not self.db.global.profiles then
				self.db.global.profiles = {}
			end

			if not self.db.global.profiles.NameplateAuras then
				self.db.global.profiles.NameplateAuras = true
			end

			db:SetProfile("Naowh")
		else
			self.db.global.profiles.NameplateAuras = nil
		end
	elseif addon == "OmniCD" then
		local OmniCDDB = OmniCDDB

		if import then
			OmniCDDB.profiles.Naowh = self.OmniCDData
		end

		if OmniCDDB.profiles.Naowh then
			local db = LibStub("AceDB-3.0"):New(OmniCDDB)

			if not self.db.global.profiles then
				self.db.global.profiles = {}
			end

			if not self.db.global.profiles.OmniCD then
				self.db.global.profiles.OmniCD = true
			end

			db:SetProfile("Naowh")
		else
			self.db.global.profiles.OmniCD = nil
		end
	elseif addon == "Plater" then
		local PlaterDB = PlaterDB

		if import then
			PlaterDB.profiles.Naowh = self.PlaterData
		end

		if PlaterDB.profiles.Naowh then
			local db = LibStub("AceDB-3.0"):New(PlaterDB)

			if not self.db.global.profiles then
				self.db.global.profiles = {}
			end

			if not self.db.global.profiles.Plater then
				self.db.global.profiles.Plater = true
			end

			db:SetProfile("Naowh")
		else
			self.db.global.profiles.Plater = nil
		end
	elseif addon == "WarpDeplete" then
		local WarpDepleteDB = WarpDepleteDB

		if import then
			WarpDepleteDB.profiles.Naowh = self.WarpDepleteData
		end

		if WarpDepleteDB.profiles.Naowh then
			local db = LibStub("AceDB-3.0"):New(WarpDepleteDB)

			if not self.db.global.profiles then
				self.db.global.profiles = {}
			end

			if not self.db.global.profiles.WarpDeplete then
				self.db.global.profiles.WarpDeplete = true
			end

			db:SetProfile("Naowh")
		else
			self.db.global.profiles.WarpDeplete = nil
		end
	elseif addon == "WeakAuras" then
		if import then
			if not self.db.global.profiles then
				self.db.global.profiles = {}
			end
		
			if not self.db.global.profiles.WeakAuras then
				self.db.global.profiles.WeakAuras = true
			end

			for k,v in pairs(WeakAurasSaved.displays) do
				if not self.WeakAurasData[k] and v.url == "NaowhUI" then
					WeakAurasSaved.displays[k] = nil
				end
			end
		
			for k,v in pairs(self.WeakAurasData) do
				if not WeakAurasSaved.displays[k] or (WeakAurasSaved.displays[k] and WeakAurasSaved.displays[k].url == "NaowhUI") then
					WeakAurasSaved.displays[k] = v
				end
			end
		end
	end

	if PluginInstallStepComplete then
		PluginInstallStepComplete:Hide()
		PluginInstallStepComplete.message = "Success"
		PluginInstallStepComplete:Show()
	end
end