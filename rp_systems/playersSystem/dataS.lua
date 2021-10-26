local playersData = {}

function setPlayerData(uid, key, data)
    if uid and key and data then
        if not playersData[uid] then 
            playersData[uid] = {}
        end

        playersData[uid][key] = data
        return true
    end
end

function getPlayerData(uid, key)
    if uid and key then
        if not playersData[uid] or not playersData[uid][key] then return end

        return playersData[uid][key]
    end
end