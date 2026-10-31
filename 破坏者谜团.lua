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

local function showNotify(titleText, contentText, isError)
    local TweenService = game:GetService("TweenService")
    local CoreGui = game:GetService("CoreGui")
    local activeNotifies = _G.inkActiveNotifies or {}
    _G.inkActiveNotifies = activeNotifies

    local gui = CoreGui:FindFirstChild("ink_Notify") or Instance.new("ScreenGui", CoreGui)
    gui.Name, gui.ResetOnSpawn, gui.DisplayOrder = "ink_Notify", false, 999999

    local frame = Instance.new("Frame", gui)
    frame.Size, frame.AnchorPoint, frame.Position, frame.BackgroundTransparency = UDim2.fromOffset(260, 65), Vector2.new(1, 1), UDim2.new(1, 300, 1, -20), 1
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color, stroke.Transparency, stroke.Thickness = isError and Color3.fromRGB(255,100,100) or Color3.fromRGB(180,180,180), 0.2, 1.5

    local baseBg = Instance.new("Frame", frame)
    baseBg.Size, baseBg.BackgroundColor3, baseBg.BackgroundTransparency, baseBg.ZIndex = UDim2.fromScale(1, 1), isError and Color3.fromRGB(140,70,70) or Color3.fromRGB(100,100,100), 0.5, 1
    Instance.new("UICorner", baseBg).CornerRadius = UDim.new(0, 8)

    local baseIcon = Instance.new("Frame", baseBg)
    baseIcon.Size, baseIcon.Position, baseIcon.BackgroundColor3, baseIcon.BackgroundTransparency, baseIcon.ZIndex = UDim2.fromOffset(30, 30), UDim2.new(0, 12, 0.5, -15), baseBg.BackgroundColor3, baseBg.BackgroundTransparency, 2
    Instance.new("UICorner", baseIcon).CornerRadius = UDim.new(1,0)

    local txtBase = Instance.new("TextLabel", baseBg)
    txtBase.Size, txtBase.Position, txtBase.BackgroundTransparency, txtBase.Text, txtBase.TextColor3, txtBase.Font, txtBase.TextSize, txtBase.TextXAlignment, txtBase.ZIndex = UDim2.fromOffset(30, 30), UDim2.new(0, 12, 0.5, -15), 1, isError and "×" or "✓", Color3.fromRGB(80,80,80), Enum.Font.GothamBold, 16, Enum.TextXAlignment.Center, 3
    
    local tBase = Instance.new("TextLabel", baseBg)
    tBase.Size, tBase.Position, tBase.BackgroundTransparency, tBase.Text, tBase.TextColor3, tBase.Font, tBase.TextSize, tBase.TextXAlignment, tBase.ZIndex = UDim2.new(1, -50, 0, 20), UDim2.new(0, 50, 0, 12), 1, titleText or "提示", Color3.fromRGB(80,80,80), Enum.Font.GothamBold, 15, Enum.TextXAlignment.Left, 3
    
    local cBase = Instance.new("TextLabel", baseBg)
    cBase.Size, cBase.Position, cBase.BackgroundTransparency, cBase.Text, cBase.TextColor3, cBase.Font, cBase.TextSize, cBase.TextXAlignment, cBase.ZIndex = UDim2.new(1, -50, 0, 20), UDim2.new(0, 50, 0, 32), 1, contentText or "", Color3.fromRGB(120,120,120), Enum.Font.Gotham, 13, Enum.TextXAlignment.Left, 3

    local fillBg = Instance.new("Frame", frame)
    fillBg.Size, fillBg.BackgroundColor3, fillBg.BackgroundTransparency, fillBg.ZIndex = UDim2.fromScale(1, 1), isError and Color3.fromRGB(70,10,10) or Color3.fromRGB(25,25,25), 0, 2
    Instance.new("UICorner", fillBg).CornerRadius = UDim.new(0, 8)

    local bgGrad = Instance.new("UIGradient", fillBg)
    bgGrad.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.9, 1), NumberSequenceKeypoint.new(0.91, 0), NumberSequenceKeypoint.new(1, 0)})
    bgGrad.Offset = Vector2.new(1, 0)

    local fillIcon = Instance.new("Frame", fillBg)
    fillIcon.Size, fillIcon.Position, fillIcon.BackgroundColor3, fillIcon.BackgroundTransparency, fillIcon.ZIndex = UDim2.fromOffset(30, 30), UDim2.new(0, 12, 0.5, -15), fillBg.BackgroundColor3, 0, 2
    Instance.new("UICorner", fillIcon).CornerRadius = UDim.new(1,0)

    local iconGrad = Instance.new("UIGradient", fillIcon)
    iconGrad.Transparency, iconGrad.Offset = bgGrad.Transparency, Vector2.new(1, 0)

    local txtFill = Instance.new("TextLabel", fillBg)
    txtFill.Size, txtFill.Position, txtFill.BackgroundTransparency, txtFill.Text, txtFill.TextColor3, txtFill.Font, txtFill.TextSize, txtFill.TextXAlignment, txtFill.ZIndex = UDim2.fromOffset(30, 30), UDim2.new(0, 12, 0.5, -15), 1, isError and "×" or "✓", Color3.fromRGB(255,255,255), Enum.Font.GothamBold, 16, Enum.TextXAlignment.Center, 3
    
    local tFill = Instance.new("TextLabel", fillBg)
    tFill.Size, tFill.Position, tFill.BackgroundTransparency, tFill.Text, tFill.TextColor3, tFill.Font, tFill.TextSize, tFill.TextXAlignment, tFill.ZIndex = UDim2.new(1, -50, 0, 20), UDim2.new(0, 50, 0, 12), 1, titleText or "提示", Color3.fromRGB(255,255,255), Enum.Font.GothamBold, 15, Enum.TextXAlignment.Left, 3
    
    local cFill = Instance.new("TextLabel", fillBg)
    cFill.Size, cFill.Position, cFill.BackgroundTransparency, cFill.Text, cFill.TextColor3, cFill.Font, cFill.TextSize, cFill.TextXAlignment, cFill.ZIndex = UDim2.new(1, -50, 0, 20), UDim2.new(0, 50, 0, 32), 1, contentText or "", Color3.fromRGB(180,180,180), Enum.Font.Gotham, 13, Enum.TextXAlignment.Left, 3

    local close = Instance.new("TextButton", frame)
    close.Size, close.Position, close.BackgroundTransparency, close.Text, close.TextColor3, close.Font, close.TextSize, close.ZIndex = UDim2.fromOffset(25,25), UDim2.new(1,-30,0,5), 1, "×", Color3.fromRGB(150,150,150), Enum.Font.GothamBold, 14, 4

    close.MouseEnter:Connect(function() TweenService:Create(close, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(255, 80, 80), TextSize = 20}):Play() end)
    close.MouseLeave:Connect(function() TweenService:Create(close, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(150, 150, 150), TextSize = 14}):Play() end)
    close.MouseButton1Down:Connect(function() TweenService:Create(close, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(255, 80, 80), TextSize = 20}):Play() end)
    close.MouseButton1Up:Connect(function() TweenService:Create(close, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {TextColor3 = Color3.fromRGB(150, 150, 150), TextSize = 14}):Play() end)

    table.insert(activeNotifies, frame)
    local myIndex = #activeNotifies
    
    for i, f in ipairs(activeNotifies) do
        TweenService:Create(f, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 1, -20 - ((i - 1) * 75))}):Play()
    end
    
    TweenService:Create(bgGrad, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {Offset = Vector2.new(-1, 0)}):Play()
    TweenService:Create(iconGrad, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {Offset = Vector2.new(-1, 0)}):Play()
    
    local function destroy()
        if frame:GetAttribute("Dead") then return end
        frame:SetAttribute("Dead", true)
        for i, f in ipairs(activeNotifies) do if f == frame then table.remove(activeNotifies, i) break end end
        TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(1, 300, 1, frame.Position.Y.Offset)}):Play()
        task.wait(0.3)
        frame:Destroy()
        for i, f in ipairs(activeNotifies) do
            TweenService:Create(f, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 1, -20 - ((i - 1) * 75))}):Play()
        end
    end
    close.MouseButton1Click:Connect(function() task.wait(0.1) destroy() end)
    task.delay(3, destroy)
