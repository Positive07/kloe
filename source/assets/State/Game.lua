local game = {}

function game:enter()
	self.world = quartizine.world.newBumpWorld()
	self.world:add(Class.Wall(self.world), 0, 500, 800, 50)
	self.world:add(Class.Wall(self.world), 0, 50, 50, 800)
	self.world:add(Class.Wall(self.world), 750, 50, 50, 800)
	self.world:add(Class.Player(self.world), 100, 100, 50, 50)
end

function game:update(dt)
	self.world:update(dt)
end

function game:draw()
	self.world:draw()
end

return game