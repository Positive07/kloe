local wall = quartizine.world.newBumpWorldObject()

function wall:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', self:getRect())
end

return wall