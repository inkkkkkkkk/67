local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

local function getGuiParent()
    local ok, parent = pcall(function()
        local test = Instance.new("ScreenGui")
        test.Parent = CoreGui
        test:Destroy()
        return CoreGui
    end)
    if ok and parent then return parent end
    return Players.LocalPlayer:WaitForChild("PlayerGui")
end

local function playStartupAnimation()
    local gui
    local blur
    local ok, err = pcall(function()
        local parent = getGuiParent()

        local old = parent:FindFirstChild("ink_HUB_StartupAnimation")
        if old then old:Destroy() end
        local oldBlur = Lighting:FindFirstChild("ink_HUB_StartupBlur")
        if oldBlur then oldBlur:Destroy() end

        gui = Instance.new("ScreenGui")
        gui.Name = "ink_HUB_StartupAnimation"
        gui.IgnoreGuiInset = true
        gui.ResetOnSpawn = false
        gui.DisplayOrder = 2147483647
        gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
        gui.Parent = parent

        blur = Instance.new("BlurEffect")
        blur.Name = "ink_HUB_StartupBlur"
        blur.Size = 30
        blur.Parent = Lighting

        local bg = Instance.new("Frame")
        bg.Name = "Bg"
        bg.AnchorPoint = Vector2.new(0.5, 0.5)
        bg.Position = UDim2.fromScale(0.5, 0.5)
        bg.Size = UDim2.new(1, 200, 1, 200)
        bg.BackgroundColor3 = Color3.fromRGB(140, 0, 0) 
        bg.BorderSizePixel = 0
        bg.ZIndex = 1
        bg.Parent = gui
        
        local bgGrad = Instance.new("UIGradient")
        bgGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 0, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 0, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 0, 0)),
        })
        bgGrad.Rotation = 90
        bgGrad.Parent = bg

        local fadeTargets = { bg }
        local bloodTweens = {}
        
        for i = 1, 120 do
            local isDrop = math.random(1, 2) == 1
            local blood = Instance.new("Frame")
            blood.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
            blood.BorderSizePixel = 0
            blood.AnchorPoint = Vector2.new(0.5, 0.5)
            blood.ZIndex = 3
            
            if isDrop then
                local w = math.random(8, 22)
                local h = w * (2 + math.random() * 4)
                blood.Size = UDim2.fromOffset(w, h)
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0.5, 0)
                corner.Parent = blood
            else
                local size = math.random(20, 70)
                blood.Size = UDim2.fromOffset(size, size)
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0.5, 0)
                corner.Parent = blood
            end
            
            local edge = math.random(1, 4)
            if edge == 1 then
                blood.Position = UDim2.new(math.random(-20, 40) / 100, 0, math.random(), 0)
                blood.Rotation = math.random(70, 110)
            elseif edge == 2 then
                blood.Position = UDim2.new(math.random(60, 120) / 100, 0, math.random(), 0)
                blood.Rotation = math.random(70, 110)
            elseif edge == 3 then
                blood.Position = UDim2.new(math.random(), 0, math.random(-20, 40) / 100, 0)
                blood.Rotation = math.random(-20, 20)
            else
                blood.Position = UDim2.new(math.random(), 0, math.random(60, 120) / 100, 0)
                blood.Rotation = math.random(-20, 20)
            end
            
            blood.BackgroundTransparency = math.random(0, 30) / 100
            blood.Parent = bg
            table.insert(fadeTargets, blood)

            if math.random(1, 2) == 1 then
                local flashTween = TweenService:Create(blood, TweenInfo.new(
                    math.random(10, 25) / 10, 
                    Enum.EasingStyle.Sine, 
                    Enum.EasingDirection.InOut,
                    -1, 
                    true 
                ), { BackgroundTransparency = 1 })
                flashTween:Play()
                table.insert(bloodTweens, flashTween)
            end
        end

        local image = Instance.new("ImageLabel")
        image.Name = "Logo"
        image.AnchorPoint = Vector2.new(0.5, 0.5)
        image.Position = UDim2.fromScale(0.5, 1.5)
        image.Size = UDim2.fromOffset(300, 300)
        image.BackgroundTransparency = 1
        image.Image = "rbxassetid://97528294523613"
        image.ScaleType = Enum.ScaleType.Fit
        image.ZIndex = 4
        image.Parent = bg

        local title = Instance.new("TextLabel")
        title.Name = "Title"
        title.AnchorPoint = Vector2.new(0.5, 0.5)
        title.Position = UDim2.fromScale(1.5, 0.5)
        title.Size = UDim2.fromOffset(600, 120)
        title.BackgroundTransparency = 1
        title.Text = "破坏者谜团2"
        title.TextColor3 = Color3.fromRGB(255, 10, 10)
        title.TextStrokeColor3 = Color3.fromRGB(40, 0, 0)
        title.TextStrokeTransparency = 0
        title.TextSize = 65
        title.Font = Enum.Font.GothamBlack
        title.TextXAlignment = Enum.TextXAlignment.Center
        title.ZIndex = 5
        title.Parent = bg

        table.insert(fadeTargets, image)
        table.insert(fadeTargets, title)

        TweenService:Create(image, TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.fromScale(0.5, 0.5)
        }):Play()
        task.wait(1.0)

        local phase2 = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(image, phase2, { Position = UDim2.fromScale(0.38, 0.5) }):Play()
        TweenService:Create(title, phase2, { Position = UDim2.fromScale(0.62, 0.5) }):Play()
        task.wait(0.8)
        task.wait(0.8)

        for _, tween in ipairs(bloodTweens) do
            tween:Cancel()
        end

        local fade = TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        for _, obj in ipairs(fadeTargets) do
            local props = {}
            if obj:IsA("Frame") then
                props.BackgroundTransparency = 1
            elseif obj:IsA("ImageLabel") then
                props.ImageTransparency = 1
            elseif obj:IsA("TextLabel") then
                props.TextTransparency = 1
                props.TextStrokeTransparency = 1
            end
            if next(props) then
                TweenService:Create(obj, fade, props):Play()
            end
        end
        task.wait(0.9)
    end)

    if blur then pcall(function() blur:Destroy() end) end
    if gui then pcall(function() gui:Destroy() end) end
    if not ok then warn("[ink_HUB] 启动动画异常：", tostring(err)) end
