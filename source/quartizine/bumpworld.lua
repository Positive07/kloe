local bump = require 'quartizine.lib.bump'
local lume = require 'quartizine.lib.lume'

local world = require 'quartizine.world'

local bumpWorld = world:extend()

function bumpWorld:new()
	bumpWorld.super.new(self)
	self._bump = bump.newWorld()
end

function bumpWorld:_onAdd(entity, x, y, w, h)
	if x and y and w and h then
		self._bump:add(entity, x, y, w, h)
	end
end

function bumpWorld:_onRemove(entity)
	if self._bump:hasItem(entity) then
		self._bump:remove(entity)
	end
end

function bumpWorld:setBoundingBox(entity, x, y, w, h)
	self._bump:update(entity, x, y, w, h)
end

function bumpWorld:move(entity, goalX, goalY, filter)
	filter = filter or entity.filter
	return self._bump:move(entity, goalX, goalY, filter)
end

function bumpWorld:check(entity, goalX, goalY, filter)
	filter = filter or entity.filter
	return self._bump:check(entity, goalX, goalY, filter)
end

return bumpWorld