end

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
local radarDistance = 40 
local radarHighlights = {}
local mySelfHighlight = nil
local selfHighlightConn = nil
local radarGui = nil
local isRadarUIOpen = false
local radarSound = nil 

local function updateSelfHighlight(active, color)
    local char = LocalPlayer.Character
    if not char then return end

    if active then
        if not mySelfHighlight or mySelfHighlight.Parent ~= char then
            if mySelfHighlight then mySelfHighlight:Destroy() end
            mySelfHighlight = Instance.new("Highlight")
            mySelfHighlight.Name = "ink_SelfGradientOutline"
            mySelfHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            mySelfHighlight.FillTransparency = 1
            mySelfHighlight.OutlineTransparency = 0
            mySelfHighlight.Adornee = char
            mySelfHighlight.Parent = char
        end
        mySelfHighlight.Enabled = true
        
        if color then
            if selfHighlightConn then selfHighlightConn:Disconnect(); selfHighlightConn = nil end
            mySelfHighlight.OutlineColor = color
            mySelfHighlight.FillColor = color
        else
            if not selfHighlightConn then
                selfHighlightConn = RunService.Heartbeat:Connect(function()
                    if mySelfHighlight and mySelfHighlight.Enabled then
                        local t = (math.sin(tick() * 4) + 1) / 2
                        local gradColor = Color3.fromRGB(255, 0, 0):Lerp(Color3.fromRGB(0, 120, 255), t)
                        mySelfHighlight.OutlineColor = gradColor
                        mySelfHighlight.FillColor = gradColor
                    end
                end)
            end
        end
    else
        if mySelfHighlight then mySelfHighlight.Enabled = false end
        if selfHighlightConn then selfHighlightConn:Disconnect(); selfHighlightConn = nil end
    end
end

