
local player = {}

player.spritesheet = love.graphics.newImage("Player/char_spritesheet.png")
player.grid = anim8.newGrid(32, 32,player.spritesheet:getWidth(), player.spritesheet:getHeight())

player.animations = {}
player.animations.down = anim8.newAnimation(player.grid('1-6', 1), 0.2)

return player