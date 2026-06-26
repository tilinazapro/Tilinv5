local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TilinLunaHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Container
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 900, 0, 550)
MainFrame.Position = UDim2.new(0.5, -450, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- TOP BAR
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 80)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 15)
TopCorner.Parent = TopBar

-- Logo/Title
local LogoLabel = Instance.new("TextLabel")
LogoLabel.Size = UDim2.new(0, 400, 1, 0)
LogoLabel.BackgroundTransparency = 1
LogoLabel.Text = "TILIN HUB"
LogoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoLabel.TextSize = 48
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.TextXAlignment = Enum.TextXAlignment.Left
LogoLabel.Parent = TopBar

local Padding1 = Instance.new("UIPadding")
Padding1.PaddingLeft = UDim.new(0, 30)
Padding1.Parent = LogoLabel

-- Subtitle
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(0, 400, 0, 25)
SubTitle.Position = UDim2.new(0, 30, 0, 50)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Muscle Legends | Advanced Trainer"
SubTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
SubTitle.TextSize = 12
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.Parent = TopBar

-- Buttons area
local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Size = UDim2.new(0, 350, 1, 0)
ButtonsFrame.Position = UDim2.new(1, -370, 0, 0)
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.Parent = TopBar

local ButtonsLayout = Instance.new("UIListLayout")
ButtonsLayout.FillDirection = Enum.FillDirection.Horizontal
ButtonsLayout.Padding = UDim.new(0, 10)
ButtonsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
ButtonsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
ButtonsLayout.Parent = ButtonsFrame

local ButtonsPadding = Instance.new("UIPadding")
ButtonsPadding.PaddingRight = UDim.new(0, 20)
ButtonsPadding.PaddingTop = UDim.new(0, 15)
ButtonsPadding.PaddingBottom = UDim.new(0, 15)
ButtonsPadding.Parent = ButtonsFrame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 50, 0, 50)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Text = "✕"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 24
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = ButtonsFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

CloseBtn.MouseEnter:Connect(function()
	CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
end)

CloseBtn.MouseLeave:Connect(function()
	CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
end)

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 50, 0, 50)
MinBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.Text = "−"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 28
MinBtn.BorderSizePixel = 0
MinBtn.Parent = ButtonsFrame

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 10)
MinCorner.Parent = MinBtn

local isMinimized = false
MinBtn.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	if isMinimized then
		MainFrame.Size = UDim2.new(0, 900, 0, 80)
		MinBtn.Text = "□"
	else
		MainFrame.Size = UDim2.new(0, 900, 0, 550)
		MinBtn.Text = "−"
	end
end)

MinBtn.MouseEnter:Connect(function()
	MinBtn.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
end)

MinBtn.MouseLeave:Connect(function()
	MinBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
end)

-- Content Area
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -80)
ContentFrame.Position = UDim2.new(0, 0, 0, 80)
ContentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame

-- LEFT SIDEBAR
local LeftSidebar = Instance.new("ScrollingFrame")
LeftSidebar.Name = "LeftSidebar"
LeftSidebar.Size = UDim2.new(0, 180, 1, 0)
LeftSidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LeftSidebarBorderSizePixel = 0
LeftSidebar.ScrollBarThickness = 5
LeftSidebar.Parent = ContentFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 8)
SidebarLayout.FillDirection = Enum.FillDirection.Vertical
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Parent = LeftSidebar

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingLeft = UDim.new(0, 10)
SidebarPadding.PaddingRight = UDim.new(0, 10)
SidebarPadding.PaddingTop = UDim.new(0, 10)
SidebarPadding.PaddingBottom = UDim.new(0, 10)
SidebarPadding.Parent = LeftSidebar

-- RIGHT CONTENT
local RightContent = Instance.new("ScrollingFrame")
RightContent.Name = "RightContent"
RightContent.Size = UDim2.new(1, -180, 1, 0)
RightContent.Position = UDim2.new(0, 180, 0, 0)
RightContent.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
RightContent.BorderSizePixel = 0
RightContent.ScrollBarThickness = 5
RightContent.ScrollBarImageColor3 = Color3.fromRGB(100, 0, 0)
RightContent.Parent = ContentFrame

local ContentLayout = Instance.new("UIGridLayout")
ContentLayout.CellPadding = UDim2.new(0, 15, 0, 15)
ContentLayout.CellSize = UDim2.new(0, 160, 0, 70)
ContentLayout.FillDirection = Enum.FillDirection.Horizontal
ContentLayout.FillDirectionMaxCells = 4
ContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Parent = RightContent

local ContentPadding = Instance.new("UIPadding")
ContentPadding.PaddingLeft = UDim.new(0, 15)
ContentPadding.PaddingRight = UDim.new(0, 15)
ContentPadding.PaddingTop = UDim.new(0, 15)
ContentPadding.PaddingBottom = UDim.new(0, 15)
ContentPadding.Parent = RightContent

