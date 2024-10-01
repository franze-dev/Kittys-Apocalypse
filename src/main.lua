require "gameplayscene"
require "scenemanager"

function love.load()
  
  math.randomseed( os.time() )

  love.window.setTitle("cat vs zombies")
    
  love.graphics.setBackgroundColor(1, 1, 1)

  screenWidth, screenHeight = love.graphics.getDimensions()

  --A table can act like a struct.
    
  love.graphics.setDefaultFilter('nearest', 'nearest')
    
  Gameplay_Init()
end

function love.update(dt)
  
  print(getCurrentScene())
  if getCurrentScene() == scenes.gamePlay then
    Gameplay_Update(dt)
  end
end

function love.draw()
  
  if getCurrentScene() == scenes.gamePlay then
    Gameplay_Draw()
  end
end
