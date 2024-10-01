require "uimanager"

function Menu_Init()
    titleFont = love.graphics.newFont()
    titleColor1 = {
        r = 1.0,
        g = 0.5,
        b = 0.0,
        a = 1.0
    }

    title = newText(screenWidth/2, screenHeight/2, "CATZ SURVIVE", 40, titleFont, titleColor1)

end