local function createPersistentRadarUI()
    if radarGui and radarGui.Parent then return end
    radarGui = Instance.new("ScreenGui")
    radarGui.Name = "ink_RadarPersistent"
    radarGui.ResetOnSpawn = false
    radarGui.IgnoreGuiInset = true
    radarGui.DisplayOrder = 999998
    radarGui.Parent = game:GetService("CoreGui")

    local frame = Instance.new("Frame")
    frame.Name = "RadarFrame"
    frame.Size = UDim2.fromOffset(260, 65)
    frame.AnchorPoint = Vector2.new(1, 1)
    frame.Position = UDim2.new(1, 300, 1, -100)
    frame.BackgroundTransparency = 1
    frame.Parent = radarGui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    
    local stroke = Instance.new("UIStroke", frame)
    stroke.Name = "RadarStroke"
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Transparency = 0.2
    stroke.Thickness = 1.5

    local baseBg = Instance.new("Frame", frame)
    baseBg.Size, baseBg.BackgroundColor3, baseBg.BackgroundTransparency, baseBg.ZIndex = UDim2.fromScale(1, 1), Color3.fromRGB(100,100,100), 0.5, 1
    Instance.new("UICorner", baseBg).CornerRadius = UDim.new(0, 8)

    local baseIcon = Instance.new("Frame", baseBg)
    baseIcon.Size, baseIcon.Position, baseIcon.BackgroundColor3, baseIcon.BackgroundTransparency, baseIcon.ZIndex = UDim2.fromOffset(30, 30), UDim2.new(0, 12, 0.5, -15), baseBg.BackgroundColor3, baseBg.BackgroundTransparency, 2
    Instance.new("UICorner", baseIcon).CornerRadius = UDim.new(1,0)

    local txtBase = Instance.new("TextLabel", baseBg)
    txtBase.Size, txtBase.Position, txtBase.BackgroundTransparency, txtBase.Text, txtBase.TextColor3, txtBase.Font, txtBase.TextSize, txtBase.TextXAlignment, txtBase.ZIndex = UDim2.fromOffset(30, 30), UDim2.new(0, 12, 0.5, -15), 1, "!", Color3.fromRGB(80,80,80), Enum.Font.GothamBold, 16, Enum.TextXAlignment.Center, 3
    
    local tBase = Instance.new("TextLabel", baseBg)
    tBase.Name = "TitleBase"
    tBase.Size, tBase.Position, tBase.BackgroundTransparency, tBase.Text, tBase.TextColor3, tBase.Font, tBase.TextSize, tBase.TextXAlignment, tBase.ZIndex = UDim2.new(1, -50, 0, 20), UDim2.new(0, 50, 0, 12), 1, "威胁靠近", Color3.fromRGB(80,80,80), Enum.Font.GothamBold, 15, Enum.TextXAlignment.Left, 3
    
    local cBase = Instance.new("TextLabel", baseBg)
    cBase.Name = "ContentBase"
    cBase.Size, cBase.Position, cBase.BackgroundTransparency, cBase.Text, cBase.TextColor3, cBase.Font, cBase.TextSize, cBase.TextXAlignment, cBase.ZIndex = UDim2.new(1, -50, 0, 20), UDim2.new(0, 50, 0, 32), 1, "请小心！", Color3.fromRGB(120,120,120), Enum.Font.Gotham, 13, Enum.TextXAlignment.Left, 3

    local fillBg = Instance.new("Frame", frame)
    fillBg.Size, fillBg.BackgroundColor3, fillBg.BackgroundTransparency, fillBg.ZIndex = UDim2.fromScale(1, 1), Color3.fromRGB(25,25,25), 0, 2
    Instance.new("UICorner", fillBg).CornerRadius = UDim.new(0, 8)

    local bgGrad = Instance.new("UIGradient", fillBg)
    bgGrad.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.9, 1), NumberSequenceKeypoint.new(0.91, 0), NumberSequenceKeypoint.new(1, 0)})
    bgGrad.Offset = Vector2.new(-1, 0)

    local fillIcon = Instance.new("Frame", fillBg)
    fillIcon.Size, fillIcon.Position, fillIcon.BackgroundColor3, fillIcon.BackgroundTransparency, fillIcon.ZIndex = UDim2.fromOffset(30, 30), UDim2.new(0, 12, 0.5, -15), fillBg.BackgroundColor3, 0, 2
    Instance.new("UICorner", fillIcon).CornerRadius = UDim.new(1,0)

    local iconGrad = Instance.new("UIGradient", fillIcon)
    iconGrad.Transparency, iconGrad.Offset = bgGrad.Transparency, Vector2.new(-1, 0)

    local txtFill = Instance.new("TextLabel", fillBg)
    txtFill.Size, txtFill.Position, txtFill.BackgroundTransparency, txtFill.Text, txtFill.TextColor3, txtFill.Font, txtFill.TextSize, txtFill.TextXAlignment, txtFill.ZIndex = UDim2.fromOffset(30, 30), UDim2.new(0, 12, 0.5, -15), 1, "!", Color3.fromRGB(255,255,255), Enum.Font.GothamBold, 16, Enum.TextXAlignment.Center, 3
    
    local tFill = Instance.new("TextLabel", fillBg)
    tFill.Name = "TitleFill"
    tFill.Size, tFill.Position, tFill.BackgroundTransparency, tFill.Text, tFill.TextColor3, tFill.Font, tFill.TextSize, tFill.TextXAlignment, tFill.ZIndex = UDim2.new(1, -50, 0, 20), UDim2.new(0, 50, 0, 12), 1, "威胁靠近", Color3.fromRGB(255,255,255), Enum.Font.GothamBold, 15, Enum.TextXAlignment.Left, 3
    
    local cFill = Instance.new("TextLabel", fillBg)
    cFill.Name = "ContentFill"
    cFill.Size, cFill.Position, cFill.BackgroundTransparency, cFill.Text, cFill.TextColor3, cFill.Font, cFill.TextSize, cFill.TextXAlignment, cFill.ZIndex = UDim2.new(1, -50, 0, 20), UDim2.new(0, 50, 0, 32), 1, "请小心！", Color3.fromRGB(180,180,180), Enum.Font.Gotham, 13, Enum.TextXAlignment.Left, 3

    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 1, -100)}):Play()
    TweenService:Create(bgGrad, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)}):Play()
    TweenService:Create(iconGrad, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)}):Play()
    isRadarUIOpen = true
end

