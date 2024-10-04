scenes = {
    gamePlayScene = 1,
    menuScene = 2,
    pausedScene = 3,
    creditsScene = 4,
    exitScene = 5,
    gameOverScene = 6
}

local currentScene = scenes.menuScene
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
