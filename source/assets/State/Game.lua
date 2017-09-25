local game = {}

function game:enter()
	self.world = kloe.world.newWorld()
	self.world:add(Class.Player(50, 50, 50, 50))
	self.world:add(Class.Player(50, 150, 50, 50))
	self.world:add(Class.Player(50, 250, 50, 50))
	self.world:add(Class.Player(50, 350, 50, 50))
end

function game:update(dt)
	self.world:update(dt)
end

function game:draw()
	self.world:draw()
end

return game