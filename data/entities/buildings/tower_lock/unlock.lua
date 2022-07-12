dofile_once("data/scripts/lib/utilities.lua")

function collision_trigger(colliding_entity_id)
    local x, y = EntityGetTransform()
    local lock = GetUpdatedEntityID()

    if (EntityHasTag(colliding_entity_id, "mortal")) then return end

    --keys
    if (EntityHasTag(colliding_entity_id, "tower_key_1")) == true and (EntityHasTag(lock, "in_tower_key_1")) == false then
        EntityAddTag(lock, "in_tower_key_1")
        EntityKill(colliding_entity_id)
    end
    if (EntityHasTag(colliding_entity_id, "tower_key_2")) == true and (EntityHasTag(lock, "in_tower_key_2")) == false then
        EntityAddTag(lock, "in_tower_key_2")
        EntityKill(colliding_entity_id)
    end
    if (EntityHasTag(colliding_entity_id, "tower_key_3")) == true and (EntityHasTag(lock, "in_tower_key_3")) == false then
        EntityAddTag(lock, "in_tower_key_3")
        EntityKill(colliding_entity_id)
    end
    if (EntityHasTag(colliding_entity_id, "tower_key_4")) == true and (EntityHasTag(lock, "in_tower_key_4")) == false then
        EntityAddTag(lock, "in_tower_key_4")
        EntityKill(colliding_entity_id)
    end

end