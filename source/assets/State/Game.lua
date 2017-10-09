local game = {}

function game:enter()
	self.world = kloe.world.newWorld()
end

function game:update(dt)
	self.world:update(dt)
end

function game:draw()
	self.world:draw()
end

return game