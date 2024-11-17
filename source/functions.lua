-- Functions
function clearTable(t)
    for k in pairs(t) do
        t[k] = nil
    end
end

function copyTable(dest, src)
    for k, v in pairs(src) do
        dest[k] = v
    end
end

function dist(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

function randomVector()
    local angle = math.random() * 2 * math.pi
    local x = math.cos(angle)
    local y = math.sin(angle)
    return x, y
end

function debug(parameter)
    love.graphics.print(tostring(parameter))
end

function isMouseOverButton(button, x, y)
    return x >= button.x and x <= button.x + button.width and y >= button.y and y <= button.y + button.height
end