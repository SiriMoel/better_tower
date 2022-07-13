dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

function get_random_from( target )
	local rnd = Random(1, #target)
	
	return tostring(target[rnd])
end

function get_multiple_random_from( target, amount_ )
	local amount = amount_ or 1
	
	local result = {}
	
	for i=1,amount do
		local rnd = Random(1, #target)
		
		table.insert(result, tostring(target[rnd]))
	end
	
	return result
end

function get_random_between_range( target )
	local minval = target[1]
	local maxval = target[2]
	
	return Random(minval, maxval)
end

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )
SetRandomSeed( x, y + GameGetFrameNum() )

local ability_comp = EntityGetFirstComponent( entity_id, "AbilityComponent" )

local gun = { }
gun.name = {"Decay wand"}
gun.deck_capacity = {10,20}
gun.actions_per_round = 2
gun.reload_time = {12,40}
gun.shuffle_deck_when_empty = 0
gun.fire_rate_wait = {12,40}
gun.spread_degrees = 5
gun.speed_multiplier = 0.8
gun.mana_charge_speed = {150,250}
gun.mana_max = {341,625}
gun.actions = {"CURSED_ORB","DEATH_CROSS","DARKFLAME","BLOOD_MAGIC","TENTACLE_PORTAL"}

local mana_max = get_random_between_range( gun.mana_max )
local deck_capacity = gun.deck_capacity

ComponentSetValue( ability_comp, "ui_name", get_random_from( gun.name ) )

ComponentObjectSetValue( ability_comp, "gun_config", "reload_time", get_random_between_range( gun.reload_time ) )
ComponentObjectSetValue( ability_comp, "gunaction_config", "fire_rate_wait", get_random_between_range( gun.fire_rate_wait ) )
ComponentSetValue( ability_comp, "mana_charge_speed", get_random_between_range( gun.mana_charge_speed) )

ComponentObjectSetValue( ability_comp, "gun_config", "actions_per_round", gun.actions_per_round )
ComponentObjectSetValue( ability_comp, "gun_config", "deck_capacity",  get_random_between_range( gun.deck_capacity ))
ComponentObjectSetValue( ability_comp, "gun_config", "shuffle_deck_when_empty", gun.shuffle_deck_when_empty )
ComponentObjectSetValue( ability_comp, "gunaction_config", "spread_degrees", gun.spread_degrees )
ComponentObjectSetValue( ability_comp, "gunaction_config", "speed_multiplier", gun.speed_multiplier )

ComponentSetValue( ability_comp, "mana_max", mana_max )
ComponentSetValue( ability_comp, "mana", mana_max )

local action_count = 3
local gun_action = get_random_from( gun.actions )

AddGunActionPermanent( entity_id, "CURSE" )
AddGunActionPermanent( entity_id, "CURSE_WITHER_PROJECTILE" )
AddGunActionPermanent( entity_id, "CURSE_WITHER_EXPLOSION" )
AddGunActionPermanent( entity_id, "CURSE_WITHER_MELEE" )
AddGunActionPermanent( entity_id, "CURSE_WITHER_ELECTRICITY" )

for i=1,action_count do
	AddGunAction( entity_id, gun_action )
end

local item_comp = EntityGetFirstComponent( entity_id, "ItemComponent" )
ComponentSetValue2( item_comp, "item_name", "Wand of Decay" )
ComponentSetValue2( item_comp, "always_use_item_name_in_ui", true )