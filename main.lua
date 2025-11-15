
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- external libs
    sti = require 'libs/sti'
    anim8 = require 'libs/anim8'
    cam = require 'libs/camera'
    wf = require 'libs/windfield'

    -- Utilities
    render = require 'utils.render'


    -- Player
    player = require 'Player'


    world = wf.newWorld(0, 0)

    -- Load the test map
    map = sti("Demo/test.lua")

    -- Draw the collision
    walls = {}
    render.render_collision_wall(map, "collision_rect", walls)
end

function love.update(dt)
    player.animations.down:update(dt)

    world:update(dt)
end

function love.draw()
    -- map:draw(0, 0, 4) -- 4 is perfect for now

    -- Draw map
    render.draw_scaled_layer(map, "general_ground", 4)
    render.draw_scaled_layer(map, "detail_ground", 4)
    render.draw_scaled_layer(map, "objects", 4)

    -- Draw colliders (walls)
    render.draw_with_scale(function() world:draw() end, nil, 4)
    -- render.draw_with_scale(function () player.animations.down:draw(player.spritesheet, 25, 25) end, nil, 4)
    player.animations.down:draw(player.spritesheet, 50, 50)
end