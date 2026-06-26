local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TilinNeonHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Container
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 700, 0, 500)
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

-- TOP BAR with Neon Glow
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 70)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 10, 30)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopGlow = Instance.new("UIStroke")
TopGlow.Color = Color3.fromRGB(0, 255, 255)
TopGlow.Thickness = 2
TopGlow.Parent = TopBar

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 20)
TopCorner.Parent = TopBar

-- Logo/Title with Neon Effect
local LogoLabel = Instance.new("TextLabel")
LogoLabel.Size = UDim2.new(0, 400, 1, 0)
LogoLabel.BackgroundTransparency = 1
LogoLabel.Text = "⚡ TILIN HUB ⚡"
LogoLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
LogoLabel.TextSize = 42
LogoLabel.Font = Enum.Font.GothamBlack
LogoLabel.TextXAlignment = Enum.TextXAlignment.Left
LogoLabel.Parent = TopBar

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(255, 0, 255)
LogoStroke.Thickness = 1
LogoStroke.Parent = LogoLabel

local Padding1 = Instance.new("UIPadding")
Padding1.PaddingLeft = UDim.new(0, 20)
Padding1.PaddingTop = UDim.new(0, 10)
Padding1.Parent = LogoLabel

-- Subtitle
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(0, 400, 0, 20)
SubTitle.Position = UDim2.new(0, 20, 0, 48)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Muscle Legends | Advanced Trainer"
SubTitle.TextColor3 = Color3.fromRGB(0, 255, 150)
SubTitle.TextSize = 11
SubTitle.Font = Enum.Font.GothamBold
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.Parent = TopBar

-- Buttons area
local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Size = UDim2.new(0, 250, 1, 0)
ButtonsFrame.Position = UDim2.new(1, -270, 0, 0)
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.Parent = TopBar

local ButtonsLayout = Instance.new("UIListLayout")
ButtonsLayout.FillDirection = Enum.FillDirection.Horizontal
ButtonsLayout.Padding = UDim.new(0, 12)
ButtonsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
ButtonsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
ButtonsLayout.Parent = ButtonsFrame

local ButtonsPadding = Instance.new("UIPadding")
ButtonsPadding.PaddingRight = UDim.new(0, 15)
ButtonsPadding.PaddingTop = UDim.new(0, 12)
ButtonsPadding.PaddingBottom = UDim.new(0, 12)
ButtonsPadding.Parent = ButtonsFrame

-- Close Button with Neon
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 45, 0, 45)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Text = "✕"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 22
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = ButtonsFrame

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Color = Color3.fromRGB(255, 100, 200)
CloseStroke.Thickness = 2
CloseStroke.Parent = CloseBtn

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

CloseBtn.MouseEnter:Connect(function()
	CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 150)
end)

CloseBtn.MouseLeave:Connect(function()
	CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
end)

-- Minimize Button
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 45, 0, 45)
MinBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.Text = "−"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 26
MinBtn.BorderSizePixel = 0
MinBtn.Parent = ButtonsFrame

local MinStroke = Instance.new("UIStroke")
MinStroke.Color = Color3.fromRGB(0, 255, 255)
MinStroke.Thickness = 2
MinStroke.Parent = MinBtn

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinBtn

local isMinimized = false
MinBtn.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	if isMinimized then
		MainFrame.Size = UDim2.new(0, 700, 0, 70)
		MinBtn.Text = "□"
	else
		MainFrame.Size = UDim2.new(0, 700, 0, 500)
		MinBtn.Text = "−"
	end
end)

MinBtn.MouseEnter:Connect(function()
	MinBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
end)

MinBtn.MouseLeave:Connect(function()
	MinBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
end)

-- Content Area
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -70)
ContentFrame.Position = UDim2.new(0, 0, 0, 70)
ContentFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame

-- LEFT SIDEBAR
local LeftSidebar = Instance.new("ScrollingFrame")
LeftSidebar.Name = "LeftSidebar"
LeftSidebar.Size = UDim2.new(0, 140, 1, 0)
LeftSidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
LeftSidebar.BorderSizePixel = 0
LeftSidebar.ScrollBarThickness = 4
LeftSidebar.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 255)
LeftSidebar.Parent = ContentFrame

