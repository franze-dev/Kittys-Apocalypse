scenes = {
  gamePlayScene = 1,
  menuScene = 2,
  pausedScene = 3,
  creditsScene = 4,
  overScene = 5
}

local currentScene = scenes.menuScene
local paused = false

function getCurrentScene()
  return currentScene
end

function setCurrentScene(myScene)
  if currentScene ~= myScene then
    currentScene = myScene
  end
end

function isPaused()
  return paused
end

function pause()
  if not paused then
    paused = true
  end
end

function unPause()
  if paused then
    paused = false
  end
end