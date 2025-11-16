
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    require 'src.ext_load' -- Load external libs (anim8, sti, windfield, camera)

    -- Initialize new world
    world = wf.newWorld(0, 0)

    -- Load the test map
    map = sti("Demo/test.lua")

    -- Draw the collision
    walls = {}
    require 'src.collision_init'
    init_collision_wall(map, "collision_rect", walls)

    -- The player and some contracted forms of variables
    player = require 'Player'
    require 'src.definitions' -- Some useful definitions
    player.state = idle["down"]
end

function love.update(dt)
    player.state:update(dt)
    world:update(dt)
end

function love.draw()
    love.graphics.push()
    love.graphics.scale(4, 4)

    map:drawLayer(map.layers["general_ground"])
    map:drawLayer(map.layers["detail_ground"])
    map:drawLayer(map.layers["objects"])

    player.state:draw(player.idle_sheet.down, player.x, player.y, 0, 1, 1)
    world:draw()

    love.graphics.pop()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end