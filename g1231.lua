return function()
    -- Get player and create GUI
    local player = game:GetService("Players").LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "KeySystemGUI"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    -- Create toggle button (initially visible)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 40, 0, 40)
    toggleButton.Position = UDim2.new(0, 10, 0.5, -20)
    toggleButton.AnchorPoint = Vector2.new(0, 0.5)
    toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Text = "🔑"
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.TextSize = 20
    toggleButton.ZIndex = 10
    toggleButton.Parent = gui

    -- Main frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 350, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    mainFrame.BorderSizePixel = 0
    mainFrame.Visible = false
    mainFrame.Parent = gui

    -- Make frame draggable
    local dragInput, dragStart, startPos
    local function updateInput(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragStart = nil
                end
            end)
        end
    end)

    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragStart then
            updateInput(input)
        end
    end)

    -- Title bar
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Text = "ENTER ACCESS KEY"
    title.Size = UDim2.new(1, 0, 1, 0)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = titleBar

    -- Input box
    local inputBox = Instance.new("TextBox")
    inputBox.Size = UDim2.new(0.8, 0, 0, 40)
    inputBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    inputBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    inputBox.PlaceholderText = "Enter key here..."
    inputBox.Font = Enum.Font.Gotham
    inputBox.TextSize = 16
    inputBox.TextXAlignment = Enum.TextXAlignment.Center
    inputBox.Parent = mainFrame

    -- Submit button
    local submitButton = Instance.new("TextButton")
    submitButton.Size = UDim2.new(0.6, 0, 0, 40)
    submitButton.Position = UDim2.new(0.2, 0, 0.6, 0)
    submitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitButton.Text = "SUBMIT"
    submitButton.Font = Enum.Font.GothamBold
    submitButton.TextSize = 16
    submitButton.Parent = mainFrame

    -- Message label
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(0.8, 0, 0, 20)
    messageLabel.Position = UDim2.new(0.1, 0, 0.85, 0)
    messageLabel.BackgroundTransparency = 1
    messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextSize = 14
    messageLabel.TextXAlignment = Enum.TextXAlignment.Center
    messageLabel.Text = ""
    messageLabel.Parent = mainFrame

    -- Close button
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 16
    closeButton.Parent = titleBar

    -- Function frame
    local functionFrame = Instance.new("Frame")
    functionFrame.Size = UDim2.new(0, 400, 0, 300)
    functionFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    functionFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    functionFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    functionFrame.BorderSizePixel = 0
    functionFrame.Visible = false
    functionFrame.Parent = gui

    -- Make function frame draggable
    functionFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragStart = input.Position
            startPos = functionFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragStart = nil
                end
            end)
        end
    end)

    functionFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragStart then
            updateInput(input)
        end
    end)

    -- Function frame title
    local functionTitleBar = Instance.new("Frame")
    functionTitleBar.Size = UDim2.new(1, 0, 0, 30)
    functionTitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    functionTitleBar.BorderSizePixel = 0
    functionTitleBar.Parent = functionFrame

    local functionTitle = Instance.new("TextLabel")
    functionTitle.Text = "PREMIUM FUNCTIONS"
    functionTitle.Size = UDim2.new(1, 0, 1, 0)
    functionTitle.BackgroundTransparency = 1
    functionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    functionTitle.Font = Enum.Font.GothamBold
    functionTitle.TextSize = 20
    functionTitle.TextXAlignment = Enum.TextXAlignment.Center
    functionTitle.Parent = functionTitleBar

    -- Function frame close button
    local functionCloseButton = Instance.new("TextButton")
    functionCloseButton.Size = UDim2.new(0, 30, 0, 30)
    functionCloseButton.Position = UDim2.new(1, -30, 0, 0)
    functionCloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    functionCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    functionCloseButton.Text = "X"
    functionCloseButton.Font = Enum.Font.GothamBold
    functionCloseButton.TextSize = 16
    functionCloseButton.Parent = functionTitleBar

    -- Create function buttons
    local function createFunctionButton(text, position, callback)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0.8, 0, 0, 40)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Text = text
        button.Font = Enum.Font.Gotham
        button.TextSize = 16
        button.TextXAlignment = Enum.TextXAlignment.Center
        button.Parent = functionFrame
        button.MouseButton1Click:Connect(callback)
    end

    -- Example functions
    createFunctionButton("Get 100 Coins", UDim2.new(0.1, 0, 0.2, 0), function()
        -- Your coin giving functionality here
    end)

    createFunctionButton("Teleport to Base", UDim2.new(0.1, 0, 0.35, 0), function()
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.RootPart then
                humanoid.RootPart.CFrame = CFrame.new(0, 10, 0)
            end
        end
    end)

    createFunctionButton("Close Menu", UDim2.new(0.1, 0, 0.8, 0), function()
        functionFrame.Visible = false
        toggleButton.Visible = true
    end)

    -- Key validation
    local validKeys = {
        "ROBLOX123",
        "GAMEPASS",
        "PREMIUMKEY",
        "DEVELOPER",
        "TESTKEY2023"
    }

    local function validateKey(key)
        local cleanKey = string.upper(string.gsub(key, "%s+", ""))
        for _, validKey in pairs(validKeys) do
            if cleanKey == validKey then
                return true
            end
        end
        return false
    end

    -- Button events
    submitButton.MouseButton1Click:Connect(function()
        local enteredKey = inputBox.Text
        if enteredKey == "" then
            messageLabel.Text = "Please enter a key!"
            messageLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end
        
        if validateKey(enteredKey) then
            messageLabel.Text = "Key accepted!"
            messageLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            wait(1)
            mainFrame.Visible = false
            functionFrame.Visible = true
        else
            messageLabel.Text = "Invalid key!"
            messageLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)

    closeButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
        toggleButton.Visible = true
    end)

    toggleButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = true
        toggleButton.Visible = false
        functionFrame.Visible = false
    end)

    functionCloseButton.MouseButton1Click:Connect(function()
        functionFrame.Visible = false
        toggleButton.Visible = true
    end)

    -- Initialize
    toggleButton.Visible = true
    mainFrame.Visible = false
    functionFrame.Visible = false

    return gui
end