local SidebarGlow = Instance.new("UIStroke")
SidebarGlow.Color = Color3.fromRGB(255, 0, 255)
SidebarGlow.Thickness = 1
SidebarGlow.Parent = LeftSidebar

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 8)
SidebarLayout.FillDirection = Enum.FillDirection.Vertical
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Parent = LeftSidebar

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingLeft = UDim.new(0, 8)
SidebarPadding.PaddingRight = UDim.new(0, 8)
SidebarPadding.PaddingTop = UDim.new(0, 8)
SidebarPadding.PaddingBottom = UDim.new(0, 8)
SidebarPadding.Parent = LeftSidebar

-- RIGHT CONTENT
local RightContent = Instance.new("ScrollingFrame")
RightContent.Name = "RightContent"
RightContent.Size = UDim2.new(1, -140, 1, 0)
RightContent.Position = UDim2.new(0, 140, 0, 0)
RightContent.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
RightContent.BorderSizePixel = 0
RightContent.ScrollBarThickness = 4
RightContent.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 255)
RightContent.Parent = ContentFrame

local ContentLayout = Instance.new("UIGridLayout")
ContentLayout.CellPadding = UDim2.new(0, 12, 0, 12)
ContentLayout.CellSize = UDim2.new(0, 140, 0, 65)
ContentLayout.FillDirection = Enum.FillDirection.Horizontal
ContentLayout.FillDirectionMaxCells = 4
ContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Parent = RightContent

local ContentPadding = Instance.new("UIPadding")
ContentPadding.PaddingLeft = UDim.new(0, 12)
ContentPadding.PaddingRight = UDim.new(0, 12)
ContentPadding.PaddingTop = UDim.new(0, 12)
ContentPadding.PaddingBottom = UDim.new(0, 12)
ContentPadding.Parent = RightContent

-- Variables
local currentCategory = nil
local features = {}
local toggleStates = {}

-- Function to create category button
local function CreateCategoryButton(name, icon, categoryKey)
	local Button = Instance.new("TextButton")
	Button.Name = categoryKey
	Button.Size = UDim2.new(1, -16, 0, 40)
	Button.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
	Button.TextColor3 = Color3.fromRGB(100, 200, 255)
	Button.Text = icon .. " " .. name
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 11
	Button.BorderSizePixel = 0
	Button.Parent = LeftSidebar
	
	local Stroke = Instance.new("UIStroke")
	Stroke.Color = Color3.fromRGB(0, 150, 255)
	Stroke.Thickness = 1
	Stroke.Parent = Button
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 6)
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
					btn.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
					btn.TextColor3 = Color3.fromRGB(255, 50, 200)
					btn.UIStroke.Color = Color3.fromRGB(255, 0, 150)
					btn.UIStroke.Thickness = 2
				else
					btn.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
					btn.TextColor3 = Color3.fromRGB(100, 200, 255)
					btn.UIStroke.Color = Color3.fromRGB(0, 150, 255)
					btn.UIStroke.Thickness = 1
				end
			end
		end
	end)
	
	Button.MouseEnter:Connect(function()
		if currentCategory ~= categoryKey then
			Button.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
		end
	end)
	
	Button.MouseLeave:Connect(function()
		if currentCategory ~= categoryKey then
			Button.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
		end
	end)
end

