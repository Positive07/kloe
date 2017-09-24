local Object = require 'kloe.lib.classic'

local WorldObject = Object:extend()

function WorldObject:new(world)
	self.world = world
end

function WorldObject:start() end

return WorldObject