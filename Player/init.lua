
local player = {}

player.idle_sheet = love.graphics.newImage("Player/idle/idle_down.png")
player.run_sheet = love.graphics.newImage("Player/run/run_down.png")

-- Store animate frames
local animations = {}
animations.__index = animations

animations.idle_grid = anim8.newGrid(16, 16, player.idle_sheet:getWidth(), player.idle_sheet:getHeight())
animations.idle_anim = {}
animations.idle_anim.down = anim8.newAnimation(animations.idle_grid('1-6', 1), 0.2)

setmetatable(player, animations)

return player