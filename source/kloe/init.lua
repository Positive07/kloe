local anim8 = require 'kloe.lib.anim8'
local baton = require 'kloe.lib.baton'
local cargo = require 'kloe.lib.cargo'
local class = require 'kloe.lib.classic'
local inspect = require 'kloe.lib.inspect'
local lume = require 'kloe.lib.lume'
local state = require 'kloe.lib.gamestate'
local talkback = require 'kloe.lib.talkback'
local timer = require 'kloe.lib.timer'
local vector = require 'kloe.lib.vector'

local world = require 'kloe.world'
local bumpWorld = require 'kloe.bumpworld'
local worldObject = require 'kloe.worldobject'
local bumpWorldObject = require 'kloe.bumpworldobject'

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