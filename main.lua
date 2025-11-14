
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- external libs
    sti = require 'libs/sti'
    anim8 = require 'libs/anim8'
    cam = require 'libs/camera'
    wf = require 'libs/windfield'

    -- Utilities
    render = require 'utils.render'

    world = wf.newWorld(0, 0)

    -- Load the test map
    map = sti("Demo/test.lua")

    -- Draw the collision
    walls = {}
    if map.layers["collision_rect"] then
        for _, obj in pairs(map.layers["collision_rect"].objects) do
            local x = obj.x
            local y = obj.y
            local width = (obj.width == 0) and 0.1 or obj.width
            local height = (obj.height == 0) and 0.1 or obj.height

            local wall = world:newRectangleCollider(x, y, width, height)
            wall:setType("static")
            table.insert(walls, wall)
        end
    end
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    -- map:draw(0, 0, 4) -- 4 is perfect for now

    -- Draw map
    render.draw_layer_with_scale(map, "general_ground", 4)
    render.draw_layer_with_scale(map, "detail_ground", 4)
    render.draw_layer_with_scale(map, "objects", 4)

    -- Draw colliders (walls)
    render.draw_with_scale(function() world:draw() end, nil, 4)
end