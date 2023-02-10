--DEFAULT_CHAT_FRAME:AddMessage("Bonus-Scanner: "..GetLocale(), 0.5, 0.8, 1)
if true then
--	DEFAULT_CHAT_FRAME:AddMessage("Bonus-Scanner: "..GetLocale().." OK!", 0.5, 0.8, 1)
	-- Version : Russian ( by Maus )
	
	-- bonus names
	BONUSSCANNER_NAMES = {	
		STR = "Сила",
		AGI = "Ловкость",
		STA = "Выносливость",
		INT = "Интеллект",
		SPI = "Дух",
		ARMOR = "Усиленная броня",
		
		ARCANERES = "Сопротивление тайной магии",	
		FIRERES = "Сопротивление огню",
		NATURERES = "Сопротивление силам природы",
		FROSTRES = "Сопротивление магии льда",
		SHADOWRES = "Сопротивление темной магии",
		
		FISHING = "Рыбная ловля",
		MINING = "Горное дело",
		HERBALISM = "Травничество",
		SKINNING = "Снятие шкур",
		DEFENSE = "Защита",
		
		BLOCK = "Вероятность блокирования",
		BLOCKVALUE  = "Показатель блокирования",
		DODGE = "Уклон",
		PARRY = "Парир",
		ATTACKPOWER = "Сила атаки",
		ATTACKPOWERUNDEAD = "Сила атаки против нежити",
		ATTACKPOWERFERAL = "Сила атаки в форме животного",
		CRIT = "Крит. попадания",
		RANGEDATTACKPOWER = "Сила атаки дальнего боя",
		RANGEDCRIT = "Крит. выстрелы",
		TOHIT = "Шанс попадания",
		
		DMG = "Урон от заклинания",
		DMGUNDEAD	= "Урон от заклинаний против нежити",
		ARCANEDMG = "Урон от тайной магии",
		FIREDMG = "Урон от магии огня",
		FROSTDMG = "Урон от магии льда",
		HOLYDMG = "Урон от магии Света",
		NATUREDMG = "Урон от природы",
		SHADOWDMG = "Урон от темной магии",
		SPELLCRIT = "Критическое заклинание",
		SPELLTOHIT = "Шанс попадания заклинанием",
		SPELLPEN = "Проникновение заклинания",
		HEAL = "Исцеление",
		HOLYCRIT = "Крит. светом",
		
		HEALTHREG = "Восстановление здоровья",
		MANAREG = "Восстановление маны",
		HEALTH = "Очки здоровья",
		MANA = "Очки маны"
	}
	
	-- equip and set bonus prefixes:
	BONUSSCANNER_PREFIX_EQUIP = "Если надето: "
	BONUSSCANNER_PREFIX_SET = "Комплект ("
	BONUSSCANNER_PREFIX_SET_ENDING = " предмета):"
	
	-- passive bonus patterns. checked against lines which start with above prefixes
	BONUSSCANNER_PATTERNS_PASSIVE = {
	--	{pattern = "Увеличивает силу атаки дальнего боя на (%d+)%.", effect = "RANGEDATTACKPOWER"},
	--	{pattern = "Повышает вероятность блокировать атаку щитом на (%d+)%%%.", effect = "BLOCK"},
	--	{pattern = "Увеличивает показатель блокирования вашего щита на (%d+) ед%.", effect = "BLOCKVALUE"},
	--	{pattern = "Повышает вероятность уклонения от атак на (%d+)%%%.", effect = "DODGE"},
	--	{pattern = "Увеличивает вероятность парирования атак на (%d+)%%%.", effect = "PARRY"},
	--	{pattern = "Повышает вероятность нанести критический удар заклинаниями на (%d+)%%%.", effect = "SPELLCRIT"},
	--	{pattern = "Увеличение вероятности критического эффекта ваших заклинаний светлой магии на (%d+)%%%.", effect = "HOLYCRIT"},
	--	{pattern = "Повышает вероятность критического эффекта ваших заклинаний светлой магии на (%d+)%%%.", effect = "HOLYCRIT"},
	--	{pattern = "Увеличивает вероятность нанести критический удар на (%d+)%%%.", effect = "CRIT"},
	--	{pattern = "Увеличение вероятности критического урона метательным оружием на (%d+)%%%.", effect = "RANGEDCRIT"},
	--	{pattern = "Увеличивает урон, наносимый заклинаниями и эффектами тайной магии не более чем на (%d+)%.", effect = "ARCANEDMG"},
	--	{pattern = "Увеличивает урон, наносимый заклинаниями и эффектами магии огня не более чем на (%d+)%.", effect = "FIREDMG"},
	--	{pattern = "Увеличивает урон, наносимый заклинаниями и эффектами магии льда не более чем на (%d+)%.", effect = "FROSTDMG"},
	--	{pattern = "Увеличивает урон, наносимый заклинаниями и эффектами светлой магии не более чем на (%d+)%.", effect = "HOLYDMG"},
	--	{pattern = "Увеличивает урон, наносимый заклинаниями и эффектами сил природы не более чем на (%d+)%.", effect = "NATUREDMG"},
	--	{pattern = "Увеличивает урон, наносимый заклинаниями и эффектами темной магии не более чем на (%d+)%.", effect = "SHADOWDMG"},
	--	{pattern = "Увеличивает исцеляющие действия эффектов и заклинаний не более чем на (%d+)%.", effect = "HEAL"},
	--	{pattern = "Увеличивает урон и исцеляющие действия магических эффектов и заклинаний не более чем на (%d+)%.", effect = {"HEAL", "DMG"}},
	--	{pattern = "Повышение не более чем на (%d+) ед%. урона, наносимого нежити заклинаниями и магическими эффектами%.", effect = "DMGUNDEAD"},
	--	{pattern = "Увеличение силы атаки на (%d+) ед%. в бою с нежитью%.", effect = "ATTACKPOWERUNDEAD"},
	--	{pattern = "Восполняет (%d+) ед%. здоровья каждые 5 сек%.", effect = "HEALTHREG"}, 
	--	{pattern = "Восполнение (%d+) ед%. здоровья раз в 5 сек%.", effect = "HEALTHREG"},  -- both versions ('per' and 'every') seem to be used
	--	{pattern = "Восполнение (%d+) ед%. маны раз в 5 сек.%.", effect = "MANAREG"},
	--	{pattern = "Восполнение (%d+) ед%. маны раз в 5 сек%.", effect = "MANAREG"},
	--	{pattern = "Повышает меткость на (%d+)%%%.", effect = "TOHIT"},
	--	{pattern = "Повышает меткость заклинаний на (%d+)%%%.", effect = "SPELLTOHIT"},
	--	{pattern = "Снижает сопротивление магии у целей ваших заклинаний на (%d+).", effect = "SPELLPEN"},
	--	{pattern = "Увеличивает защиту на (%d+).", effect = "DEFENSE"},
		{pattern = "+(%d+) Attack Power%.", effect = "ATTACKPOWER"},
		{pattern = "+(%d+) ranged Attack Power%.", effect = "RANGEDATTACKPOWER"},
		{pattern = "Increases your chance to block attacks with a shield by (%d+)%%%.", effect = "BLOCK"},
		{pattern = "Increases the block value of your shield by (%d+)%.", effect = "BLOCKVALUE"},
		{pattern = "Increases your chance to dodge an attack by (%d+)%%%.", effect = "DODGE"},
		{pattern = "Increases your chance to parry an attack by (%d+)%%%.", effect = "PARRY"},
		{pattern = "Improves your chance to get a critical strike with spells by (%d+)%%%.", effect = "SPELLCRIT"},
		{pattern = "Improves your chance to get a critical strike with Holy spells by (%d+)%%%.", effect = "HOLYCRIT"},
		{pattern = "Increases the critical effect chance of your Holy spells by (%d+)%%%.", effect = "HOLYCRIT"},
		{pattern = "Improves your chance to get a critical strike by (%d+)%%%.", effect = "CRIT"},
		{pattern = "Improves your chance to get a critical strike with missile weapons by (%d+)%%%.", effect = "RANGEDCRIT"},
		{pattern = "Increases damage done by Arcane spells and effects by up to (%d+)%.", effect = "ARCANEDMG"},
		{pattern = "Increases damage done by Fire spells and effects by up to (%d+)%.", effect = "FIREDMG"},
		{pattern = "Increases damage done by Frost spells and effects by up to (%d+)%.", effect = "FROSTDMG"},
		{pattern = "Increases damage done by Holy spells and effects by up to (%d+)%.", effect = "HOLYDMG"},
		{pattern = "Increases damage done by Nature spells and effects by up to (%d+)%.", effect = "NATUREDMG"},
		{pattern = "Increases damage done by Shadow spells and effects by up to (%d+)%.", effect = "SHADOWDMG"},
		{pattern = "Increases healing done by spells and effects by up to (%d+)%.", effect = "HEAL"},
		{pattern = "Increases damage and healing done by magical spells and effects by up to (%d+)%.", effect ={"HEAL", "DMG"}},
		{pattern = "Increases damage done to Undead by magical spells and effects by up to (%d+)", effect = "DMGUNDEAD"},
		{pattern = "+(%d+) Attack Power when fighting Undead.", effect = "ATTACKPOWERUNDEAD"},
		{pattern = "Restores (%d+) health per 5 sec%.", effect = "HEALTHREG"}, 
		{pattern = "Restores (%d+) health every 5 sec%.", effect = "HEALTHREG"}, -- both versions ('per' and 'every') seem to be used
		{pattern = "Restores (%d+) mana per 5 sec%.", effect = "MANAREG"},
		{pattern = "Restores (%d+) mana every 5 sec%.", effect = "MANAREG"},
		{pattern = "Improves your chance to hit by (%d+)%%%.", effect = "TOHIT"},
		{pattern = "Improves your chance to hit with spells by (%d+)%%%.", effect = "SPELLTOHIT"},
		{pattern = "Decreases the magical resistances of your spell targets by (%d+).", effect = "SPELLPEN"}
	}
	
	-- generic patterns have the form "+xx bonus" or "bonus +xx" with an optional % sign after the value.
	
	-- first the generic bonus string is looked up in the following table
	BONUSSCANNER_PATTERNS_GENERIC_LOOKUP = {
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

		["All Stats"] ={"STR", "AGI", "STA", "INT", "SPI"},
		["Strength"] = "STR",
		["Agility"] = "AGI",
		["Stamina"] = "STA",
		["Intellect"] = "INT",
		["Spirit"] = "SPI",
		
		["All Resistances"] ={ "ARCANERES", "FIRERES", "FROSTRES", "NATURERES", "SHADOWRES"},
		
		["Fishing"] = "FISHING",
		["Fishing Lure"] = "FISHING",
		["Increased Fishing"] = "FISHING",
		["Mining"] = "MINING",
		["Herbalism"] = "HERBALISM",
		["Skinning"] = "SKINNING",
		["Defense"] = "DEFENSE",
		["Increased Defense"] = "DEFENSE",
		
		["Attack Power"] = "ATTACKPOWER",
		["Attack Power when fighting Undead"] = "ATTACKPOWERUNDEAD",
		["Attack Power in Cat, Bear, and Dire Bear forms only"] = "ATTACKPOWERFERAL",
		
		["Dodge"] = "DODGE",
		["Block"] = "BLOCK",
		["Block Value"] = "BLOCKVALUE",
		["Hit"] = "TOHIT",
		["Spell Hit"] = "SPELLTOHIT",
		["Blocking"] = "BLOCK",
		["Ranged Attack Power"] = "RANGEDATTACKPOWER",
		["health every 5 sec"] = "HEALTHREG",
		["Healing Spells"] = "HEAL",
		["Increases Healing"] = "HEAL",
		["Healing and Spell Damage"] ={"HEAL", "DMG"},
		["Damage and Healing Spells"] ={"HEAL", "DMG"},
		["Spell Damage and Healing"] ={"HEAL", "DMG"}, 
		["mana every 5 sec"] = "MANAREG",
		["Mana Regen"] = "MANAREG",
		["Spell Damage"] ={"HEAL", "DMG"},
		["Critical"] = "CRIT",
		["Critical Hit"] = "CRIT",
		["Damage"] = "DMG",
		["Health"] = "HEALTH",
		["HP"] = "HEALTH",
		["Mana"] = "MANA",
		["Armor"] = "ARMOR",
		["Reinforced Armor"] = "ARMOR",
	}
	
	-- next we try to match against one pattern of stage 1 and one pattern of stage 2 and concatenate the effect strings
	BONUSSCANNER_PATTERNS_GENERIC_STAGE1 = {
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
	}
	
	BONUSSCANNER_PATTERNS_GENERIC_STAGE2 = {
		{pattern = "сопротивление", effect = "RES"},
		{pattern = "стойкости", effect = "RES"},	
		{pattern = "урон", effect = "DMG"},
		{pattern = "эффект", effect = "DMG"},
	}
	
	-- finally if we got no match, we match against some special enchantment patterns.
	BONUSSCANNER_PATTERNS_OTHER = {
		{pattern = "Восполнение (%d+) ед%. маны каждые 5 сек%.", effect = "MANAREG"},
		
		{pattern = "Слабое волшебное масло", effect = {"DMG", "HEAL"}, value = 8},
		{pattern = "Малое волшебное масло", effect = {"DMG", "HEAL"}, value = 16},
		{pattern = "Волшебное масло", effect = {"DMG", "HEAL"}, value = 24},
		{pattern = "Сверкающее волшебное масло", effect = {"DMG", "HEAL", "SPELLCRIT"}, value = {36, 36, 1}},
		
		{pattern = "Слабое масло маны", effect = "MANAREG", value = 4},
		{pattern = "Малое масло маны", effect = "MANAREG", value = 8},
		{pattern = "Сверкающее масло маны", effect = { "MANAREG", "HEAL"}, value = {12, 25}},
		
		{pattern = "Этерниевая леска", effect = "FISHING", value = 5}, 
		
		{pattern = "%+31 к лечению и 5 ед%. маны каждые 5 секунд", effect = { "MANAREG", "HEAL"}, value = {5, 31}},
		{pattern = "%+16 к выносливости и %+100 к броне", effect = { "STA", "ARMOR"}, value = {16, 100}},
		{pattern = "%+26 к силе атаки и %+1%% к критическому удару", effect = { "ATTACKPOWER", "CRIT"}, value = {26, 1}},
		{pattern = "%+15 к урону от заклинаний и %+1%% к критическому удару заклинаниями", effect = { "DMG", "HEAL", "SPELLCRIT"}, value = {15, 15, 1}},
	}
end