
local player = {}
player.x = 100
player.y = 100

-- Store related data
player.idle_sheet = {}
player.idle_sheet.down = love.graphics.newImage("Player/idle/idle_down.png")
player.idle_sheet.up = love.graphics.newImage("Player/idle/idle_up.png")
player.idle_sheet.left = love.graphics.newImage("Player/idle/idle_left.png")
player.idle_sheet.right = love.graphics.newImage("Player/idle/idle_right.png")

-- Collision hitbox
player.collider = world:newBSGRectangleCollider(player.x + 3, player.y, 10, 15, 2)

local animations = {}
animations.__index = animations

-- Grids
animations.idle_grid = {}
-- Idle down
animations.idle_grid.down = anim8.newGrid(16, 16, player.idle_sheet.down:getWidth(), player.idle_sheet.down:getHeight())

-- Idle up
animations.idle_grid.up = anim8.newGrid(16, 16, player.idle_sheet.up:getWidth(), player.idle_sheet.up:getHeight())

-- Idle left
animations.idle_grid.left = anim8.newGrid(16, 16, player.idle_sheet.left:getWidth(), player.idle_sheet.left:getHeight())

-- Idle right
animations.idle_grid.right = anim8.newGrid(16, 16, player.idle_sheet.right:getWidth(), player.idle_sheet.right:getHeight())

-- Animations
animations.idle = {}
animations.idle.down = anim8.newAnimation(animations.idle_grid.down('1-6', 1), 0.2)


-- Merge the animations table with the player table
setmetatable(player, animations)
return player