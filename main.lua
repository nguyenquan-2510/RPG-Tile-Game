
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- external libs
    sti = require 'libs/sti'
    anim8 = require 'libs/anim8'
    cam = require 'libs/camera'
    wf = require 'libs/windfield'

    world = wf.newWorld(0, 0)

    -- Load the test map
    map = sti("Demo/test.lua")
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    map:draw(0, 0, 4) -- 4 is perfect for now
    world:draw()
end