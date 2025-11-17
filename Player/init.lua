
local player = {}

-- General properties
player.x = 0
player.y = 0
player.speed = 100

function player:set_anim(state, direction)
    self.state = state
    self.dir = direction

    self.sheet_name = self.state .. "_" .. self.dir .. "_sheet"

    -- Need for anim8 draw
    self.sheet_dir = anim[self.sheet_name]

    -- anim8 update
    self.anim = anim[self.state][self.dir]
end


-- Store spritesheet data
player.idle_sheet = {}
player.idle_sheet.down = love.graphics.newImage("Player/idle/idle_down.png")
player.idle_sheet.up = love.graphics.newImage("Player/idle/idle_up.png")
player.idle_sheet.left = love.graphics.newImage("Player/idle/idle_left.png")
player.idle_sheet.right = love.graphics.newImage("Player/idle/idle_right.png")

player.run_sheet = {}
player.run_sheet.down = love.graphics.newImage("Player/run/run_down.png")
player.run_sheet.up = love.graphics.newImage("Player/run/run_up.png")
player.run_sheet.left = love.graphics.newImage("Player/run/run_left.png")
player.run_sheet.right = love.graphics.newImage("Player/run/run_right.png")

-- Collision hitbox
player.collider = world:newBSGRectangleCollider(player.x, player.y, 10, 15, 2)
player.collider:setFixedRotation(true)

local animations = {}
animations.__index = animations

-- Idle Grids
animations.idle_grid = {}

animations.idle_grid.down = anim8.newGrid(16, 16, player.idle_sheet.down:getWidth(), player.idle_sheet.down:getHeight())
animations.idle_grid.up = anim8.newGrid(16, 16, player.idle_sheet.up:getWidth(), player.idle_sheet.up:getHeight())
animations.idle_grid.left = anim8.newGrid(16, 16, player.idle_sheet.left:getWidth(), player.idle_sheet.left:getHeight())
animations.idle_grid.right = anim8.newGrid(16, 16, player.idle_sheet.right:getWidth(), player.idle_sheet.right:getHeight())


-- Run Grids
animations.run_grid = {}

animations.run_grid.down = anim8.newGrid(16, 16, player.run_sheet.down:getWidth(), player.run_sheet.down:getHeight())
animations.run_grid.up = anim8.newGrid(16, 16, player.run_sheet.up:getWidth(), player.run_sheet.up:getHeight())
animations.run_grid.left = anim8.newGrid(16, 16, player.run_sheet.left:getWidth(), player.run_sheet.left:getHeight())
animations.run_grid.right = anim8.newGrid(16, 16, player.run_sheet.right:getWidth(), player.run_sheet.right:getHeight())

-- Animations
animations.idle = {}
animations.idle.down = anim8.newAnimation(animations.idle_grid.down('1-6', 1), 0.2)
animations.idle.up = anim8.newAnimation(animations.idle_grid.up('1-6', 1), 0.2)
animations.idle.left = anim8.newAnimation(animations.idle_grid.left('1-6', 1), 0.2)
animations.idle.right = anim8.newAnimation(animations.idle_grid.right('1-6', 1), 0.2)

animations.run = {}
animations.run.down = anim8.newAnimation(animations.run_grid.down('1-6', 1), 0.2)
animations.run.up = anim8.newAnimation(animations.run_grid.up('1-6', 1), 0.2)
animations.run.left = anim8.newAnimation(animations.run_grid.left('1-6', 1), 0.2)
animations.run.right = anim8.newAnimation(animations.run_grid.right('1-6', 1), 0.2)

-- Merge the animations table with the player table
setmetatable(player, animations)
return player