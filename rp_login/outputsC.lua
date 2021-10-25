local outputTimer = false

function sendOutput(type)
    if outputTimer ~= false then
        killTimer(outputTimer)
    end

    if type == 1 then -- nieuzupełnione pole z loginem
        guiSetText(loginGui.label[3], "Pole z nazwą użytkownika nie zostało uzupełnione.")

        outputTimer = setTimer(function()
            if not isElement(loginGui.label[3]) then return end

            outputTimer = false
            guiSetText(loginGui.label[3], "")
        end, 4000, 1)
    elseif type == 2 then -- nieuzupełnione pole z hasłem
        guiSetText(loginGui.label[3], "Pole z hasłem nie zostało uzupełnione.")

        outputTimer = setTimer(function()
            if not isElement(loginGui.label[3]) then return end

            outputTimer = false
            guiSetText(loginGui.label[3], "")
        end, 4000, 1)
    elseif type == 3 then -- konto nie istnieje
        guiSetText(loginGui.label[3], "Konto o podanej nazwie użytkownika nie istnieje.")

        outputTimer = setTimer(function()
            if not isElement(loginGui.label[3]) then return end

            outputTimer = false
            guiSetText(loginGui.label[3], "")
        end, 4000, 1)
    elseif type == 4 then -- nieprawidłowe hasło
        guiSetText(loginGui.label[3], "Podane hasło jest nieprawidłowe.")

        outputTimer = setTimer(function()
            if not isElement(loginGui.label[3]) then return end

            outputTimer = false
            guiSetText(loginGui.label[3], "")
        end, 4000, 1)
    elseif type == 5 then -- brak aktywnych postaci
        guiSetText(loginGui.label[3], "To konto nie posiada żadnych aktywnych postaci.\nZałóż nową postać w panelu gry.")

        outputTimer = setTimer(function()
            if not isElement(loginGui.label[3]) then return end

            outputTimer = false
            guiSetText(loginGui.label[3], "")
        end, 4000, 1)
    end
end

addEvent("GTARP:SendOutput", true)
addEventHandler("GTARP:SendOutput", localPlayer, sendOutput)