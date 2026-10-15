LRM_IsUserPremium=false
LRM_LinkedDiscordID="\048"
LRM_ScriptName="\115\116\101\097\108"
LRM_TotalExecutions=0
LRM_SecondsLeft=math.huge
LRM_UserNote="\078\111\116\032\115\112\101\099\105\102\105\101\100"
LRM_ScriptVersion="\048\046\048\046\048\046\049"
LRM_ExecutionTrace="\102\097\049\095\055\078\078\109\095\119\066\106\065\082\050\095\067\070\095\095\071\048\054\089\090\102\090\048"

do
local type,pcall,rawget,rawset,tonumber,ipairs=type,pcall,rawget,rawset,tonumber,ipairs
local function environmentOf(provider,fallback)
if type(provider)=="function" then local ok,value=pcall(function()return provider()end) if ok and type(value)=="table" then return value end end
return fallback
end
local scriptEnvironment=environmentOf(getfenv,_G)
local environment=environmentOf(getgenv,scriptEnvironment)
local previous=type(environment)=="table" and rawget(environment,"FlowAuth") or nil
if type(previous)=="table" and type(previous.Stop)=="function" then pcall(previous.Stop,previous) end
local active=true
local client={}
local keyedFeatureOrigin="\104\116\116\112\115\058\047\047\102\108\111\119\097\117\116\104\046\110\101\116"
local keyedFeatureGatewayOrigin="\104\116\116\112\115\058\047\047\102\108\111\119\097\117\116\104\046\110\101\116"
local keyedFeatureBusy={}
local function keyedFeatureHash(value)
if type(value)~="string" then return nil end
value=string.lower(value)
if #value~=32 or not string.match(value,"^[a-f0-9]+$") then return nil end
return value
end
function client:GetKeyLink(loaderHash)
loaderHash=keyedFeatureHash(loaderHash)
if not loaderHash then return nil,"invalid_loader_hash" end
return keyedFeatureGatewayOrigin.."/getkey?project_id="..loaderHash
end
function client:RequireKey(loaderHash,key)
if not active then return false,"client_stopped" end
loaderHash=keyedFeatureHash(loaderHash)
if not loaderHash then return false,"invalid_loader_hash" end
local gateway=keyedFeatureGatewayOrigin.."/getkey?project_id="..loaderHash
if key==nil then key=""end
if type(key)~="string" then return false,"key_required",gateway end
key=string.gsub(key,"^%s*(.-)%s*$","%1")
if #key<0 or #key>512 or string.find(key,"%c") then return false,"invalid_key",gateway end
if keyedFeatureBusy[loaderHash] then return false,"feature_loading",gateway end
keyedFeatureBusy[loaderHash]=true
local url=keyedFeatureOrigin.."/v1/loaders/"..loaderHash..".lua"
local source=nil
for attempt=1,2 do
local ok,value=pcall(game.HttpGet,game,url)
if ok and type(value)=="string" and #value>0 and #value<=262144 and not string.find(string.lower(value),"<html",1,true) then source=value break end
if attempt==1 and type(task)=="table" and type(task.wait)=="function" then task.wait(.15) end
end
url=nil
if not source then keyedFeatureBusy[loaderHash]=nil key=nil return false,"loader_download_failed",gateway end
local compiler=loadstring
if type(compiler)~="function" then keyedFeatureBusy[loaderHash]=nil source=nil key=nil return false,"loadstring_unavailable",gateway end
local feature,compileError=compiler(source,"=FlowAuthKeyedFeature")
source=nil
if not feature then keyedFeatureBusy[loaderHash]=nil key=nil return false,"loader_compile_failed: "..tostring(compileError),gateway end
local callOk,featureResult=xpcall(function()return feature(key)end,function(value)return tostring(value)end)
key=nil
feature=nil
keyedFeatureBusy[loaderHash]=nil
if not callOk then return false,featureResult,gateway end
return true,featureResult,gateway
end
function client:Stop()
active=false
if type(environment)=="table" and rawget(environment,"FlowAuth")==self then
pcall(rawset,environment,"FlowAuth",nil)
end
end
if type(environment)=="table" then pcall(rawset,environment,"FlowAuth",client) end
end

