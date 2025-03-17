repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

getgenv().Settings = {
    WalkSpeedToggle = nil,
    WalkSpeedInput = nil,
    JumpPowerToggle = nil,
    JumpPowerInput = nil,
    HitboxToggle = nil,
    HitboxInput = nil,
    HitboxKeybind = nil,
    AutoDribble = nil,
    vipToggle = nil,
    InstantKickKeybind = nil,
    InputPower = nil,
    espToggle = nil,
    espStyleToggle = nil,
    espAwakeningToggle = nil,
    espFlowToggle  = nil,
    espStaminaToggle = nil,
    BallPredicToggle = nil,
    AutoFarmTweenToggle = nil,
    AutoFarmTeleportToggle = nil,
    InfiniteStamina = false,
    WhiteScreen = nil,
    AutoGoalKeeper = nil,
    AutoGKKeybind = "",
    TeamPositionDropdown = nil,
    AutoTeamToggle = nil,
    AutoTeamForAutoFarmToggle = nil,
    InstantGoalToggle = nil,
    AutoHopToggle = nil,
    AutoHopThresholdInput = nil,
    KaiserToggle = nil,
    KaiserKeybide = nil,
    CurveShotProMaxToggle = nil,
    CurveShotProMaxKeybind = nil,
    NoCooldownStealToggle = nil,
    NoCooldownAirDribbleToggle = nil,
    NoCooldownAirDashToggle = nil,
    StyleLockDropdown = nil,
    AutoSpinToggle = nil,
    FlowLockDropdown = nil,
    AutoFlowToggle = nil,
    EffectsDropdown = nil,
    CosmeticsDropdown = nil,
    CardsDropdown = nil,
    LagSwitchToggle = nil,
}

-- เรียกใช้ฟังก์ชัน OptimizeGame ทันทีที่เกมโหลดเสร็จ
OptimizeGame()

-- ฟังก์ชัน OptimizeGame
function OptimizeGame()
    -- ปรับแต่ง Lighting เพื่อลดเอฟเฟคที่ไม่จำเป็น
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 100000
    lighting.Brightness = 2
    lighting.Outlines = false
    lighting.ShadowSoftness = 0
    lighting.GeographicLatitude = 0
    lighting.EnvironmentDiffuseScale = 0
    lighting.EnvironmentSpecularScale = 0

    -- ปิดการแสดงผลของ PostProcessing Effects
    if lighting:FindFirstChild("PostProcessing") then
        lighting.PostProcessing.Enabled = false
    end

    -- ลบอนุภาค (Particles) ที่ไม่จำเป็น
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("ParticleEmitter") or instance:IsA("Trail") then
            instance:Destroy()
        end
    end

    -- ปิดการแสดงผลของ Decals (ภาพ貼图) ที่ไม่จำเป็น
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("Decal") then
            instance.Transparency = 1
        end
    end

    -- ปิดการแสดงผลของ MeshPart ที่ไม่จำเป็น
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("MeshPart") then
            instance.Transparency = 1
        end
    end

    -- ปิดการแสดงผลของ SurfaceGui (เช่น ป้ายข้อความ)
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("SurfaceGui") then
            instance.Enabled = false
        end
    end

    -- ปิดการแสดงผลของ BillboardGui (เช่น ป้ายข้อความลอย)
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("BillboardGui") then
            instance.Enabled = false
        end
    end

    -- ปิดการแสดงผลของ Sparkles (แสงระยิบระยับ)
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("Sparkles") then
            instance.Enabled = false
        end
    end

    -- ปิดการแสดงผลของ Smoke, Fire, และเอฟเฟคอื่นๆ
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("Smoke") or instance:IsA("Fire") or instance:IsA("Explosion") then
            instance.Enabled = false
        end
    end

    -- ปิดการแสดงผลของ Sound ที่ไม่จำเป็น
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("Sound") then
            instance:Stop()
        end
    end

    -- ปิดการแสดงผลของ Animation ที่ไม่จำเป็น
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("AnimationController") or instance:IsA("Animator") then
            instance:Destroy()
        end
    end

    -- ปิดการแสดงผลของ Terrain Detail (รายละเอียดพื้นผิว)
    local terrain = workspace:FindFirstChildOfClass("Terrain")
    if terrain then
        terrain.Decoration = false
        terrain.WaterReflectance = 0
        terrain.WaterTransparency = 1
        terrain.WaterWaveSize = 0
        terrain.WaterWaveSpeed = 0
    end

    -- ปิดการแสดงผลของ BasePart ที่ไม่จำเป็น
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("BasePart") then
            instance.Reflectance = 0
            instance.Material = Enum.Material.Plastic
            instance.CastShadow = false
        end
    end

    -- ปิดการแสดงผลของ Model ที่ไม่จำเป็น
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("Model") then
            instance.PrimaryPart = nil
        end
    end

    -- ปิดการแสดงผลของ Humanoid ที่ไม่จำเป็น
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("Humanoid") then
            instance.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end
    end
