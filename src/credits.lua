require "uimanager"
require "scenemanager"

function Credits_Init()

    creditsTitleFont = "res/fonts/HennyPenny-Regular.otf"
    creditsFont = "res/fonts/GlacialIndifference-Regular.otf"

    creditsColor = {
        r = 1.0,
        g = 0.5,
        b = 0.0,
        a = 1.0
    }

    creditsTitle = newText(screenWidth / 2, screenHeight / 2, "CREDITS", 50, creditsTitleFont, creditsColor)

    titlePadding = 20
    creditsTitle.y = creditsTitle.love:getHeight() + titlePadding
    creditsTitle.x = creditsTitle.x - creditsTitle.love:getWidth() / 2

    rectColor = {
        r = 0.6,
        g = 0.0,
        b = 0.0,
        a = 0.7
    }

    generalTextColor = {
        r = 1.0,
        g = 1.0,
        b = 1.0,
        a = 1.0
    }

    backToMenuButton = newButton("BACK TO MENU", titleFont2, screenWidth / 2 - creditsButton.width / 2,
        screenHeight - creditsButton.height - titlePadding / 2, creditsButton.width, creditsButton.height,
        creditsButton.default, creditsButton.highLight, generalTextColor)

    credits = {}
    dev = "Developer: Sofi Alvarez"
    catCredits = "Three Color Cat: ToffeeBunny (Itch.io user)"
    zombie = "Zombies: IronnButterfly (Itch.io user)"
    shots = "Explosions: Boldo boldin (Itch.io user)"
    bg = "Background: Henrique Baldo (ArtStation user)"
    table.insert(credits, 1, dev)
    table.insert(credits, 2, catCredits)
    table.insert(credits, 3, zombie)
    table.insert(credits, 4, shots)
    table.insert(credits, 5, bg)

end

function Credits_Update()

    checkSceneChange(backToMenuButton, scenes.menuScene)

end

function Credits_Draw()

    drawText(creditsTitleFont, creditsTitle)

    drawButton(titleFont2, backToMenuButton)

    drawCreditsTextBlock()

end

function drawCreditsTextBlock()

    love.graphics.setColor(rectColor.r, rectColor.g, rectColor.b, rectColor.a)
    love.graphics.rectangle('fill', creditsButton.x, creditsTitle.y + creditsTitle.love:getHeight() + titlePadding,
        backToMenuButton.width, screenHeight / 2 - (backToMenuButton.height))

    local baseY = creditsTitle.y + creditsTitle.love:getHeight()
    local startPaddingY = 30
    local creditsPaddingY = startPaddingY
    local creditsPaddingX = 10

    for i = 1, #credits do
        creditsPaddingY = startPaddingY
        baseY = baseY + creditsPaddingY + (creditsPaddingY * 1 / i)
        print(baseY)
        text = newText(creditsButton.x + creditsPaddingX, baseY, credits[i], 20, creditsFont, generalTextColor)
        drawText(creditsFont, text)
    end

end
