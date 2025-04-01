return function()
    local player = game:WaitForChild("Players").LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "KeySystemGUI"
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    -- Main draggable frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 350, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Selectable = true
    mainFrame.Draggable = true  -- Make the frame draggable
    mainFrame.Parent = gui

    -- Title bar (drag area)
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    titleBar.BorderSizePixel = 0
    titleBar.Active = true
    titleBar.Selectable = true
    titleBar.Draggable = true
    titleBar.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Text = "ENTER ACCESS KEY"
    title.Size = UDim2.new(1, 0, 1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = titleBar

    -- Input box (centered)
    local inputBox = Instance.new("TextBox")
    inputBox.Size = UDim2.new(0.8, 0, 0, 40)
    inputBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    inputBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    inputBox.PlaceholderText = "Enter your key here..."
    inputBox.Font = Enum.Font.Gotham
    inputBox.TextSize = 16
    inputBox.TextXAlignment = Enum.TextXAlignment.Center
    inputBox.Parent = mainFrame

    -- Submit button (centered)
    local submitButton = Instance.new("TextButton")
    submitButton.Size = UDim2.new(0.6, 0, 0, 40)
    submitButton.Position = UDim2.new(0.2, 0, 0.6, 0)
    submitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitButton.Text = "SUBMIT"
    submitButton.Font = Enum.Font.GothamBold
    submitButton.TextSize = 16
    submitButton.Parent = mainFrame

    -- Message label (centered)
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

    -- Toggle button (in the corner)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 40, 0, 40)
    toggleButton.Position = UDim2.new(1, -45, 0, 5)
    toggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Text = "≡"
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.TextSize = 20
    toggleButton.Visible = false  -- Initially hidden
    toggleButton.Parent = gui

    -- Function frame (initially hidden)
    local functionFrame = Instance.new("Frame")
    functionFrame.Size = UDim2.new(0, 400, 0, 300)
    functionFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    functionFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    functionFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    functionFrame.BorderSizePixel = 0
    functionFrame.Visible = false
    functionFrame.Active = true
    functionFrame.Selectable = true
    functionFrame.Draggable = true
    functionFrame.Parent = gui

    -- Function frame title bar
    local functionTitleBar = Instance.new("Frame")
    functionTitleBar.Size = UDim2.new(1, 0, 0, 30)
    functionTitleBar.Position = UDim2.new(0, 0, 0, 0)
    functionTitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    functionTitleBar.BorderSizePixel = 0
    functionTitleBar.Active = true
    functionTitleBar.Selectable = true
    functionTitleBar.Draggable = true
    functionTitleBar.Parent = functionFrame

    local functionTitle = Instance.new("TextLabel")
    functionTitle.Text = "PREMIUM FUNCTIONS"
    functionTitle.Size = UDim2.new(1, 0, 1, 0)
    functionTitle.Position = UDim2.new(0, 0, 0, 0)
    functionTitle.BackgroundTransparency = 1
    functionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    functionTitle.Font = Enum.Font.GothamBold
    functionTitle.TextSize = 20
    functionTitle.TextXAlignment = Enum.TextXAlignment.Center
    functionTitle.Parent = functionTitleBar

    -- Close button for function frame
    local functionCloseButton = Instance.new("TextButton")
    functionCloseButton.Size = UDim2.new(0, 30, 0, 30)
    functionCloseButton.Position = UDim2.new(1, -30, 0, 0)
    functionCloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    functionCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    functionCloseButton.Text = "X"
    functionCloseButton.Font = Enum.Font.GothamBold
    functionCloseButton.TextSize = 16
    functionCloseButton.Parent = functionTitleBar

    -- Function buttons
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
        
        return button
    end

    -- Example function buttons
    createFunctionButton("Get 100 Coins", UDim2.new(0.1, 0, 0.2, 0), function()
        game:GetService("ReplicatedStorage").KeySystemRemote:FireServer("give_coins", 100)
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

    -- Submit button functionality
    submitButton.MouseButton1Click:Connect(function()
        local enteredKey = inputBox.Text
        
        if enteredKey == "" then
            messageLabel.Text = "Please enter a key!"
            messageLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end
        
        if validateKey(enteredKey) then
            messageLabel.Text = "Key accepted! Loading functions..."
            messageLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            
            game:GetService("ReplicatedStorage").KeySystemRemote:FireServer("validate_key", enteredKey)
            
            wait(1)
            mainFrame.Visible = false
            functionFrame.Visible = true
            toggleButton.Visible = false
        else
            messageLabel.Text = "Invalid key! Please try again."
            messageLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)

    -- Close button for main frame
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 16
    closeButton.Parent = titleBar

    closeButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
        toggleButton.Visible = true
    end)

    -- Toggle button functionality
    toggleButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
        toggleButton.Visible = not mainFrame.Visible
    end)

    return gui
end
