local player = kloe.class.newClass()

function player:new(position, size)
	self.position, self.size = position, size
end

function player:update(dt)
	self.position = self.position + vec2(input:get 'move') * 400 * dt
end

function player:draw()
	lg.setColor(255, 255, 255)
	kg.rectangle('fill', self.position, self.size)
end

return player