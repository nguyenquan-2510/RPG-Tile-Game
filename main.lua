
function love.load()
    -- external libs
    sti = require 'libs/sti'
    anim8 = require 'libs/anim8'
    cam = require 'libs/camera'
    wf = require 'libs/windfield'

    world = wf.newWorld(0, 0)
    rect1 = world:newRectangleCollider(100, 100, 200, 100)
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    world:draw()
end