local function updateRadarUI(killerNear, sheriffNear)
    local anyThreat = killerNear or sheriffNear
    if anyThreat then
        if not isRadarUIOpen then 
            createPersistentRadarUI() 
            
            
            if not radarSound then
                radarSound = Instance.new("Sound")
                radarSound.SoundId = "rbxassetid://87047730068459"
                radarSound.Volume = 5
                radarSound.Looped = false
                radarSound.Parent = game:GetService("SoundService")
            end
            radarSound:Play()
        end
        
        local frame = radarGui:FindFirstChild("RadarFrame")
        if not frame then return end
        
        local fillBg = frame:FindFirstChildWhichIsA("Frame", true)
        local stroke = frame:FindFirstChild("RadarStroke")
        
        local titleBase = frame:FindFirstChild("TitleBase", true)
        local contentBase = frame:FindFirstChild("ContentBase", true)
        local titleFill = frame:FindFirstChild("TitleFill", true)
        local contentFill = frame:FindFirstChild("ContentFill", true)

        if killerNear and sheriffNear then
            titleBase.Text = "极度危险！"
            contentBase.Text = "杀手和警长同时靠近"
            titleFill.Text = "极度危险！"
            contentFill.Text = "杀手和警长同时靠近"
            fillBg.BackgroundColor3 = Color3.fromRGB(30, 10, 30)
            local existingGrad = stroke:FindFirstChildOfClass("UIGradient")
            if not existingGrad then
                local grad = Instance.new("UIGradient")
                grad.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 0, 150)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 120, 255))
                })
                grad.Parent = stroke
            end
        elseif killerNear then
            titleBase.Text = "警告：杀手"
            contentBase.Text = "杀手正在靠近你！"
            titleFill.Text = "警告：杀手"
            contentFill.Text = "杀手正在靠近你！"
            fillBg.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
            local g = stroke:FindFirstChildOfClass("UIGradient")
            if g then g:Destroy() end
            stroke.Color = Color3.fromRGB(255, 0, 0)
        elseif sheriffNear then
            titleBase.Text = "警告：警长"
            contentBase.Text = "警长正在靠近你！"
            titleFill.Text = "警告：警长"
            contentFill.Text = "警长正在靠近你！"
            fillBg.BackgroundColor3 = Color3.fromRGB(10, 20, 40)
            local g = stroke:FindFirstChildOfClass("UIGradient")
            if g then g:Destroy() end
            stroke.Color = Color3.fromRGB(0, 120, 255)
        end
    else
        if isRadarUIOpen and radarGui then
            isRadarUIOpen = false
            local frame = radarGui:FindFirstChild("RadarFrame")
            if frame then
                local t = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(1, 300, 1, -100)})
                t:Play()
                t.Completed:Wait()
            end
            radarGui:Destroy()
            radarGui = nil
            isRadarUIOpen = false
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
                        
                        local isThreat = false
                        local hlColor = nil
                        
                        if (myRole == "Normal" or myRole == "Sheriff") and killerRadarEnabled and hasKnife then
                            isThreat = true
                            hlColor = Color3.fromRGB(255, 0, 0)
                            killerNear = true
                        end
                        
                        if (myRole == "Normal" or myRole == "Killer") and sheriffRadarEnabled and hasGun then
                            isThreat = true
                            if hlColor then hlColor = Color3.fromRGB(150, 0, 150) else hlColor = Color3.fromRGB(0, 120, 255) end
                            sheriffNear = true
                        end
                        
                        if isThreat and hlColor then
                            if not radarHighlights[p] or not radarHighlights[p].Parent then
                                local hl = Instance.new("Highlight")
                                hl.Name = "ink_RadarOutline"
                                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                hl.FillTransparency = 1
                                hl.OutlineTransparency = 0
                                hl.Adornee = p.Character
                                hl.Parent = p.Character
                                radarHighlights[p] = hl
                            end
                            radarHighlights[p].OutlineColor = hlColor
                            radarHighlights[p].FillColor = hlColor
                        else
                            if radarHighlights[p] then radarHighlights[p]:Destroy(); radarHighlights[p] = nil end
                        end
                    else
                        if radarHighlights[p] then radarHighlights[p]:Destroy(); radarHighlights[p] = nil end
                    end
                end
            end
            
            for p, hl in pairs(radarHighlights) do
                if not p.Character or not p.Character:FindFirstChild("HumanoidRootPart") then
                    hl:Destroy()
                    radarHighlights[p] = nil
                end
            end
        end
        
        if killerNear and sheriffNear then
            updateSelfHighlight(true)
        elseif killerNear then
            updateSelfHighlight(true, Color3.fromRGB(255, 0, 0))
        elseif sheriffNear then
            updateSelfHighlight(true, Color3.fromRGB(0, 120, 255))
        else
            updateSelfHighlight(false)
        end
        
        updateRadarUI(killerNear, sheriffNear)
    end
end)

MainTab:Toggle({
    Title = "杀手靠近提示",
    Value = false,
    Callback = function(v)
        killerRadarEnabled = v
        if v then showNotify("杀手雷达", "已开启杀手靠近提示", false) end
    end
})

MainTab:Toggle({
    Title = "警长靠近提示",
    Value = false,
    Callback = function(v)
        sheriffRadarEnabled = v
        if v then showNotify("警长雷达", "已开启警长靠近提示", false) end
    end
})

