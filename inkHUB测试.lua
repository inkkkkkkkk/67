local function safeNotify(title,text,duration)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title=title,
            Text=text,
            Duration=duration or 3
        })
    end)
end

local function safeHttpGet(url)
    local ok,res=pcall(function()
        return game:HttpGet(url)
    end)
    if ok then return res end
    return nil
end

local tasklib=task or {}
if not tasklib.wait then
    tasklib.wait=function(t)
        wait(t)
    end
end
if not tasklib.spawn then
    tasklib.spawn=function(f)
        coroutine.wrap(f)()
    end
end
task=tasklib

local A=game:GetService("StarterGui")

local finishStartup = nil
local updateStartupProgress = nil

do
    local startupGui
    local startupProgress = 0
    local startupFinished = false

    local function createStartupAnimation()
        local ok, result = pcall(function()
            local Players = game:GetService("Players")
            local TweenService = game:GetService("TweenService")
            local CoreGui = game:GetService("CoreGui")

            local old = CoreGui:FindFirstChild("ink_HUB_StartupAnimation")
            if old then old:Destroy() end

            startupGui = Instance.new("ScreenGui")
            startupGui.Name = "ink_HUB_StartupAnimation"
            startupGui.IgnoreGuiInset = true
            startupGui.ResetOnSpawn = false
            startupGui.DisplayOrder = 2147483647
            startupGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
            startupGui.Parent = CoreGui

            local bg = Instance.new("Frame")
            bg.Size = UDim2.fromScale(1,1)
            bg.BackgroundColor3 = Color3.fromRGB(10,10,10)
            bg.BorderSizePixel = 0
            bg.Parent = startupGui

            local center = Instance.new("Frame")
            center.AnchorPoint = Vector2.new(0.5,0.5)
            center.Position = UDim2.fromScale(0.5,0.45)
            center.Size = UDim2.fromOffset(220,220)
            center.BackgroundTransparency = 1
            center.Parent = bg

            local image = Instance.new("ImageLabel")
            image.Name = "Logo"
            image.AnchorPoint = Vector2.new(0.5,0.5)
            image.Position = UDim2.fromScale(0.5,0.5)
            image.Size = UDim2.fromOffset(140,140)
            image.BackgroundTransparency = 1
            image.Image = "rbxassetid://131444442444524"
            image.ScaleType = Enum.ScaleType.Fit
            image.Parent = center

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0,14)
            corner.Parent = image

            local stroke = Instance.new("UIStroke")
            stroke.Thickness = 2
            stroke.Transparency = 0.1
            stroke.Color = Color3.fromRGB(155,155,155)
            stroke.Parent = image

            local title = Instance.new("TextLabel")
            title.AnchorPoint = Vector2.new(0.5,0)
            title.Position = UDim2.new(0.5,0,1,18)
            title.Size = UDim2.fromOffset(380,42)
            title.BackgroundTransparency = 1
            title.Text = "Project_ink_HUB_2026!"
            title.TextColor3 = Color3.fromRGB(220,220,220)
            title.TextSize = 32
            title.Font = Enum.Font.GothamBold
            title.Parent = center

            local status = Instance.new("TextLabel")
            status.AnchorPoint = Vector2.new(0.5,0)
            status.Position = UDim2.new(0.5,0,1,55)
            status.Size = UDim2.fromOffset(420,30)
            status.BackgroundTransparency = 1
            status.Text = "正在启动..."
            status.TextColor3 = Color3.fromRGB(155,155,155)
            status.TextSize = 16
            status.Font = Enum.Font.Gotham
            status.Parent = center

            local barBack = Instance.new("Frame")
            barBack.AnchorPoint = Vector2.new(0.5,0)
            barBack.Position = UDim2.new(0.5,0,1,88)
            barBack.Size = UDim2.fromOffset(340,7)
            barBack.BackgroundColor3 = Color3.fromRGB(45,45,45)
            barBack.BorderSizePixel = 0
            barBack.Parent = center

            local barCorner = Instance.new("UICorner")
            barCorner.CornerRadius = UDim.new(1,0)
            barCorner.Parent = barBack

            local bar = Instance.new("Frame")
            bar.Size = UDim2.new(0,0,1,0)
            bar.BackgroundColor3 = Color3.fromRGB(175,175,175)
            bar.BorderSizePixel = 0
            bar.Parent = barBack

            local barFillCorner = Instance.new("UICorner")
            barFillCorner.CornerRadius = UDim.new(1,0)
            barFillCorner.Parent = bar

            task.spawn(function()
                while startupGui and startupGui.Parent and not startupFinished do
                    local ring = Instance.new("Frame")
                    ring.AnchorPoint = Vector2.new(0.5,0.5)
                    ring.Position = UDim2.fromScale(0.5,0.5)
                    ring.Size = UDim2.fromOffset(140,140)
                    ring.BackgroundTransparency = 1
                    ring.Parent = center

                    local ringStroke = Instance.new("UIStroke")
                    ringStroke.Thickness = 2
                    ringStroke.Transparency = 0.25
                    ringStroke.Color = Color3.fromRGB(145,145,145)
                    ringStroke.Parent = ring

                    local ringCorner = Instance.new("UICorner")
                    ringCorner.CornerRadius = UDim.new(1,0)
                    ringCorner.Parent = ring

                    local tween = TweenService:Create(ring,TweenInfo.new(1.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
                        Size = UDim2.fromOffset(420,420)
                    })
                    local fade = TweenService:Create(ringStroke,TweenInfo.new(1.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
                        Transparency = 1
                    })
                    tween:Play()
                    fade:Play()
                    task.delay(1.25,function()
                        if ring then ring:Destroy() end
                    end)
                    task.wait(0.38)
                end
            end)

            task.spawn(function()
                while startupGui and startupGui.Parent and not startupFinished do
                    TweenService:Create(image,TweenInfo.new(0.65,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{
                        Size = UDim2.fromOffset(150,150)
                    }):Play()
                    task.wait(0.65)
                    if not (startupGui and startupGui.Parent and not startupFinished) then break end
                    TweenService:Create(image,TweenInfo.new(0.65,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{
                        Size = UDim2.fromOffset(140,140)
                    }):Play()
                    task.wait(0.65)
                end
            end)

            updateStartupProgress = function(value,textValue)
                if startupFinished or not startupGui or not startupGui.Parent then return end
                startupProgress = math.clamp(tonumber(value) or 0,0,100)
                status.Text = textValue or "正在启动..."
                TweenService:Create(bar,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
                    Size = UDim2.new(startupProgress/100,0,1,0)
                }):Play()
            end

            finishStartup = function()
                if startupFinished then return end
                startupFinished = true
                if not startupGui or not startupGui.Parent then return end

                updateStartupProgress(100,"加载完成")
                task.wait(0.35)

                local fadeObjects = {}
                for _,obj in ipairs(startupGui:GetDescendants()) do
                    if obj:IsA("GuiObject") then
                        table.insert(fadeObjects,obj)
                    end
                end
                for _,obj in ipairs(fadeObjects) do
                    pcall(function()
                        if obj:IsA("TextLabel") then
                            TweenService:Create(obj,TweenInfo.new(0.35),{TextTransparency=1}):Play()
                        elseif obj:IsA("ImageLabel") then
                            TweenService:Create(obj,TweenInfo.new(0.35),{ImageTransparency=1}):Play()
                        elseif obj:IsA("Frame") then
                            TweenService:Create(obj,TweenInfo.new(0.35),{BackgroundTransparency=1}):Play()
                        end
                    end)
                end
                task.wait(0.4)
                if startupGui then startupGui:Destroy() end
            end

            updateStartupProgress(15,"正在初始化...")
            return true
        end)
        if not ok then
            startupGui = nil
            finishStartup = nil
            updateStartupProgress = nil
        end
        return result
    end

    createStartupAnimation()
end

