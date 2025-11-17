
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
    player:set_anim(player.state, player.dir)
end


function love.update(dt)
    player:move()

    
    world:update(dt)
    map:update(dt)

    player.x = player.collider:getX()
    player.y = player.collider:getY()

    player.anim:update(dt)

    cam:lookAt(player.x, player.y)

     -- Clamp camera vào map
    local w = love.graphics.getWidth()  / 4   -- chia theo scale
    local h = love.graphics.getHeight() / 4

    if cam.x < w/2 then cam.x = w/2 end
    if cam.y < h/2 then cam.y = h/2 end

    local mapW = map.width * map.tilewidth
    local mapH = map.height * map.tileheight

    if cam.x > mapW - w/2 then cam.x = mapW - w/2 end
    if cam.y > mapH - h/2 then cam.y = mapH - h/2 end
end

function love.draw()

    cam:zoomTo(4)
    cam:attach()

    map:drawLayer(map.layers["general_ground"])
    map:drawLayer(map.layers["detail_ground"])
    map:drawLayer(map.layers["objects"])

    player.anim:draw(player.sheet_dir, player.x, player.y, 0, 1, 1, 8, 8)
    world:draw()

    cam:detach()

end