MainTab:Slider({
    Title = "雷达检测距离",
    Value = {Min = 10, Max = 100, Default = 40},
    Step = 1,
    Callback = function(v) radarDistance = v end
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
        showNotify("极限闪避", reason, false)
    else
        showNotify("闪避失败", "周围全是墙或虚空", true)
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
            showNotify("防秒杀已开启", "杀手拿刀靠近时将自动瞬移", false)
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

local slashEnabled = false
local killAuraEnabled = false
local slashDelay = 0.15
local auraCooldown = 0.5
local lastTeleportTime = 0
local lobbyCenter = Vector3.new(603.0, 467.8, 37.0) 
local lobbyRadius = 250 
local originCFrame = nil 
local allowLobbyKill = false

local function getMyKnife()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("Knife") 
end

local function doSlash()
    local knife = getMyKnife()
    if not knife then return end
    
    local events = knife:FindFirstChild("Events")
    if events then
        local event = events:FindFirstChild("KnifeStabbed")
        if event then 
            pcall(function() event:FireServer() end) 
        end
    end
end

local function isInLobby(hrp)
    if not hrp then return true end
    if (hrp.Position - lobbyCenter).Magnitude <= lobbyRadius then
        return true
    end
    local parent = hrp.Parent
    while parent and parent ~= workspace do
        if string.lower(parent.Name):find("lobby") then
            return true
        end
        parent = parent.Parent
    end
    return false
end

local function getClosestPlayerHrp()
    local closest = nil
    local minDist = math.huge
    local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHrp then return nil end

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            local enemyHrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hum and hum.Health > 0 and enemyHrp then
                if allowLobbyKill or not isInLobby(enemyHrp) then
                    local dist = (myHrp.Position - enemyHrp.Position).Magnitude
                    if dist < minDist then
                        minDist = dist
                        closest = enemyHrp
                    end
                end
            end
        end
    end
    return closest
end

task.spawn(function()
    while true do
        task.wait(slashDelay)
        if slashEnabled then
            doSlash()
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if not killAuraEnabled then 
        originCFrame = nil
        return 
    end
    
    if not originCFrame then
        local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if myHrp then originCFrame = myHrp.CFrame end
    end

    if tick() - lastTeleportTime < auraCooldown then return end
    
    local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myHrp then return end

    local targetHrp = getClosestPlayerHrp()
    if targetHrp then
        myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 1, 0)
        lastTeleportTime = tick()
        doSlash() 
    else
        if not allowLobbyKill then
            if originCFrame and (myHrp.Position - originCFrame.Position).Magnitude > 5 then
                if not isInLobby(myHrp) then
                    myHrp.CFrame = originCFrame
                    lastTeleportTime = tick()
                    showNotify("杀戮光环", "无大厅以外的地方有其他玩家，已返回原地", false)
                end
            end
        end
    end
end)

MainTab:Toggle({
    Title = "自动刀人",
    Value = false,
    Callback = function(v)
        slashEnabled = v
        if v then
            showNotify("自动刀人", "已开启自动刀人", false)
        end
    end
})

MainTab:Slider({
    Title = "挥刀间隔",
    Value = {Min = 0.05, Max = 0.5, Default = 0.15},
    Step = 0.05,
    Callback = function(v) slashDelay = v end
})

MainTab:Toggle({
    Title = "杀戮光环",
    Value = false,
    Callback = function(v)
        killAuraEnabled = v
        if v then
            showNotify("杀戮光环开启", "准备杀戮！", false)
        else
            originCFrame = nil
        end
    end
})

MainTab:Toggle({
    Title = "包含大厅玩家",
    Value = false,
    Callback = function(v)
        allowLobbyKill = v
    end
})

MainTab:Slider({
    Title = "光环传送冷却",
    Value = {Min = 0.2, Max = 3, Default = 0.5},
    Step = 0.1,
    Callback = function(v) auraCooldown = v end
})

local AimTab = window:Tab({Title="自瞄", Icon="crosshair"})

local AimbotSettings = {
    Enabled = false,
    TargetPart = "Head",
    WallCheck = false,
    TeamCheck = false,
    CircleEnabled = false,
    CircleRadius = 100,
    CircleThickness = 2,
    CircleColor = "彩色"
}

local Colors = {
    ["红"] = Color3.fromRGB(255,0,0), ["橙"] = Color3.fromRGB(255,150,0), ["黄"] = Color3.fromRGB(255,255,15),
    ["绿"] = Color3.fromRGB(0,255,0), ["青"] = Color3.fromRGB(0,255,219), ["蓝"] = Color3.fromRGB(0,0,255),
    ["紫"] = Color3.fromRGB(183,0,255), ["彩色"] = nil,
}

local Circle = Drawing.new("Circle")
Circle.Filled = false
Circle.Visible = false

local function getCircleColor()
    if AimbotSettings.CircleColor ~= "彩色" and Colors[AimbotSettings.CircleColor] then
        return Colors[AimbotSettings.CircleColor]
    else
        return Color3.fromHSV((tick() % 5) / 5, 1, 1)
    end
end

RunService.RenderStepped:Connect(function()
    if AimbotSettings.CircleEnabled then
        Circle.Visible = true
        Circle.Position = workspace.CurrentCamera.ViewportSize / 2
        Circle.Radius = AimbotSettings.CircleRadius
        Circle.Thickness = AimbotSettings.CircleThickness
        Circle.Color = getCircleColor()
    else
        Circle.Visible = false
    end
end)

local function hasTool(p, toolName)
    if not p or not p.Character then return false end
    local backpack = p:FindFirstChild("Backpack") or p.Character:FindFirstChildOfClass("Backpack")
    return (backpack and backpack:FindFirstChild(toolName)) or p.Character:FindFirstChild(toolName) ~= nil
end

local function isValidTarget(player)
    if not player or player == LocalPlayer then return false end
    if not player.Character then return false end
    
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return false end

    if AimbotSettings.TeamCheck then
        local myHasKnife = hasTool(LocalPlayer, "Knife")
        local targetHasKnife = hasTool(player, "Knife")

        if myHasKnife then
            if targetHasKnife then return false end
        else
            if not targetHasKnife then return false end
        end
    end

    local part = player.Character:FindFirstChild(AimbotSettings.TargetPart)
    if not part then return false end
    
    if AimbotSettings.WallCheck or AimbotSettings.TeamCheck then
        local origin = workspace.CurrentCamera.CFrame.Position
        local dir = part.Position - origin
        
        local params = RaycastParams.new()
        params.FilterDescendantsInstances = { LocalPlayer.Character, player.Character }
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.IgnoreWater = true

        local result = workspace:Raycast(origin, dir, params)
        
        if result then
            local hitPart = result.Instance
            local hitPlayer = Players:GetPlayerFromCharacter(hitPart.Parent)

            if hitPlayer then
                if AimbotSettings.TeamCheck then
                    if hasTool(LocalPlayer, "Knife") and hasTool(hitPlayer, "Knife") then
                    else
                        return false
                    end
                end
            else
                if AimbotSettings.WallCheck then
                    return false
                end
            end
        end
    end
    return true
end

local function getClosestInCircle()
    local closest = nil
    local minDist = math.huge
    local center = workspace.CurrentCamera.ViewportSize / 2
    for _, p in pairs(Players:GetPlayers()) do
        if isValidTarget(p) then
            local head = p.Character:FindFirstChild(AimbotSettings.TargetPart)
            if head then
                local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local screenDist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                    if screenDist <= AimbotSettings.CircleRadius and screenDist < minDist then
                        minDist = screenDist
                        closest = p
                    end
                end
            end
        end
    end
    return closest
end

RunService.Heartbeat:Connect(function()
    if AimbotSettings.Enabled then
        local target = getClosestInCircle()
        if target then
            local part = target.Character:FindFirstChild(AimbotSettings.TargetPart)
            if part then
                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, part.Position)
            end
        end
    end
end)

