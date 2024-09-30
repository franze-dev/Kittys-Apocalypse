function love.load()
  
    love.window.setTitle("spaceship")
    
    love.graphics.setBackgroundColor(1, 1, 1)

    --A table can act like a struct.
    zombie = {}

    love.graphics.setDefaultFilter('nearest', 'nearest')

    zombie.spriteSheet = love.graphics.newImage("res/Zombie.png")
    zombie.dimensions = 32;
    zombie.sprite = love.graphics.newQuad(0, zombie.dimensions*2, zombie.dimensions, zombie.dimensions, zombie.spriteSheet:getDimensions())
    zombie.spriteDimension = {}
    zombie.spriteDimension.width = zombie.dimensions;
    zombie.spriteDimension.height = zombie.dimensions;
    
    local screenWidth, screenHeight = love.graphics.getDimensions()

    targetX = screenWidth/2;
    targetY = screenHeight/2;
    
    zombie.x = 0
    zombie.y = 0
    zombie.angle = 0
    zombie.speed = 300.0
    zombie.scale = 3;
  
  end
  
  
  function love.update(dt)
   
    local centerX, centerY = (zombie.spriteDimension.width*zombie.scale) / 2, (zombie.spriteDimension.height*zombie.scale) / 2 -- get center point

    centerX = zombie.x + centerX
    centerY = zombie.y + centerY

    math.floor(centerX)
    math.floor(centerY)
    math.floor(targetX)
    math.floor(targetY)

    errorMargin = 5

    if centerX < targetX - errorMargin then
    zombie.x = zombie.x + zombie.speed * dt
    end

    if centerX > targetX + errorMargin then
      zombie.x = zombie.x - zombie.speed * dt
    end
   
    if centerY < targetY - errorMargin then
      zombie.y = zombie.y + zombie.speed * dt
    end

    if centerY > targetY + errorMargin then
      zombie.y = zombie.y - zombie.speed * dt
    end

    -- if love.keyboard.isDown("right") then
    --   posX = posX + speed * dt
    -- end
    
    -- if love.keyboard.isDown("left") then
    --   posX = posX - speed * dt
    -- end
    
    -- if love.keyboard.isDown("up") then
    --   posY = posY - speed * dt
    -- end
    
    -- if love.keyboard.isDown("down") then
    --   posY = posY + speed * dt
    -- end
    
  end
  
  
  function love.draw()
    
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(zombie.spriteSheet, zombie.sprite, zombie.x, zombie.y, zombie.angle, zombie.scale)
    love.graphics.setColor(1,0,0)
    love.graphics.circle("fill", targetX, targetY, 5)
    
  end
  