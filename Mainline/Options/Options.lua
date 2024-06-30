local NaowhUI = select(2, ...)
local NUI = unpack(NaowhUI)

local C_AddOns_IsAddOnLoaded = C_AddOns.IsAddOnLoaded
local WeakAuras_Import = WeakAuras.Import
local ReloadUI = ReloadUI

NUI.options = {
	name = "NaowhUI",
	type = "group",
	args = {
		addonprofiles = {
			name = "AddOn profiles",
			order = 1,
			hidden = function()
				if C_AddOns_IsAddOnLoaded("ElvUI") or (not C_AddOns_IsAddOnLoaded("BigWigs") and not C_AddOns_IsAddOnLoaded("Details") and not C_AddOns_IsAddOnLoaded("HidingBar") and not C_AddOns_IsAddOnLoaded("MRT") and not C_AddOns_IsAddOnLoaded("NameplateAuras") and not C_AddOns_IsAddOnLoaded("OmniCD") and not C_AddOns_IsAddOnLoaded("Plater") and not C_AddOns_IsAddOnLoaded("WarpDeplete") and not C_AddOns_IsAddOnLoaded("WeakAuras")) then
					return true
				end
			end,
			type = "group",
			args = {
				bigwigs = {
					name = "BigWigs",
					desc = "Setup BigWigs",
					hidden = function()
						if not C_AddOns_IsAddOnLoaded("BigWigs") then
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
						if not C_AddOns_IsAddOnLoaded("Details") then
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
						if not C_AddOns_IsAddOnLoaded("HidingBar") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("HidingBar", true)
						NUI:InstallComplete()
					end
				},
				mrt = {
					name = "MRT",
					desc = "Setup MRT",
					hidden = function()
						if not C_AddOns_IsAddOnLoaded("MRT") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("MRT", true)
						NUI:InstallComplete()
					end
				},
				nameplateauras = {
					name = "NameplateAuras",
					desc = "Setup NameplateAuras",
					hidden = function()
						if not C_AddOns_IsAddOnLoaded("NameplateAuras") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("NameplateAuras", true)
						NUI:InstallComplete()
					end
				},
				omnicd = {
					name = "OmniCD",
					desc = "Setup OmniCD",
					hidden = function()
						if not C_AddOns_IsAddOnLoaded("OmniCD") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("OmniCD", true)
						NUI:InstallComplete()
					end
				},
				plater = {
					name = "Plater",
					desc = "Setup Plater",
					hidden = function()
						if not C_AddOns_IsAddOnLoaded("Plater") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("Plater", true)
						NUI:InstallComplete()
					end
				},
				warpdeplete = {
					name = "WarpDeplete",
					desc = "Setup WarpDeplete",
					hidden = function()
						if not C_AddOns_IsAddOnLoaded("WarpDeplete") then
							return true
						end
					end,
					type = "execute",
					func = function()
						NUI:Setup("WarpDeplete", true)
						NUI:InstallComplete()
					end
				},
				weakauras = {
					name = "WeakAuras",
					desc = "Setup WeakAuras",
					hidden = function()
						if not C_AddOns_IsAddOnLoaded("WeakAuras") then
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
				if not C_AddOns_IsAddOnLoaded("WeakAuras") then
					return true
				end
			end,
			type = "group",
			args = {
				deathknight = {
					name = "Death Knight",
					desc = "Import the Death Knight Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasDeathKnightData) end
				},
				demonhunter = {
					name = "Demon Hunter",
					desc = "Import the Demon Hunter Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasDemonHunterData) end
				},
				druid = {
					name = "Druid",
					desc = "Import the Druid Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasDruidData) end
				},
				evoker = {
					name = "Evoker",
					desc = "Import the Evoker Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasEvokerData) end
				},
				hunter = {
					name = "Hunter",
					desc = "Import the Hunter Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasHunterData) end
				},
				mage = {
					name = "Mage",
					desc = "Import the Mage Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasMageData) end
				},
				monk = {
					name = "Monk",
					desc = "Import the Monk Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasMonkData) end
				},
				paladin = {
					name = "Paladin",
					desc = "Import the Paladin Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasPaladinData) end
				},
				priest = {
					name = "Priest",
					desc = "Import the Priest Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasPriestData) end
				},
				rogue = {
					name = "Rogue",
					desc = "Import the Rogue Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasRogueData) end
				},
				shaman = {
					name = "Shaman",
					desc = "Import the Shaman Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasShamanData) end
				},
				warlock = {
					name = "Warlock",
					desc = "Import the Warlock Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasWarlockData) end
				},
				warrior = {
					name = "Warrior",
					desc = "Import the Warrior Class WeakAura",
					type = "execute",
					func = function() WeakAuras_Import(NUI.WeakAurasWarriorData) end
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
						if C_AddOns_IsAddOnLoaded("ElvUI") or (not C_AddOns_IsAddOnLoaded("BigWigs") and not C_AddOns_IsAddOnLoaded("Details") and not C_AddOns_IsAddOnLoaded("HidingBar") and not C_AddOns_IsAddOnLoaded("MRT") and not C_AddOns_IsAddOnLoaded("NameplateAuras") and not C_AddOns_IsAddOnLoaded("OmniCD") and not C_AddOns_IsAddOnLoaded("Plater") and not C_AddOns_IsAddOnLoaded("WarpDeplete") and not C_AddOns_IsAddOnLoaded("WeakAuras")) or not NUI.db.global.profiles then
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
						if not C_AddOns_IsAddOnLoaded("WeakAuras") then
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