end
-- local function CreateToggle()
--     local toggleGui = Instance.new("ScreenGui")
--     toggleGui.Name = "ToggleGui"
--     toggleGui.DisplayOrder = 1e+04
--     toggleGui.IgnoreGuiInset = true
--     toggleGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
--     toggleGui.ResetOnSpawn = false
--     toggleGui.Parent = game:GetService("CoreGui")

--     -- สร้าง Frame สำหรับปุ่ม
--     local mainFrame = Instance.new("Frame")
--     mainFrame.Name = "MainFrame"
--     mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
--     mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--     mainFrame.BackgroundTransparency = 1 -- ทำให้พื้นหลังโปร่งใส
--     mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
--     mainFrame.BorderSizePixel = 0
--     mainFrame.Position = UDim2.fromScale(0.075, 0.116) -- ตำแหน่งเริ่มต้น
--     mainFrame.Size = UDim2.fromOffset(70, 70) -- ขนาดใหญ่ขึ้น (60x60 พิกเซล)

--     -- เพิ่มมุมโค้งให้ Frame
--     local uICorner = Instance.new("UICorner")
--     uICorner.Name = "UICorner"
--     uICorner.CornerRadius = UDim.new(1, 0) -- ทำให้มุมโค้งเต็มที่
--     uICorner.Parent = mainFrame
    

--     -- สร้างปุ่ม
--     local toggleButton = Instance.new("ImageButton")
--     toggleButton.Name = "ToggleButton"
--     toggleButton.Image = "rbxassetid://14033419176"
--     toggleButton.ImageTransparency = 0 -- ไม่มีเอฟเฟกต์โปร่งแสง
--     toggleButton.AnchorPoint = Vector2.new(0.5, 0.5)
--     toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--     toggleButton.BackgroundTransparency = 1 -- ทำให้พื้นหลังโปร่งใส
--     toggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
--     toggleButton.BorderSizePixel = 0
--     toggleButton.Position = UDim2.fromScale(0.5, 0.5) -- ตรงกลาง Frame
--     toggleButton.Size = UDim2.fromScale(1, 1) -- ขนาดเต็ม Frame

--     -- เพิ่มมุมโค้งให้ปุ่ม
--     local uICorner1 = Instance.new("UICorner")
--     uICorner1.Name = "UICorner"
--     uICorner1.CornerRadius = UDim.new(1, 0) -- ทำให้ปุ่มเป็นวงกลม
--     uICorner1.Parent = toggleButton

--     -- ฟังก์ชันลากและวาง
--     local UserInputService = game:GetService("UserInputService")
--     local dragging = false
--     local dragInput, dragStart, startPos

    


--     local function update(input)
--         local delta = input.Position - dragStart
--         mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
--     end

--     toggleButton.InputBegan:Connect(function(input)
--         if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
--             dragging = true
--             dragStart = input.Position
--             startPos = mainFrame.Position

--             input.Changed:Connect(function()
--                 if input.UserInputState == Enum.UserInputState.End then
--                     dragging = false
--                 end
--             end)
--         end
--     end)

--     toggleButton.InputChanged:Connect(function(input)
--         if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
--             dragInput = input
--         end
--     end)

--     UserInputService.InputChanged:Connect(function(input)
--         if input == dragInput and dragging then
--             update(input)
--         end
--     end)

--     toggleButton.Parent = mainFrame
--     mainFrame.Parent = toggleGui

--     return toggleButton
-- end

-- local Device;
-- function checkDevice()
--     local player = game.Players.LocalPlayer
--     if player then
--         local UserInputService = game:GetService("UserInputService")
        
