local NaowhUI = select(2, ...)
local NUI = unpack(NaowhUI)

local ReloadUI = ReloadUI

NUI.options = {
	name = "NaowhUI",
	type = "group",
	args = {
		addonprofiles = {
			name = "AddOn profiles",
			order = 1,
			hidden = function()
				if NUI:IsAddOnEnabled("ElvUI") or (not NUI:IsAddOnEnabled("BigWigs") and not NUI:IsAddOnEnabled("Details") and not NUI:IsAddOnEnabled("HidingBar") and not NUI:IsAddOnEnabled("NameplateAuras") and not NUI:IsAddOnEnabled("Plater") and not NUI:IsAddOnEnabled("WeakAuras")) then
					return true
				end
			end,
			type = "group",
			args = {
				bigwigs = {
					name = "BigWigs",
					desc = "Setup BigWigs",
					hidden = function()
						if not NUI:IsAddOnEnabled("BigWigs") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("BigWigs", true)
						NUI:InstallComplete()
					end
				},
				details = {
					name = "Details",
					desc = "Setup Details",
					hidden = function()
						if not NUI:IsAddOnEnabled("Details") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("Details", true)
						NUI:InstallComplete()
					end
				},
				hidingbar = {
					name = "HidingBar",
					desc = "Setup HidingBar",
					hidden = function()
						if not NUI:IsAddOnEnabled("HidingBar") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("HidingBar", true)
						NUI:InstallComplete()
					end
				},
				nameplateauras = {
					name = "NameplateAuras",
					desc = "Setup NameplateAuras",
					hidden = function()
						if not NUI:IsAddOnEnabled("NameplateAuras") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("NameplateAuras", true)
						NUI:InstallComplete()
					end
				},
				plater = {
					name = "Plater",
					desc = "Setup Plater",
					hidden = function()
						if not NUI:IsAddOnEnabled("Plater") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("Plater", true)
						NUI:InstallComplete()
					end
				},
				weakauras = {
					name = "WeakAuras",
					desc = "Setup WeakAuras",
					hidden = function()
						if not NUI:IsAddOnEnabled("WeakAuras") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("WeakAuras", true)
						NUI:InstallComplete()
					end
				}
			}
		},
		classweakauras = {
			name = "Class WeakAuras",
			order = 2,
			hidden = function()
				if not NUI:IsAddOnEnabled("WeakAuras") then
					return true
				end
			end,
			type = "group",
			args = {
				druid = {
					name = "Druid",
					desc = "Import the Druid Class WeakAura",
					type = "execute",
					func = function() WeakAuras.Import(NUI.WeakAurasDruidData) end
				},
				hunter = {
					name = "Hunter",
					desc = "Import the Hunter Class WeakAura",
					type = "execute",
					func = function()WeakAuras.Import(NUI.WeakAurasHunterData) end
				},
				mage = {
					name = "Mage",
					desc = "Import the Mage Class WeakAura",
					type = "execute",
					func = function() WeakAuras.Import(NUI.WeakAurasMageData) end
				},
				paladin = {
					name = "Paladin",
					desc = "Import the Paladin Class WeakAura",
					type = "execute",
					func = function() WeakAuras.Import(NUI.WeakAurasPaladinData) end
				},
				priest = {
					name = "Priest",
					desc = "Import the Priest Class WeakAura",
					type = "execute",
					func = function() WeakAuras.Import(NUI.WeakAurasPriestData) end
				},
				rogue = {
					name = "Rogue",
					desc = "Import the Rogue Class WeakAura",
					type = "execute",
					func = function() WeakAuras.Import(NUI.WeakAurasRogueData) end
				},
				shaman = {
					name = "Shaman",
					desc = "Import the Shaman Class WeakAura",
					type = "execute",
					func = function() WeakAuras.Import(NUI.WeakAurasShamanData) end
				},
				warlock = {
					name = "Warlock",
					desc = "Import the Warlock Class WeakAura",
					type = "execute",
					func = function() WeakAuras.Import(NUI.WeakAurasWarlockData) end
				},
				warrior = {
					name = "Warrior",
					desc = "Import the Warrior Class WeakAura",
					type = "execute",
					func = function() WeakAuras.Import(NUI.WeakAurasWarriorData) end
				}
			}
		},
		advanced = {
			name = "Advanced",
			order = -1,
			type = "group",
			args = {
				loadprofiles = {
					name = "Load Profiles",
					desc = "Load your selected NaowhUI profiles onto this character",
					hidden = function()
						if NUI:IsAddOnEnabled("ElvUI") or not NUI.db.global.profiles then
							return true
						end
					end,
					type = "execute",
					func = function() NUI:LoadProfiles() end
				},
				printversion = {
					name = "Print Version",
					desc = "Print the current NaowhUI AddOn version",
					type = "execute",
					func = function() NUI:Print(NUI.version) end
				},
				wipedatabase = {
					name = "Wipe Database",
					desc = "Wipe the current NaowhUI database",
					type = "execute",
					func = function()
						NUI:Warning("|cffff0000!!WARNING!!|r\n\nThis step will wipe your current NaowhUI database. Proceed at your own discretion.", function()
							NUI.db = nil

							ReloadUI()
						end)
					end
				},
				wipeweakauras = {
					name = "Wipe WeakAuras",
					desc = "Wipe all current WeakAuras",
					hidden = function()
						if not NUI:IsAddOnEnabled("WeakAuras") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Warning("|cffff0000!!WARNING!!|r\n\nThis step will wipe your current WeakAuras. Proceed at your own discretion.", function()
							WeakAurasSaved = nil

							ReloadUI()
						end)
					end
				}
			}
		}
	}
}