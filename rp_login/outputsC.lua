local outputTimer = false

function sendOutput(type)
    if outputTimer ~= false then
        killTimer(outputTimer)
    end

    if type == 1 then
        guiSetText(loginGui.label[3], "Pole z loginem nie zostało uzupełnione.")

        outputTimer = setTimer(function()
            if not isElement(loginGui.label[3]) then return end

            outputTimer = false
            guiSetText(loginGui.label[3], "")
        end, 4000, 1)
    elseif type == 2 then
        guiSetText(loginGui.label[3], "Pole z hasłem nie zostało uzupełnione.")

        outputTimer = setTimer(function()
            if not isElement(loginGui.label[3]) then return end

            outputTimer = false
            guiSetText(loginGui.label[3], "")
        end, 4000, 1)
    elseif type == 3 then
        guiSetText(loginGui.label[3], "Konto o podanym loginie nie istnieje.")

        outputTimer = setTimer(function()
            if not isElement(loginGui.label[3]) then return end

            outputTimer = false
            guiSetText(loginGui.label[3], "")
        end, 4000, 1)
    elseif type == 4 then
        guiSetText(loginGui.label[3], "Podane hasło jest nieprawidłowe.")

        outputTimer = setTimer(function()
            if not isElement(loginGui.label[3]) then return end

            outputTimer = false
            guiSetText(loginGui.label[3], "")
        end, 4000, 1)
    end
end

addEvent("GTARP:SendOutput", true)
addEventHandler("GTARP:SendOutput", localPlayer, sendOutput)