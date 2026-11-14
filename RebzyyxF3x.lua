local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local function c(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props) do obj[k] = v end
    if parent then obj.Parent = parent end
    return obj
end

local BG = Color3.fromRGB(15, 15, 15)
local SIDE = Color3.fromRGB(20, 20, 20)
local BTN = Color3.fromRGB(28, 28, 28)
local BTN_HV = Color3.fromRGB(38, 38, 38)
local STROKE = Color3.fromRGB(45, 45, 45)
local TXT = Color3.fromRGB(220, 220, 220)
local TXT_DIM = Color3.fromRGB(140, 140, 140)

local Main = c("Frame", {
    BackgroundColor3 = BG,
    BorderSizePixel = 0,
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.new(0, 480, 0, 350),
    ClipsDescendants = true
}, gui)
c("UICorner", { CornerRadius = UDim.new(0, 8) }, Main)
c("UIStroke", { Color = STROKE }, Main)

local UIScale = Instance.new("UIScale")
UIScale.Parent = Main
UIScale.Scale = 1

local TopBar = c("Frame", {
    BackgroundColor3 = Color3.fromRGB(18, 18, 18),
    BorderSizePixel = 0,
    Size = UDim2.new(1, 0, 0, 45),
    ZIndex = 2
}, Main)
c("UICorner", { CornerRadius = UDim.new(0, 8) }, TopBar)
c("Frame", {
    BackgroundColor3 = Color3.fromRGB(18, 18, 18),
    BorderSizePixel = 0,
    Position = UDim2.new(0, 0, 0, 22),
    Size = UDim2.new(1, 0, 0, 23),
    ZIndex = 2
}, TopBar)

c("TextLabel", {
    BackgroundTransparency = 1,
    Size = UDim2.new(1, -100, 1, 0),
    Position = UDim2.new(0, 15, 0, 0),
    Font = Enum.Font.GothamBlack,
    Text = "Rebzyyx f3x v67",
    TextColor3 = TXT,
    TextSize = 18,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Center,
    ZIndex = 3
}, TopBar)

local Close = c("TextButton", {
    BackgroundTransparency = 1,
    Size = UDim2.new(0, 35, 1, 0),
    Position = UDim2.new(1, -35, 0, 0),
    Text = "X",
    TextColor3 = TXT_DIM,
    TextSize = 16,
    Font = Enum.Font.GothamBold,
    AutoButtonColor = false,
    ZIndex = 3
}, TopBar)
Close.MouseEnter:Connect(function() Close.TextColor3 = Color3.fromRGB(255, 80, 80) end)
Close.MouseLeave:Connect(function() Close.TextColor3 = TXT_DIM end)

local Min = c("TextButton", {
    BackgroundTransparency = 1,
    Size = UDim2.new(0, 35, 1, 0),
    Position = UDim2.new(1, -70, 0, 0),
    Text = "",
    AutoButtonColor = false,
    ZIndex = 3
}, TopBar)

local MinLine = c("Frame", {
    BackgroundColor3 = TXT_DIM,
    BorderSizePixel = 0,
    Size = UDim2.new(0, 12, 0, 2),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    ZIndex = 3
}, Min)
c("UICorner", { CornerRadius = UDim.new(1, 0) }, MinLine)

Min.MouseEnter:Connect(function() MinLine.BackgroundColor3 = TXT end)
Min.MouseLeave:Connect(function() MinLine.BackgroundColor3 = TXT_DIM end)

local Sidebar = c("Frame", {
    BackgroundColor3 = SIDE,
    BorderSizePixel = 0,
    Position = UDim2.new(0, 0, 0, 45),
    Size = UDim2.new(0, 120, 1, -45)
}, Main)
c("UICorner", { CornerRadius = UDim.new(0, 8) }, Sidebar)
c("Frame", {
    BackgroundColor3 = SIDE,
    BorderSizePixel = 0,
    Position = UDim2.new(0, 0, 1, -20),
    Size = UDim2.new(1, 0, 0, 20)
}, Sidebar)
c("Frame", {
    BackgroundColor3 = SIDE,
    BorderSizePixel = 0,
    Position = UDim2.new(1, -20, 0, 0),
    Size = UDim2.new(0, 20, 1, 0)
}, Sidebar)

local Content = c("Frame", {
    BackgroundTransparency = 1,
    Position = UDim2.new(0, 130, 0, 60),
    Size = UDim2.new(0, 340, 0, 285)
}, Main)

local Pages = {
    c("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Visible = true }, Content),
    c("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Visible = false }, Content),
    c("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Visible = false }, Content)
}

local ActiveIndicator = c("Frame", {
    BackgroundColor3 = TXT,
    BorderSizePixel = 0,
    Position = UDim2.new(0, 0, 0, 29),
    Size = UDim2.new(0, 3, 0, 22)
}, Sidebar)
c("UICorner", { CornerRadius = UDim.new(1, 0) }, ActiveIndicator)

local NavBtns = {}
local function makeNavBtn(text, y)
    local b = c("TextButton", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 18, 0, y),
        Size = UDim2.new(0, 100, 0, 40),
        Font = Enum.Font.GothamBold,
        Text = text,
        TextColor3 = TXT_DIM,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        AutoButtonColor = false
    }, Sidebar)
    b.MouseEnter:Connect(function()
        if b.TextColor3 ~= TXT then b.TextColor3 = Color3.fromRGB(180, 180, 180) end
    end)
    b.MouseLeave:Connect(function()
        if b.TextColor3 ~= TXT then b.TextColor3 = TXT_DIM end
    end)
    table.insert(NavBtns, b)
    return b
end

local N1 = makeNavBtn("基础", 20)
local N2 = makeNavBtn("音乐", 70)
local N3 = makeNavBtn("其它", 120)

local function setPage(idx)
    for i, p in ipairs(Pages) do p.Visible = (i == idx) end
    TweenService:Create(ActiveIndicator, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 29 + (idx - 1) * 50)
    }):Play()
    for i, btn in ipairs(NavBtns) do
        btn.TextColor3 = (i == idx) and TXT or TXT_DIM
    end
