
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
    
  gamePlayInit()
end
  


function love.update(dt)
  
  if scene.gamePlay then
    gamePlayUpdate(dt)
  end
end

function love.draw()
  
  if scene.gamePlay then
    gamePlayDraw()
  end
end

function gamePlayDraw()
  love.graphics.setColor(1, 1, 1)
  for i = 1, #zombies do
    if zombies[i].x < cat.x then
    love.graphics.draw(zombies[i].spriteSheet.sheet, zombies[i].sprite, zombies[i].x, zombies[i].y, zombies[i].angle, zombies[i].scale)
    else 
      love.graphics.draw(zombies[i].spriteSheet.sheet, zombies[i].sprite, zombies[i].x, zombies[i].y, zombies[i].angle, -zombies[i].scale, zombies[i].scale)
    end
  end

  love.graphics.draw(cat.spriteSheet.sheet, cat.sprite, cat.x, cat.y, cat.angle, cat.scale)
  love.graphics.setColor(1,0,0)
end

function gamePlayUpdate(dt)
  
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
  
  for i = 1,  #zombies do
    moveZombie(zombies[i], dt)
  end

  for i = 1, #zombies do
    myZomb = zombies[i]
    checkZombieShot(myZomb, i)
  end

  for i = 1, #zombies do
    myZomb = zombies[i]
    checkCatHit(myZomb, i)
  end

end

function gamePlayInit()
  
  zombieId = 0;
  animations = {}
  animations.fps = 30;
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

  cat = {}
  cat.spriteSheet = {}
  cat.spriteSheet.sheet = love.graphics.newImage("res/IdleCatt.png")
  cat.spriteSheet.frames = 6
  cat.spriteSheet.currentFrame = 0
  cat.dimensions = 32;
  cat.sprite = love.graphics.newQuad(0, 0, cat.dimensions, cat.dimensions, cat.spriteSheet.sheet:getDimensions())
  cat.spriteDimension = {}
  cat.spriteDimension.width = cat.dimensions;
  cat.spriteDimension.height = cat.dimensions;
  
  cat.scale = 3;
  -- where the zombie will run
  targetX = screenWidth /2;
  targetY = screenHeight/2;
  cat.x = targetX - (cat.spriteDimension.width*cat.scale)/2
  cat.y = targetY - (cat.spriteDimension.height*cat.scale) / 2
  cat.angle = 0
  cat.speed = 300.0
end

function animate(character, moveY)
  
  if animations.timer <= 0 then
    
    animations.timer = 1/animations.fps
    character.spriteSheet.currentFrame = character.spriteSheet.currentFrame + 1
    
    if(character.spriteSheet.currentFrame > character.spriteSheet.frames) then
      --back to the first frame
      character.spriteSheet.currentFrame = 0
    end
    
    animations.xOffSet = character.dimensions * character.spriteSheet.currentFrame
    
    character.sprite:setViewport(animations.xOffSet, moveY, character.dimensions, character.dimensions)
    
  end
end

function newZombie(x, y)
  local zombie = {}

  zombieId = zombieId + 1
  zombie.id = zombieId
  zombie.spriteSheet = {}
  zombie.spriteSheet.sheet = love.graphics.newImage("res/Zombie.png")
  zombie.spriteSheet.frames = 7
  zombie.spriteSheet.currentFrame = 0
  zombie.dimensions = 32;
  zombie.sprite = love.graphics.newQuad(0, zombie.dimensions*2, zombie.dimensions, zombie.dimensions, zombie.spriteSheet.sheet:getDimensions())
  zombie.spriteDimension = {}
  zombie.spriteDimension.width = zombie.dimensions;
  zombie.spriteDimension.height = zombie.dimensions;
  
  zombie.x = x
  zombie.y = y
  zombie.angle = 0
  local randomSpeed = math.random(100, 300);
  zombie.speed = randomSpeed
  zombie.scale = 3;

  return zombie
end

