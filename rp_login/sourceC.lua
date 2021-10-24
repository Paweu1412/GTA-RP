addEventHandler("onClientResourceStart", resourceRoot, function(startedResource)
    initializeLoginUI(startedResource)
end)

loginGui = {
    staticimage = {},
    edit = {},
    button = {},
    label = {}
}

function initializeLoginUI(startedResource)
    if startedResource == getThisResource() then
        showLoginGui(true)
    end
end

local playingMusic = false

function showLoginGui(state)
    if state == true then
        playingMusic = playSound("files/song.mp3", true)
        setSoundVolume(playingMusic, 0.2)

        showChat(false)
        showCursor(true)
        fadeCamera(false)

        loginGui.button[1] = guiCreateButton(0.45, 0.62, 0.10, 0.03, "Zaloguj", true)
        addEventHandler("onClientGUIClick", loginGui.button[1], function(button, state)
            if button == "left" and state == "up" then
                if isElement(loginGui.edit[1]) and isElement(loginGui.edit[2]) then
                    if string.len(guiGetText(loginGui.edit[1])) == 0 then
                        triggerEvent("GTARP:SendOutput", localPlayer, 1)
                        return false
                    end

                    if string.len(guiGetText(loginGui.edit[2])) == 0 then
                        triggerEvent("GTARP:SendOutput", localPlayer, 2)
                        return false
                    end
                
                    if string.len(guiGetText(loginGui.edit[2])) > 1 then
                        triggerServerEvent("GTARP:LoginButtonTriggered", localPlayer, guiGetText(loginGui.edit[1]), guiGetText(loginGui.edit[2]))
                    end
                end
            end
        end, false)

        loginGui.button[2] = guiCreateButton(0.45, 0.66, 0.10, 0.03, "Zarejestruj", true)
        addEventHandler("onClientGUIClick", loginGui.button[2], function(button, state)
            if button == "left" and state == "up" then
                setClipboard("https://game.grandtheftauto-rp.pl/")
                triggerServerEvent("GTARP:RegisterButtonTriggered", localPlayer)
            end
        end, false)

        loginGui.label[1] = guiCreateLabel(0.46, 0.47, 0.08, 0.02, "Login", true)
        guiSetFont(loginGui.label[1], "default-bold-small")
        guiLabelSetHorizontalAlign(loginGui.label[1], "center", false)
        guiLabelSetVerticalAlign(loginGui.label[1], "center")


        loginGui.label[2] = guiCreateLabel(0.46, 0.54, 0.08, 0.02, "Hasło", true)
        guiSetFont(loginGui.label[2], "default-bold-small")
        guiLabelSetHorizontalAlign(loginGui.label[2], "center", false)
        guiLabelSetVerticalAlign(loginGui.label[2], "center")

        loginGui.label[3] = guiCreateLabel(0.425, 0.71, 0.15, 0.05, "", true)
        guiSetFont(loginGui.label[3], "default-bold-small")
        guiLabelSetColor(loginGui.label[3], 255, 0, 0)
        guiLabelSetHorizontalAlign(loginGui.label[3], "center", false)

        loginGui.edit[1] = guiCreateEdit(0.45, 0.49, 0.10, 0.03, "", true)
        loginGui.edit[2] = guiCreateEdit(0.45, 0.56, 0.10, 0.03, "", true)
        guiEditSetMasked(loginGui.edit[2], true)

        loginGui.staticimage[1] = guiCreateStaticImage(0.458, 0.29, 0.09, 0.15, "files/logo.png", true)
    else
        setCameraTarget(localPlayer, localPlayer)
        fadeCamera(true, 0.2)
        showChat(true)
        showCursor(false)

        destroyElement(playingMusic)
        destroyElement(guiRoot)
    end
end