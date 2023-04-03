-- bonus names
BONUSSCANNER_NAMES = {	
	STR 		= "Strength",
	AGI 		= "Agility",
	STA 		= "Stamina",
	INT 		= "Intellect",
	SPI 		= "Spirit",
	ARMOR 		= "Reinforced Armor",

	ARCANERES 	= "Arcane Resistance",	
	FIRERES 	= "Fire Resistance",
	NATURERES 	= "Nature Resistance",
	FROSTRES 	= "Frost Resistance",
	SHADOWRES 	= "Shadow Resistance",

	FISHING 	= "Fishing",
	MINING 		= "Mining",
	HERBALISM 	= "Herbalism",
	SKINNING 	= "Skinning",
	DEFENSE 	= "Defense",
	
	BLOCK 		= "Chance to Block",
	BLOCKVALUE  = "Block value",
	DODGE 		= "Dodge",
	PARRY 		= "Parry",
	ATTACKPOWER = "Attack Power",
	ATTACKPOWERUNDEAD = "Attack Power against Undead",
	ATTACKPOWERFERAL = "Attack Power in feral form",
	CRIT 		= "Crit. hits",
	RANGEDATTACKPOWER = "Ranged Attack Power",
	RANGEDCRIT 	= "Crit. Shots",
	TOHIT 		= "Chance to Hit",

	DMG 		= "Spell Damage",
	DMGUNDEAD	= "Spell Damage against Undead",
	ARCANEDMG 	= "Arcane Damage",
	FIREDMG 	= "Fire Damage",
	FROSTDMG 	= "Frost Damage",
	HOLYDMG 	= "Holy Damage",
	NATUREDMG 	= "Nature Damage",
	SHADOWDMG 	= "Shadow Damage",
	SPELLCRIT 	= "Crit. Spell",
	SPELLTOHIT 	= "Chance to Hit with spells",
	SPELLPEN 	= "Spell Penetration",
	HEAL 		= "Healing",
	HOLYCRIT 	= "Crit. Holy Spell",

	HEALTHREG 	= "Life Regeneration",
	MANAREG 	= "Mana Regeneration",
	HEALTH 		= "Life Points",
	MANA 		= "Mana Points"
};

-- equip and set bonus prefixes:
BONUSSCANNER_PREFIX_EQUIP = "Если на персонаже: ";
BONUSSCANNER_PREFIX_SET = "Комплект: ";

-- passive bonus patterns. checked against lines which start with above prefixes
BONUSSCANNER_PATTERNS_PASSIVE = {
	{ pattern = "+(%d+) ranged Attack Power%.", effect = "RANGEDATTACKPOWER" },
	{ pattern = "Increases your chance to block attacks with a shield by (%d+)%%%.", effect = "BLOCK" },
	{ pattern = "Increases the block value of your shield by (%d+)%.", effect = "BLOCKVALUE" },
	{ pattern = "Increases your chance to dodge an attack by (%d+)%%%.", effect = "DODGE" },
	{ pattern = "Increases your chance to parry an attack by (%d+)%%%.", effect = "PARRY" },
	{ pattern = "Improves your chance to get a critical strike with spells by (%d+)%%%.", effect = "SPELLCRIT" },
	{ pattern = "Improves your chance to get a critical strike with Holy spells by (%d+)%%%.", effect = "HOLYCRIT" },
	{ pattern = "Increases the critical effect chance of your Holy spells by (%d+)%%%.", effect = "HOLYCRIT" },
	{ pattern = "Improves your chance to get a critical strike by (%d+)%%%.", effect = "CRIT" },
	{ pattern = "Improves your chance to get a critical strike with missile weapons by (%d+)%%%.", effect = "RANGEDCRIT" },
	{ pattern = "Increases damage done by Arcane spells and effects by up to (%d+)%.", effect = "ARCANEDMG" },
	{ pattern = "Increases damage done by Fire spells and effects by up to (%d+)%.", effect = "FIREDMG" },
	{ pattern = "Increases damage done by Frost spells and effects by up to (%d+)%.", effect = "FROSTDMG" },
	{ pattern = "Increases damage done by Holy spells and effects by up to (%d+)%.", effect = "HOLYDMG" },
	{ pattern = "Increases damage done by Nature spells and effects by up to (%d+)%.", effect = "NATUREDMG" },
	{ pattern = "Increases damage done by Shadow spells and effects by up to (%d+)%.", effect = "SHADOWDMG" },
	{ pattern = "Increases healing done by spells and effects by up to (%d+)%.", effect = "HEAL" },
	{ pattern = "Increases damage and healing done by magical spells and effects by up to (%d+)%.", effect = {"HEAL", "DMG"} },
	{ pattern = "Increases damage done to Undead by magical spells and effects by up to (%d+)", effect = "DMGUNDEAD" },
	{ pattern = "+(%d+) Attack Power when fighting Undead.", effect = "ATTACKPOWERUNDEAD" },
	{ pattern = "Restores (%d+) health per 5 sec%.", effect = "HEALTHREG" }, 
	{ pattern = "Restores (%d+) health every 5 sec%.", effect = "HEALTHREG" },  -- both versions ('per' and 'every') seem to be used
	{ pattern = "Restores (%d+) mana per 5 sec%.", effect = "MANAREG" },
	{ pattern = "Restores (%d+) mana every 5 sec%.", effect = "MANAREG" },
	{ pattern = "Improves your chance to hit by (%d+)%%%.", effect = "TOHIT" },
	{ pattern = "Improves your chance to hit with spells by (%d+)%%%.", effect = "SPELLTOHIT" },
	{ pattern = "Decreases the magical resistances of your spell targets by (%d+).", effect = "SPELLPEN" }
};

