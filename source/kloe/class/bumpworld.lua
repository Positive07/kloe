local bump = require 'kloe.lib.bump'
local lume = require 'kloe.lib.lume'

local World = require 'kloe.class.world'

local BumpWorld = World:extend()

function BumpWorld:new()
	BumpWorld.super.new(self)
	self._bump = bump.newWorld()
end

function BumpWorld:_onAdd(entity, options)
	if options.rect then
		self._bump:add(entity, unpack(options.rect))
	end
end

function BumpWorld:_onRemove(entity)
	if self._bump:hasItem(entity) then
		self._bump:remove(entity)
	end
end

function BumpWorld:getRect(entity)
	return self._bump:getRect(entity)
end

function BumpWorld:setRect(entity, x, y, w, h)
	self._bump:update(entity, x, y, w, h)
end

function BumpWorld:move(entity, goalX, goalY, filter)
	filter = filter or entity.filter
	return self._bump:move(entity, goalX, goalY, filter)
end

function BumpWorld:check(entity, goalX, goalY, filter)
	filter = filter or entity.filter
	return self._bump:check(entity, goalX, goalY, filter)
end

return BumpWorld