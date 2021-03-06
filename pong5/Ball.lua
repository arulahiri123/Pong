
Ball = Class{}

function Ball : init(x, y, height, width)

    self.x = x
    self.y = y
    self.height = height
    self.width = width

    self.dx = math.random(2)==1 and 100 or -100
    self.dy = math.random(-50, 50)

end

function Ball : reset()

    self.x = VIRTUAL_WIDTH/2 -2
    self.y= VIRTUAL_HEIGHT/2 -2
    self.dx = math.random(2)==1 and 100 or -100
    self.dy = math.random(-50, 50)

end

function Ball : update(dt)

  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
end

function Ball : render()
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

end
