function GameOver_Init()

    gameOverFont = "res/fonts/BOYCOTT.ttf"

    gameOverColor = {
        r = 1.0,
        g = 0.0,
        b = 0.0,
        a = 1.0
    }
    gameOverButtonColor = {
        r = 1.0,
        g = 0.5,
        b = 0.0,
        a = 1.0
    }

    gameOverHighlightButtonColor = {
        r = 0.6,
        g = 0.0,
        b = 0.0,
        a = 0.7
    }

    gameOverTextColor = {
        r = 1.0,
        g = 1.0,
        b = 1.0,
        a = 1.0
    }

    gameOverTitle = newText(screenWidth / 2, screenHeight / 2, "GAME OVER", 100, gameOverFont, gameOverColor)
    gameOverTitle.x = gameOverTitle.x - gameOverTitle.love:getWidth() / 2
    gameOverTitle.y = gameOverTitle.y - gameOverTitle.love:getHeight()

    backToMenuOverButton = newButton("BACK TO MENU", gameOverFont, gameOverTitle.x,
        gameOverTitle.y + gameOverTitle.love:getHeight() + 20, gameOverTitle.love:getWidth(), 30, gameOverButtonColor,
        gameOverHighlightButtonColor, gameOverTextColor)

    exitOverButton = newButton("EXIT", gameOverFont, gameOverTitle.x,
        backToMenuOverButton.y + backToMenuOverButton.height * 2, gameOverTitle.love:getWidth(), 30,
        gameOverButtonColor, gameOverHighlightButtonColor, gameOverTextColor)

    scoreText = newText(screenWidth / 2, exitOverButton.y + exitOverButton.height * 2, "SCORE: " .. getScore(),
        gameOverTitle.size, gameOverFont, gameOverTitle.color)


end

function GameOver_Update()
    checkSceneChange(backToMenuOverButton, scenes.menuScene)
    checkSceneChange(exitOverButton, scenes.exitScene)

end

function GameOver_Draw()

    scoreText = newText(screenWidth / 2, exitOverButton.y + exitOverButton.height * 2, "SCORE: " .. getScore(),
    gameOverTitle.size, gameOverFont, gameOverTitle.color)

    scoreText.x = scoreText.x - scoreText.love:getWidth()/2

    love.graphics.setBackgroundColor(0, 0, 0, 1)
    drawText(gameOverFont, gameOverTitle)
    drawText(gameOverFont, scoreText)
    drawText(gameOverFont, scoreText)

    drawButton(gameOverFont, backToMenuOverButton)
    drawButton(gameOverFont, exitOverButton)
end