-- generic patterns have the form "+xx bonus" or "bonus +xx" with an optional % sign after the value.

-- first the generic bonus string is looked up in the following table
BONUSSCANNER_PATTERNS_GENERIC_LOOKUP = {
	["All Stats"] 			= {"STR", "AGI", "STA", "INT", "SPI"},
	["Strength"]			= "STR",
	["Agility"]				= "AGI",
	["Stamina"]				= "STA",
	["Intellect"]			= "INT",
	["Spirit"] 				= "SPI",

	["All Resistances"] 	= { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},

	["Fishing"]				= "FISHING",
	["Fishing Lure"]		= "FISHING",
	["Increased Fishing"]	= "FISHING",
	["Mining"]				= "MINING",
	["Herbalism"]			= "HERBALISM",
	["Skinning"]			= "SKINNING",
	["Defense"]				= "DEFENSE",
	["Increased Defense"]	= "DEFENSE",

	["Attack Power"] 		= "ATTACKPOWER",
	["Attack Power when fighting Undead"] 		= "ATTACKPOWERUNDEAD",
	["Attack Power in Cat, Bear, and Dire Bear forms only"] = "ATTACKPOWERFERAL",

	["Dodge"] 				= "DODGE",
	["Block"]				= "BLOCK",
	["Block Value"]			= "BLOCKVALUE",
	["Hit"] 				= "TOHIT",
	["Spell Hit"]			= "SPELLTOHIT",
	["Blocking"]			= "BLOCK",
	["Ranged Attack Power"] = "RANGEDATTACKPOWER",
	["health every 5 sec"] = "HEALTHREG",
	["Healing Spells"] 		= "HEAL",
	["Increases Healing"] 	= "HEAL",
	["Healing and Spell Damage"] = {"HEAL", "DMG"},
	["Damage and Healing Spells"] = {"HEAL", "DMG"},
	["Spell Damage and Healing"] = {"HEAL", "DMG"},	
	["mana every 5 sec"] 	= "MANAREG",
	["Mana Regen"] 			= "MANAREG",
	["Spell Damage"] 		= {"HEAL", "DMG"},
	["Critical"] 			= "CRIT",
	["Critical Hit"] 		= "CRIT",
	["Damage"] 				= "DMG",
	["Health"]				= "HEALTH",
	["HP"]					= "HEALTH",
	["Mana"]				= "MANA",
	["Armor"]				= "ARMOR",
	["Reinforced Armor"]	= "ARMOR",

	["ко всем характеристикам"] = {"STR", "AGI", "STA", "INT", "SPI"},
	["к силе"] = "STR",
	["к ловкости"] = "AGI",
	["к выносливости"] = "STA",
	["к интеллекту"] = "INT",
	["к духу"] = "SPI",

	["силы"] = "STR",
	["ловкости"] = "AGI",
	["выносливости"] = "STA",
	["интеллекта"] = "INT",
	["духа"] = "SPI",
	
	["ко всем видам сопротивления"] = { "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},
	
	["Рыбная ловля"] = "FISHING",
	["Приманка"] = "FISHING",
	["Навык рыбной ловли увеличивается на"] = "FISHING",
	["к навыку горного дела"] = "MINING",
	["к навыку травничества"] = "HERBALISM",
	["к навыку снятия шкур"] = "SKINNING",
	["к защите"] = "DEFENSE",
	
	["к силе атаки"] = "ATTACKPOWER",
	["ед. в бою с нежитью."] = "ATTACKPOWERUNDEAD",
	["ед. в облике кошки, медведя, лютого медведя."] = "ATTACKPOWERFERAL",
	
	["к уклонению"] = "DODGE",
	["к блокированию"] = "BLOCK",
	["к блокированию"] = "BLOCKVALUE",
	["к меткости"] = "TOHIT",
	["к меткости заклинаний"] = "SPELLTOHIT",
	["к блокированию"] = "BLOCK",
	["к силе атаки дальнего боя"] = "RANGEDATTACKPOWER",
	["ед. здоровья каждые 5 секунд"] = "HEALTHREG",
	["к лечению"] = "HEAL",
	["к лечению"] = "HEAL",
	["к лечению и урону от заклинаний"] = {"HEAL", "DMG"},
	["к лечению и урону от заклинаний"] = {"HEAL", "DMG"},
	["к урону от заклинаний и лечению"] = {"HEAL", "DMG"},	
	["ед. маны каждые 5 секунд"] = "MANAREG",
	["ед. маны каждые"] = "MANAREG",
	["к урону от заклинаний"] = {"HEAL", "DMG"},
	["к критическому удару"] = "CRIT",
	["к критическому удару"] = "CRIT",
	["к урону"] = "DMG",
	["к здоровью"] = "HEALTH",
	["здоровья"] = "HEALTH",
	["к мане"] = "MANA",
	["к броне"] = "ARMOR",
	["Доспех усилен"] = "ARMOR",
};	

-- next we try to match against one pattern of stage 1 and one pattern of stage 2 and concatenate the effect strings
BONUSSCANNER_PATTERNS_GENERIC_STAGE1 = {
	{ pattern = "Arcane", 	effect = "ARCANE" },	
	{ pattern = "Fire", 	effect = "FIRE" },	
	{ pattern = "Frost", 	effect = "FROST" },	
	{ pattern = "Holy", 	effect = "HOLY" },	
	{ pattern = "Shadow",	effect = "SHADOW" },	
	{ pattern = "Nature", 	effect = "NATURE" },
	{pattern = "тайной магии", effect = "ARCANE"},	
	{pattern = "огня", effect = "FIRE"},	
	{pattern = "льда", effect = "FROST"},	
	{pattern = "светлой магии", effect = "HOLY"},	
	{pattern = "темной магии", effect = "SHADOW"},	
	{pattern = "сил природы", effect = "NATURE"},
	

	{pattern = "Тайный", effect = "ARCANE"},	
	{pattern = "Огненный", effect = "FIRE"},	
	{pattern = "Ледяной", effect = "FROST"},	
	{pattern = "Светлой", effect = "HOLY"},	
	{pattern = "Теневой", effect = "SHADOW"},	
	{pattern = "Природный", effect = "NATURE"}
}; 	

BONUSSCANNER_PATTERNS_GENERIC_STAGE2 = {
	{ pattern = "Resist", 	effect = "RES" },	
	{ pattern = "Damage", 	effect = "DMG" },
	{ pattern = "Effects", 	effect = "DMG" },
	{pattern = "сопротивление", effect = "RES"},
	{pattern = "стойкости", effect = "RES"},	
	{pattern = "урон", effect = "DMG"},
	{pattern = "эффект", effect = "DMG"},
}; 	

-- finally if we got no match, we match against some special enchantment patterns.
BONUSSCANNER_PATTERNS_OTHER = {
	{ pattern = "Mana Regen (%d+) per 5 sec%.", effect = "MANAREG" },
	
	{ pattern = "Minor Wizard Oil", effect = {"DMG", "HEAL"}, value = 8 },
	{ pattern = "Lesser Wizard Oil", effect = {"DMG", "HEAL"}, value = 16 },
	{ pattern = "Wizard Oil", effect = {"DMG", "HEAL"}, value = 24 },
	{ pattern = "Brilliant Wizard Oil", effect = {"DMG", "HEAL", "SPELLCRIT"}, value = {36, 36, 1} },

	{ pattern = "Minor Mana Oil", effect = "MANAREG", value = 4 },
	{ pattern = "Lesser Mana Oil", effect = "MANAREG", value = 8 },
	{ pattern = "Brilliant Mana Oil", effect = { "MANAREG", "HEAL"}, value = {12, 25} },
	
	{ pattern = "Eternium Line", effect = "FISHING", value = 5 }, 
	
	{ pattern = "Healing %+31 and 5 mana per 5 sec%.", effect = { "MANAREG", "HEAL"}, value = {5, 31} },
	{ pattern = "Stamina %+16 and Armor %+100", effect = { "STA", "ARMOR"}, value = {16, 100} },
	{ pattern = "Attack Power %+26 and %+1%% Critical Strike", effect = { "ATTACKPOWER", "CRIT"}, value = {26, 1} },
	{ pattern = "Spell Damage %+15 and %+1%% Spell Critical Strike", effect = { "DMG", "HEAL", "SPELLCRIT"}, value = {15, 15, 1} },

};
