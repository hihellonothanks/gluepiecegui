-- https ://xheptcofficial.gitbook.io/kavo-library/

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Glue Piece", "DarkTheme")

local Tab = Window:NewTab("Main")

local Section = Tab:NewSection("Autofarm")

local VUser = game:GetService('VirtualUser') 

local Plr = game:GetService("Players").LocalPlayer

local child = game.Players.LocalPlayer.Backpack:GetChildren()

local toolname = nil

local h = game.Players.LocalPlayer.Character.Torso

local ds = {}
    for i,v in pairs(child) do
       table.insert(ds, v.Name)
    end
    
local toolselect = Section:NewDropdown("Select Tool", "DropdownInf", ds, function(currentOption)
    toolname = currentOption
end)

Section:NewButton("Refresh Tools", "Refreshes Dropdown", function()
    local child2 = game.Players.LocalPlayer.Backpack:GetChildren()
    local ds2 = {}
    for i,v in pairs(child2) do
       table.insert(ds2, v.Name)
    end
  toolselect:Refresh(ds2)
end)

_G.autoequip = nil
Section:NewToggle("Auto Equip Tools", "ToggleInfo", function(state)
    if state then
        _G.autoequip = true
while _G.autoequip do
    wait()
    pcall(function()
        if Plr.Backpack:FindFirstChild(toolname) and Plr.Character:FindFirstChild(toolname) == nil then
            local tool = Plr.Backpack:FindFirstChild(toolname)
            Plr.Character.Humanoid:EquipTool(tool)
        end
    end)
end
    else
        _G.autoequip = false
    end
end)

Section:NewToggle("Auto Attack", "ToggleInfo", function(state)
    _G.autoattack = nil
    if state then
_G.autoattack = true
    else
_G.autoattack = false
    end
    
    while _G.autoattack do
wait(0.15)
VUser:Button1Down(Vector2.new(math.huge,math.huge));
VUser:Button1Up(Vector2.new(math.huge,math.huge));
end
end)


 --[[
 
_G.autobuso = nil
_G.alive = nil

        game:GetService('Players').PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("Humanoid").Died:Connect(function()
			_G.alive = false
			wait(4)
			_G.alive = true
		end)
	end)
end)

Section:NewToggle("Auto Buso", "ToggleInfo", function(state)
    if state then
        print("autobuso true")
        _G.autobuso = true
    else
        print("autobuso false")
        _G.autobuso = false
    end
    
    while _G.autobuso do wait()

function activate()
if not h:FindFirstChildWhichIsA("ParticleEmitter") then
    if game.Players.LocalPlayer.Character.Humanoid.Health > 0 and _G.alive then
        wait(4)
game:GetService("ReplicatedStorage").RemoteEvent.Haki.Haki:FireServer("BusoHaki")
end
end
end 


activate()
end
end)

--]]

local target = nil
Section:NewDropdown("Select Target", "DropdownInf", {
    "Chara",
    "Cutie Noob",
    "Duck Boss",
    "King Noob",
    "Sans",
    "Sword Master"
}, function(currentOption)
    print(currentOption)
    target = currentOption
end)

_G.distance = nil
Section:NewSlider("Distance", "SliderInfo", 20, -20, function(s) -- 500 (MaxValue) | 0 (MinValue)
    _G.distance = s
end)

_G.tping = nil
Section:NewToggle("Autofarm Target", "ToggleInfo", function(state2)
if state2 then
    _G.tping = true
    else
    _G.tping = false
end
    while _G.tping do wait()

           game:GetService("RunService").RenderStepped:Connect(function()
               if _G.tping then
    Plr.Character.Humanoid:ChangeState(11)
    end
           end)

if _G.distance < 0 then
game.Players.LocalPlayer.DevCameraOcclusionMode = "Invisicam"
else
game.Players.LocalPlayer.DevCameraOcclusionMode = "Zoom"
end

        wait(0.5)
    for _,v in pairs(game.Workspace:GetDescendants()) do
  if string.find(v.Name, target) and v:FindFirstChild("HumanoidRootPart") ~= nil then
      if v:FindFirstChild("Humanoid").Health > 0 then
      game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v:WaitForChild("HumanoidRootPart").CFrame*CFrame.new(0, _G.distance, 0)
      Plr.Character.HumanoidRootPart.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position, v.HumanoidRootPart.Position)
      end
  end
    end
    end
end)


local Section = Tab:NewSection("Other")

Section:NewButton("Buy Random Fruity (500k)", "Buys a random fruit.", function()
    game:GetService("ReplicatedStorage").RemoteEvent.Reset.Reset:FireServer("Random DF", "Money")
end)



local Tab2 = Window:NewTab("Teleports")

local Section2 = Tab2:NewSection("Island Teleports")

local destination = {
    desX = nil,
    desY = nil,
    desZ = nil
}
Section2:NewDropdown("Select Island", "DropdownInf", {
    "Desert Island",
    "Duck Island",
    "Evil Thug Island",
    "MihanoMikura Island",
    "Noob Island",
    "Sans Island",
    "Sky Island",
    "Slime Island",
    "Small Island",
    "Snake Island",
    "Snow Island",
    "Sword Master Island",
    "Thug Island"
}, function(currentOption2)
    print(currentOption2)
    
    if currentOption2 == "Thug Island" then
    destination["desX"] = -118
    destination["desY"] = 13
    destination["desZ"] = 30
    elseif currentOption2 == "Evil Thug Island" then
    destination["desX"] = -956
    destination["desY"] = 13
    destination["desZ"] = 191
    elseif currentOption2 == "Snake Island" then
    destination["desX"] = -622
    destination["desY"] = 30
    destination["desZ"] = -1787
    elseif currentOption2 == "Slime Island" then
    destination["desX"] = -19
    destination["desY"] = 11
    destination["desZ"] = -947
    elseif currentOption2 == "Snow Island" then
    destination["desX"] = -426
    destination["desY"] = 11
    destination["desZ"] = 1874
    elseif currentOption2 == "MihanoMikura Island" then
    destination["desX"] = -1166
    destination["desY"] = 11
    destination["desZ"] = -945
    elseif currentOption2 == "Sky Island" then
    destination["desX"] = -1762
    destination["desY"] = 438
    destination["desZ"] = -1075
    elseif currentOption2 == "Desert Island" then
    destination["desX"] = -1708
    destination["desY"] = 11
    destination["desZ"] = -1833
    elseif currentOption2 == "Small Island" then
    destination["desX"] = 12
    destination["desY"] = 14
    destination["desZ"] = 571
    elseif currentOption2 == "Duck Island" then
    destination["desX"] = -2793
    destination["desY"] = 11
    destination["desZ"] = -167
    elseif currentOption2 == "Sword Master Island" then
    destination["desX"] = -1961
    destination["desY"] = 17
    destination["desZ"] = 1376
    elseif currentOption2 == "Sans Island" then
    destination["desX"] = 457
    destination["desY"] = 13
    destination["desZ"] = 2272
    elseif currentOption2 == "Noob Island" then
    destination["desX"] = -2761
    destination["desY"] = 17
    destination["desZ"] = 834
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(destination["desX"], destination["desY"], destination["desZ"])
end)


---------------

local Tab3 = Window:NewTab("Other")
local Section3 = Tab3:NewSection("Credits:")
local Section4 = Tab3:NewSection("UI Libary: xHeptc @v3rm")
local Section5 = Tab3:NewSection("Script: hi")
