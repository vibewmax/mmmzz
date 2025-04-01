-- Убедитесь, что это LocalScript в StarterGui или выполняется через loadstring
local Player = game:GetService("Players").LocalPlayer
local GUI = Instance.new("ScreenGui")
GUI.Name = "PremiumKeySystem"
GUI.Parent = Player:WaitForChild("PlayerGui")

-- Основные параметры
local ValidKeys = {
    "ROBLOX123",
    "GAMEPASS",
    "PREMIUM2023",
    "1234"
}

-- Создаем главное окно
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 220)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -110)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = GUI

-- Делаем окно перемещаемым
local Dragging, DragInput, DragStart, StartPos
MainFrame.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = Input.Position
        StartPos = MainFrame.Position
        
        Input.Changed:Connect(function()
            if Input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseMovement and Dragging then
        DragInput = Input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(Input)
    if Input == DragInput and Dragging then
        local Delta = Input.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)

-- Элементы интерфейса
local Title = Instance.new("TextLabel")
Title.Text = "ПРЕМИУМ ДОСТУП"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Position = UDim2.new(0.1, 0, 0.25, 0)
KeyBox.PlaceholderText = "Введите ваш ключ..."
KeyBox.Parent = MainFrame

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.6, 0, 0, 40)
SubmitBtn.Position = UDim2.new(0.2, 0, 0.55, 0)
SubmitBtn.Text = "АКТИВИРОВАТЬ"
SubmitBtn.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0.8, 0, 0, 20)
StatusLabel.Position = UDim2.new(0.1, 0, 0.85, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.Parent = MainFrame

-- Функции
local function ValidateKey(Key)
    local CleanKey = string.upper(string.gsub(Key, "%s+", ""))
    for _, Valid in pairs(ValidKeys) do
        if CleanKey == Valid then
            return true
        end
    end
    return false
end

SubmitBtn.MouseButton1Click:Connect(function()
    local Key = KeyBox.Text
    if ValidateKey(Key) then
        StatusLabel.Text = "Ключ принят! Доступ открыт."
        StatusLabel.TextColor3 = Color3.new(0, 1, 0)
        
        -- Здесь можно добавить дополнительные функции
        -- Например, открыть новое меню или дать игроку преимущества
        
    else
        StatusLabel.Text = "Неверный ключ! Попробуйте другой."
        StatusLabel.TextColor3 = Color3.new(1, 0, 0)
    end
end)

-- Кнопка закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.Text = "X"
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    GUI:Destroy()
end)
