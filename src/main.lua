function love.load()
  
    love.window.setTitle("spaceship")
    
    love.graphics.setBackgroundColor(1, 1, 1)

    --A table can act like a struct.
    spaceship = {}

    spaceship.sprite = love.graphics.newImage("res/Pulpo pez.png")
    
    local screenWidth, screenHeight = love.graphics.getDimensions()

    targetX = screenWidth/2;
    targetY = screenHeight/2;
    
    spaceship.x = 0
    spaceship.y = 0
    spaceship.angle = 0
    spaceship.speed = 300.0
  
  end
  
  
  function love.update(dt)
   
    local ox, oy = spaceship.sprite:getWidth() / 2, spaceship.sprite:getHeight() / 2 -- get center point

    centerX = spaceship.x + ox
    centerY = spaceship.y + oy

    math.floor(centerX)
    math.floor(centerY)
    math.floor(targetX)
    math.floor(targetY)

    errorMargin = 5

    if centerX < targetX - errorMargin then
    spaceship.x = spaceship.x + spaceship.speed * dt
    end

    if centerX > targetX + errorMargin then
      spaceship.x = spaceship.x - spaceship.speed * dt
    end
   
    if centerY < targetY - errorMargin then
      spaceship.y = spaceship.y + spaceship.speed * dt
    end

    if centerY > targetY + errorMargin then
      spaceship.y = spaceship.y - spaceship.speed * dt
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
    love.graphics.draw(spaceship.sprite, spaceship.x, spaceship.y, spaceship.angle)
    love.graphics.setColor(1,0,0)
    love.graphics.circle("fill", targetX, targetY, 5)
    
  end
  