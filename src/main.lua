require "gameplayscene"
require "menu"
require "scenemanager"

function love.load()
  
  math.randomseed( os.time() )

  love.window.setTitle("cat vs zombies")
    
  love.graphics.setBackgroundColor(1, 1, 1)

  screenWidth, screenHeight = love.graphics.getDimensions()

  love.graphics.setDefaultFilter('nearest', 'nearest')
    
  Gameplay_Init()
  Menu_Init()

end

function love.update(dt)
  
  if getCurrentScene() == scenes.gamePlay then
    Gameplay_Update(dt)
  end

  -- if getCurrentScene() == scenes.menu then
  --   Menu_Update()
  -- end

end

function love.draw()
  
  if getCurrentScene() == scenes.gamePlay then
    Gameplay_Draw()
  end

  
  if getCurrentScene() == scenes.menu then
    Menu_Draw()
  end

end
