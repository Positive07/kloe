local player = kloe.class.newClass()

function player:new(x, y, w, h)
	self.x, self.y, self.w, self.h = x, y, w, h
end

function player:update(dt)
	local speed = 100*dt
	if input:down 'left' then self.x = self.x - speed end
	if input:down 'right' then self.x = self.x + speed end
	if input:down 'up' then self.y = self.y - speed end
	if input:down 'down' then self.y = self.y + speed end

	if love.math.random(1, 100) == 1 then self.remove = true end
end

function player:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

return player