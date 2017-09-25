-- load kloe
kloe = require 'kloe'

-- define controls (see https://github.com/tesselode/baton for details)
local controls = {
	left = {'key:left', 'axis:leftx-', 'button:dpleft'},
	right = {'key:right', 'axis:leftx+', 'button:dpright'},
	up = {'key:up', 'axis:lefty-', 'button:dpup'},
	down = {'key:down', 'axis:lefty+', 'button:dpdown'},
}
-- create an input object
input = kloe.input.newPlayer(controls, love.joystick.getJoysticks()[1])

function love.load()
	-- load assets
	Class = kloe.assets.load 'assets/Class'
	State = kloe.assets.load 'assets/State'

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