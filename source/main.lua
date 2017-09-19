quartizine = require 'quartizine'

game = require 'assets.state.game'

function love.load()
	quartizine.state.registerEvents()
	quartizine.state.switch(game)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end