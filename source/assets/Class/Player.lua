local player = quartizine.class.newClass()

function player:new(world)
	self.world = world

	self.vx = 0
	self.vy = 0
end

function player:isOnGround()
	local x, y = self.world:getRect(self)
	local _, _, cols = self.world:check(self, x, y + 1, function(_, other)
		if other:is(Class.Wall) then
			return 'slide'
		end
		return false
	end)
	for i = 1, #cols do
		local col = cols[i]
		-- landing
		if col.normal.y < 0 then
			return true
		end
	end
	return false
end

function player:update(dt)
	if self:isOnGround() then
		self.vy = 0
		-- jumping
		if input:pressed 'up' then
			self.vy = -500
		end
	else
		-- gravity
		self.vy = self.vy + 500 * dt
	end

	-- running
	if input:down 'left' then self.vx = self.vx - 500 * dt end
	if input:down 'right' then self.vx = self.vx + 500 * dt end

	-- apply movement
	local x, y = self.world:getRect(self)
	local _, _, cols = self.world:move(self, x + self.vx * dt, y + self.vy * dt)

	-- check for collisions
	for i = 1, #cols do
		local col = cols[i]
		if col.other:is(Class.Wall) then
			if col.normal.x ~= 0 then
				self.vx = 0
			end
		end
	end
end

function player:draw()
	local x, y, w, h = self.world:getRect(self)
	love.graphics.setColor(255, 255, 0)
	love.graphics.rectangle('fill', x, y, w, h)
	love.graphics.print(tostring(self:isOnGround()))
	love.graphics.print(tostring(self.vx), 0, 16)
end

return player