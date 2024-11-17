-- ENVIRORMENT VARIABLES
love.window.setMode(600, 600, { -- Window configuration
    resizable = true,
    minwidth = 600,   
    minheight = 600
})

food = { -- Food coords & Radius
    -- x = screenWidth * 0.37,
    -- y = screenHeight * 0.2,
    x = math.random() * (screenWidth * 0.37),
    y = math.random() * (screenHeight * 0.2),
    radius = 25
}

title = "Flies and soup"
numFlies = 3500 -- Number of flies
maxSteps = 404 -- Max of steps
maxSpeed = 2 -- Max of speed
mutationRate = 0.05 -- Mutation rate

-- Initializing assets
myFont = nil
background = nil
foodImage = nil
flyImage = nil
buttonPressedImage = nil
buttonNotPressedImage = nil