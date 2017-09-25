local lume = require 'kloe.lib.lume'

local World = {}

-- user-definable functions

function World:onAdd(entity, ...) end
function World:filter(entity) return entity.remove end
function World:onRemove(entity) end

-- main API --

function World:add(entity, ...)
	self:onAdd(entity, ...)
	table.insert(self._entities, entity)
	return entity
end

function World:get(f)
	if f then
		return lume.filter(self._entities, f)
	else
		return self._entities
	end
end

function World:call(event, ...)
	for i = 1, #self._entities do
		local entity = self._entities[i]
		if entity[event] then
			entity[event](entity, ...)
		end
	end
end

function World:clear(f)
	for i = #self._entities, 1, -1 do
		local entity = self._entities[i]
		if self:filter(entity) then
			self:onRemove(entity)
			table.remove(self._entities, i)
		end
	end
end

-- convenience functions --

function World:update(dt)
	self:call('update', dt)
	self:clear()
end

function World:draw()
	self:call('draw')
end

-- constructor

return function()
	return setmetatable({
		_entities = {},
	}, {
		__index = World,
	})
end