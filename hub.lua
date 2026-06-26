local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TilinHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 600)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 50)
Header.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "TILIN HUB"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.Parent = Header

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -45, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

local ButtonContainer = Instance.new("ScrollingFrame")
ButtonContainer.Size = UDim2.new(1, 0, 1, -50)
ButtonContainer.Position = UDim2.new(0, 0, 0, 50)
ButtonContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ButtonContainer.BorderSizePixel = 0
ButtonContainer.ScrollBarThickness = 8
ButtonContainer.Parent = MainFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 10)
ListLayout.FillDirection = Enum.FillDirection.Vertical
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Parent = ButtonContainer

local Padding = Instance.new("UIPadding")
Padding.PaddingLeft = UDim.new(0, 10)
Padding.PaddingRight = UDim.new(0, 10)
Padding.PaddingTop = UDim.new(0, 10)
Padding.PaddingBottom = UDim.new(0, 10)
Padding.Parent = ButtonContainer

local function CreateButton(name, callback)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, 0, 0, 45)
	Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.Text = name
	Button.Font = Enum.Font.Gotham
	Button.TextSize = 16
	Button.BorderSizePixel = 0
	Button.Parent = ButtonContainer
	
	local ButtonCorner = Instance.new("UICorner")
	ButtonCorner.CornerRadius = UDim.new(0, 8)
	ButtonCorner.Parent = Button
	
	Button.MouseButton1Click:Connect(callback)
	Button.MouseEnter:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	end)
	Button.MouseLeave:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	end)
	
	ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		ButtonContainer.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 20)
	end)
end

CreateButton("Botón 1", function()
	print("Botón 1")
end)

CreateButton("Botón 2", function()
	print("Botón 2")
end)

CreateButton("Botón 3", function()
	print("Botón 3")
end)