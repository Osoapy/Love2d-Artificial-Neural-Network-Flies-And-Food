-- Importing
require("data.layoutFunctions.drawLayout")
require("source.population")
require("source.functions")

-- Setting a pseudo-randomic seed 
math.randomseed(os.time())

-- Recieving proportions
screenHeight, screenWidth = love.graphics.getHeight(), love.graphics.getWidth()

-- Path variables
require("variables.path")

-- Global variables
test = nil
debugParameter = nil
pause = false
buttonAlpha = 1
isButtonPressed = false
fadeSpeed = 2

-- Envirorment variables
require("variables.envirorment")

-- Initializing button
local button = {
    x = 200, -- Posição X do botão
    y = 550, -- Posição Y do botão
    width = 200, -- Largura do botão
    height = 50, -- Altura do botão
}

function love.load()
    -- Setting the title
    love.window.setTitle(title)

    -- Load the font
    myFont = love.graphics.newFont(fontPath, 26)
    love.graphics.setFont(myFont)

    -- Load the background
    background = love.graphics.newImage(backgroundPath)
    assert(background, "Loading error on background.png!")

    -- Load the food
    foodImage = love.graphics.newImage(foodPath)
    assert(foodImage, "Loading error on food.png!")

    -- Load the flies
    flyImage = love.graphics.newImage(flyPath)
    assert(foodImage, "Loading error on fly.png!")

    -- Load the button
    buttonPressedImage = love.graphics.newImage(buttonPressedPath)
    buttonNotPressedImage = love.graphics.newImage(buttonNotPressedPath)
    assert(buttonPressedImage, "Loading error on buttonPressed.png!")
    assert(buttonNotPressedImage, "Loading error on buttonNotPressed.png!")

    -- Load the population
    test = newPopulation(numFlies, maxSteps, maxSpeed, food, mutationRate) -- Object population
end

function love.update(dt)
    if pause then
        -- Button fades
        if isButtonPressed then
            buttonAlpha = math.min(buttonAlpha + fadeSpeed * dt, 1) -- Fading para pressionado
        else
            buttonAlpha = math.max(buttonAlpha - fadeSpeed * dt, 0) -- Fading para não pressionado
        end
    else
        if test:allFlyiesDead() then
            -- If none of the dots are alive, calculate the fitness based on the food and start the next generation
            test:calculateFitness(food);
            test:naturalSelection();
            test:mutateFlies();
        else 
            -- If any of the dots are still alive then update and then show them
            test:update();
            test:show(flyImage);
        end
        debugParameter = tostring("Generation: " .. tostring(test.generation))
    end
end

function love.keypressed(key)
    -- If scape is pressed, pause or unpause the game
    if key == "escape" then
        if pause then
            pause = false
        else
            pause = true
        end
    end
end

function love.draw()
    -- Layer 0 (background)
    drawBackground(background)

    -- Layer 1 (food)
    drawFood(foodImage, food)

    -- Layer 2 (flies)
    test:show(flyImage);

    -- Pause (escape pressed)
    if pause then
        drawMenu(buttonNotPressedImage, buttonNotPressedImage, buttonAlpha, button)
    end

    -- Final layer (Debug)
    if debugParameter then
        debug(debugParameter)
    end
end

function love.mousepressed(x, y, buttonKey)
    if buttonKey == 1 and isMouseOverButton(button, x, y) then 
        isButtonPressed = true
    end
end

function love.mousereleased(x, y, buttonKey)
    if buttonKey == 1 and isMouseOverButton(button, x, y) then 
        isButtonPressed = false
        pause = not pause -- Unpauses the game
    end
end