-- Function to create toggle feature
local function CreateFeature(label, icon, key, callback)
	local FeatureFrame = Instance.new("Frame")
	FeatureFrame.Size = UDim2.new(1, 0, 0, 60)
	FeatureFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
	FeatureFrame.BorderSizePixel = 0
	FeatureFrame.Parent = RightContent
	
	local FeatureStroke = Instance.new("UIStroke")
	FeatureStroke.Color = Color3.fromRGB(0, 255, 150)
	FeatureStroke.Thickness = 1.5
	FeatureStroke.Parent = FeatureFrame
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 8)
	Corner.Parent = FeatureFrame
	
	local Label = Instance.new("TextLabel")
	Label.Size = UDim2.new(1, -55, 0, 28)
	Label.Position = UDim2.new(0, 8, 0, 5)
	Label.BackgroundTransparency = 1
	Label.Text = icon .. " " .. label
	Label.TextColor3 = Color3.fromRGB(0, 255, 200)
	Label.Font = Enum.Font.GothamBold
	Label.TextSize = 11
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = FeatureFrame
	
	local ToggleButton = Instance.new("TextButton")
	ToggleButton.Size = UDim2.new(0, 50, 0, 22)
	ToggleButton.Position = UDim2.new(1, -58, 0, 5)
	ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
	ToggleButton.TextColor3 = Color3.new(1, 1, 1)
	ToggleButton.Text = "OFF"
	ToggleButton.Font = Enum.Font.GothamBold
	ToggleButton.TextSize = 10
	ToggleButton.BorderSizePixel = 0
	ToggleButton.Parent = FeatureFrame
	
	local ToggleStroke = Instance.new("UIStroke")
	ToggleStroke.Color = Color3.fromRGB(255, 0, 100)
	ToggleStroke.Thickness = 1.5
	ToggleStroke.Parent = ToggleButton
	
	local ToggleCorner = Instance.new("UICorner")
	ToggleCorner.CornerRadius = UDim.new(0, 4)
	ToggleCorner.Parent = ToggleButton
	
	toggleStates[key] = false
	
	ToggleButton.MouseButton1Click:Connect(function()
		toggleStates[key] = not toggleStates[key]
		if toggleStates[key] then
			ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
			ToggleButton.UIStroke.Color = Color3.fromRGB(0, 255, 150)
			ToggleButton.Text = "ON"
			callback(true)
		else
			ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
			ToggleButton.UIStroke.Color = Color3.fromRGB(255, 0, 100)
			ToggleButton.Text = "OFF"
			callback(false)
		end
	end)
	
	ToggleButton.MouseEnter:Connect(function()
		if toggleStates[key] then
			ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
		else
			ToggleButton.BackgroundColor3 = Color3.fromRGB(150, 80, 80)
		end
	end)
	
	ToggleButton.MouseLeave:Connect(function()
		if toggleStates[key] then
			ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
		else
			ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
		end
	end)
end

-- Function to create action button
local function CreateActionButton(label, icon, callback)
	local ActionButton = Instance.new("TextButton")
	ActionButton.Size = UDim2.new(1, 0, 0, 60)
	ActionButton.BackgroundColor3 = Color3.fromRGB(150, 0, 100)
	ActionButton.TextColor3 = Color3.fromRGB(255, 100, 200)
	ActionButton.Text = icon .. "\n" .. label
	ActionButton.Font = Enum.Font.GothamBold
	ActionButton.TextSize = 10
	ActionButton.BorderSizePixel = 0
	ActionButton.Parent = RightContent
	
	local ActionStroke = Instance.new("UIStroke")
	ActionStroke.Color = Color3.fromRGB(255, 0, 150)
	ActionStroke.Thickness = 2
	ActionStroke.Parent = ActionButton
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 8)
	Corner.Parent = ActionButton
	
	ActionButton.MouseButton1Click:Connect(callback)
	
	ActionButton.MouseEnter:Connect(function()
		ActionButton.BackgroundColor3 = Color3.fromRGB(200, 0, 150)
		ActionStroke.Color = Color3.fromRGB(255, 100, 200)
	end)
	
	ActionButton.MouseLeave:Connect(function()
		ActionButton.BackgroundColor3 = Color3.fromRGB(150, 0, 100)
		ActionStroke.Color = Color3.fromRGB(255, 0, 150)
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
							local UserInputService = game:GetService("UserInputService")
							UserInputService:SendKeyEvent(true, Enum.KeyCode.E, false)
							wait(0.05)
							UserInputService:SendKeyEvent(false, Enum.KeyCode.E, false)
						end)
						wait(0.1)
					end
				end)
			end
		end)
		
		CreateFeature("Auto Lift", "🏋️", "autoLift", function(state)
			if state then
				spawn(function()
					while toggleStates["autoLift"] do
						pcall(function()
							local UserInputService = game:GetService("UserInputService")
							UserInputService:SendKeyEvent(true, Enum.KeyCode.R, false)
							wait(0.05)
							UserInputService:SendKeyEvent(false, Enum.KeyCode.R, false)
						end)
						wait(0.15)
					end
				end)
			end
		end)
		
		CreateFeature("Auto Run", "🏃", "autoRun", function(state)
			if state then
				spawn(function()
					while toggleStates["autoRun"] do
						pcall(function()
							local UserInputService = game:GetService("UserInputService")
							UserInputService:SendKeyEvent(true, Enum.KeyCode.T, false)
							wait(0.05)
							UserInputService:SendKeyEvent(false, Enum.KeyCode.T, false)
						end)
						wait(0.12)
					end
				end)
			end
		end)
		
		CreateActionButton("Max Stats", "⭐", function()
			pcall(function()
				local players = game:GetService("Players")
				local player = players.LocalPlayer
				if player.Character then
					for i = 1, 50 do
						local UserInputService = game:GetService("UserInputService")
						UserInputService:SendKeyEvent(true, Enum.KeyCode.F, false)
						wait(0.05)
						UserInputService:SendKeyEvent(false, Enum.KeyCode.F, false)
						wait(0.1)
					end
				end
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
						wait(0.3)
					end
				end)
			end
		end)
		
		CreateFeature("No Damage", "🛡️", "noDamage", function(state)
			if player.Character and player.Character:FindFirstChild("Humanoid") then
				if state then
					player.Character.Humanoid.MaxHealth = 999999
					player.Character.Humanoid.Health = 999999
				else
					player.Character.Humanoid.MaxHealth = 100
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
				local UserInputService = game:GetService("UserInputService")
				UserInputService:SendKeyEvent(true, Enum.KeyCode.G, false)
				wait(0.05)
				UserInputService:SendKeyEvent(false, Enum.KeyCode.G, false)
			end)
		end)
	end
}

