local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TilinHubML"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 550, 0, 450)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Header
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "⚡ TILIN HUB"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = Header

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -65, 0, 10)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
MinimizeBtn.TextColor3 = Color3.new(1, 1, 1)
MinimizeBtn.Text = "−"
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 20
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Parent = Header

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Text = "✕"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	if isMinimized then
		MainFrame.Size = UDim2.new(0, 550, 0, 50)
		MinimizeBtn.Text = "□"
	else
		MainFrame.Size = UDim2.new(0, 550, 0, 450)
		MinimizeBtn.Text = "−"
	end
end)

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Sidebar (izquierda)
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 140, 1, -50)
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

-- Content Area (centro-derecha)
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -140, 1, -50)
ContentArea.Position = UDim2.new(0, 140, 0, 50)
ContentArea.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ContentArea.BorderSizePixel = 0
ContentArea.Parent = MainFrame

local ScrollContent = Instance.new("ScrollingFrame")
ScrollContent.Size = UDim2.new(1, 0, 1, 0)
ScrollContent.BackgroundTransparency = 1
ScrollContent.BorderSizePixel = 0
ScrollContent.ScrollBarThickness = 6
ScrollContent.ScrollBarImageColor3 = Color3.fromRGB(150, 0, 0)
ScrollContent.Parent = ContentArea

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 10)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Parent = ScrollContent

local Padding = Instance.new("UIPadding")
Padding.PaddingLeft = UDim.new(0, 10)
Padding.PaddingRight = UDim.new(0, 10)
Padding.PaddingTop = UDim.new(0, 10)
Padding.PaddingBottom = UDim.new(0, 10)
Padding.Parent = ScrollContent

-- Variables globales
local activeCategory = nil
local features = {}

-- Función para crear botón de categoría en sidebar
local function CreateCategoryButton(name, category)
	local Button = Instance.new("TextButton")
	Button.Name = category
	Button.Size = UDim2.new(1, -10, 0, 40)
	Button.Position = UDim2.new(0, 5, 0, 0)
	Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Button.TextColor3 = Color3.new(0.8, 0.8, 0.8)
	Button.Text = name
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 12
	Button.BorderSizePixel = 0
	Button.Parent = Sidebar
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 6)
	Corner.Parent = Button
	
	Button.MouseButton1Click:Connect(function()
		activeCategory = category
		ScrollContent:ClearAllChildren()
		ListLayout.Parent = ScrollContent
		Padding.Parent = ScrollContent
		
		if features[category] then
			for _, feature in ipairs(features[category]) do
				feature()
			end
		end
		
		Button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
		Button.TextColor3 = Color3.new(1, 1, 1)
	end)
	
	Button.MouseEnter:Connect(function()
		if activeCategory ~= category then
			Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		end
	end)
	
	Button.MouseLeave:Connect(function()
		if activeCategory ~= category then
			Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		end
	end)
end

-- Función para crear toggle en el content
local function CreateToggle(label, callback)
	local Container = Instance.new("Frame")
	Container.Size = UDim2.new(1, 0, 0, 40)
	Container.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Container.BorderSizePixel = 0
	Container.Parent = ScrollContent
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 8)
	Corner.Parent = Container
	
	local Label = Instance.new("TextLabel")
	Label.Size = UDim2.new(0.6, 0, 1, 0)
	Label.BackgroundTransparency = 1
	Label.Text = label
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = Container
	
	local Toggle = Instance.new("TextButton")
	Toggle.Size = UDim2.new(0.35, 0, 0.8, 0)
	Toggle.Position = UDim2.new(0.6, 5, 0.1, 0)
	Toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	Toggle.TextColor3 = Color3.new(1, 1, 1)
	Toggle.Text = "OFF"
	Toggle.Font = Enum.Font.GothamBold
	Toggle.TextSize = 12
	Toggle.BorderSizePixel = 0
	Toggle.Parent = Container
	
	local TCorner = Instance.new("UICorner")
	TCorner.CornerRadius = UDim.new(0, 6)
	TCorner.Parent = Toggle
	
	local isActive = false
	Toggle.MouseButton1Click:Connect(function()
		isActive = not isActive
		if isActive then
			Toggle.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
			Toggle.Text = "ON"
		else
			Toggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
			Toggle.Text = "OFF"
		end
		callback(isActive)
	end)
end

-- Función para crear botón de acción
local function CreateActionButton(label, callback)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, 0, 0, 35)
	Button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.Text = label
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 13
	Button.BorderSizePixel = 0
	Button.Parent = ScrollContent
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 8)
	Corner.Parent = Button
	
	Button.MouseButton1Click:Connect(callback)
	Button.MouseEnter:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
	end)
	Button.MouseLeave:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	end)
