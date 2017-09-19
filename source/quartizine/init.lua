local baton = require 'quartizine.lib.baton'
local object = require 'quartizine.lib.classic'
local state = require 'quartizine.lib.gamestate'
local inspect = require 'quartizine.lib.inspect'
local lume = require 'quartizine.lib.lume'
local timer = require 'quartizine.lib.timer'

local quartizine = {
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
}

return quartizine