local isSilentFireEnabled = false
local silentFireCooldown = 0.25
local lastSilentFireTime = 0

RunService.Heartbeat:Connect(function()
    if not isSilentFireEnabled then return end
    if tick() - lastSilentFireTime < silentFireCooldown then return end
    
    local char = LocalPlayer.Character
    local gun = char and char:FindFirstChild("Gun")
    if not gun or not gun:FindFirstChild("Shoot") then return end

    local camera = workspace.CurrentCamera
    local centerPos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    
    local closestTarget = nil
    local minDist = math.huge
    local targetPart = nil
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
            if hasTool(p, "Knife") then
                local head = p.Character.Head
                local screenPos, onScreen = camera:WorldToViewportPoint(head.Position)
                
                if onScreen and screenPos.Z > 0 then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - centerPos).Magnitude
                    
                    if dist <= 300 then
                        if AimbotSettings.TeamCheck then
                            local origin = camera.CFrame.Position
                            local dir = head.Position - origin
                            local raycastParams = RaycastParams.new()
                            raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                            raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, p.Character}
                            
                            local result = workspace:Raycast(origin, dir, raycastParams)
                            if not result then
                                if dist < minDist then
                                    minDist = dist
                                    closestTarget = p
                                    targetPart = head
                                end
                            end
                        else
                            if dist < minDist then
                                minDist = dist
                                closestTarget = p
                                targetPart = head
                            end
                        end
                    end
                end
            end
        end
    end
    
    if closestTarget and targetPart then
        local targetPos = targetPart.Position
        local fakeCamCFrame = CFrame.lookAt(camera.CFrame.Position, targetPos)
        local targetCFrame = CFrame.new(targetPos)
        
        pcall(function() gun:Activate() end)
        pcall(function() gun:Shoot:FireServer(fakeCamCFrame, targetCFrame) end)
        
        lastSilentFireTime = tick()
    end
end)

local isAutoThrowEnabled = false
local throwCooldown = 2.0 
local lastThrowTime = 0

task.spawn(function()
    while task.wait(0.1) do
        if isAutoThrowEnabled and tick() - lastThrowTime >= throwCooldown then
            local char = LocalPlayer.Character
            local knife = char and char:FindFirstChild("Knife")
            local knifeEvent = knife and knife:FindFirstChild("Events") and knife.Events:FindFirstChild("KnifeThrown")
            
            if knifeEvent then
                local closestTarget = nil
                local minDist = math.huge
                
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                        local bp = p:FindFirstChild("Backpack") or p.Character:FindFirstChildOfClass("Backpack")
                        local hasKnife = (bp and bp:FindFirstChild("Knife")) or p.Character:FindFirstChild("Knife") ~= nil
                        
                        if not hasKnife then
                            local dist = (char.Head.Position - p.Character.Head.Position).Magnitude
                            if dist < minDist then
                                minDist = dist
                                closestTarget = p
                            end
                        end
                    end
                end
                
                if closestTarget then
                    local targetPos = closestTarget.Character.Head.Position
                    local camera = workspace.CurrentCamera
                    local originalCFrame = camera.CFrame
                    local aimCFrame = CFrame.lookAt(camera.CFrame.Position, targetPos)
                    
                    camera.CFrame = aimCFrame
                    task.wait(0.05)
                    
                    local startCFrame = camera.CFrame
                    local targetCFrame = CFrame.new(targetPos)
                    
                    pcall(function()
                        knifeEvent:FireServer(startCFrame, targetCFrame)
                    end)
                    
                    camera.CFrame = originalCFrame
                    lastThrowTime = tick()
                end
            end
        end
    end
end)

AimTab:Toggle({ Title = "开启自瞄", Value = false, Callback = function(s) AimbotSettings.Enabled = s end })
AimTab:Toggle({ Title = "警长自动开枪", Value = false, Callback = function(s) isSilentFireEnabled = s end })
AimTab:Toggle({ Title = "杀手自动飞刀", Value = false, Callback = function(s) isAutoThrowEnabled = s end })
AimTab:Toggle({ Title = "队伍检测", Value = false, Callback = function(s) AimbotSettings.TeamCheck = s end })
AimTab:Toggle({ Title = "自瞄圆圈", Value = false, Callback = function(s) AimbotSettings.CircleEnabled = s end })
AimTab:Dropdown({ Title = "瞄准部位", Values = { "Head", "HumanoidRootPart" }, Value = "Head", Callback = function(v) AimbotSettings.TargetPart = v end })
AimTab:Toggle({ Title = "墙体检测", Value = false, Callback = function(s) AimbotSettings.WallCheck = s end })
AimTab:Slider({ Title = "圆圈大小", Value = { Min = 30, Max = 500, Default = 100 }, Callback = function(v) AimbotSettings.CircleRadius = v end })
AimTab:Slider({ Title = "圆圈厚度", Value = { Min = 1, Max = 10, Default = 2 }, Callback = function(v) AimbotSettings.CircleThickness = v end })
AimTab:Dropdown({ Title = "圆圈颜色", Values = { "红", "橙", "黄", "绿", "青", "蓝", "紫", "彩色" }, Value = "彩色", Callback = function(v) AimbotSettings.CircleColor = v end })

