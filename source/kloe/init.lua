local anim8 = require 'kloe.lib.anim8'
local baton = require 'kloe.lib.baton'
local cargo = require 'kloe.lib.cargo'
local inspect = require 'kloe.lib.inspect'
local lume = require 'kloe.lib.lume'
local object = require 'kloe.lib.classic'
local ochre = require 'kloe.lib.ochre'
local state = require 'kloe.lib.gamestate'
local talkback = require 'kloe.lib.talkback'
local timer = require 'kloe.lib.timer'
local vector = require 'kloe.lib.vector'

local conversation = talkback.new()

local kloe = {
	assets = {
		load = cargo.init,
	},
	class = {
		newClass = function() return object:extend() end
	},
	-- wrap love.graphics to accept vector arguments
	graphics = setmetatable({}, {
		__index = function(t, k)
			return function(...)
				local args = {...}
				local newArgs = {}
				for _, arg in ipairs(args) do
					if vector.isvector(arg) then
						table.insert(newArgs, arg.x)
						table.insert(newArgs, arg.y)
					else
						table.insert(newArgs, arg)
					end
				end
				love.graphics[k](unpack(newArgs))
			end
		end,
	}),
	input = {
		newPlayer = baton.new,
	},
	math = {
		clamp = lume.clamp,
		round = lume.round,
		sign = lume.sign,
		lerp = lume.lerp,
		choose = lume.randomchoice,
		newVector = vector,
	},
	message = {
		listen = function(...) conversation:listen(...) end,
		say = function(...) return conversation:say(...) end,
		ignore = function(...) conversation:stopListening(...) end,
		newGroup = function(...) return conversation:newGroup(...) end,
	},
	state = state,
	table = {
		inspect = inspect,
		remove = lume.remove,
	},
	timer = {
		newTimer = timer.new,
	},
	world = {
		newWorld = function() return ochre.new(ochre.systems.simple) end,
	},
}

return kloe