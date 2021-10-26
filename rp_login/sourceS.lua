addEvent("GTARP:RegisterButtonTriggered", true)
addEventHandler("GTARP:RegisterButtonTriggered", root, function()
    if client then
        kickPlayer(client, "system", "Zarejestruj się w naszym panelu gracza, game.grandtheftauto-rp.pl; link został skopiowany do schowka.")
    end
end)

addEvent("GTARP:LoginButtonTriggered", true)
addEventHandler("GTARP:LoginButtonTriggered", root, function(inputedLogin, inputedPassword)
    if client and inputedLogin and inputedPassword then
        local accountData = exports.rp_database:dbQueryExtended("SELECT * FROM gtarp_accounts WHERE login = '" ..inputedLogin.. "'")

        if accountData ~= nil then
            accountData = {accountData.password, accountData.id}
            if accountData then
                if passwordVerify(inputedPassword, accountData[1]) == true then
                    local accountCharactersData = exports.rp_database:dbQueryExtended("SELECT * FROM gtarp_characters WHERE owner_id = '" ..accountData[2].. "'")

                    if accountCharactersData ~= nil and next(accountCharactersData) then
                        triggerClientEvent(client, "GTARP:ShowLoginGui", client, false)
                        triggerClientEvent(client, "GTARP:InitializeCharacterSelection", client, accountCharactersData)
                    else
                        triggerClientEvent(client, "GTARP:SendOutput", client, 5)
                    end
                else
                    triggerClientEvent(client, "GTARP:SendOutput", client, 4)
                end
            end
        else
            triggerClientEvent(client, "GTARP:SendOutput", client, 3)
        end
    end
end)

addEvent("GTARP:SpawnInSelectedCharacter", true)
addEventHandler("GTARP:SpawnInSelectedCharacter", root, function(characterData)
    if client and characterData then
        if fadeCamera(client, true, 2) then
            if setCameraTarget(client, client) then
                if spawnPlayer(client, characterData.last_x, characterData.last_y, characterData.last_z, characterData.rotation, characterData.skin, 0, characterData.vw) then
                    triggerEvent("GTARP:LoginSuccessful", client, characterData)
                end
            end
        end
    end
end)