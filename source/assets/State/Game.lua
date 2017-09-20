local game = {}

function game:enter()
	self.world = quartizine.world.newWorld()
	self.world:add(Class.Player(100, 100))
	self.world:add(Class.Player(150, 100))
	self.world:add(Class.Player(100, 150))
	self.world:add(Class.Player(200, 400))
end

function game:update(dt)
	self.world:update(dt)
end

function game:keypressed(key)
	local entities = self.world:get()
	if #entities > 0 and key == 'space' then
		entities[love.math.random(#entities)].remove = true
	end
end

function game:draw()
	self.world:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.print(#self.world:get(function(e) return e.asdf > 5 end))
end

return game