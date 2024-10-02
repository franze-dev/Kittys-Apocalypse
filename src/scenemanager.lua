
scenes = {
  gamePlayScene = 1,
  menuScene = 2,
  pausedScene = 3,
  creditsScene = 4,
  overScene = 5
}

local currentScene = scenes.menuScene

function getCurrentScene()
    return currentScene
end

function setCurrentScene(myScene)
    currentScene = myScene
end