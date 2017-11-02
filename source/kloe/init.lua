local kloePath = (...):gsub('%.init$', '')

-- libraries
local anim8 = require(kloePath .. '.lib.anim8')
local baton = require(kloePath .. '.lib.baton')
local bump = require(kloePath .. '.lib.bump')
local cargo = require(kloePath .. '.lib.cargo')
local hc = require(kloePath .. '.lib.hc')
local inspect = require(kloePath .. '.lib.inspect')
local lume = require(kloePath .. '.lib.lume')
local nata = require(kloePath .. '.lib.nata')
local object = require(kloePath .. '.lib.classic')
local push = require(kloePath .. '.lib.push')
local state = require(kloePath .. '.lib.gamestate')
local talkback = require(kloePath .. '.lib.talkback')
local timer = require(kloePath .. '.lib.timer')
local vector = require(kloePath .. '.lib.vector')

-- secrets
local players = {}
local screenSetup = false

local kloePre = {}

function kloePre:update(dt)
	-- update baton players
	for _, player in ipairs(players) do
		player:update()
	end
end

function kloePre:draw()
	if screenSetup then
		push:start()
	end
end

function kloePre:resize(w, h)
	push:resize(w, h)
end

local kloePost = {}

function kloePost:draw()
	if screenSetup then
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
			table.insert(players, player)
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
			screenSetup = true
		end,
		switchFullscreen = function(...) return push:switchFullscreen(...) end,
		toGame = function(...) return push:toGame(...) end,
		toReal = function(...) return push:toReal(...) end,
		getDimensions = function(...) return push:getDimensions(...) end,
		getWidth = function(...) return push:getWidth(...) end,
		getHeight = function(...) return push:getHeight(...) end,
	},
	state = {
		switch = gamestate.switch,
		current = gamestate.current,
		push = gamestate.push,
		pop = gamestate.pop,
	},
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
		newWorld = function(...) return nata(...) end,
	},
}

-- set love callbacks to call _kloe, kloe, and state callbacks
local callbacks = {'draw', 'update'}
for callback, _ in pairs(love.handlers) do
	table.insert(callbacks, callback)
end
for _, callback in ipairs(callbacks) do
	love[callback] = function(...)
		if kloePre[callback] then kloePre[callback](...) end
		if kloe[callback] then kloe[callback](...) end
		kloe.state[callback](...)
		if kloePost[callback] then kloePost[callback](...) end
	end
end

-- switch to an empty state to avoid gamestate errors
kloe.state.switch {}

return kloe