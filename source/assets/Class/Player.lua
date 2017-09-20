local player = quartizine.class.newClass()

function player:new(x, y)
	self.x = x
	self.y = y
	self.asdf = love.math.random(10)
end

function player:update(dt)
	local speed = 100 * dt
	if input:down 'left' then self.x = self.x - speed end
	if input:down 'right' then self.x = self.x + speed end
	if input:down 'up' then self.y = self.y - speed end
	if input:down 'down' then self.y = self.y + speed end
end

function player:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', self.x, self.y, 50, 50)
end

return player