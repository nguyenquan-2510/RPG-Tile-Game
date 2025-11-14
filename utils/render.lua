local render = {}

-- Draw scaled maps
function render.draw_scaled_layer(render_map, layer_name, scale_x, scale_y)

    scale_x = scale_x or 1
    scale_y = scale_y or scale_x

    love.graphics.push()
    love.graphics.scale(scale_x, scale_y)
    render_map:drawLayer(render_map.layers[layer_name])
    love.graphics.pop()
end

-- Use a draw function with a scale ratio
function render.draw_with_scale(draw_function, parameter, scale_x, scale_y)
    scale_x = scale_x or 1
    scale_y = scale_y or scale_x

    love.graphics.push()
    love.graphics.scale(scale_x, scale_y)

    if parameter then
        draw_function(parameter)
    else draw_function()
    end
    love.graphics.pop()
end

function render.render_collision_wall(map, layer, storage)
    if map.layers[layer] then
        for _, obj in pairs(map.layers[layer].objects) do
            local x, y, w, h = obj.x, obj.y, (obj.width ~= 0) and obj.width or 0.1, (obj.height ~= 0) and obj.height or 0.1
            local wall = world:newRectangleCollider(x, y, w, h)
            wall:setType("static")
            table.insert(storage, wall)
        end
    end
end

return render