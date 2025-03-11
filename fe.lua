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
function checkDevice()
    local player = game.Players.LocalPlayer
    if player then
        local UserInputService = game:GetService("UserInputService")
        
        if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
            local FeariseToggle = CreateToggle()
            FeariseToggle.MouseButton1Click:Connect(function()
                for _, guiObject in ipairs(game:GetService("CoreGui"):GetChildren()) do
                    if guiObject.Name == "FeariseHub" and guiObject:IsA("ScreenGui") then
                        for FrameIndex, FrameValue in pairs(guiObject:GetChildren()) do
                            if FrameValue:IsA("Frame") and FrameValue:FindFirstChild("CanvasGroup") then
                                FrameValue.Visible = not FrameValue.Visible
                            end
                        end
                    end
                end
            end)
            game:GetService("CoreGui").ChildRemoved:Connect(function(Value)
                if Value.Name == "FeariseHub" then
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
local BaseFolder = "FeariseHub"
local SubFolder = "BlueLockRivals"

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

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/imyourlio/Cracked/refs/heads/main/Fearise%20UI"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fearise Hub" .. " | ".."BlueLock : Rival".." | ".."[Version 3]",
    SubTitle = "by Rowlet/Blobby",
    TabWidth = 160,
    Size =  Device, --UDim2.fromOffset(480, 360), --default size (580, 460)
    Acrylic = false, -- การเบลออาจตรวจจับได้ การตั้งค่านี้เป็น false จะปิดการเบลอทั้งหมด
    Theme = "Rose", --Amethyst
    MinimizeKey = Enum.KeyCode.LeftControl --RightControl
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
    -------------------------------------------------------[[ LEGIT ]]-------------------------------------------------------
    local SpeedTitle = Tabs.pageLegit:AddSection("Player Modifiers")
    local WalkSpeedToggle = Tabs.pageLegit:AddToggle("WalkSpeedToggle", {Title = "Toggle WalkSpeed", Default = getgenv().Settings.WalkSpeedToggle or false })
    local WalkSpeedInput = Tabs.pageLegit:AddInput("WalkSpeedInput", {
        Title = "WalkSpeed Input",
        Default = getgenv().Settings.WalkSpeedInput or 16,
        Numeric = true,
        Finished = false,
        Callback = function(Value)
            getgenv().Settings.WalkSpeedInput = Value
            SaveSetting()
        end
    })
    WalkSpeedInput:OnChanged(function(Value)
        getgenv().Settings.WalkSpeedInput = Value
        SaveSetting()
    end)
    local JumpPowerToggle = Tabs.pageLegit:AddToggle("JumpPowerToggle", {Title = "Toggle JumpPower", Default = getgenv().Settings.JumpPowerToggle or false })
    local JumpPowerInput = Tabs.pageLegit:AddInput("JumpPowerInput", {
        Title = "JumpPower Input",
        Default = getgenv().Settings.JumpPowerInput or 50,
        Numeric = true,
        Finished = false,
        Callback = function(Value)
            getgenv().Settings.JumpPowerInput = Value
            SaveSetting()
        end
    })
    JumpPowerInput:OnChanged(function(Value)
        getgenv().Settings.JumpPowerInput = Value
        SaveSetting()
    end)
    local HitboxTitle = Tabs.pageLegit:AddSection("Hitbox")
    local HitboxToggle = Tabs.pageLegit:AddToggle("HitboxToggle", { Title = "Hitbox", Default = getgenv().Settings.HitboxToggle or false })
    local HitboxInput = Tabs.pageLegit:AddInput("HitboxInput", {
        Title = "Hitbox Input",
        Default = getgenv().Settings.HitboxInput or 10,
        Placeholder = "Enter size (1-30)",
        Numeric = true,
        Finished = false,
        Callback = function(Value)
            getgenv().Settings.HitboxInput = Value
            SaveSetting()
        end
    })
    HitboxInput:OnChanged(function(Value)
        getgenv().Settings.HitboxInput = Value
        SaveSetting()
    end)
    local HitboxKeybind = Tabs.pageLegit:AddKeybind("HitboxKeybind", {
        Title = "Toggle Hitbox Keybind",
        Mode = "Toggle",
        Default = "",
        Callback = function(Value)
            getgenv().Settings.HitboxKeybind = Value
        end,
        ChangedCallback = function(NewKey)
            getgenv().Settings.HitboxKeybind = NewKey
        end
    })
    local MiscTitle = Tabs.pageLegit:AddSection("Misc")
    local AutoDribble = Tabs.pageLegit:AddToggle("AutoDribble", {Title = "AutoDribble", Description = "Testing.", Default = getgenv().Settings.AutoDribble or false })
    local vipToggle = Tabs.pageLegit:AddToggle("vipToggle", {Title = "vipToggle", Description = "Testing.", Default = getgenv().Settings.vipToggle or false })
    local InfiniteStaminaButton Tabs.pageLegit:AddButton({
        Title = "Infinite Stamina",
        Description = "Click to enable Infinite Stamina (cannot be disabled)",
        Callback = function()
            if not getgenv().Settings.InfiniteStamina then
                getgenv().Settings.InfiniteStamina = true
                SaveSetting()
                Fluent:Notify({
                    Title = "Infinite Stamina",
                    Content = "Enabled",
                    Duration = 3
                })
            else
                Fluent:Notify({
                    Title = "Infinite Stamina",
                    Content = "Already Enabled",
                    Duration = 3
                })
            end
        end
    })

    -------------------------------------------------------[[ VISUAL ]]-------------------------------------------------------
    local espToggle = Tabs.pageVisual:AddToggle("espToggle", {Title = "Enable ESP", Default = getgenv().Settings.espToggle or false })
    local espStyleToggle = Tabs.pageVisual:AddToggle("espStyleToggle", {Title = "Enable Style", Default = getgenv().Settings.espStyleToggle or false })
    local espAwakeningToggle = Tabs.pageVisual:AddToggle("espAwakeningToggle", {Title = "Enable Awakning", Default = getgenv().Settings.espAwakeningToggle or false })
    local espFlowToggle = Tabs.pageVisual:AddToggle("espFlowToggle", {Title = "Enable Flow", Default = getgenv().Settings.espFlowToggle or false })
    local espStaminaToggle = Tabs.pageVisual:AddToggle("espStaminaToggle", {Title = "Enable Stamina", Default = getgenv().Settings.espStaminaToggle or false })
    local BallPredicToggle = Tabs.pageVisual:AddToggle("BallPredicToggle", {Title = "ESP BallPredic", Default = getgenv().Settings.BallPredicToggle or false})

    -------------------------------------------------------[[ KAITAN ]]-------------------------------------------------------
    local Striker = Tabs.pageKaitan:AddSection("Striker")
    local AutoFarmTweenToggle = Tabs.pageKaitan:AddToggle("AutoFarmTweenToggle", { Title = "Auto Farm(Tween)", Default = getgenv().Settings.AutoFarmTweenToggle or false })
    local AutoFarmTeleportToggle = Tabs.pageKaitan:AddToggle("AutoFarmTeleportToggle", { Title = "Auto Farm(TP)", Default = getgenv().Settings.AutoFarmTeleportToggle or false })
    local WhiteScreen = Tabs.pageKaitan:AddToggle("WhiteScreen", { Title = "WhiteScreen [GPU 0%]", Default = getgenv().Settings.WhiteScreen or false })
    local GoalTitle = Tabs.pageKaitan:AddSection("Goal (In Testing)")
    local AutoGoalKeeper = Tabs.pageKaitan:AddToggle("WhitAutoGoalKeepereScreen", { Title = "Auto GK", Default = getgenv().Settings.AutoGoalKeeper or false })
    local AutoGKKeybind = Tabs.pageKaitan:AddKeybind("AutoGKKeybind", {
        Title = "Auto GK Keybind",
        Mode = "Toggle",
        Default = "",
        Callback = function(Value)
            getgenv().Settings.AutoGKKeybind = Value
        end,
        ChangedCallback = function(Value)
            getgenv().Settings.AutoGKKeybind = Value
        end
    })
    local Properties = Tabs.pageKaitan:AddSection("Properties")
    local TeamPositionDropdown = Tabs.pageKaitan:AddDropdown("TeamPositionDropdown", {
        Title = "Team and Position",
        Description = "Select your preferred team and position.",
        Values = {
            "Home_CF", "Home_LW", "Home_RW", "Home_CM", "Home_DM", "Home_CB", "Home_GK",
            "Away_CF", "Away_LW", "Away_RW", "Away_CM", "Away_DM", "Away_CB", "Away_GK"
        },
        Multi = false,
        Default = getgenv().Settings.TeamPositionDropdown or "Home_CF",
        Callback = function(Value)
            getgenv().Settings.TeamPositionDropdown = Value
            SaveSetting()
        end
    })
    TeamPositionDropdown:OnChanged(function(Value)
        getgenv().Settings.TeamPositionDropdown = Value
        SaveSetting()
    end)
    local AutoTeamToggle = Tabs.pageKaitan:AddToggle("AutoTeamToggle", { Title = "Auto Team & Position", Default = getgenv().Settings.AutoTeamToggle or false })
    local AutoTeamForAutoFarmToggle = Tabs.pageKaitan:AddToggle("AutoTeamForAutoFarmToggle", { Title = "Auto Team & Position (For Auto Farm)", Default = getgenv().Settings.AutoTeamForAutoFarmToggle or false })
    local InstantGoalToggle = Tabs.pageKaitan:AddToggle("InstantGoalToggle", { Title = "Instant Goal (Auto Farm Only)", Default = getgenv().Settings.InstantGoalToggle or false })
    local HopTitle = Tabs.pageKaitan:AddSection("Hop Server")
    local AutoHopToggle = Tabs.pageKaitan:AddToggle("AutoHopToggle", { Title = "Auto Hop", Default = getgenv().Settings.AutoHopToggle or false })
    local AutoHopThresholdInput = Tabs.pageKaitan:AddInput("AutoHopThresholdInput", {
        Title = "Auto Hop When Players ≤",
        Description = "ย้ายเซิฟหากผู้เล่นน้อยกว่า",
        Default = getgenv().Settings.AutoHopThresholdInput or 4,
        Placeholder = "Enter Number Of Players",
        Numeric = true,
        Finished = false,
        Callback = function(v)
            getgenv().Settings.AutoHopThresholdInput = tonumber(v)
            SaveSetting()
        end
    })
    AutoHopThresholdInput:OnChanged(function(v)
        getgenv().Settings.AutoHopThresholdInput = tonumber(v)
        SaveSetting()
    end)

    -------------------------------------------------------[[ OP ]]-------------------------------------------------------
      local KaiserKeybide = Tabs.pageOP:AddKeybind("KaiserKeybide", {
        Title = "Toggle Kaiser Impack Keybind",
        Mode = "Toggle",
        Default = "",
        Callback = function(Value)
            getgenv().Settings.KaiserKeybide = Value
        end,
        ChangedCallback = function(Value)
            getgenv().Settings.KaiserKeybide = Value
        end
    })
    local CurveShotProMaxToggle = Tabs.pageOP:AddToggle("CurveShotProMaxToggle", { Title = "Gyro Shot Pro Max", Default = getgenv().Settings.CurveShotProMaxToggle or false })
    local CurveShotProMaxKeybind = Tabs.pageOP:AddKeybind("CurveShotProMaxKeybind", {
        Title = "Toggle Gyro Shot Keybind",
        Mode = "Toggle",
        Default = "",
        Callback = function(Value)
            getgenv().Settings.CurveShotProMaxKeybind = Value
        end,
        ChangedCallback = function(Value)
            getgenv().Settings.CurveShotProMaxKeybind = Value
        end
    })
    local SkillTitle = Tabs.pageOP:AddSection("No CD Skill (Wave Required)")
    local NoCooldownStealToggle = Tabs.pageOP:AddToggle("NoCooldownStealToggle", { Title = "No Cooldown - Steal", Default = getgenv().Settings.NoCooldownStealToggle or false })
    local NoCooldownAirDribbleToggle = Tabs.pageOP:AddToggle("NoCooldownAirDribbleToggle", { Title = "No Cooldown - AirDribble", Default = getgenv().Settings.NoCooldownAirDribbleToggle or false })
    local NoCooldownAirDashToggle = Tabs.pageOP:AddToggle("NoCooldownAirDashToggle", { Title = "No Cooldown - AirDash", Default = getgenv().Settings.NoCooldownAirDashToggle or false })

    -------------------------------------------------------[[ RAGE ]]-------------------------------------------------------
    local LagSwitchToggle = Tabs.pageRage:AddToggle("LagSwitchToggle", {Title = "Lag Switch", Default = getgenv().Settings.LagSwitchToggle or false })

    -------------------------------------------------------[[ SPIN ]]-------------------------------------------------------
    local StyleTitle = Tabs.pageSpin:AddSection("Style Spin")
    local StyleLockDropdown = Tabs.pageSpin:AddDropdown("StyleLockDropdown", {
        Title = "Style Lock",
        Description = "Select styles to stop spinning.",
        Values = {"Isagi", "Chigiri", "Bachira", "Otoya", "Hiori", "Gagamaru", "King", "Nagi", "Reo",  "Karasu", "Shidou", "Kunigami", "Sae", "Aiku", "Rin", "Yukimiya", "Don Lorenzo"}, -- Replace with actual style names
        Multi = true,
        Default = {}
    })
    StyleLockDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        getgenv().Settings.StyleLockDropdown = Values
        SaveSetting()
    end)
    local AutoSpinToggle = Tabs.pageSpin:AddToggle("AutoSpinToggle", { Title = "Auto Style Spin", Default = getgenv().Settings.AutoSpinToggle or false })
    local FlowTitle = Tabs.pageSpin:AddSection("Flow Spin")
    local FlowLockDropdown = Tabs.pageSpin:AddDropdown("FlowLockDropdown", {
        Title = "Flow Lock",
        Description = "Select Flow to stop spinning.",
        Values = { "Ice", "Lightning", "Puzzle", "Monster", "Gale Burst", "Genius", "King's Instinct", "Trap", "Crow", "Demon Wings", "Chameleon", "Wild Card", "Snake", "Prodigy", "Awakened Genius", "Dribbler"}, -- Actual flow names
        Multi = true,
        Default = {}
    })
    FlowLockDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        getgenv().Settings.FlowLockDropdown = Values
        SaveSetting()
    end)
    local AutoFlowToggle = Tabs.pageSpin:AddToggle("AutoFlowToggle", { Title = "Auto Flow Spin", Default = getgenv().Settings.AutoFlowToggle or false })

    -------------------------------------------------------[[ ITEM ]]-------------------------------------------------------
    local EffectsTitle = Tabs.pageItem:AddSection("Goal Effects")
    local ItemsList = {
        EFX = {},
        Cosmatics = {},
        Cards = {},
    }
    local function GetAllItem()
        for _, v in ipairs(game:GetService("ReplicatedStorage").Assets.GoalEffects:GetChildren()) do
            table.insert(ItemsList.EFX, v.Name)
        end
        for _, v in ipairs(game:GetService("ReplicatedStorage").Assets.Cosmetics:GetChildren()) do
            table.insert(ItemsList.Cosmatics, v.Name)
        end
        for _, v in ipairs(game:GetService("ReplicatedStorage").Assets.Customization.Cards:GetChildren()) do
            table.insert(ItemsList.Cards, v.Name)
        end
    end
    GetAllItem()
    local EffectsDropdown = Tabs.pageItem:AddDropdown("EffectsDropdown", {
        Title = "Goal Effects",
        Values = ItemsList.EFX,
        Multi = false,
        Default = getgenv().Settings.EffectsDropdown or "",
        Callback = function(Value)
            getgenv().Settings.EffectsDropdown = Value
            SaveSetting()
        end
    })
    EffectsDropdown:OnChanged(function(Value)
        getgenv().Settings.EffectsDropdown = Value
        SaveSetting()
    end)
    local ApplyEffectButton = Tabs.pageItem:AddButton({
        Title = "Apply Effect",
        Callback = function()
            if getgenv().Settings.EffectsDropdown ~= "" then
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Your Wear Goal Effect "..tostring(getgenv().Settings.EffectsDropdown),
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Please Select Goal Effect Before Use.",
                    Duration = 3
                })
            end
        end
    })
    local CosmeticsTitle = Tabs.pageItem:AddSection("Cosmetics")
    local CosmeticsDropdown = Tabs.pageItem:AddDropdown("CosmeticsDropdown", {
        Title = "Cosmetics",
        Values = ItemsList.Cosmatics,
        Multi = false,
        Default = getgenv().Settings.CosmeticsDropdown or "",
        Callback = function(Value)
            getgenv().Settings.CosmeticsDropdown = Value
            SaveSetting()
        end
    })
    CosmeticsDropdown:OnChanged(function(Value)
        getgenv().Settings.CosmeticsDropdown = Value
        SaveSetting()
    end)
    local ApplyCosmetic = Tabs.pageItem:AddButton({
        Title = "Apply Cosmetic",
        Callback = function()
            if getgenv().Settings.CosmeticsDropdown ~= "" then
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Your Wear Cosmetic "..tostring(getgenv().Settings.CosmeticsDropdown),
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Please Select Cosmetic Before Use.",
                    Duration = 3
                })
            end
        end
    })
    local CardsTitle = Tabs.pageItem:AddSection("Cards")
    local CardsDropdown = Tabs.pageItem:AddDropdown("CardsDropdown", {
        Title = "Cards",
        Values = ItemsList.Cards,
        Multi = false,
        Default = getgenv().Settings.CardsDropdown or "",
        Callback = function(Value)
            getgenv().Settings.CardsDropdown = Value
            SaveSetting()
        end
    })
    CardsDropdown:OnChanged(function(Value)
        getgenv().Settings.CardsDropdown = Value
        SaveSetting()
    end)
    local ApplyCard = Tabs.pageItem:AddButton({
        Title = "Apply Card",
        Callback = function()
            if getgenv().Settings.CardsDropdown ~= "" then
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Your Wear Card "..tostring(getgenv().Settings.CardsDropdown),
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Fearise Hub",
                    Content = "Please Select Card Before Use.",
                    Duration = 3
                })
            end
        end
    })

    -------------------------------------------------------[[ MOBILE SCRIPT ]]-------------------------------------------------------
    function checkDeviceUi()
        local player = game.Players.LocalPlayer
        if player then
            local UserInputService = game:GetService("UserInputService")
            
            if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
                if getgenv().Configs["Mobile Mode"] then
                    local MobileUI = Function_Storage.CreateFeariseHubMobileToggle()

                    MobileUI.instantKickToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Fearise Hub",
                            Content = "Instant Kick Clicked",
                            Duration = 3
                        })
                    end)
                    MobileUI.kaiserImpackToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Fearise Hub",
                            Content = "Kaiser Impack Clicked",
                            Duration = 3
                        })
                    end)
                    MobileUI.curveShotProMaxToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Fearise Hub",
                            Content = "Curve Shot Pro Max Clicked",
                            Duration = 3
                        })
                    end)
                    MobileUI.autoGKToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Fearise Hub",
                            Content = "Auto GK Clicked",
                            Duration = 3
                        })
                    end)
                    MobileUI.hitBoxToggle.MouseButton1Click:Connect(function()
                        Fluent:Notify({
                            Title = "Fearise Hub",
                            Content = "Hitbox Clicked",
                            Duration = 3
                        })
                    end)
                    game:GetService("CoreGui").ChildRemoved:Connect(function(Value)
                        if Value.Name == "FeariseHub" then
                            MobileUI.feariseHubMobileUI:Destroy()
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

SaveManager:SetFolder("Fearise Hub")
InterfaceManager:SetFolder("Fearise Hub")

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
    Title = "Fearise Hub",
    Content = "Anti AFK Is Actived",
    Duration = 5
})

Window:SelectTab(1)