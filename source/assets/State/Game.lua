local game = {}

local v = kloe.vector.newVector

function game:enter()
	self.world = kloe.world.newWorld()
	self.world:add(Class.Player(v(50, 50), v(50, 50)))
	self.world:add(Class.Player(v(50, 150), v(50, 50)))
	self.world:add(Class.Player(v(50, 250), v(50, 50)))
	self.world:add(Class.Player(v(50, 350), v(50, 50)))
end

function game:update(dt)
	self.world:update(dt)
end

function game:draw()
	self.world:draw()
end

return game