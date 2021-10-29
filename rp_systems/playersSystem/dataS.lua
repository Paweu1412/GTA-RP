local playersData = {}

function setPlayerData(player, key, data)
    if player and key and data then
        if not playersData[player] then 
            playersData[player] = {}
        end

        playersData[player][key] = data

        triggerClientEvent("GTARP:ClientUpdatePlayerData", resourceRoot, playersData)
        return true
    end
end

function getPlayerData(player, key)
    if player and key then
        if not playersData[player] or not playersData[player][key] then return end

        return playersData[player][key]
    end
end