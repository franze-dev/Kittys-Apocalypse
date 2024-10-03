function Pause_Init()

    pauseFont = "res/fonts/BOYCOTT.ttf"

    pauseRect = {}
    pauseRect.x = title2.x
    pauseRect.y = title2.y
    pauseRect.width = title2.love:getWidth()
    pauseRect.height = screenHeight / 2 - (backToMenuButton.height)

    pausePadding = 10

    pauseMenuTextColor = {
        r = 1.0,
        g = 1.0,
        b = 1.0,
        a = 1.0
    }

    pauseTitle = newText(pauseRect.x + pauseRect.width / 2, pauseRect.y + pausePadding, "PAUSED", 40, pauseFont,
        pauseMenuTextColor)

    pauseTitle.x = pauseTitle.x - (pauseTitle.love:getWidth() / 2)

    continueButton = newButton("CONTINUE", pauseFont, pauseTitle.x,
        pauseTitle.y + pauseTitle.love:getHeight() + pausePadding, pauseTitle.love:getWidth(),
        pauseTitle.love:getHeight() / 2, pauseButtonColor, pauseHighlightColor, pauseTextColor)

    backToMenuPauseButton = newButton("BACK TO MENU", pauseFont, pauseTitle.x,
        continueButton.y + continueButton.height + pausePadding, pauseTitle.love:getWidth(),
        pauseTitle.love:getHeight() / 2, pauseButtonColor, pauseHighlightColor, pauseTextColor)

    exitPauseButton = newButton("EXIT", pauseFont, pauseTitle.x, backToMenuPauseButton.y + backToMenuButton.height,
        pauseTitle.love:getWidth(), pauseTitle.love:getHeight() / 2, pauseButtonColor, pauseHighlightColor,
        pauseTextColor)

end

function Pause_Update()
    checkSceneChange(continueButton, scenes.gamePlayScene)
    checkSceneChange(backToMenuPauseButton, scenes.menuScene)
    checkSceneChange(exitPauseButton, scenes.overScene)

end

function Pause_Draw()

    love.graphics.setColor(rectColor.r, rectColor.g, rectColor.b, rectColor.a)
    love.graphics.rectangle('fill', pauseRect.x, pauseRect.y, pauseRect.width, pauseRect.height)
    drawText(pauseFont, pauseTitle)

    drawButton(pauseFont, continueButton)
    drawButton(pauseFont, backToMenuPauseButton)
    drawButton(pauseFont, exitPauseButton)
end
