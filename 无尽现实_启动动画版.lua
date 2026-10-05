local function safeNotify(title, text, duration)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 3
        })
    end)
end

local A = game:GetService("StarterGui")

local function gradient(text, startColor, endColor)
    local result = ""
    local chars = {}
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        table.insert(chars, uchar)
    end
    local length = #chars
    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = startColor.R + (endColor.R - startColor.R) * t
        local g = startColor.G + (endColor.G - startColor.G) * t
        local b = startColor.B + (endColor.B - startColor.B) * t
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>',
            math.floor(r * 255), math.floor(g * 255), math.floor(b * 255), chars[i])
    end
    return result
end


-- ==================== ink 启动动画 ====================
-- 图标会从屏幕下方缓慢进入中心，左右摇摆两次后移动到左下角并永久显示。
-- ImageLabel 不接收任何输入，不会拦截点击/触摸。
pcall(function()
    local TweenService = game:GetService("TweenService")
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local PlayerGui = Players.LocalPlayer and Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    local guiParent = PlayerGui or CoreGui
    if typeof(gethui) == "function" then
        local ok, hui = pcall(gethui)
        if ok and hui then guiParent = hui end
    end

    local oldGui = guiParent:FindFirstChild("ink_StartupIcon")
    if oldGui then
        oldGui:Destroy()
    end

    local startupGui = Instance.new("ScreenGui")
    startupGui.Name = "ink_StartupIcon"
    startupGui.IgnoreGuiInset = true
    startupGui.ResetOnSpawn = false
    startupGui.DisplayOrder = 999999
    startupGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    startupGui.Parent = guiParent

    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.BackgroundTransparency = 1
    icon.BorderSizePixel = 0
    icon.Size = UDim2.fromOffset(100, 100)
    icon.AnchorPoint = Vector2.new(0.5, 0.5)
    icon.Image = "rbxassetid://136433830518234"
    icon.ImageTransparency = 0
    icon.Active = false
    icon.ZIndex = 999999
    -- 从屏幕下方开始
    icon.Position = UDim2.new(0.5, 0, 1, 130)
    icon.Parent = startupGui

    local function tween(position, duration, easingStyle, easingDirection)
        local tw = TweenService:Create(
            icon,
            TweenInfo.new(
                duration,
                easingStyle or Enum.EasingStyle.Quad,
                easingDirection or Enum.EasingDirection.InOut
            ),
            {Position = position}
        )
        tw:Play()
        tw.Completed:Wait()
    end

    -- 动画必须完整结束后，才继续执行下面的主 UI
    do
        -- 从屏幕下方慢慢移动到屏幕中心
        tween(
            UDim2.new(0.5, 0, 0.5, 0),
            1.35,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        )

        -- 左右摇两下
        for _ = 1, 2 do
            tween(
                UDim2.new(0.5, -38, 0.5, 0),
                0.22,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut
            )
            tween(
                UDim2.new(0.5, 38, 0.5, 0),
                0.44,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut
            )
            tween(
                UDim2.new(0.5, 0, 0.5, 0),
                0.22,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.InOut
            )
        end

        -- 在移动到左下角之前先出现一次短暂的全屏模糊。
        -- 模糊动画结束的瞬间，立刻开始左下角移动动画。
        local Lighting = game:GetService("Lighting")
        local blur = Lighting:FindFirstChild("ink_StartupBlur")
        if blur then
            blur:Destroy()
        end

        blur = Instance.new("BlurEffect")
        blur.Name = "ink_StartupBlur"
        blur.Size = 24
        blur.Parent = Lighting

        local blurTween = TweenService:Create(
            blur,
            TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = 0}
        )
        blurTween:Play()
        blurTween.Completed:Wait()
        blur:Destroy()

        -- 模糊刚结束，立即开始移动到左下角，放在左下角原有状态栏的上方
        tween(
            UDim2.new(0, 80, 1, -170),
            0.9,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.InOut
        )

        -- 停留在这里，不销毁、不隐藏，也不参与任何交互
        icon.Position = UDim2.new(0, 80, 1, -170)
    end
end)
-- ==================== 启动动画结束 ====================

local WindUI
do
    local ok, result = pcall(function()
        local code = game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/1.6.66/main.lua", true)
        if type(code) ~= "string" or #code < 100 then
            error("WindUI下载内容为空")
        end
        local loader = loadstring(code)
        if type(loader) ~= "function" then
            error("WindUI loadstring失败")
        end
        return loader()
    end)
    if not ok or not result then
        pcall(function()
            A:SetCore("SendNotification", {
                Title="WindUI加载失败",
                Text="请检查执行器的HttpGet/loadstring支持",
                Duration=6
            })
        end)
        error("WindUI加载失败: "..tostring(result))
    end
    WindUI = result
end

