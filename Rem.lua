repeat
    task.wait()
until game:IsLoaded()

local Players = game:GetService("Players")
repeat
    task.wait()
until Players.LocalPlayer and Players.LocalPlayer.Character

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

local function CreateToggle()
    local toggleGui = Instance.new("ScreenGui")
    toggleGui.Name = "ToggleGui"
    toggleGui.DisplayOrder = 1e+04
    toggleGui.IgnoreGuiInset = true
    toggleGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    toggleGui.ResetOnSpawn = false
    toggleGui.Parent = game:GetService("CoreGui")

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainFrame.BackgroundTransparency = 1
    mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    mainFrame.BorderSizePixel = 0
    mainFrame.Position = UDim2.fromScale(0.925, 0.116)
    mainFrame.Size = UDim2.fromScale(0.083, 0.148)

    local uICorner = Instance.new("UICorner")
    uICorner.Name = "UICorner"
    uICorner.CornerRadius = UDim.new(1, 0)
    uICorner.Parent = mainFrame

    local toggleButton = Instance.new("ImageButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Image = "rbxassetid://112196145837803"
    toggleButton.ImageTransparency = 0.3
    toggleButton.AnchorPoint = Vector2.new(0.5, 0.5)
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.BackgroundTransparency = 1
    toggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    toggleButton.BorderSizePixel = 0
    toggleButton.Position = UDim2.fromScale(0.491, 0.482)
    toggleButton.Size = UDim2.fromScale(1, 1)

    local uICorner1 = Instance.new("UICorner")
    uICorner1.Name = "UICorner"
    uICorner1.CornerRadius = UDim.new(1, 0)
    uICorner1.Parent = toggleButton

    toggleButton.Parent = mainFrame

    local uIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    uIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
    uIAspectRatioConstraint.AspectRatio = 1
    uIAspectRatioConstraint.Parent = mainFrame

    mainFrame.Parent = toggleGui

    return toggleButton
end

local Device;
-- แก้ไขส่วนนี้ในฟังก์ชัน checkDevice()
local function CreateMainUI()
    local mainUI = Instance.new("ScreenGui")
    mainUI.Name = "RemHub"
    mainUI.Parent = game:GetService("CoreGui")
    mainUI.Enabled = true -- เริ่มต้นแสดง UI
    return mainUI
end

function checkDevice()
    local player = game.Players.LocalPlayer
    if player then
        local UserInputService = game:GetService("UserInputService")
        
        -- สร้าง UI หลัก "RemHub"
        local mainUI = CreateMainUI()
        
        if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
            local RemToggle = CreateToggle()
            RemToggle.MouseButton1Click:Connect(function()
                -- สลับการแสดงผลของ UI หลัก
                mainUI.Enabled = not mainUI.Enabled
            end)
            Device = UDim2.fromOffset(480, 360)
        else
            Device = UDim2.fromOffset(580, 460)
        end
    end
end
CreateMainUI()

local Function_Storage = {}

Function_Storage.CreateRemHubMobileToggle = function()
    local mobileUI = Instance.new("ScreenGui")
    mobileUI.Name = "RemHubMobileUI"
    mobileUI.Parent = game:GetService("CoreGui")

    -- ออกแบบปุ่ม Mobile ตามต้องการ...
    return {
        RemHubMobileUI = mobileUI,
        instantKickToggle = instantKick,
        -- เพิ่มปุ่มอื่นๆ...
    }
end

local FileName = tostring(game.Players.LocalPlayer.UserId).."_Settings.json"
local BaseFolder = "RemHub"
local SubFolder = "AD"

function SaveSetting() 
    local json
    local HttpService = game:GetService("HttpService")
    
    if writefile then
        json = HttpService:JSONEncode(getgenv().Settings)

        if not isfolder(BaseFolder) then
            makefolder(BaseFolder)
        end
        if not isfolder(BaseFolder.."/"..SubFolder) then
            makefolder(BaseFolder.."/"..SubFolder)
        end
        
        writefile(BaseFolder.."/"..SubFolder.."/"..FileName, json)
    else
        error("ERROR: Can't save your settings")
    end
end

function LoadSetting()
    local HttpService = game:GetService("HttpService")
    if readfile and isfile and isfile(BaseFolder.."/"..SubFolder.."/"..FileName) then
        getgenv().Settings = HttpService:JSONDecode(readfile(BaseFolder.."/"..SubFolder.."/"..FileName))
    end
end

LoadSetting()

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/oORemOo/Rem-Hub/refs/heads/main/Fluent.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/oORemOo/Rem-Hub/refs/heads/main/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/oORemOo/Rem-Hub/refs/heads/main/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Rem Hub" .. " | ".."AD".." | ".."[Version 0.1]",
    SubTitle = "by Rowlet/Blobby",
    TabWidth = 160,
    Size = Device, -- ใช้ค่าจาก checkDevice()
    Acrylic = false,
    Theme = "Rose",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    --[[ Tabs --]]
    pageLegit = Window:AddTab({ Title = "Legit", Icon = "align-justify" }),
    pageVisual = Window:AddTab({ Title = "Visual", Icon = "view" }),
    pageKaitan = Window:AddTab({ Title = "Kaitan", Icon = "crown" }),
    pageOP = Window:AddTab({ Title = "OP", Icon = "apple" }),
    pageRage = Window:AddTab({ Title = "Rage", Icon = "bug" }),
    pageSpin = Window:AddTab({ Title = "Spin", Icon = "box" }),
    pageItem = Window:AddTab({ Title = "Item", Icon = "archive" }),
    pageSettings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}
do
 

    -------------------------------------------------------[[ MOBILE SCRIPT ]]-------------------------------------------------------
    function checkDeviceUi()
        local player = game.Players.LocalPlayer
        if player then
            local UserInputService = game:GetService("UserInputService")
            
            if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
                local MobileUI = Function_Storage.CreateRemHubMobileToggle()
    
                MobileUI.instantKickToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Rem Hub",
                            Content = "Instant Kick Clicked",
                            Duration = 3
                        })
                        Function_Storage.shootBall()
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
                    warn("Error: Your Forget Configs")    
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