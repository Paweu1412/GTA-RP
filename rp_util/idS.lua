local assignedID = {}

addEventHandler("onPlayerJoin", root, function()
    for i = 1, 512 do
        if not assignedID[i] then
            assignedID[i] = source

            exports.rp_systems:setPlayerData(source, "id", i)
            return true
        end
    end
end)

addEventHandler("onPlayerQuit", root, function()
    for index, player in pairs(assignedID) do
        if source == player then
            assignedID[index] = nil
            break
        end
    end
end)