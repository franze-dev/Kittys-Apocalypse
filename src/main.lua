function love.load()
  
    love.window.setTitle("spaceship")
    
    love.graphics.setBackgroundColor(1, 1, 1)
    spaceship = love.graphics.newImage("res/spaceship.PNg")
    
    local screenWidth, screenHeight = love.graphics.getDimensions()

    targetX = screenWidth/2;
    targetY = screenHeight/2;
    
     
    -- target.graphics.setColor(1,0,0)
    
    
    posX = 0
    posY = 0
    angle = 0

  
    speed = 300.0
  
  end
  
  
  function love.update(dt)
   
    local ox, oy = spaceship:getWidth() * .5, spaceship:getHeight() * .5 -- get center point

    centerX = posX + ox
    centerY = posY + oy

    if centerX < targetX then
     posX = posX + speed * dt
    end

    if centerX > targetX then
     posX = posX - speed * dt
    end
   
    if centerY < targetY then
     posY = posY + speed * dt
    end

    if centerY > targetY then
     posY = posY - speed * dt
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
    love.graphics.draw(spaceship, posX, posY, angle)
    love.graphics.setColor(1,0,0)
    love.graphics.circle("fill", targetX, targetY, 5)
    
  end
  