local TransTab=window:Tab({Title="传送",Icon="send"})

local selectedPlayer=nil

local function getPlayerNames()
    local names={}
    for _,p in ipairs(game:GetService("Players"):GetPlayers()) do
        if p~=game.Players.LocalPlayer then
            table.insert(names,p.Name)
        end
    end
    if #names==0 then
        table.insert(names,"无其他玩家")
    end
    return names
end

local playerDropdown=TransTab:Dropdown({Title="选择玩家",Values=getPlayerNames(),Value="无其他玩家",Callback=function(v)selectedPlayer=v end})

TransTab:Button({Title="刷新列表",Callback=function()
    local newNames=getPlayerNames()
    playerDropdown:Refresh(newNames)
    selectedPlayer=nil
    showNotify("已刷新", "玩家列表已更新，请重新选择玩家", false)
end})

TransTab:Button({Title="传送",Callback=function()
    if not selectedPlayer or selectedPlayer=="无其他玩家" then
        showNotify("错误", "请先选择一名玩家", true)
        return
    end
    local target=game:GetService("Players"):FindFirstChild(selectedPlayer)
    if not target or not target.Character then
        showNotify("错误", "目标玩家不存在或没有角色", true)
        return
    end
    local targetRoot=target.Character:FindFirstChild("HumanoidRootPart")
    if not targetRoot then
        showNotify("错误", "目标玩家没有HumanoidRootPart", true)
        return
    end
    local localChar=game.Players.LocalPlayer.Character
    if not localChar then
        showNotify("错误", "你没有角色", true)
        return
    end
    local localRoot=localChar:FindFirstChild("HumanoidRootPart")
    if not localRoot then
        showNotify("错误", "你没有HumanoidRootPart", true)
        return
    end
    localRoot.CFrame=targetRoot.CFrame*CFrame.new(0,0,3)
    showNotify("传送成功", "已传送到 "..selectedPlayer.." 旁边", false)
end})

TransTab:Button({
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
            showNotify("传送成功", "已传送到警长附近", false)
        else
            showNotify("未找到警长", "当前没有玩家拿到枪", true)
        end
    end
})

TransTab:Button({
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
            showNotify("传送成功", "已传送到杀手附近", false)
        else
            showNotify("未找到杀手", "当前没有玩家拿到刀", true)
        end
    end
})

TransTab:Button({
    Title = "传送到掉落枪械旁边",
    Callback = function()
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local closestDrop = nil
        local minDist = math.huge
        
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj.Name == "GunDrop" and obj:FindFirstChild("Fire") then
                local pos = nil
                if obj:IsA("BasePart") then
                    pos = obj.Position
                elseif obj:IsA("Model") then
                    local _, size = obj:GetBoundingBox()
                    pos = obj:GetBoundingBox().Position
                end
                
                if pos then
                    local dist = (hrp.Position - pos).Magnitude
                    if dist < minDist then
                        minDist = dist
                        closestDrop = obj
                    end
                end
            end
        end
        
        if not closestDrop then
            showNotify("未找到", "全图没有掉落的枪械", true)
            return
        end
        
        local targetPart = nil
        if closestDrop:IsA("BasePart") then
            targetPart = closestDrop
        else
            targetPart = closestDrop.PrimaryPart or closestDrop:FindFirstChildWhichIsA("BasePart")
        end
        
        if targetPart then
            local safeCFrame = findSafePosition(targetPart, 4)
            hrp.CFrame = safeCFrame
            showNotify("传送成功", "已传送到掉落枪械旁边", false)
        else
            showNotify("传送失败", "找到了枪械但无法获取其位置", true)
        end
    end
})

TransTab:Button({
    Title = "传送到大厅",
    Callback = function()
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local distToLobby = (hrp.Position - Vector3.new(603.0, 467.8, 37.0)).Magnitude
            if distToLobby > 100 then
                _G.lastGameCFrame = hrp.CFrame
                showNotify("已记录坐标", "随时可返回游戏原位置", false)
            end
            hrp.CFrame = CFrame.new(603.0, 467.8, 37.0)
        end
    end
})