-- Variables
local currentCategory = nil
local features = {}
local toggleStates = {}

-- Function to create category button
local function CreateCategoryButton(name, icon, categoryKey)
	local Button = Instance.new("TextButton")
	Button.Name = categoryKey
	Button.Size = UDim2.new(1, -20, 0, 45)
	Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Button.TextColor3 = Color3.fromRGB(180, 180, 180)
	Button.Text = icon .. " " .. name
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 13
	Button.BorderSizePixel = 0
	Button.Parent = LeftSidebar
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 8)
	Corner.Parent = Button
	
	Button.MouseButton1Click:Connect(function()
		currentCategory = categoryKey
		RightContent:ClearAllChildren()
		ContentLayout.Parent = RightContent
		ContentPadding.Parent = RightContent
		
		if features[categoryKey] then
			for _, featureFunc in ipairs(features[categoryKey]) do
				featureFunc()
			end
		end
		
		-- Update button colors
		for _, btn in pairs(LeftSidebar:GetChildren()) do
			if btn:IsA("TextButton") then
				if btn.Name == categoryKey then
					btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
					btn.TextColor3 = Color3.fromRGB(255, 255, 255)
				else
					btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
					btn.TextColor3 = Color3.fromRGB(180, 180, 180)
				end
			end
		end
	end)
	
	Button.MouseEnter:Connect(function()
		if currentCategory ~= categoryKey then
			Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		end
	end)
	
	Button.MouseLeave:Connect(function()
		if currentCategory ~= categoryKey then
			Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		end
	end)
end

-- Function to create toggle feature
local function CreateFeature(label, icon, key, callback)
	local FeatureFrame = Instance.new("Frame")
	FeatureFrame.Size = UDim2.new(1, 0, 0, 65)
	FeatureFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	FeatureFrame.BorderSizePixel = 0
	FeatureFrame.Parent = RightContent
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 10)
	Corner.Parent = FeatureFrame
	
	local Label = Instance.new("TextLabel")
	Label.Size = UDim2.new(1, -20, 0, 30)
	Label.Position = UDim2.new(0, 10, 0, 5)
	Label.BackgroundTransparency = 1
	Label.Text = icon .. " " .. label
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.Font = Enum.Font.GothamBold
	Label.TextSize = 13
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = FeatureFrame
	
	local ToggleButton = Instance.new("TextButton")
	ToggleButton.Size = UDim2.new(0, 45, 0, 25)
	ToggleButton.Position = UDim2.new(1, -55, 0, 35)
	ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	ToggleButton.TextColor3 = Color3.new(1, 1, 1)
	ToggleButton.Text = "OFF"
	ToggleButton.Font = Enum.Font.GothamBold
	ToggleButton.TextSize = 11
	ToggleButton.BorderSizePixel = 0
	ToggleButton.Parent = FeatureFrame
	
	local ToggleCorner = Instance.new("UICorner")
	ToggleCorner.CornerRadius = UDim.new(0, 6)
	ToggleCorner.Parent = ToggleButton
	
	toggleStates[key] = false
	
	ToggleButton.MouseButton1Click:Connect(function()
		toggleStates[key] = not toggleStates[key]
		if toggleStates[key] then
			ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
			ToggleButton.Text = "ON"
			callback(true)
		else
			ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			ToggleButton.Text = "OFF"
			callback(false)
		end
	end)
	
	ToggleButton.MouseEnter:Connect(function()
		if toggleStates[key] then
			ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
		else
			ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		end
	end)
	
	ToggleButton.MouseLeave:Connect(function()
		if toggleStates[key] then
			ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
		else
			ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
		end
	end)
end

-- Function to create action button
local function CreateActionButton(label, icon, callback)
	local ActionButton = Instance.new("TextButton")
	ActionButton.Size = UDim2.new(1, 0, 0, 65)
	ActionButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	ActionButton.TextColor3 = Color3.new(1, 1, 1)
	ActionButton.Text = icon .. "\n" .. label
	ActionButton.Font = Enum.Font.GothamBold
	ActionButton.TextSize = 12
	ActionButton.BorderSizePixel = 0
	ActionButton.Parent = RightContent
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 10)
	Corner.Parent = ActionButton
	
	ActionButton.MouseButton1Click:Connect(callback)
	
	ActionButton.MouseEnter:Connect(function()
		ActionButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
	end)
	
	ActionButton.MouseLeave:Connect(function()
		ActionButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	end)
end

-- CATEGORIES

