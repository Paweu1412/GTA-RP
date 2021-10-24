addEvent("GTARP:RegisterButtonTriggered", true)
addEventHandler("GTARP:RegisterButtonTriggered", root, function()
    if client then
        kickPlayer(client, "system", "Zarejestruj się w naszym panelu gracza, game.grandtheftauto-rp.pl; link został skopiowany do schowka.")
    end
end)

addEvent("GTARP:LoginButtonTriggered", true)
addEventHandler("GTARP:LoginButtonTriggered", root, function(inputedLogin, inputedPassword)
    if client and inputedLogin and inputedPassword then
        local accountPassword = exports.rp_database:dbQueryExtended("SELECT password FROM gtarp_accounts WHERE login = '" ..inputedLogin.. "'")

        if accountPassword ~= nil then
            accountPassword = accountPassword.password
            if accountPassword then
                if passwordVerify(inputedPassword, accountPassword) == true then
                    -- ciąg dalszy
                else
                    triggerClientEvent(client, "GTARP:SendOutput", client, 4)
                end
            end
        else
            triggerClientEvent(client, "GTARP:SendOutput", client, 3)
        end
    end
end)