end

local isAnimDone = false
task.spawn(function()
    playStartupAnimation()
    isAnimDone = true
end)

local function loadWindUI()
    local source = game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/1.6.66/main.lua", true)
    assert(type(source) == "string" and #source > 100, "WindUI 下载内容为空")
    local loader = loadstring(source)
    assert(type(loader) == "function", "WindUI loadstring 失败")
    return loader()
end

local okWind, WindUI = pcall(loadWindUI)

while not isAnimDone do
    task.wait(0.05)
end

if not okWind or not WindUI then
    warn("[ink_HUB] UI 加载失败：", tostring(WindUI))
    return
end

pcall(function()
    WindUI:AddTheme({
        Name = "inkGray",
        Accent = Color3.fromRGB(105, 105, 105),
        Dialog = Color3.fromRGB(32, 32, 32),
        Outline = Color3.fromRGB(125, 125, 125),
        Text = Color3.fromRGB(235, 235, 235),
        Placeholder = Color3.fromRGB(145, 145, 145),
        Background = Color3.fromRGB(24, 24, 24),
        Button = Color3.fromRGB(58, 58, 58),
        Icon = Color3.fromRGB(190, 190, 190),
        Title = Color3.fromRGB(155, 155, 155),
        Author = Color3.fromRGB(145, 145, 145),
    })
end)

local window
local okWindow, windowResult = pcall(function()
    return WindUI:CreateWindow({
        Title = "ink_破坏者谜团2",
        Author = "@Theinkremains",
        Icon = "rbxassetid://71953031400395",
        Folder = "ink_HUB",
        NewElements = true,
        HideSearchBar = false,
        Theme = "inkGray",
    })
end)
if not okWindow or not windowResult then
    warn("[ink_HUB] UI 创建失败：", tostring(windowResult))
    return
end
window = windowResult

pcall(function()
    window:Tag({ Title = "破坏者谜团2", Radius = 5, Color = Color3.fromHex("#555555") })
    window:Tag({ Title = "服务器专属", Radius = 6, Color = Color3.fromHex("#B0B0B0") })
end)

pcall(function()
    window:EditOpenButton({
        Title = "Project_ink_破坏者谜团2",
        Icon = "crown",
        StrokeThickness = 5,
        TextColor = Color3.fromRGB(150, 150, 150),
        TitleColor = Color3.fromRGB(150, 150, 150),
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 90, 90)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 150, 150)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 70))
        }),
        Draggable = true
    })
end)

