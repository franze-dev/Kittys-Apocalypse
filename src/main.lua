require "gameplayscene"

local scene =
{
  gamePlay = true,
  menu = false,
  paused = false,
  over = false,
}

function love.load()
  
  math.randomseed( os.time() )

  love.window.setTitle("cat vs zombies")
    
  love.graphics.setBackgroundColor(1, 1, 1)

  screenWidth, screenHeight = love.graphics.getDimensions()

  --A table can act like a struct.
    
  love.graphics.setDefaultFilter('nearest', 'nearest')
    
  Init()
end

function love.update(dt)
  
  if scene.gamePlay then
    Update(dt)
  end
end

function love.draw()
  
  if scene.gamePlay then
    Draw()
  end
end
