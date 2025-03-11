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

    -- ปุ่มแบบ Material Design
    local toggleButton = Instance.new("ImageButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Image = "rbxassetid://14033419176"
    toggleButton.ImageColor3 = Color3.fromRGB(170, 0, 255) -- สีม่วง
    toggleButton.ScaleType = Enum.ScaleType.Fit
    toggleButton.AnchorPoint = Vector2.new(0.5, 0.5)
    toggleButton.Position = UDim2.fromScale(0.95, 0.1)
    toggleButton.Size = UDim2.fromOffset(40, 40)

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

     -- เอฟเฟกต์เมื่อ Hover
     toggleButton.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(toggleButton, TweenInfo.new(0.2), {
            ImageColor3 = Color3.fromRGB(255, 85, 255)
        }):Play()
    end)
    
    toggleButton.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(toggleButton, TweenInfo.new(0.2), {
            ImageColor3 = Color3.fromRGB(170, 0, 255)
        }):Play()
    end)

    return toggleButton
end

local Device;
function checkDevice()
    local player = game.Players.LocalPlayer
    if player then
        local UserInputService = game:GetService("UserInputService")
        
        if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
            local FeariseToggle = CreateToggle()
            FeariseToggle.MouseButton1Click:Connect(function()
                for _, guiObject in ipairs(game:GetService("CoreGui"):GetChildren()) do
                    if guiObject.Name == "RemHub" then
                        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad)
                        if guiObject.Enabled then
                            game:GetService("TweenService"):Create(guiObject, tweenInfo, {
                                Position = UDim2.fromScale(1.5, 0.5) -- ปิดด้วยการเลื่อนออก
                            }):Play()
                        else
                            game:GetService("TweenService"):Create(guiObject, tweenInfo, {
                                Position = UDim2.fromScale(0.5, 0.5) -- เปิดด้วยการเลื่อนเข้า
                            }):Play()
                        end
                    end
                end
            end)
            game:GetService("CoreGui").ChildRemoved:Connect(function(Value)
                if Value.Name == "RemHub" then
                    FeariseToggle.Parent.Parent:Destroy()
                end
            end)
            Device = UDim2.fromOffset(480, 360)
        else
            Device = UDim2.fromOffset(580, 460)
        end
    end
end
checkDevice()

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
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/oORemOo/Rem-Hub/refs/heads/main/InterfaceManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Bocchi-World/Bocchi-Main/refs/heads/main/FPSBooster.lua", delay = 0.5, requireFPS = true))()

local Window = Fluent:CreateWindow({
    Title = "Rem Hub" .. " | ".."AD".." | ".."[Version 0.1]",
    SubTitle = "by Rowlet/Blobby",
    TabWidth = 160,
    Size = Device,
    Acrylic = true, -- เปิดเอฟเฟกต์เบลอ
    AcrylicTransparency = 0.85, -- ความโปร่งใส
    Theme = "Amethyst", -- เปลี่ยนธีมเป็นสีม่วง
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
                if getgenv().Configs["Mobile Mode"] then
                    local MobileUI = Function_Storage.CreateRemHubMobileToggle = function()
                        local mobileUI = Instance.new("ScreenGui")
                        mobileUI.Name = "RemHubMobileUI"
                        mobileUI.Parent = game:GetService("CoreGui")
                    
                        local mainFrame = Instance.new("Frame")
                        mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        mainFrame.BackgroundTransparency = 0.3
                        mainFrame.Size = UDim2.fromScale(1, 1)
                        mainFrame.Parent = mobileUI
                    
                        -- ปุ่มแบบ Floating Action Button
                        local function CreateFAB(name, position)
                            local button = Instance.new("ImageButton")
                            button.Name = name
                            button.Image = "rbxassetid://112196145837803"
                            button.Size = UDim2.fromOffset(60, 60)
                            button.Position = position
                            button.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
                            button.ImageColor3 = Color3.fromRGB(255, 255, 255)
                            button.Parent = mainFrame
                            
                            local shadow = Instance.new("ImageLabel")
                            shadow.Image = "rbxassetid://6190040010"
                            shadow.Size = UDim2.fromScale(1.2, 1.2)
                            shadow.Position = UDim2.fromScale(-0.1, -0.1)
                            shadow.BackgroundTransparency = 1
                            shadow.Parent = button
                            
                            return button
                        end
                    

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
    Content = "Anti AFK Is Activated",
    Duration = 5,
    Icon = "rbxassetid://14033419176", -- เพิ่มไอคอน
    IconColor = Color3.fromRGB(170, 0, 255),
    TitleColor = Color3.fromRGB(255, 255, 255),
    ContentColor = Color3.fromRGB(200, 200, 200)
})

Window:SelectTab(1)