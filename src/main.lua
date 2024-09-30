
local scene =
{
  gamePlay = true,
  menu = false,
  paused = false,
  over = false,
}

function love.load()
  
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
    love.graphics.draw(zombie.spriteSheet.sheet, zombie.sprite, zombie.x, zombie.y, zombie.angle, zombie.scale)
    love.graphics.draw(cat.spriteSheet.sheet, cat.sprite, cat.x, cat.y, cat.angle, cat.scale)
    love.graphics.setColor(1,0,0)
end

  function gamePlayUpdate(dt)
   --time between each animation
   animations.timer = animations.timer - dt
   animate(zombie, zombie.dimensions*2)
   animations.timer = animations.timer - dt
   animate(cat, dt)

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
  end

function gamePlayInit()
  
  animations = {}
  animations.fps = 10;
  animations.timer = 1/animations.fps
  animations.xOffSet = 0
 
  zombie = {}
  zombie.spriteSheet = {}
  zombie.spriteSheet.sheet = love.graphics.newImage("res/Zombie.png")
  zombie.spriteSheet.frames = 7
  zombie.spriteSheet.currentFrame = 0
  zombie.dimensions = 32;
  zombie.sprite = love.graphics.newQuad(0, zombie.dimensions*2, zombie.dimensions, zombie.dimensions, zombie.spriteSheet.sheet:getDimensions())
  zombie.spriteDimension = {}
  zombie.spriteDimension.width = zombie.dimensions;
  zombie.spriteDimension.height = zombie.dimensions;
  
  zombie.x = 0
  zombie.y = 0
  zombie.angle = 0
  zombie.speed = 300.0
  zombie.scale = 3;
  
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
  targetX = screenWidth - (cat.spriteDimension.width*cat.scale);
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