-- Importing
require("data.functions.drawLayout")
require("source.population")

-- Setting a pseudo-randomic seed 
math.randomseed(os.time())

-- Recieving proportions
local screenHeight, screenWidth = love.graphics.getHeight(), love.graphics.getWidth()

-- Path variables
local fontPath = "data/assets/jetBrains.ttf"
local backgroundPath = "data/assets/background.png"
local foodPath = "data/assets/food.png"
local flyPath = "data/assets/fly.png"

-- Global variables
test = nil
debugParameter = nil
pause = false

--[[
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
]]--

-- ENVIRORMENT VARIABLES

local title = "Better And Better Flies" -- Window title

love.window.setMode(600, 600, { -- Window configuration
    resizable = true,
    minwidth = 600,   
    minheight = 600
})

local food = { -- Food coords & Radius
    -- x = screenWidth * 0.37,
    -- y = screenHeight * 0.2,
    x = math.random() * (screenWidth * 0.37),
    y = math.random() * (screenHeight * 0.2),
    radius = 25
}

local numFlies = 1500 -- Number of flies
local maxSteps = 404 -- Max of steps
local maxSpeed = 2 -- Max of speed
local mutationRate = 0.05 -- Mutation rate

--[[
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
]]--

-- Initializing assets
local myFont = nil
local background = nil
local foodImage = nil
local flyImage = nil

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

    -- Load the population
    test = newPopulation(numFlies, maxSteps, maxSpeed, food, mutationRate) -- Object population
end

function love.update(dt)
    if pause then
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
        drawPause()
    end

    -- Final layer (Debug)
    if debugParameter then
        debug(debugParameter)
    end
end