pcall(function()
    local targetWindow = window.UIElements and window.UIElements.Main
    if not targetWindow then
        local CoreGui = game:GetService("CoreGui")
        for _, obj in ipairs(CoreGui:GetDescendants()) do
            if obj:IsA("Frame") and obj.AbsoluteSize.X > 300 and obj.AbsoluteSize.Y > 150 then
                local title = obj:FindFirstChildWhichIsA("TextLabel", true)
                if title and title.Text == "ink_破坏者谜团2" then
                    targetWindow = obj
                    break
                end
            end
        end
    end

    if targetWindow then
        local oldStroke = targetWindow:FindFirstChild("inkGrayMainBorder")
        if oldStroke then oldStroke:Destroy() end

        local stroke = Instance.new("UIStroke")
        stroke.Name = "inkGrayMainBorder"
        stroke.Thickness = 7
        stroke.Transparency = 0
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Color = Color3.fromRGB(145,145,145)
        stroke.Parent = targetWindow

        local glowColors = {
            {Name = "inkGrayGlowOuter", Thickness = 16, Transparency = 0.88},
            {Name = "inkGrayGlowMid", Thickness = 11, Transparency = 0.80},
            {Name = "inkGrayGlowInner", Thickness = 7, Transparency = 0.70},
        }

        for _, info in ipairs(glowColors) do
            local oldGlow = targetWindow:FindFirstChild(info.Name)
            if oldGlow then oldGlow:Destroy() end

            local glow = Instance.new("UIStroke")
            glow.Name = info.Name
            glow.Thickness = info.Thickness
            glow.Transparency = info.Transparency
            glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            glow.Color = Color3.fromRGB(150,150,150)
            glow.Parent = targetWindow

            local glowGradient = Instance.new("UIGradient")
            glowGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(70,70,70)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(190,190,190)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(70,70,70))
            })
            glowGradient.Parent = glow

            task.spawn(function()
                local r = 0
                while targetWindow.Parent and glow.Parent and glowGradient.Parent do
                    r = (r + 1.1) % 360
                    glowGradient.Rotation = r
                    RunService.RenderStepped:Wait()
                end
            end)
        end

        local gradient = Instance.new("UIGradient")
        gradient.Name = "inkGrayBorderGradient"
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(65,65,65)),
            ColorSequenceKeypoint.new(0.25, Color3.fromRGB(120,120,120)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200,200,200)),
            ColorSequenceKeypoint.new(0.75, Color3.fromRGB(120,120,120)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(65,65,65))
        })
        gradient.Parent = stroke

        task.spawn(function()
            local rotation = 0
            while targetWindow.Parent and stroke.Parent and gradient.Parent do
                rotation = (rotation + 1.5) % 360
                gradient.Rotation = rotation
                RunService.RenderStepped:Wait()
            end
        end)
    end
end)

pcall(function()
    local CoreGui = game:GetService("CoreGui")
    local function recolor(root)
        for _, obj in ipairs(root:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                if obj.Text == "ink_破坏者谜团2" then
                    obj.TextColor3 = Color3.fromRGB(155,155,155)
                elseif obj.Text == "@Theinkremains" then
                    obj.TextColor3 = Color3.fromRGB(125,125,125)
                end
            end
        end
    end

    recolor(CoreGui)
    task.delay(0.25, function() pcall(function() recolor(CoreGui) end) end)
    task.delay(0.8, function() pcall(function() recolor(CoreGui) end) end)
end)
local MainTab = window:Tab({Title = "主要功能", Icon = "settings"})

local speedEnabled = false
local speedValue = 16
MainTab:Toggle({
    Title = "启用修改速度",
    Value = false,
    Callback = function(v)
        speedEnabled = v
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v and speedValue or 16 end
    end
})
MainTab:Slider({
    Title = "修改速度",
    Value = {Min=16, Max=100, Default=16},
    Step = 1,
    Callback = function(v)
        speedValue = v
        if speedEnabled then
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = v end
        end
    end
})

local jumpEnabled = false
local jumpValue = 50
MainTab:Toggle({
    Title = "启用修改跳跃高度",
    Value = false,
    Callback = function(v)
        jumpEnabled = v
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            if v then hum.JumpPower = jumpValue else hum.JumpPower = 50 end
        end
    end
})
MainTab:Slider({
    Title = "修改跳跃高度",
    Value = {Min=20, Max=200, Default=50},
    Step = 1,
    Callback = function(v)
        jumpValue = v
        if jumpEnabled then
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower = v end
        end
    end
})

MainTab:Slider({
    Title = "视野",
    Value = { Min = 60, Max = 120, Default = 70 },
    Step = 1,
    Callback = function(v)
        workspace.CurrentCamera.FieldOfView = v
    end
})

local xrayenabled = false
local xraytransparency = 0.6
local originaltransparencies = {}

MainTab:Toggle({
    Title = "X光",
    Value = false,
    Callback = function(v)
        xrayenabled = v
        if v then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not obj:IsDescendantOf(LocalPlayer.Character) then
                    originaltransparencies[obj] = obj.Transparency
                    obj.Transparency = xraytransparency
                end
            end
        else
            for obj, t in pairs(originaltransparencies) do
                if obj and obj.Parent then
                    obj.Transparency = t
                end
            end
            originaltransparencies = {}
        end
    end
})
MainTab:Slider({
    Title = "X光透明度",
    Value = { Min = 0, Max = 100, Default = 60 },
    Step = 1,
    Callback = function(v)
        xraytransparency = v / 100
        if xrayenabled then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not obj:IsDescendantOf(LocalPlayer.Character) and originaltransparencies[obj] then
                    obj.Transparency = v / 100
                end
            end
        end
    end
})

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.1)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        if speedEnabled then hum.WalkSpeed = speedValue end
        if jumpEnabled then hum.JumpPower = jumpValue end
    end
end)

