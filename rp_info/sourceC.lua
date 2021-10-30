local currentTimer = nil
local currentHandler = nil 

local triggeredFunctionInfo = {
    ["type"] = {},
    ["text"] = {}
}

local screenW, screenH = guiGetScreenSize()

local baseX = 1920
local zoom = 1
local minZoom = 2
if screenW < baseX then
    zoom = math.min(minZoom, baseX/screenW)
end

function createInformation()
    for oX = (2 * -1), 2 do
        for oY = (2 * -1), 2 do
            dxDrawText(triggeredFunctionInfo["text"], (screenW * 0.7755) + oX, (screenH * 0.2972) + oY, (screenW * 0.9526) + oX, (screenH * 0.3648) + oY, tocolor(0, 0, 0, 200), 1.20/zoom, "default-bold", "center", "top", false, true, false, false, false)
        end 
    end

    if triggeredFunctionInfo["type"] == "alert" then
        dxDrawText(triggeredFunctionInfo["text"], screenW * 0.7755, screenH * 0.2972, screenW * 0.9526, screenH * 0.3648, tocolor(255, 165, 0, 200), 1.20/zoom, "default-bold", "center", "top", false, true, false, false, false)
    elseif triggeredFunctionInfo["type"] == "success" then
        dxDrawText(triggeredFunctionInfo["text"], screenW * 0.7755, screenH * 0.2972, screenW * 0.9526, screenH * 0.3648, tocolor(0, 0, 220, 200), 1.20/zoom, "default-bold", "center", "top", false, true, false, false, false)
    elseif triggeredFunctionInfo["type"] == "failure" then
        dxDrawText(triggeredFunctionInfo["text"], screenW * 0.7755, screenH * 0.2972, screenW * 0.9526, screenH * 0.3648, tocolor(220, 0, 0, 200), 1.20/zoom, "default-bold", "center", "top", false, true, false, false, false)
    end
end

function showInformation(text, type)
    if currentTimer ~= nil and currentHandler ~= nil then
        removeEventHandler("onClientRender", root, createInformation)
        killTimer(currentTimer)

        currentTimer = nil
        currentHandler = nil
    end

    triggeredFunctionInfo["type"] = type
    triggeredFunctionInfo["text"] = text

    currentHandler = addEventHandler("onClientRender", root, createInformation)

    currentTimer = setTimer(function()
        removeEventHandler("onClientRender", root, createInformation)

        currentTimer = nil
        currentHandler = nil
    end, 5000, 1)
end

addEvent("GTARP:ShowInformation", true)
addEventHandler("GTARP:ShowInformation", root, showInformation)