-- load quartizine
quartizine = require 'quartizine'

-- define controls (see https://github.com/tesselode/baton for details)
local controls = {
	left = {'key:left', 'axis:leftx-', 'button:dpleft'},
	right = {'key:right', 'axis:leftx+', 'button:dpright'},
	up = {'key:up', 'axis:lefty-', 'button:dpup'},
	down = {'key:down', 'axis:lefty+', 'button:dpdown'},
}
-- create an input object
input = quartizine.input.newPlayer(controls,
	love.joystick.getJoysticks()[1])

function love.load()
	-- load assets
	Object = quartizine.load 'assets/Object'
	State = quartizine.load 'assets/State'

	-- initialize states and go to the game state
	quartizine.state.registerEvents()
	quartizine.state.switch(State.Game)
end

function love.update(dt)
	-- update the input object
	input:update()
end

function love.keypressed(key)
	-- quite on escape
	if key == 'escape' then
		love.event.quit()
	end
end