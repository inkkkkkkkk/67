local Players=game:GetService("Players")local Workspace=game:GetService("Workspace")local StarterGui=game:GetService("StarterGui")local CoreGui=game:GetService("CoreGui")_G.ConvertedLuaCode=""
local function sendNotification(title,message)pcall(function()StarterGui:SetCore("SendNotification",{Title=title,Text=message,Duration=5})end)end
local function serializeValue(v)if typeof(v)=="Vector3" then
return string.format("Vector3.new(%.3f, %.3f, %.3f)",v.X,v.Y,v.Z)elseif typeof(v)=="Color3" then
return string.format("Color3.new(%.3f, %.3f, %.3f)",v.R,v.G,v.B)elseif typeof(v)=="CFrame" then
local components={v:GetComponents()}for i,comp in ipairs(components)do components[i]=string.format("%.3f",comp)end
return string.format("CFrame.new(%s)",table.concat(components,", "))elseif typeof(v)=="number" then
return string.format("%.3f",v)elseif typeof(v)=="boolean" then
return v and "true" or "false"
elseif typeof(v)=="string" then
return string.format("%q",v)end
return "nil"
end
local function getF3XPartType(obj)if obj.Name=="Head" then
return "Normal"
elseif obj:IsA("SpawnLocation")then
return "Spawn"
elseif obj:IsA("VehicleSeat")then
return "VehicleSeat"
elseif obj:IsA("Seat")then
return "Seat"
elseif obj:IsA("TrussPart")then
return "Truss"
elseif obj:IsA("WedgePart")then
return "Wedge"
elseif obj:IsA("CornerWedgePart")then
return "Corner"
elseif obj:IsA("Part")then
if obj.Shape==Enum.PartType.Cylinder then
return "Cylinder"
elseif obj.Shape==Enum.PartType.Ball then
return "Ball"
else
return "Normal"
end
end
return nil
end
local function isPlayerCharacterPart(obj)for _,plr in ipairs(Players:GetPlayers())do
if plr.Character and obj:IsDescendantOf(plr.Character)then
return true
end
end
return false
end
local function convertMapToF3XTemplate(parent,filterFunc,genMethod,isPlayerScan,anchorSetting,deleteAll,isRelative,textOffset,copyLighting)local partsData={}local partIndex=1
local scannerCF=CFrame.new()if isRelative and player.Character and player.Character.PrimaryPart then
scannerCF=player.Character.PrimaryPart.CFrame
end
for _,obj in ipairs(parent:GetDescendants())do
if obj:IsA("BasePart")and obj.Name~="Terrain" then
local isCharPart=isPlayerCharacterPart(obj)if not isPlayerScan and isCharPart then
continue
end
if filterFunc and not filterFunc(obj)then
continue
end
local partType=getF3XPartType(obj)if not partType then
continue
end
local currentIdx=partIndex
partIndex=partIndex+1
local anchoredStr
if anchorSetting=="anchored" then
anchoredStr="true"
elseif anchorSetting=="unanchored" then
anchoredStr="false"
else
anchoredStr=isCharPart and "true" or serializeValue(obj.Anchored)end
local relativeCF=scannerCF:ToObjectSpace(obj.CFrame)local decs={}if obj.Name=="Head" then
table.insert(decs,string.format("AddMesh(generatedParts[%d])",currentIdx))table.insert(decs,"task.wait(0.15)")table.insert(decs,string.format("SetMeshtype(generatedParts[%d], Enum.MeshType.Head)",currentIdx))table.insert(decs,string.format("MeshResize(generatedParts[%d], Vector3.new(1.250, 1.250, 1.250))",currentIdx))for _,child in ipairs(obj:GetChildren())do
if child:IsA("Decal")then
table.insert(decs,string.format("SpawnDecal(generatedParts[%d], Enum.NormalId.%s)",currentIdx,child.Face.Name))table.insert(decs,"task.wait(0.15)")local cleanAssetId=child.Texture:match("%d+")or child.Texture
table.insert(decs,string.format("AddDecal(generatedParts[%d], %s, Enum.NormalId.%s)",currentIdx,serializeValue(cleanAssetId),child.Face.Name))end
end
else
for _,child in ipairs(obj:GetChildren())do
if child:IsA("Decal")then
table.insert(decs,string.format("SpawnDecal(generatedParts[%d], Enum.NormalId.%s)",currentIdx,child.Face.Name))table.insert(decs,"task.wait(0.15)")local cleanAssetId=child.Texture:match("%d+")or child.Texture
table.insert(decs,string.format("AddDecal(generatedParts[%d], %s, Enum.NormalId.%s)",currentIdx,serializeValue(cleanAssetId),child.Face.Name))elseif child:IsA("SpecialMesh")and child.MeshType==Enum.MeshType.FileMesh then
table.insert(decs,string.format("AddMesh(generatedParts[%d])",currentIdx))table.insert(decs,"task.wait(0.15)")local cleanMeshId=child.MeshId:match("%d+")or child.MeshId
table.insert(decs,string.format("SetMesh(generatedParts[%d], %s)",currentIdx,serializeValue(cleanMeshId)))table.insert(decs,string.format("MeshResize(generatedParts[%d], %s)",currentIdx,serializeValue(child.Scale)))table.insert(decs,string.format("vect(generatedParts[%d], %s)",currentIdx,serializeValue(child.Offset)))elseif child:IsA("SpecialMesh")then
table.insert(decs,string.format("AddMesh(generatedParts[%d])",currentIdx))table.insert(decs,"task.wait(0.15)")table.insert(decs,string.format("SetMeshtype(generatedParts[%d], Enum.MeshType.%s)",currentIdx,child.MeshType.Name))table.insert(decs,string.format("MeshResize(generatedParts[%d], %s)",currentIdx,serializeValue(child.Scale)))table.insert(decs,string.format("vect(generatedParts[%d], %s)",currentIdx,serializeValue(child.Offset)))end
end
end
table.insert(partsData,{idx=currentIdx,partType=partType,cf=serializeValue(relativeCF),size=serializeValue(obj.Size),name=obj.Name,color=serializeValue(obj.Color),materialName=obj.Material.Name,transparency=serializeValue(obj.Transparency),reflectance=serializeValue(obj.Reflectance),canCollide=serializeValue(obj.CanCollide),anchored=anchoredStr,decorations=decs})end
end
local bodyLines={}if genMethod=="default" then
for _,item in ipairs(partsData)do
local idx=item.idx
table.insert(bodyLines,string.format("generatedParts[%d] = CreatePart(%q, %s, workspace)",idx,item.partType,item.cf))table.insert(bodyLines,string.format("Resize(generatedParts[%d], %s, %s)",idx,item.size,item.cf))table.insert(bodyLines,string.format("SetName(generatedParts[%d], %q)",idx,item.name))table.insert(bodyLines,string.format("Color(generatedParts[%d], %s)",idx,item.color))table.insert(bodyLines,string.format("Setmate(generatedParts[%d], Enum.Material.%s)",idx,item.materialName))table.insert(bodyLines,string.format("SetTrans(generatedParts[%d], %s)",idx,item.transparency))table.insert(bodyLines,string.format("reflect(generatedParts[%d], %s)",idx,item.reflectance))table.insert(bodyLines,string.format("SetCollision(generatedParts[%d], %s)",idx,item.canCollide))table.insert(bodyLines,string.format("SetAnchor(%s, generatedParts[%d])",item.anchored,idx))for _,dec in ipairs(item.decorations)do
table.insert(bodyLines,dec)end
end
elseif genMethod=="groups" then
local steps={CreatePart={},Resize={},SetName={},Color={},Setmate={},SetTrans={},reflect={},SetCollision={},SetAnchor={},Decorations={}}for _,item in ipairs(partsData)do
local idx=item.idx
table.insert(steps.CreatePart,string.format("task.spawn(function() generatedParts[%d] = CreatePart(%q, %s, workspace) end)",idx,item.partType,item.cf))table.insert(steps.Resize,string.format("Resize(generatedParts[%d], %s, %s)",idx,item.size,item.cf))table.insert(steps.SetName,string.format("SetName(generatedParts[%d], %q)",idx,item.name))table.insert(steps.Color,string.format("Color(generatedParts[%d], %s)",idx,item.color))table.insert(steps.Setmate,string.format("Setmate(generatedParts[%d], Enum.Material.%s)",idx,item.materialName))table.insert(steps.SetTrans,string.format("SetTrans(generatedParts[%d], %s)",idx,item.transparency))table.insert(steps.reflect,string.format("reflect(generatedParts[%d], %s)",idx,item.reflectance))table.insert(steps.SetCollision,string.format("SetCollision(generatedParts[%d], %s)",idx,item.canCollide))table.insert(steps.SetAnchor,string.format("SetAnchor(%s, generatedParts[%d])",item.anchored,idx))for _,dec in ipairs(item.decorations)do
table.insert(steps.Decorations,dec)end
end
for _,v in ipairs(steps.CreatePart)do table.insert(bodyLines,v)end
table.insert(bodyLines,"task.wait(0.2)")for _,v in ipairs(steps.Resize)do table.insert(bodyLines,v)end
table.insert(bodyLines,"task.wait(0.1)")for _,v in ipairs(steps.SetName)do table.insert(bodyLines,v)end
for _,v in ipairs(steps.Color)do table.insert(bodyLines,v)end
for _,v in ipairs(steps.Setmate)do table.insert(bodyLines,v)end
for _,v in ipairs(steps.SetTrans)do table.insert(bodyLines,v)end
for _,v in ipairs(steps.reflect)do table.insert(bodyLines,v)end
for _,v in ipairs(steps.SetCollision)do table.insert(bodyLines,v)end
for _,v in ipairs(steps.SetAnchor)do table.insert(bodyLines,v)end
for _,v in ipairs(steps.Decorations)do table.insert(bodyLines,v)end
elseif genMethod=="multi" then
table.insert(bodyLines,"function SetupPart(idx, partType, cf, size, name, color, mat, trans, refl, coll, anch)")table.insert(bodyLines,"    generatedParts[idx] = CreatePart(partType, cf, workspace)")table.insert(bodyLines,"    Resize(generatedParts[idx], size, cf)")table.insert(bodyLines,"    SetName(generatedParts[idx], name)")table.insert(bodyLines,"    Color(generatedParts[idx], color)")table.insert(bodyLines,"    Setmate(generatedParts[idx], mat)")table.insert(bodyLines,"    SetTrans(generatedParts[idx], trans)")table.insert(bodyLines,"    reflect(generatedParts[idx], refl)")table.insert(bodyLines,"    SetCollision(generatedParts[idx], coll)")table.insert(bodyLines,"    SetAnchor(anch, generatedParts[idx])")table.insert(bodyLines,"end")table.insert(bodyLines,"task.wait(0.1)")for _,item in ipairs(partsData)do
local idx=item.idx
table.insert(bodyLines,string.format("SetupPart(%d, %q, %s, %s, %q, %s, Enum.Material.%s, %s, %s, %s, %s)",idx,item.partType,item.cf,item.size,item.name,item.color,item.materialName,item.transparency,item.reflectance,item.canCollide,item.anchored))for _,dec in ipairs(item.decorations)do
table.insert(bodyLines,dec)end
end
elseif genMethod=="fast" then
table.insert(bodyLines,"local resizes = {}")table.insert(bodyLines,"local colors = {}")table.insert(bodyLines,"local materials = {}")table.insert(bodyLines,"local anchors = {}")table.insert(bodyLines,"local collisions = {}")table.insert(bodyLines,"local names = {}")table.insert(bodyLines,"task.wait(0.1)")for _,item in ipairs(partsData)do
local idx=item.idx
table.insert(bodyLines,string.format("task.spawn(function() pcall(function() generatedParts[%d] = CreatePart(%q, %s, workspace) end) end)",idx,item.partType,item.cf))end
table.insert(bodyLines,"local maxWait = 3.0")table.insert(bodyLines,"local start = os.clock()")table.insert(bodyLines,"while os.clock() - start < maxWait do")table.insert(bodyLines,"    local completed = true")table.insert(bodyLines,string.format("    for i = 1, %d do",#partsData))table.insert(bodyLines,"        if not generatedParts[i] then")table.insert(bodyLines,"            completed = false")table.insert(bodyLines,"            break")table.insert(bodyLines,"        end")table.insert(bodyLines,"    end")table.insert(bodyLines,"    if completed then break end")table.insert(bodyLines,"    task.wait(0.05)")table.insert(bodyLines,"end")for _,item in ipairs(partsData)do
local idx=item.idx
table.insert(bodyLines,string.format("if generatedParts[%d] then",idx))table.insert(bodyLines,string.format("    table.insert(resizes, {['Part'] = generatedParts[%d], ['CFrame'] = (origin + offset) * %s, ['Size'] = %s})",idx,item.cf,item.size))table.insert(bodyLines,string.format("    table.insert(colors, {['Part'] = generatedParts[%d], ['Color'] = %s, ['UnionColoring'] = false})",idx,item.color))table.insert(bodyLines,string.format("    table.insert(materials, {['Part'] = generatedParts[%d], ['Material'] = Enum.Material.%s, ['Transparency'] = %s, ['Reflectance'] = %s})",idx,item.materialName,item.transparency,item.reflectance))table.insert(bodyLines,string.format("    table.insert(anchors, {['Part'] = generatedParts[%d], ['Anchored'] = %s})",idx,item.anchored))table.insert(bodyLines,string.format("    table.insert(collisions, {['Part'] = generatedParts[%d], ['CanCollide'] = %s})",idx,item.canCollide))table.insert(bodyLines,string.format("    table.insert(names, {['Part'] = generatedParts[%d], ['Name'] = %q})",idx,item.name))table.insert(bodyLines,"end")end
table.insert(bodyLines,"task.wait(0.1)")table.insert(bodyLines,"pcall(function() _({'SyncResize', resizes}) end)")table.insert(bodyLines,"task.wait(0.35)")table.insert(bodyLines,"pcall(function() _({'SyncColor', colors}) end)")table.insert(bodyLines,"task.wait(0.35)")table.insert(bodyLines,"pcall(function() _({'SyncMaterial', materials}) end)")table.insert(bodyLines,"task.wait(0.35)")table.insert(bodyLines,"pcall(function() _({'SyncAnchor', anchors}) end)")table.insert(bodyLines,"task.wait(0.35)")table.insert(bodyLines,"pcall(function() _({'SyncCollision', collisions}) end)")table.insert(bodyLines,"task.wait(0.35)")table.insert(bodyLines,"for _, v in ipairs(names) do if v.Part then pcall(function() _({'SetName', {v.Part}, v.Name}) end) end end")for _,item in ipairs(partsData)do
if #item.decorations>0 then
table.insert(bodyLines,string.format("if generatedParts[%d] then",item.idx))for _,dec in ipairs(item.decorations)do
if dec:match("^task%.wait")then
table.insert(bodyLines,"    "..dec)else
table.insert(bodyLines,string.format("    pcall(function() %s end)",dec))end
end
table.insert(bodyLines,"end")end
end
end
table.insert(bodyLines,"if root then root.Anchored = false end")local defaultHeader={"local me = game.Players.LocalPlayer","local root = me.Character and me.Character:FindFirstChild('HumanoidRootPart')","if root then root.Anchored = true end",}if isRelative then
table.insert(defaultHeader,string.format("local offset = %s",serializeValue(textOffset)))table.insert(defaultHeader,"local origin = me.Character and me.Character.PrimaryPart and me.Character.PrimaryPart.CFrame or CFrame.new()")else
table.insert(defaultHeader,"local offset = Vector3.new(0, 0, 0)")table.insert(defaultHeader,"local origin = CFrame.new()")end
local boilerplate={"local tool","for _,v in ipairs(me:GetDescendants()) do if v.Name == 'SyncAPI' then tool = v.Parent break end end","if not tool then for _,v in ipairs(game.ReplicatedStorage:GetDescendants()) do if v.Name == 'SyncAPI' then tool = v.Parent break end end end","if not tool then warn('yo ur not have f3x') return end","local syncApi = tool:FindFirstChild('SyncAPI')","local remote = syncApi and syncApi:FindFirstChild('ServerEndpoint')","if not remote then warn('no server endpoint found') return end","local function _(args)","    if not remote then return end","    if remote:IsA('RemoteEvent') then","        pcall(remote.FireServer, remote, unpack(args))","    else","        task.spawn(pcall, remote.InvokeServer, remote, unpack(args))","end","end","function CreatePart(partType, cf, parent)","    if not remote then return nil end","    local worldCF = (origin + offset) * cf","    local success, part = pcall(function() return remote:InvokeServer('CreatePart', partType, worldCF, parent) end)","    return success and part or nil","end","function MovePart(part, cf) if not part then return end local worldCF = (origin + offset) * cf _({'SyncMove', {{['Part'] = part, ['CFrame'] = worldCF}}}) end","function Resize(part, size, cf) if not part then return end local worldCF = (origin + offset) * cf _({'SyncResize', {{['Part'] = part, ['CFrame'] = worldCF, ['Size'] = size}}}) end","function SetTrans(part, int) if not part then return end _({'SyncMaterial', {{['Part'] = part, ['Transparency'] = int}}}) end","function Setmate(part, int) if not part then return end _({'SyncMaterial', {{['Part'] = part, ['Material'] = int}}}) end","function Color(part, color) if not part then return end _({'SyncColor', {{['Part'] = part, ['Color'] = color, ['UnionColoring'] = false}}}) end","function SetAnchor(boolean, part) if not part then return end _({'SyncAnchor', {{['Part'] = part, ['Anchored'] = boolean}}}) end","function SetCollision(part, boolean) if not part then return end _({'SyncCollision', {{['Part'] = part, ['CanCollide'] = boolean}}}) end","function AddMesh(part) if not part then return end _({'CreateMeshes', {{['Part'] = part}}}) end","function SetMesh(part, meshid) if not part then return end _({'SyncMesh', {{['Part'] = part, ['MeshId'] = 'rbxassetid://' .. meshid}}}) end","function SpawnDecal(part, side) if not part then return end _({'CreateTextures', {{['Part'] = part, ['Face'] = side, ['TextureType'] = 'Decal'}}}) end","function AddDecal(part, asset, side) if not part then return end _({'SyncTexture', {{['Part'] = part, ['Face'] = side, ['TextureType'] = 'Decal', ['Texture'] = 'rbxassetid://' .. asset}}}) end","function MeshResize(part, size) if not part then return end _({'SyncMesh', {{['Part'] = part, ['Scale'] = size}}}) end","function SetName(part, stringg) if not part then return end _({'SetName', {part}, stringg}) end","function vect(part, of) if not part then return end _({'SyncMesh', {{['Part'] = part, ['Offset'] = of}}}) end","function reflect(part, int) if not part then return end _({'SyncMaterial', {{['Part'] = part, ['Reflectance'] = int}}}) end","function SetMeshtype(part, type) if not part then return end _({'SyncMesh', {{['Part'] = part, ['MeshType'] = type}}}) end","local generatedParts = {}","task.wait(0.1)"}for _,line in ipairs(boilerplate)do
table.insert(defaultHeader,line)end
if copyLighting then
local lighting=game:GetService("Lighting")local timeVal=lighting.ClockTime
local fogEndVal=lighting.FogEnd
local fogColorVal=lighting.FogColor
local r=math.round(fogColorVal.R*255)local g=math.round(fogColorVal.G*255)local b=math.round(fogColorVal.B*255)table.insert(defaultHeader,"-- Copy Lighting HD ADMIN commands")table.insert(defaultHeader,"local hdSignals = game:GetService('ReplicatedStorage'):FindFirstChild('HDAdminClient') and game:GetService('ReplicatedStorage').HDAdminClient:FindFirstChild('Signals')")table.insert(defaultHeader,"local hdRemote = hdSignals and hdSignals:FindFirstChild('RequestCommand')")table.insert(defaultHeader,"if hdRemote then")table.insert(defaultHeader,string.format("    pcall(function() hdRemote:InvokeServer(';time %.2f') end)",timeVal))table.insert(defaultHeader,string.format("    pcall(function() hdRemote:InvokeServer(';fog %d') end)",fogEndVal))table.insert(defaultHeader,string.format("    pcall(function() hdRemote:InvokeServer(';fogcolor %d %d %d') end)",r,g,b))table.insert(defaultHeader,"end")end
if deleteAll then
table.insert(defaultHeader,"local partsToDelete = {}")table.insert(defaultHeader,"for _, v in ipairs(workspace:GetDescendants()) do")table.insert(defaultHeader,"    if v:IsA('BasePart') and v.Name ~= 'Terrain' then")table.insert(defaultHeader,"        local isPlrPart = false")table.insert(defaultHeader,"        for _, p in ipairs(game.Players:GetPlayers()) do")table.insert(defaultHeader,"            if p.Character and v:IsDescendantOf(p.Character) then")table.insert(defaultHeader,"                isPlrPart = true")table.insert(defaultHeader,"                break")table.insert(defaultHeader,"            end")table.insert(defaultHeader,"        end")table.insert(defaultHeader,"        if not isPlrPart then")table.insert(defaultHeader,"            table.insert(partsToDelete, v)")table.insert(defaultHeader,"        end")table.insert(defaultHeader,"    end")table.insert(defaultHeader,"end")table.insert(defaultHeader,"if #partsToDelete > 0 then")table.insert(defaultHeader,"    pcall(function() _({'Remove', partsToDelete}) end)")table.insert(defaultHeader,"end")table.insert(defaultHeader,"task.wait(0.5)")end
local combinedTable={}for _,v in ipairs(defaultHeader)do table.insert(combinedTable,v)end
for _,v in ipairs(bodyLines)do table.insert(combinedTable,v)end
return table.concat(combinedTable,"\n")end
local player=Players.LocalPlayer
local ScreenGui=Instance.new("ScreenGui")local MainFrame=Instance.new("Frame")local TitleBar=Instance.new("Frame")local TitleText=Instance.new("TextLabel")local CloseButton=Instance.new("TextButton")local ControlsFrame=Instance.new("Frame")local DropdownButton1=Instance.new("TextButton")local DropdownButton2=Instance.new("TextButton")local DropdownButton3=Instance.new("TextButton")local DropdownList1=Instance.new("Frame")local UIList1=Instance.new("UIListLayout")local DropdownList2=Instance.new("Frame")local UIList2=Instance.new("UIListLayout")local DropdownList3=Instance.new("Frame")local UIList3=Instance.new("UIListLayout")local TargetNameBox=Instance.new("TextBox")local OffsetBox=Instance.new("TextBox")local DeleteAllButton=Instance.new("TextButton")local CopyLightingButton=Instance.new("TextButton")local ScanButton=Instance.new("TextButton")local TextBox=Instance.new("TextBox")local CopyButton=Instance.new("TextButton")ScreenGui.Name="c00lkiddConverterGui"
ScreenGui.ResetOnSpawn=false
ScreenGui.Parent=CoreGui:FindFirstChild("RobloxGui")or player:WaitForChild("PlayerGui")MainFrame.Name="MainFrame"
MainFrame.Size=UDim2.new(0,500,0,420)MainFrame.Position=UDim2.new(0.5,-250,0.5,-210)MainFrame.BackgroundColor3=Color3.fromRGB(15,15,15)MainFrame.BorderColor3=Color3.fromRGB(255,0,0)MainFrame.BorderSizePixel=2
MainFrame.Active=true
MainFrame.Draggable=true
MainFrame.Parent=ScreenGui
TitleBar.Name="TitleBar"
TitleBar.Size=UDim2.new(1,0,0,25)TitleBar.BackgroundColor3=Color3.fromRGB(180,0,0)TitleBar.BorderSizePixel=0
TitleBar.Parent=MainFrame
TitleText.Name="TitleText"
TitleText.Size=UDim2.new(0.85,0,1,0)TitleText.Position=UDim2.new(0.02,0,0,0)TitleText.BackgroundTransparency=1
TitleText.Text="c00lkidd f3x map code result"
TitleText.TextColor3=Color3.fromRGB(255,255,255)TitleText.TextSize=14
TitleText.Font=Enum.Font.SourceSansBold
TitleText.TextXAlignment=Enum.TextXAlignment.Left
TitleText.Parent=TitleBar
CloseButton.Name="CloseButton"
CloseButton.Size=UDim2.new(0,25,0,25)CloseButton.Position=UDim2.new(1,-25,0,0)CloseButton.BackgroundColor3=Color3.fromRGB(120,0,0)CloseButton.BorderSizePixel=0
CloseButton.Text="X"
CloseButton.TextColor3=Color3.fromRGB(255,255,255)CloseButton.TextSize=14
CloseButton.Font=Enum.Font.SourceSansBold
CloseButton.Parent=TitleBar
ControlsFrame.Name="ControlsFrame"
ControlsFrame.Size=UDim2.new(1,-20,0,110)ControlsFrame.Position=UDim2.new(0,10,0,35)ControlsFrame.BackgroundTransparency=1
ControlsFrame.Parent=MainFrame
DropdownButton1.Name="DropdownButton1"
DropdownButton1.Size=UDim2.new(0,155,0,30)DropdownButton1.Position=UDim2.new(0,0,0,5)DropdownButton1.BackgroundColor3=Color3.fromRGB(25,25,25)DropdownButton1.BorderColor3=Color3.fromRGB(255,0,0)DropdownButton1.BorderSizePixel=1
DropdownButton1.Text="Method: Faster Generating v"
DropdownButton1.TextColor3=Color3.fromRGB(255,255,255)DropdownButton1.Font=Enum.Font.SourceSans
DropdownButton1.TextSize=13
DropdownButton1.ZIndex=10
DropdownButton1.Parent=ControlsFrame
DropdownList1.Name="DropdownList1"
DropdownList1.Size=UDim2.new(0,155,0,120)DropdownList1.Position=UDim2.new(0,0,0,35)DropdownList1.BackgroundColor3=Color3.fromRGB(20,20,20)DropdownList1.BorderColor3=Color3.fromRGB(255,0,0)DropdownList1.BorderSizePixel=1
DropdownList1.Visible=false
DropdownList1.ZIndex=20
DropdownList1.Parent=ControlsFrame
UIList1.Parent=DropdownList1
UIList1.SortOrder=Enum.SortOrder.LayoutOrder
DropdownButton2.Name="DropdownButton2"
DropdownButton2.Size=UDim2.new(0,155,0,30)DropdownButton2.Position=UDim2.new(0,162,0,5)DropdownButton2.BackgroundColor3=Color3.fromRGB(25,25,25)DropdownButton2.BorderColor3=Color3.fromRGB(255,0,0)DropdownButton2.BorderSizePixel=1
DropdownButton2.Text="Scope: Entire Workspace v"
DropdownButton2.TextColor3=Color3.fromRGB(255,255,255)DropdownButton2.Font=Enum.Font.SourceSans
DropdownButton2.TextSize=13
DropdownButton2.ZIndex=10
DropdownButton2.Parent=ControlsFrame
DropdownList2.Name="DropdownList2"
DropdownList2.Size=UDim2.new(0,155,0,90)DropdownList2.Position=UDim2.new(0,162,0,35)DropdownList2.BackgroundColor3=Color3.fromRGB(20,20,20)DropdownList2.BorderColor3=Color3.fromRGB(255,0,0)DropdownList2.BorderSizePixel=1
DropdownList2.Visible=false
DropdownList2.ZIndex=20
DropdownList2.Parent=ControlsFrame
UIList2.Parent=DropdownList2
UIList2.SortOrder=Enum.SortOrder.LayoutOrder
DropdownButton3.Name="DropdownButton3"
DropdownButton3.Size=UDim2.new(0,155,0,30)DropdownButton3.Position=UDim2.new(0,324,0,5)DropdownButton3.BackgroundColor3=Color3.fromRGB(25,25,25)DropdownButton3.BorderColor3=Color3.fromRGB(255,0,0)DropdownButton3.BorderSizePixel=1
DropdownButton3.Text="Anchor: Default v"
DropdownButton3.TextColor3=Color3.fromRGB(255,255,255)DropdownButton3.Font=Enum.Font.SourceSans
DropdownButton3.TextSize=13
DropdownButton3.ZIndex=10
DropdownButton3.Parent=ControlsFrame
DropdownList3.Name="DropdownList3"
DropdownList3.Size=UDim2.new(0,155,0,90)DropdownList3.Position=UDim2.new(0,324,0,35)DropdownList3.BackgroundColor3=Color3.fromRGB(20,20,20)DropdownList3.BorderColor3=Color3.fromRGB(255,0,0)DropdownList3.BorderSizePixel=1
DropdownList3.Visible=false
DropdownList3.ZIndex=20
DropdownList3.Parent=ControlsFrame
UIList3.Parent=DropdownList3
UIList3.SortOrder=Enum.SortOrder.LayoutOrder
TargetNameBox.Name="TargetNameBox"
TargetNameBox.Size=UDim2.new(0,235,0,30)TargetNameBox.Position=UDim2.new(0,0,0,40)TargetNameBox.BackgroundColor3=Color3.fromRGB(25,25,25)TargetNameBox.BorderColor3=Color3.fromRGB(150,0,0)TargetNameBox.BorderSizePixel=1
TargetNameBox.Text=""
TargetNameBox.PlaceholderText="Object name in Workspace..."
TargetNameBox.TextColor3=Color3.fromRGB(255,255,255)TargetNameBox.Font=Enum.Font.SourceSans
TargetNameBox.TextSize=13
TargetNameBox.Visible=false
TargetNameBox.ZIndex=5
TargetNameBox.Parent=ControlsFrame
OffsetBox.Name="OffsetBox"
OffsetBox.Size=UDim2.new(0,235,0,30)OffsetBox.Position=UDim2.new(0,245,0,40)OffsetBox.BackgroundColor3=Color3.fromRGB(25,25,25)OffsetBox.BorderColor3=Color3.fromRGB(150,0,0)OffsetBox.BorderSizePixel=1
OffsetBox.Text=""
OffsetBox.PlaceholderText="Offset X,Y,Z (Blank = Orig Pos)..."
OffsetBox.TextColor3=Color3.fromRGB(255,255,255)OffsetBox.Font=Enum.Font.SourceSans
OffsetBox.TextSize=13
OffsetBox.ZIndex=5
OffsetBox.Parent=ControlsFrame
DeleteAllButton.Name="DeleteAllButton"
DeleteAllButton.Size=UDim2.new(0,110,0,30)DeleteAllButton.Position=UDim2.new(0,0,0,75)DeleteAllButton.BackgroundColor3=Color3.fromRGB(30,30,30)DeleteAllButton.BorderColor3=Color3.fromRGB(255,0,0)DeleteAllButton.BorderSizePixel=1
DeleteAllButton.Text="Delete All: OFF"
DeleteAllButton.TextColor3=Color3.fromRGB(255,255,255)DeleteAllButton.Font=Enum.Font.SourceSansBold
DeleteAllButton.TextSize=13
DeleteAllButton.ZIndex=5
DeleteAllButton.Parent=ControlsFrame
CopyLightingButton.Name="CopyLightingButton"
CopyLightingButton.Size=UDim2.new(0,160,0,30)CopyLightingButton.Position=UDim2.new(0,120,0,75)CopyLightingButton.BackgroundColor3=Color3.fromRGB(30,30,30)CopyLightingButton.BorderColor3=Color3.fromRGB(255,0,0)CopyLightingButton.BorderSizePixel=1
CopyLightingButton.Text="Lighting HD: OFF"
CopyLightingButton.TextColor3=Color3.fromRGB(255,255,255)CopyLightingButton.Font=Enum.Font.SourceSansBold
CopyLightingButton.TextSize=13
CopyLightingButton.ZIndex=5
CopyLightingButton.Parent=ControlsFrame
ScanButton.Name="ScanButton"
ScanButton.Size=UDim2.new(1,-290,0,30)ScanButton.Position=UDim2.new(0,290,0,75)ScanButton.BackgroundColor3=Color3.fromRGB(140,0,0)ScanButton.BorderColor3=Color3.fromRGB(255,0,0)ScanButton.BorderSizePixel=1
ScanButton.Text="SCAN MAP"
ScanButton.TextColor3=Color3.fromRGB(255,255,255)ScanButton.Font=Enum.Font.SourceSansBold
ScanButton.TextSize=14
ScanButton.ZIndex=5
ScanButton.Parent=ControlsFrame
TextBox.Name="CodeOutputBox"
TextBox.Size=UDim2.new(1,-20,1,-210)TextBox.Position=UDim2.new(0,10,0,155)TextBox.BackgroundColor3=Color3.fromRGB(25,25,25)TextBox.BorderColor3=Color3.fromRGB(80,0,0)TextBox.Text="Please select your options above, then click SCAN MAP."
TextBox.ClearTextOnFocus=false
TextBox.MultiLine=true
TextBox.TextEditable=false
TextBox.TextWrapped=true
TextBox.TextColor3=Color3.fromRGB(220,220,220)TextBox.TextSize=11
TextBox.Font=Enum.Font.Code
TextBox.TextXAlignment=Enum.TextXAlignment.Left
TextBox.TextYAlignment=Enum.TextYAlignment.Top
TextBox.ZIndex=2
TextBox.Parent=MainFrame
CopyButton.Name="CopyButton"
CopyButton.Size=UDim2.new(1,-20,0,35)CopyButton.Position=UDim2.new(0,10,1,-45)CopyButton.BackgroundColor3=Color3.fromRGB(140,0,0)CopyButton.BorderColor3=Color3.fromRGB(255,0,0)CopyButton.BorderSizePixel=1
CopyButton.Text="COPY CODE"
CopyButton.TextColor3=Color3.fromRGB(255,255,255)CopyButton.TextSize=13
CopyButton.Font=Enum.Font.SourceSansBold
CopyButton.ZIndex=2
CopyButton.Parent=MainFrame
local currentMethod="fast"
local currentScope="workspace"
local currentAnchor="default"
local currentDeleteAll=false
local currentCopyLighting=false
local function updateLayout()if currentScope=="specific" then
TargetNameBox.Visible=true
TargetNameBox.PlaceholderText="Object name in Workspace..."
OffsetBox.Position=UDim2.new(0,245,0,40)OffsetBox.Size=UDim2.new(0,235,0,30)elseif currentScope=="player" then
TargetNameBox.Visible=true
TargetNameBox.PlaceholderText="Player Name (blank for self)..."
OffsetBox.Position=UDim2.new(0,245,0,40)OffsetBox.Size=UDim2.new(0,235,0,30)else
TargetNameBox.Visible=false
OffsetBox.Position=UDim2.new(0,0,0,40)OffsetBox.Size=UDim2.new(1,0,0,30)end
end
local methodOptions={{Name="Faster Generating",Key="fast"},{Name="Default",Key="default"},{Name="multi-funcs",Key="multi"},{Name="groups funcs",Key="groups"}}for _,m in ipairs(methodOptions)do
local btn=Instance.new("TextButton")btn.Size=UDim2.new(1,0,0,30)btn.BackgroundColor3=Color3.fromRGB(30,30,30)btn.BorderSizePixel=0
btn.Text=m.Name
btn.TextColor3=Color3.fromRGB(220,220,220)btn.Font=Enum.Font.SourceSans
btn.TextSize=13
btn.ZIndex=21
btn.Parent=DropdownList1
btn.MouseButton1Click:Connect(function()currentMethod=m.Key
DropdownButton1.Text="Method: "..m.Name.." v"
DropdownList1.Visible=false
end)btn.MouseEnter:Connect(function()btn.BackgroundColor3=Color3.fromRGB(50,50,50)end)btn.MouseLeave:Connect(function()btn.BackgroundColor3=Color3.fromRGB(30,30,30)end)end
local scopeOptions={{Name="Entire Workspace",Key="workspace"},{Name="Specific Object Name",Key="specific"},{Name="Player Character",Key="player"}}for _,s in ipairs(scopeOptions)do
local btn=Instance.new("TextButton")btn.Size=UDim2.new(1,0,0,30)btn.BackgroundColor3=Color3.fromRGB(30,30,30)btn.BorderSizePixel=0
btn.Text=s.Name
btn.TextColor3=Color3.fromRGB(220,220,220)btn.Font=Enum.Font.SourceSans
btn.TextSize=13
btn.ZIndex=21
btn.Parent=DropdownList2
btn.MouseButton1Click:Connect(function()currentScope=s.Key
DropdownButton2.Text="Scope: "..s.Name.." v"
DropdownList2.Visible=false
updateLayout()end)btn.MouseEnter:Connect(function()btn.BackgroundColor3=Color3.fromRGB(50,50,50)end)btn.MouseLeave:Connect(function()btn.BackgroundColor3=Color3.fromRGB(30,30,30)end)end
local anchorOptions={{Name="Default",Key="default"},{Name="Unanchored",Key="unanchored"},{Name="Anchored",Key="anchored"}}for _,a in ipairs(anchorOptions)do
local btn=Instance.new("TextButton")btn.Size=UDim2.new(1,0,0,30)btn.BackgroundColor3=Color3.fromRGB(30,30,30)btn.BorderSizePixel=0
btn.Text=a.Name
btn.TextColor3=Color3.fromRGB(220,220,220)btn.Font=Enum.Font.SourceSans
btn.TextSize=13
btn.ZIndex=21
btn.Parent=DropdownList3
btn.MouseButton1Click:Connect(function()currentAnchor=a.Key
DropdownButton3.Text="Anchor: "..a.Name.." v"
DropdownList3.Visible=false
end)btn.MouseEnter:Connect(function()btn.BackgroundColor3=Color3.fromRGB(50,50,50)end)btn.MouseLeave:Connect(function()btn.BackgroundColor3=Color3.fromRGB(30,30,30)end)end
DropdownButton1.MouseButton1Click:Connect(function()DropdownList1.Visible=not DropdownList1.Visible
DropdownList2.Visible=false
DropdownList3.Visible=false
end)DropdownButton2.MouseButton1Click:Connect(function()DropdownList2.Visible=not DropdownList2.Visible
DropdownList1.Visible=false
DropdownList3.Visible=false
end)DropdownButton3.MouseButton1Click:Connect(function()DropdownList3.Visible=not DropdownList3.Visible
DropdownList1.Visible=false
DropdownList2.Visible=false
end)DeleteAllButton.MouseButton1Click:Connect(function()currentDeleteAll=not currentDeleteAll
if currentDeleteAll then
DeleteAllButton.Text="Delete All: ON"
DeleteAllButton.BackgroundColor3=Color3.fromRGB(0,120,0)else
DeleteAllButton.Text="Delete All: OFF"
DeleteAllButton.BackgroundColor3=Color3.fromRGB(30,30,30)end
end)CopyLightingButton.MouseButton1Click:Connect(function()currentCopyLighting=not currentCopyLighting
if currentCopyLighting then
CopyLightingButton.Text="Lighting HD: ON"
CopyLightingButton.BackgroundColor3=Color3.fromRGB(0,120,0)else
CopyLightingButton.Text="Lighting HD: OFF"
CopyLightingButton.BackgroundColor3=Color3.fromRGB(30,30,30)end
end)updateLayout()ScanButton.MouseButton1Click:Connect(function()local parent=Workspace
local isPlayerScan=false
if currentScope=="specific" then
local name=TargetNameBox.Text
if name=="" then
sendNotification("Error","Please input an object name!")TextBox.Text="Error: Text box is empty. Please specify a Workspace child name."
return
end
local target=Workspace:FindFirstChild(name)if not target then
sendNotification("Error","Object not found!")TextBox.Text=string.format("Error: Could not find '%s' in game.Workspace.",name)return
end
parent=target
elseif currentScope=="player" then
isPlayerScan=true
local targetName=TargetNameBox.Text
if targetName=="" then
targetName=player.Name
end
local targetPlayer=Players:FindFirstChild(targetName)if not targetPlayer then
sendNotification("Error","Player not found!")TextBox.Text=string.format("Error: Could not find player '%s' in the game server.",targetName)return
end
if not targetPlayer.Character then
sendNotification("Error","Character not loaded!")TextBox.Text=string.format("Error: Player '%s' does not have a character loaded.",targetName)return
end
parent=targetPlayer.Character
end
local rawText=OffsetBox.Text
local isRelative=(rawText~="")and not string.match(rawText,"^%s*$")local scanOffset=Vector3.new(0,0,0)if isRelative then
local offX,offY,offZ=string.match(rawText,"([%d.-]+)%s*,%s*([%d.-]+)%s*,%s*([%d.-]+)")if offX and offY and offZ then
scanOffset=Vector3.new(tonumber(offX)or 0,tonumber(offY)or 0,tonumber(offZ)or 0)end
end
sendNotification("Converter Active","Converting map into your selected F3X format...")TextBox.Text="Scanning elements... please stand by..."
task.wait(0.1)local success,result=pcall(function()return convertMapToF3XTemplate(parent,nil,currentMethod,isPlayerScan,currentAnchor,currentDeleteAll,isRelative,scanOffset,currentCopyLighting)end)if success then
_G.ConvertedLuaCode=result
local codeLength=#result
if codeLength<15000 then
TextBox.Text=result
TitleText.Text="c00lkidd f3x map code result"
else
TextBox.Text=string.format("--- GENERATION COMPLETE ---\n\n".."Total Script Size: %d characters.\n".."The generated script is too large to display safely inside Roblox without freezing or crashing the client.\n\n".."Please click the 'COPY CODE' button below. The entire, undivided script will be copied directly to your clipboard using your executor's clipboard functions.",codeLength)TitleText.Text="c00lkidd f3x map code result (Ready in Clipboard)"
end
sendNotification("Converter Finished","Conversion complete! Click COPY CODE below.")else
TextBox.Text="Execution Error:\n"..tostring(result)sendNotification("Converter Error","An error occurred.")end
end)CopyButton.MouseButton1Click:Connect(function()local setResultCode=_G.ConvertedLuaCode or ""
local setClipboard=setclipboard or toclipboard or set_clipboard
if setClipboard and setResultCode~="" and setResultCode~="Please select your options above, then click SCAN MAP." then
setClipboard(setResultCode)CopyButton.Text="COPIED!"
CopyButton.BackgroundColor3=Color3.fromRGB(40,40,40)task.wait(1)CopyButton.Text="COPY CODE"
CopyButton.BackgroundColor3=Color3.fromRGB(140,0,0)else
CopyButton.Text="FAILED (EXECUTOR NOT SUPPORTED OR EMPTY)"
task.wait(1.5)CopyButton.Text="COPY CODE"
end
end)CloseButton.MouseButton1Click:Connect(function()ScreenGui:Destroy()end)