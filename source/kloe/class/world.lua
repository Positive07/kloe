local Object = require 'kloe.lib.classic'
local lume = require 'kloe.lib.lume'

local World = Object:extend()

function World:_onAdd(entity, options) end
function World:_onRemove(entity) end

-- main API --

function World:new()
	self._entities = {}
end

function World:add(options)
	options.args = options.args or {}
	local entity = options.entity(self)
	self:_onAdd(entity, options)
	entity:start(unpack(options.args))
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
		if f(entity) then
			self:_onRemove(entity)
			table.remove(self._entities, i)
		end
	end
end

-- convenience functions --

function World:update(dt)
	self:call('update', dt)
	self:clear(function(e) return e.remove end)
end

function World:draw()
	self:call('draw')
end

return World