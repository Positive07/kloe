local player = object:extend()

function player:new(x, y)
	self.x = x
	self.y = y
end

function player:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', self.x, self.y, 50, 50)
end

return player