--         if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
--             local FeariseToggle = CreateToggle()
--             FeariseToggle.MouseButton1Click:Connect(function()
--                 for _, guiObject in ipairs(game:GetService("CoreGui"):GetChildren()) do
--                     if guiObject.Name == "RemHub" and guiObject:IsA("ScreenGui") then
--                         for FrameIndex, FrameValue in pairs(guiObject:GetChildren()) do
--                             if FrameValue:IsA("Frame") and FrameValue:FindFirstChild("CanvasGroup") then
--                                 FrameValue.Visible = not FrameValue.Visible
--                             end
--                         end
--                     end
--                 end
--             end)
--             game:GetService("CoreGui").ChildRemoved:Connect(function(Value)
--                 if Value.Name == "RemHub" then
--                     FeariseToggle.Parent.Parent:Destroy()
--                 end
--             end)
--             Device = UDim2.fromOffset(480, 360)
--         else
--             Device = UDim2.fromOffset(580, 460)
--         end
--     end
-- end
-- checkDevice()

-- local FileName = tostring(game.Players.LocalPlayer.UserId).."_Settings.json"
-- local BaseFolder = "RemHub"
-- local SubFolder = "AD"

-- function SaveSetting() 
--     local json
--     local HttpService = game:GetService("HttpService")
    
--     if writefile then
--         json = HttpService:JSONEncode(getgenv().Settings)

--         if not isfolder(BaseFolder) then
--             makefolder(BaseFolder)
--         end
--         if not isfolder(BaseFolder.."/"..SubFolder) then
--             makefolder(BaseFolder.."/"..SubFolder)
--         end
        
--         writefile(BaseFolder.."/"..SubFolder.."/"..FileName, json)
--     else
--         error("ERROR: Can't save your settings")
--     end
-- end

-- function LoadSetting()
--     local HttpService = game:GetService("HttpService")
--     if readfile and isfile and isfile(BaseFolder.."/"..SubFolder.."/"..FileName) then
--         getgenv().Settings = HttpService:JSONDecode(readfile(BaseFolder.."/"..SubFolder.."/"..FileName))
--     end
-- end

-- LoadSetting()

-- local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/oORemOo/Rem-Hub/refs/heads/main/Fluent.lua"))()
-- local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/oORemOo/Rem-Hub/refs/heads/main/SaveManager.lua"))()
-- local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/oORemOo/Rem-Hub/refs/heads/main/InterfaceManager.lua"))()

-- local Window = Fluent:CreateWindow({
--     Title = "Rem Hub" .. " | ".."AD".." | ".."[Version 0.1]",
--     SubTitle = "by TheRme",
--     TabWidth = 160,
--     Size =  Device, --UDim2.fromOffset(480, 360), --default size (580, 460)
--     Acrylic = false, -- การเบลออาจตรวจจับได้ การตั้งค่านี้เป็น false จะปิดการเบลอทั้งหมด
--     Theme = "Light", -- เปลี่ยนธีมเป็น Amethyst (หรือธีมอื่นๆ ที่มีใน Fluent)
--     MinimizeKey = Enum.KeyCode.LeftControl --RightControl
-- })

-- local Tabs = {
--     --[[ Tabs --]]
--     pagemain = Window:AddTab({ Title = "Main", Icon = "align-justify" }),
--     pageVisual = Window:AddTab({ Title = "Visual", Icon = "view" }),
--     pageKaitan = Window:AddTab({ Title = "Kaitan", Icon = "crown" }),
--     pageOP = Window:AddTab({ Title = "OP", Icon = "apple" }),
--     pageRage = Window:AddTab({ Title = "Rage", Icon = "bug" }),
--     pageSpin = Window:AddTab({ Title = "Spin", Icon = "box" }),
--     pageItem = Window:AddTab({ Title = "Item", Icon = "archive" }),
--     pageSettings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
-- }
-- do
 
--     -------------------------------------------------------[[ main ]]-------------------------------------------------------


--     local function OptimizeGame()
--         -- ปรับแต่ง Lighting เพื่อลดเอฟเฟคที่ไม่จำเป็น
--         local lighting = game:GetService("Lighting")
--         lighting.GlobalShadows = false
--         lighting.FogEnd = 100000
--         lighting.Brightness = 2
--         lighting.Outlines = false
--         lighting.ShadowSoftness = 0
--         lighting.GeographicLatitude = 0
--         lighting.EnvironmentDiffuseScale = 0
--         lighting.EnvironmentSpecularScale = 0
    
