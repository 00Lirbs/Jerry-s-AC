local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerScripts = player:WaitForChild("PlayerScripts")

local Starter = 1.75
local scripts = {}

task.wait(Starter)

for _, obj in ipairs(playerScripts:GetDescendants()) do
	if obj:IsA("LocalScript") or obj:IsA("Script") then
		scripts[obj] = true
	end
end

print("[Jerry's AC] Jerry's AC Started")

playerScripts.DescendantAdded:Connect(function(obj)
	if not (obj:IsA("LocalScript") or obj:IsA("Script")) then
		return
	end

	if scripts[obj] then
		return
	end

	warn("[Jerry's AC] New script detected:")
	warn("Name:", obj.Name)
	warn("From:", obj:GetFullName())

	player:Kick("Jerry's AC: Script detected, You have been kicked")
end)