local bump = require 'kloe.lib.bump'
local lume = require 'kloe.lib.lume'

local world = require 'kloe.world'

local bumpWorld = world:extend()

function bumpWorld:new()
	bumpWorld.super.new(self)
	self._bump = bump.newWorld()
end

function bumpWorld:_onAdd(entity, options)
	if options.rect then
		self._bump:add(entity, unpack(options.rect))
	end
end

function bumpWorld:_onRemove(entity)
	if self._bump:hasItem(entity) then
		self._bump:remove(entity)
	end
end

function bumpWorld:getRect(entity)
	return self._bump:getRect(entity)
end

function bumpWorld:setRect(entity, x, y, w, h)
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