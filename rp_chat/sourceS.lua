addEventHandler("onPlayerChat", root, function(message, messageType)
    if messageType == 0 then
        outputMessage(source, 1, message)
    elseif messageType == 1 then
        outputMessage(source, 2, message)
    end

    cancelEvent()
end)

function correctText(text, uppercase)
    if text then
        local endLetter = string.sub(text, -1)

        if endLetter ~= "." and endLetter ~= "?" and endLetter ~= "!" then
            text = text.."."
        end

        if uppercase == true then
            return text
        end

        return text:gsub("^%l", string.upper)
    end
end

function outputMessage(player, type, text)
    if player and type and text then
        local playerX, playerY, playerZ = getElementPosition(player)

        if playerX and playerY and playerZ then
            local playersInRange = getElementsWithinRange(playerX, playerY, playerZ, 15, "player")
            local currentCharacter = exports.rp_systems:getPlayerData(player, "character_id")
            
            if playersInRange and currentCharacter then
                if type == 1 then
                    outputChatBox(exports.rp_systems:getCharacterData(currentCharacter, "name").. " mówi: " ..correctText(text), playersInRange, 255, 255, 255)
                elseif type == 2 then
                    outputChatBox("** " ..exports.rp_systems:getCharacterData(currentCharacter, "name").. " " ..correctText(text, true), playersInRange, 220, 162, 244)
                elseif type == 3 then
                    outputChatBox("** " ..correctText(text).. " (( " ..exports.rp_systems:getCharacterData(currentCharacter, "name").. " )) **", playersInRange, 137, 130, 189)
                end
            end
        end
    end
end

addCommandHandler("do", function(player, command, ...)
    if player then
        local text = {...}
        text = table.concat(text, " ")
        if not text then return end

        outputMessage(player, 3, text)
    end
end)