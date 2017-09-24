local game = {}

function game:enter()
	self.world = quartizine.world.newBumpWorld()
	self.world:add {
		entity = Class.Wall,
		rect = {0, 500, 800, 50}
	}
	self.world:add {
		entity = Class.Wall,
		rect = {0, 50, 50, 800}
	}
	self.world:add {
		entity = Class.Wall,
		rect = {750, 50, 50, 800}
	}
	self.world:add {
		entity = Class.Player,
		rect = {100, 100, 50, 50}
	}
end

function game:update(dt)
	self.world:update(dt)
end

function game:draw()
	self.world:draw()
end

return game