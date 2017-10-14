local player = kloe.class.newClass()

function player:new()

end

function player:update(dt)

end

function player:draw()
	kloe.graphics.print 'hello world!'
end

return player