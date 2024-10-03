function newHealthbar(character)
    local healthbar = {}
    healthbar.border = {
        x = character.x,
        height = 10,
        y = character.y - 10,
        width = character.dimensions * character.scale
    }
    healthbar.rect = healthbar.border
    healthbar.fullHealth = healthbar.border.width
    healthbar.decreasePercentage = 10
    healthbar.decrease = healthbar.fullHealth * healthbar.decreasePercentage / 100

    return healthbar
end

function decreaseHealth(character)

    if character.healthbar.rect.width > 0 and character.healthbar.rect.width - character.healthbar.decrease >= 0 then

        character.healthbar.rect.width = character.healthbar.rect.width - character.healthbar.decrease
    else
        character.healthbar.rect.width = 0
    end

    if character.healthbar.rect.width < 0 then
        character.healthbar.rect.width = 0
    end

end

function drawHealthbar(character)

    love.graphics.setColor(1.0, 0.0, 0.0, 1.0)

    if character.healthbar.rect.width > 0 then
        love.graphics.rectangle("fill", character.healthbar.rect.x, character.healthbar.rect.y,
            character.healthbar.rect.width, character.healthbar.rect.height)

        love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
        love.graphics.rectangle("line", character.healthbar.border.x, character.healthbar.border.y,
            character.healthbar.border.width, character.healthbar.border.height)
    end

end

function isAlive(character)
    return character.healthbar.width > 0
end
