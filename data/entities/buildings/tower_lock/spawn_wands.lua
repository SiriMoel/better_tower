dofile_once("data/scripts/lib/utilities.lua")
dofile("mods/better_tower/files/tower_wands.lua")

local lock = GetUpdatedEntityID()
local x, y = EntityGetTransform(lock)

local wand1 = tower_wands[math.random(1, #tower_wands )]
local wand2 = tower_wands[math.random(1, #tower_wands )]
local wand3 = tower_wands[math.random(1, #tower_wands )]
local wand4 = tower_wands[math.random(1, #tower_wands )]

if EntityHasTag(lock, "tower_lock_wands_spawned") == false and EntityHasTag(lock, "in_tower_key_1") == true and EntityHasTag(lock, "in_tower_key_2") == true and EntityHasTag(lock, "in_tower_key_3") == true and EntityHasTag(lock, "in_tower_key_4") == true then
    EntityAddTag(lock, "tower_lock_wands_spawned")

    EntityLoad( wand1, x - 25, y + 12 )
	EntityLoad( wand2, x - 42, y + 12 )
	EntityLoad( wand3, x + 25, y + 12 )
    EntityLoad( wand4, x + 42, y + 12 )
end