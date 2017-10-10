-- load kloe
kloe = require 'kloe'

-- shortcuts
vector = kloe.math.newVector
kg = kloe.graphics

-- create an input object
input = kloe.input.newPlayer {
	controls = {
		left = {'key:left', 'axis:leftx-', 'button:dpleft'},
		right = {'key:right', 'axis:leftx+', 'button:dpright'},
		up = {'key:up', 'axis:lefty-', 'button:dpup'},
		down = {'key:down', 'axis:lefty+', 'button:dpdown'},
		action = {'key:x', 'button:a'},
	},
	pairs = {
		move = {'left', 'right', 'up', 'down'}
	},
	joystick = love.joystick.getJoysticks()[1],
}

-- load assets
setmetatable(_G, {__index = kloe.assets.load 'assets'})

function love.load()
	-- initialize states and go to the game state
	kloe.state.registerEvents()
	kloe.state.switch(State.Game)
end

function love.update(dt)
	-- update the input object
	input:update()
end

function love.keypressed(key)
	-- quit on escape
	if key == 'escape' then
		love.event.quit()
	end
end