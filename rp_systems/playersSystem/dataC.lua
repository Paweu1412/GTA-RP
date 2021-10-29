local playersData = {}

addEvent("GTARP:ClientUpdatePlayerData", true)
addEventHandler("GTARP:ClientUpdatePlayerData", root, function(serverPlayersData)
    playersData = serverPlayersData
end)

function getPlayerData(player, key)
    if player and key then
        if not playersData[player] or not playersData[player][key] then return end

        return playersData[player][key]
    end
end