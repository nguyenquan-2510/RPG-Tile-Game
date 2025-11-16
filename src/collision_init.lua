function init_collision_wall(map, collision_layer, storage)
    if map.layers[collision_layer] then
        for _, obj in pairs(map.layers[collision_layer].objects) do
            local x, y, w, h = obj.x, obj.y, (obj.width == 0) and 0.1 or obj.width, (obj.height == 0) and 0.1 or obj.height
            local wall = world:newRectangleCollider(x, y, w, h)
            wall:setType("static")
            table.insert(storage, wall)
        end
    end
end