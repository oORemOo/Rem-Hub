repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

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