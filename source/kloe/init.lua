-- libraries
local anim8 = require 'kloe.lib.anim8'
local baton = require 'kloe.lib.baton'
local bump = require 'kloe.lib.bump'
local cargo = require 'kloe.lib.cargo'
local hc = require 'kloe.lib.hc'
local inspect = require 'kloe.lib.inspect'
local lume = require 'kloe.lib.lume'
local object = require 'kloe.lib.classic'
local ochre = require 'kloe.lib.ochre'
local push = require 'kloe.lib.push'
local state = require 'kloe.lib.gamestate'
local talkback = require 'kloe.lib.talkback'
local timer = require 'kloe.lib.timer'
local vector = require 'kloe.lib.vector'

-- secrets
local _players = {}
local _screenSetup = false

local _kloePre = {}

function _kloePre:update(dt)
	-- update baton players
	for _, player in ipairs(_players) do
		player:update()
	end
end

function _kloePre:draw()
	if _screenSetup then
		push:start()
	end
end

function _kloePre:resize(w, h)
	push:resize(w, h)
end

local _kloePost = {}

function _kloePost:draw()
	if _screenSetup then
		push:finish()
	end
end

-- public API
local kloe = {
	animation = anim8,
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
		newPlayer = function(...)
			-- internally keep track of baton players
			local player = baton.new(...)
			table.insert(_players, player)
			return player
		end,
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
		listen = function(...) return talkback:listen(...) end,
		say = function(...) return talkback:say(...) end,
		ignore = function(...) return talkback:ignore(...) end,
		reset = function(...) return talkback:reset(...) end,
		newGroup = function(...) return talkback:newGroup(...) end,
	},
	physics = {
		newBumpWorld = bump.newWorld,
		newHcWorld = hc.new,
	},
	screen = {
		setup = function(...)
			push:setupScreen(...)
			_screenSetup = true
		end,
		switchFullscreen = function(...) return push:switchFullscreen(...) end,
		toGame = function(...) return push:toGame(...) end,
		toReal = function(...) return push:toReal(...) end,
		getDimensions = function(...) return push:getDimensions(...) end,
		getWidth = function(...) return push:getWidth(...) end,
		getHeight = function(...) return push:getHeight(...) end,
	},
	state = state,
	table = {
		inspect = inspect,
		remove = lume.remove,
		all = lume.all,
		any = lume.any,
		filter = lume.filter,
		reject = lume.reject,
		match = lume.match,
		serialize = lume.serialize,
		deserialize = lume.deserialize,
		ripairs = lume.ripairs,
	},
	timer = {
		newTimer = timer.new,
	},
	world = {
		newWorld = ochre.new,
	},
}

-- set love callbacks to call _kloe, kloe, and state callbacks
local callbacks = {'draw', 'update'}
for callback, _ in pairs(love.handlers) do
	table.insert(callbacks, callback)
end
for _, callback in ipairs(callbacks) do
	love[callback] = function(...)
		if _kloePre[callback] then _kloePre[callback](...) end
		if kloe[callback] then kloe[callback](...) end
		kloe.state[callback](...)
		if _kloePost[callback] then _kloePost[callback](...) end
	end
end

-- switch to an empty state to avoid gamestate errors
kloe.state.switch {}

return kloe