--Script by LaTehuana

local players = game:GetService("Players")

local incinerator = workspace.Incinerator
local fire = incinerator.FireParticle
local sound = incinerator.Explode
local block = script.Parent

local debounce = false

block.Touched:Connect(function(touchingPart)
    if debounce then
        return
    end
    
    if touchingPart == incinerator then
        debounce = true
        
        local player = players:GetPlayers()[1] --single player game so we can simply index the first item to get the only player instance
        local leaderstats = player.leaderstats
        local boxes = leaderstats.Boxes
        local cash = leaderstats.Cash
        boxes.Value += 1
        cash.Value += 1
        
        fire.Enabled = true
        sound:Play()
        wait(0.1)
        block:Destroy()
        debounce = false
        wait(0.6)
        sound:Stop()
        fire.Enabled = false
    end
end)