-- Training
features["Training"] = {
	function()
		CreateFeature("Auto Punch", "👊", "autoPunch", function(state)
			if state then
				spawn(function()
					while toggleStates["autoPunch"] do
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Punch"):FireServer()
						end)
						wait(0.05)
					end
				end)
			end
		end)
		
		CreateFeature("Auto Lift", "🏋️", "autoLift", function(state)
			if state then
				spawn(function()
					while toggleStates["autoLift"] do
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Lift"):FireServer()
						end)
						wait(0.1)
					end
				end)
			end
		end)
		
		CreateFeature("Auto Run", "🏃", "autoRun", function(state)
			if state then
				spawn(function()
					while toggleStates["autoRun"] do
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Run"):FireServer()
						end)
						wait(0.08)
					end
				end)
			end
		end)
		
		CreateActionButton("Max Stats", "⭐", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MaxStats"):FireServer()
			end)
		end)
	end
}

-- Movement
features["Movement"] = {
	function()
		CreateFeature("Speed 3x", "⚡", "speed3x", function(state)
			if player.Character and player.Character:FindFirstChild("Humanoid") then
				if state then
					player.Character.Humanoid.WalkSpeed = 48
				else
					player.Character.Humanoid.WalkSpeed = 16
				end
			end
		end)
		
		CreateFeature("Speed 5x", "💨", "speed5x", function(state)
			if player.Character and player.Character:FindFirstChild("Humanoid") then
				if state then
					player.Character.Humanoid.WalkSpeed = 80
				else
					player.Character.Humanoid.WalkSpeed = 16
				end
			end
		end)
		
		CreateActionButton("TP Gym", "🏋️", function()
			if player.Character then
				player.Character:MoveTo(Vector3.new(50, 5, 50))
			end
		end)
		
		CreateActionButton("TP Arena", "👹", function()
			if player.Character then
				player.Character:MoveTo(Vector3.new(-100, 5, -100))
			end
		end)
	end
}

-- Combat
features["Combat"] = {
	function()
		CreateFeature("Inf Health", "❤️", "infHealth", function(state)
			if state then
				spawn(function()
					while toggleStates["infHealth"] do
						if player.Character and player.Character:FindFirstChild("Humanoid") then
							player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
						end
						wait(0.5)
					end
				end)
			end
		end)
		
		CreateFeature("No Damage", "🛡️", "noDamage", function(state)
			if player.Character and player.Character:FindFirstChild("Humanoid") then
				if state then
					player.Character.Humanoid.MaxHealth = 999999
					player.Character.Humanoid.Health = 999999
				end
			end
		end)
		
		CreateFeature("Noclip", "👻", "noclip", function(state)
			if player.Character then
				for _, part in pairs(player.Character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = not state
					end
				end
			end
		end)
		
		CreateActionButton("Reset", "🔄", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ResetStats"):FireServer()
			end)
		end)
	end
}

-- Money
features["Money"] = {
	function()
		CreateActionButton("Collect", "💰", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CollectMoney"):FireServer()
			end)
		end)
		
		CreateActionButton("Daily", "🎁", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DailyReward"):FireServer()
			end)
		end)
		
		CreateFeature("Auto Farm", "💵", "autoFarm", function(state)
			if state then
				spawn(function()
					while toggleStates["autoFarm"] do
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CollectMoney"):FireServer()
						end)
						wait(1)
					end
				end)
			end
		end)
		
		CreateActionButton("Free Pass", "🎟️", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("FreePasses"):FireServer()
			end)
		end)
	end
}

-- Other
features["Other"] = {
	function()
		CreateActionButton("No Shadows", "🌑", function()
			game.Lighting.GlobalShadows = false
		end)
		
		CreateFeature("Auto Equip", "⚙️", "autoEquip", function(state)
			if state then
				spawn(function()
					while toggleStates["autoEquip"] do
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("EquipBest"):FireServer()
						end)
						wait(5)
					end
				end)
			end
		end)
		
		CreateActionButton("Best Gear", "🎯", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("EquipBest"):FireServer()
			end)
		end)
	end
}

-- Create category buttons
CreateCategoryButton("Training", "🏋️", "Training")
CreateCategoryButton("Movement", "⚡", "Movement")
CreateCategoryButton("Combat", "👊", "Combat")
CreateCategoryButton("Money", "💰", "Money")
CreateCategoryButton("Other", "⚙️", "Other")

-- Load first category
currentCategory = "Training"
local firstBtn = LeftSidebar:FindFirstChild("Training")
if firstBtn then
	firstBtn:MouseButton1Click()
end

-- Auto-update canvas sizes
SidebarLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	LeftSidebar.CanvasSize = UDim2.new(0, 0, 0, SidebarLayout.AbsoluteContentSize.Y + 20)
end)

ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	RightContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 30)
end)

print("✅ TILIN HUB - Muscle Legends")
print("🚀 Luna Hub Style | Ready to Train!")
