addEventHandler("onPlayerChat", root, function(message, messageType)
    if messageType == 1 or messageType == 2 or messageType == 3 or messageType == 4 then 
        return cancelEvent()
    end

    cancelEvent(); outputMessage(source, 1, message)
end)

function outputMessage(player, type, text)
    if player and type and text then
        if type == 1 then
            local playerX, playerY, playerZ = getElementPosition(player)
            if not playerX or not playerY or not playerZ then return end

            local playersInRange = getElementsWithinRange(playerX, playerY, playerZ, 15, "player")
            local currentCharacter = exports.rp_systems:getPlayerData(player, "character_id")
            if not playersInRange or not currentCharacter then return end

            local extraSymbol = "."

            if string.sub(text, -1) == "." or string.sub(text, -1) == "?" or string.sub(text, -1) == "!" then
                extraSymbol = ""
            end

            outputChatBox(exports.rp_systems:getCharacterData(currentCharacter, "name").. " mówi: " ..text.. "" ..extraSymbol, playersInRange, 255, 255, 255)
        end
    end
end