local function findSafePosition(targetHrp, baseDistance)
    local angles = {
        Vector3.new(0, 0, baseDistance),   
        Vector3.new(0, 0, -baseDistance),  
        Vector3.new(baseDistance, 0, 0),   
        Vector3.new(-baseDistance, 0, 0),  
        Vector3.new(baseDistance * 0.7, 0, baseDistance * 0.7),
        Vector3.new(-baseDistance * 0.7, 0, baseDistance * 0.7)
    }
    local distances = {baseDistance, 3, 1.5}
    for _, dist in ipairs(distances) do
        for _, offset in ipairs(angles) do
            local currentOffset = offset * (dist / baseDistance)
            local targetCFrame = targetHrp.CFrame * CFrame.new(currentOffset)
            local pos = targetCFrame.Position + Vector3.new(0, 2, 0)
            local boxSize = Vector3.new(3, 4, 3)
            
            local params = OverlapParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            params.FilterDescendantsInstances = {LocalPlayer.Character, targetHrp.Parent}
            
            local parts = workspace:GetPartBoundsInBox(CFrame.new(pos), boxSize, params)
            local blocked = false
            for _, part in ipairs(parts) do
                if part.CanCollide and part.Transparency < 0.8 then
                    blocked = true
                    break
                end
            end
            if not blocked then return targetCFrame end
        end
    end
    return targetHrp.CFrame * CFrame.new(0, 0, baseDistance)
end

local killerRadarEnabled = false
local sheriffRadarEnabled = false
local radarGui = nil
local radarSound = nil
local radarDistance = 40 


local function updateRadarUI(killerNear, sheriffNear)
    local anyThreat = killerNear or sheriffNear

    if anyThreat then
        
        if not radarGui or not radarGui.Parent then
            radarGui = Instance.new("ScreenGui")
            radarGui.Name = "ink_RadarWarning"
            radarGui.ResetOnSpawn = false
            radarGui.IgnoreGuiInset = true
            radarGui.Parent = game:GetService("CoreGui")

            local frame = Instance.new("Frame")
            frame.Name = "RadarFrame"
            frame.Size = UDim2.fromOffset(280, 60)
            frame.Position = UDim2.new(1, -300, 1, -100) 
            frame.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            frame.BackgroundTransparency = 0.2
            frame.BorderSizePixel = 0
            frame.Parent = radarGui

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 8)
            corner.Parent = frame

            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(255, 0, 0)
            stroke.Thickness = 3
            stroke.Parent = frame

            local text = Instance.new("TextLabel")
            text.Name = "TextLabel"
            text.Size = UDim2.fromScale(1, 1)
            text.BackgroundTransparency = 1
            text.TextColor3 = Color3.fromRGB(255, 255, 255)
            text.Font = Enum.Font.SourceSansBold
            text.TextSize = 20
            text.Parent = frame
        end

        
        local textLabel = radarGui.RadarFrame.TextLabel
        if killerNear and sheriffNear then
            textLabel.Text = "⚠️ 警告：杀手和警长靠近！"
        elseif killerNear then
            textLabel.Text = "⚠️ 警告：杀手靠近！"
        elseif sheriffNear then
            textLabel.Text = "⚠️ 警告：警长靠近！"
        end

        
        if not radarSound then
            radarSound = Instance.new("Sound")
            radarSound.Name = "ink_RadarSound"
            radarSound.SoundId = "rbxassetid://129496339606661"
            radarSound.Volume = 5
            radarSound.Looped = true
            radarSound.Parent = game:GetService("SoundService")
        end
        if not radarSound.IsPlaying then
            radarSound:Play()
        end
    else
        
        if radarGui then
            radarGui:Destroy()
            radarGui = nil
        end
        if radarSound and radarSound.IsPlaying then
            radarSound:Stop()
        end
    end
end


task.spawn(function()
    while true do
        task.wait(0.1)
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local killerNear = false
        local sheriffNear = false
        
        if hrp then
            
            local myRole = "Normal"
            local myBp = LocalPlayer:FindFirstChild("Backpack") or char:FindFirstChildOfClass("Backpack")
            local myHasKnife = (myBp and myBp:FindFirstChild("Knife")) or char:FindFirstChild("Knife")
            local myHasGun = (myBp and myBp:FindFirstChild("Gun")) or char:FindFirstChild("Gun")
            
            if myHasGun then
                myRole = "Sheriff"
            elseif myHasKnife then
                myRole = "Killer"
            end

            
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local enemyHrp = p.Character:FindFirstChild("HumanoidRootPart")
                    if enemyHrp and (hrp.Position - enemyHrp.Position).Magnitude <= radarDistance then
                        local bp = p:FindFirstChild("Backpack") or p.Character:FindFirstChildOfClass("Backpack")
                        local hasKnife = (bp and bp:FindFirstChild("Knife")) or p.Character:FindFirstChild("Knife")
                        local hasGun = (bp and bp:FindFirstChild("Gun")) or p.Character:FindFirstChild("Gun")
                        
                        
                        if hasKnife then
                            if killerRadarEnabled and (myRole == "Normal" or myRole == "Sheriff") then
                                killerNear = true
                            end
                        end
                        
                        if hasGun then
                            if sheriffRadarEnabled and (myRole == "Normal" or myRole == "Killer") then
                                sheriffNear = true
                            end
                        end
                    end
                end
            end
        end
        updateRadarUI(killerNear, sheriffNear)
    end
end)

MainTab:Toggle({
    Title = "杀手靠近提示",
    Value = false,
    Callback = function(v)
        killerRadarEnabled = v
    end
})

