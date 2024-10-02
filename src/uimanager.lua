
-- the color has to be a table with rgba
function newText(x, y, content, size, fontDir, color)
    local text = {}
    text.content = content
    text.love = love.graphics.newText(love.graphics.setNewFont(fontDir, size),content)
    text.x = x
    text.y = y
    text.size = size
    text.color = color
    return text
end

-- the color has to be a table with rgba
function newButton(content, font, x, y, width, height, buttonColor, buttonHighlight, textColor)
    local button = {}
    button.x = x
    button.y = y
    button.currentColor = buttonColor
    button.highLight = buttonHighlight
    button.default = buttonColor
    button.width = width
    button.height = height
    button.text = newText(x, y, content, height/2, font, textColor)
    button.text.x = x + width/2 - button.text.love:getWidth()/2
    button.text.y = y + height/2 - button.text.love:getHeight()/2
    
    return button
end

function drawText(fontDir, text)
   
    love.graphics.setColor(text.color.r, text.color.g, text.color.b) 
    love.graphics.setNewFont(fontDir, text.size)
    love.graphics.print(text.content, text.x, text.y)

end

function drawButton(button)

    love.graphics.setColor(button.color.r, button.color.g, button.color.b, button.color.a)
    love.graphics.rectangle(button.x, button.y, button.width, button.height)
    love.graphics.setColor(button.text.color.r, button.text.color.g, button.text.color.b, button.text.color.a)
    drawText(button.text, 0, 'center')
end