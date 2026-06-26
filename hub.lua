local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TilinHubPro"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 650, 0, 700)
MainFrame.Position = UDim2.new(0.5, -325, 0.5, -350)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 60)
Header.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 15)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -100, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "⚡ TILIN HUB - MUSCLE LEGENDS"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.Parent = Header

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Size = UDim2.new(0, 35, 0, 35)
MinimizeBtn.Position = UDim2.new(1, -75, 0, 12)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 150, 0)
MinimizeBtn.TextColor3 = Color3.new(1, 1, 1)
MinimizeBtn.Text = "−"
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 24
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Parent = Header

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 8)
MinimizeCorner.Parent = MinimizeBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -35, 0, 12)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Text = "✕"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 20
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	if isMinimized then
		MainFrame.Size = UDim2.new(0, 650, 0, 60)
		MinimizeBtn.Text = "□"
	else
		MainFrame.Size = UDim2.new(0, 650, 0, 700)
		MinimizeBtn.Text = "−"
	end
end)

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

local ButtonContainer = Instance.new("ScrollingFrame")
ButtonContainer.Name = "ButtonContainer"
ButtonContainer.Size = UDim2.new(1, 0, 1, -60)
ButtonContainer.Position = UDim2.new(0, 0, 0, 60)
ButtonContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ButtonContainer.BorderSizePixel = 0
ButtonContainer.ScrollBarThickness = 8
ButtonContainer.ScrollBarImageColor3 = Color3.fromRGB(0, 120, 255)
ButtonContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
ButtonContainer.Parent = MainFrame

local GridLayout = Instance.new("UIGridLayout")
GridLayout.CellPadding = UDim2.new(0, 12, 0, 12)
GridLayout.CellSize = UDim2.new(0, 150, 0, 60)
GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
GridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
GridLayout.Parent = ButtonContainer

local Padding = Instance.new("UIPadding")
Padding.PaddingLeft = UDim.new(0, 10)
Padding.PaddingRight = UDim.new(0, 10)
Padding.PaddingTop = UDim.new(0, 15)
Padding.PaddingBottom = UDim.new(0, 10)
Padding.Parent = ButtonContainer

local function CreateButton(name, callback, icon)
	local Button = Instance.new("TextButton")
	Button.Name = name
	Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.Text = (icon or "▶") .. "\n" .. name
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 12
	Button.BorderSizePixel = 0
	Button.Parent = ButtonContainer
	
	local ButtonCorner = Instance.new("UICorner")
	ButtonCorner.CornerRadius = UDim.new(0, 10)
	ButtonCorner.Parent = Button
	
	Button.MouseButton1Click:Connect(callback)
	
	Button.MouseEnter:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
	end)
	
	Button.MouseLeave:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	end)
end

GridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	ButtonContainer.CanvasSize = UDim2.new(0, 0, 0, GridLayout.AbsoluteContentSize.Y + 20)
end)

-- Variables globales
local autoClickActive = false
local autoUpgradeActive = false
local speedBoostActive = false
local infStaminaActive = false
local noDamageActive = false

-- Botones
CreateButton("Auto Click", function()
	autoClickActive = not autoClickActive
	if autoClickActive then
		spawn(function()
			while autoClickActive do
				local args = {[1] = "Punch"}
				pcall(function()
					game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
				end)
				wait(0.05)
			end
		end)
	end
end, "👊")

CreateButton("Auto Upgrade", function()
	autoUpgradeActive = not autoUpgradeActive
	if autoUpgradeActive then
		spawn(function()
			while autoUpgradeActive do
				local args = {[1] = "AddStrength", [2] = 5}
				pcall(function()
					game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
				end)
				wait(0.3)
			end
		end)
	end
end, "📈")

CreateButton("Speed Boost", function()
	speedBoostActive = not speedBoostActive
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		if speedBoostActive then
			player.Character.Humanoid.WalkSpeed = 60
		else
			player.Character.Humanoid.WalkSpeed = 16
		end
	end
end, "⚡")

CreateButton("Inf Stamina", function()
	infStaminaActive = not infStaminaActive
	if infStaminaActive then
		spawn(function()
			while infStaminaActive do
				if player.Character and player.Character:FindFirstChild("Humanoid") then
					player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
				end
				wait(0.5)
			end
		end)
	end
end, "❤️")

CreateButton("No Damage", function()
	noDamageActive = not noDamageActive
	if player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid.MaxHealth = 999999
		player.Character.Humanoid.Health = 999999
	end
end, "🛡️")

CreateButton("Teleport Gym", function()
	if player.Character then
		player.Character:MoveTo(Vector3.new(50, 5, 50))
	end
end, "🏋️")

CreateButton("Teleport Boss", function()
	if player.Character then
		player.Character:MoveTo(Vector3.new(-100, 5, -100))
	end
end, "👹")

CreateButton("Get Money", function()
	local args = {[1] = "CollectMoney"}
	pcall(function()
		game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
	end)
end, "💰")

CreateButton("Random Teleport", function()
	if player.Character then
		local x = math.random(-200, 200)
		local z = math.random(-200, 200)
		player.Character:MoveTo(Vector3.new(x, 10, z))
	end
end, "🌀")

CreateButton("Full Stats", function()
	local args = {[1] = "MaxAll"}
	pcall(function()
		game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
	end)
end, "⭐")

CreateButton("Reset Stats", function()
	local args = {[1] = "ResetStats"}
	pcall(function()
		game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
	end)
end, "🔄")

CreateButton("Noclip", function()
	if player.Character then
		for _, part in pairs(player.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end, "👻")

print("✅ Tilin Hub - Muscle Legends Cargado!")
print("UI Minimalizado: Click en −")
