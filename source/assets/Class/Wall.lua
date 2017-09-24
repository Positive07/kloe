local wall = quartizine.class.newClass()

function wall:new(world)
	self.world = world
end

function wall:draw()
	local x, y, w, h = self.world:getRect(self)
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', x, y, w, h)
end

return wall