local game = {}

function game:enter()
	self.pool = quartizine.world.newPool()
	self.pool:add(Object.Player(100, 100))
	self.pool:add(Object.Player(150, 100))
	self.pool:add(Object.Player(100, 150))
	self.pool:add(Object.Player(200, 400))
end

function game:update(dt)
	self.pool:update(dt)
end

function game:keypressed(key)
	local entities = self.pool:get()
	if #entities > 0 and key == 'space' then
		entities[love.math.random(#entities)].remove = true
	end
end

function game:draw()
	self.pool:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.print(#self.pool:get(function(e) return e.asdf > 5 end))
end

return game