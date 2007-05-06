﻿------------------------------
--      Are you local?    --
------------------------------

local BB = AceLibrary("Babble-Boss-2.2")

local boss = BB["High King Maulgar"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local mage = BB["Krosh Firehand"]
local lock = BB["Olm the Summoner"]
local priest = BB["Blindeye the Seer"]
local shaman = BB["Kiggler the Crazed"]

BB = nil
local started
local flurryannounced

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Maulgar",

	heal = "Heal",
	heal_desc = "Warn when Blindeye the Seer begins to cast a Heal",

	shield = "Shield",
	shield_desc = "Warn when Blindeye the Seer gains Greater Power Word: Shield",

	spellshield = "Spell Shield",
	spellshield_desc = "Warn when Krosh Firehand gains Spell Shield",

	summon = "Summon Wild Felhunter",
	summon_desc = "Warn when Olm the Summoner begins to cast Summon Wild Felhunter",

	whirlwind = "Whirlwind",
	whirlwind_desc = "Warn when Maulgar gains Whirlwind",

	flurry = "Flurry",
	flurry_desc = "Warn when Maulgar is close to Flurry and gains Flurry",

	smash = "Arcing Smash",
	smash_desc = "Show a bar for estimated Arcing Smash",

	heal_trigger = "Blindeye the Seer begins to cast Prayer of Healing",
	heal_message = "Blindeye casting Prayer of Healing!",
	heal_bar = "Healing",

	shield_trigger = "gains Greater Power Word: Shield",
	shield_message = "Shield on Blindeye!",

	spellshield_trigger = "gains Spell Shield.",
	spellshield_message = "Spell Shield on Krosh!",

	summon_trigger = "begins to cast Summon Wild Felhunter.",
	summon_message = "Felhunter being summoned!",
	summon_bar = "~Felhunter Cooldown",

	flurry_trigger = "You will not defeat the hand of Gruul!",
	flurry_message = "50% - Flurry!",
	flurry_warning = "Flurry Soon!",

	whirlwind_trigger = "gains Whirlwind",
	whirlwind_message = "Maulgar - Whirlwind for 15sec!",
	whirlwind_bar = "Whirlwind",
	whirlwind_nextbar = "~Whirlwind Cooldown",
	whirlwind_warning1 = "Maulgar Engaged - Whirlwind in ~50sec!",
	whirlwind_warning2 = "Whirlwind Soon!",

	smash_bar = "~Arcing Smash",
} end)

L:RegisterTranslations("frFR", function() return {
	heal = "Soin",
	heal_desc = "Pr\195\169viens quand Oeillaveugle le Voyant commence \195\160 lancer un soin.",

	shield = "Bouclier",
	shield_desc = "Pr\195\169viens quand Oeillaveugle le Voyant gagne Mot de pouvoir : Bouclier.",

	spellshield = "Bouclier anti-sort",
	spellshield_desc = "Pr\195\169viens quand Krosh Brasemain gagne Bouclier anti-sort.",

	summon = "Chasseur corrompu sauvage",
	summon_desc = "Pr\195\169viens quand Olm l'Invocateur commence \195\160 lancer Invocation d'un chasseur corrompu sauvage.",

	whirlwind = "Tourbillon",
	whirlwind_desc = "Pr\195\169viens quand Maulgar gagne Tourbillon.",

	flurry = "Rafale",
	flurry_desc = "Pr\195\169viens quand Maulgar est proche de Rafale et quand il gagne Rafale.",

	smash = "Frappe en arc",
	smash_desc = "Affiche une barre pour Frappe en arc.",

	heal_trigger = "Oeillaveugle le Voyant commence \195\160 lancer Pri\195\168re de soins",
	heal_message = "Oeillaveugle incante Pri\195\168re de soins !",
	heal_bar = "Soin",

	shield_trigger = "gagne Mot de pouvoir sup\195\169rieur\194\160: Bouclier",
	shield_message = "Bouclier sur Oeillaveugle !",

	spellshield_trigger = "gagne Bouclier anti-sort",
	spellshield_message = "Bouclier anti-sort sur Krosh !",

	summon_trigger = "commence \195\160 lancer Invocation d'un chasseur corrompu sauvage.",
	summon_message = "Chasseur corrompu en cours d'invocation !",
	summon_bar = "~Cooldown Chasseur corrompu",

	flurry_trigger = "Vous ne terrasserez pas la main de Gruul\194\160!",
	flurry_message = "50% - Rafale !",
	flurry_warning = "Rafale imminente !",

	whirlwind_trigger = "gagne Tourbillon",
	whirlwind_message = "Maulgar - Toubillon pendant 15 sec. !",
	whirlwind_bar = "Tourbillon",
	whirlwind_nextbar = "~Cooldown Tourbillon",
	whirlwind_warning1 = "Maulgar engag\195\169 - Tourbillon dans ~50 sec. !",
	whirlwind_warning2 = "Tourbillon imminent !",

	smash_bar = "~Frappe en arc",
} end)