local function ClaudeHubMain(...)
	if type(game) == "nil" then
		return
	end
	local bootOk = false
	pcall(function(...)
		bootOk = (type(game.GetService) == "function")
	end)
	if not bootOk then
		return
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	local e = game:GetService("Players")
	local r = game:GetService("Workspace")
	local y = game:GetService("RunService")
	local u = game:GetService("TweenService")
	local w = game:GetService("UserInputService")
	local j = game:GetService("ReplicatedStorage")
	local k = game:GetService("ProximityPromptService")
	local a = game:GetService("HttpService")
	local TeleportService = game:GetService("TeleportService")
	local o = e.LocalPlayer
	local DISCORD_LINK = "https://discord.gg/TBBAUZu8cW"
	local ADS_MSG = "discord.gg/cyDpbvxeGN - Bug? Join discord & report! - KEYLESS"
	local ADS_MSG_SHORT = "discord.gg/cyDpbvxeGN - Bug? Join discord!"
	
	local SCRIPT_VERSION = ""
	local SCRIPT_BUILD = ""
	local function CopyDiscord(...)
		local clipboardFn = setclipboard or toClipboard or toclipboard or write_clipboard
		pcall(function(...)
			if typeof(clipboardFn) == "function" then
				clipboardFn(DISCORD_LINK)
			end
		end)
	end
	
	pcall(CopyDiscord)
	task.spawn(function()
		task.wait(0.8)
		pcall(CopyDiscord)
	end)
	local Window = nil
	local currentLang = "EN"
	local executorCheckCaller = typeof(checkcaller) == "function" and checkcaller or function()
		return false
	end
	local safeNewCClosure = typeof(newcclosure) == "function" and newcclosure or function(fn)
		return fn
	end
	local V = game:GetService("ProximityPromptService")
	pcall(function(...)
		V.PromptButtonHoldBegan:Connect(function(e, ...)
			pcall(function(...)
				if typeof(fireproximityprompt) == "function" then
					fireproximityprompt(e)
				end
			end)
		end)
	end)
	
	local H = function(...) end
	local t = function(...) end
	local s = nil
	pcall(function(...)
		s = require((j:WaitForChild("Client", 5)):WaitForChild("EggState", 5))
	end)
	if not s then
		pcall(function(...)
			s = require(j.Client.EggState)
		end)
	end
	local p = nil
	pcall(function(...)
		p = require(((j:WaitForChild("Shared", 5)):WaitForChild("Util", 5)):WaitForChild("AssetItems", 5))
	end)
	if not p then
		pcall(function(...)
			p = require(j.Shared.Util.AssetItems)
		end)
	end
	local B = nil
	pcall(function(...)
		B = require((j:WaitForChild("Shared", 5)):WaitForChild("Remotes", 5))
	end)
	if not B then
		pcall(function(...)
			B = require(j.Shared.Remotes)
		end)
	end
	local function J(e, r, ...)
		local y = (j:FindFirstChild("Packages") and j.Packages:FindFirstChild("Networking"))
			or j:FindFirstChild("Network")
		local u = y:FindFirstChild(e) or j:FindFirstChild(e)
		if u then
			return u
		end
		local w = y:FindFirstChild(e, true) or j:FindFirstChild(e, true)
		if w then
			return w
		end
		if r then
			local e = y:FindFirstChild(r) or j:FindFirstChild(r)
			if e then
				return e
			end
			local u = y:FindFirstChild(r, true) or j:FindFirstChild(r, true)
			if u then
				return u
			end
		end
		local k = string.match(e, "[^/]+$")
		if k then
			local e = y:FindFirstChild(k, true) or j:FindFirstChild(k, true)
			if e then
				return e
			end
		end
		return nil
	end

	local K = J("RF/EggWorld/AskPlaceEgg", "AskPlaceEgg")
	local c = J("RF/EggWorld/AskLiveSnapshot", "AskLiveSnapshot")
	local v = J("RF/Homestead/AskState", "RF/Plots/AskState") or J("AskState")
	local i = J("RF/EggWorld/AskFieldEggCarry", "AskFieldEggCarry")
	local R = J("RF/EggWorld/AskFieldEggSnapshot", "AskFieldEggSnapshot")
		or J("Eggs: RequestAreaEggSnapshot", "RequestAreaEggSnapshot")
	local g = J("RF/EggWorld/AskHatch", "AskHatch") or J("Eggs: RequestHatchEgg")
	local Q = J("RF/EggWorld/AskFinishHatch", "AskFinishHatch") or J("Eggs: RequestCompleteHatchEgg")
	local P = J("RE/GuardPatrol/ForestStrike", "ForestStrike") or (B and (B.GuardPatrol and B.GuardPatrol.ForestStrike))
	local N = J("SpeedTollOffer", "RE/GuardPatrol/SpeedTollOffer")
		or (B and (B.GuardPatrol and B.GuardPatrol.SpeedTollOffer))
	local U = J("RF/Treadmill/AskDoff", "AskDoff")
	local l = J("RF/Treadmill/AskDon", "AskDon") or J("RF/Treadmill/AskMount", "AskMount")
	local D = J("RF/Treadmill/AskTierRaise", "Treadmills: RequestUpgrade", "AskTierRaise")
	local C = J("RF/Trailwear/AskPurchase", "Trailwear: RequestPurchase", "AskPurchase")
	local q = J("RF/Trailwear/AskChoose", "Trailwear: RequestEquip", "AskChoose")
	local n = J("RF/Trailwear/AskDoff", "Trailwear: RequestUnequip", "AskDoff")
	H(
		string.format(
			"[RemoteCheck] Carry: %s | Snapshot: %s | Place: %s | Hatch: %s | FinishHatch: %s | Strike: %s | Toll: %s | Doff: %s",
			tostring(i ~= nil),
			tostring(R ~= nil),
			tostring(K ~= nil),
			tostring(g ~= nil),
			tostring(Q ~= nil),
			tostring(P ~= nil),
			tostring(N ~= nil),
			tostring(U ~= nil)
		)
	)

	local f = {
		["Light Dark"] = 1300,
		["LightDark"] = 1300,
		["Titan Temple"] = 1100,
		["Cherry Blossom"] = 1000,
		["Cosmic"] = 900,
		["Prehistoric"] = 800,
		["Abyss Ocean"] = 700,
		["Volcano"] = 600,
		["Snow"] = 500,
		["Jungle"] = 400,
		["Desert"] = 300,
		["Lake"] = 200,
		["Forest"] = 100,
	}
	local M = {
		"Light Dark",
		"Titan Temple",
		"Cherry Blossom",
		"Cosmic",
		"Prehistoric",
		"Abyss Ocean",
		"Volcano",
		"Snow",
		"Jungle",
		"Desert",
		"Lake",
		"Forest",
	}
	local I = {
		["Light Dark"] = 420,
		["LightDark"] = 420,
		["Titan Temple"] = 380,
		["Cherry Blossom"] = 330,
		["Cosmic"] = 280,
		["Prehistoric"] = 240,
		["Abyss Ocean"] = 200,
		["Volcano"] = 180,
		["Snow"] = 160,
		["Jungle"] = 140,
		["Desert"] = 130,
		["Lake"] = 125,
		["Forest"] = 125,
	}
	local L = -360
	local E = 525
	local b = 620
	local A = 130
	local S = CFrame.new(4773.7587890625, 70.392112731934, -315.73501586914)

	local Z = "ClaudeHub_FlightSpeed.txt"
	local z = "ClaudeHub_EggSelectConfig.json"
	local d = {
		["Light Dark"] = Color3.fromRGB(168, 85, 247),
		["Titan Temple"] = Color3.fromRGB(245, 158, 11),
		["Cherry Blossom"] = Color3.fromRGB(236, 72, 153),
		["Cosmic"] = Color3.fromRGB(6, 182, 212),
		["Prehistoric"] = Color3.fromRGB(16, 185, 129),
		["Abyss Ocean"] = Color3.fromRGB(59, 130, 246),
		["Volcano"] = Color3.fromRGB(239, 68, 68),
		["Snow"] = Color3.fromRGB(147, 197, 253),
		["Jungle"] = Color3.fromRGB(34, 197, 94),
		["Desert"] = Color3.fromRGB(234, 179, 8),
		["Lake"] = Color3.fromRGB(20, 184, 166),
		["Forest"] = Color3.fromRGB(22, 163, 74),
	}

	local X = { "Divine", "Eternal", "Secret", "Cosmic", "Mythic", "Legendary", "Epic", "Rare", "Uncommon", "Common" }
	local G = {
		["Divine"] = Color3.fromRGB(244, 63, 94),
		["Eternal"] = Color3.fromRGB(217, 70, 239),
		["Secret"] = Color3.fromRGB(249, 115, 22),
		["Cosmic"] = Color3.fromRGB(6, 182, 212),
		["Mythic"] = Color3.fromRGB(139, 92, 246),
		["Legendary"] = Color3.fromRGB(251, 191, 36),
		["Epic"] = Color3.fromRGB(168, 85, 247),
		["Rare"] = Color3.fromRGB(59, 130, 246),
		["Uncommon"] = Color3.fromRGB(34, 197, 94),
		["Common"] = Color3.fromRGB(148, 163, 184),
	}
	local F = {
		["Divine"] = 6,
		["Eternal"] = 5,
		["Secret"] = 4,
		["Cosmic"] = 3,
		["Mythic"] = 2,
		["Legendary"] = 1,
		["Epic"] = 0.5,
		["Rare"] = 0.3,
		["Uncommon"] = 0.1,
		["Common"] = 0,
	}
	
	local h
	local h
	local function loadSavedGlideSpeed(...)
		local e = 500
		pcall(function(...)
			local r = false
			if isfile then
				r = isfile(Z)
			elseif readfile then
				local e, y = pcall(readfile, Z)
				r = e and (y ~= nil)
			end
			if r and readfile then
				local r = readfile(Z)
				local u = tonumber(r)
				if u and (u >= 100 and u <= 1000) then
					e = math.floor(u)
				end
			end
		end)
		return e
	end
	local function Y(e, ...)
		pcall(function(...)
			if writefile then
				local y = math.clamp(math.floor(tonumber(e) or 600), 100, 1000)
				writefile(Z, tostring(y))
			end
		end)
	end
	local function loadConfig(...)
		local e = nil
		pcall(function(...)
			local r = false
			if isfile then
				r = isfile(z)
			elseif readfile then
				local e, y = pcall(readfile, z)
				r = e and (y ~= nil)
			end
			if r and (readfile and a) then
				local r = readfile(z)
				if r and r ~= "" then
					local u = a:JSONDecode(r)
					if type(u) == "table" then
						e = u
					end
				end
			end
		end)
		local r = {
			["Light Dark"] = true,
			["Titan Temple"] = true,
			["Cherry Blossom"] = true,
			["Cosmic"] = false,
			["Prehistoric"] = false,
			["Abyss Ocean"] = false,
			["Volcano"] = false,
			["Snow"] = false,
			["Jungle"] = false,
			["Desert"] = false,
			["Lake"] = false,
			["Forest"] = false,
		}
		local y = {
			["Divine"] = true,
			["Eternal"] = true,
			["Secret"] = true,
			["Cosmic"] = true,
			["Mythic"] = true,
			["Legendary"] = false,
			["Epic"] = false,
			["Rare"] = false,
			["Uncommon"] = false,
			["Common"] = false,
		}
		if type(e) ~= "table" then
			e = {
				["selectedZones"] = r,
				["selectedRarities"] = y,
				["alwaysCollectSecretPlus"] = true,
				["minRarityTier"] = 2,
				["autoTreadmill"] = true,
				["autoUpgradeTreadmill"] = true,
				["autoBuyTrails"] = true,
				["hideNotEnoughMoney"] = true,
				["performanceMode"] = false,
				["disable3D"] = false,
				["antiAFK"] = true,
				["language"] = "EN",
			}
		else
			if type(e.selectedZones) ~= "table" then
				e.selectedZones = r
			end
			if type(e.selectedRarities) ~= "table" then
				e.selectedRarities = y
			else
				for r, w in ipairs(X) do
					if e.selectedRarities[w] == nil then
						e.selectedRarities[w] = (y[w] == true)
					end
				end
			end
			if e.alwaysCollectSecretPlus == nil then
				e.alwaysCollectSecretPlus = true
			end
			if e.minRarityTier == nil then
				e.minRarityTier = 2
			end
			if e.autoTreadmill == nil then
				e.autoTreadmill = true
			end
			if e.autoUpgradeTreadmill == nil then
				e.autoUpgradeTreadmill = true
			end
			if e.autoBuyTrails == nil then
				e.autoBuyTrails = true
			end
			if e.hideNotEnoughMoney == nil then
				e.hideNotEnoughMoney = true
			end
			if e.performanceMode == nil then
				e.performanceMode = false
			end
			if e.disable3D == nil then
				e.disable3D = false
			end
			if e.antiAFK == nil then
				e.antiAFK = true
			end
			if e.language and (e.language == "EN" or e.language == "TH") then
				currentLang = e.language
			end
		end
		return e
	end
	local function x(...)
		pcall(function(...)
			if writefile and (a and h) then
				local r = {
					["selectedZones"] = h.selectedZones or {},
					["selectedRarities"] = h.selectedRarities or {},
					["alwaysCollectSecretPlus"] = (h.alwaysCollectSecretPlus ~= false),
					["minRarityTier"] = h.minRarityTier or 2,
					["autoTreadmill"] = (h.autoTreadmill == true),
					["autoUpgradeTreadmill"] = (h.autoUpgradeTreadmill == true),
					["autoBuyTrails"] = (h.autoBuyTrails == true),
					["hideNotEnoughMoney"] = (h.hideNotEnoughMoney == true),
					["performanceMode"] = (h.performanceMode == true),
					["disable3D"] = (h.disable3D == true),
					["antiAFK"] = (h.antiAFK == true),
					["eggESP"] = (h.eggESP == true),
					["trapESP"] = (h.trapESP == true),
					["playerESP"] = (h.playerESP == true),
					["espMaxStuds"] = h.espMaxStuds or 8000,
					["antiTrap"] = (h.antiTrap ~= false),
					["fullbright"] = (h.fullbright == true),
					["autoClaimRewards"] = (h.autoClaimRewards == true),
					["autoEquipBest"] = (h.autoEquipBest == true),
					["autoSellJunk"] = (h.autoSellJunk == true),
					["bossJoin"] = (h.bossJoin == true),
					["bossFight"] = (h.bossFight == true),
					["bossClaim"] = (h.bossClaim == true),
					["bossHazard"] = (h.bossHazard == true),
					["autoHatch"] = (h.autoHatch == true),
					["autoGlide"] = (h.autoGlide == true),
					["autoPlaceEvery5"] = (h.autoPlaceEvery5 == true),
					["humanize"] = (h.humanize == true),
					["sniper"] = (h.sniper == true),
					["snipeGrab"] = (h.snipeGrab == true),
					["snipeMaxStuds"] = (tonumber(h.snipeMaxStuds) or 2000),
					["webhookUrl"] = (type(h.webhookUrl) == "string" and h.webhookUrl or ""),
					["whSnipe"] = (h.whSnipe ~= false),
					["whSteal"] = (h.whSteal == true),
					["theme"] = (type(h.theme) == "string" and h.theme or "Dark"),
					["keybindsOn"] = (h.keybindsOn ~= false),
					["profSlot"] = (type(h.profSlot) == "string" and h.profSlot or "Slot 1"),
					["kb1Action"] = (type(h.kb1Action) == "string" and h.kb1Action or "None"),
					["kb1Key"] = (type(h.kb1Key) == "string" and h.kb1Key or "F"),
					["kb2Action"] = (type(h.kb2Action) == "string" and h.kb2Action or "None"),
					["kb2Key"] = (type(h.kb2Key) == "string" and h.kb2Key or "G"),
					["cfgAutoLoad"] = (h.cfgAutoLoad ~= false),
					["cfgAutoSave"] = (h.cfgAutoSave ~= false),
					["whBoss"] = (h.whBoss == true),
					["whHaul"] = (h.whHaul == true),
					["whUnload"] = (h.whUnload == true),
					["sellMaxRarity"] = (tonumber(h.sellMaxRarity) or 6),
					["sellKeep"] = (type(h.sellKeep) == "string" and h.sellKeep or ""),
					["stealMinIncome"] = (tonumber(h.stealMinIncome) or 0),
					["stealMuts"] = (type(h.stealMuts) == "string" and h.stealMuts or ""),
					["sellIncomeBelow"] = (tonumber(h.sellIncomeBelow) or 0),
					["sellKeepMut"] = (type(h.sellKeepMut) == "string" and h.sellKeepMut or ""),
					["whStealMinIncome"] = (tonumber(h.whStealMinIncome) or 0),
					["whStealMuts"] = (type(h.whStealMuts) == "string" and h.whStealMuts or ""),
					["whStealRarities"] = (type(h.whStealRarities) == "table" and h.whStealRarities or {}),
					["autoTreadmill"] = (h.autoTreadmill == true),
					["fastCycle"] = true,
					["panicAuto"] = (h.panicAuto == true),
					["panicNames"] = (type(h.panicNames) == "string" and h.panicNames or ""),
					["whPanic"] = (h.whPanic ~= false),
					["webhookPing"] = (type(h.webhookPing) == "string" and h.webhookPing or ""),
					["antiStaff"] = (h.antiStaff == true),
					["staffMinRank"] = (tonumber(h.staffMinRank) or 250),
					["language"] = currentLang or "EN",
				}
				local y = a:JSONEncode(r)
				writefile(z, y)
			end
		end)
	end
	local W = loadConfig()
	h = {
		["godmode"] = true,
		["autoGlide"] = true,
		["autoHatch"] = true,
		["autoPlaceEvery5"] = false,
		["batchStealCount"] = 0,
		["isBatchPlacing"] = false,
		["isHatching"] = false,
		["autoFarmLoop"] = false,
		["pureTweenFarm"] = false,
		["glidingToTarget"] = false,
		["securingEgg"] = false,
		["glideSpeed"] = loadSavedGlideSpeed(),
		["selectedZones"] = W.selectedZones,
		["selectedRarities"] = W.selectedRarities,
		["alwaysCollectSecretPlus"] = W.alwaysCollectSecretPlus,
		["minRarityTier"] = W.minRarityTier,
		["autoTreadmill"] = (W.autoTreadmill ~= false),
		["autoUpgradeTreadmill"] = (W.autoUpgradeTreadmill ~= false),
		["autoBuyTrails"] = (W.autoBuyTrails ~= false),
		["hideNotEnoughMoney"] = true,
		["performanceMode"] = (W.performanceMode == true),
		["disable3D"] = (W.disable3D == true),
		["antiAFK"] = (W.antiAFK ~= false),
		["onTreadmill"] = false,
		["lastTreadmillMount"] = 0,
		["laneZ"] = -360,
		["swapped"] = false,
		["teleporting"] = false,
		["isReturning"] = false,
		["delivering"] = false,
		["holdingEggForGuard"] = false,
		["currentTargetModel"] = nil,
		["targetPosition"] = nil,
		["stateTime"] = os.clock(),
		["statusText"] = "Ready",
		["bestEggInfo"] = "Scanning...",
		["gui"] = nil,
		["alive"] = true,
		["plot"] = nil,
		["pen"] = nil,
		["origin"] = nil,
		["tread"] = nil,
	}
	if type(W) == "table" and (W.cfgAutoLoad ~= false) then
		h.autoHatch = (W.autoHatch ~= false)
		h.autoGlide = (W.autoGlide ~= false)
		h.autoPlaceEvery5 = (W.autoPlaceEvery5 == true)
		h.eggESP = (W.eggESP == true)
		h.trapESP = (W.trapESP == true)
		h.playerESP = (W.playerESP == true)
		h.espMaxStuds = (tonumber(W.espMaxStuds) or 8000)
		h.antiTrap = (W.antiTrap ~= false)
		h.fullbright = (W.fullbright == true)
		h.autoClaimRewards = (W.autoClaimRewards == true)
		h.autoEquipBest = (W.autoEquipBest == true)
		h.autoSellJunk = (W.autoSellJunk == true)
		h.bossJoin = (W.bossJoin == true)
		h.bossFight = (W.bossFight == true)
		h.bossClaim = (W.bossClaim == true)
		h.bossHazard = (W.bossHazard == true)
		h.humanize = (W.humanize == true)
		h.sniper = (W.sniper == true)
		h.snipeGrab = (W.snipeGrab == true)
		h.snipeMaxStuds = (tonumber(W.snipeMaxStuds) or 2000)
		h.theme = (type(W.theme) == "string" and W.theme or "Dark")
		h.webhookUrl = (type(W.webhookUrl) == "string" and W.webhookUrl or "")
		h.whSnipe = (W.whSnipe ~= false)
		h.whSteal = (W.whSteal == true)
		h.keybindsOn = (W.keybindsOn ~= false)
		h.profSlot = (type(W.profSlot) == "string" and W.profSlot or "Slot 1")
		h.kb1Action = (type(W.kb1Action) == "string" and W.kb1Action or "None")
		h.kb1Key = (type(W.kb1Key) == "string" and W.kb1Key or "F")
		h.kb2Action = (type(W.kb2Action) == "string" and W.kb2Action or "None")
		h.kb2Key = (type(W.kb2Key) == "string" and W.kb2Key or "G")
		h.cfgAutoLoad = (W.cfgAutoLoad ~= false)
		h.cfgAutoSave = (W.cfgAutoSave ~= false)
		h.whBoss = (W.whBoss == true)
		h.whHaul = (W.whHaul == true)
		h.whUnload = (W.whUnload == true)
		h.sellMaxRarity = (tonumber(W.sellMaxRarity) or 6)
		h.sellKeep = (type(W.sellKeep) == "string" and W.sellKeep or "")
		h.stealMinIncome = (tonumber(W.stealMinIncome) or 0)
		h.stealMuts = (type(W.stealMuts) == "string" and W.stealMuts or "")
		h.sellIncomeBelow = (tonumber(W.sellIncomeBelow) or 0)
		h.sellKeepMut = (type(W.sellKeepMut) == "string" and W.sellKeepMut or "")
		h.whStealMinIncome = (tonumber(W.whStealMinIncome) or 0)
		h.whStealMuts = (type(W.whStealMuts) == "string" and W.whStealMuts or "")
		h.whStealRarities = (type(W.whStealRarities) == "table" and W.whStealRarities or {})
		h.fastCycle = true
		h.autoRegrab = true
		h.fastStealSpeedBoost = true
		h.panicAuto = (W.panicAuto == true)
		h.panicNames = (type(W.panicNames) == "string" and W.panicNames or "")
		h.whPanic = (W.whPanic ~= false)
		h.webhookPing = (type(W.webhookPing) == "string" and W.webhookPing or "")
		h.antiStaff = (W.antiStaff == true)
		h.staffMinRank = (tonumber(W.staffMinRank) or 250)
	end
	h.fastCycle = true
	h.autoRegrab = true
	h.glideSpeed = math.max(h.glideSpeed or 600, 650)
	h.statsStart = os.clock()
	h.statsSteals = 0
	h._stealFails = 0
	h._regrabFails = 0
	h.statsSnipes = 0
	h.statsSold = 0
	h.statsClaims = 0
	h.statsRarity = {}
	h.statsSoldRarity = {}
	h.logLines = {}
	
	h._adsEnabled = true
	task.spawn(function()
		while h.alive do
			task.wait(300)
			if h._adsEnabled and h.alive then
				pcall(function()
					if Window and Window.Notify then
						
						pcall(function()
							local uiLib = CloutWindLib or Window
							if uiLib and uiLib.Notify then
								uiLib:Notify({Title="ClaudeHub - Discord", Content="discord.gg/cyDpbvxeGN - Bug? report on Discord", Duration=4, Icon="info"})
							end
						end)
					end
					
					pcall(function()
						game:GetService("StarterGui"):SetCore("SendNotification", {Title="ClaudeHub | SAE | KEYLESS", Text="discord.gg/cyDpbvxeGN", Duration=3})
					end)
				end)
				
			
			end
		end
	end)
	
	h.currentTargetUid = nil
	task.spawn(function()
		while h.alive do
			task.wait(0.10)
			pcall(function()
				if not h.autoRegrab then return end
				if w4() then return end
				if not h4 then return end
				local char = o.Character
				local hrp = char and char:FindFirstChild("HumanoidRootPart")
				if not hrp then return end
				local recs = h4(false)
				if not recs or #recs==0 then return end
				local best, bestD = nil, 26
				for _, rec in ipairs(recs) do
					local isDropped = (rec.State=="Dropped" or rec.State==1 or rec.State=="Slot")
					if isDropped and rec.BoundsCFrame then
						local d = (hrp.Position - rec.BoundsCFrame.Position).Magnitude
						if d < bestD then
							
							local prefer = true
							if h.currentTargetUid and rec.Uid ~= h.currentTargetUid and d > 14 then
								prefer = false
							end
							if prefer then
								best = rec
								bestD = d
							end
						end
					end
				end
				if best then
					h.statusText = "[AutoRegrab] Egg dropped! Re-grabbing... ("..tostring(best.Uid):sub(1,6)..") dist "..math.floor(bestD)
					local model = best.PhysicalModel
					if not model and r:FindFirstChild("AreaEggSlotsClient") then
						for _, m in ipairs(r.AreaEggSlotsClient:GetChildren()) do
							local mp = m:FindFirstChildWhichIsA("BasePart") or m.PrimaryPart
							if mp and (mp.Position - best.BoundsCFrame.Position).Magnitude < 14 then
								model = m
								break
							end
						end
					end
					for attempt=1,4 do
						d4(model, best.BoundsCFrame.Position)
						if i and best.Uid then
							pcall(function()
								if i:IsA("RemoteFunction") then
									i:InvokeServer({Uid=best.Uid})
									i:InvokeServer(best.Uid)
								else
									i:FireServer({Uid=best.Uid})
									i:FireServer(best.Uid)
								end
							end)
						end
						task.wait(0.035)
						if w4(best.Uid) or j4(best.Uid) then
							h.statusText = "[AutoRegrab] [OK] Re-grabbed! ("..tostring(best.Uid):sub(1,6)..")"
							if best.Uid == h.currentTargetUid then h.currentTargetUid=nil end
							break
						end
					end
				end
			end)
		end
	end)
	

	h.execName = "Unknown"
	pcall(function(...)
		local e = (identifyexecutor and identifyexecutor()) or (getexecutorname and getexecutorname())
		if type(e) == "string" and e ~= "" then
			h.execName = e
		end
	end)
	local m
	local e4
	local r4
	local y4
	local u4
	local w4
	local j4
	local k4
	local a4
	local o4
	local V4
	local H4
	local t4
	local s4
	local p4
	local B4
	local J4
	local K4
	local c4
	local v4
	local i4
	local R4
	local g4
	local Q4
	local P4
	local N4
	local U4
	local l4
	local D4
	local C4
	local q4
	local n4
	local f4
	local M4
	local I4
	local L4
	local E4
	local b4, A4, S4, Z4, z4, d4
	local X4 = {}
	local G4 = 0
	local F4 = nil
	local h4
	local O4 = 0
	local Y4 = "NONE"
	local T4
	local x4 = nil
	local W4 = nil
	local godToggleSetter = nil
	pcall(function(...)
		local e = game:GetService("Lighting");
		(e:GetPropertyChangedSignal("ClockTime")):Connect(function(...)
			X4 = {}
			G4 = 0
		end)
	end)
	pcall(function(...)
		local function e(e, ...)
			if e:IsA("RemoteEvent") then
				local y = string.lower(e.Name)
				if
					string.find(y, "reset")
					or string.find(y, "night")
					or string.find(y, "spawn")
					or string.find(y, "countdown")
				then
					pcall(function(...)
						e.OnClientEvent:Connect(function(...)
							X4 = {}
							G4 = 0
						end)
					end)
				end
			end
		end
		for y, u in ipairs(j:GetDescendants()) do
			e(u)
		end
		j.DescendantAdded:Connect(e)
	end)
	m = function(e, ...)
		if not e or not e:IsA("Tool") then
			return false
		end
		local r = string.lower(e.Name)
		if
			string.find(r, "sword")
			or string.find(r, "radar")
			or string.find(r, "basket")
			or string.find(r, "punch")
		then
			return false
		end
		if
			e:GetAttribute("EggUid")
			or e:GetAttribute("UID")
			or string.find(r, "egg")
			or e:GetAttribute("Category")
			or e:GetAttribute("ItemType") == "Egg"
		then
			return true
		end
		return false
	end
	e4 = function(...)
		local e = o.Character
		if e then
			for e, y in ipairs(e:GetChildren()) do
				if m(y) then
					local e = y:GetAttribute("UID") or y:GetAttribute("EggUid")
					return y, e or y.Name
				end
			end
		end
		return nil, nil
	end
	r4 = function(...)
		local e = o:FindFirstChild("Backpack")
		if e then
			for e, y in ipairs(e:GetChildren()) do
				if m(y) then
					local e = y:GetAttribute("UID") or y:GetAttribute("EggUid")
					return y, e or y.Name
				end
			end
		end
		return nil, nil
	end
	y4 = function(...)
		local e = 0
		local r = o:FindFirstChild("Backpack")
		if r then
			for r, y in ipairs(r:GetChildren()) do
				if m(y) then
					e = e + 1
				end
			end
		end
		local y = o.Character
		if y then
			for r, y in ipairs(y:GetChildren()) do
				if m(y) then
					e = e + 1
				end
			end
		end
		return e
	end
	u4 = function(e, ...)
		if not e and not (h.pureTweenFarm or h.autoFarmLoop or h.teleporting) then
			return
		end
		local r = o.Character
		local y = r and r:FindFirstChildOfClass("Humanoid")
		local u = o:FindFirstChild("Backpack")
		if y then
			pcall(function(...)
				y:UnequipTools()
			end)
		end
		if r and u then
			for e, r in ipairs(r:GetChildren()) do
				if r:IsA("Tool") then
					pcall(function(...)
						r.Parent = u
					end)
				end
			end
		end
	end
	w4 = function(e, ...)
		if (h.pureTweenFarm or h.autoFarmLoop) and not h.holdingEggForGuard then
			local e = e4()
			if e then
				pcall(u4)
			end
			return false
		end
		local r, y = e4()
		if r then
			if e then
				if y == e or not y then
					return true
				end
			else
				return true
			end
		end
		local u = o.Character
		local w = u and u:FindFirstChild("HumanoidRootPart")
		if w and w.Position.X <= (E + 15) then
			return false
		end
		if s and s.ReadFieldEggs then
			local r, y = pcall(s.ReadFieldEggs)
			if r and (y and y.Records) then
				for r, y in ipairs(y.Records) do
					if
						(y.State == "Carried" or y.State == 2) and (
							y.CarrierUserId == o.UserId or y.Carrier == o.UserId
						)
					then
						if e then
							if y.Uid == e then
								return true
							end
						else
							return true
						end
					end
				end
			end
		end
		return false
	end
	j4 = function(e, ...)
		local r, y = e4()
		if r then
			if not e or y == e or not y then
				return true
			end
		end
		local u = o:FindFirstChild("Backpack")
		if u then
			for r, y in ipairs(u:GetChildren()) do
				if m(y) then
					local r = y:GetAttribute("UID") or y:GetAttribute("EggUid")
					if not e or r == e or y.Name == tostring(e) then
						return true
					end
				end
			end
		end
		if e and (s and s.ReadFieldEggs) then
			local r, y = pcall(s.ReadFieldEggs)
			if r and (y and y.Records) then
				for r, y in ipairs(y.Records) do
					if y.Uid == e then
						if y.State == "Carried" or y.State == 2 then
							local e = y.CarrierUserId or y.Carrier
							if e == o.UserId then
								return true
							end
						end
					end
				end
			end
		end
		return false
	end
	local m4 = false
	local function ek(...)
		if m4 then
			return
		end
		local e = R
			or j:FindFirstChild("RF/EggWorld/AskFieldEggSnapshot", true)
			or j:FindFirstChild("AskFieldEggSnapshot", true)
			or j:FindFirstChild("Eggs: RequestAreaEggSnapshot", true)
		if not e or not e:IsA("RemoteFunction") then
			return
		end
		m4 = true
		task.spawn(function(...)
			local r, y = pcall(function(...)
				ret