MainTab:Toggle({
    Title = "警长靠近提示",
    Value = false,
    Callback = function(v)
        sheriffRadarEnabled = v
    end
})

MainTab:Slider({
    Title = "雷达检测距离",
    Value = {Min = 10, Max = 100, Default = 40},
    Step = 1,
    Callback = function(v)
        radarDistance = v
    end
})

local autoDodgeEnabled = false
local autoDodgeLastTime = 0
local autoDodgeRange = 15

local function doAutoDodge(reason)
    if tick() - autoDodgeLastTime < 1.0 then return end
    autoDodgeLastTime = tick()
    
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local success = false
    local finalPos = nil
    
    for i = 1, 20 do
        local angle = math.rad(math.random(0, 360))
        local dist = math.random(20, 45)
        
        local testX = hrp.Position.X + math.cos(angle) * dist
        local testZ = hrp.Position.Z + math.sin(angle) * dist
        local rayOrigin = Vector3.new(testX, hrp.Position.Y + 30, testZ)
        
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        raycastParams.FilterDescendantsInstances = {char}
        
        local result = workspace:Raycast(rayOrigin, Vector3.new(0, -150, 0), raycastParams)
        
        if result then
            local targetPos = result.Position + Vector3.new(0, 3, 0)
            
            local overlapParams = OverlapParams.new()
            overlapParams.FilterType = Enum.RaycastFilterType.Exclude
            overlapParams.FilterDescendantsInstances = {char}
            
            local boxSize = Vector3.new(3, 5, 3)
            local partsInBox = workspace:GetPartBoundsInBox(CFrame.new(targetPos), boxSize, overlapParams)
            
            local blocked = false
            for _, part in ipairs(partsInBox) do
                if part.CanCollide and part.Transparency < 0.8 then
                    blocked = true
                    break
                end
            end
            
            if not blocked then
                finalPos = targetPos
                success = true
                break
            end
        end
    end
    
    if success and finalPos then
        hrp.CFrame = CFrame.new(finalPos)
        hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        window:Notify({Title = "极限闪避", Content = reason, Duration = 2})
    else
        window:Notify({Title = "闪避失败", Content = "周围全是墙或虚空", Duration = 2})
    end
end

RunService.Heartbeat:Connect(function()
    if not autoDodgeEnabled then return end
    
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    if char:FindFirstChild("Knife") then return end
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            if p.Character:FindFirstChild("Knife") then
                local enemyHrp = p.Character:FindFirstChild("HumanoidRootPart")
                if enemyHrp then
                    if (hrp.Position - enemyHrp.Position).Magnitude <= autoDodgeRange then
                        doAutoDodge("规避持刀者 " .. p.Name)
                        break
                    end
                end
            end
        end
    end
end)

local function watchDodgePlayer(p)
    if p == LocalPlayer then return end
    local function checkKnife(char)
       
        local myChar = LocalPlayer.Character
        if myChar and myChar:FindFirstChild("Knife") then return end
        
        if autoDodgeEnabled and char:FindFirstChild("Knife") then
            doAutoDodge("预警: " .. p.Name .. " 拔刀")
        end
        char.ChildAdded:Connect(function(child)
            local myChar2 = LocalPlayer.Character
            if myChar2 and myChar2:FindFirstChild("Knife") then return end
            
            if autoDodgeEnabled and child.Name == "Knife" then
                doAutoDodge("预警: " .. p.Name .. " 拔刀")
            end
        end)
    end
    if p.Character then checkKnife(p.Character) end
    p.CharacterAdded:Connect(checkKnife)
end

for _, p in ipairs(Players:GetPlayers()) do watchDodgePlayer(p) end
Players.PlayerAdded:Connect(watchDodgePlayer)

MainTab:Toggle({
    Title = "自动躲刀",
    Value = false,
    Callback = function(v)
        autoDodgeEnabled = v
        if v then
            window:Notify({Title = "防秒杀已开启", Content = "杀手靠近时将自动瞬移", Duration = 3})
        end
    end
})

MainTab:Slider({
    Title = "检测距离",
    Value = {Min = 5, Max = 60, Default = 15},
    Step = 1,
    Callback = function(v)
        autoDodgeRange = v
    end
})

MainTab:Button({
    Title = "传送到警长旁边",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local target = nil
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local bp = p:FindFirstChild("Backpack") or p.Character:FindFirstChildOfClass("Backpack")
                if (bp and bp:FindFirstChild("Gun")) or p.Character:FindFirstChild("Gun") then
                    target = p break
                end
            end
        end
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            hrp.CFrame = findSafePosition(target.Character.HumanoidRootPart, 5)
            window:Notify({Title = "传送成功", Content = "已传送到警长附近", Duration = 3})
        else
            window:Notify({Title = "未找到警长", Content = "当前没有玩家拿到枪", Duration = 3})
        end
    end
})

