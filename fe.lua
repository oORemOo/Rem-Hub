function Function_Storage.CreateRemHubMobileToggle()
    local MobileUI = {}
    
    -- สร้าง ScreenGui หลัก
    local RemHubMobileUI = Instance.new("ScreenGui")
    RemHubMobileUI.Name = "RemHubMobileUI"
    RemHubMobileUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    RemHubMobileUI.ResetOnSpawn = false
    RemHubMobileUI.Parent = game:GetService("CoreGui")
    
    -- สร้าง Container หลัก
    local mainContainer = Instance.new("Frame")
    mainContainer.Name = "MainContainer"
    mainContainer.Size = UDim2.new(0, 320, 0, 80)
    mainContainer.Position = UDim2.new(0.5, -160, 0.85, 0)
    mainContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    mainContainer.BorderSizePixel = 0
    mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    mainContainer.Parent = RemHubMobileUI
    
    -- สร้าง Shadow effect
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.BackgroundTransparency = 1
    shadow.Size = UDim2.new(1.1, 0, 1.2, 0)
    shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Image = "rbxassetid://7912134082"
    shadow.ImageColor3 = Color3.new(0, 0, 0)
    shadow.ImageTransparency = 0.6
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(95, 95, 205, 205)
    shadow.Parent = mainContainer
    
    -- สร้าง Border effect
    local border = Instance.new("UIStroke")
    border.Color = Color3.fromRGB(80, 80, 120)
    border.Thickness = 1.5
    border.Parent = mainContainer
    
    -- สร้าง Gradient effect
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 35))
    })
    gradient.Rotation = 45
    gradient.Parent = mainContainer
    
    -- ทำให้ Container มีมุมโค้ง
    local cornerRadius = Instance.new("UICorner")
    cornerRadius.CornerRadius = UDim.new(0.2, 0)
    cornerRadius.Parent = mainContainer
    
    -- สร้าง Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "TitleLabel"
    titleLabel.BackgroundTransparency = 1
    titleLabel.Size = UDim2.new(1, 0, 0, 25)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = "REM HUB CONTROLS"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 14
    titleLabel.Parent = mainContainer
    
    -- สร้าง Container สำหรับปุ่ม
    local buttonsContainer = Instance.new("Frame")
    buttonsContainer.Name = "ButtonsContainer"
    buttonsContainer.BackgroundTransparency = 1
    buttonsContainer.Size = UDim2.new(1, -20, 0, 45)
    buttonsContainer.Position = UDim2.new(0, 10, 0, 30)
    buttonsContainer.Parent = mainContainer
    
    -- จัดการ Layout สำหรับปุ่ม
    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Horizontal
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 10)
    layout.Parent = buttonsContainer
    
    -- Function สำหรับสร้างปุ่ม
    local function createButton(name, icon, order)
        local button = Instance.new("ImageButton")
        button.Name = name .. "Toggle"
        button.Size = UDim2.new(0, 50, 0, 50)
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        button.LayoutOrder = order
        
        -- สร้าง Corner
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0.2, 0)
        corner.Parent = button
        
        -- สร้าง Border
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(100, 100, 140)
        stroke.Thickness = 1
        stroke.Parent = button
        
        -- สร้าง Icon
        local iconImage = Instance.new("ImageLabel")
        iconImage.Name = "Icon"
        iconImage.BackgroundTransparency = 1
        iconImage.Size = UDim2.new(0.7, 0, 0.7, 0)
        iconImage.Position = UDim2.new(0.5, 0, 0.5, 0)
        iconImage.AnchorPoint = Vector2.new(0.5, 0.5)
        iconImage.Image = icon
        iconImage.Parent = button
        
        -- สร้าง Tooltip
        local tooltip = Instance.new("TextLabel")
        tooltip.Name = "Tooltip"
        tooltip.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        tooltip.Size = UDim2.new(0, 80, 0, 25)
        tooltip.Position = UDim2.new(0.5, 0, 0, -30)
        tooltip.AnchorPoint = Vector2.new(0.5, 0)
        tooltip.TextColor3 = Color3.fromRGB(255, 255, 255)
        tooltip.TextSize = 12
        tooltip.Font = Enum.Font.Gotham
        tooltip.Text = name
        tooltip.Visible = false
        tooltip.ZIndex = 10
        
        local tooltipCorner = Instance.new("UICorner")
        tooltipCorner.CornerRadius = UDim.new(0.2, 0)
        tooltipCorner.Parent = tooltip
        
        local tooltipStroke = Instance.new("UIStroke")
        tooltipStroke.Color = Color3.fromRGB(100, 100, 140)
        tooltipStroke.Thickness = 1
        tooltipStroke.Parent = tooltip
        
        tooltip.Parent = button
        
        -- Animation Effects
        button.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 100)}):Play()
            tooltip.Visible = true
        end)
        
        button.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 70)}):Play()
            tooltip.Visible = false
        end)
        
        button.MouseButton1Down:Connect(function()
            game:GetService("TweenService"):Create(iconImage, TweenInfo.new(0.1), {Size = UDim2.new(0.6, 0, 0.6, 0)}):Play()
            game:GetService("TweenService"):Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(80, 80, 120)}):Play()
        end)
        
        button.MouseButton1Up:Connect(function()
            game:GetService("TweenService"):Create(iconImage, TweenInfo.new(0.1), {Size = UDim2.new(0.7, 0, 0.7, 0)}):Play()
            game:GetService("TweenService"):Create(button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(70, 70, 100)}):Play()
        end)
        
        button.Parent = buttonsContainer
        return button
    end
    
    -- สร้างปุ่มต่างๆ
    MobileUI.instantKickToggle = createButton("InstantKick", "rbxassetid://7733715400", 1)
    MobileUI.kaiserImpackToggle = createButton("Kaiser", "rbxassetid://7733774602", 2)
    MobileUI.curveShotProMaxToggle = createButton("CurveShot", "rbxassetid://7734110022", 3)
    MobileUI.autoGKToggle = createButton("AutoGK", "rbxassetid://7743878358", 4)
    MobileUI.hitBoxToggle = createButton("Hitbox", "rbxassetid://7743875263", 5)
    
    -- สร้าง Drag Functionality
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        mainContainer.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    titleLabel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainContainer.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    titleLabel.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    -- สร้าง Toggle Button เพื่อซ่อน/แสดง UI
    local toggleButton = Instance.new("ImageButton")
    toggleButton.Name = "ToggleVisibility"
    toggleButton.Size = UDim2.new(0, 40, 0, 40)
    toggleButton.Position = UDim2.new(0, 10, 0, -45)
    toggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    toggleButton.Image = "rbxassetid://7733658133"
    toggleButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.ImageTransparency = 0.2
    toggleButton.Parent = mainContainer
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0.5, 0)
    toggleCorner.Parent = toggleButton
    
    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Color = Color3.fromRGB(100, 100, 140)
    toggleStroke.Thickness = 1.5
    toggleStroke.Parent = toggleButton
    
    toggleButton.MouseButton1Click:Connect(function()
        buttonsContainer.Visible = not buttonsContainer.Visible
        titleLabel.Visible = not titleLabel.Visible
        
        if buttonsContainer.Visible then
            game:GetService("TweenService"):Create(mainContainer, TweenInfo.new(0.3), {Size = UDim2.new(0, 320, 0, 80)}):Play()
            toggleButton.Image = "rbxassetid://7733658133"
        else
            game:GetService("TweenService"):Create(mainContainer, TweenInfo.new(0.3), {Size = UDim2.new(0, 60, 0, 60)}):Play()
            toggleButton.Image = "rbxassetid://7733715400"
        end
    end)
    
    MobileUI.RemHubMobileUI = RemHubMobileUI
    return MobileUI
end