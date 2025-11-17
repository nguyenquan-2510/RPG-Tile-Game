
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    require 'src/ext_load' -- Load external libs (anim8, sti, windfield, camera)

    -- Initialize new world
    world = wf.newWorld(0, 0)

    -- Load the test map
    map = sti("Demo/test.lua")

    -- New camera object
    cam = camera()

    -- Draw the collision
    walls = {}
    require 'src/collision_init'
    init_collision_wall(map, "collision_rect", walls)

    -- The player and some contracted forms of variables
    player = require 'Player'
    require 'src/animation_def' -- Some useful definitions

    player.dir = "down"
    player.state = "idle"

    -- Name of the animation sheet
    player.sheet_name = player.state .. "_" .. player.dir .. "_sheet"
    player.sheet_dir = anim[player.sheet_name]

    player.anim = anim[player.state][player.dir]
end


function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if key == "right" or key == "left" or key == "up" or key == "down" then
        player.dir = tostring(key)
        player.sheet_name = player.state .. "_" .. player.dir .. "_sheet"
        player.sheet_dir = anim[player.sheet_name]
    end
end

function love.update(dt)
    player.anim:update(dt)
    world:update(dt)
end

function love.draw()
    cam:attach()

    love.graphics.push()
    love.graphics.scale(4, 4)

    map:drawLayer(map.layers["general_ground"])
    map:drawLayer(map.layers["detail_ground"])
    map:drawLayer(map.layers["objects"])

    player.anim:draw(player.sheet_dir, player.x, player.y, 0, 1, 1)
    world:draw()

    love.graphics.pop()

    cam:detach()
end