--         -- ปิดการแสดงผลของ PostProcessing Effects
--         if lighting:FindFirstChild("PostProcessing") then
--             lighting.PostProcessing.Enabled = false
--         end
    
--         -- ลบอนุภาค (Particles) ที่ไม่จำเป็น
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("ParticleEmitter") or instance:IsA("Trail") then
--                 instance:Destroy()
--             end
--         end
    
--         -- ปิดการแสดงผลของ Decals (ภาพ貼图) ที่ไม่จำเป็น
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Decal") then
--                 instance.Transparency = 1
--             end
--         end
    
--         -- ปิดการแสดงผลของ MeshPart ที่ไม่จำเป็น
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("MeshPart") then
--                 instance.Transparency = 1
--             end
--         end
    
--         -- ปิดการแสดงผลของ SurfaceGui (เช่น ป้ายข้อความ)
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("SurfaceGui") then
--                 instance.Enabled = false
--             end
--         end
    
--         -- ปิดการแสดงผลของ BillboardGui (เช่น ป้ายข้อความลอย)
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("BillboardGui") then
--                 instance.Enabled = false
--             end
--         end
    
--         -- ปิดการแสดงผลของ Sparkles (แสงระยิบระยับ)
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Sparkles") then
--                 instance.Enabled = false
--             end
--         end
    
--         -- ปิดการแสดงผลของ Smoke, Fire, และเอฟเฟคอื่นๆ
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Smoke") or instance:IsA("Fire") or instance:IsA("Explosion") then
--                 instance.Enabled = false
--             end
--         end
    
--         -- ปิดการแสดงผลของ Sound ที่ไม่จำเป็น
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Sound") then
--                 instance:Stop()
--             end
--         end
    
--         -- ปิดการแสดงผลของ Animation ที่ไม่จำเป็น
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("AnimationController") or instance:IsA("Animator") then
--                 instance:Destroy()
--             end
--         end
    
--         -- ปิดการแสดงผลของ Terrain Detail (รายละเอียดพื้นผิว)
--         local terrain = workspace:FindFirstChildOfClass("Terrain")
--         if terrain then
--             terrain.Decoration = false
--             terrain.WaterReflectance = 0
--             terrain.WaterTransparency = 1
--             terrain.WaterWaveSize = 0
--             terrain.WaterWaveSpeed = 0
--         end
    
--         -- ปิดการแสดงผลของ BasePart ที่ไม่จำเป็น
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("BasePart") then
--                 instance.Reflectance = 0
--                 instance.Material = Enum.Material.Plastic
--                 instance.CastShadow = false
--             end
--         end
    
--         -- ปิดการแสดงผลของ Model ที่ไม่จำเป็น
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Model") then
--                 instance.PrimaryPart = nil
--             end
--         end
    
--         -- ปิดการแสดงผลของ Humanoid ที่ไม่จำเป็น
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Humanoid") then
--                 instance.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
--             end
--         end
--     end
    
--     local function RevertOptimization()
--         -- ย้อนกลับการปรับแต่งกราฟิก
--         local lighting = game:GetService("Lighting")
--         lighting.GlobalShadows = true
--         lighting.FogEnd = 100000
--         lighting.Brightness = 1
--         lighting.Outlines = true
--         lighting.ShadowSoftness = 0.5
--         lighting.GeographicLatitude = 41.73
--         lighting.EnvironmentDiffuseScale = 1
--         lighting.EnvironmentSpecularScale = 1
    
--         -- เปิดการแสดงผลของ PostProcessing Effects
--         if lighting:FindFirstChild("PostProcessing") then
--             lighting.PostProcessing.Enabled = true
--         end
    
--         -- เปิดการแสดงผลของ Decals
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Decal") then
--                 instance.Transparency = 0
--             end
--         end
    
--         -- เปิดการแสดงผลของ MeshPart
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("MeshPart") then
--                 instance.Transparency = 0
--             end
--         end
    
--         -- เปิดการแสดงผลของ SurfaceGui และ BillboardGui
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("SurfaceGui") or instance:IsA("BillboardGui") then
--                 instance.Enabled = true
--             end
--         end
    
--         -- เปิดการแสดงผลของ Sparkles, Smoke, Fire
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Sparkles") or instance:IsA("Smoke") or instance:IsA("Fire") or instance:IsA("Explosion") then
--                 instance.Enabled = true
--             end
--         end
    
