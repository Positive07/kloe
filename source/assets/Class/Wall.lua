local wall = Sara.BumpWorldObject:extend()

function wall:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', self:getRect())
end

return wall