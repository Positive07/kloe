local anim8 = require 'quartizine.lib.anim8'
local baton = require 'quartizine.lib.baton'
local cargo = require 'quartizine.lib.cargo'
local class = require 'quartizine.lib.classic'
local inspect = require 'quartizine.lib.inspect'
local lume = require 'quartizine.lib.lume'
local state = require 'quartizine.lib.gamestate'
local talkback = require 'quartizine.lib.talkback'
local timer = require 'quartizine.lib.timer'
local vector = require 'quartizine.lib.vector'

local world = require 'quartizine.world'
local bumpWorld = require 'quartizine.bumpworld'
local worldObject = require 'quartizine.worldobject'
local bumpWorldObject = require 'quartizine.bumpworldobject'

local conversation = talkback.new()

return {
	assets = {
		load = cargo.init,
	},
	class = {
		newClass = function() return class:extend() end,
	},
	graphics = {
		newGrid = anim8.newGrid,
		newAnimation = anim8.newAnimation,
	},
	input = {
		newPlayer = baton.new,
	},
	math = {
		clamp = lume.clamp,
		round = lume.round,
		sign = lume.sign,
		lerp = lume.lerp,
		choose = lume.randomchoice,
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
	vector = {
		newVector = vector,
	},
	world = {
		newWorld = function() return world() end,
		newBumpWorld = function() return bumpWorld() end,
		newWorldObject = function() return worldObject:extend() end,
		newBumpWorldObject = function() return bumpWorldObject:extend() end,
	},
}