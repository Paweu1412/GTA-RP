--[[function dxDrawBorderedTextOnElement(element, outline, text, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    local x, y, z = getElementPosition(element)
	local x2, y2, z2 = getCameraMatrix()
	local distance = distance or 20
	local height = height or 1

	if (isLineOfSightClear(x, y, z+2, x2, y2, z2)) then
		local sx, sy = getScreenFromWorldPosition(x, y, z+height)
		if(sx) and (sy) then
			local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
			if(distanceBetweenPoints < distance) then
				for oX = (outline * -1), outline do
					for oY = (outline * -1), outline do
						dxDrawText(text, sx + oX, sy + oY, sx + oX, sy + oY, tocolor(0, 0, 0, 255), scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
					end
				end

				dxDrawText(text, sx, sy, sx, sy, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
			end 
		end 
	end  
end]]--

local screenW, screenH = guiGetScreenSize()

local baseX = 1920
local zoom = 1
local minZoom = 2
if screenW < baseX then
    zoom = math.min(minZoom, baseX/screenW)
end

local maxDistance = 1

addEventHandler("onClientRender", root, function()
	local px, py, pz = getCameraMatrix()

	for _, v in ipairs(getElementsByType("player")) do
		if v ~= localPlayer then
			local tx, ty, tz = getElementPosition(v)
			local distance = getDistanceBetweenPoints3D(px, py, pz, tx, ty, tz)
			local scale = interpolateBetween(1, 0, 0, 0.45, 0, 0, distance/maxDistance, "OutQuad")

			local headX, headY, headZ = getPedBonePosition(v, 5)
			if headX and headY and headZ then
				local sx, sy = getScreenFromWorldPosition(headX,headY,headZ+0.35)

				if sx and sy then
					if distance < 12 then
						if isLineOfSightClear(px, py, pz, tx, ty, tz, true, false, false, true, false, false, false) then
							local playerNickname = string.gsub(getPlayerName(v), "_", " ")
							local playerID = exports.rp_systems:getPlayerData(v, "id")

							if not playerNickname or not playerID then return end

							for oX = (1.8 * -1), 1.8 do
								for oY = (1.8 * -1), 1.8 do
									dxDrawText(playerNickname.. " (" ..playerID.. ")", sx + oX, sy + oY, sx + oX, sy + oY, tocolor(0, 0, 0), scale*2.5/zoom, "default-bold", "center", "center")
								end
							end

							dxDrawText(playerNickname.. " (" ..playerID.. ")", sx, sy, sx, sy, tocolor(255, 255, 255), scale*2.5/zoom, "default-bold", "center", "center")
						end
					end
				end
			end
		end
	end
end)