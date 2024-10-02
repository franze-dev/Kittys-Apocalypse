require "uimanager"
require "scenemanager"

function Menu_Init()
   
    titleFont1 = "res/fonts/HennyPenny-Regular.otf"
    titleFont2 = "res/fonts/BOYCOTT.ttf"
   
    titleColor1 = {
        r = 1.0,
        g = 0.5,
        b = 0.0,
        a = 1.0
    }

    titleColor2 = {
        r = 0.6,
        g = 0.0,
        b = 0.0,
        a = 1.0
    }

    title1 = newText(screenWidth/2, screenHeight/2, "Kitty's", 50, titleFont1, titleColor1)

    title2 = newText(screenWidth/2, screenHeight/2, "APOCALYPSE", 80, titleFont2, titleColor2)

    titlePadding = 20
    title1.y = title1.love:getHeight() + titlePadding
    title1.x = title1.x - title1.love:getWidth()/2

    title2.x = title2.x - title2.love:getWidth()/2
    title2.y = title1.y + title2.love:getHeight()/2

    buttonsPadding = 40

    generalTextColor = {
        r = 1.0,
        g = 1.0,
        b = 1.0,
        a = 1.0
    }

    playButton = newButton("PLAY", titleFont2, title2.x, title2.y + title2.love:getHeight() + buttonsPadding, title2.love:getWidth(), 40, titleColor1, titleColor2, generalTextColor)
    creditsButton = newButton("CREDITS", titleFont1, playButton.x, playButton.y + buttonsPadding*2, playButton.width, playButton.height, titleColor1, titleColor2, generalTextColor)
    exitButton = newButton("EXIT", titleFont1, creditsButton.x, creditsButton.y + buttonsPadding*2, creditsButton.width, creditsButton.height, creditsButton.default, creditsButton.highLight, generalTextColor)

end

function Menu_Update()

    checkSceneChange(playButton, scenes.gamePlayScene)

    checkSceneChange(creditsButton, scenes.creditsScene)

    checkSceneChange(exitButton, scenes.overScene)

end

function Menu_Draw()
  
    drawText(titleFont1, title1)
    drawText(titleFont2, title2)
    
    drawButton(titleFont2, playButton)
    drawButton(titleFont1, creditsButton)
    drawButton(titleFont1, exitButton)

end