--         -- เปิดการแสดงผลของ Sound
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Sound") then
--                 instance:Play()
--             end
--         end
    
--         -- เปิดการแสดงผลของ Terrain Detail
--         local terrain = workspace:FindFirstChildOfClass("Terrain")
--         if terrain then
--             terrain.Decoration = true
--             terrain.WaterReflectance = 0.5
--             terrain.WaterTransparency = 0.5
--             terrain.WaterWaveSize = 0.1
--             terrain.WaterWaveSpeed = 0.1
--         end
    
--         -- เปิดการแสดงผลของ BasePart
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("BasePart") then
--                 instance.Reflectance = 0.5
--                 instance.Material = Enum.Material.SmoothPlastic
--                 instance.CastShadow = true
--             end
--         end
    
--         -- เปิดการแสดงผลของ Model
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Model") then
--                 instance.PrimaryPart = instance.PrimaryPart or instance:FindFirstChildWhichIsA("BasePart")
--             end
--         end
    
--         -- เปิดการแสดงผลของ Humanoid
--         for _, instance in pairs(workspace:GetDescendants()) do
--             if instance:IsA("Humanoid") then
--                 instance.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
--             end
--         end
--     end
    
--     -- เพิ่ม Toggle ในแท็บ pagemain
--     local OptimizeSection = Tabs.pagemain:AddSection("bootfps")
    
--     local OptimizeToggle = Tabs.pagemain:AddToggle("OptimizeToggle", {
--         Title = "Optimize Graphics",
--         Description = "Enable to improve FPS by reducing graphics and effects.",
--         Default = getgenv().Settings.OptimizeToggle or false,
--         Callback = function(Value)
--             getgenv().Settings.OptimizeToggle = Value
--             SaveSetting()
--             if Value then
--                 OptimizeGame()
--             else
--                 RevertOptimization()
--             end
--         end
--     })
    
--     -- บันทึกสถานะ Toggle
--     OptimizeToggle:OnChanged(function(Value)
--         getgenv().Settings.OptimizeToggle = Value
--         SaveSetting()
--     end)

    -------------------------------------------------------[[ MOBILE SCRIPT ]]-------------------------------------------------------
    function checkDeviceUi()
        local player = game.Players.LocalPlayer
        if player then
            local UserInputService = game:GetService("UserInputService")
            
            if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
                -- ตรวจสอบว่า Configs ถูกกำหนดค่าและมี Mobile Mode
                if getgenv().Configs and getgenv().Configs["Mobile Mode"] then
                    local MobileUI = Function_Storage.CreateRemHubMobileToggle()
    
                    MobileUI.instantKickToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Rem Hub",
                            Content = "Instant Kick Clicked",
                            Duration = 3
                        })
                    end)
                    MobileUI.kaiserImpackToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Rem Hub",
                            Content = "Kaiser Impack Clicked",
                            Duration = 3
                        })
                    end)
                    MobileUI.curveShotProMaxToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Rem Hub",
                            Content = "Curve Shot Pro Max Clicked",
                            Duration = 3
                        })
                    end)
                    MobileUI.autoGKToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Rem Hub",
                            Content = "Auto GK Clicked",
                            Duration = 3
                        })
                    end)
                    MobileUI.hitBoxToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Rem Hub",
                            Content = "Hitbox Clicked",
                            Duration = 3
                        })
                    end)
                    game:GetService("CoreGui").ChildRemoved:Connect(function(Value)
                        if Value.Name == "RemHub" then
                            MobileUI.RemHubMobileUI:Destroy()
                        end
                    end)
                else
                    warn("Error: Configs or Mobile Mode is not defined")
                end
            end
        end
    end
    checkDeviceUi()
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:SetFolder("Rem Hub")
InterfaceManager:SetFolder("Rem Hub")

SaveManager:BuildConfigSection(Tabs.pageSettings)
InterfaceManager:BuildInterfaceSection(Tabs.pageSettings)

-- Anti AFK
task.spawn(function()
    while wait(320) do
        pcall(function()
            local anti = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                anti:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                anti:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end)
    end
end)

Fluent:Notify({
    Title = "Rem Hub",
    Content = "Anti AFK Is Actived",
    Duration = 5
})

Window:SelectTab(1)