TransTab:Button({
    Title = "返回前往大厅前的位置",
    Callback = function()
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            if _G.lastGameCFrame then
                hrp.CFrame = _G.lastGameCFrame
                showNotify("传送成功", "已返回游戏原位置", false)
            else
                showNotify("无法返回", "你还没记录过坐标", true)
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
                    textObj.Text = player.Name .. " | " .. distance .. " m"
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

local GunDropESPGroup = P:Section({Title = "透视掉落枪械", Opened = true})
local gunDropSettings = {
    esp = false,
    outline = false,
    tracer = false,
    espColor = Color3.fromRGB(0, 255, 0), 
    outlineColor = Color3.fromRGB(0, 255, 0), 
    tracerColor = Color3.fromRGB(0, 255, 0) 
}
local gunDropHighlighted = {} 
local gunDropRenderConn = nil

local function clearGunDropESP()
    for _, data in pairs(gunDropHighlighted) do
        if data.Highlight then pcall(function() data.Highlight:Destroy() end) end
        if data.Text then pcall(function() data.Text:Remove() end) end
        if data.Line then pcall(function() data.Line:Remove() end) end
    end
    gunDropHighlighted = {}
    if gunDropRenderConn then
        gunDropRenderConn:Disconnect()
        gunDropRenderConn = nil
    end
end

local function scanGunDrops()
    if not (gunDropSettings.esp or gunDropSettings.outline or gunDropSettings.tracer) then return end
    
    
    for visual, data in pairs(gunDropHighlighted) do
        if not visual or not visual.Parent then
            if data.Highlight then pcall(function() data.Highlight:Destroy() end) end
            if data.Text then pcall(function() data.Text:Remove() end) end
            if data.Line then pcall(function() data.Line:Remove() end) end
            gunDropHighlighted[visual] = nil
        end
    end

    
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "GunDrop" then
            if not gunDropHighlighted[obj] then
                
                if obj:FindFirstChild("Fire") then
                    local data = {}
                    data.Visual = obj
                    
                    
                    local target = nil
                    if obj:IsA("BasePart") then
                        target = obj
                    else
                        target = obj:FindFirstAncestorWhichIsA("BasePart") or obj:FindFirstChildWhichIsA("BasePart") or obj
                    end
                    
                    if target then
                        local hl = Instance.new("Highlight")
                        hl.Adornee = target
                        hl.FillTransparency = 1 
                        hl.OutlineColor = gunDropSettings.outlineColor
                        hl.OutlineTransparency = 0
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop 
                        hl.Parent = target
                        hl.Enabled = gunDropSettings.outline
                        data.Highlight = hl
                    end

                    if Drawing then
                        local text = Drawing.new("Text")
                        text.Size = 16
                        text.Center = true
                        text.Outline = true
                        text.Font = 2
                        text.Color = gunDropSettings.espColor
                        text.Visible = false
                        data.Text = text

                        local line = Drawing.new("Line")
                        line.Thickness = 2
                        line.Transparency = 1
                        line.Color = gunDropSettings.tracerColor
                        line.Visible = false
                        data.Line = line
                    end
                    
                    gunDropHighlighted[obj] = data
                end
            end
        end
    end
end

local function updateGunDropVisuals()
    if not (gunDropSettings.esp or gunDropSettings.outline or gunDropSettings.tracer) then return end
    local camera = workspace.CurrentCamera
    if not camera then return end
    local screenHeight = camera.ViewportSize.Y

    for visual, data in pairs(gunDropHighlighted) do
        if visual and visual.Parent then
            if data.Highlight then
                data.Highlight.Enabled = gunDropSettings.outline
                data.Highlight.OutlineColor = gunDropSettings.outlineColor
            end

            local pos3D
            if visual:IsA("BasePart") then
                pos3D = visual.Position
            elseif visual:IsA("Model") then
                local _, size = visual:GetBoundingBox()
                pos3D = visual:GetBoundingBox().Position
            else
                local ancestorPart = visual:FindFirstAncestorWhichIsA("BasePart")
                if ancestorPart then
                    pos3D = ancestorPart.Position
                elseif visual.Parent and visual.Parent:IsA("BasePart") then
                    pos3D = visual.Parent.Position
                end
            end

            if pos3D then
                local pos, onScreen = camera:WorldToViewportPoint(pos3D)
                local distance = math.floor((camera.CFrame.Position - pos3D).Magnitude)
                
                if onScreen and pos.Z > 0 then
                    if data.Text then
                        data.Text.Position = Vector2.new(pos.X, pos.Y - 20)
                        data.Text.Text = "GunDrop | " .. distance .. "m"
                        data.Text.Color = gunDropSettings.espColor
                        data.Text.Visible = gunDropSettings.esp
                    end
                    if data.Line then
                        data.Line.From = Vector2.new(camera.ViewportSize.X / 2, screenHeight)
                        data.Line.To = Vector2.new(pos.X, pos.Y)
                        data.Line.Color = gunDropSettings.tracerColor
                        data.Line.Visible = gunDropSettings.tracer
                    end
                else
                    if data.Text then data.Text.Visible = false end
                    if data.Line then data.Line.Visible = false end
                end
            end
        end
    end
end

local function updateGunDropState()
    local anyEnabled = gunDropSettings.esp or gunDropSettings.outline or gunDropSettings.tracer
    if anyEnabled then
        if not gunDropRenderConn then
            gunDropRenderConn = RunService.RenderStepped:Connect(updateGunDropVisuals)
            task.spawn(function()
                while gunDropRenderConn do
                    task.wait(1)
                    if gunDropSettings.esp or gunDropSettings.outline or gunDropSettings.tracer then
                        scanGunDrops()
                    else
                        break
                    end
                end
            end)
        end
        scanGunDrops()
    else
        clearGunDropESP()
    end
end

GunDropESPGroup:Toggle({Title = "透视掉落枪械", Value = false, Callback = function(v) gunDropSettings.esp = v; updateGunDropState() end})
GunDropESPGroup:Colorpicker({Title = "透视掉落枪械颜色", Default = Color3.fromRGB(0, 255, 0), Callback = function(v) gunDropSettings.espColor = v end})
GunDropESPGroup:Toggle({Title = "掉落枪械轮廓", Value = false, Callback = function(v) gunDropSettings.outline = v; updateGunDropState() end})
GunDropESPGroup:Colorpicker({Title = "掉落枪械轮廓颜色", Default = Color3.fromRGB(0, 255, 0), Callback = function(v) gunDropSettings.outlineColor = v end})
GunDropESPGroup:Toggle({Title = "掉落枪械追踪线", Value = false, Callback = function(v) gunDropSettings.tracer = v; updateGunDropState() end})
GunDropESPGroup:Colorpicker({Title = "掉落枪械追踪线颜色", Default = Color3.fromRGB(0, 255, 0), Callback = function(v) gunDropSettings.tracerColor = v end})

print("[ink_HUB] 加载成功")