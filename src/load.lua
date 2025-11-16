-- external libs
sti = require 'libs/sti'
anim8 = require 'libs/anim8'
camera = require 'libs/camera'
wf = require 'libs/windfield'

-- Utilities
render = require 'utils.render'

-- Camera object
cam = camera()

-- Initialize new world
world = wf.newWorld(0, 0)

-- Load the test map
map = sti("Demo/test.lua")

-- Draw the collision
walls = {}
render.render_collision_wall(map, "collision_rect", walls)

-- Player
player = require 'Player'