MainTab:Button({
    Title = "传送到杀手旁边",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local target = nil
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local bp = p:FindFirstChild("Backpack") or p.Character:FindFirstChildOfClass("Backpack")
                if (bp and bp:FindFirstChild("Knife")) or p.Character:FindFirstChild("Knife") then
                    target = p break
                end
            end
        end
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            hrp.CFrame = findSafePosition(target.Character.HumanoidRootPart, 5)
            window:Notify({Title = "传送成功", Content = "已传送到杀手附近", Duration = 3})
        else
            window:Notify({Title = "未找到杀手", Content = "当前没有玩家拿到刀", Duration = 3})
        end
    end
})

MainTab:Button({
    Title = "传送到大厅",
    Callback = function()
        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame.new(603.0, 467.8, 37.0)
            end
        end
    end
})

local P = window:Tab({Title = "透视", Icon = "eye"})
local categorySettings = {
    Normal = {
        title = "透视玩家",
        color = Color3.fromRGB(255, 255, 255),
        esp = false, outline = false, tracer = false,
        espColor = Color3.fromRGB(255, 255, 255),
        outlineColor = Color3.fromRGB(255, 255, 255),
        tracerColor = Color3.fromRGB(255, 255, 255),
    },
    Sheriff = {
        title = "透视警长",
        color = Color3.fromRGB(0, 120, 255),
        esp = false, outline = false, tracer = false,
        espColor = Color3.fromRGB(0, 120, 255),
        outlineColor = Color3.fromRGB(0, 120, 255),
        tracerColor = Color3.fromRGB(0, 120, 255),
    },
    Killer = {
        title = "透视杀手",
        color = Color3.fromRGB(255, 0, 0),
        esp = false, outline = false, tracer = false,
        espColor = Color3.fromRGB(255, 0, 0),
        outlineColor = Color3.fromRGB(255, 0, 0),
        tracerColor = Color3.fromRGB(255, 0, 0),
    },
}

local drawTexts = {}
local drawLines = {}
local highlights = {}
local renderBound = false
local categoryNames = {"Normal", "Sheriff", "Killer"}

local function hasNamedTool(player, wantedName)
    local backpack = player:FindFirstChildOfClass("Backpack") or player:FindFirstChild("Backpack")
    if backpack and backpack:FindFirstChild(wantedName) then return true end
    local character = player.Character
    if character and character:FindFirstChild(wantedName) then return true end
    return false
end

local function getCategory(player)
    local hasKnife = hasNamedTool(player, "Knife")
    local hasGun = hasNamedTool(player, "Gun")
    if hasKnife and hasGun then return nil end
    if hasKnife then return "Killer" end
    if hasGun then return "Sheriff" end
    return "Normal"
end

local function removePlayerVisuals(player)
    local textObject = drawTexts[player]
    if textObject then pcall(function() textObject:Remove() end); drawTexts[player] = nil end
    local lineObject = drawLines[player]
    if lineObject then pcall(function() lineObject:Remove() end); drawLines[player] = nil end
    local high = highlights[player]
    if high then pcall(function() high:Destroy() end); highlights[player] = nil end
end

local function ensureText(player)
    if drawTexts[player] or not Drawing then return end
    local ok, obj = pcall(function() return Drawing.new("Text") end)
    if not ok or not obj then return end
    obj.Size = 16
    obj.Center = true
    obj.Outline = true
    obj.Font = 2
    obj.Visible = false
    drawTexts[player] = obj
end

local function ensureLine(player)
    if drawLines[player] or not Drawing then return end
    local ok, obj = pcall(function() return Drawing.new("Line") end)
    if not ok or not obj then return end
    obj.Thickness = 2
    obj.Transparency = 1
    obj.Visible = false
    drawLines[player] = obj
end

local function ensureHighlight(player)
    if highlights[player] or not player.Character then return end
    local ok, high = pcall(function()
        local h = Instance.new("Highlight")
        h.Name = "ink_HUB_PlayerOutline"
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.FillTransparency = 1
        h.OutlineTransparency = 0
        h.Adornee = player.Character
        h.Parent = player.Character
        return h
    end)
    if ok and high then highlights[player] = high end
end

local function updateVisuals()
    local camera = workspace.CurrentCamera
    if not camera then return end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local category = getCategory(player)
            local settings = category and categorySettings[category] or nil
            local character = player.Character
            local root = character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Head"))
            local valid = settings ~= nil and character ~= nil and root ~= nil
            local pos, onScreen
            if valid then pos, onScreen = camera:WorldToViewportPoint(root.Position) end
            local showOnScreen = valid and onScreen and pos.Z > 0

            local textObj = drawTexts[player]
            if textObj then
                if showOnScreen and settings.esp then
                    local distance = math.floor((camera.CFrame.Position - root.Position).Magnitude)
                    textObj.Color = settings.espColor
                    textObj.Position = Vector2.new(pos.X, pos.Y - 20)
                    textObj.Text = player.Name .. " | " .. distance .. " 米"
                    textObj.Visible = true
                else
                    textObj.Visible = false
                end
            end

            local lineObj = drawLines[player]
            if lineObj then
                if showOnScreen and settings.tracer then
                    lineObj.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
                    lineObj.To = Vector2.new(pos.X, pos.Y)
                    lineObj.Color = settings.tracerColor
                    lineObj.Visible = true
                else
                    lineObj.Visible = false
                end
            end

            local high = highlights[player]
            if settings and settings.outline and character then
                if not high or high.Parent ~= character then
                    if high then pcall(function() high:Destroy() end) end
                    highlights[player] = nil
                    ensureHighlight(player)
                    high = highlights[player]
                end
                if high then
                    high.Adornee = character
                    high.OutlineColor = settings.outlineColor
                    high.FillColor = settings.outlineColor
                    high.Enabled = true
                end
            elseif high then
                high.Enabled = false
            end

            if not settings then
                if textObj then textObj.Visible = false end
                if lineObj then lineObj.Visible = false end
                if high then high.Enabled = false end
            end
        end
    end
