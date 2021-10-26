addEvent("GTARP:LoginSuccessful", true)
addEventHandler("GTARP:LoginSuccessful", root, function(characterData)
    if source and characterData then
        setPlayerData(source, "character_id", characterData.id)
    end
end)