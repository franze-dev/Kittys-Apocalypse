require "gameplayscene"
require "menu"
require "scenemanager"
require "credits"
require "pauseOptions"

function love.load()

    math.randomseed(os.time())

    love.window.setTitle("cat vs zombies")

    love.graphics.setBackgroundColor(1, 1, 1)

    screenWidth, screenHeight = love.graphics.getDimensions()

    love.graphics.setDefaultFilter('nearest', 'nearest')

    Menu_Init()
    Gameplay_Init()
    Credits_Init()
    Pause_Init()

end

function love.update(dt)

    if getCurrentScene() == scenes.menuScene then
        Menu_Update()

        if isRestarted() then
            Gameplay_Init()
            Credits_Init()
            Pause_Init()
            revertRestart()
        end
    end

    if getCurrentScene() == scenes.gamePlayScene then
        Gameplay_Update(dt)
    end

    if getCurrentScene() == scenes.pausedScene then
        Pause_Update()
    end

    if getCurrentScene() == scenes.creditsScene then
        Credits_Update()
    end

    if getCurrentScene() == scenes.overScene then
        love.event.quit()
    end

end

function love.draw()

    if getCurrentScene() == scenes.gamePlayScene or getCurrentScene() == scenes.pausedScene then
        Gameplay_Draw()
    end

    if getCurrentScene() == scenes.pausedScene then
        Pause_Draw()
    end

    if getCurrentScene() == scenes.menuScene then
        Menu_Draw()
    end

    if getCurrentScene() == scenes.creditsScene then
        Credits_Draw()
    end
end
