require "characters"
require "scenemanager"

function Gameplay_Init()
  
  gameBackground = "res/sprites/background.png"
  pauseFont = "res/fonts/BOYCOTT.ttf"

  zombieId = 0
  animations = {}
  animations.fps = 30
  animations.timer = 1/animations.fps
  animations.xOffSet = 0
  
  zombieCoolDown = 1
  zombieAttackTimer = 1/zombieCoolDown 
  groups = 2
  
  zombies = {}
  
  local posX, posY = getRandomZombieSpawn()
  
  for i = 1, groups do
    table.insert(zombies, i, newZombie(posX,posY))
  end
  
  cat = newCat()

  local padding = 20

  pauseButtonColor = {
    r = 1.0,
    g = 0.5,
    b = 0.0,
    a = 1.0
  }

  pauseHighlightColor = {
    r = 0.6,
    g = 0.0,
    b = 0.0,
    a = 0.7
  }

  pauseTextColor = {
    r = 1.0,
    g = 1.0,
    b = 1.0,
    a = 1.0
  }

  pauseButton = newButton("PAUSE", pauseFont, padding, padding, 60, 30, pauseButtonColor, pauseHighlightColor, pauseTextColor)


end

function Gameplay_Update(dt)
  
  checkSceneChange(pauseButton, scenes.pausedScene)

  zombieAttackTimer = zombieAttackTimer - dt
  if #zombies == 0 or zombieAttackTimer <= 0 then
    if zombieAttackTimer <= 0 then
      zombieAttackTimer = 1/zombieCoolDown
    end
    for i = 1, groups do
      local posX, posY = getRandomZombieSpawn()
      table.insert(zombies, i, newZombie(posX,posY))
    end
  end
    
  for i = 1, #zombies do
    --time between each animation
    animations.timer = animations.timer - dt
    animate(zombies[i], zombies[i].dimensions*2)
  end
  animations.timer = animations.timer - dt

  animate(cat, dt)
    
  for i = 1, #zombies do
    myZomb = zombies[i]
    checkZombieShot(myZomb, i)
  end

  for i = 1,  #zombies do
    moveZombie(zombies[i], dt)
  end
    
  for i = 1, #zombies do
    myZomb = zombies[i]
    checkCatHit(myZomb, i)
  end

  for i = 1, #zombies do
    if zombies[i].x ~= cat.x then
      if (zombies[i].x > cat.x + cat.dimensions and zombies[i].scale1 < 0) or (zombies[i].x < cat.x  and zombies[i].scale1 > 0) then
        zombies[i].scale1 = zombies[i].scale1 * -1
      end
    end
  end

end

function Gameplay_Draw()
  drawBackground(gameBackground)

  love.graphics.setColor(1, 1, 1)

  for i = 1, #zombies do
    love.graphics.draw(zombies[i].spriteSheet.sheet, zombies[i].sprite, zombies[i].x, zombies[i].y, zombies[i].angle, -zombies[i].scale1, zombies[i].scale2)
  end
  
  love.graphics.draw(cat.spriteSheet.sheet, cat.sprite, cat.x, cat.y, cat.angle, cat.scale)
  love.graphics.setColor(1,0,0)

  drawButton(pauseFont, pauseButton)

end