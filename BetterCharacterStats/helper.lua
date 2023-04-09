BCS = BCS or {}

local BCS_Tooltip = getglobal("BetterCharacterStatsTooltip") or CreateFrame("GameTooltip", "BetterCharacterStatsTooltip", nil, "GameTooltipTemplate")
local BCS_Prefix = "BetterCharacterStatsTooltip"
BCS_Tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

local L = BCS["L"]

local strfind = strfind
local tonumber = tonumber

local Cache_GetHitRating_Tab, Cache_GetHitRating_Talent
function BCS:GetHitRating()
	local hit = tonumber(BonusScanner:GetBonus("TOHIT")) or 0;
	local MAX_INVENTORY_SLOTS = 19;

	local MAX_TABS = GetNumTalentTabs()
	
	-- speedup
	if Cache_GetHitRating_Tab and Cache_GetHitRating_Talent then
		BCS_Tooltip:SetTalent(Cache_GetHitRating_Tab, Cache_GetHitRating_Talent)
		local MAX_LINES = BCS_Tooltip:NumLines()
		
		for line=1, MAX_LINES do
			local left = getglobal(BCS_Prefix .. "TextLeft" .. line)
			if left:GetText() then
				local _,_, value = strfind(left:GetText(), L["Increases your chance to hit with melee weapons by (%d)%%."])
				local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(Cache_GetHitRating_Tab, Cache_GetHitRating_Talent)
				if value and rank > 0 then
					hit = hit + tonumber(value)
					line = MAX_LINES
				end
			end
		end
		
		return hit
	end
	
	for tab=1, MAX_TABS do
		local MAX_TALENTS = GetNumTalents(tab)
		
		for talent=1, MAX_TALENTS do
			BCS_Tooltip:SetTalent(tab, talent);
			local MAX_LINES = BCS_Tooltip:NumLines()
			
			for line=1, MAX_LINES do
				local left = getglobal(BCS_Prefix .. "TextLeft" .. line)
				if left:GetText() then
					local _,_, value = strfind(left:GetText(), L["Increases your chance to hit with melee weapons by (%d)%%."])
					local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(tab, talent)
					if value and rank > 0 then
						hit = hit + tonumber(value)
						
						Cache_GetHitRating_Tab = tab
						Cache_GetHitRating_Talent = talent
						
						line = MAX_LINES
						talent = MAX_TALENTS
						tab = MAX_TABS
					end
				end	
			end
			
		end
	end
	
	return hit
end

function BCS:GetSpellHitRating()
	return tonumber(BonusScanner:GetBonus("SPELLCRIT")) or 0
end

local Cache_GetCritChance_SpellID, Cache_GetCritChance_BookType, Cache_GetCritChance_Line
function BCS:GetCritChance()
	local crit = 0
	
	-- speedup
	if Cache_GetCritChance_SpellID and Cache_GetCritChance_BookType and Cache_GetCritChance_Line then
	
		BCS_Tooltip:SetSpell(Cache_GetCritChance_SpellID, Cache_GetCritChance_BookType)
		local left = getglobal(BCS_Prefix .. "TextLeft" .. Cache_GetCritChance_Line)
		if left:GetText() then
			local _,_, value = strfind(left:GetText(), L["([%d.]+)%% chance to crit"])
			if value then
				crit = crit + tonumber(value)
			end
		end
		
		return crit
	end
	
	local MAX_TABS = GetNumSpellTabs()
	
	for tab=1, MAX_TABS do
		local name, texture, offset, numSpells = GetSpellTabInfo(tab)
		
		for spell=1, numSpells do
			local currentPage = ceil(spell/SPELLS_PER_PAGE)
			local SpellID = spell + offset + ( SPELLS_PER_PAGE * (currentPage - 1))

			BCS_Tooltip:SetSpell(SpellID, BOOKTYPE_SPELL)
			local MAX_LINES = BCS_Tooltip:NumLines()
			
			for line=1, MAX_LINES do
				local left = getglobal(BCS_Prefix .. "TextLeft" .. line)
				if left:GetText() then
					local _,_, value = strfind(left:GetText(), L["([%d.]+)%% chance to crit"])
					if value then
						crit = crit + tonumber(value)
						
						Cache_GetCritChance_SpellID = SpellID
						Cache_GetCritChance_BookType = BOOKTYPE_SPELL
						Cache_GetCritChance_Line = line
						
						line = MAX_LINES
						spell = numSpells
						tab = MAX_TABS
					end
				end
			end
			
		end
	end
	
	return crit
end