end

N1.MouseButton1Down:Connect(function() setPage(1) end)
N2.MouseButton1Down:Connect(function() setPage(2) end)
N3.MouseButton1Down:Connect(function() setPage(3) end)

local function makeBtn(parent, text, pos)
    local b = c("TextButton", {
        BackgroundColor3 = BTN,
        BorderSizePixel = 0,
        Position = pos,
        Size = UDim2.new(0, 100, 0, 36),
        Font = Enum.Font.GothamMedium,
        Text = text,
        TextColor3 = TXT,
        TextSize = 13,
        AutoButtonColor = false
    }, parent)
    c("UICorner", { CornerRadius = UDim.new(0, 6) }, b)
    c("UIStroke", { Color = STROKE }, b)
    b.MouseEnter:Connect(function()
        b.BackgroundColor3 = BTN_HV
        b.UIStroke.Color = Color3.fromRGB(70, 70, 70)
    end)
    b.MouseLeave:Connect(function()
        b.BackgroundColor3 = BTN
        b.UIStroke.Color = STROKE
    end)
    b.MouseButton1Down:Connect(function() b.BackgroundColor3 = Color3.fromRGB(20, 20, 20) end)
    b.MouseButton1Up:Connect(function() b.BackgroundColor3 = BTN_HV end)
    return b
end

local function populate(page, list)
    for i, name in ipairs(list) do
        local col = (i - 1) % 3
        local row = math.floor((i - 1) / 3)
        makeBtn(page, name, UDim2.new(0, col * 110, 0, row * 46))
    end
end

populate(Pages[1], {"火焰", "烟雾", "光照", "闪光", "固定", "解固", "开碰撞", "关碰撞", "隐藏", "显示", "贴图", "底座"})
populate(Pages[2], {"18 Hardstyle", "Epic Sax", "Nyan Cat", "Syria Song", "Trollface", "John Cena", "Wonga", "Horror", "Sp00k"})
populate(Pages[3], {"天空", "地图", "清图", "着火", "隐形", "发光", "Disco", "悬浮", "脚本"})

local ResizeZone = c("TextButton", {
    BackgroundTransparency = 1,
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(1, -30, 1, -30),
    Text = "",
    AutoButtonColor = false,
    ZIndex = 5
}, Main)

local isMin = false
local normalSize = UDim2.new(0, 480, 0, 350)
local minSize = UDim2.new(0, 480, 0, 46)

Min.MouseButton1Down:Connect(function()
    isMin = not isMin
    if isMin then
        Sidebar.Visible = false
        Content.Visible = false
        TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = minSize }):Play()
    else
        TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = normalSize }):Play()
        task.delay(0.3, function()
            Sidebar.Visible = true
            Content.Visible = true
        end)
    end
end)

local drag, dragStart, startPos = false, nil, nil
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        drag, dragStart, startPos = true, input.Position, Main.Position
    end
end)

local rDrag, rStart, rScaleStart = false, nil, nil
ResizeZone.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        rDrag, rStart, rScaleStart = true, input.Position, UIScale.Scale
    end
end)

UIS.InputChanged:Connect(function(input)
    if drag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X / UIScale.Scale, startPos.Y.Scale, startPos.Y.Offset + delta.Y / UIScale.Scale)
    end
    if rDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local deltaX = input.Position.X - rStart.X
        UIScale.Scale = math.clamp(rScaleStart + (deltaX / 300), 0.5, 1.5)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        drag = false
        rDrag = false
    end
end)

Close.MouseButton1Down:Connect(function()
    local absPos = Main.AbsolutePosition
    local absSize = Main.AbsoluteSize
    Main.Visible = false
    
    local pieces = {}
    local colors = {BG, SIDE, BTN, TopBar.BackgroundColor3}
    
    for i = 1, 50 do
        local p = c("Frame", {
            BackgroundColor3 = colors[math.random(1, #colors)],
            BorderSizePixel = 0,
            Position = UDim2.new(0, absPos.X + math.random(0, absSize.X), 0, absPos.Y + math.random(0, absSize.Y)),
            Size = UDim2.new(0, math.random(10, 25), 0, math.random(10, 25)),
            ZIndex = 10
        }, gui)
        
        table.insert(pieces, {
            Frame = p,
            VelX = math.random(-400, 400),
            VelY = math.random(-500, 100),
            RotVel = math.random(-15, 15)
        })
    end
    
    local startTime = tick()
    local conn
    conn = RunService.RenderStepped:Connect(function(dt)
        local elapsed = tick() - startTime
        for _, data in pairs(pieces) do
            if data.Frame and data.Frame.Parent then
                data.VelY = data.VelY + 1200 * dt
                local newX = data.Frame.Position.X.Offset + data.VelX * dt
                local newY = data.Frame.Position.Y.Offset + data.VelY * dt
                data.Frame.Position = UDim2.new(0, newX, 0, newY)
                data.Frame.Rotation = data.Frame.Rotation + data.RotVel * dt * 5
                data.Frame.BackgroundTransparency = math.clamp((elapsed - 0.5) / 1, 0, 1)
            end
        end
        if elapsed > 1.5 then
            conn:Disconnect()
            gui:Destroy()
        end
    end)
end)