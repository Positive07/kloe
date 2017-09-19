local baton = require 'lib.baton'
local object = require 'lib.classic'
local state = require 'lib.gamestate'
local inspect = require 'lib.inspect'
local lume = require 'lib.lume'
local timer = require 'lib.timer'

quartizine = {
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