local ok,err=xpcall(function()

local function gradient(text,startColor,endColor)
    local result=""
    local chars={}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do table.insert(chars,uchar) end
    local length=#chars
    for i=1,length do
        local t=(i-1)/math.max(length-1,1)
        local r=startColor.R+(endColor.R-startColor.R)*t
        local g=startColor.G+(endColor.G-startColor.G)*t
        local b=startColor.B+(endColor.B-startColor.B)*t
        result=result..string.format('<font color="rgb(%d,%d,%d)">%s</font>',math.floor(r*255),math.floor(g*255),math.floor(b*255),chars[i])
    end
    return result
end

local B = nil
local winduiLastError = "未知错误"

local ok, result = pcall(function()
    local code = game:HttpGet(
        "https://github.com/Footagesus/WindUI/releases/download/1.6.66/main.lua",
        true
    )
    if type(code) ~= "string" or #code < 100 then
        error("WindUI下载内容为空")
    end

    local loader = loadstring(code)
    if type(loader) ~= "function" then
        error("WindUI loadstring失败")
    end

    return loader()
end)

if ok and result then
    B = result
else
    winduiLastError = tostring(result)
end

if updateStartupProgress then updateStartupProgress(65,"正在加载界面...") end

if not B then
    pcall(function()
        A:SetCore("SendNotification",{Title="WindUI加载失败",Text="请检查Delta网络/HttpGet支持",Duration=5})
    end)
    warn("[ink_HUB] WindUI加载失败:", winduiLastError)
    error("WindUI加载失败: " .. tostring(winduiLastError))
end

pcall(function()
    B:AddTheme({
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

if updateStartupProgress then updateStartupProgress(82,"正在创建界面...") end

local C
local windowOk, windowResult = pcall(function()
    return B:CreateWindow({
        Title = gradient("ink_HUB",Color3.fromRGB(180,180,180),Color3.fromRGB(100,100,100)),
        Author = gradient("@墨水依旧 司空",Color3.fromRGB(180,180,180),Color3.fromRGB(100,100,100)),
        Icon = "rbxassetid://71953031400395",
        Folder = "ink_HUB",
        NewElements = true,
        HideSearchBar = false,
        Theme = "inkGray",
    })
end)

if not windowOk or not windowResult then
    winduiLastError = tostring(windowResult)
    pcall(function()
        A:SetCore("SendNotification",{
            Title="UI创建失败",
            Text="CreateWindow失败，请查看执行器报错信息",
            Duration=6
        })
    end)
    warn("[ink_HUB] CreateWindow失败:", winduiLastError)
    return
end

C = windowResult

pcall(function()
    C:Tag({ Title = "永久免费", Radius = 5, Color = Color3.fromHex("#555555") })
    C:Tag({ Title = "2026", Radius = 6, Color = Color3.fromHex("#B0B0B0") })
end)

pcall(function()
    C:EditOpenButton({
        Title = "Project_ink_HUB_2026!",
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
    local RunService = game:GetService("RunService")
    local targetWindow = C.UIElements and C.UIElements.Main

    if not targetWindow then
        local CoreGui = game:GetService("CoreGui")
        for _, obj in ipairs(CoreGui:GetDescendants()) do
            if obj:IsA("Frame") and obj.AbsoluteSize.X > 300 and obj.AbsoluteSize.Y > 150 then
                local title = obj:FindFirstChildWhichIsA("TextLabel", true)
                if title and title.Text == "ink_HUB" then
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
                if obj.Text == "ink_HUB" then
                    obj.TextColor3 = Color3.fromRGB(155,155,155)
                elseif obj.Text == "@墨水依旧 司空" then
                    obj.TextColor3 = Color3.fromRGB(125,125,125)
                end
            end
        end
    end
    recolor(CoreGui)
    task.delay(0.25, function() pcall(function() recolor(CoreGui) end) end)
    task.delay(0.8, function() pcall(function() recolor(CoreGui) end) end)
end)

local D=C

local Z = D:Tab({Title="公告", Icon="bell"})
Z:Paragraph({
    Title = "欢迎使用 ink_HUB",
    Desc = "作者：墨水依旧和司空\n墨水快手号:zczczczc766\n司空快手号:smalldesikon111和smalldesikon\n开源并公开的4000+\n没惹你就开源的自动给我30年寿命\n公益脚本禁止倒卖\n认准 ink_HUB",
    Image = "rbxassetid://131444442444524",
    ImageSize = 100,
})

local player = game.Players.LocalPlayer

Z:Paragraph({
    Title = "系统信息",
    Desc = string.format("用户名: %s\n显示名: %s\n用户ID: %d\n账号年龄: %d天",
        player.Name, player.DisplayName, player.UserId, player.AccountAge),
    Image = "rbxassetid://131444442444524",
    ImageSize = 100,
})

Z:Button({Title="复制作者QQ", Callback=function() setclipboard("2047955671") A:SetCore("SendNotification",{Title="已复制", Text="作者QQ：2047955671", Duration=2}) end})
Z:Button({Title="复制作者QQ群", Callback=function() setclipboard("1101093219") A:SetCore("SendNotification",{Title="已复制", Text="作者QQ群：1101093219", Duration=2}) end})
Z:Button({Title="复制作者副群", Callback=function() setclipboard("1063828524") A:SetCore("SendNotification",{Title="已复制", Text="作者副群：1063828524", Duration=2}) end})

local E=D:Tab({Title="通用",Icon="settings"})

local LocalPlayer=game.Players.LocalPlayer
local speedEnabled=false
local jumpEnabled=false
local speedValue=16
local jumpValue=50

E:Toggle({Title="启用修改速度",Value=false,Callback=function(s)
    speedEnabled=s
    local char=LocalPlayer.Character
    if char then
        local hum=char:FindFirstChildOfClass("Humanoid")
        if hum then
            if s then hum.WalkSpeed=speedValue else hum.WalkSpeed=16 end
        end
    end
end})

E:Slider({Title="修改速度",Value={Min=16,Max=100,Default=16},Callback=function(v)
    speedValue=v
    if speedEnabled then
        local char=LocalPlayer.Character
        if char then
            local hum=char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed=v end
        end
    end
end})

E:Toggle({Title="启用修改跳跃高度",Value=false,Callback=function(s)
    jumpEnabled=s
    local char=LocalPlayer.Character
    if char then
        local hum=char:FindFirstChildOfClass("Humanoid")
        if hum then
            if s then hum.JumpPower=jumpValue else hum.JumpPower=50 end
        end
    end
end})

E:Slider({Title="修改跳跃高度",Value={Min=20,Max=200,Default=50},Callback=function(v)
    jumpValue=v
    if jumpEnabled then
        local char=LocalPlayer.Character
        if char then
            local hum=char:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower=v end
        end
    end
end})

E:Toggle({Title="启用设置重力",Value=false,Callback=function(s)
    gravityEnabled=s
    if s then
        workspace.Gravity=gravityValue
    else
        workspace.Gravity=196.2
    end
end})

E:Slider({Title="设置重力",Value={Min=0,Max=500,Default=196.2},Step=1,Callback=function(v)
    gravityValue=v
    if gravityEnabled then
        workspace.Gravity=v
    end
end})

E:Slider({
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

E:Toggle({
    Title = "X光",
    Value = false,
    Callback = function(v)
        xrayenabled = v
        if v then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not obj:IsDescendantOf(game.Players.LocalPlayer.Character) then
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

E:Slider({
    Title = "X光透明度",
    Value = { Min = 0, Max = 100, Default = 60 },
    Step = 1,
    Callback = function(v)
        xraytransparency = v / 100
        if xrayenabled then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and not obj:IsDescendantOf(game.Players.LocalPlayer.Character) and originaltransparencies[obj] then
                    obj.Transparency = v / 100
                end
            end
        end
    end
})

E:Button({Title="飞行",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/inkkkkkkkk/Theinkremains/refs/heads/main/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%AC.lua"))()end})

E:Button({Title="飞车",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/inkkkkkkkk/Theinkremains/refs/heads/main/%E9%A3%9E%E8%BD%A6.lua"))()end})

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.1)
    local hum=char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed=speedEnabled and speedValue or 16
        hum.JumpPower=jumpEnabled and jumpValue or 50
        if rotationEnabled then
            task.wait(0.1)
            startRotation()
        end
    end
end)

local noclipEnabled=false
local function applyNoClip(s)
    local char=game.Players.LocalPlayer.Character
    if not char then return end
    for _,part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide=not s
        end
    end
end
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if noclipEnabled then
        task.wait(0.1)
        applyNoClip(true)
    end
end)
E:Toggle({Title="穿墙",Value=false,Callback=function(s)noclipEnabled=s applyNoClip(s)end})

local infJumpEnabled = false
local infJumpConnection = nil

E:Toggle({
    Title = "无限跳",
    Value = false,
    Callback = function(v)
        infJumpEnabled = v
        if v then
            infJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:ChangeState("Jumping")
                    end
                end
            end)
        else
            if infJumpConnection then
                infJumpConnection:Disconnect()
                infJumpConnection = nil
            end
        end
    end
})

local Lighting=game:GetService("Lighting")
local origBright=Lighting.Brightness
E:Toggle({Title="高亮",Value=false,Callback=function(s)
    if s then
        Lighting.Brightness=5
        Lighting.Ambient=Color3.new(1,1,1)
        Lighting.OutdoorAmbient=Color3.new(1,1,1)
    else
        Lighting.Brightness=origBright        Lighting.Ambient=Color3.new(0.5,0.5,0.5)        Lighting.OutdoorAmbient=Color3.new(0.5,0.5,0.5)
    end
end})

local originallighting = {
    FogEnd = game.Lighting.FogEnd,
    FogStart = game.Lighting.FogStart
}
E:Toggle({
    Title = "无雾",
    Value = false,
    Callback = function(v)
        if v then
            game.Lighting.FogEnd = 100000
            game.Lighting.FogStart = 0
        else
            game.Lighting.FogEnd = originallighting.FogEnd
            game.Lighting.FogStart = originallighting.FogStart
        end
    end
})

E:Button({
    Title = "防甩飞",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Linux6699/DaHubRevival/main/AntiFling.lua"))()
    end
})

E:Button({
    Title = "防止摔落伤害",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zczczczc766/ink/refs/heads/main/%E9%98%B2%E6%AD%A2%E6%91%94%E8%90%BD%E4%BC%A4%E5%AE%B3.lua"))()
    end
})

local function forceChatVisible()
    local player=game.Players.LocalPlayer
    local StarterGui=game:GetService("StarterGui")
    local CoreGui=game:GetService("CoreGui")
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat,true)
    local chatFrame=player.PlayerGui:FindFirstChild("Chat")
    if not chatFrame then chatFrame=CoreGui:FindFirstChild("Chat") end
    if chatFrame and chatFrame:IsA("Frame") then
        chatFrame.Visible=true
        chatFrame.Position=UDim2.new(0,0,0.5,0)
        chatFrame.Size=UDim2.new(0.3,0,0.4,0)
        chatFrame.BackgroundTransparency=0.5
        local function forceVisible(obj)
            if obj:IsA("Frame") or obj:IsA("ScrollingFrame") or obj:IsA("TextBox") or obj:IsA("TextLabel") or obj:IsA("ImageLabel") then
                obj.Visible=true
                obj.Position=UDim2.new(0,0,0,0)
                obj.Size=UDim2.new(1,0,1,0)
                obj.BackgroundTransparency=0.3
                obj.TextTransparency=0
                obj.TextColor3=Color3.new(1,1,1)
            end
            for _,child in ipairs(obj:GetChildren()) do forceVisible(child) end
        end
        forceVisible(chatFrame)
    end
    local textChat=game:GetService("TextChatService")
    if textChat then
        pcall(function()
            textChat.ChatWindowConfiguration.Enabled=true
            textChat.ChatInputBarConfiguration.Enabled=true
        end)
        local chatWindows=CoreGui:FindFirstChild("ChatWindow")
        if chatWindows then chatWindows.Visible=true end
    end
end

E:Button({Title="强制显示聊天框",Callback=function()forceChatVisible()end})

E:Button({Title="电脑端物品栏",Callback=function()
    local src = game:HttpGet("http://raw.githubusercontent.com/ltseverydayyou/uuuuuuu/refs/heads/main/mobileBACKPACK.lua")
    src = src:gsub("HOTBAR_SLOTS_MINI: number = 6", "HOTBAR_SLOTS_MINI: number = 10")
    loadstring(src)()
end})

E:Button({Title = "祖国人",Callback = function()loadstring(game:HttpGet("https://raw.githubusercontent.com/giobolqv1/homelander-by-GioBolqv1-/main/homelander.lua"))()end})

E:Button({Title="无敌少侠飞行",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/MobileFly.lua"))()end})

E:Button({Title="无敌少侠大全",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/giobolqv1/invincible-characters-animations-by-GioBolqv1-/refs/heads/main/universal.lua"))()end})

E:Button({Title="走路撞人",Callback=function()loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt'),true))()end})

E:Button({Title="铁拳打人",Callback=function()loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'),true))()end})

E:Button({Title="甩飞攻击",Callback=function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-THE-REAL-dropkick-177199"))()
end})

local P = D:Tab({Title="透视", Icon="eye"})

local espEnabled = false
local outlineEnabled = false
local tracersEnabled = false
local espconfig = {
    espcolor = Color3.fromRGB(255, 255, 255),
    outlinecolor = Color3.fromRGB(255, 255, 255),
    outlinefillcolor = Color3.fromRGB(255, 255, 255),
    tracercolor = Color3.fromRGB(255, 255, 255),
    espsize = 16,
    tracersize = 2,
    outlinetransparency = 0,
    outlinefilltransparency = 1,
    rainbowesp = false,
    rainbowoutline = false,
    rainbowtracers = false,
    rainbowspeed = 5,
    tracerposition = "Bottom",
    teamcheck = false,
    teamcolor = Color3.fromRGB(255, 0, 0)
}
local rainbowhue = 0
local lastupdate = 0
local espobjects = {}
local playerconnections = {}
local tracerlines = {}
local activehighlights = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function getrainbowcolor()
    local currenttime = tick()
    local speedmultiplier = 11 - espconfig.rainbowspeed
    local increment = 0.001 * speedmultiplier
    if currenttime - lastupdate >= 0.1 then
        rainbowhue = (rainbowhue + increment) % 1
        lastupdate = currenttime
    end
    return Color3.fromHSV(rainbowhue, 1, 1)
end

local function getESPColor(player, normalColor, rainbowEnabled)
    if espconfig.teamcheck and player and player:IsA("Player") and player ~= LocalPlayer then
        if player.Team ~= LocalPlayer.Team then
            return espconfig.teamcolor
        end
    end
    return rainbowEnabled and getrainbowcolor() or normalColor
end

local function getPlayerWeapon(player)
    if not player.Character then return "无" end
    local tool = player.Character:FindFirstChildWhichIsA("Tool")
    if tool then return tool.Name end
    return "无"
end

local function createesp(player)
    if player == LocalPlayer or espobjects[player] then return end
    local nametext = Drawing.new("Text")
    nametext.Size = espconfig.espsize
    nametext.Center = true
    nametext.Outline = true
    nametext.Color = espconfig.espcolor
    nametext.Font = 2
    nametext.Visible = false
    espobjects[player] = { Name = nametext }
end

local function removeesp(player)
    if espobjects[player] then
        espobjects[player].Name:Remove()
        espobjects[player] = nil
    end
end

local function applyhighlighttocharacter(player, character)
    if not character then return end
    local userid = player.UserId
    if activehighlights[userid] then
        activehighlights[userid]:Destroy()
        activehighlights[userid] = nil
    end
    local highlighter = Instance.new("Highlight")
    highlighter.FillTransparency = espconfig.outlinefilltransparency
    highlighter.OutlineTransparency = espconfig.outlinetransparency
    highlighter.OutlineColor = getESPColor(player, espconfig.outlinecolor, espconfig.rainbowoutline)
    highlighter.FillColor = getESPColor(player, espconfig.outlinefillcolor, espconfig.rainbowoutline)
    highlighter.Adornee = character
    highlighter.Parent = character
    activehighlights[userid] = highlighter
end

local function removehighlight(player)
    local userid = player.UserId
    if activehighlights[userid] then
        activehighlights[userid]:Destroy()
        activehighlights[userid] = nil
    end
    if playerconnections[userid] then
        for _, conn in pairs(playerconnections[userid]) do
            if conn then conn:Disconnect() end
        end
        playerconnections[userid] = nil
    end
end

local function setupplayerhighlight(player)
    local userid = player.UserId
    playerconnections[userid] = playerconnections[userid] or {}
    local function oncharacteradded(character)
        if not character then return end
        task.spawn(function()
            local humanoid = character:WaitForChild("Humanoid", 5)
            if not humanoid then return end
            if outlineEnabled then
                applyhighlighttocharacter(player, character)
            end
            table.insert(playerconnections[userid], player:GetPropertyChangedSignal("TeamColor"):Connect(function()
                local highlight = activehighlights[userid]
                if highlight then
                    highlight.OutlineColor = getESPColor(player, espconfig.outlinecolor, espconfig.rainbowoutline)
                    highlight.FillColor = getESPColor(player, espconfig.outlinefillcolor, espconfig.rainbowoutline)
                end
            end))
            table.insert(playerconnections[userid], humanoid.Died:Connect(function()
                removehighlight(player)
            end))
        end)
    end
    local charaddedconn = player.CharacterAdded:Connect(oncharacteradded)
    table.insert(playerconnections[userid], charaddedconn)
    if player.Character then oncharacteradded(player.Character) end
end

local function updateesp()
    for player, esp in pairs(espobjects) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local pos, onscreen = Camera:WorldToViewportPoint(hrp.Position)
            local color = getESPColor(player, espconfig.espcolor, espconfig.rainbowesp)
            esp.Name.Color = color
            esp.Name.Size = espconfig.espsize
            if onscreen then
                local distance = (Camera.CFrame.Position - hrp.Position).Magnitude
                local weapon = getPlayerWeapon(player)
                esp.Name.Position = Vector2.new(pos.X, pos.Y - 20)
                esp.Name.Text = player.Name .. " | " .. math.floor(distance) .. " 米 | " .. weapon
                esp.Name.Visible = true
            else
                esp.Name.Visible = false
            end
        else
            esp.Name.Visible = false
        end
    end
    if outlineEnabled then
        for userid, h in pairs(activehighlights) do
            if h then
                local targetPlayer = Players:GetPlayerByUserId(userid)
                if targetPlayer then
                    h.OutlineColor = getESPColor(targetPlayer, espconfig.outlinecolor, espconfig.rainbowoutline)
                    h.FillColor = getESPColor(targetPlayer, espconfig.outlinefillcolor, espconfig.rainbowoutline)
                end
            end
        end
    end
end

local function createtracers()
    tracerlines = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local line = Drawing.new("Line")
            line.Thickness = espconfig.tracersize
            line.Transparency = 1
            line.Visible = false
            tracerlines[player] = line
        end
    end
end

local function updatetracers()
    local screenHeight = Camera.ViewportSize.Y
    local fromY
    if espconfig.tracerposition == "Bottom" then fromY = screenHeight
    elseif espconfig.tracerposition == "Middle" then fromY = screenHeight / 2
    elseif espconfig.tracerposition == "Up" then fromY = 0 end
    for player, line in pairs(tracerlines) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local root = player.Character.HumanoidRootPart
            local screenpos, onscreen = Camera:WorldToViewportPoint(root.Position)
            local color = getESPColor(player, espconfig.tracercolor, espconfig.rainbowtracers)
            if onscreen then
                line.From = Vector2.new(Camera.ViewportSize.X / 2, fromY)
                line.To = Vector2.new(screenpos.X, screenpos.Y)
                line.Color = color
                line.Visible = true
            else
                line.Visible = false
            end
        else
            line.Visible = false
        end
    end
end

Players.PlayerAdded:Connect(function(p)
    if p ~= LocalPlayer then
        if espEnabled then createesp(p) end
        if outlineEnabled then
            playerconnections[p.UserId] = {}
            setupplayerhighlight(p)
        end
        if tracersEnabled then
            local line = Drawing.new("Line")
            line.Thickness = espconfig.tracersize
            line.Transparency = 1
            line.Visible = false
            tracerlines[p] = line
        end
        p.CharacterAdded:Connect(function(c)
            if espEnabled then
                task.wait(0.1)
                if not espobjects[p] then createesp(p) end
            end
            if outlineEnabled then
                task.wait(0.1)
                applyhighlighttocharacter(p, c)
            end
        end)
    end
end)

Players.PlayerRemoving:Connect(function(p)
    removeesp(p)
    removehighlight(p)
    if tracerlines[p] then
        tracerlines[p]:Remove()
        tracerlines[p] = nil
    end
end)

for _, p in pairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then
        p.CharacterAdded:Connect(function(c)
            if espEnabled then
                task.wait(0.1)
                if not espobjects[p] then createesp(p) end
            end
            if outlineEnabled then
                task.wait(0.1)
                applyhighlighttocharacter(p, c)
            end
        end)
    end
end

local espGroup = P:Section({ Title = "基础透视", Opened = true })
espGroup:Toggle({
    Title = "透视",
    Value = false,
    Callback = function(v)
        espEnabled = v
        if v then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then createesp(p) end
            end
            RunService:BindToRenderStep("ESPUpdate", Enum.RenderPriority.Camera.Value + 1, updateesp)
        else
            for p, _ in pairs(espobjects) do removeesp(p) end
            RunService:UnbindFromRenderStep("ESPUpdate")
        end
    end
})

local npcEspEnabled = false
local npcHighlights = {}
local npcAddedConn = nil
local npcRemovingConn = nil

local function isNPCModel(obj)
    if not obj or not obj:IsA("Model") then return false end
    if Players:GetPlayerFromCharacter(obj) then return false end
    local hum = obj:FindFirstChildOfClass("Humanoid")
    local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Head")
    return hum ~= nil and root ~= nil
end

local function addNPCESP(obj)
    if not npcEspEnabled or not isNPCModel(obj) or npcHighlights[obj] then return end
    local h = Instance.new("Highlight")
    h.Name = "ink_HUB_NPC_ESP"
    h.Adornee = obj
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.FillTransparency = 0.75
    h.OutlineTransparency = 0
    h.FillColor = Color3.fromRGB(255, 170, 0)
    h.OutlineColor = Color3.fromRGB(255, 255, 255)
    h.Parent = obj
    npcHighlights[obj] = h
end

local function removeNPCESP(obj)
    local h = npcHighlights[obj]
    if h then
        pcall(function() h:Destroy() end)
        npcHighlights[obj] = nil
    end
end

local function clearNPCESP()
    for obj, h in pairs(npcHighlights) do
        if h then pcall(function() h:Destroy() end) end
        npcHighlights[obj] = nil
    end
end

local function setNPCESP(state)
    npcEspEnabled = state
    if npcAddedConn then npcAddedConn:Disconnect(); npcAddedConn = nil end
    if npcRemovingConn then npcRemovingConn:Disconnect(); npcRemovingConn = nil end

    clearNPCESP()
    if not state then return end

    for _, obj in ipairs(workspace:GetDescendants()) do
        if isNPCModel(obj) then
            addNPCESP(obj)
        end
    end

    npcAddedConn = workspace.DescendantAdded:Connect(function(obj)
        if not npcEspEnabled then return end
        task.defer(function()
            if obj and obj.Parent then
                if isNPCModel(obj) then
                    addNPCESP(obj)
                elseif obj:IsA("Humanoid") and obj.Parent and obj.Parent:IsA("Model") then
                    addNPCESP(obj.Parent)
                end
            end
        end)
    end)

    npcRemovingConn = workspace.DescendantRemoving:Connect(function(obj)
        if npcHighlights[obj] then
            npcHighlights[obj] = nil
        end
    end)
end

espGroup:Toggle({
    Title = "透视NPC",
    Value = false,
    Callback = function(v)
        setNPCESP(v)
    end
})

espGroup:Toggle({
    Title = "队伍检测",
    Value = false,
    Callback = function(v)
        espconfig.teamcheck = v
    end
})
espGroup:Colorpicker({
    Title = "敌对队伍颜色",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(v)
        espconfig.teamcolor = v
    end
})

espGroup:Colorpicker({
    Title = "透视颜色",
    Default = Color3.fromRGB(255,255,255),
    Callback = function(v) espconfig.espcolor = v end
})
espGroup:Toggle({
    Title = "轮廓",
    Value = false,
    Callback = function(v)
        outlineEnabled = v
        if v then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer then
                    if not playerconnections[p.UserId] then
                        playerconnections[p.UserId] = {}
                    end
                    if p.Character then
                        applyhighlighttocharacter(p, p.Character)
                    end
                    setupplayerhighlight(p)
                end
            end
        else
            for _, p in pairs(Players:GetPlayers()) do
                removehighlight(p)
            end
        end
    end
})
espGroup:Colorpicker({
    Title = "轮廓颜色",
    Default = Color3.fromRGB(255,255,255),
    Callback = function(v)
        espconfig.outlinecolor = v
        if outlineEnabled and not espconfig.rainbowoutline then
            for _, h in pairs(activehighlights) do
                if h then
                    h.OutlineColor = v
                end
            end
        end
    end
})
espGroup:Colorpicker({
    Title = "填充颜色",
    Default = Color3.fromRGB(255,255,255),
    Callback = function(v) espconfig.outlinefillcolor = v end
})
espGroup:Toggle({
    Title = "追踪线",
    Value = false,
    Callback = function(v)
        tracersEnabled = v
        if v then
            createtracers()
            RunService:BindToRenderStep("Tracers", Enum.RenderPriority.Camera.Value + 1, updatetracers)
        else
            RunService:UnbindFromRenderStep("Tracers")
            for _, line in pairs(tracerlines) do line:Remove() end
            tracerlines = {}
        end
    end
})
espGroup:Colorpicker({
    Title = "追踪线颜色",
    Default = Color3.fromRGB(255,255,255),
    Callback = function(v) espconfig.tracercolor = v end
})

local configGroup = P:Section({ Title = "高级配置", Opened = false })
configGroup:Toggle({
    Title = "彩虹透视",
    Value = false,
    Callback = function(v) espconfig.rainbowesp = v end
})
configGroup:Toggle({
    Title = "彩虹轮廓",
    Value = false,
    Callback = function(v) espconfig.rainbowoutline = v end
})
configGroup:Toggle({
    Title = "彩虹追踪线",
    Value = false,
    Callback = function(v) espconfig.rainbowtracers = v end
})
configGroup:Slider({
    Title = "透视大小",
    Value = { Min = 16, Max = 48, Default = 16 },
    Step = 1,
    Callback = function(v) espconfig.espsize = v end
})
configGroup:Dropdown({
    Title = "追踪线位置",
    Values = { "底部", "中间", "顶部" },
    Value = "底部",
    Callback = function(v) espconfig.tracerposition = v end
})
configGroup:Slider({
    Title = "轮廓透明度",
    Value = { Min = 0, Max = 100, Default = 0 },
    Step = 1,
    Callback = function(v) espconfig.outlinetransparency = v / 100 end
})
configGroup:Slider({
    Title = "轮廓填充透明度",
    Value = { Min = 0, Max = 100, Default = 50 },
    Step = 1,
    Callback = function(v) espconfig.outlinefilltransparency = v / 100 end
})
configGroup:Slider({
    Title = "彩虹速度",
    Value = { Min = 1, Max = 10, Default = 5 },
    Step = 1,
    Callback = function(v) espconfig.rainbowspeed = v end
})

local AimTab = D:Tab({Title="自瞄", Icon="crosshair"})

local AimbotSettings = {
    Enabled = false,
    TargetPart = "Head",
    TeamCheck = false,
    WallCheck = false,
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

game:GetService("RunService").RenderStepped:Connect(function()
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

local LocalPlayer = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function isValidTarget(player)
    if not player or player == LocalPlayer then return false end
    if not player.Character then return false end
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return false end
    if AimbotSettings.TeamCheck and player.Team == LocalPlayer.Team then return false end
    local part = player.Character:FindFirstChild(AimbotSettings.TargetPart)
    if not part then return false end
    if AimbotSettings.WallCheck then
        local origin = Camera.CFrame.Position
        local dir = part.Position - origin
        local dist = dir.Magnitude
        if dist < 0.001 then return true end
        dir = dir.Unit * dist

        local params = RaycastParams.new()
        local ignore = { LocalPlayer.Character, player.Character }
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                ignore[#ignore + 1] = plr.Character
            end
        end
        params.FilterDescendantsInstances = ignore
        params.FilterType = Enum.RaycastFilterType.Blacklist
        params.IgnoreWater = true

        local result = workspace:Raycast(origin, dir, params)
        if result then
            local hit = result.Instance
            if hit and hit ~= part and not hit:IsDescendantOf(player.Character) then
                return false
            end
        end
    end
    return true
end

local function getClosestInCircle()
    local closest = nil
    local minDist = math.huge
    local center = Camera.ViewportSize / 2
    for _, p in pairs(game.Players:GetPlayers()) do
        if isValidTarget(p) then
            local head = p.Character:FindFirstChild(AimbotSettings.TargetPart)
            if head then
                local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
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

game:GetService("RunService").Heartbeat:Connect(function()
    if AimbotSettings.Enabled then
        local target = getClosestInCircle()
        if target then
            local part = target.Character:FindFirstChild(AimbotSettings.TargetPart)
            if part then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, part.Position)
            end
        end
    end
end)

AimTab:Toggle({ Title = "开启自瞄", Value = false, Callback = function(s) AimbotSettings.Enabled = s end })
AimTab:Toggle({ Title = "自瞄圆圈", Value = false, Callback = function(s) AimbotSettings.CircleEnabled = s end })
AimTab:Dropdown({ Title = "瞄准部位", Values = { "Head", "HumanoidRootPart" }, Value = "Head", Callback = function(v) AimbotSettings.TargetPart = v end })
AimTab:Toggle({ Title = "队伍验证", Value = false, Callback = function(s) AimbotSettings.TeamCheck = s end })
AimTab:Toggle({ Title = "墙体检测", Value = false, Callback = function(s) AimbotSettings.WallCheck = s end })
AimTab:Slider({ Title = "圆圈大小", Value = { Min = 30, Max = 500, Default = 100 }, Callback = function(v) AimbotSettings.CircleRadius = v end })
AimTab:Slider({ Title = "圆圈厚度", Value = { Min = 1, Max = 10, Default = 2 }, Callback = function(v) AimbotSettings.CircleThickness = v end })
AimTab:Dropdown({ Title = "圆圈颜色", Values = { "红", "橙", "黄", "绿", "青", "蓝", "紫", "彩色" }, Value = "彩色", Callback = function(v) AimbotSettings.CircleColor = v end })

local bulletTrackEnabled = false
local bulletTrackConnection = nil
local originalProps = {}
local bulletTrackSize = 13

local function applyBulletTrack(state)
    if state then
        if bulletTrackConnection then bulletTrackConnection:Disconnect() end
        bulletTrackConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if not bulletTrackEnabled then return end
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= game.Players.LocalPlayer and plr.Character then
                    local char = plr.Character
                    if not originalProps[plr] then
                        originalProps[plr] = {}
                        local parts = {"RightUpperLeg", "LeftUpperLeg", "HeadHB", "HumanoidRootPart"}
                        for _, name in pairs(parts) do
                            local part = char:FindFirstChild(name)
                            if part then
                                originalProps[plr][name] = {
                                    CanCollide = part.CanCollide,
                                    Transparency = part.Transparency,
                                    Size = part.Size,
                                    ShowCollision = part.ShowCollision
                                }
                            end
                        end
                    end
                    for _, name in pairs({"RightUpperLeg", "LeftUpperLeg", "HeadHB", "HumanoidRootPart"}) do
                        local part = char:FindFirstChild(name)
                        if part then
                            part.CanCollide = false
                            part.Transparency = 0.9
                            part.Size = Vector3.new(bulletTrackSize, bulletTrackSize, bulletTrackSize)
                            part.ShowCollision = false
                        end
                    end
                end
            end
        end)
    else
        if bulletTrackConnection then
            bulletTrackConnection:Disconnect()
            bulletTrackConnection = nil
        end
        for plr, props in pairs(originalProps) do
            if plr.Character then
                for name, prop in pairs(props) do
                    local part = plr.Character:FindFirstChild(name)
                    if part then
                        part.CanCollide = prop.CanCollide
                        part.Transparency = prop.Transparency
                        part.Size = prop.Size
                        part.ShowCollision = prop.ShowCollision
                    end
                end
            end
            originalProps[plr] = nil
        end
    end
end

AimTab:Toggle({
    Title = "碰撞箱扩展",
    Value = false,
    Callback = function(s)
        bulletTrackEnabled = s
        applyBulletTrack(s)
    end
})

AimTab:Slider({
    Title = "碰撞箱大小",
    Value = { Min = 5, Max = 100, Default = 13 },
    Step = 1,
    Callback = function(v)
        bulletTrackSize = v
        if bulletTrackEnabled then
            applyBulletTrack(false)
            task.wait(0.05)
            applyBulletTrack(true)
        end
    end
})

local TransTab=D:Tab({Title="传送",Icon="send"})

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
    A:SetCore("SendNotification",{Title="已刷新",Text="玩家列表已更新，请重新选择玩家",Duration=2})
end})

TransTab:Button({Title="传送",Callback=function()
    if not selectedPlayer or selectedPlayer=="无其他玩家" then
        A:SetCore("SendNotification",{Title="错误",Text="请先选择一名玩家",Duration=2})
        return
    end
    local target=game:GetService("Players"):FindFirstChild(selectedPlayer)
    if not target or not target.Character then
        A:SetCore("SendNotification",{Title="错误",Text="目标玩家不存在或没有角色",Duration=2})
        return
    end
    local targetRoot=target.Character:FindFirstChild("HumanoidRootPart")
    if not targetRoot then
        A:SetCore("SendNotification",{Title="错误",Text="目标玩家没有HumanoidRootPart",Duration=2})
        return
    end
    local localChar=game.Players.LocalPlayer.Character
    if not localChar then
        A:SetCore("SendNotification",{Title="错误",Text="你没有角色",Duration=2})
        return
    end
    local localRoot=localChar:FindFirstChild("HumanoidRootPart")
    if not localRoot then
        A:SetCore("SendNotification",{Title="错误",Text="你没有HumanoidRootPart",Duration=2})
        return
    end
    localRoot.CFrame=targetRoot.CFrame*CFrame.new(0,0,3)
    A:SetCore("SendNotification",{Title="传送成功",Text="已传送到 "..selectedPlayer.." 旁边",Duration=2})
end})

local MusicTab = D:Tab({Title="音乐播放器", Icon="music"})

local currentSound = nil
local currentVolume = 0.5
local currentSpeed = 1
local musicId = ""

MusicTab:Input({
    Title = "音乐ID",
    Placeholder = "请输入音乐ID",
    Callback = function(text)
        musicId = text
    end
})

MusicTab:Input({
    Title = "音量",
    Placeholder = "请输入数字",
    Callback = function(text)
        local val = tonumber(text)
        if val then
            val = math.clamp(val, 0, 10000000000)
            currentVolume = val
            if currentSound then
                currentSound.Volume = currentVolume
            end
        end
    end
})

MusicTab:Input({
    Title = "速度",
    Placeholder = "请输入数字",
    Callback = function(text)
        local val = tonumber(text)
        if val then
            val = math.clamp(val, 0.01, 2)
            currentSpeed = val
            if currentSound then
                currentSound.PlaybackSpeed = currentSpeed
            end
        end
    end
})

MusicTab:Button({
    Title = "播放音乐",
    Callback = function()
        if musicId == "" then
            A:SetCore("SendNotification",{Title="提示", Text="请先输入音乐ID", Duration=2})
            return
        end
        if currentSound then
            currentSound:Destroy()
            currentSound = nil
        end
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. musicId
        sound.Volume = currentVolume
        sound.PlaybackSpeed = currentSpeed
        sound.Looped = true
        sound.Parent = game.Players.LocalPlayer.Character or workspace
        sound:Play()
        currentSound = sound
        A:SetCore("SendNotification",{Title="播放中", Text="音乐ID: " .. musicId .. "（循环播放）", Duration=2})
    end
})

MusicTab:Button({
    Title = "停止音乐",
    Callback = function()
        if currentSound then
            currentSound:Stop()
            currentSound:Destroy()
            currentSound = nil
            A:SetCore("SendNotification",{Title="已停止", Text="音乐已停止", Duration=2})
        else
            A:SetCore("SendNotification",{Title="提示", Text="当前没有正在播放的音乐", Duration=2})
        end
    end
})

local BeautifyTab = D:Tab({Title="美化", Icon="sparkles"})

BeautifyTab:Button({
    Title = "加载美化菜单",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/inkkkkkkkk/Theinkremains/refs/heads/main/%E7%BE%8E%E5%8C%96.lua"))()
    end
})

local IYTab = D:Tab({Title="IY指令", Icon="terminal"})

IYTab:Button({
    Title = "执行Dex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/inkkkkkkkk/Theinkremains/refs/heads/main/Dex%2B%2B%E4%BF%AE%E5%A4%8D%E5%8F%8D%E7%BC%96%E8%AF%91(1)%20(1).lua"))()
    end
})

IYTab:Button({
    Title = "执行rspy",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/EVVdCgPf/raw"))()
    end
})

IYTab:Button({
    Title = "执行mdex",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end
})

IYTab:Button({
    Title = "执行Cspy",
    Callback = function()
        loadstring(game:HttpGet("https://gitlab.com/upio/cobalt/-/releases/permalink/latest/downloads/Cobalt.luau"))()
    end
})

local L = D:Tab({Title="FE", Icon="zap"})
L:Button({Title="coolgui", Callback=function() loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)() end})
L:Button({Title="被遗弃人物", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CyberNinja103/brodwa/refs/heads/main/ForsakationHub"))() end})
L:Button({Title="R15下蹲", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Azizanzz0/Scripts/refs/heads/main/Crouching.txt"))() end})
L:Button({Title="爬行", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_vZDX8j5ggfAf58QhdJ59BVEmF6nmZgq4Mcjt2l8wn16CiStIW2P6EkNc605qv9K4.lua.txt"))() end})
L:Button({Title="免费动作", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Free-emote/refs/heads/main/Delta%20mad%20stuffs"))() end})
L:Button({Title="R6动作", Callback=function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-Menu-By-Me-19427"))() end})
L:Button({Title="假延迟", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RENZXW/RENZXW-SCRIPTS/main/fakeLAGRENZXW.txt"))() end})
L:Button({Title="假VR(仅自然灾害)", Callback=function() loadstring(game:HttpGet("https://pastefy.app/MvKHpycG/raw"))() end})
L:Button({Title="冲刺", Callback=function() loadstring(game:HttpGet("https://pastefy.app/ZhKVgCK3/raw"))() end})
L:Button({Title="NPC控制", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty13.lua"))() end})
L:Button({Title="击杀NPC", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/GUI-Offical/FileTest/refs/heads/main/Grab%20R6.txt", true))() end})
L:Button({Title="更改动画包+动作", Callback=function() loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))() end})
L:Button({Title="更改动画包", Callback=function() loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/PwFrcMysMOIJuWAQ/raw"))() end})
L:Button({Title="SCP_096", Callback=function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-SCP-096-36948"))() end})
L:Button({Title="天空盒", Callback=function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Emote-Player-51936"))() end})

local M=D:Tab({Title="漏洞",Icon="bug"})
M:Button({Title="AC6音乐播放器",Callback=function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Ac6-Music-Vulnerability-25536"))()end})
M:Button({Title="后门执行器1",Callback=function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-LALOL-hub-without-hint-19587"))()end})
M:Button({Title="后门执行器2",Callback=function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Starlight-Scanner-213808"))()end})
M:Button({Title="UnethicalNetworks f3x gui v9",Callback=function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UnethicalNetworks-f3x-gui-v9-124640"))()end})
M:Button({Title="UnethicalNetworks f3x gui v6 v7 v8",Callback=function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UnethicalNetworks-f3x-gui-v6v7v8-121690"))()end})

local N=D:Tab({Title="末日砖块",Icon="target"})
local O=D:Tab({Title="被遗弃",Icon="ghost"})

O:Button({
    Title = "加载角色/皮肤修改器",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/inkkkkkkkk/Theinkremains/refs/heads/main/%E8%A2%AB%E9%81%97%E5%BC%83%E8%A7%92%E8%89%B2or%E7%9A%AE%E8%82%A4%E5%88%87%E6%8D%A2%E5%99%A8.lua"))()
    end
})

O:Toggle({Title="改视野",Value=false,Callback=function()
    local player=game.Players.LocalPlayer
    local remote=game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("Network"):WaitForChild("RemoteEvent")
    local fovObject=player:WaitForChild("PlayerData"):WaitForChild("Settings"):WaitForChild("Game"):WaitForChild("FieldOfView")
    local bytes=string.char(0x02,0x00,0x00,0x00,0x00,0x00,0x00,0x5E,0x40)
    remote:FireServer("UpdateSettings",{fovObject,buffer.fromstring(bytes)})
end})

local guestBlockEnabled=false
local guestBlockThread=nil

O:Toggle({Title="访客格挡",Value=false,Callback=function(s)
    guestBlockEnabled=s
    if s then
        if guestBlockThread then task.cancel(guestBlockThread) end
        guestBlockThread=task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").Modules.Network.Network.RemoteEvent
            while guestBlockEnabled do
                Event:FireServer("UseActorAbility",{(function(bytes)local b=buffer.create(#bytes)for i=1,#bytes do buffer.writeu8(b,i-1,bytes[i])end return b end)({3,5,0,0,0,66,108,111,99,107})})
                task.wait(0.01)
            end
        end)
    else
        if guestBlockThread then task.cancel(guestBlockThread) guestBlockThread=nil end
    end
end})

local guestChargeEnabled=false
local guestChargeThread=nil

O:Toggle({Title="访客大运",Value=false,Callback=function(s)
    guestChargeEnabled=s
    if s then
        if guestChargeThread then task.cancel(guestChargeThread) end
        guestChargeThread=task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").Modules.Network.Network.RemoteEvent
            while guestChargeEnabled do
                Event:FireServer("UseActorAbility",{(function(bytes)local b=buffer.create(#bytes)for i=1,#bytes do buffer.writeu8(b,i-1,bytes[i])end return b end)({3,6,0,0,0,67,104,97,114,103,101})})
                task.wait(0.01)
            end
        end)
    else
        if guestChargeThread then task.cancel(guestChargeThread) guestChargeThread=nil end
    end
end})

local shedletskySlashEnabled=false
local shedletskySlashThread=nil

O:Toggle({Title="谢德大运",Value=false,Callback=function(s)
    shedletskySlashEnabled=s
    if s then
        if shedletskySlashThread then task.cancel(shedletskySlashThread) end
        shedletskySlashThread=task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").Modules.Network.Network.RemoteEvent
            while shedletskySlashEnabled do
                Event:FireServer("UseActorAbility",{(function(bytes)local b=buffer.create(#bytes)for i=1,#bytes do buffer.writeu8(b,i-1,bytes[i])end return b end)({3,5,0,0,0,83,108,97,115,104})})
                task.wait(0.01)
            end
        end)
    else
        if shedletskySlashThread then task.cancel(shedletskySlashThread) shedletskySlashThread=nil end
    end
end})

local pizzaThrowEnabled=false
local pizzaThrowThread=nil

O:Toggle({Title="披萨投喂",Value=false,Callback=function(s)
    pizzaThrowEnabled=s
    if s then
        if pizzaThrowThread then task.cancel(pizzaThrowThread) end
        pizzaThrowThread=task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").Modules.Network.Network.RemoteEvent
            while pizzaThrowEnabled do
                Event:FireServer("UseActorAbility",{(function(bytes)local b=buffer.create(#bytes)for i=1,#bytes do buffer.writeu8(b,i-1,bytes[i])end return b end)({3,10,0,0,0,84,104,114,111,119,80,105,122,122,97})})
                task.wait(0.01)
            end
        end)
    else
        if pizzaThrowThread then task.cancel(pizzaThrowThread) pizzaThrowThread=nil end
    end
end})

local noobDestructionEnabled=false
local noobDestructionThread=nil

O:Toggle({Title="noob破坏世界",Value=false,Callback=function(s)
    noobDestructionEnabled=s
    if s then
        if noobDestructionThread then task.cancel(noobDestructionThread) end
        noobDestructionThread=task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").Modules.Network.Network.RemoteEvent
            while noobDestructionEnabled do
                Event:FireServer("UseActorAbility",{(function(bytes)local b=buffer.create(#bytes)for i=1,#bytes do buffer.writeu8(b,i-1,bytes[i])end return b end)({3,8,0,0,0,84,105,109,101,115,116,111,112})})
                task.wait(0.01)
            end
        end)
    else
        if noobDestructionThread then task.cancel(noobDestructionThread) noobDestructionThread=nil end
    end
end})

local clone007Enabled=false
local clone007Thread=nil

O:Toggle({Title="007分身",Value=false,Callback=function(s)    clone007Enabled=s
    if s then
        if clone007Thread then task.cancel(clone007Thread) end
        clone007Thread=task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").Modules.Network.Network.RemoteEvent
            while clone007Enabled do
                Event:FireServer("UseActorAbility",{(function(bytes)local b=buffer.create(#bytes)for i=1,#bytes do buffer.writeu8(b,i-1,bytes[i])end return b end)({3,5,0,0,0,67,108,111,110,101})})
                task.wait(0.01)
            end
        end)
    else
        if clone007Thread then task.cancel(clone007Thread) clone007Thread=nil end
    end
end})

local taphMineEnabled=false
local taphMineThread=nil

O:Toggle({Title="塔夫放雷",Value=false,Callback=function(s)
    taphMineEnabled=s
    if s then
        if taphMineThread then task.cancel(taphMineThread) end
        taphMineThread=task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").Modules.Network.Network.RemoteEvent
            while taphMineEnabled do
                Event:FireServer("UseActorAbility",{(function(bytes)local b=buffer.create(#bytes)for i=1,#bytes do buffer.writeu8(b,i-1,bytes[i])end return b end)({3,16,0,0,0,83,117,98,115,112,97,99,101,84,114,105,112,109,105,110,101})})
                task.wait(0.01)
            end
        end)
    else
        if taphMineThread then task.cancel(taphMineThread) taphMineThread=nil end
    end
end})

local flashbangEnabled=false
local flashbangThread=nil

O:Toggle({Title="闪光弹",Value=false,Callback=function(s)
    flashbangEnabled=s
    if s then
        if flashbangThread then task.cancel(flashbangThread) end
        flashbangThread=task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").Modules.Network.Network.RemoteEvent
            while flashbangEnabled do
                Event:FireServer("UseActorAbility",{(function(bytes)local b=buffer.create(#bytes)for i=1,#bytes do buffer.writeu8(b,i-1,bytes[i])end return b end)({3,9,0,0,0,70,108,97,115,104,98,97,110,103})})
                task.wait(0.01)
            end
        end)
    else
        if flashbangThread then task.cancel(flashbangThread) flashbangThread=nil end
    end
end})

local guest666Enabled=false
local guest666Thread=nil

O:Toggle({Title="访客666大运",Value=false,Callback=function(s)
    guest666Enabled=s
    if s then
        if guest666Thread then task.cancel(guest666Thread) end
        guest666Thread=task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").Modules.Network.Network.RemoteEvent
            while guest666Enabled do
                Event:FireServer("UseActorAbility",{(function(bytes)local b=buffer.create(#bytes)for i=1,#bytes do buffer.writeu8(b,i-1,bytes[i])end return b end)({3,14,0,0,0,68,101,109,111,110,105,99,80,117,114,115,117,105,116})})
                task.wait(0.01)
            end
        end)
    else
        if guest666Thread then task.cancel(guest666Thread) guest666Thread=nil end
    end
end})

local InfinityRealityTab = D:Tab({ Title = "无尽现实", Icon = "infinity" })

InfinityRealityTab:Button({
    Title = "执行ink无尽现实",
    Callback = function()
        local ok, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/inkkkkkkkk/Theinkremains/refs/heads/main/%E6%97%A0%E5%B0%BD%E7%8E%B0%E5%AE%9E.lua"))()
        end)
        if ok then
            A:SetCore("SendNotification",{Title="ink无尽现实", Text="执行成功", Duration=2})
        else
            A:SetCore("SendNotification",{Title="ink无尽现实", Text="执行失败: "..tostring(err):sub(1,80), Duration=4})
        end
    end
})

local FlashTab = D:Tab({Title="闪光", Icon="sparkles"})

FlashTab:Section({ Title = "角色增强" })

local noVelocityEnabled = false
local noVelocityConnection = nil
FlashTab:Toggle({
    Title = "无流速",
    Value = false,
    Callback = function(v)
        noVelocityEnabled = v
        if v then
            noVelocityConnection = game:GetService("RunService").Heartbeat:Connect(function()
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = player.Character.HumanoidRootPart
                        hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                        hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    end
                end
            end)
        else
            if noVelocityConnection then noVelocityConnection:Disconnect(); noVelocityConnection = nil end
        end
    end
})

local bunnyHopEnabled = false
local bunnyHopDelay = 1
local bunnyHopConnection = nil
FlashTab:Toggle({
    Title = "兔子跳",
    Value = false,
    Callback = function(v)
        bunnyHopEnabled = v
        if v then
            bunnyHopConnection = game:GetService("RunService").Heartbeat:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if not char or not char:FindFirstChild("Humanoid") then return end
                local humanoid = char.Humanoid
                if humanoid:GetState() == Enum.HumanoidStateType.Running and humanoid.FloorMaterial ~= Enum.Material.Air then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    task.wait(bunnyHopDelay)
                end
            end)
        else
            if bunnyHopConnection then bunnyHopConnection:Disconnect(); bunnyHopConnection = nil end
        end
    end
})
FlashTab:Slider({
    Title = "兔子跳延迟",
    Value = { Min = 0, Max = 5, Default = 1 },
    Step = 0.1,
    Callback = function(v) bunnyHopDelay = v end
})

FlashTab:Divider()

local autoRespawnEnabled = false
local autoRespawnDelay = 0
local autoRespawnLastFire = 0
FlashTab:Toggle({
    Title = "自动重生",
    Value = false,
    Callback = function(v)
        autoRespawnEnabled = v
        if v then
            task.spawn(function()
                while autoRespawnEnabled do
                    if not game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name) then
                        if tick() - autoRespawnLastFire >= 1 then
                            local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
                            if remotes and remotes:FindFirstChild("Command") then
                                remotes.Command:FireServer("Play")
                            end
                            autoRespawnLastFire = tick()
                        end
                    end
                    task.wait(autoRespawnDelay)
                end
            end)
        end
    end
})
FlashTab:Slider({
    Title = "重生延迟",
    Value = { Min = 0, Max = 3, Default = 0 },
    Step = 0.1,
    Callback = function(v) autoRespawnDelay = v end
})

FlashTab:Section({ Title = "游戏功能" })

local ReplicatedStorage = game:GetService("ReplicatedStorage")
FlashTab:Button({
    Title = "返回大厅",
    Callback = function()
        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
        if remotes and remotes:FindFirstChild("Command") then
            remotes.Command:FireServer("Lobby")
        end
    end
})
FlashTab:Button({
    Title = "开始游戏",
    Callback = function()
        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
        if remotes and remotes:FindFirstChild("Command") then
            remotes.Command:FireServer("Play")
        end
    end
})

FlashTab:Section({ Title = "近战刀具" })

local knifeCloseEnabled = false
local knifeRange = 10
local showKnifeRange = false
local knifeRangeColor = Color3.fromRGB(255,255,255)
local knifeRangeTransparency = 0.5
local rangeSphere = nil
local knifeConnection = nil
local lastKnifeState = nil
local SwapWeapon = nil

task.spawn(function()
    local signalEvents = ReplicatedStorage:FindFirstChild("SignalManager")
    if signalEvents then
        signalEvents = signalEvents:FindFirstChild("SignalEvents")
        if signalEvents then
            SwapWeapon = signalEvents:FindFirstChild("SwapWeapon")
        end
    end
end)

local function updateKnifeRangeSphere()
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        if rangeSphere then rangeSphere.Transparency = 1 end
        return
    end
    local root = player.Character.HumanoidRootPart
    if showKnifeRange then
        if not rangeSphere then
            rangeSphere = Instance.new("Part")
            rangeSphere.Name = "KnifeRangeSphere"
            rangeSphere.Shape = Enum.PartType.Ball
            rangeSphere.Material = Enum.Material.ForceField
            rangeSphere.CanCollide = false
            rangeSphere.Anchored = true
            rangeSphere.CastShadow = false
            rangeSphere.Parent = game.Workspace
        end
        rangeSphere.Size = Vector3.new(knifeRange*2, knifeRange*2, knifeRange*2)
        rangeSphere.CFrame = root.CFrame
        rangeSphere.Color = knifeRangeColor
        rangeSphere.Transparency = knifeRangeTransparency
    else
        if rangeSphere then rangeSphere:Destroy(); rangeSphere = nil end
    end
end
game:GetService("RunService").RenderStepped:Connect(updateKnifeRangeSphere)

local function anyEnemyInRange()
    local player = game.Players.LocalPlayer
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return false end
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (root.Position - plr.Character.HumanoidRootPart.Position).Magnitude
            if dist <= knifeRange then return true end
        end
    end
    return false
end

local function toggleKnifeSwitch()
    if knifeCloseEnabled then
        knifeConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if not knifeCloseEnabled then return end
            local inRange = anyEnemyInRange()
            if lastKnifeState == nil or lastKnifeState ~= inRange then
                if SwapWeapon then SwapWeapon:Fire() end
                lastKnifeState = inRange
            end
        end)
    else
        if knifeConnection then knifeConnection:Disconnect(); knifeConnection = nil end
        lastKnifeState = nil
    end
end

FlashTab:Toggle({
    Title = "近战切换刀具",
    Value = false,
    Callback = function(v) knifeCloseEnabled = v; toggleKnifeSwitch() end
})
FlashTab:Slider({
    Title = "刀具范围",
    Value = { Min = 1, Max = 50, Default = 10 },
    Step = 1,
    Callback = function(v) knifeRange = v; updateKnifeRangeSphere() end
})
FlashTab:Toggle({
    Title = "显示刀具范围",
    Value = false,
    Callback = function(v) showKnifeRange = v; updateKnifeRangeSphere() end
})
FlashTab:Colorpicker({
    Title = "范围颜色",
    Default = Color3.fromRGB(255,255,255),
    Transparency = 0.5,
    Callback = function(v, t) knifeRangeColor = v; knifeRangeTransparency = t or 0.5; updateKnifeRangeSphere() end
})

FlashTab:Section({ Title = "开箱" })

local knifeCrateCount = 0
local gunCrateCount = 0
local isOpeningCrates = false
local RollCrate = nil
task.spawn(function()
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if remotes then RollCrate = remotes:FindFirstChild("RollCrate") end
end)

local function openKnifeCrates()
    if isOpeningCrates then return end
    isOpeningCrates = true
    for i = 1, knifeCrateCount do
        if RollCrate then RollCrate:FireServer("KnifeCrate") end
        task.wait(0.1)
    end
    isOpeningCrates = false
end
local function openGunCrates()
    if isOpeningCrates then return end
    isOpeningCrates = true
    for i = 1, gunCrateCount do
        if RollCrate then RollCrate:FireServer("GunCrate") end
        task.wait(0.1)
    end
    isOpeningCrates = false
end

FlashTab:Button({
    Title = "批量开刀具箱",
    Callback = openKnifeCrates
})
FlashTab:Slider({
    Title = "刀具箱数量",
    Value = { Min = 0, Max = 25, Default = 0 },
    Step = 1,
    Callback = function(v) knifeCrateCount = math.floor(v) end
})
FlashTab:Button({
    Title = "批量开枪箱",
    Callback = openGunCrates
})
FlashTab:Slider({
    Title = "枪箱数量",
    Value = { Min = 0, Max = 15, Default = 0 },
    Step = 1,
    Callback = function(v) gunCrateCount = math.floor(v) end
})

FlashTab:Section({ Title = "弹道" })

local bulletTrailsEnabled = false
local bulletMissColor = Color3.new(1,0,0)
local bulletHitColor = Color3.new(0,1,0)
local tracers = {}
local TRACER_LIFETIME = 1.5
local TRACER_THICKNESS = 0.06
local BALL_SIZE = 6
local OUTLINE_THICKNESS = 2
local FADE_TIME = 1.2
local HIT_RANGE = 3

local function fadeBeam(part)
    local t = 0
    while t < TRACER_LIFETIME do
        t = t + game:GetService("RunService").RenderStepped:Wait()
        part.Transparency = t / TRACER_LIFETIME
    end
    part:Destroy()
end

local function drawTracerSegment(startPos, endPos)
    if not bulletTrailsEnabled then return end
    local beam = Instance.new("Part")
    beam.Anchored = true
    beam.CanCollide = false
    beam.Material = Enum.Material.Neon
    beam.Color = bulletMissColor
    beam.Size = Vector3.new(TRACER_THICKNESS, TRACER_THICKNESS, (startPos - endPos).Magnitude)
    beam.CFrame = CFrame.new(startPos, endPos) * CFrame.new(0,0,-beam.Size.Z/2)
    beam.Transparency = 0
    beam.Parent = game.Workspace
    table.insert(tracers, beam)
    task.spawn(function() fadeBeam(beam) end)
end

local function colorNearestTracer(gibPosition)
    if not bulletTrailsEnabled then return end
    local nearest = nil
    local nearestDist = math.huge
    for _, tracer in ipairs(tracers) do
        if tracer.Parent then
            local dist = (tracer.Position - gibPosition).Magnitude
            if dist < nearestDist then
                nearestDist = dist
                nearest = tracer
            end
        end
    end
    if nearest then nearest.Color = bulletHitColor end
end

local function hitPlayer(position)
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= game.Players.LocalPlayer and plr.Character then
            for _, part in ipairs(plr.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    if (part.Position - position).Magnitude <= HIT_RANGE then
                        return true
                    end
                end
            end
        end
    end
    return false
end

local function makeImpactBall(part)
    if not bulletTrailsEnabled then return end
    local pos = part.Position
    local green = hitPlayer(pos)
    local outlineColor = green and bulletHitColor or bulletMissColor
    local innerColor = green and bulletHitColor or bulletMissColor
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.fromOffset(BALL_SIZE*2, BALL_SIZE*2)
    billboard.AlwaysOnTop = false
    billboard.LightInfluence = 0
    billboard.Parent = part
    local outline = Instance.new("ImageLabel")
    outline.Size = UDim2.fromScale(1,1)
    outline.BackgroundTransparency = 1
    outline.Image = "rbxassetid://1316045217"
    outline.ImageColor3 = outlineColor
    outline.ImageTransparency = 0
    outline.Parent = billboard
    local inner = Instance.new("ImageLabel")
    inner.Size = UDim2.fromOffset(billboard.Size.X.Offset - OUTLINE_THICKNESS*2, billboard.Size.Y.Offset - OUTLINE_THICKNESS*2)
    inner.Position = UDim2.fromOffset(OUTLINE_THICKNESS, OUTLINE_THICKNESS)
    inner.BackgroundTransparency = 1
    inner.Image = "rbxassetid://1316045217"
    inner.ImageColor3 = innerColor
    inner.ImageTransparency = 0
    inner.Parent = billboard
    task.spawn(function()
        local t = 0
        while t < FADE_TIME do
            t = t + game:GetService("RunService").RenderStepped:Wait()
            local alpha = t / FADE_TIME
            outline.ImageTransparency = alpha
            inner.ImageTransparency = alpha
        end
        billboard:Destroy()
    end)
end

local bulletStorage = game.Workspace:FindFirstChild("bulletStorage") or Instance.new("Folder", game.Workspace)
if bulletStorage.Name ~= "bulletStorage" then bulletStorage.Name = "bulletStorage" end
local hitEffectFolder = game.Workspace:FindFirstChild("HitEffect") or Instance.new("Folder", game.Workspace)
if hitEffectFolder.Name ~= "HitEffect" then hitEffectFolder.Name = "HitEffect" end

bulletStorage.ChildAdded:Connect(function(bullet)
    if not bulletTrailsEnabled then return end
    if not bullet:IsA("BasePart") then return end
    local lastPos = bullet.Position
    local conn
    conn = game:GetService("RunService").RenderStepped:Connect(function()
        if bullet and bullet.Parent then
            local newPos = bullet.Position
            drawTracerSegment(lastPos, newPos)
            lastPos = newPos
        else
            conn:Disconnect()
        end
    end)
end)

hitEffectFolder.ChildAdded:Connect(function(obj)
    if not bulletTrailsEnabled then return end
    if obj:IsA("BasePart") then
        if obj.Name == "Gib_T" then colorNearestTracer(obj.Position) end
        if obj.Name == "Gib_G" then makeImpactBall(obj) end
    end
end)

FlashTab:Toggle({
    Title = "显示弹道",
    Value = false,
    Callback = function(v) bulletTrailsEnabled = v end
})
FlashTab:Colorpicker({
    Title = "未击中颜色",
    Default = Color3.new(1,0,0),
    Callback = function(v) bulletMissColor = v end
})
FlashTab:Colorpicker({
    Title = "击中颜色",
    Default = Color3.new(0,1,0),
    Callback = function(v) bulletHitColor = v end
})

local BackstreetTab = D:Tab({Title="后街生存", Icon="map"})

local lastPosition = nil
local function teleportTo(pos)
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    lastPosition = hrp.Position
    hrp.CFrame = CFrame.new(pos)
end

BackstreetTab:Section({ Title = "自动功能" })

local toolLoopEnabled = false
local toolLoopConnection = nil
local function startToolLoop()
    if toolLoopConnection then return end
    local RS = game:GetService("ReplicatedStorage")
    local ToolEvent = RS:WaitForChild("Events"):WaitForChild("ToolEvent")
    toolLoopConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not toolLoopEnabled then return end
        ToolEvent:FireServer("Activated", false)
        task.wait(0.5)
        if not toolLoopEnabled then return end
        ToolEvent:FireServer("Activated", true)
        task.wait(0.5)
    end)
end
local function stopToolLoop()
    toolLoopEnabled = false
    if toolLoopConnection then toolLoopConnection:Disconnect(); toolLoopConnection = nil end
end

BackstreetTab:Toggle({
    Title = "启用自动挖掘",
    Value = false,
    Callback = function(state)
        toolLoopEnabled = state
        if state then startToolLoop() else stopToolLoop() end
    end
})

local stickPickupEnabled = false
local stickPickupConnection = nil
local function startStickPickup()
    if stickPickupConnection then return end
    stickPickupConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not stickPickupEnabled then return end
        local player = game.Players.LocalPlayer
        local backpack = player:FindFirstChild("Backpack")
        if not backpack then return end
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA("Tool") and item.Name:sub(1,5):lower() == "stick" then
                local char = player.Character or workspace:FindFirstChild(player.Name)
                if char then item.Parent = char end
                break
            end
        end
    end)
end
local function stopStickPickup()
    stickPickupEnabled = false
    if stickPickupConnection then stickPickupConnection:Disconnect(); stickPickupConnection = nil end
end

BackstreetTab:Toggle({
    Title = "自动拿起木棍",
    Value = false,
    Callback = function(state)
        stickPickupEnabled = state
        if state then startStickPickup() else stopStickPickup() end
    end
})

BackstreetTab:Section({ Title = "传送" })

BackstreetTab:Button({ Title = "传送到垃圾大师", Callback = function() teleportTo(Vector3.new(-173.27, 3.50, 47.06)) end })
BackstreetTab:Button({ Title = "传送回原位置", Callback = function()
    if not lastPosition then return end
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    hrp.CFrame = CFrame.new(lastPosition)
end })

BackstreetTab:Section({ Title = "地点传送" })

BackstreetTab:Button({ Title = "传送到豆子工厂", Callback = function() teleportTo(Vector3.new(-269.05, 3.50, 155.16)) end })
BackstreetTab:Button({ Title = "传送到后街", Callback = function() teleportTo(Vector3.new(-196.88, 3.50, 63.44)) end })
BackstreetTab:Button({ Title = "传送到后街对面", Callback = function() teleportTo(Vector3.new(-184.26, 4.00, -189.72)) end })
BackstreetTab:Button({ Title = "传送到下水道", Callback = function() teleportTo(Vector3.new(-245.42, -22.96, -1349.19)) end })

local NicoTab = D:Tab({Title="nico的下一个机器人", Icon="cpu"})

local bunnyHopEnabled = false
local bunnyHopConnection = nil

NicoTab:Toggle({
    Title = "自动跳跃",
    Value = false,
    Callback = function(v)
        bunnyHopEnabled = v
        if v then
            bunnyHopConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not bunnyHopEnabled then return end
                local char = game.Players.LocalPlayer.Character
                if not char then return end
                local humanoid = char:FindFirstChild("Humanoid")
                if not humanoid then return end
                if humanoid:GetState() == Enum.HumanoidStateType.Running and humanoid.FloorMaterial ~= Enum.Material.Air then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            if bunnyHopConnection then
                bunnyHopConnection:Disconnect()
                bunnyHopConnection = nil
            end
        end
    end
})

local PowerLegendTab = D:Tab({Title="力量传奇", Icon="dumbbell"})

PowerLegendTab:Button({
    Title = "传送到出生点",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(72.74, 3.71, 141.13)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到出生点", Duration=2})
    end
})

PowerLegendTab:Section({ Title = "传送到健身房" })

PowerLegendTab:Button({
    Title = "传送到力量之王健身房",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(-8624.00, 13.57, -5871.08)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到力量之王健身房", Duration=2})
    end
})

PowerLegendTab:Button({
    Title = "传送到传奇健身房",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(-8678.00, 3.15, 2348.04)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到传奇健身房", Duration=2})
    end
})

PowerLegendTab:Button({
    Title = "传送到永恒健身房",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(4630.12, 987.90, -3893.76)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到永恒健身房", Duration=2})
    end
})

PowerLegendTab:Button({
    Title = "传送到神话健身房",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(-6769.98, 3.72, -1287.33)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到神话健身房", Duration=2})
    end
})

PowerLegendTab:Button({
    Title = "传送到冰霜健身房",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(-2823.86, 3.72, -248.66)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到冰霜健身房", Duration=2})
    end
})

PowerLegendTab:Button({
    Title = "传送到小岛",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(-32.20, 7.03, 1860.85)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到小岛", Duration=2})
    end
})

PowerLegendTab:Section({ Title = "传送到竞技场" })

PowerLegendTab:Button({
    Title = "传送到熔岩竞技场观战台",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(4460.67, 99.97, -8454.09)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到熔岩竞技场观战台", Duration=2})
    end
})

PowerLegendTab:Button({
    Title = "传送到熔岩竞技场内部",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(4421.18, 13.17, -8789.72)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到熔岩竞技场内部", Duration=2})
    end
})

PowerLegendTab:Button({
    Title = "传送到拳击擂台观战台",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(-1972.65, 99.97, -6010.31)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到拳击擂台观战台", Duration=2})
    end
})

PowerLegendTab:Button({
    Title = "传送到拳击擂台内部",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(-1925.47, 13.57, -6337.44)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到拳击擂台内部", Duration=2})
    end
})

PowerLegendTab:Button({
    Title = "传送到沙漠擂台观战台",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(938.67, 99.97, -7044.35)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到沙漠擂台观战台", Duration=2})
    end
})

PowerLegendTab:Button({
    Title = "传送到沙漠擂台内部",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if not char then
            A:SetCore("SendNotification",{Title="错误", Text="角色不存在", Duration=2})
            return
        end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            A:SetCore("SendNotification",{Title="错误", Text="找不到 HumanoidRootPart", Duration=2})
            return
        end
        hrp.CFrame = CFrame.new(736.07, 10.20, -7665.00)
        A:SetCore("SendNotification",{Title="传送成功", Text="已传送到沙漠擂台内部", Duration=2})
    end
})

local FractureTab = D:Tab({Title="骨折模拟器", Icon="bone"})

local function updateStat(...)
    local args = {...}
    pcall(function()
        game:GetService("ReplicatedStorage")
            :WaitForChild("Functions")
            :WaitForChild("UpdateStat")
            :InvokeServer(unpack(args))
    end)
end

local STATS = {
    "elasticitylevel",
    "frictionlevel",
    "cooldownlevel",
    "fuellevel",
    "jumplevel",
    "speedlevel",
    "breakslevel",
    "sprainslevel",
    "flightlevel",
    "dislocationslevel",
}

FractureTab:Section({ Title = "属性升级" })

FractureTab:Button({
    Title = "全部属性拉满 x10",
    Callback = function()
        for i = 1, 10 do
            for _, stat in ipairs(STATS) do
                updateStat(stat, 100)
            end
        end
        A:SetCore("SendNotification",{Title="完成", Text="所有属性已设为100", Duration=3})
    end
})

FractureTab:Section({ Title = "单独属性开关" })

for _, stat in ipairs(STATS) do
    local displayName = stat:gsub("^%l", string.upper):gsub("level", "")
    FractureTab:Toggle({
        Title = displayName,
        Value = false,
        Callback = function(state)
            updateStat(stat, state and 100 or 0)
        end
    })
end

FractureTab:Section({ Title = "经济" })

FractureTab:Button({
    Title = "设置金钱 15e14",
    Callback = function()
        updateStat("money", 15e14)
        A:SetCore("SendNotification",{Title="金钱", Text="已设置 money = 15e14", Duration=3})
    end
})

FractureTab:Section({ Title = "Gravity Bubble" })

FractureTab:Toggle({
    Title = "Gravity Bubble 启用",
    Value = false,
    Callback = function(state)
        updateStat("Gravity Bubble", 5, true)
        updateStat("utility", "Gravity Bubble", true)
        A:SetCore("SendNotification",{Title="Gravity Bubble", Text=state and "已启用" or "已禁用", Duration=3})
    end
})

FractureTab:Section({ Title = "传送" })

FractureTab:Button({
    Title = "重新传送到本服",
    Callback = function()
        A:SetCore("SendNotification",{Title="传送中...", Text="即将传送", Duration=2})
        task.wait(0.5)
        pcall(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
        end)
    end
})

FractureTab:Section({ Title = "一键全部执行" })

FractureTab:Button({
    Title = "执行全部功能",
    Callback = function()
        for i = 1, 10 do
            for _, stat in ipairs(STATS) do
                updateStat(stat, 100)
            end
        end
        updateStat("money", 15e14)
        updateStat("Gravity Bubble", 5, true)
        updateStat("utility", "Gravity Bubble", true)
        task.wait(0.5)
        pcall(function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
        end)
        A:SetCore("SendNotification",{Title="完成", Text="全部执行完毕", Duration=3})
    end
})

local CatTab = D:Tab({ Title = "猫入侵者", Icon = "cat" })

local weaponCDEnabled = false
local weaponCDThread = nil

CatTab:Toggle({
    Title = "武器无CD",
    Value = false,
    Callback = function(state)
        if state then
            weaponCDEnabled = true
            _G.StopWeaponCD = false
            weaponCDThread = task.spawn(function()
                local ReplicatedStorage = game:GetService("ReplicatedStorage")
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer

                local Weapons = require(ReplicatedStorage.Modules.Storage.Weapons)
                for _, weapon in pairs(Weapons) do
                    if type(weapon) == "table" then
                        weapon.Cooldown = 0
                    end
                end

                local oldGetServerTimeNow = workspace.GetServerTimeNow
                workspace.GetServerTimeNow = function(self, ...)
                    return oldGetServerTimeNow(self, ...) + 999999
                end

                local CooldownEvent = ReplicatedStorage.Events.Cooldown
                for _, conn in ipairs(getconnections(CooldownEvent.Event)) do
                    conn:Disable()
                end

                local WeaponEvent = ReplicatedStorage.Events.WeaponEvent
                _G.WeaponFiring = false

                function startRapidFire()
                    if _G.WeaponFiring then return end
                    _G.WeaponFiring = true
                    task.spawn(function()
                        while _G.WeaponFiring and not _G.StopWeaponCD do
                            local cam = workspace.CurrentCamera
                            local mouse = LocalPlayer:GetMouse()
                            local ray = cam:ViewportPointToRay(mouse.X, mouse.Y)
                            WeaponEvent:FireServer(ray.Direction.Unit, true)
                            task.wait(0.01)
                        end
                        _G.WeaponFiring = false
                    end)
                end

                function stopRapidFire()
                    _G.WeaponFiring = false
                end

                startRapidFire()

                task.spawn(function()
                    while not _G.StopWeaponCD do
                        local char = LocalPlayer.Character
                        if char then
                            for _, tool in ipairs(char:GetChildren()) do
                                if tool:IsA("Tool") then
                                    tool:SetAttribute("LastActivation", 0)
                                    tool:SetAttribute("LastUse", 0)
                                end
                            end
                        end
                        local backpack = LocalPlayer:FindFirstChild("Backpack")
                        if backpack then
                            for _, tool in ipairs(backpack:GetChildren()) do
                                if tool:IsA("Tool") then
                                    tool:SetAttribute("LastActivation", 0)
                                    tool:SetAttribute("LastUse", 0)
                                end
                            end
                        end
                        task.wait(0.1)
                    end
                end)

                task.spawn(function()
                    while not _G.StopWeaponCD do
                        LocalPlayer:SetAttribute("GlobalHealCooldownEnd", 0)
                        LocalPlayer:SetAttribute("MedicMedkitReadyAt", 0)
                        task.wait(0.1)
                    end
                end)

                while not _G.StopWeaponCD do
                    task.wait(1)
                end
            end)
        else
            weaponCDEnabled = false
            _G.StopWeaponCD = true
            if weaponCDThread then
                task.cancel(weaponCDThread)
                weaponCDThread = nil
            end
            if _G.WeaponFiring then
                _G.WeaponFiring = false
            end
        end
    end
})

local CleanTab = D:Tab({Title="清洁键帽", Icon="sparkles"})

local scrubEnabled = false
local scrubThread = nil
CleanTab:Toggle({
    Title = "快速擦键帽",
    Value = false,
    Callback = function(s)
        if s then
            scrubEnabled = true
            _G.StopScrub = false
            scrubThread = task.spawn(function()
                local RS = game:GetService("ReplicatedStorage")
                local remote = RS:WaitForChild("ffrostflame_bridgenet2@1.0.0"):WaitForChild("dataRemoteEvent")
                local args = {{{Action = "Scrub"}, "\a"}}
                local multiplier = 99
                while not _G.StopScrub do
                    for i = 1, multiplier do
                        remote:FireServer(unpack(args))
                    end
                    task.wait(0.01)
                end
            end)
        else
            _G.StopScrub = true
            if scrubThread then task.cancel(scrubThread); scrubThread = nil end
        end
    end
})

local spongeEnabled = false
local spongeThread = nil
CleanTab:Toggle({
    Title = "重复拿起海绵",
    Value = false,
    Callback = function(s)
        if s then
            spongeEnabled = true
            _G.StopSponge = false
            spongeThread = task.spawn(function()
                local plr = game.Players.LocalPlayer
                local char = plr.Character or plr.CharacterAdded:Wait()
                local hum = char:WaitForChild("Humanoid")
                while not _G.StopSponge do
                    local sponge = plr.Backpack:FindFirstChild("Sponge") or char:FindFirstChild("Sponge")
                    if sponge then
                        pcall(function()
                            hum:EquipTool(sponge)
                        end)
                    end
                    task.wait(0.01)
                end
            end)
        else
            _G.StopSponge = true
            if spongeThread then task.cancel(spongeThread); spongeThread = nil end
        end
    end
})

local HitTab = D:Tab({Title="击打动作", Icon="zap"})

local hitEnabled = false
local hitThread = nil

HitTab:Toggle({
    Title = "击飞所有人",
    Value = false,
    Callback = function(s)
        if s then
            hitEnabled = true
            _G.StopHit = false
            hitThread = task.spawn(function()
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                while not _G.StopHit do
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer then
                            local char = player.Character
                            if char then
                                local root = char:FindFirstChild("HumanoidRootPart")
                                if root then
                                    pcall(function()
                                        root.Velocity = Vector3.new(0, 150, 0)
                                    end)
                                end
                            end
                        end
                    end
                    task.wait(0.05)
                end
            end)
        else
            _G.StopHit = true
            if hitThread then
                task.cancel(hitThread)
                hitThread = nil
            end
        end
    end
})

local BlockWarTab = D:Tab({Title="方块战争", Icon="pickaxe"})

local mineEnabled = false
local mineThread = nil
local originalMineSeconds = nil
local originalBreakSeconds = nil
local originalBreakSecondsForHP = nil
local originalBrickHPForBought = nil

BlockWarTab:Toggle({
    Title = "稿子秒挖",
    Value = false,
    Callback = function(s)
        if s then
            mineEnabled = true
            _G.StopMine = false
            mineThread = task.spawn(function()
                local RS = game:GetService("ReplicatedStorage")
                while not _G.StopMine do
                    pcall(function()
                        local MineDefs = require(RS.Modules.Configs.MineDefs)
                        if MineDefs and MineDefs.MineSeconds then
                            if not originalMineSeconds then
                                originalMineSeconds = MineDefs.MineSeconds
                            end
                            MineDefs.MineSeconds = function() return 0 end
                        end
                    end)
                    pcall(function()
                        local BBC = require(RS.Modules.Configs.BlockBreakConfig)
                        if BBC.BreakSeconds then
                            if not originalBreakSeconds then
                                originalBreakSeconds = BBC.BreakSeconds
                            end
                            BBC.BreakSeconds = function() return 0 end
                        end
                        if BBC.BreakSecondsForHP then
                            if not originalBreakSecondsForHP then
                                originalBreakSecondsForHP = BBC.BreakSecondsForHP
                            end
                            BBC.BreakSecondsForHP = function() return 0 end
                        end
                    end)
                    pcall(function()
                        local GUC = require(RS.Modules.Configs.GeneratorUpgradeConfig)
                        if GUC and GUC.BrickHPForBought then
                            if not originalBrickHPForBought then
                                originalBrickHPForBought = GUC.BrickHPForBought
                            end
                            GUC.BrickHPForBought = function() return 0 end
                        end
                    end)
                    task.wait(1)
                end
            end)
        else
            _G.StopMine = true
            if mineThread then task.cancel(mineThread); mineThread = nil end
            pcall(function()
                local RS = game:GetService("ReplicatedStorage")
                local MineDefs = require(RS.Modules.Configs.MineDefs)
                if MineDefs and originalMineSeconds then
                    MineDefs.MineSeconds = originalMineSeconds
                end
                local BBC = require(RS.Modules.Configs.BlockBreakConfig)
                if BBC and originalBreakSeconds then
                    BBC.BreakSeconds = originalBreakSeconds
                end
                if BBC and originalBreakSecondsForHP then
                    BBC.BreakSecondsForHP = originalBreakSecondsForHP
                end
                local GUC = require(RS.Modules.Configs.GeneratorUpgradeConfig)
                if GUC and originalBrickHPForBought then
                    GUC.BrickHPForBought = originalBrickHPForBought
                end
            end)
            originalMineSeconds = nil
            originalBreakSeconds = nil
            originalBreakSecondsForHP = nil
            originalBrickHPForBought = nil
        end
    end
})

local weaponEnabled = false
local weaponThread = nil
local weaponConnections = {}
local originalWeaponData = {}

BlockWarTab:Toggle({
    Title = "近战武器无CD",
    Value = false,
    Callback = function(s)
        if s then
            weaponEnabled = true
            _G.StopWeapon = false
            weaponThread = task.spawn(function()
                local RS = game:GetService("ReplicatedStorage")
                local Players = game:GetService("Players")
                local Run = game:GetService("RunService")
                local LP = Players.LocalPlayer

                pcall(function()
                    local Reg = require(RS.Data.Registries.WeaponRegistry)
                    if Reg and Reg.Entries then
                        for k, v in pairs(Reg.Entries) do
                            if not originalWeaponData[k] then
                                originalWeaponData[k] = {
                                    HitDelay = v.HitDelay,
                                    HitDuration = v.HitDuration,
                                    Cooldown = v.Cooldown,
                                    ComboTimeout = v.ComboTimeout
                                }
                            end
                            v.HitDelay = 0
                            v.HitDuration = 0.05
                            v.Cooldown = 0
                            v.ComboTimeout = 0
                        end
                    end
                end)

                LP:SetAttribute("AttackSpeedMul", 999999)
                local attrConn = LP:GetAttributeChangedSignal("AttackSpeedMul"):Connect(function()
                    if not _G.StopWeapon and LP:GetAttribute("AttackSpeedMul") ~= 999999 then
                        LP:SetAttribute("AttackSpeedMul", 999999)
                    end
                end)
                table.insert(weaponConnections, attrConn)

                LP:SetAttribute("StunEndsAt", 0)
                local stunConn = LP:GetAttributeChangedSignal("StunEndsAt"):Connect(function()
                    if not _G.StopWeapon and (LP:GetAttribute("StunEndsAt") or 0) > workspace:GetServerTimeNow() then
                        LP:SetAttribute("StunEndsAt", 0)
                    end
                end)
                table.insert(weaponConnections, stunConn)

                local heartbeatConn = Run.Heartbeat:Connect(function()
                    if _G.StopWeapon then return end
                    LP:SetAttribute("StunEndsAt", 0)
                    pcall(function()
                        for _, m in ipairs(getloadedmodules and getloadedmodules() or {}) do
                            if m and m.SwingState then
                                m.SwingState.cooldownEndsAt = -1
                                m.SwingState.duration = 0
                            end
                        end
                    end)
                end)
                table.insert(weaponConnections, heartbeatConn)

                local CombatRemotes = RS:WaitForChild("GameEvents"):WaitForChild("CombatRemotes")
                local AtkRemote = CombatRemotes:WaitForChild("Combat_RequestAttack")
                local last = 0

                local atkConn = Run.Heartbeat:Connect(function()
                    if _G.StopWeapon then return end
                    if tick() - last < 0.05 then return end
                    local char = LP.Character
                    local tool = char and char:FindFirstChildWhichIsA("Tool")
                    if tool then
                        local ok, wtype = pcall(function()
                            return require(RS.Data.Registries.WeaponRegistry).GetTypeFromTool(tool)
                        end)
                        if ok and wtype then
                            last = tick()
                            pcall(function()
                                AtkRemote:FireServer(wtype)
                            end)
                        end
                    end
                end)
                table.insert(weaponConnections, atkConn)

                while not _G.StopWeapon do
                    task.wait(1)
                end
            end)
        else
            _G.StopWeapon = true
            if weaponThread then task.cancel(weaponThread); weaponThread = nil end
            for _, conn in ipairs(weaponConnections) do
                pcall(function() conn:Disconnect() end)
            end
            weaponConnections = {}
            pcall(function()
                local RS = game:GetService("ReplicatedStorage")
                local Players = game:GetService("Players")
                local LP = Players.LocalPlayer
                local Reg = require(RS.Data.Registries.WeaponRegistry)
                if Reg and Reg.Entries then
                    for k, v in pairs(Reg.Entries) do
                        if originalWeaponData[k] then
                            v.HitDelay = originalWeaponData[k].HitDelay
                            v.HitDuration = originalWeaponData[k].HitDuration
                            v.Cooldown = originalWeaponData[k].Cooldown
                            v.ComboTimeout = originalWeaponData[k].ComboTimeout
                        end
                    end
                end
                LP:SetAttribute("AttackSpeedMul", 1)
                LP:SetAttribute("StunEndsAt", 0)
            end)
            originalWeaponData = {}
        end
    end
})

local Players=game:GetService("Players")
local player=Players.LocalPlayer
local mouse=player:GetMouse()

local bombState={active=false,thread=nil,fireEvent=nil}
local rocketState={active=false,thread=nil,fireEvent=nil}

local function getBombFire()
    local backpack=player:FindFirstChild("Backpack")
    if not backpack then return nil end
    local timebomb=backpack:FindFirstChild("Timebomb")
    if not timebomb then return nil end
    return timebomb:FindFirstChild("Fire")
end

local function getRocketFire()
    local char=player.Character
    if not char then return nil end
    local launcher=char:FindFirstChild("RocketLauncher")
    if not launcher then return nil end
    return launcher:FindFirstChild("Fire")
end

local function bombLoop()
    local lastRetryTime=0
    while bombState.active do
        local char=player.Character
        if char then
            local rootPart=char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart
            if rootPart then
                if not bombState.fireEvent or not bombState.fireEvent.Parent then
                    local now=tick()
                    if now-lastRetryTime>0.2 then
                        lastRetryTime=now
                        bombState.fireEvent=getBombFire()
                    end
                end
                if bombState.fireEvent then
                    bombState.fireEvent:FireServer(rootPart.CFrame)
                end
            end
        end
        task.wait(0.01)
    end
end

local function rocketLoop()
    while rocketState.active do
        if rocketState.fireEvent then
            rocketState.fireEvent:FireServer(mouse.Hit.p)
        end
        task.wait(0.01)
    end
end

N:Toggle({Title="炸弹",Value=false,Callback=function()
    if bombState.active then
        bombState.active=false
        if bombState.thread then
            task.wait(0.02)
            bombState.thread=nil
        end
    end
    bombState.active=true
    bombState.fireEvent=nil
    bombState.thread=task.spawn(bombLoop)
end})

N:Toggle({Title="火箭筒",Value=false,Callback=function(s)
    if s then
        local fire=getRocketFire()
        if not fire then
            warn("火箭筒 Fire 获取失败")
            return
        end
        rocketState.fireEvent=fire
        rocketState.active=true
        rocketState.thread=task.spawn(rocketLoop)
    else
        rocketState.active=false
        if rocketState.thread then
            task.wait(0.02)
            rocketState.thread=nil
        end
        rocketState.fireEvent=nil
    end
end})

task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/inkkkkkkkk/Theinkremains/refs/heads/main/%E4%BD%9C%E8%80%85%E6%A3%80%E6%B5%8B.lua"))()
    end)
end)

if finishStartup then
    task.spawn(finishStartup)
end

end,function(e)
    local errorText=tostring(e):sub(1,100)
    if updateStartupProgress then
        pcall(updateStartupProgress,100,"加载失败")
    end
    safeNotify("ink_HUB错误",errorText,5)
    task.wait(0.8)
    if finishStartup then pcall(finishStartup) end
end)
