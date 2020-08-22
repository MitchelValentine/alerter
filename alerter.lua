
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local notif = function(Title,Message,Length,Icon)
	StarterGui:SetCore("SendNotification",{
	['Title'] = Title;
	['Text'] = Message;
	['Duration'] = Length;
	['Icon'] = Icon;
	})
end

local function GetId(Player)
	return(Players:GetUserIdFromNameAsync(tostring(Player)))
end

local function alert()
	notif("ALERT!","A known logger has joined your game!",10)
	if autoKick then
		Players.LocalPlayer:Kick("\nYou were disconnected from the server because a known logger has joined your game. You can turn off auto-disconnect by setting the variable 'autoKick' to false.")
	end
end

-- INIT DATA

local init = {"6s8k","Pxrti","logging_audios","x9ed","SRpandaPH","825z","uqicz","Abffection","XOXSleepXOX","plaisoundz","thereaper7590","xElement","sf_vz","SamTheGamer3456","du_xl","emptypods","2PlaMMyTH","Qtavy","LIL_LOKE","ThipThip2013_TH","aleztby10","iEXLIMEA","SaintPinkcano"}
local final = {}


print("Initializing Data...")
notif("LoggerWatch Started","Parsing player list")
for index,value in pairs(init) do
	if type(value) == "string" then
		final[index] = GetId(value)
	elseif type(value) == "number" then
		final[index] = index
	end
end
notif("Log Watch Started","Looking out for known loggers.",10)
-- DO STUFF

for index,value in next, game.Players:GetChildren() do
	for index2,value2 in pairs(final) do
		print(tostring(value).." Player")
		print(GetId(value).."List")
		if GetId(value) == value2 then
			alert()
		end
	end
end
print("End of GetChildren")
for index,value in pairs(final) do
	print(index.." is "..value)
end
Players.PlayerAdded:Connect(function(Player)
	for index2,value2 in final do
	    print(tostring(Player))
	    print(value2)
		if value == value2 then
			alert()
		end
	end
end)
