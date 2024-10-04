scenes = {
    gamePlayScene = 1,
    menuScene = 2,
    pausedScene = 3,
    creditsScene = 4,
    exitScene = 5,
    gameOverScene = 6
}

<<<<<<< HEAD
local currentScene = scenes.menuScene
=======
local currentScene = scenes.gamePlayScene
>>>>>>> e5c3c9237ea205b72fa8144a5dfec4c92416480c
local restart = true

function getCurrentScene()
    return currentScene
end

function setCurrentScene(myScene)
    if currentScene ~= myScene then
        currentScene = myScene
    end
end

function restartGame()
    if not restart then
        restart = true
    end
end

function isRestarted()
    return restart
end

function revertRestart()
    if restart then
        restart = false
    end
end
