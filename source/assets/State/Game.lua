local game = {}

function game:enter()
	self.world = kloe.world.newWorld()
	self.world:add(Class.Player(vec2(50, 50), vec2(50, 50)))
	self.world:add(Class.Player(vec2(50, 150), vec2(50, 50)))
	self.world:add(Class.Player(vec2(50, 250), vec2(50, 50)))
	self.world:add(Class.Player(vec2(50, 350), vec2(50, 50)))
end

function game:update(dt)
	self.world:update(dt)
end

function game:draw()
	self.world:draw()
end

return game