-- Money
features["Money"] = {
	function()
		CreateActionButton("Collect", "💰", function()
			pcall(function()
				local UserInputService = game:GetService("UserInputService")
				UserInputService:SendKeyEvent(true, Enum.KeyCode.C, false)
				wait(0.05)
				UserInputService:SendKeyEvent(false, Enum.KeyCode.C, false)
			end)
		end)
		
		CreateActionButton("Daily", "🎁", function()
			pcall(function()
				local UserInputService = game:GetService("UserInputService")
				UserInputService:SendKeyEvent(true, Enum.KeyCode.D, false)
				wait(0.05)
				UserInputService:SendKeyEvent(false, Enum.KeyCode.D, false)
			end)
		end)
		
		CreateFeature("Auto Farm", "💵", "autoFarm", function(state)
			if state then
				spawn(function()
					while toggleStates["autoFarm"] do
						pcall(function()
							local UserInputService = game:GetService("UserInputService")
							UserInputService:SendKeyEvent(true, Enum.KeyCode.C, false)
							wait(0.05)
							UserInputService:SendKeyEvent(false, Enum.KeyCode.C, false)
						end)
						wait(2)
					end
				end)
			end
		end)
		
		CreateActionButton("Free Pass", "🎟️", function()
			pcall(function()
				local UserInputService = game:GetService("UserInputService")
				UserInputService:SendKeyEvent(true, Enum.KeyCode.P, false)
				wait(0.05)
				UserInputService:SendKeyEvent(false, Enum.KeyCode.P, false)
			end)
		end)
	end
}

-- Other
features["Other"] = {
	function()
		CreateActionButton("No Shadows", "🌑", function()
			game.Lighting.GlobalShadows = false
			game.Lighting.Brightness = 2
		end)
		
		CreateFeature("Auto Equip", "⚙️", "autoEquip", function(state)
			if state then
				spawn(function()
					while toggleStates["autoEquip"] do
						pcall(function()
							local UserInputService = game:GetService("UserInputService")
							UserInputService:SendKeyEvent(true, Enum.KeyCode.Z, false)
							wait(0.05)
							UserInputService:SendKeyEvent(false, Enum.KeyCode.Z, false)
						end)
						wait(5)
					end
				end)
			end
		end)
		
		CreateActionButton("Best Gear", "🎯", function()
			pcall(function()
				local UserInputService = game:GetService("UserInputService")
				UserInputService:SendKeyEvent(true, Enum.KeyCode.X, false)
				wait(0.05)
				UserInputService:SendKeyEvent(false, Enum.KeyCode.X, false)
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
	LeftSidebar.CanvasSize = UDim2.new(0, 0, 0, SidebarLayout.AbsoluteContentSize.Y + 16)
end)

ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	RightContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 24)
end)

print("✅ TILIN HUB NEON - Muscle Legends")
print("🚀 Luna Hub Style | Neon Edition | Ready to Train!")