local windowOk, D = pcall(function()
    return WindUI:CreateWindow({
        Title="ink_无尽现实",
        Author="@墨水依旧",
        Icon="rbxassetid://71953031400395",
        Folder="ink_HUB",
        NewElements=true,
        HideSearchBar=false,
    })
end)
if not windowOk or not D then
    warn("[ink_HUB] UI创建失败:", tostring(D))
    return
end

C = D

pcall(function()
    C:EditOpenButton({
        Title = "Project_ink_无尽现实",
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
                elseif obj.Text == "@墨水依旧" then
                    obj.TextColor3 = Color3.fromRGB(125,125,125)
                end
            end
        end
    end

    recolor(CoreGui)
    task.delay(0.25, function()
        pcall(function() recolor(CoreGui) end)
    end)
    task.delay(0.8, function()
        pcall(function() recolor(CoreGui) end)
    end)
end)



local Z = D:Tab({Title="公告", Icon="bell"})
Z:Paragraph({
    Title = "欢迎使用 ink_无尽现实",
    Desc = "作者：墨水依旧\n墨水快手号:zczczczc766\n徽章只能使用你已经拥有的徽章id\n开源并公开的4000+\n没惹你就开源的自动给我30年寿命\n公益脚本禁止倒卖",
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


local GeneralTab = D:Tab({Title="主要功能", Icon="settings"})
local LocalPlayer = game:GetService("Players").LocalPlayer

local speedEnabled = false
local speedValue = 16
GeneralTab:Toggle({
    Title = "启用修改速度",
    Value = false,
    Callback = function(v)
        speedEnabled = v
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = v and speedValue or 16 end
    end
})
GeneralTab:Slider({
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

GeneralTab:Button({
    Title = "飞行",
    Callback = function()
        local ok, err = pcall(function()
            local src = game:HttpGet("https://raw.githubusercontent.com/inkkkkkkkk/Theinkremains/refs/heads/main/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%AC.lua")
            local fn = loadstring(src)
            if type(fn) ~= "function" then error("飞行脚本加载失败") end
            fn()
        end)
        if not ok then warn("[ink_HUB] 飞行加载失败:", tostring(err)) end
    end
})

local noclipEnabled = false
local function applyNoClip(state)
    local char = LocalPlayer.Character
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not state
        end
    end
end
GeneralTab:Toggle({
    Title = "穿墙",
    Value = false,
    Callback = function(v)
        noclipEnabled = v
        applyNoClip(v)
    end
})
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.15)
    if noclipEnabled then applyNoClip(true) end
    if speedEnabled then
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = speedValue end
    end
end)

local Lighting = game:GetService("Lighting")
local originalBrightness = Lighting.Brightness
local originalAmbient = Lighting.Ambient
local originalOutdoorAmbient = Lighting.OutdoorAmbient
GeneralTab:Toggle({
    Title = "高亮",
    Value = false,
    Callback = function(v)
        if v then
            Lighting.Brightness = 5
            Lighting.Ambient = Color3.new(1,1,1)
            Lighting.OutdoorAmbient = Color3.new(1,1,1)
        else
            Lighting.Brightness = originalBrightness
            Lighting.Ambient = originalAmbient
            Lighting.OutdoorAmbient = originalOutdoorAmbient
        end
    end
})

GeneralTab:Slider({
    Title = "视野",
    Value = {Min=60, Max=120, Default=70},
    Step = 1,
    Callback = function(v)
        local cam = workspace.CurrentCamera
        if cam then cam.FieldOfView = v end
    end
})

GeneralTab:Toggle({
    Title = "第三人称",
    Value = false,
    Callback = function(v)
        local ok = pcall(function()
            if v then
                LocalPlayer.CameraMode = Enum.CameraMode.Classic
            else
                LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
            end
        end)
        if not ok then warn("[ink_无尽现实] 第三人称设置失败") end
    end
})

local proximityConnection
local proximityChanged = {}
local function enableInstantProximity()
    local workspaceService = workspace
    local function patch(prompt)
        if not prompt or not prompt:IsA("ProximityPrompt") then return end
        if not proximityChanged[prompt] then
            proximityChanged[prompt] = prompt.HoldDuration
        end
        prompt.HoldDuration = 0.0001
        prompt.Changed:Connect(function()
            if prompt.Parent and prompt.HoldDuration > 0.0001 then
                prompt.HoldDuration = 0.0001
            end
        end)
    end
    for _, obj in ipairs(workspaceService:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then patch(obj) end
    end
    proximityConnection = workspaceService.DescendantAdded:Connect(function(obj)
        if obj:IsA("ProximityPrompt") then patch(obj) end
    end)
end
local function disableInstantProximity()
    if proximityConnection then
        proximityConnection:Disconnect()
        proximityConnection = nil
    end
    for prompt, oldValue in pairs(proximityChanged) do
        if prompt and prompt.Parent then
            pcall(function() prompt.HoldDuration = oldValue end)
        end
    end
    proximityChanged = {}
end
GeneralTab:Toggle({
    Title = "瞬间交互",
    Value = false,
    Callback = function(v)
        if v then
            enableInstantProximity()
        else
            disableInstantProximity()
        end
    end
})


local function forceChatVisible()
    local player = game:GetService("Players").LocalPlayer
    local StarterGui = game:GetService("StarterGui")
    local CoreGui = game:GetService("CoreGui")
    pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true) end)
    local chatFrame = player.PlayerGui:FindFirstChild("Chat") or CoreGui:FindFirstChild("Chat")
    if chatFrame and chatFrame:IsA("Frame") then
        chatFrame.Visible = true
    end
    local textChat = game:GetService("TextChatService")
    pcall(function()
        textChat.ChatWindowConfiguration.Enabled = true
        textChat.ChatInputBarConfiguration.Enabled = true
    end)
    local chatWindows = CoreGui:FindFirstChild("ChatWindow")
    if chatWindows then chatWindows.Visible = true end
end
GeneralTab:Button({Title="强制显示聊天框", Callback=forceChatVisible})

GeneralTab:Button({Title="传送到电梯", Callback=function()
    local character = LocalPlayer.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(16.983798980713, 33.711311340332, 572.31719970703)
    end
end})

GeneralTab:Button({
    Title = "打开电梯",
    Callback = function()
        local rs = game:GetService("ReplicatedStorage")
        local remote = rs:FindFirstChild("OpenElevator")
        if remote and remote:IsA("RemoteEvent") then
            pcall(function() remote:FireServer() end)
        end
    end
})

GeneralTab:Toggle({
    Title = "无限金钱",
    Value = false,
    Callback = function(v)
        local player = game:GetService("Players").LocalPlayer
        local leaderstats = player:FindFirstChild("leaderstats")
        local money = leaderstats and leaderstats:FindFirstChild("Money")
        if not money then return end
        if v then
            if _G.inkInfiniteMoneyConnection then
                _G.inkInfiniteMoneyConnection:Disconnect()
            end
            _G.inkInfiniteMoneyConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if money and money.Parent then money.Value = 999999999 end
                local values = game:GetService("ReplicatedStorage"):FindFirstChild("PlayerValues")
                local m2 = values and values:FindFirstChild("Money")
                if m2 then m2.Value = 999999999 end
            end)
        else
            if _G.inkInfiniteMoneyConnection then
                _G.inkInfiniteMoneyConnection:Disconnect()
                _G.inkInfiniteMoneyConnection = nil
            end
        end
    end
})

local corpseCrashEnabled = false
GeneralTab:Toggle({
    Title = "尸体崩服",
    Value = false,
    Callback = function(v)
        corpseCrashEnabled = v
        if not v then return end
        task.spawn(function()
            while corpseCrashEnabled do
                local char = game:GetService("Players").LocalPlayer.Character
                local deathEvent = char and char:FindFirstChild("DeathEvent")
                if deathEvent then pcall(function() deathEvent:FireServer() end) end
                task.wait()
            end
        end)
    end
})

GeneralTab:Button({
    Title = "清理尸体",
    Callback = function()
        local npcs = workspace:FindFirstChild("NPCS")
        if npcs then
            for _, obj in ipairs(npcs:GetChildren()) do
                if obj:IsA("Model") and obj.Name == "Ragdoll" then
                    pcall(function() obj:Destroy() end)
                end
            end
        end
        local char = game:GetService("Players").LocalPlayer.Character
        if char then pcall(function() char:BreakJoints() end) end
    end
})

GeneralTab:Button({
    Title = "解锁三级表情",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local playerGui = player:FindFirstChild("PlayerGui")
        if not playerGui then return end
        local gui = playerGui:FindFirstChild("Emoteui") or playerGui:FindFirstChild("EmoteGui")
        if not gui then return end
        local buttonThree = gui:FindFirstChild("ButtonThree")
        local container1 = gui:FindFirstChild("container1")
        local container2 = gui:FindFirstChild("container2")
        local container3 = gui:FindFirstChild("container3")
        if not buttonThree or not container1 or not container2 or not container3 then return end
        local function removeLock(obj)
            local lock = obj:FindFirstChild("Lock")
            if lock then pcall(function() lock:Destroy() end) end
            obj.ChildAdded:Connect(function(child)
                if child.Name == "Lock" then pcall(function() child:Destroy() end) end
            end)
        end
        removeLock(buttonThree)
        buttonThree.MouseButton1Click:Connect(function()
            container1.Visible = false
            container2.Visible = false
            container3.Visible = true
        end)
    end
})

local customLobbyBadgeId = ""
GeneralTab:Button({
    Title = "自定义大厅徽章",
    Callback = function()
        local badgeId = tonumber(customLobbyBadgeId)
        if not badgeId then return end
        pcall(function()
            local args = { badgeId }
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ChangeDisplayBadge"):FireServer(unpack(args))
        end)
    end
})

GeneralTab:Input({
    Title = "输入徽章ID",
    Placeholder = "请输入徽章ID",
    Callback = function(text)
        customLobbyBadgeId = tostring(text or ""):gsub("%s+", "")
    end
})

local P = D:Tab({Title="透视", Icon="eye"})

local espEnabled = false
local outlineEnabled = false
local tracersEnabled = false
local entityNameEnabled = false
local entityOutlineEnabled = false
local entityTracerEnabled = false
local itemNameEnabled = false
local itemOutlineEnabled = false
local itemTracerEnabled = false

local ESP_PLAYER_COLOR = Color3.fromRGB(255, 255, 255)
local ESP_ENTITY_COLOR = Color3.fromRGB(255, 170, 0)
local ESP_ITEM_COLOR = Color3.fromRGB(0, 255, 100)
local ESP_OUTLINE_COLOR = Color3.fromRGB(255, 255, 255)

local espconfig = {
    espcolor = ESP_PLAYER_COLOR,
    outlinecolor = ESP_OUTLINE_COLOR,
    outlinefillcolor = ESP_PLAYER_COLOR,
    tracercolor = ESP_PLAYER_COLOR,
    espsize = 16,
    tracersize = 2,
    outlinetransparency = 0,
    outlinefilltransparency = 1,
    tracerposition = "底部",
}

local espobjects = {}
local playerconnections = {}
local tracerlines = {}
local activehighlights = {}
local entityLabels = {}
local entityHighlights = {}
local entityTracers = {}
local itemEspEnabled = false
local itemEspConnections = {}
local itemEspObjects = {}
local itemHighlights = {}
local itemTracers = {}

local serverItemESPEnabled = false
local serverItemESPHighlights = {}
local serverItemESPLabels = {}
local serverItemESPTracers = {}
local serverItemESPConnections = {}


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function createBillboard(adornee, text, color, name)
    if not adornee then return nil end
    local gui = Instance.new("BillboardGui")
    gui.Name = name
    gui.Adornee = adornee
    gui.AlwaysOnTop = true
    gui.Size = UDim2.new(0, 180, 0, 28)
    gui.StudsOffset = Vector3.new(0, 2.5, 0)
    local label = Instance.new("TextLabel")
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = text
    label.TextColor3 = color
    label.TextStrokeTransparency = 0
    label.TextSize = 14
    label.Font = Enum.Font.SourceSansBold
    label.Parent = gui
    gui.Parent = adornee
    return gui
end

local function getPlayerWeapon(player)
    if not player.Character then return "无" end
    local tool = player.Character:FindFirstChildWhichIsA("Tool")
    return tool and tool.Name or "无"
end

local function createesp(player)
    if player == LocalPlayer or espobjects[player] then return end
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local gui = createBillboard(root, player.Name, ESP_PLAYER_COLOR, "ink_PlayerESP")
    if gui then espobjects[player] = { Name = gui } end
end

local function removeesp(player)
    if espobjects[player] then
        pcall(function() espobjects[player].Name:Destroy() end)
        espobjects[player] = nil
    end
end

local function applyhighlighttocharacter(player, character)
    if not character then return end
    local userid = player.UserId
    if activehighlights[userid] then activehighlights[userid]:Destroy() end
    local highlighter = Instance.new("Highlight")
    highlighter.FillTransparency = espconfig.outlinefilltransparency
    highlighter.OutlineTransparency = espconfig.outlinetransparency
    highlighter.OutlineColor = ESP_PLAYER_COLOR
    highlighter.FillColor = ESP_PLAYER_COLOR
    highlighter.Adornee = character
    highlighter.Parent = character
    activehighlights[userid] = highlighter
end

local function removehighlight(player)
    local userid = player.UserId
    if activehighlights[userid] then activehighlights[userid]:Destroy(); activehighlights[userid] = nil end
    if playerconnections[userid] then
        for _, conn in pairs(playerconnections[userid]) do pcall(function() conn:Disconnect() end) end
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
            if outlineEnabled then applyhighlighttocharacter(player, character) end
            table.insert(playerconnections[userid], humanoid.Died:Connect(function() removehighlight(player) end))
        end)
    end
    table.insert(playerconnections[userid], player.CharacterAdded:Connect(oncharacteradded))
    if player.Character then oncharacteradded(player.Character) end
end

local function updateesp()
    for player, esp in pairs(espobjects) do
        local character = player.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        local gui = esp.Name
        if root and gui then
            gui.Enabled = true
            local label = gui:FindFirstChildOfClass("TextLabel")
            if label then
                local distance = (Camera.CFrame.Position - root.Position).Magnitude
                label.Text = player.Name .. " | " .. math.floor(distance) .. " 米 | " .. getPlayerWeapon(player)
                label.TextColor3 = ESP_PLAYER_COLOR
            end
        elseif gui then
            gui.Enabled = false
        end
    end
end

local function clearPlayerTracers()
    for _, line in pairs(tracerlines) do pcall(function() line:Remove() end) end
    tracerlines = {}
end

local function createtracers()
    clearPlayerTracers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local line = Drawing.new("Line")
            line.Thickness = espconfig.tracersize
            line.Transparency = 1
            line.Color = ESP_PLAYER_COLOR
            line.Visible = false
            tracerlines[player] = line
        end
    end
end

local function updatetracers()
    local screenHeight = Camera.ViewportSize.Y
    local fromY = screenHeight
    if espconfig.tracerposition == "中间" then fromY = screenHeight / 2
    elseif espconfig.tracerposition == "顶部" then fromY = 0 end
    for player, line in pairs(tracerlines) do
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local screenpos, onscreen = Camera:WorldToViewportPoint(root.Position)
            line.From = Vector2.new(Camera.ViewportSize.X / 2, fromY)
            line.To = Vector2.new(screenpos.X, screenpos.Y)
            line.Color = ESP_PLAYER_COLOR
            line.Visible = onscreen and tracersEnabled
        else
            line.Visible = false
        end
    end
end

local function clearEntityESP()
    for obj, gui in pairs(entityLabels) do if gui then pcall(function() gui:Destroy() end) end entityLabels[obj] = nil end
    for obj, highlight in pairs(entityHighlights) do if highlight then pcall(function() highlight:Destroy() end) end entityHighlights[obj] = nil end
    for obj, line in pairs(entityTracers) do if line then pcall(function() line:Remove() end) end entityTracers[obj] = nil end
end

local function isNPCModel(obj)
    if not obj or not obj:IsA("Model") then return false end
    if Players:GetPlayerFromCharacter(obj) then return false end
    local hum = obj:FindFirstChildOfClass("Humanoid")
    local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Head")
    return hum ~= nil and root ~= nil
end

local function addEntityESP(obj)
    if not isNPCModel(obj) then return end
    local root = obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Head")
    if not root then return end
    if entityLabels[obj] then pcall(function() entityLabels[obj]:Destroy() end) end
    if entityNameEnabled then
        entityLabels[obj] = createBillboard(root, obj.Name, ESP_ENTITY_COLOR, "ink_EntityESP")
    end
    if entityOutlineEnabled then
        local highlight = Instance.new("Highlight")
        highlight.FillTransparency = espconfig.outlinefilltransparency
        highlight.OutlineTransparency = espconfig.outlinetransparency
        highlight.FillColor = ESP_ENTITY_COLOR
        highlight.OutlineColor = ESP_ENTITY_COLOR
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Adornee = obj
        highlight.Parent = obj
        entityHighlights[obj] = highlight
    end
    if entityTracerEnabled and not entityTracers[obj] then
        local line = Drawing.new("Line")
        line.Thickness = espconfig.tracersize
        line.Transparency = 1
        line.Color = ESP_ENTITY_COLOR
        line.Visible = false
        entityTracers[obj] = line
    end
end

local function setEntityESP(state)
    clearEntityESP()
    if not state and not entityNameEnabled and not entityOutlineEnabled and not entityTracerEnabled then return end
    for _, obj in ipairs(workspace:GetDescendants()) do if isNPCModel(obj) then addEntityESP(obj) end end
end

local function getServerPuzzleItems()
    local puzzle = workspace:FindFirstChild("Puzzle")
    return puzzle and puzzle:FindFirstChild("Puzzles")
end

local function clearServerItemESP()
    for part, highlight in pairs(serverItemESPHighlights) do
        if highlight then pcall(function() highlight:Destroy() end) end
        serverItemESPHighlights[part] = nil
    end
    for part, gui in pairs(serverItemESPLabels) do
        if gui then pcall(function() gui:Destroy() end) end
        serverItemESPLabels[part] = nil
    end
    for part, line in pairs(serverItemESPTracers) do
        if line then pcall(function() line:Remove() end) end
        serverItemESPTracers[part] = nil
    end
end

local function highlightServerItemPart(part)
    if not serverItemESPEnabled then return end
    if not part or not part:IsA("BasePart") then return end

    if itemOutlineEnabled and not serverItemESPHighlights[part] then
        local highlight = Instance.new("Highlight")
        highlight.Parent = part
        highlight.Adornee = part
        highlight.FillTransparency = espconfig.outlinefilltransparency
        highlight.FillColor = ESP_ITEM_COLOR
        highlight.OutlineTransparency = espconfig.outlinetransparency
        highlight.OutlineColor = ESP_ITEM_COLOR
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Enabled = true
        serverItemESPHighlights[part] = highlight
    end

    if itemNameEnabled and not serverItemESPLabels[part] then
        local gui = createBillboard(part, part.Name, ESP_ITEM_COLOR, "ink_ServerItemESP")
        serverItemESPLabels[part] = gui
    end

    if itemTracerEnabled and not serverItemESPTracers[part] then
        local line = Drawing.new("Line")
        line.Thickness = espconfig.tracersize
        line.Transparency = 1
        line.Color = ESP_ITEM_COLOR
        line.Visible = false
        serverItemESPTracers[part] = line
    end
end

local function addServerItemESP(obj)
    if not serverItemESPEnabled or not obj then return end

    -- 服务器脚本原本的物品区域：workspace.Puzzle.Puzzles
    if obj:IsA("Model") then
        for _, part in ipairs(obj:GetDescendants()) do
            if part:IsA("BasePart") then
                highlightServerItemPart(part)
            end
        end
    elseif obj:IsA("BasePart") then
        highlightServerItemPart(obj)
    elseif obj:IsA("Tool") then
        local handle = obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart", true)
        if handle then highlightServerItemPart(handle) end
    end
end

local function scanServerPuzzleItems()
    local puzzles = getServerPuzzleItems()
    if not puzzles then return end

    for _, obj in ipairs(puzzles:GetDescendants()) do
        if obj:IsA("BasePart") then
            highlightServerItemPart(obj)
        end
    end
end

local function scanHeldTools()
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            for _, obj in ipairs(character:GetChildren()) do
                if obj:IsA("Tool") then
                    addServerItemESP(obj)
                end
            end
        end
    end
end

local function setServerItemESP(state)
    serverItemESPEnabled = state
    for _, conn in pairs(serverItemESPConnections) do
        pcall(function() conn:Disconnect() end)
    end
    serverItemESPConnections = {}
    clearServerItemESP()
    if not state then return end

    local puzzles = getServerPuzzleItems()
    if puzzles then
        scanServerPuzzleItems()
        table.insert(serverItemESPConnections, puzzles.DescendantAdded:Connect(function(obj)
            task.defer(function()
                if obj:IsA("BasePart") then
                    highlightServerItemPart(obj)
                elseif obj:IsA("Model") or obj:IsA("Tool") then
                    addServerItemESP(obj)
                end
            end)
        end))
        table.insert(serverItemESPConnections, puzzles.DescendantRemoving:Connect(function(obj)
            if obj:IsA("BasePart") then
                local highlight = serverItemESPHighlights[obj]
                if highlight then pcall(function() highlight:Destroy() end) end
                serverItemESPHighlights[obj] = nil
                local gui = serverItemESPLabels[obj]
                if gui then pcall(function() gui:Destroy() end) end
                serverItemESPLabels[obj] = nil
                local line = serverItemESPTracers[obj]
                if line then pcall(function() line:Remove() end) end
                serverItemESPTracers[obj] = nil
            end
        end))
    end

    scanHeldTools()
    table.insert(serverItemESPConnections, workspace.DescendantAdded:Connect(function(obj)
        if obj:IsA("Tool") then
            task.defer(function() addServerItemESP(obj) end)
        end
    end))
    table.insert(serverItemESPConnections, Players.PlayerAdded:Connect(function(player)
        table.insert(serverItemESPConnections, player.CharacterAdded:Connect(function(character)
            task.defer(function()
                for _, obj in ipairs(character:GetChildren()) do
                    if obj:IsA("Tool") then addServerItemESP(obj) end
                end
            end)
        end))
    end))

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            table.insert(serverItemESPConnections, player.Character.ChildAdded:Connect(function(obj)
                if obj:IsA("Tool") then task.defer(function() addServerItemESP(obj) end) end
            end))
        end
    end
end

local function clearItemESP()
    for obj, gui in pairs(itemEspObjects) do if gui then pcall(function() gui:Destroy() end) end itemEspObjects[obj] = nil end
    for obj, highlight in pairs(itemHighlights) do if highlight then pcall(function() highlight:Destroy() end) end itemHighlights[obj] = nil end
    for obj, line in pairs(itemTracers) do if line then pcall(function() line:Remove() end) end itemTracers[obj] = nil end
end

local function isItemObject(obj) return obj and obj:IsA("Tool") end

local function addItemESP(obj)
    if not isItemObject(obj) then return end
    local adornee = obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart", true)
    if not adornee then return end
    if itemEspObjects[obj] then pcall(function() itemEspObjects[obj]:Destroy() end) end
    if itemNameEnabled then
        itemEspObjects[obj] = createBillboard(adornee, obj.Name, ESP_ITEM_COLOR, "ink_ItemESP")
    end
    if itemOutlineEnabled then
        local highlight = Instance.new("Highlight")
        highlight.FillTransparency = espconfig.outlinefilltransparency
        highlight.OutlineTransparency = espconfig.outlinetransparency
        highlight.FillColor = ESP_ITEM_COLOR
        highlight.OutlineColor = ESP_ITEM_COLOR
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Adornee = adornee
        highlight.Parent = adornee
        itemHighlights[obj] = highlight
    end
    if itemTracerEnabled and not itemTracers[obj] then
        local line = Drawing.new("Line")
        line.Thickness = espconfig.tracersize
        line.Transparency = 1
        line.Color = ESP_ITEM_COLOR
        line.Visible = false
        itemTracers[obj] = line
    end
end

local function setItemESP(state)
    itemEspEnabled = state
    for _, conn in pairs(itemEspConnections) do pcall(function() conn:Disconnect() end) end
    itemEspConnections = {}
    clearItemESP()
    if not state and not itemNameEnabled and not itemOutlineEnabled and not itemTracerEnabled then return end
    for _, obj in ipairs(workspace:GetDescendants()) do if isItemObject(obj) then addItemESP(obj) end end
    table.insert(itemEspConnections, workspace.DescendantAdded:Connect(function(obj)
        if isItemObject(obj) then task.defer(function() addItemESP(obj) end) end
    end))
    table.insert(itemEspConnections, workspace.DescendantRemoving:Connect(function(obj)
        if itemEspObjects[obj] then pcall(function() itemEspObjects[obj]:Destroy() end); itemEspObjects[obj] = nil end
        if itemTracers[obj] then pcall(function() itemTracers[obj]:Remove() end); itemTracers[obj] = nil end
    end))
end

local function updateExtraTracers()
    for obj, gui in pairs(entityLabels) do
        local root = obj and (obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Head"))
        if root and gui then
            gui.Enabled = entityNameEnabled
            local label = gui:FindFirstChildOfClass("TextLabel")
            if label then
                label.Text = obj.Name .. " | " .. math.floor((Camera.CFrame.Position - root.Position).Magnitude) .. " 米"
                label.TextColor3 = ESP_ENTITY_COLOR
            end
        elseif gui then gui.Enabled = false end
    end
    for obj, gui in pairs(itemEspObjects) do
        local part = obj and (obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart", true))
        if part and gui then
            gui.Enabled = itemNameEnabled
            local label = gui:FindFirstChildOfClass("TextLabel")
            if label then
                label.Text = obj.Name .. " | " .. math.floor((Camera.CFrame.Position - part.Position).Magnitude) .. " 米"
                label.TextColor3 = ESP_ITEM_COLOR
            end
        elseif gui then gui.Enabled = false end
    end
    local screenHeight = Camera.ViewportSize.Y
    local fromY = screenHeight
    if espconfig.tracerposition == "中间" then fromY = screenHeight / 2
    elseif espconfig.tracerposition == "顶部" then fromY = 0 end
    for obj, line in pairs(entityTracers) do
        local root = obj and (obj:FindFirstChild("HumanoidRootPart") or obj:FindFirstChild("Head"))
        if root then
            local pos, visible = Camera:WorldToViewportPoint(root.Position)
            line.From = Vector2.new(Camera.ViewportSize.X / 2, fromY)
            line.To = Vector2.new(pos.X, pos.Y)
            line.Color = ESP_ENTITY_COLOR
            line.Visible = entityTracerEnabled and visible
        else line.Visible = false end
    end
    for obj, line in pairs(itemTracers) do
        local part = obj and (obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart", true))
        if part then
            local pos, visible = Camera:WorldToViewportPoint(part.Position)
            line.From = Vector2.new(Camera.ViewportSize.X / 2, fromY)
            line.To = Vector2.new(pos.X, pos.Y)
            line.Color = ESP_ITEM_COLOR
            line.Visible = itemTracerEnabled and visible
        else line.Visible = false end
    end
end

local function updateServerItemESPVisuals()
    local screenHeight = Camera.ViewportSize.Y
    local fromY = screenHeight
    if espconfig.tracerposition == "中间" then fromY = screenHeight / 2
    elseif espconfig.tracerposition == "顶部" then fromY = 0 end

    for part, gui in pairs(serverItemESPLabels) do
        if part and part.Parent and gui then
            gui.Enabled = itemNameEnabled
            local label = gui:FindFirstChildOfClass("TextLabel")
            if label then
                label.Text = part.Name .. " | " .. math.floor((Camera.CFrame.Position - part.Position).Magnitude) .. " 米"
                label.TextColor3 = ESP_ITEM_COLOR
            end
        elseif gui then gui.Enabled = false end
    end

    for part, line in pairs(serverItemESPTracers) do
        if part and part.Parent then
            local pos, visible = Camera:WorldToViewportPoint(part.Position)
            line.From = Vector2.new(Camera.ViewportSize.X / 2, fromY)
            line.To = Vector2.new(pos.X, pos.Y)
            line.Color = ESP_ITEM_COLOR
            line.Thickness = espconfig.tracersize
            line.Visible = itemTracerEnabled and visible and serverItemESPEnabled
        else
            line.Visible = false
        end
    end
end

Players.PlayerAdded:Connect(function(p)
    if p ~= LocalPlayer then
        p.CharacterAdded:Connect(function()
            task.wait(0.1)
            if espEnabled then createesp(p) end
            if outlineEnabled and p.Character then applyhighlighttocharacter(p, p.Character) end
        end)
        if espEnabled then createesp(p) end
        if outlineEnabled then setupplayerhighlight(p) end
        if tracersEnabled then
            local line = Drawing.new("Line")
            line.Thickness = espconfig.tracersize
            line.Color = ESP_PLAYER_COLOR
            line.Visible = false
            tracerlines[p] = line
        end
    end
end)

Players.PlayerRemoving:Connect(function(p)
    removeesp(p)
    removehighlight(p)
    if tracerlines[p] then tracerlines[p]:Remove(); tracerlines[p] = nil end
end)

for _, p in pairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then
        p.CharacterAdded:Connect(function()
            task.wait(0.1)
            if espEnabled then createesp(p) end
            if outlineEnabled and p.Character then applyhighlighttocharacter(p, p.Character) end
        end)
    end
end

local espGroup = P:Section({ Title = "基础透视", Opened = true })
espGroup:Toggle({Title="透视", Value=false, Callback=function(v)
    espEnabled = v
    if v then
        for _, p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then createesp(p) end end
        RunService:BindToRenderStep("ESPUpdate", Enum.RenderPriority.Camera.Value + 1, updateesp)
    else
        for p in pairs(espobjects) do removeesp(p) end
        RunService:UnbindFromRenderStep("ESPUpdate")
    end
end})

espGroup:Toggle({Title="追踪线", Value=false, Callback=function(v)
    tracersEnabled = v
    if v then
        createtracers()
        RunService:BindToRenderStep("Tracers", Enum.RenderPriority.Camera.Value + 1, updatetracers)
    else
        RunService:UnbindFromRenderStep("Tracers")
        clearPlayerTracers()
    end
end})

espGroup:Toggle({Title="轮廓", Value=false, Callback=function(v)
    outlineEnabled = v
    if v then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                setupplayerhighlight(p)
                if p.Character then applyhighlighttocharacter(p, p.Character) end
            end
        end
    else
        for _, p in ipairs(Players:GetPlayers()) do removehighlight(p) end
    end
end})

espGroup:Toggle({Title="透视实体", Value=false, Callback=function(v)
    entityNameEnabled = v
    setEntityESP(entityNameEnabled or entityOutlineEnabled or entityTracerEnabled)
end})

espGroup:Toggle({Title="实体轮廓", Value=false, Callback=function(v)
    entityOutlineEnabled = v
    setEntityESP(entityNameEnabled or entityOutlineEnabled or entityTracerEnabled)
end})

espGroup:Toggle({Title="实体追踪线", Value=false, Callback=function(v)
    entityTracerEnabled = v
    setEntityESP(entityNameEnabled or entityOutlineEnabled or entityTracerEnabled)
end})

espGroup:Toggle({Title="透视物品", Value=false, Callback=function(v)
    itemNameEnabled = v
    setServerItemESP(itemNameEnabled or itemOutlineEnabled or itemTracerEnabled)
end})

espGroup:Toggle({Title="物品轮廓", Value=false, Callback=function(v)
    itemOutlineEnabled = v
    setServerItemESP(itemNameEnabled or itemOutlineEnabled or itemTracerEnabled)
end})

espGroup:Toggle({Title="物品追踪线", Value=false, Callback=function(v)
    itemTracerEnabled = v
    setServerItemESP(itemNameEnabled or itemOutlineEnabled or itemTracerEnabled)
end})

espGroup:Slider({Title="追踪线粗细", Value={Min=1,Max=6,Default=2}, Step=1, Callback=function(v)
    espconfig.tracersize = v
end})
espGroup:Dropdown({Title="追踪线位置", Values={"底部","中间","顶部"}, Value="底部", Callback=function(v)
    espconfig.tracerposition = v
end})

RunService:BindToRenderStep("ink_ExtraESPTracers", Enum.RenderPriority.Camera.Value + 2, function()
    updateExtraTracers()
    updateServerItemESPVisuals()
end)

