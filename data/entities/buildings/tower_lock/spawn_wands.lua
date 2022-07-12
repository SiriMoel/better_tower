dofile_once("data/scripts/lib/utilities.lua")

local x, y = EntityGetTransform()
local lock = GetUpdatedEntityID()

if EntityHasTag(lock, "tower_lock_wands_spawned") == false and EntityHasTag(lock, "in_tower_key_1") == true and EntityHasTag(lock, "in_tower_key_2") == true and EntityHasTag(lock, "in_tower_key_3") == true and EntityHasTag(lock, "in_tower_key_4") == true then
    EntityAddTag(lock, "tower_lock_wands_spawned")

    EntityLoad( "data/entities/items/wands/wand_good/wand_good_1.xml", x - 25, y + 12 )
	EntityLoad( "data/entities/items/wands/wand_good/wand_good_2.xml", x - 45, y + 12 )
	EntityLoad( "data/entities/items/wands/wand_good/wand_good_3.xml", x + 25, y + 12 )
end

if EnittyHasTag("in_tower_key_1") then
    
end