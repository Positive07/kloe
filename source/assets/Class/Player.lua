local player = kloe.class.newClass()

function player:new(position, size)
	self.position, self.size = position, size
end

function player:update(dt)
	local speed = 100*dt
	if input:down 'left' then self.position.x = self.position.x - speed end
	if input:down 'right' then self.position.x = self.position.x + speed end
	if input:down 'up' then self.position.y = self.position.y - speed end
	if input:down 'down' then self.position.y = self.position.y + speed end

	if love.math.random(1, 100) == 1 then self.remove = true end
end

function player:draw()
	love.graphics.setColor(255, 255, 255)
	kloe.graphics.rectangleV('fill', self.position, self.size)
end

return player