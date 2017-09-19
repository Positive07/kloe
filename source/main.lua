object = require 'lib.classic'
state = require 'lib.gamestate'
inspect = require 'lib.inspect'
lume = require 'lib.lume'
timer = require 'lib.timer'

game = require 'assets.state.game'

function love.load()
	state.registerEvents()
	state.switch(game)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end