end

local function refreshRenderBinding()
    local anyEnabled = false
    for _, key in ipairs(categoryNames) do
        local s = categorySettings[key]
        if s.esp or s.outline or s.tracer then anyEnabled = true end
    end
    if anyEnabled and not renderBound then
        RunService:BindToRenderStep("ink_HUB_ThreeCategoryESP", Enum.RenderPriority.Camera.Value + 1, updateVisuals)
        renderBound = true
    elseif not anyEnabled and renderBound then
        RunService:UnbindFromRenderStep("ink_HUB_ThreeCategoryESP")
        renderBound = false
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                if drawTexts[player] then drawTexts[player].Visible = false end
                if drawLines[player] then drawLines[player].Visible = false end
                if highlights[player] then highlights[player].Enabled = false end
            end
        end
    end
end

local function setOption(category, option, value)
    local s = categorySettings[category]
    s[option] = value
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and getCategory(player) == category then
            if option == "esp" and value then ensureText(player) end
            if option == "tracer" and value then ensureLine(player) end
            if option == "outline" and value then ensureHighlight(player) end
        end
    end
    refreshRenderBinding()
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(0.2)
        if categorySettings.Normal.esp or categorySettings.Sheriff.esp or categorySettings.Killer.esp then ensureText(player) end
        if categorySettings.Normal.tracer or categorySettings.Sheriff.tracer or categorySettings.Killer.tracer then ensureLine(player) end
        if categorySettings.Normal.outline or categorySettings.Sheriff.outline or categorySettings.Killer.outline then ensureHighlight(player) end
    end)
end)
Players.PlayerRemoving:Connect(removePlayerVisuals)

local function addCategoryControls(key)
    local s = categorySettings[key]
    local group = P:Section({Title = s.title, Opened = true})
    local prefix = key == "Normal" and "玩家" or (key == "Sheriff" and "警长" or "杀手")
    group:Toggle({Title = prefix .. "透视", Value = false, Callback = function(v) setOption(key, "esp", v) end})
    group:Colorpicker({Title = prefix .. "透视颜色", Default = s.espColor, Callback = function(v) s.espColor = v end})
    group:Toggle({Title = prefix .. "轮廓", Value = false, Callback = function(v) setOption(key, "outline", v) end})
    group:Colorpicker({Title = prefix .. "轮廓颜色", Default = s.outlineColor, Callback = function(v) s.outlineColor = v end})
    group:Toggle({Title = prefix .. "追踪线", Value = false, Callback = function(v) setOption(key, "tracer", v) end})
    group:Colorpicker({Title = prefix .. "追踪线颜色", Default = s.tracerColor, Callback = function(v) s.tracerColor = v end})
end

addCategoryControls("Normal")
addCategoryControls("Sheriff")
addCategoryControls("Killer")

local CoinESPGroup = P:Section({Title = "硬币透视", Opened = true})
local coinSettings = {
    esp = false,
    outline = false,
    tracer = false,
    espColor = Color3.fromRGB(255, 215, 0),
    outlineColor = Color3.fromRGB(255, 215, 0),
    tracerColor = Color3.fromRGB(255, 215, 0)
}
local coinHighlighted = {} 
local coinRenderConn = nil

local function clearCoinESP()
    for _, data in pairs(coinHighlighted) do
        if data.Highlight then pcall(function() data.Highlight:Destroy() end) end
        if data.Text then pcall(function() data.Text:Remove() end) end
        if data.Line then pcall(function() data.Line:Remove() end) end
    end
    coinHighlighted = {}
    if coinRenderConn then
        coinRenderConn:Disconnect()
        coinRenderConn = nil
    end
end

