local player = require 'assets.object.player'

local game = {}

function game:enter()
	self.player = player(100, 100)
end

function game:draw()
	self.player:draw()
end

return game