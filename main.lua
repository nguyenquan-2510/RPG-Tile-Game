
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    sti = require 'libs/sti'
    anim8 = require 'libs/anim8'
    camera = require 'libs/camera'
    wf = require 'libs/windfield'
    -- Initialize new world
    world = wf.newWorld(0, 0)
    -- Load the test map
    map = sti("Demo/test.lua")
    -- Draw the collision
    walls = {}

    if map.layers["collision_rect"] then
        for _, obj in pairs(map.layers["collision_rect"].objects) do
            local x, y, w, h = obj.x, obj.y, (obj.width == 0) and 0.1 or obj.width, (obj.height == 0) and 0.1 or obj.height
            local wall = world:newRectangleCollider(x, y, w, h)
            wall:setType("static")
            table.insert(walls, wall)
        end
    end

    player = {}
    player.x = 100
    player.y = 100
    player.sheet = love.graphics.newImage("Player/idle/idle_down.png")
    player.grid = anim8.newGrid(16, 16, player.sheet:getWidth(), player.sheet:getHeight())
    player.animations = {}
    player.animations.down = anim8.newAnimation(player.grid('1-6', 1), 0.2)

    player.collider = world:newBSGRectangleCollider(player.x, player.y, 20, 20, 5)
    player.collider:setType("static")
end

function love.update(dt)


    player.idle_anim.down:update(dt)

    world:update(dt)
    player.animations.down:update(dt)
end

function love.draw()
    cam:attach()

    -- Draw map
    render.draw_scaled_layer(map, "general_ground", 4)
    render.draw_scaled_layer(map, "detail_ground", 4)
    render.draw_scaled_layer(map, "objects", 4)

    -- Draw colliders (walls)
    render.draw_with_scale(function() world:draw() end, nil, 4)

    player.idle_anim.down:draw(player.idle_sheet.down, 100, 100, 0, 4, 4)

    cam:detach()
end