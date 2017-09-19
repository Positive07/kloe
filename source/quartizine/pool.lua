local object = require 'quartizine.lib.classic'
local lume = require 'quartizine.lib.lume'

local pool = object:extend()

-- main API --

function pool:new()
	self._entities = {}
end

function pool:add(entity)
	table.insert(self._entities, entity)
	return entity
end

function pool:get(f)
	if f then
		return lume.filter(self._entities, f)
	else
		return self._entities
	end
end

function pool:call(event, ...)
	for i = 1, #self._entities do
		local entity = self._entities[i]
		if entity[event] then
			entity[event](entity, ...)
		end
	end
end

function pool:clear(f)
	self._entities = lume.reject(self._entities, f)
end

-- convenience functions --

function pool:update(dt)
	self:call('update', dt)
	self:clear(function(e) return e.remove end)
end

function pool:draw()
	self:call('draw')
end

return pool