local function scanCoins()
    if not (coinSettings.esp or coinSettings.outline or coinSettings.tracer) then return end
    
    -- 1. 清理消失的
    for visual, data in pairs(coinHighlighted) do
        if not visual or not visual.Parent then
            if data.Highlight then pcall(function() data.Highlight:Destroy() end) end
            if data.Text then pcall(function() data.Text:Remove() end) end
            if data.Line then pcall(function() data.Line:Remove() end) end
            coinHighlighted[visual] = nil
        end
    end

    -- 2. 扫描新硬币
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "CoinVisual" then
            if not coinHighlighted[obj] then
                local hasTouch = false
                local checkObj = obj
                for i = 1, 4 do
                    if checkObj and (checkObj:FindFirstChild("TouchInterest") or checkObj:FindFirstChildOfClass("TouchTransmitter")) then
                        hasTouch = true
                        break
                    end
                    if checkObj then checkObj = checkObj.Parent end
                end
                
                if hasTouch then
                    local data = {}
                    data.Visual = obj
                    
                    local target = nil
                    if obj:IsA("BasePart") then
                        target = obj
                    else
                        target = obj:FindFirstAncestorWhichIsA("BasePart") or obj:FindFirstAncestorOfClass("Model")
                    end
                    
                    if target and target ~= workspace then
                        local hl = Instance.new("Highlight")
                        hl.Adornee = target
                        hl.FillTransparency = 1 
                        hl.OutlineColor = coinSettings.outlineColor
                        hl.OutlineTransparency = 0
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
                        hl.Parent = target
                        hl.Enabled = coinSettings.outline
                        data.Highlight = hl
                    end

                    if Drawing then
                        local text = Drawing.new("Text")
                        text.Size = 16
                        text.Center = true
                        text.Outline = true
                        text.Font = 2
                        text.Color = coinSettings.espColor
                        text.Visible = false
                        data.Text = text

                        local line = Drawing.new("Line")
                        line.Thickness = 2
                        line.Transparency = 1
                        line.Color = coinSettings.tracerColor
                        line.Visible = false
                        data.Line = line
                    end
                    
                    coinHighlighted[obj] = data
                end
            end
        end
    end
end

local function updateCoinVisuals()
    if not (coinSettings.esp or coinSettings.outline or coinSettings.tracer) then return end
    local camera = workspace.CurrentCamera
    if not camera then return end
    local screenHeight = camera.ViewportSize.Y

    for visual, data in pairs(coinHighlighted) do
        if visual and visual.Parent then
            if data.Highlight then
                data.Highlight.Enabled = coinSettings.outline
                data.Highlight.OutlineColor = coinSettings.outlineColor
            end

            local pos3D
            if visual:IsA("BasePart") then
                pos3D = visual.Position
            elseif visual.Parent and visual.Parent:IsA("BasePart") then
                pos3D = visual.Parent.Position
            elseif visual:IsA("Model") then
                local _, size = visual:GetBoundingBox()
                pos3D = visual:GetBoundingBox().Position
            else
                local ancestorPart = visual:FindFirstAncestorWhichIsA("BasePart")
                if ancestorPart then
                    pos3D = ancestorPart.Position
                end
            end

            if pos3D then
                local pos, onScreen = camera:WorldToViewportPoint(pos3D)
                local distance = math.floor((camera.CFrame.Position - pos3D).Magnitude)
                
                if onScreen and pos.Z > 0 then
                    if data.Text then
                        data.Text.Position = Vector2.new(pos.X, pos.Y - 20)
                        data.Text.Text = "Coin | " .. distance .. "m"
                        data.Text.Color = coinSettings.espColor
                        data.Text.Visible = coinSettings.esp
                    end
                    if data.Line then
                        data.Line.From = Vector2.new(camera.ViewportSize.X / 2, screenHeight)
                        data.Line.To = Vector2.new(pos.X, pos.Y)
                        data.Line.Color = coinSettings.tracerColor
                        data.Line.Visible = coinSettings.tracer
                    end
                else
                    if data.Text then data.Text.Visible = false end
                    if data.Line then data.Line.Visible = false end
                end
            end
        end
    end
end

local function updateCoinState()
    local anyEnabled = coinSettings.esp or coinSettings.outline or coinSettings.tracer
    if anyEnabled then
        if not coinRenderConn then
            coinRenderConn = RunService.RenderStepped:Connect(updateCoinVisuals)
            task.spawn(function()
                while coinRenderConn do
                    task.wait(1)
                    if coinSettings.esp or coinSettings.outline or coinSettings.tracer then
                        scanCoins()
                    else
                        break
                    end
                end
            end)
        end
        scanCoins()
    else
        clearCoinESP()
    end
end

CoinESPGroup:Toggle({Title = "透视硬币", Value = false, Callback = function(v) coinSettings.esp = v; updateCoinState() end})
CoinESPGroup:Colorpicker({Title = "硬币透视颜色", Default = coinSettings.espColor, Callback = function(v) coinSettings.espColor = v end})
CoinESPGroup:Toggle({Title = "硬币轮廓", Value = false, Callback = function(v) coinSettings.outline = v; updateCoinState() end})
CoinESPGroup:Colorpicker({Title = "硬币轮廓颜色", Default = coinSettings.outlineColor, Callback = function(v) coinSettings.outlineColor = v end})
CoinESPGroup:Toggle({Title = "硬币追踪线", Value = false, Callback = function(v) coinSettings.tracer = v; updateCoinState() end})
CoinESPGroup:Colorpicker({Title = "硬币追踪线颜色", Default = coinSettings.tracerColor, Callback = function(v) coinSettings.tracerColor = v end})

print("[ink_HUB] 加载成功")