
push = require 'push'

Class = require 'class'

require 'Paddle'

require "Ball"


push = require "push"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

function love.load()
  -- body...
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Pong')

    math.randomseed(os.time())

    push: setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{
    fullscreen = false ,
    resizable = false ,
    vsync = true
  })



  small = love.graphics.newFont('font.ttf', 8)
  love.graphics.setFont(small)

  player1y = Paddle(10 , 30, 20, 5)
  player2y = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT-30, 20, 5)

  ball = Ball(VIRTUAL_WIDTH/2 -2, VIRTUAL_HEIGHT/2 - 2, 4, 4)

  gamestate = 'start'


end

function love.update(dt)
  -- body...
  if love.keyboard.isDown('w') then
    player1y.dy = - PADDLE_SPEED
  elseif love.keyboard.isDown('s') then
    player1y.dy = PADDLE_SPEED
  else
    player1y.dy=0
  end
  if love.keyboard.isDown('up') then
    player2y.dy = - PADDLE_SPEED
  elseif love.keyboard.isDown('down') then
    player2y.dy = PADDLE_SPEED
  else
    player2y.dy = 0
  end

  if gamestate =='play' then
      ball:update(dt)
  end
  player1y:update(dt)
  player2y:update(dt)

end


function love.keypressed(key)
  -- body...
  if key == 'escape' then
    love.event.quit()
  elseif key =='return' or key == 'enter' then
        if gamestate =='start' then
          gamestate = 'play'
        else
          gamestate = 'start'

          ball:reset()
        end
  end


end

function love.draw()
  -- body...
  push : apply('start')

  --love.graphics.clear(70, 45, 52, 20)

  if gamestate =='start'then
    love.graphics.printf('Hello Start state', 0, 20, VIRTUAL_WIDTH, 'center')
  else
    love.graphics.printf('Hello play state', 0, 20, VIRTUAL_WIDTH, 'center')
  end
  player1y:render()
  player2y:render()
  displayFPS()
  ball: render()

  push : apply('end')
end


function displayFPS()
  love.graphics.setFont(small)
  love.graphics.setColor(0, 100, 0, 200)
  love.graphics.print("FPS   : "..tostring(love.timer.getFPS()), 10,10)

end