local Cache_GetRangedCritChance_Tab, Cache_GetRangedCritChance_Talent, Cache_GetRangedCritChance_Line
function BCS:GetRangedCritChance()
	local crit = BCS:GetCritChance()
	
	if Cache_GetRangedCritChance_Tab and Cache_GetRangedCritChance_Talent and Cache_GetRangedCritChance_Line then
		BCS_Tooltip:SetTalent(Cache_GetRangedCritChance_Tab, Cache_GetRangedCritChance_Talent)
		local left = getglobal(BCS_Prefix .. "TextLeft" .. Cache_GetRangedCritChance_Line)
		
		if left:GetText() then
			local _,_, value = strfind(left:GetText(), L["Increases your critical strike chance with ranged weapons by (%d)%%."])
			local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(Cache_GetRangedCritChance_Tab, Cache_GetRangedCritChance_Talent)
			if value and rank > 0 then
				crit = crit + tonumber(value)
			end
		end
	
		return crit
	end
	
	local MAX_TABS = GetNumTalentTabs()
	
	for tab=1, MAX_TABS do
		local MAX_TALENTS = GetNumTalents(tab)
		
		for talent=1, MAX_TALENTS do
			BCS_Tooltip:SetTalent(tab, talent);
			local MAX_LINES = BCS_Tooltip:NumLines()
			
			for line=1, MAX_LINES do
				local left = getglobal(BCS_Prefix .. "TextLeft" .. line)
				if left:GetText() then
					local _,_, value = strfind(left:GetText(), L["Increases your critical strike chance with ranged weapons by (%d)%%."])
					local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(tab, talent)
					if value and rank > 0 then
						crit = crit + tonumber(value)
						
						line = MAX_LINES
						talent = MAX_TALENTS
						tab = MAX_TABS
					end
				end
			end
			
		end
	end
	
	return crit
end

function BCS:GetSpellCritChance()
	return tonumber(BonusScanner:GetBonus("MANAREG")) or 0
end

--[[
-- server\src\game\Object\Player.cpp
float Player::OCTRegenMPPerSpirit()
{
    float addvalue = 0.0;

    float Spirit = GetStat(STAT_SPIRIT);
    uint8 Class = getClass();

    switch (Class)
    {
        case CLASS_DRUID:   addvalue = (Spirit / 5 + 15);   break;
        case CLASS_HUNTER:  addvalue = (Spirit / 5 + 15);   break;
        case CLASS_MAGE:    addvalue = (Spirit / 4 + 12.5); break;
        case CLASS_PALADIN: addvalue = (Spirit / 5 + 15);   break;
        case CLASS_PRIEST:  addvalue = (Spirit / 4 + 12.5); break;
        case CLASS_SHAMAN:  addvalue = (Spirit / 5 + 17);   break;
        case CLASS_WARLOCK: addvalue = (Spirit / 5 + 15);   break;
    }

    addvalue /= 2.0f;   // the above addvalue are given per tick which occurs every 2 seconds, hence this divide by 2

    return addvalue;
}

void Player::UpdateManaRegen()
{
    // Mana regen from spirit
    float power_regen = OCTRegenMPPerSpirit();
    // Apply PCT bonus from SPELL_AURA_MOD_POWER_REGEN_PERCENT aura on spirit base regen
    power_regen *= GetTotalAuraMultiplierByMiscValue(SPELL_AURA_MOD_POWER_REGEN_PERCENT, POWER_MANA);

    // Mana regen from SPELL_AURA_MOD_POWER_REGEN aura
    float power_regen_mp5 = GetTotalAuraModifierByMiscValue(SPELL_AURA_MOD_POWER_REGEN, POWER_MANA) / 5.0f;

    // Set regen rate in cast state apply only on spirit based regen
    int32 modManaRegenInterrupt = GetTotalAuraModifier(SPELL_AURA_MOD_MANA_REGEN_INTERRUPT);
    if (modManaRegenInterrupt > 100)
        { modManaRegenInterrupt = 100; }

    m_modManaRegenInterrupt = power_regen_mp5 + power_regen * modManaRegenInterrupt / 100.0f;

    m_modManaRegen = power_regen_mp5 + power_regen;
}
]]

local function GetRegenMPPerSpirit()
	return BonusScanner:GetBonus("MANAREG")
end

function BCS:GetManaRegen()
	-- to-maybe-do: apply buffs/talents
	local base, casting
	local power_regen = GetRegenMPPerSpirit()
	
	casting = power_regen / 100
	base = power_regen
	
	return base, casting
end