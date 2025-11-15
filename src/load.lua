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