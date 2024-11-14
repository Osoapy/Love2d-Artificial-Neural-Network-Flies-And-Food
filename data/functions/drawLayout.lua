function drawBackground(background)
    love.graphics.setColor(1, 1, 1)
    local screenHeight, screenWidth = love.graphics.getHeight(), love.graphics.getWidth()
    love.graphics.draw(background, 0, 0, 0, screenWidth / background:getWidth(), screenHeight / background:getHeight())
end

function drawFood(foodImage, food)
    love.graphics.setColor(1, 1, 1)

    -- Calculates the scale
    local scale = (food.radius * 2) / foodImage:getWidth()

    -- Draws the image centralized in x, y
    love.graphics.draw(foodImage, food.x, food.y, 0, scale, scale, foodImage:getWidth() / 2, foodImage:getHeight() / 2)
end

function drawFly(flyImage, fly)
    love.graphics.setColor(1, 1, 1)

    if fly.isBest then
        love.graphics.setColor(0, 1, 0) -- Green
    end

    -- Calcula the angle using its velocity
    local angle = math.atan2(fly.vel.y, fly.vel.x)

    -- Calculates the scale
    local scale = (fly.radius * 2) / flyImage:getWidth()

    -- Draws the image centralized in x, y
    love.graphics.draw(flyImage, fly.position.x, fly.position.y, angle, scale, scale, flyImage:getWidth() / 2, flyImage:getHeight() / 2)
end

function drawPause()
    love.graphics.setColor(0, 0, 0, 0.5)
    local screenHeight, screenWidth = love.graphics.getHeight(), love.graphics.getWidth()
    love.graphics.rectangle("fill", 0, 0, screenWidth, screenHeight)
end