local baton = require 'quartizine.lib.baton'
local cargo = require 'quartizine.lib.cargo'
local object = require 'quartizine.lib.classic'
local state = require 'quartizine.lib.gamestate'
local inspect = require 'quartizine.lib.inspect'
local lume = require 'quartizine.lib.lume'
local talkback = require 'quartizine.lib.talkback'
local timer = require 'quartizine.lib.timer'

local conversation = talkback.new()

local quartizine = {
	load = cargo.init,
	newObject = function() return object:extend() end,
	newTimer = timer.new,

	math = {
		clamp = lume.clamp,
		round = lume.round,
		sign = lume.sign,
		lerp = lume.lerp,
		choose = lume.randomchoice,
	},
	table = {
		inspect = inspect,
		remove = lume.remove,
	},
	input = {
		newPlayer = baton.new,
	},
	state = state,
	message = {
		listen = function(...) conversation:listen(...) end,
		say = function(...) return conversation:say(...) end,
		ignore = function(...) conversation:stopListening(...) end,
		newGroup = function(...) return conversation:newGroup(...) end,
	},
}

return quartizine