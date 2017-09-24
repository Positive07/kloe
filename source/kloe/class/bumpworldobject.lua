local WorldObject = require 'kloe.class.worldobject'

local BumpWorldObject = WorldObject:extend()

function BumpWorldObject:getRect()
	return self.world:getRect(self)
end

function BumpWorldObject:setRect(x, y, w, h)
	return self.world:setRect(self, x, y, w, h)
end

function BumpWorldObject:move(goalX, goalY, filter)
	return self.world:move(self, goalX, goalY, filter)
end

function BumpWorldObject:check(goalX, goalY, filter)
	return self.world:check(self, goalX, goalY, filter)
end

return BumpWorldObject