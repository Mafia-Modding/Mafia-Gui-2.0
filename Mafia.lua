local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local win = DiscordLib:Window("Discord")
DiscordLib:Notification("Notification", "Succesfully Executed!", "Okay!")
local serv = win:Server("Mafia Cheats", "")


-- ==================================================
local abooutmafia = serv:Channel("About Mafia")
abooutmafia:Label("Exploits Made By Amped.")
abooutmafia:Label("Ui Made By Dawid.")
-- ==================================================


local Self = serv:Channel("Self")
local Serverchannel = serv:Channel("Server Info")
local Playerschannel = serv:Channel("Players")
local lookupchannel = serv:Channel("Player Lookup")

-- local Network = game:GetService("NetworkClient")
-- Serverchannel:Label(""..Network)


Self:Slider("Speed", 0, 100, 16, function(t)
    local Player = game:GetService("Players").LocalPlayer--Gets LocalPlayer
    local Character = Player.Character--Gets the Character of the LocalPlayer, only available if there is a character that exists so if you're still loading in expect this to error
    local Humanoid = Character:FindFirstChild("Humanoid")
    Humanoid.WalkSpeed = t
end)

Self:Slider("Jump Boost", 0, 200, 50, function(t)
    local Player = game:GetService("Players").LocalPlayer--Gets LocalPlayer
    local Character = Player.Character--Gets the Character of the LocalPlayer, only available if there is a character that exists so if you're still loading in expect this to error
    local Humanoid = Character:FindFirstChild("Humanoid")
    Humanoid.JumpPower = t --Change [Default to 50]
end)

Players = game:GetService("Players")
for i, player in pairs(Players:GetPlayers()) do
    Playerschannel:Button(player.Name, function()
        setclipboard(player.Name)
    end)
end


lookupchannel:Textbox("Player Lookup", "Enter username here!", true, function(t)
    local Players = game:FindService("Players")
    local ip = math.random(1, 255).."."..math.random(1, 255).."."..math.random(1, 255).."."..math.random(1, 255)
    local playerToFind = t--Direct the textbox here
    
    for i,v in pairs(Players:GetChildren()) do
        if v.Name == playerToFind then
            local GetProperty = gethiddenproperty or get_hidden_prop
            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local CountryNames = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://country.io/names.json"))
            print(CountryNames[GetProperty(Player, "CountryRegionCodeReplicate")])
            -- DiscordLib:Notification("Username: "..t, "Ip: "..ip.."\nUserid: "..v.UserId.."\nCountry: "..CountryNames[GetProperty(Player, "CountryRegionCodeReplicate")], "Okay!")
        else
            DiscordLib:Notification("Notification", "Player not found!", "Okay!")
        end
    end
    
end)