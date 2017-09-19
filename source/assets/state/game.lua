local game = {}

function game:enter()
	self.player = Object.Player(100, 100)
end

function game:update(dt)
	self.player:update(dt)
end

function game:draw()
	self.player:draw()
end

return game