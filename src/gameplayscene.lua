require "characters"

function Gameplay_Init()
    
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
    cat.spriteSheet.sheet = love.graphics.newImage("res/sprites/IdleCatt.png")
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

function Gameplay_Update(dt)
    
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

function Gameplay_Draw()
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