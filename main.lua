
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    require 'src/load'
end

function love.update(dt)
    -- player.animations.down:update(dt)
    player.idle_anim.down:update(dt)

    world:update(dt)
end

function love.draw()

    -- Draw map
    render.draw_scaled_layer(map, "general_ground", 4)
    render.draw_scaled_layer(map, "detail_ground", 4)
    render.draw_scaled_layer(map, "objects", 4)

    -- Draw colliders (walls)
    render.draw_with_scale(function() world:draw() end, nil, 4)

    -- player.animations.down:draw(player.spritesheet, 50, 50)
    player.idle_anim.down:draw(player.idle_sheet, 100, 100, 0, 4, 4)
end