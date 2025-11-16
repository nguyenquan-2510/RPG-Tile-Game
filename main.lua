
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
end

function love.update(dt)
    player.animations.down:update(dt)
    world:update(dt)
end

function love.draw()
    map:drawLayer(map.layers["general_ground"])
    map:drawLayer(map.layers["detail_ground"])
    map:drawLayer(map.layers["objects"])

    player.animations.down:draw(player.sheet, player.x, player.y, 0, 1, 1)
    world:draw()
end