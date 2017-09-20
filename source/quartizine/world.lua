local object = require 'quartizine.lib.classic'
local lume = require 'quartizine.lib.lume'

local world = object:extend()

-- main API --

function world:new()
	self._entities = {}
end

function world:add(entity)
	table.insert(self._entities, entity)
	return entity
end

function world:get(f)
	if f then
		return lume.filter(self._entities, f)
	else
		return self._entities
	end
end

function world:call(event, ...)
	for i = 1, #self._entities do
		local entity = self._entities[i]
		if entity[event] then
			entity[event](entity, ...)
		end
	end
end

function world:clear(f)
	self._entities = lume.reject(self._entities, f)
end

-- convenience functions --

function world:update(dt)
	self:call('update', dt)
	self:clear(function(e) return e.remove end)
end

function world:draw()
	self:call('draw')
end

return world