function moveZombie(zombie, dt)
  local centerX, centerY = (zombie.spriteDimension.width*zombie.scale) / 2, (zombie.spriteDimension.height*zombie.scale) / 2 -- get center point

  centerX = zombie.x + centerX
  centerY = zombie.y + centerY

  math.floor(centerX)
  math.floor(centerY)
  math.floor(targetX)
  math.floor(targetY)

  errorMargin = 5

  closeArea = targetX - 50

  if centerX < targetX - errorMargin then
    zombie.x = zombie.x + zombie.speed * dt
  end

  if centerX > targetX + errorMargin then
    zombie.x = zombie.x - zombie.speed * dt
  end
  
  if centerY < targetY - errorMargin then
    zombie.y = zombie.y + (zombie.speed/2) * dt
  end
  
  if centerY > targetY + errorMargin then
    zombie.y = zombie.y - (zombie.speed/2) * dt
  end

end

function checkZombieShot(myZombie, pos)

  if myZombie then
    local mousePosX, mousePosY = love.mouse.getPosition()

    local leftClick = 1

    local zombieCorners = {}

    zombieCorners.first = {} 
    zombieCorners.second = {} 
    zombieCorners.third = {} 
    zombieCorners.fourth = {} 

    if myZombie.x >= cat.x then
      zombieCorners.first = {
        x = myZombie.x - myZombie.dimensions*myZombie.scale,
        y = myZombie.y
      }
      zombieCorners.second = {
        x = myZombie.x,
        y = myZombie.y

      }
      zombieCorners.third = {
        x = myZombie.x - myZombie.dimensions*myZombie.scale,
        y = myZombie.y + myZombie.dimensions*myZombie.scale
      }
      zombieCorners.fourth = {
        x = myZombie.x,
        y = myZombie.y + myZombie.dimensions*myZombie.scale
      }
    elseif myZombie.x < cat.x then
      zombieCorners.first = {
        x = myZombie.x,
        y = myZombie.y
      }
      zombieCorners.second = {
        x = myZombie.x + myZombie.dimensions*myZombie.scale,
        y = myZombie.y

      }
      zombieCorners.third = {
        x = myZombie.x,
        y = myZombie.y + myZombie.dimensions*myZombie.scale
      }
      zombieCorners.fourth = {
        x = myZombie.x + myZombie.dimensions*myZombie.scale,
        y = myZombie.y + myZombie.dimensions*myZombie.scale
      }
    end


    if mousePosX >= zombieCorners.first.x and mousePosX <= zombieCorners.second.x and mousePosY >= zombieCorners.first.y and mousePosY <= zombieCorners.fourth.y then
      if love.mouse.isDown(leftClick) then
        table.remove(zombies, pos)
      end
    end
  end
  
end

function checkCatHit(myZombie, pos)

  if myZombie then
    if (myZombie.x + myZombie.dimensions*myZombie.scale >= cat.x and myZombie.x <= cat.x + cat.dimensions*cat.scale) and (myZombie.y + myZombie.dimensions*myZombie.scale >= cat.y and myZombie.y <= cat.y + cat.dimensions*cat.scale) then
    
      table.remove(zombies, pos)
  
    end
  end
end

function getRandomZombieSpawn()
  local zombieSpawn = {
    above = 1,
    under = 2,
    left = 3,
    right = 4
  }
  
  local posX, posY = 0, 0

  local randomPos = math.random(zombieSpawn.above, zombieSpawn.right)

  local randomRange1, randomRange2 = 100, 500

  if randomPos == zombieSpawn.left then
    posX = 0;
    posY = math.random(randomRange1,randomRange2)
  elseif randomPos == zombieSpawn.right then
    posX = screenWidth - 32
    posY = math.random(randomRange1, randomRange2)
  elseif randomPos == zombieSpawn.above then
    posY = 0
    posX = math.random(randomRange1, randomRange2)
  elseif randomPos == zombieSpawn.under then
    posY = screenHeight- 32
    posX = math.random(randomRange1, randomRange2)
  end

  return posX, posY
  
end