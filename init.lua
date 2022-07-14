local nxml = dofile_once("mods/better_tower/lib/nxml.lua")

function OnModInit()

end

function OnModPostInit()

end

function OnPlayerSpawned( player_entity )
    EntityLoad("mods/better_tower/files/tower_keys/1.xml", 0, -100)
    EntityLoad("mods/better_tower/files/tower_keys/2.xml", 0, -120)
    EntityLoad("mods/better_tower/files/tower_keys/3.xml", 0, -140)
    EntityLoad("mods/better_tower/files/tower_keys/4.xml", 0, -160)
end

function OnWorldPostUpdate()
end

function OnPlayerDied()

end

ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/better_tower/files/actions.lua" )