L:RegisterTranslations("deDE", function() return {
	heal = "Heilung",
	heal_desc = "Warnt wenn Blindauge der Seher beginnt Heilung zu wirken",

	shield = "Schild",
	shield_desc = "Warnung wenn Blindauge der Seher Machtwort: Schild bekommt",

	spellshield = "Zauberschild",
	spellshield_desc = "Warnung wenn Krosh Feuerhand sein Zauberschild bekommt",

	summon = "Wilder Teufelsj\195\164ger",
	summon_desc = "Warnt wenn Olm der Beschw\195\182rer beginnt Wilden Teufelsj\195\164ger beschw\195\182ren zu wirken",

	whirlwind = "Wirbelwind",
	whirlwind_desc = "Warnung wenn Raufgar Wirbelwind bekommt",

	flurry = "Schlaghagel",
	flurry_desc = "Warnt wenn Raufgar kurz vor dem Schlaghagel steht und wenn er es bekommt",

	smash = "Bogenzerkracher",
	smash_desc = "Zeigt eine Bar f\195\188r den gesch\195\164tzten Bogenzerkracher",  

	heal_trigger = "Blindauge der Seher beginnt Gebet der Heilung",
	heal_message = "Blindauge der Seher wirkt Gebet der Heilung!",
	heal_bar = "Heilung",

	shield_trigger = "bekommt 'Gro\195\159es Machtwort: Schild'.",
	shield_message = "Schild auf Blindauge!",

	spellshield_trigger = "bekommt 'Zauberschild'.",
	spellshield_message = "Zauberschild auf Krosh!",

	summon_trigger = "beginnt Wilden Teufelsj\195\164ger beschw\195\182ren zu wirken",
	summon_message = "Teufelsj\195\164ger wurde beschworen!",

	flurry_trigger = "Ihr werdet die Hand von Gruul nicht besiegen!",
	flurry_message = "50% - Schlaghagel!",
	flurry_warning = "Schlaghagel bald!",

	whirlwind_trigger = "bekommt Wirbelwind",
	whirlwind_message = "Raufgar - Wirbelwind f\195\188r 15sek!",
	whirlwind_bar = "Wirbelwind",
	whirlwind_nextbar = "~N\195\164chster Wirbelwind",
	whirlwind_warning1 = "Raufgar angegriffen - Wirbelwind in ~50sek!",
	whirlwind_warning2 = "Wirbelwind bald!",

	smash_bar = "~Bogenzerkracher",
} end)

L:RegisterTranslations("koKR", function() return {
	heal = "치유",
	heal_desc = "블라인드아이가 치유 시전 시 경고",

	shield = "보호막",
	shield_desc = "블라인드아이가 상급 신의 권능: 보호막 효과를 얻었을 때 알림",

	spellshield = "주문 보호막",
	spellshield_desc = "크로쉬가 주문 보호막 효과를 얻었을 때 알림",

	summon = "사나운 지옥사냥개 소환",
	summon_desc = "울름이 지옥사냥개 소환 시전 시 경고",

	whirlwind = "소용돌이",
	whirlwind_desc = "마울가르가 소용돌이 효과를 얻었을 때 알림",

	flurry = "질풍",
	flurry_desc = "마울가르의 질풍 효과 근접 및 획득 시 경고",

	heal_trigger = "현자 블라인드아이|1이;가; 치유 시전을 시작합니다.",
	heal_message = "블라인드아이 치유 시전!",
	heal_bar = "치유",

	shield_trigger = "상급 신의 권능: 보호막 효과를 얻었습니다.", -- check
	shield_message = "블라인드아이 보호막!",

	spellshield_trigger = "크로쉬 파이어핸드|1이;가; 주문 보호막 효과를 얻었습니다.",
	spellshield_message = "크로쉬 주문 보호막!",

	summon_trigger = "소환사 올름|1이;가; 사나운 지옥사냥개 소환 시전을 시작합니다.",
	summon_message = "지옥사냥개 소환!",
	summon_bar = "~지옥사냥개 대기시간",

	flurry_trigger = "그룰님의 손아귀에서 벗어나지 못할 것이다!",
	flurry_message = "50% - 질풍!",
	flurry_warning = "잠시 후 질풍!",

	whirlwind_trigger = "왕중왕 마울가르|1이;가; 소용돌이 효과를 얻었습니다.",
	whirlwind_message = "마울가르 - 15초간 소용돌이!",
	whirlwind_bar = "소용돌이",
	whirlwind_nextbar = "~소용돌이 대기시간",
	whirlwind_warning1 = "마울가르 전투 개시 - 약 50초 후 소용돌이!",
	whirlwind_warning2 = "잠시 후 소용돌이!",
} end)

