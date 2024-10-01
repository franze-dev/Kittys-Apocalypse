
-- the color has to be a table with rgba
function newText(x, y, content, size, fontDir, color)
    local text = {}
    text.content = content
    text.font = love.graphics.newFont(fontDir, size)
    text.x = x
    text.y = y
    text.color = color
    text.love = love.graphics.newText(fontDir,content)
    return text
end

-- the color has to be a table with rgba
function newButton(content, font, x, y, width, height, buttonColor, textColor)
    local button = {}
    button.x = x
    button.y = y
    button.color = buttonColor
    button.width = width
    button.text = newText(x, y, content, height/2, font, textColor)
    button.text.x = button.text.x + button.text.love:getWidth()/2
    button.text.y = button.text.y + button.text.love:getHeight()/2
    
    return button
end

function drawText(text, moveY, align)
    love.graphics.setFont(text.font)
    love.graphics.printf(text.content, text.x, text.y, moveY, align)
end

function drawButton(button)
    love.graphics.setColor(button.color.r, button.color.g, button.color.b, button.color.a)
    love.graphics.rectangle(button.x, button.y, button.width, button.height)
    love.graphics.setColor(button.text.color.r, button.text.color.g, button.text.color.b, button.text.color.a)
    drawText(button.text, 0, 'center')
end