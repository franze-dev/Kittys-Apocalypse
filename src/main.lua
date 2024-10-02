require "gameplayscene"
require "menu"
require "scenemanager"
require "credits"

function love.load()
  
  math.randomseed( os.time() )

  love.window.setTitle("cat vs zombies")
    
  love.graphics.setBackgroundColor(1, 1, 1)

  screenWidth, screenHeight = love.graphics.getDimensions()

  love.graphics.setDefaultFilter('nearest', 'nearest')
    
  Gameplay_Init()
  Menu_Init()
  Credits_Init()

end

function love.update(dt)
  
  if getCurrentScene() == scenes.gamePlay then
    Gameplay_Update(dt)
  end

  if getCurrentScene() == scenes.menuScene then
    Menu_Update()
  end

  if getCurrentScene() == scenes.creditsScene then
    Credits_Update()
  end

  if getCurrentScene() == scenes.overScene then
    print("quitttttt")
    love.event.quit()
  end

end

function love.draw()
  
  if getCurrentScene() == scenes.gamePlay then
    Gameplay_Draw()
  end

  
  if getCurrentScene() == scenes.menu then
    Menu_Draw()
  end

  if getCurrentScene() == scenes.creditsScene then
    Credits_Draw()
  end
end