----------------------------------
--   Module Declaration    --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = AceLibrary("Babble-Zone-2.2")["Gruul's Lair"]
mod.otherMenu = "Outland"
mod.enabletrigger = {boss, mage, lock, priest, shaman}
mod.wipemobs = {mage, lock, priest, shaman}
mod.toggleoptions = {"shield", "spellshield", "heal", -1, "summon", -1, "whirlwind", "flurry", "smash", "bosskill"}
mod.revision = tonumber(("$Revision$"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	started = nil
	flurryannounced = nil

	self:RegisterEvent("UNIT_HEALTH")

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")

	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "BlindeyePrayer", 4)
	self:TriggerEvent("BigWigs_ThrottleSync", "BlindeyeShield", 4)
	self:TriggerEvent("BigWigs_ThrottleSync", "KroshSpellShield", 4)
	self:TriggerEvent("BigWigs_ThrottleSync", "MaulgarWhirldwind", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "OlmSummon", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MaulgarSmash", 3)
end

------------------------------
--    Event Handlers     --
------------------------------

function mod:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if msg:find(L["heal_trigger"]) then
		self:Sync("BlindeyePrayer")
	elseif msg:find(L["summon_trigger"]) then
		self:Sync("OlmSummon")
	end
end

function mod:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg:find(L["shield_trigger"]) then
		self:Sync("BlindeyeShield")
	elseif msg:find(L["spellshield_trigger"]) then
		self:Sync("KroshSpellShield")
	elseif msg:find(L["whirlwind_trigger"]) then
		self:Sync("MaulgarWhirldwind")
	end
end

function mod:Event(msg)
	if msg:find(L["smash"]) then
		self:Sync("MaulgarSmash")
	end
end

function mod:BigWigs_RecvSync(sync, rest, nick)
	if self:ValidateEngageSync(sync, rest) and not started then
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
		if self.db.profile.whirlwind then
			self:Message(L["whirlwind_warning1"], "Attention")
			self:Nextwhirldwind()
		end
	elseif sync == "BlindeyePrayer" and self.db.profile.heal then
		self:Message(L["heal_message"], "Important", nil, "Alarm")
	elseif sync == "BlindeyeShield" and self.db.profile.shield then
		self:Message(L["shield_message"], "Important")
	elseif sync == "KroshSpellShield" and self.db.profile.spellshield then
		self:Message(L["spellshield_message"], "Attention", nil, "Info")
	elseif sync == "OlmSummon" and self.db.profile.summon then
		self:Message(L["summon_message"], "Attention", nil, "Long")
		self:Bar(L["summon_bar"], 50, "Spell_Shadow_SummonFelGuard")
	elseif sync == "MaulgarWhirldwind" and self.db.profile.whirlwind then
		self:Message(L["whirlwind_message"], "Important")
		self:Bar(L["whirlwind_bar"], 15, "Ability_Whirlwind")
		self:Nextwhirldwind()
	elseif sync == "MaulgarSmash" and self.db.profile.smash then
		self:Bar(L["smash_bar"], 10, "Ability_Warrior_Cleave")
	end
end

function mod:Nextwhirldwind()
	self:DelayedMessage(45, L["whirlwind_warning2"], "Urgent")
	self:Bar(L["whirlwind_nextbar"], 50, "Ability_Whirlwind")
end

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if self.db.profile.flurry and msg:find(L["flurry_trigger"]) then
		self:Message(L["flurry_message"], "Important")
	end
end

function mod:UNIT_HEALTH(msg)
	if not self.db.profile.flurry then return end
	if UnitName(msg) == boss then
		local health = UnitHealth(msg)
		if health > 52 and health <= 56 and not flurryannounced then
			self:Message(L["flurry_warning"], "Positive")
			flurryannounced = true
		elseif health > 62 and flurryannounced then
			flurryannounced = false
		end
	end
end
