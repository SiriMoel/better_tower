--[[table.insert( actions,
{
	id          = "SEA_OF_SWAMP",
	name 		= "Sea of swamp",
	description = "How useful",
	sprite 		= "mods/tower_++/files/actions/sea_swamp.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "0,4,5,6", -- BERSERK_FIELD
	spawn_probability                 = "1,1,1,1", -- BERSERK_FIELD
	price = 350,
	mana = 140,
	max_uses = 3,
	action 		= function()
		add_projectile("mods/tower_++/files/actions/sea_swamp.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
}
 )]]--
table.insert( actions,
{

		id          = "COLOUR_GOLD",
		name 		= "Golden glimmer",
		description = "Makes your projectiles shiny!",
		sprite 		= "mods/better_tower/files/ui_gfx/gun_actions/colour_gold.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
		related_extra_entities = { "mods/better_tower/files/entities/particles/tinyspark_gold.xml"},--, "mods/tower_++/files/entities/misc/colour_gold.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,4", -- HOMING
		spawn_probability                 = "0.1,0.1,0.1", -- HOMING
		spawn_requires_flag = "card_unlocked_paint",
		price = 40,
		mana = 0,
		--max_uses = 100,
		action = function()
			c.extra_entities = c.extra_entities .. "mods/better_tower/files/entities/particles/tinyspark_gold.xml,"--,mods/tower_++/files/entities/misc/colour_gold.xml,"
			c.fire_rate_wait = c.fire_rate_wait - 8
			c.screenshake = c.screenshake - 2.5
			if ( c.screenshake < 0 ) then
				c.screenshake = 0
			end
			draw_actions( 1, true )
		end,
	
	}
)