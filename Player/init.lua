
local player = {}

player.idle_sheet = {}
player.run_sheet = {}

player.idle_sheet.down = love.graphics.newImage("Player/idle/idle_down.png")
player.run_sheet.down = love.graphics.newImage("Player/run/run_down.png")

player.x = 40
player.y = 25
player.speed = 300

player.collider = world:newBSGRectangleCollider(40, 25, 5, 10, 1)
player.collider:setFixedRotation(true)

-- Store animate frames
local animations = {}
animations.__index = animations

animations.idle_grid = {}

animations.idle_grid.down = anim8.newGrid(16, 16, player.idle_sheet.down:getWidth(), player.idle_sheet.down:getHeight())
animations.idle_anim = {}
animations.idle_anim.down = anim8.newAnimation(animations.idle_grid.down('1-6', 1), 0.2)


setmetatable(player, animations)

return player