end

-- CATEGORÍAS Y FEATURES

-- Entrenamiento
features["Training"] = {
	function()
		CreateToggle("Auto Punch", function(state)
			if state then
				spawn(function()
					while activeCategory == "Training" and true do
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Punch"):FireServer()
						end)
						wait(0.05)
					end
				end)
			end
		end)
		
		CreateToggle("Auto Lift", function(state)
			if state then
				spawn(function()
					while activeCategory == "Training" and true do
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Lift"):FireServer()
						end)
						wait(0.1)
					end
				end)
			end
		end)
		
		CreateToggle("Auto Run", function(state)
			if state then
				spawn(function()
					while activeCategory == "Training" and true do
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Run"):FireServer()
						end)
						wait(0.08)
					end
				end)
			end
		end)
		
		CreateActionButton("Max All Stats", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MaxStats"):FireServer()
			end)
		end)
	end
}

-- Movimiento
features["Movement"] = {
	function()
		CreateToggle("Speed Boost (3x)", function(state)
			if player.Character and player.Character:FindFirstChild("Humanoid") then
				if state then
					player.Character.Humanoid.WalkSpeed = 48
				else
					player.Character.Humanoid.WalkSpeed = 16
				end
			end
		end)
		
		CreateToggle("Super Speed (5x)", function(state)
			if player.Character and player.Character:FindFirstChild("Humanoid") then
				if state then
					player.Character.Humanoid.WalkSpeed = 80
				else
					player.Character.Humanoid.WalkSpeed = 16
				end
			end
		end)
		
		CreateActionButton("Teleport Gym", function()
			if player.Character then
				player.Character:MoveTo(Vector3.new(50, 5, 50))
			end
		end)
		
		CreateActionButton("Teleport Arena", function()
			if player.Character then
				player.Character:MoveTo(Vector3.new(-100, 5, -100))
			end
		end)
	end
}

-- Combat
features["Combat"] = {
	function()
		CreateToggle("Inf Health", function(state)
			if state then
				spawn(function()
					while activeCategory == "Combat" and true do
						if player.Character and player.Character:FindFirstChild("Humanoid") then
							player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
						end
						wait(0.5)
					end
				end)
			end
		end)
		
		CreateToggle("No Damage", function(state)
			if player.Character and player.Character:FindFirstChild("Humanoid") then
				if state then
					player.Character.Humanoid.MaxHealth = 999999
					player.Character.Humanoid.Health = 999999
				end
			end
		end)
		
		CreateToggle("Noclip", function(state)
			if player.Character then
				for _, part in pairs(player.Character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = not state
					end
				end
			end
		end)
		
		CreateActionButton("Reset Stats", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ResetStats"):FireServer()
			end)
		end)
	end
}

-- Dinero
features["Money"] = {
	function()
		CreateActionButton("Collect Money", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CollectMoney"):FireServer()
			end)
		end)
		
		CreateActionButton("Claim Daily Reward", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DailyReward"):FireServer()
			end)
		end)
		
		CreateToggle("Auto Farm Money", function(state)
			if state then
				spawn(function()
					while activeCategory == "Money" and true do
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("CollectMoney"):FireServer()
						end)
						wait(1)
					end
				end)
			end
		end)
	end
}

-- Otros
features["Other"] = {
	function()
		CreateActionButton("Remove Shadows", function()
			game.Lighting.GlobalShadows = false
		end)
		
		CreateToggle("Auto Equip Best Gear", function(state)
			if state then
				spawn(function()
					while activeCategory == "Other" and true do
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("EquipBest"):FireServer()
						end)
						wait(5)
					end
				end)
			end
		end)
		
		CreateActionButton("Get Free Passes", function()
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("FreePasses"):FireServer()
			end)
		end)
	end
}

-- Crear botones de categoría
CreateCategoryButton("Training", "Training")
CreateCategoryButton("Movement", "Movement")
CreateCategoryButton("Combat", "Combat")
CreateCategoryButton("Money", "Money")
CreateCategoryButton("Other", "Other")

-- Cargar Training por defecto
activeCategory = "Training"
local trainingBtn = Sidebar:FindFirstChild("Training")
if trainingBtn then
	trainingBtn:MouseButton1Click()
end

ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	ScrollContent.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 20)
end)

print("✅ Tilin Hub - Muscle Legends Cargado!")
print("💪 Características: Training, Movement, Combat, Money, Other")
