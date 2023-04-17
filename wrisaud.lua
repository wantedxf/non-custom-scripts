

repeat wait() until game:IsLoaded()
    wait(2)
    local clans = {"Uryu", "Kurosaki"} -- Will SPIN TILL IT GETS ONE OF THESE U CAN ADD MORE IF U WANT
    local url = "https://canary.discord.com/api/webhooks/1097443720930017310/C7Dg9n8No1tg-_Y-oWMooIIXvbsYi8rsLE9kVOFc4vrdcHN43JE-7qykWfsHe1PlRo49" -- put ur webhook here (NOTIFY YOU IF U GET ONE OF THE CLANS U WANT)

    game:GetService("ReplicatedStorage").Change_Slot:InvokeServer(1)

    function redeem()
        local a = {"35KLIKES", "SORRYFORSHUTDOWN", "RELEASE", "EXPLOITFIXES", "SHUTDOWNSPINS"}

        for _, itemName in pairs(a) do
            game:GetService("ReplicatedStorage").Code:InvokeServer(itemName)
        end
    end

    redeem()
    wait(2)

    function spin()
        local user = tostring(game.Players.LocalPlayer)

        _G.loop = true
        while _G.loop do
            game:GetService("ReplicatedStorage").Spin:InvokeServer(1)
            task.wait(0.1)
            local found = false

            for i=1, #clans do
                if clans[i]:lower() == game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value:lower() then
                    found = true
                    break
                end
            end

            if found then
                print("YAYYYYY YOU GOT "..tostring(game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value))
                local data = {
                    ["content"] = "<@732153746309644300> YOU ROLLED SOMETHING",
                    ["username"] = "dominic boushel",
                    ["avatar_url"] = "https://a.espncdn.com/combiner/i?img=/i/headshots/mma/players/full/2335639.png",
                    }
                local newdata = game:GetService("HttpService"):JSONEncode(data)
                local headers = {
                    ["content-type"] = "application/json"
                }
                request = http_request or request or HttpPost or syn.request
                local send = {Url = url, Body = newdata, Method = "POST", Headers = headers}
                request(send)
                _G.loop = false
            else
                print("Rolled "..tostring(game:GetService("ReplicatedStorage")["Player_Datas"][user]["Slot_1"].Clan.Value))
            end
        end
    end

    spin()
