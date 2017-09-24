local worldObject = require 'kloe.worldobject'

local bumpWorldObject = worldObject:extend()

function bumpWorldObject:getRect()
	return self.world:getRect(self)
end

function bumpWorldObject:setRect(x, y, w, h)
	return self.world:setRect(self, x, y, w, h)
end

function bumpWorldObject:move(goalX, goalY, filter)
	return self.world:move(self, goalX, goalY, filter)
end

function bumpWorldObject:check(goalX, goalY, filter)
	return self.world:check(self, goalX, goalY, filter)
end

return bumpWorldObject