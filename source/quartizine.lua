local object = require 'lib.classic'
local state = require 'lib.gamestate'
local inspect = require 'lib.inspect'
local lume = require 'lib.lume'
local timer = require 'lib.timer'

quartizine = {
	newObject = function()
		return object:extend()
	end,
	newTimer = timer.new,
	state = state,
	table = {
		inspect = inspect,
	},
}

return quartizine