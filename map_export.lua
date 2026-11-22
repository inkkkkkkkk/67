local me = game.Players.LocalPlayer
local root = me.Character and me.Character:FindFirstChild('HumanoidRootPart')
if root then root.Anchored = true end
local offset = Vector3.new(0, 0, 0)
local origin = CFrame.new()
local tool
for _,v in ipairs(me:GetDescendants()) do if v.Name == 'SyncAPI' then tool = v.Parent break end end
if not tool then for _,v in ipairs(game.ReplicatedStorage:GetDescendants()) do if v.Name == 'SyncAPI' then tool = v.Parent break end end end
if not tool then warn('⚠️你没有手持F3X工具!') return end
local syncApi = tool:FindFirstChild('SyncAPI')
local remote = syncApi and syncApi:FindFirstChild('ServerEndpoint')
if not remote then warn('⚠️找不到SyncAPI服务端接口') return end
local function _(args)
    if not remote then return end
    if remote:IsA('RemoteEvent') then
        pcall(remote.FireServer, remote, unpack(args))
    else
        task.spawn(pcall, remote.InvokeServer, remote, unpack(args))
end
end
function CreatePart(partType, cf, parent)
    if not remote then return nil end
    local worldCF = (origin + offset) * cf
    local success, part = pcall(function() return remote:InvokeServer('CreatePart', partType, worldCF, parent) end)
    return success and part or nil
end
function MovePart(part, cf) if not part then return end local worldCF = (origin + offset) * cf _({'SyncMove', {{['Part'] = part, ['CFrame'] = worldCF}}}) end
function Resize(part, size, cf) if not part then return end local worldCF = (origin + offset) * cf _({'SyncResize', {{['Part'] = part, ['CFrame'] = worldCF, ['Size'] = size}}}) end
function SetTrans(part, int) if not part then return end _({'SyncMaterial', {{['Part'] = part, ['Transparency'] = int}}}) end
function Setmate(part, int) if not part then return end _({'SyncMaterial', {{['Part'] = part, ['Material'] = int}}}) end
function Color(part, color) if not part then return end _({'SyncColor', {{['Part'] = part, ['Color'] = color, ['UnionColoring'] = false}}}) end
function SetAnchor(boolean, part) if not part then return end _({'SyncAnchor', {{['Part'] = part, ['Anchored'] = boolean}}}) end
function SetCollision(part, boolean) if not part then return end _({'SyncCollision', {{['Part'] = part, ['CanCollide'] = boolean}}}) end
function AddMesh(part) if not part then return end _({'CreateMeshes', {{['Part'] = part}}}) end
function SetMesh(part, meshid) if not part then return end _({'SyncMesh', {{['Part'] = part, ['MeshId'] = 'rbxassetid://' .. meshid}}}) end
function SpawnDecal(part, side) if not part then return end _({'CreateTextures', {{['Part'] = part, ['Face'] = side, ['TextureType'] = 'Decal'}}}) end
function AddDecal(part, asset, side) if not part then return end _({'SyncTexture', {{['Part'] = part, ['Face'] = side, ['TextureType'] = 'Decal', ['Texture'] = 'rbxassetid://' .. asset}}}) end
function MeshResize(part, size) if not part then return end _({'SyncMesh', {{['Part'] = part, ['Scale'] = size}}}) end
function SetName(part, stringg) if not part then return end _({'SetName', {part}, stringg}) end
function vect(part, of) if not part then return end _({'SyncMesh', {{['Part'] = part, ['Offset'] = of}}}) end
function reflect(part, int) if not part then return end _({'SyncMaterial', {{['Part'] = part, ['Reflectance'] = int}}}) end
function SetMeshtype(part, type) if not part then return end _({'SyncMesh', {{['Part'] = part, ['MeshType'] = type}}}) end
local generatedParts = {}
task.wait(0.1)
local resizes = {}
local colors = {}
local materials = {}
local anchors = {}
local collisions = {}
local names = {}
task.wait(0.1)
task.spawn(function() pcall(function() generatedParts[1] = CreatePart("Normal", CFrame.new(7.885, 105.685, 270.588, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[2] = CreatePart("Normal", CFrame.new(-80.662, 48.007, 106.076, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[3] = CreatePart("Normal", CFrame.new(0.000, 15.000, -30.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[4] = CreatePart("Spawn", CFrame.new(12.000, 0.500, 68.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[5] = CreatePart("Normal", CFrame.new(-22.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[6] = CreatePart("Normal", CFrame.new(-26.000, 4.800, 45.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[7] = CreatePart("Normal", CFrame.new(-10.000, 19.200, 47.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[8] = CreatePart("Normal", CFrame.new(-26.000, 19.200, 43.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[9] = CreatePart("Normal", CFrame.new(-13.000, 15.000, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[10] = CreatePart("Normal", CFrame.new(-13.500, 13.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[11] = CreatePart("Normal", CFrame.new(-12.500, 13.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[12] = CreatePart("Normal", CFrame.new(-10.000, 15.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[13] = CreatePart("Normal", CFrame.new(-13.500, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[14] = CreatePart("Normal", CFrame.new(-7.500, 13.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[15] = CreatePart("Normal", CFrame.new(-6.500, 13.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[16] = CreatePart("Normal", CFrame.new(-7.000, 15.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[17] = CreatePart("Normal", CFrame.new(-6.500, 9.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[18] = CreatePart("Normal", CFrame.new(-10.000, 6.600, 47.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[19] = CreatePart("Normal", CFrame.new(-4.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[20] = CreatePart("Normal", CFrame.new(-26.000, 16.800, 45.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[21] = CreatePart("Normal", CFrame.new(-26.000, 16.800, 39.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[22] = CreatePart("Normal", CFrame.new(-26.000, 14.400, 43.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[23] = CreatePart("Normal", CFrame.new(-26.000, 9.600, 43.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[24] = CreatePart("Normal", CFrame.new(-26.000, 12.000, 43.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[25] = CreatePart("Normal", CFrame.new(-26.000, 7.200, 43.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[26] = CreatePart("Normal", CFrame.new(-17.000, 14.400, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[27] = CreatePart("Normal", CFrame.new(-23.500, 14.400, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[28] = CreatePart("Normal", CFrame.new(-3.500, 14.400, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[29] = CreatePart("Normal", CFrame.new(-17.500, 12.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[30] = CreatePart("Normal", CFrame.new(-24.000, 12.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[31] = CreatePart("Normal", CFrame.new(-23.500, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[32] = CreatePart("Normal", CFrame.new(-17.000, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[33] = CreatePart("Normal", CFrame.new(-24.000, 7.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[34] = CreatePart("Normal", CFrame.new(-17.500, 7.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[35] = CreatePart("Normal", CFrame.new(-10.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[36] = CreatePart("Normal", CFrame.new(-16.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[37] = CreatePart("Normal", CFrame.new(-22.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[38] = CreatePart("Normal", CFrame.new(-0.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[39] = CreatePart("Normal", CFrame.new(-6.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[40] = CreatePart("Normal", CFrame.new(-13.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[41] = CreatePart("Normal", CFrame.new(-18.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[42] = CreatePart("Normal", CFrame.new(-24.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[43] = CreatePart("Normal", CFrame.new(-10.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[44] = CreatePart("Normal", CFrame.new(-16.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[45] = CreatePart("Normal", CFrame.new(-26.000, 4.800, 39.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[46] = CreatePart("Normal", CFrame.new(-26.000, 4.800, 33.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[47] = CreatePart("Normal", CFrame.new(-26.000, 4.800, 27.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[48] = CreatePart("Normal", CFrame.new(12.000, 19.200, 47.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[49] = CreatePart("Normal", CFrame.new(-26.000, 19.200, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[50] = CreatePart("Normal", CFrame.new(-26.000, 19.200, 31.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[51] = CreatePart("Normal", CFrame.new(8.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[52] = CreatePart("Normal", CFrame.new(2.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[53] = CreatePart("Normal", CFrame.new(-26.000, 16.800, 27.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[54] = CreatePart("Normal", CFrame.new(-26.000, 16.800, 33.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[55] = CreatePart("Normal", CFrame.new(-26.000, 15.000, 28.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[56] = CreatePart("Normal", CFrame.new(-26.000, 13.200, 27.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[57] = CreatePart("Normal", CFrame.new(-26.000, 13.200, 28.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[58] = CreatePart("Normal", CFrame.new(-26.000, 15.000, 31.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[59] = CreatePart("Normal", CFrame.new(-26.000, 9.600, 27.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[60] = CreatePart("Normal", CFrame.new(-26.000, 13.200, 33.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[61] = CreatePart("Normal", CFrame.new(-26.000, 13.200, 34.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[62] = CreatePart("Normal", CFrame.new(-26.000, 15.000, 34.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[63] = CreatePart("Normal", CFrame.new(-26.000, 9.600, 34.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[64] = CreatePart("Normal", CFrame.new(-26.500, 6.600, 31.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[65] = CreatePart("Normal", CFrame.new(-26.000, 12.000, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[66] = CreatePart("Normal", CFrame.new(-26.000, 14.400, 37.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[67] = CreatePart("Normal", CFrame.new(-26.000, 9.600, 37.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[68] = CreatePart("Normal", CFrame.new(-26.000, 7.200, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[69] = CreatePart("Normal", CFrame.new(-4.000, 12.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[70] = CreatePart("Normal", CFrame.new(1.500, 14.400, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[71] = CreatePart("Normal", CFrame.new(0.500, 12.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[72] = CreatePart("Normal", CFrame.new(6.000, 14.400, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[73] = CreatePart("Normal", CFrame.new(-3.500, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[74] = CreatePart("Normal", CFrame.new(7.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[75] = CreatePart("Normal", CFrame.new(-4.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[76] = CreatePart("Normal", CFrame.new(5.500, 12.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[77] = CreatePart("Normal", CFrame.new(9.000, 15.000, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[78] = CreatePart("Normal", CFrame.new(1.500, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[79] = CreatePart("Normal", CFrame.new(-4.000, 7.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[80] = CreatePart("Normal", CFrame.new(14.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[81] = CreatePart("Normal", CFrame.new(-26.000, 19.200, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[82] = CreatePart("Normal", CFrame.new(14.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[83] = CreatePart("Normal", CFrame.new(-26.000, 14.400, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[84] = CreatePart("Normal", CFrame.new(-26.000, 12.000, 24.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[85] = CreatePart("Normal", CFrame.new(-26.000, 9.600, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[86] = CreatePart("Normal", CFrame.new(-26.000, 7.200, 24.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[87] = CreatePart("Normal", CFrame.new(8.500, 13.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[88] = CreatePart("Normal", CFrame.new(9.500, 13.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[89] = CreatePart("Normal", CFrame.new(12.000, 15.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[90] = CreatePart("Normal", CFrame.new(6.000, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[91] = CreatePart("Normal", CFrame.new(0.500, 7.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[92] = CreatePart("Normal", CFrame.new(18.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[93] = CreatePart("Normal", CFrame.new(-26.000, 4.800, 21.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[94] = CreatePart("Normal", CFrame.new(2.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[95] = CreatePart("Normal", CFrame.new(6.500, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[96] = CreatePart("Normal", CFrame.new(-10.000, 19.200, 20.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[97] = CreatePart("Normal", CFrame.new(-26.000, 19.200, 19.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[98] = CreatePart("Normal", CFrame.new(20.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[99] = CreatePart("Normal", CFrame.new(-26.000, 16.800, 21.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[100] = CreatePart("Normal", CFrame.new(-26.000, 14.400, 20.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[101] = CreatePart("Normal", CFrame.new(-26.000, 12.000, 19.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[102] = CreatePart("Normal", CFrame.new(-26.000, 9.600, 20.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[103] = CreatePart("Normal", CFrame.new(-26.000, 7.200, 19.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[104] = CreatePart("Normal", CFrame.new(1.000, 2.400, 20.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[105] = CreatePart("Normal", CFrame.new(8.500, 7.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[106] = CreatePart("Normal", CFrame.new(14.500, 13.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[107] = CreatePart("Normal", CFrame.new(15.500, 13.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[108] = CreatePart("Normal", CFrame.new(15.000, 15.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[109] = CreatePart("Normal", CFrame.new(1.000, 4.200, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[110] = CreatePart("Normal", CFrame.new(18.500, 14.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[111] = CreatePart("Normal", CFrame.new(5.500, 7.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[112] = CreatePart("Normal", CFrame.new(12.000, 19.200, 20.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[113] = CreatePart("Normal", CFrame.new(24.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[114] = CreatePart("Normal", CFrame.new(28.000, 19.200, 27.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[115] = CreatePart("Normal", CFrame.new(28.000, 19.200, 21.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[116] = CreatePart("Normal", CFrame.new(16.500, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[117] = CreatePart("Normal", CFrame.new(20.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[118] = CreatePart("Normal", CFrame.new(-26.000, 4.800, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[119] = CreatePart("Normal", CFrame.new(-26.000, 4.800, 3.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[120] = CreatePart("Normal", CFrame.new(-26.000, 4.800, 9.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[121] = CreatePart("Normal", CFrame.new(28.000, 16.800, 7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[122] = CreatePart("Normal", CFrame.new(28.000, 16.800, 13.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[123] = CreatePart("Normal", CFrame.new(28.000, 16.800, 19.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[124] = CreatePart("Normal", CFrame.new(28.000, 16.800, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[125] = CreatePart("Normal", CFrame.new(28.000, 16.800, 31.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[126] = CreatePart("Normal", CFrame.new(28.000, 16.800, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[127] = CreatePart("Normal", CFrame.new(28.000, 14.400, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[128] = CreatePart("Normal", CFrame.new(28.000, 14.400, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[129] = CreatePart("Normal", CFrame.new(28.000, 12.000, 15.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[130] = CreatePart("Normal", CFrame.new(28.000, 14.400, 44.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[131] = CreatePart("Normal", CFrame.new(28.000, 14.400, 24.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[132] = CreatePart("Normal", CFrame.new(28.000, 14.400, 19.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[133] = CreatePart("Normal", CFrame.new(28.000, 12.000, 20.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[134] = CreatePart("Normal", CFrame.new(28.000, 12.000, 38.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[135] = CreatePart("Normal", CFrame.new(28.000, 15.000, 12.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[136] = CreatePart("Normal", CFrame.new(28.000, 13.200, 12.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[137] = CreatePart("Normal", CFrame.new(28.000, 13.200, 11.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[138] = CreatePart("Normal", CFrame.new(28.000, 15.000, 9.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[139] = CreatePart("Normal", CFrame.new(28.000, 9.600, 12.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[140] = CreatePart("Normal", CFrame.new(28.000, 13.200, 6.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[141] = CreatePart("Normal", CFrame.new(28.000, 13.200, 5.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[142] = CreatePart("Normal", CFrame.new(28.000, 15.000, 6.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[143] = CreatePart("Normal", CFrame.new(28.000, 9.600, 5.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[144] = CreatePart("Normal", CFrame.new(28.500, 6.600, 9.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[145] = CreatePart("Normal", CFrame.new(28.000, 12.000, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[146] = CreatePart("Normal", CFrame.new(28.000, 12.000, 45.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[147] = CreatePart("Normal", CFrame.new(12.000, 2.400, 50.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[148] = CreatePart("Normal", CFrame.new(-26.000, 19.200, 13.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[149] = CreatePart("Normal", CFrame.new(-26.000, 19.200, 7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[150] = CreatePart("Normal", CFrame.new(-26.000, 19.200, 1.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[151] = CreatePart("Normal", CFrame.new(-26.000, 16.800, 3.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[152] = CreatePart("Normal", CFrame.new(-26.000, 16.800, 9.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[153] = CreatePart("Normal", CFrame.new(-26.000, 16.800, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[154] = CreatePart("Normal", CFrame.new(28.000, 16.800, 43.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[155] = CreatePart("Normal", CFrame.new(26.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[156] = CreatePart("Normal", CFrame.new(-26.000, 14.400, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[157] = CreatePart("Normal", CFrame.new(-26.000, 14.400, 15.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[158] = CreatePart("Normal", CFrame.new(-26.000, 12.000, 1.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[159] = CreatePart("Normal", CFrame.new(-26.000, 12.000, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[160] = CreatePart("Normal", CFrame.new(-26.000, 15.000, 6.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[161] = CreatePart("Normal", CFrame.new(-26.000, 13.200, 5.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[162] = CreatePart("Normal", CFrame.new(-26.000, 13.200, 6.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[163] = CreatePart("Normal", CFrame.new(-26.000, 15.000, 9.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[164] = CreatePart("Normal", CFrame.new(-26.000, 9.600, 5.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[165] = CreatePart("Normal", CFrame.new(-26.000, 13.200, 11.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[166] = CreatePart("Normal", CFrame.new(-26.000, 13.200, 12.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[167] = CreatePart("Normal", CFrame.new(-26.000, 15.000, 12.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[168] = CreatePart("Normal", CFrame.new(-26.000, 9.600, 12.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[169] = CreatePart("Normal", CFrame.new(-26.500, 6.600, 9.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[170] = CreatePart("Normal", CFrame.new(-26.000, 9.600, 15.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[171] = CreatePart("Normal", CFrame.new(-26.000, 9.600, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[172] = CreatePart("Normal", CFrame.new(-26.000, 7.200, 1.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[173] = CreatePart("Normal", CFrame.new(-26.000, 7.200, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[174] = CreatePart("Normal", CFrame.new(12.000, 4.200, 48.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[175] = CreatePart("Normal", CFrame.new(15.500, 7.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[176] = CreatePart("Normal", CFrame.new(19.000, 12.000, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[177] = CreatePart("Normal", CFrame.new(18.500, 9.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[178] = CreatePart("Normal", CFrame.new(24.000, 14.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[179] = CreatePart("Normal", CFrame.new(24.000, 9.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[180] = CreatePart("Normal", CFrame.new(24.500, 12.000, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[181] = CreatePart("Normal", CFrame.new(19.000, 7.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[182] = CreatePart("Normal", CFrame.new(12.000, 1.202, 53.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[183] = CreatePart("Normal", CFrame.new(12.000, 0.602, 55.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[184] = CreatePart("Normal", CFrame.new(28.000, 19.200, 45.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[185] = CreatePart("Normal", CFrame.new(28.000, 19.200, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[186] = CreatePart("Normal", CFrame.new(28.000, 19.200, 33.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[187] = CreatePart("Normal", CFrame.new(28.000, 19.200, 15.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[188] = CreatePart("Normal", CFrame.new(28.000, 19.200, 9.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[189] = CreatePart("Normal", CFrame.new(28.000, 15.000, 34.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[190] = CreatePart("Normal", CFrame.new(28.000, 13.200, 34.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[191] = CreatePart("Normal", CFrame.new(28.000, 13.200, 33.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[192] = CreatePart("Normal", CFrame.new(28.000, 15.000, 31.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[193] = CreatePart("Normal", CFrame.new(28.000, 9.600, 34.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[194] = CreatePart("Normal", CFrame.new(28.000, 13.200, 28.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[195] = CreatePart("Normal", CFrame.new(28.000, 13.200, 27.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[196] = CreatePart("Normal", CFrame.new(28.000, 15.000, 28.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[197] = CreatePart("Normal", CFrame.new(28.000, 9.600, 27.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[198] = CreatePart("Normal", CFrame.new(28.500, 6.600, 31.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[199] = CreatePart("Normal", CFrame.new(-26.000, 4.800, -3.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[200] = CreatePart("Normal", CFrame.new(-26.000, 16.800, -3.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[201] = CreatePart("Normal", CFrame.new(-26.000, 9.600, -4.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[202] = CreatePart("Normal", CFrame.new(28.000, 9.600, 2.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[203] = CreatePart("Normal", CFrame.new(-26.000, 14.400, -4.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[204] = CreatePart("Normal", CFrame.new(-26.000, 12.000, -5.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[205] = CreatePart("Normal", CFrame.new(-26.000, 7.200, -5.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[206] = CreatePart("Normal", CFrame.new(24.500, 7.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[207] = CreatePart("Normal", CFrame.new(28.000, 14.400, 2.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[208] = CreatePart("Normal", CFrame.new(28.000, 19.200, 3.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[209] = CreatePart("Normal", CFrame.new(-24.000, 4.800, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[210] = CreatePart("Normal", CFrame.new(28.000, 9.600, 44.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[211] = CreatePart("Normal", CFrame.new(28.000, 9.600, 24.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[212] = CreatePart("Normal", CFrame.new(28.000, 9.600, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[213] = CreatePart("Normal", CFrame.new(28.000, 9.600, 19.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[214] = CreatePart("Normal", CFrame.new(28.000, 12.000, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[215] = CreatePart("Normal", CFrame.new(28.000, 9.600, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[216] = CreatePart("Normal", CFrame.new(-26.000, 19.200, -5.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[217] = CreatePart("Normal", CFrame.new(-18.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[218] = CreatePart("Normal", CFrame.new(-12.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[219] = CreatePart("Normal", CFrame.new(-6.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[220] = CreatePart("Normal", CFrame.new(28.000, 16.800, 1.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[221] = CreatePart("Normal", CFrame.new(-17.000, 12.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[222] = CreatePart("Normal", CFrame.new(-16.500, 14.400, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[223] = CreatePart("Normal", CFrame.new(-16.500, 9.600, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[224] = CreatePart("Normal", CFrame.new(-22.000, 14.400, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[225] = CreatePart("Normal", CFrame.new(-22.000, 9.600, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[226] = CreatePart("Normal", CFrame.new(-22.500, 12.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[227] = CreatePart("Normal", CFrame.new(-22.500, 7.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[228] = CreatePart("Normal", CFrame.new(-17.000, 7.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[229] = CreatePart("Normal", CFrame.new(-12.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[230] = CreatePart("Normal", CFrame.new(-18.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[231] = CreatePart("Normal", CFrame.new(-24.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[232] = CreatePart("Normal", CFrame.new(-16.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[233] = CreatePart("Normal", CFrame.new(-22.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[234] = CreatePart("Normal", CFrame.new(28.000, 7.200, 20.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[235] = CreatePart("Normal", CFrame.new(26.000, 4.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[236] = CreatePart("Normal", CFrame.new(0.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[237] = CreatePart("Normal", CFrame.new(6.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[238] = CreatePart("Normal", CFrame.new(18.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[239] = CreatePart("Normal", CFrame.new(12.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[240] = CreatePart("Normal", CFrame.new(28.000, 7.200, 45.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[241] = CreatePart("Normal", CFrame.new(28.000, 7.200, 38.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[242] = CreatePart("Normal", CFrame.new(28.000, 12.000, -3.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[243] = CreatePart("Normal", CFrame.new(28.000, 14.400, -3.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[244] = CreatePart("Normal", CFrame.new(15.000, 15.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[245] = CreatePart("Normal", CFrame.new(15.500, 13.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[246] = CreatePart("Normal", CFrame.new(14.500, 13.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[247] = CreatePart("Normal", CFrame.new(12.000, 15.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[248] = CreatePart("Normal", CFrame.new(15.500, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[249] = CreatePart("Normal", CFrame.new(9.500, 13.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[250] = CreatePart("Normal", CFrame.new(8.500, 13.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[251] = CreatePart("Normal", CFrame.new(9.000, 15.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[252] = CreatePart("Normal", CFrame.new(8.500, 9.600, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[253] = CreatePart("Normal", CFrame.new(12.000, 6.600, -7.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[254] = CreatePart("Normal", CFrame.new(-10.000, 19.200, -7.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[255] = CreatePart("Normal", CFrame.new(28.000, 9.600, -3.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[256] = CreatePart("Normal", CFrame.new(28.000, 7.200, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[257] = CreatePart("Normal", CFrame.new(28.000, 7.200, 15.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[258] = CreatePart("Normal", CFrame.new(28.000, 7.200, -3.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[259] = CreatePart("Normal", CFrame.new(28.000, 7.200, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[260] = CreatePart("Normal", CFrame.new(5.500, 14.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[261] = CreatePart("Normal", CFrame.new(6.000, 12.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[262] = CreatePart("Normal", CFrame.new(0.500, 14.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[263] = CreatePart("Normal", CFrame.new(1.500, 12.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[264] = CreatePart("Normal", CFrame.new(-4.000, 14.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[265] = CreatePart("Normal", CFrame.new(-3.500, 12.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[266] = CreatePart("Normal", CFrame.new(-7.000, 15.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[267] = CreatePart("Normal", CFrame.new(-6.500, 13.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[268] = CreatePart("Normal", CFrame.new(-7.500, 13.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[269] = CreatePart("Normal", CFrame.new(-10.000, 15.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[270] = CreatePart("Normal", CFrame.new(-6.500, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[271] = CreatePart("Normal", CFrame.new(-12.500, 13.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[272] = CreatePart("Normal", CFrame.new(-13.500, 13.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[273] = CreatePart("Normal", CFrame.new(-13.000, 15.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[274] = CreatePart("Normal", CFrame.new(-13.500, 9.600, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[275] = CreatePart("Normal", CFrame.new(-10.000, 6.600, -7.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[276] = CreatePart("Normal", CFrame.new(5.500, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[277] = CreatePart("Normal", CFrame.new(0.500, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[278] = CreatePart("Normal", CFrame.new(-4.000, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[279] = CreatePart("Normal", CFrame.new(1.500, 7.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[280] = CreatePart("Normal", CFrame.new(19.500, 7.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[281] = CreatePart("Normal", CFrame.new(6.000, 7.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[282] = CreatePart("Normal", CFrame.new(-3.500, 7.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[283] = CreatePart("Normal", CFrame.new(6.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[284] = CreatePart("Normal", CFrame.new(-0.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[285] = CreatePart("Normal", CFrame.new(-6.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[286] = CreatePart("Normal", CFrame.new(12.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[287] = CreatePart("Normal", CFrame.new(-12.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[288] = CreatePart("Normal", CFrame.new(-5.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[289] = CreatePart("Normal", CFrame.new(2.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[290] = CreatePart("Normal", CFrame.new(8.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[291] = CreatePart("Normal", CFrame.new(28.000, 19.200, -3.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[292] = CreatePart("Normal", CFrame.new(28.000, 4.800, 1.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[293] = CreatePart("Normal", CFrame.new(28.000, 4.800, 7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[294] = CreatePart("Normal", CFrame.new(28.000, 4.800, 13.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[295] = CreatePart("Normal", CFrame.new(28.000, 4.800, 19.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[296] = CreatePart("Normal", CFrame.new(28.000, 4.800, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[297] = CreatePart("Normal", CFrame.new(28.000, 4.800, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[298] = CreatePart("Normal", CFrame.new(28.000, 4.800, 43.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[299] = CreatePart("Normal", CFrame.new(28.000, 4.800, 31.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[300] = CreatePart("Normal", CFrame.new(28.000, 4.800, -5.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[301] = CreatePart("Normal", CFrame.new(24.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[302] = CreatePart("Normal", CFrame.new(28.000, 16.800, -5.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[303] = CreatePart("Normal", CFrame.new(19.000, 14.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[304] = CreatePart("Normal", CFrame.new(25.500, 14.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[305] = CreatePart("Normal", CFrame.new(19.500, 12.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[306] = CreatePart("Normal", CFrame.new(26.000, 12.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[307] = CreatePart("Normal", CFrame.new(25.500, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[308] = CreatePart("Normal", CFrame.new(19.000, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[309] = CreatePart("Normal", CFrame.new(26.000, 7.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[310] = CreatePart("Normal", CFrame.new(24.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[311] = CreatePart("Normal", CFrame.new(18.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[312] = CreatePart("Normal", CFrame.new(18.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[313] = CreatePart("Normal", CFrame.new(12.000, 19.200, -7.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[314] = CreatePart("Normal", CFrame.new(26.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[315] = CreatePart("Normal", CFrame.new(8.000, 28.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[316] = CreatePart("Normal", CFrame.new(6.000, 26.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[317] = CreatePart("Normal", CFrame.new(12.000, 28.200, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[318] = CreatePart("Normal", CFrame.new(4.000, 31.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[319] = CreatePart("Normal", CFrame.new(14.000, 29.400, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[320] = CreatePart("Normal", CFrame.new(4.000, 35.400, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[321] = CreatePart("Normal", CFrame.new(8.000, 30.600, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[322] = CreatePart("Normal", CFrame.new(8.000, 33.000, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[323] = CreatePart("Normal", CFrame.new(10.000, 31.800, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[324] = CreatePart("Normal", CFrame.new(6.000, 34.200, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[325] = CreatePart("Normal", CFrame.new(6.000, 34.200, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[326] = CreatePart("Normal", CFrame.new(12.000, 30.600, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[327] = CreatePart("Normal", CFrame.new(4.000, 33.000, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[328] = CreatePart("Normal", CFrame.new(2.000, 28.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[329] = CreatePart("Normal", CFrame.new(-10.000, 28.200, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[330] = CreatePart("Normal", CFrame.new(-12.000, 29.400, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[331] = CreatePart("Normal", CFrame.new(-14.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[332] = CreatePart("Normal", CFrame.new(-14.000, 25.800, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[333] = CreatePart("Normal", CFrame.new(1.000, 33.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[334] = CreatePart("Normal", CFrame.new(10.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[335] = CreatePart("Normal", CFrame.new(-4.000, 34.200, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[336] = CreatePart("Normal", CFrame.new(8.000, 33.000, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[337] = CreatePart("Normal", CFrame.new(-8.000, 31.800, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[338] = CreatePart("Normal", CFrame.new(-10.000, 30.600, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[339] = CreatePart("Normal", CFrame.new(-6.000, 33.000, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[340] = CreatePart("Normal", CFrame.new(-10.000, 30.600, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[341] = CreatePart("Normal", CFrame.new(-8.000, 31.800, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[342] = CreatePart("Normal", CFrame.new(-6.000, 30.600, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[343] = CreatePart("Normal", CFrame.new(-6.000, 33.000, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[344] = CreatePart("Normal", CFrame.new(-8.000, 31.800, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[345] = CreatePart("Normal", CFrame.new(-2.000, 35.400, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[346] = CreatePart("Normal", CFrame.new(6.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[347] = CreatePart("Normal", CFrame.new(16.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[348] = CreatePart("Normal", CFrame.new(12.000, 26.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[349] = CreatePart("Normal", CFrame.new(-5.000, 28.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[350] = CreatePart("Normal", CFrame.new(24.000, 23.400, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[351] = CreatePart("Normal", CFrame.new(-12.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[352] = CreatePart("Normal", CFrame.new(-6.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[353] = CreatePart("Normal", CFrame.new(-0.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[354] = CreatePart("Normal", CFrame.new(-11.000, 26.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[355] = CreatePart("Normal", CFrame.new(-0.000, 26.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[356] = CreatePart("Normal", CFrame.new(-2.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[357] = CreatePart("Normal", CFrame.new(4.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[358] = CreatePart("Normal", CFrame.new(-8.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[359] = CreatePart("Normal", CFrame.new(-6.000, 26.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[360] = CreatePart("Normal", CFrame.new(12.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[361] = CreatePart("Normal", CFrame.new(19.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[362] = CreatePart("Normal", CFrame.new(4.000, 35.400, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[363] = CreatePart("Normal", CFrame.new(26.000, 22.200, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[364] = CreatePart("Normal", CFrame.new(1.000, 37.800, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[365] = CreatePart("Normal", CFrame.new(24.000, 21.000, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[366] = CreatePart("Normal", CFrame.new(-2.000, 35.400, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[367] = CreatePart("Normal", CFrame.new(10.000, 31.800, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[368] = CreatePart("Normal", CFrame.new(20.000, 25.800, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[369] = CreatePart("Normal", CFrame.new(16.000, 28.200, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[370] = CreatePart("Normal", CFrame.new(-4.000, 34.200, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[371] = CreatePart("Normal", CFrame.new(1.000, 37.800, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[372] = CreatePart("Normal", CFrame.new(16.000, 25.800, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[373] = CreatePart("Normal", CFrame.new(12.000, 30.600, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[374] = CreatePart("Normal", CFrame.new(1.000, 37.800, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[375] = CreatePart("Normal", CFrame.new(-4.000, 34.200, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[376] = CreatePart("Normal", CFrame.new(-2.000, 33.000, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[377] = CreatePart("Normal", CFrame.new(18.000, 27.000, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[378] = CreatePart("Normal", CFrame.new(1.000, 36.600, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[379] = CreatePart("Normal", CFrame.new(1.000, 36.600, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[380] = CreatePart("Normal", CFrame.new(22.000, 24.600, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[381] = CreatePart("Normal", CFrame.new(1.000, 36.600, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[382] = CreatePart("Normal", CFrame.new(14.000, 29.400, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[383] = CreatePart("Normal", CFrame.new(20.000, 23.400, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[384] = CreatePart("Normal", CFrame.new(6.000, 34.200, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[385] = CreatePart("Normal", CFrame.new(28.000, 21.000, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[386] = CreatePart("Normal", CFrame.new(18.000, 27.000, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[387] = CreatePart("Normal", CFrame.new(-2.000, 31.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[388] = CreatePart("Normal", CFrame.new(22.000, 24.600, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[389] = CreatePart("Normal", CFrame.new(16.000, 28.200, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[390] = CreatePart("Normal", CFrame.new(-12.000, 29.400, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[391] = CreatePart("Normal", CFrame.new(-6.000, 33.000, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[392] = CreatePart("Normal", CFrame.new(-4.000, 34.200, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[393] = CreatePart("Normal", CFrame.new(-2.000, 35.400, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[394] = CreatePart("Normal", CFrame.new(24.000, 23.400, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[395] = CreatePart("Normal", CFrame.new(26.000, 22.200, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[396] = CreatePart("Normal", CFrame.new(1.000, 36.600, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[397] = CreatePart("Normal", CFrame.new(20.000, 25.800, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[398] = CreatePart("Normal", CFrame.new(18.000, 27.000, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[399] = CreatePart("Normal", CFrame.new(8.000, 33.000, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[400] = CreatePart("Normal", CFrame.new(4.000, 35.400, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[401] = CreatePart("Normal", CFrame.new(12.000, 30.600, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[402] = CreatePart("Normal", CFrame.new(10.000, 31.800, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[403] = CreatePart("Normal", CFrame.new(28.000, 21.000, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[404] = CreatePart("Normal", CFrame.new(14.000, 29.400, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[405] = CreatePart("Normal", CFrame.new(-14.000, 28.200, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[406] = CreatePart("Normal", CFrame.new(-20.000, 24.600, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[407] = CreatePart("Normal", CFrame.new(-12.000, 29.400, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[408] = CreatePart("Normal", CFrame.new(-16.000, 27.000, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[409] = CreatePart("Normal", CFrame.new(-12.000, 29.400, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[410] = CreatePart("Normal", CFrame.new(-14.000, 28.200, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[411] = CreatePart("Normal", CFrame.new(-18.000, 25.800, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[412] = CreatePart("Normal", CFrame.new(-16.000, 27.000, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[413] = CreatePart("Normal", CFrame.new(-18.000, 23.400, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[414] = CreatePart("Normal", CFrame.new(-14.000, 28.200, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[415] = CreatePart("Normal", CFrame.new(-16.000, 27.000, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[416] = CreatePart("Normal", CFrame.new(6.000, 34.200, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[417] = CreatePart("Normal", CFrame.new(-8.000, 31.800, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[418] = CreatePart("Normal", CFrame.new(-10.000, 30.600, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[419] = CreatePart("Normal", CFrame.new(-6.000, 33.000, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[420] = CreatePart("Normal", CFrame.new(-10.000, 30.600, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[421] = CreatePart("Normal", CFrame.new(-4.000, 34.200, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[422] = CreatePart("Normal", CFrame.new(24.000, 23.400, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[423] = CreatePart("Normal", CFrame.new(-2.000, 35.400, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[424] = CreatePart("Normal", CFrame.new(-18.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[425] = CreatePart("Normal", CFrame.new(8.000, 33.000, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[426] = CreatePart("Normal", CFrame.new(1.000, 37.800, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[427] = CreatePart("Normal", CFrame.new(22.000, 24.600, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[428] = CreatePart("Normal", CFrame.new(22.000, 24.600, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[429] = CreatePart("Normal", CFrame.new(12.000, 30.600, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[430] = CreatePart("Normal", CFrame.new(4.000, 35.400, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[431] = CreatePart("Normal", CFrame.new(28.000, 21.000, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[432] = CreatePart("Normal", CFrame.new(10.000, 31.800, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[433] = CreatePart("Normal", CFrame.new(26.000, 22.200, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[434] = CreatePart("Normal", CFrame.new(16.000, 28.200, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[435] = CreatePart("Normal", CFrame.new(1.000, 36.600, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[436] = CreatePart("Normal", CFrame.new(14.000, 29.400, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[437] = CreatePart("Normal", CFrame.new(20.000, 25.800, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[438] = CreatePart("Normal", CFrame.new(18.000, 27.000, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[439] = CreatePart("Normal", CFrame.new(-20.000, 24.600, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[440] = CreatePart("Normal", CFrame.new(-16.000, 27.000, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[441] = CreatePart("Normal", CFrame.new(-14.000, 28.200, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[442] = CreatePart("Normal", CFrame.new(-18.000, 25.800, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[443] = CreatePart("Normal", CFrame.new(-18.000, 25.800, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[444] = CreatePart("Normal", CFrame.new(-24.000, 22.200, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[445] = CreatePart("Normal", CFrame.new(-20.000, 24.600, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[446] = CreatePart("Normal", CFrame.new(-22.000, 23.400, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[447] = CreatePart("Normal", CFrame.new(-26.000, 21.000, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[448] = CreatePart("Normal", CFrame.new(-24.000, 22.200, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[449] = CreatePart("Normal", CFrame.new(-22.000, 21.000, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[450] = CreatePart("Normal", CFrame.new(-22.000, 23.400, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[451] = CreatePart("Normal", CFrame.new(-12.000, 29.400, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[452] = CreatePart("Normal", CFrame.new(-8.000, 31.800, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[453] = CreatePart("Normal", CFrame.new(-6.000, 33.000, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[454] = CreatePart("Normal", CFrame.new(-2.000, 35.400, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[455] = CreatePart("Normal", CFrame.new(24.000, 23.400, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[456] = CreatePart("Normal", CFrame.new(26.000, 22.200, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[457] = CreatePart("Normal", CFrame.new(20.000, 25.800, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[458] = CreatePart("Normal", CFrame.new(6.000, 34.200, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[459] = CreatePart("Normal", CFrame.new(10.000, 31.800, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[460] = CreatePart("Normal", CFrame.new(16.000, 28.200, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[461] = CreatePart("Normal", CFrame.new(1.000, 37.800, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[462] = CreatePart("Normal", CFrame.new(1.000, 36.600, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[463] = CreatePart("Normal", CFrame.new(14.000, 29.400, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[464] = CreatePart("Normal", CFrame.new(4.000, 35.400, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[465] = CreatePart("Normal", CFrame.new(-20.000, 24.600, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[466] = CreatePart("Normal", CFrame.new(-22.000, 23.400, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[467] = CreatePart("Normal", CFrame.new(-24.000, 22.200, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[468] = CreatePart("Normal", CFrame.new(-26.000, 21.000, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[469] = CreatePart("Normal", CFrame.new(-22.000, 23.400, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[470] = CreatePart("Normal", CFrame.new(-20.000, 24.600, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[471] = CreatePart("Normal", CFrame.new(-26.000, 21.000, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[472] = CreatePart("Normal", CFrame.new(-24.000, 22.200, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[473] = CreatePart("Normal", CFrame.new(-18.000, 25.800, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[474] = CreatePart("Normal", CFrame.new(-16.000, 27.000, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[475] = CreatePart("Normal", CFrame.new(-14.000, 28.200, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[476] = CreatePart("Normal", CFrame.new(-18.000, 25.800, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[477] = CreatePart("Normal", CFrame.new(-10.000, 28.200, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[478] = CreatePart("Normal", CFrame.new(-16.000, 27.000, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[479] = CreatePart("Normal", CFrame.new(-12.000, 29.400, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[480] = CreatePart("Normal", CFrame.new(-10.000, 30.600, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[481] = CreatePart("Normal", CFrame.new(-2.000, 33.000, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[482] = CreatePart("Normal", CFrame.new(-8.000, 31.800, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[483] = CreatePart("Normal", CFrame.new(-4.000, 34.200, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[484] = CreatePart("Normal", CFrame.new(-6.000, 30.600, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[485] = CreatePart("Normal", CFrame.new(-5.000, 28.800, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[486] = CreatePart("Normal", CFrame.new(8.000, 33.000, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[487] = CreatePart("Normal", CFrame.new(8.000, 30.600, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[488] = CreatePart("Normal", CFrame.new(-2.000, 31.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[489] = CreatePart("Normal", CFrame.new(1.000, 33.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[490] = CreatePart("Normal", CFrame.new(4.000, 31.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[491] = CreatePart("Normal", CFrame.new(12.000, 30.600, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[492] = CreatePart("Normal", CFrame.new(18.000, 27.000, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[493] = CreatePart("Normal", CFrame.new(22.000, 24.600, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[494] = CreatePart("Normal", CFrame.new(28.000, 21.000, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[495] = CreatePart("Normal", CFrame.new(10.000, 31.800, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[496] = CreatePart("Normal", CFrame.new(16.000, 28.200, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[497] = CreatePart("Normal", CFrame.new(6.000, 34.200, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[498] = CreatePart("Normal", CFrame.new(4.000, 33.000, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[499] = CreatePart("Normal", CFrame.new(-18.000, 23.400, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[500] = CreatePart("Normal", CFrame.new(-22.000, 23.400, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[501] = CreatePart("Normal", CFrame.new(-24.000, 22.200, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[502] = CreatePart("Normal", CFrame.new(-24.000, 22.200, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[503] = CreatePart("Normal", CFrame.new(-26.000, 21.000, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[504] = CreatePart("Normal", CFrame.new(-20.000, 24.600, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[505] = CreatePart("Normal", CFrame.new(-26.000, 21.000, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[506] = CreatePart("Normal", CFrame.new(-14.000, 25.800, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[507] = CreatePart("Normal", CFrame.new(-11.000, 26.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[508] = CreatePart("Normal", CFrame.new(8.000, 28.800, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[509] = CreatePart("Normal", CFrame.new(2.000, 28.800, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[510] = CreatePart("Normal", CFrame.new(-8.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[511] = CreatePart("Normal", CFrame.new(6.000, 26.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[512] = CreatePart("Normal", CFrame.new(-0.000, 26.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[513] = CreatePart("Normal", CFrame.new(14.000, 29.400, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[514] = CreatePart("Normal", CFrame.new(-14.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[515] = CreatePart("Normal", CFrame.new(12.000, 28.200, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[516] = CreatePart("Normal", CFrame.new(26.000, 22.200, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[517] = CreatePart("Normal", CFrame.new(-6.000, 26.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[518] = CreatePart("Normal", CFrame.new(12.000, 26.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[519] = CreatePart("Normal", CFrame.new(20.000, 25.800, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[520] = CreatePart("Normal", CFrame.new(-22.000, 21.000, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[521] = CreatePart("Normal", CFrame.new(-18.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[522] = CreatePart("Normal", CFrame.new(18.000, 27.000, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[523] = CreatePart("Normal", CFrame.new(-2.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[524] = CreatePart("Normal", CFrame.new(6.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[525] = CreatePart("Normal", CFrame.new(4.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[526] = CreatePart("Normal", CFrame.new(10.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[527] = CreatePart("Normal", CFrame.new(16.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[528] = CreatePart("Normal", CFrame.new(28.000, 21.000, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[529] = CreatePart("Normal", CFrame.new(-6.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[530] = CreatePart("Normal", CFrame.new(22.000, 24.600, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[531] = CreatePart("Normal", CFrame.new(16.000, 25.800, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[532] = CreatePart("Normal", CFrame.new(20.000, 23.400, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[533] = CreatePart("Normal", CFrame.new(-12.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[534] = CreatePart("Normal", CFrame.new(-0.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[535] = CreatePart("Normal", CFrame.new(24.000, 23.400, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[536] = CreatePart("Normal", CFrame.new(12.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[537] = CreatePart("Normal", CFrame.new(19.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[538] = CreatePart("Normal", CFrame.new(24.000, 21.000, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[539] = CreatePart("Normal", CFrame.new(26.000, 22.200, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[540] = CreatePart("Normal", CFrame.new(-18.000, 45.000, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[541] = CreatePart("Normal", CFrame.new(-18.000, 43.200, 37.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[542] = CreatePart("Normal", CFrame.new(-16.000, 45.000, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[543] = CreatePart("Normal", CFrame.new(-16.000, 43.200, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[544] = CreatePart("Normal", CFrame.new(-14.000, 45.000, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[545] = CreatePart("Normal", CFrame.new(-16.000, 40.800, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[546] = CreatePart("Normal", CFrame.new(-14.000, 40.800, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[547] = CreatePart("Normal", CFrame.new(-18.000, 40.800, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[548] = CreatePart("Normal", CFrame.new(-18.000, 38.400, 37.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[549] = CreatePart("Normal", CFrame.new(-16.000, 38.400, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[550] = CreatePart("Normal", CFrame.new(-14.000, 43.200, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[551] = CreatePart("Normal", CFrame.new(-14.000, 38.400, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[552] = CreatePart("Normal", CFrame.new(-16.000, 36.000, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[553] = CreatePart("Normal", CFrame.new(-18.000, 36.000, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[554] = CreatePart("Normal", CFrame.new(-14.000, 36.000, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[555] = CreatePart("Normal", CFrame.new(-14.000, 33.600, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[556] = CreatePart("Normal", CFrame.new(-18.000, 33.600, 37.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[557] = CreatePart("Normal", CFrame.new(-16.000, 33.600, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[558] = CreatePart("Normal", CFrame.new(-16.000, 31.200, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[559] = CreatePart("Normal", CFrame.new(-18.000, 31.200, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[560] = CreatePart("Normal", CFrame.new(-12.000, 33.600, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[561] = CreatePart("Normal", CFrame.new(-12.000, 43.200, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[562] = CreatePart("Normal", CFrame.new(-12.000, 38.400, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[563] = CreatePart("Normal", CFrame.new(-12.000, 40.800, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[564] = CreatePart("Normal", CFrame.new(-12.000, 36.000, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[565] = CreatePart("Normal", CFrame.new(-12.000, 31.800, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[566] = CreatePart("Normal", CFrame.new(-12.000, 45.000, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[567] = CreatePart("Normal", CFrame.new(-18.000, 28.800, 35.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[568] = CreatePart("Normal", CFrame.new(-16.000, 29.400, 35.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[569] = CreatePart("Normal", CFrame.new(-18.000, 28.800, 39.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[570] = CreatePart("Normal", CFrame.new(-16.000, 29.400, 41.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[571] = CreatePart("Normal", CFrame.new(-16.000, 31.200, 41.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[572] = CreatePart("Normal", CFrame.new(4.000, 0.600, 25.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[573] = CreatePart("Normal", CFrame.new(2.000, 15.300, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[574] = CreatePart("Normal", CFrame.new(2.000, 11.800, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[575] = CreatePart("Normal", CFrame.new(5.500, 11.800, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[576] = CreatePart("Normal", CFrame.new(-1.500, 11.800, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[577] = CreatePart("Normal", CFrame.new(3.167, 7.133, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[578] = CreatePart("Normal", CFrame.new(0.833, 7.133, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[579] = CreatePart("Normal", CFrame.new(2.000, 11.800, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[580] = CreatePart("Normal", CFrame.new(2.005, 18.658, 0.148, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[581] = CreatePart("Normal", CFrame.new(-1.657, 9.915, 0.911, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[582] = CreatePart("Normal", CFrame.new(3.144, 12.899, 1.309, -0.889, -0.399, 0.223, -0.091, -0.323, -0.942, 0.448, -0.858, 0.251), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[583] = CreatePart("Normal", CFrame.new(2.040, 15.707, 0.431, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[584] = CreatePart("Normal", CFrame.new(2.043, 15.456, 0.388, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[585] = CreatePart("Normal", CFrame.new(0.000, 15.000, -30.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
local maxWait = 3.0
local start = os.clock()
while os.clock() - start < maxWait do
    local completed = true
    for i = 1, 585 do
        if not generatedParts[i] then completed = false break end
    end
    if completed then break end
    task.wait(0.05)
end
if generatedParts[1] then
    table.insert(resizes, {['Part'] = generatedParts[1], ['CFrame'] = (origin + offset) * CFrame.new(7.885, 105.685, 270.588, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[1], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[1], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[1], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[1], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[1], ['Name'] = "FlyCameraFocus"})
end
if generatedParts[2] then
    table.insert(resizes, {['Part'] = generatedParts[2], ['CFrame'] = (origin + offset) * CFrame.new(-80.662, 48.007, 106.076, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[2], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[2], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[2], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[2], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[2], ['Name'] = "FlyCameraFocus"})
end
if generatedParts[3] then
    table.insert(resizes, {['Part'] = generatedParts[3], ['CFrame'] = (origin + offset) * CFrame.new(0.000, 15.000, -30.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[3], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[3], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[3], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[3], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[3], ['Name'] = "FlyCameraFocus"})
end
if generatedParts[4] then
    table.insert(resizes, {['Part'] = generatedParts[4], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 0.500, 68.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(12.000, 1.000, 12.000)})
    table.insert(colors, {['Part'] = generatedParts[4], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[4], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[4], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[4], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[4], ['Name'] = "SpawnLocation"})
end
if generatedParts[5] then
    table.insert(resizes, {['Part'] = generatedParts[5], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[5], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[5], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[5], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[5], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[5], ['Name'] = "Smooth Block Model3"})
end
if generatedParts[6] then
    table.insert(resizes, {['Part'] = generatedParts[6], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 4.800, 45.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[6], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[6], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[6], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[6], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[6], ['Name'] = "Smooth Block Model6"})
end
if generatedParts[7] then
    table.insert(resizes, {['Part'] = generatedParts[7], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 19.200, 47.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.000, 2.400, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[7], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[7], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[7], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[7], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[7], ['Name'] = "Smooth Block Model7"})
end
if generatedParts[8] then
    table.insert(resizes, {['Part'] = generatedParts[8], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 19.200, 43.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[8], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[8], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[8], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[8], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[8], ['Name'] = "Smooth Block Model8"})
end
if generatedParts[9] then
    table.insert(resizes, {['Part'] = generatedParts[9], ['CFrame'] = (origin + offset) * CFrame.new(-13.000, 15.000, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[9], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[9], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[9], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[9], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[9], ['Name'] = "Smooth Block Model10"})
end
if generatedParts[10] then
    table.insert(resizes, {['Part'] = generatedParts[10], ['CFrame'] = (origin + offset) * CFrame.new(-13.500, 13.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[10], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[10], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[10], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[10], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[10], ['Name'] = "Smooth Block Model14"})
end
if generatedParts[11] then
    table.insert(resizes, {['Part'] = generatedParts[11], ['CFrame'] = (origin + offset) * CFrame.new(-12.500, 13.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[11], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[11], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[11], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[11], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[11], ['Name'] = "Smooth Block Model15"})
end
if generatedParts[12] then
    table.insert(resizes, {['Part'] = generatedParts[12], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 15.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[12], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[12], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[12], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[12], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[12], ['Name'] = "Smooth Block Model17"})
end
if generatedParts[13] then
    table.insert(resizes, {['Part'] = generatedParts[13], ['CFrame'] = (origin + offset) * CFrame.new(-13.500, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[13], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[13], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[13], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[13], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[13], ['Name'] = "Smooth Block Model19"})
end
if generatedParts[14] then
    table.insert(resizes, {['Part'] = generatedParts[14], ['CFrame'] = (origin + offset) * CFrame.new(-7.500, 13.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[14], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[14], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[14], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[14], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[14], ['Name'] = "Smooth Block Model22"})
end
if generatedParts[15] then
    table.insert(resizes, {['Part'] = generatedParts[15], ['CFrame'] = (origin + offset) * CFrame.new(-6.500, 13.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[15], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[15], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[15], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[15], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[15], ['Name'] = "Smooth Block Model25"})
end
if generatedParts[16] then
    table.insert(resizes, {['Part'] = generatedParts[16], ['CFrame'] = (origin + offset) * CFrame.new(-7.000, 15.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[16], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[16], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[16], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[16], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[16], ['Name'] = "Smooth Block Model27"})
end
if generatedParts[17] then
    table.insert(resizes, {['Part'] = generatedParts[17], ['CFrame'] = (origin + offset) * CFrame.new(-6.500, 9.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[17], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[17], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[17], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[17], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[17], ['Name'] = "Smooth Block Model"})
end
if generatedParts[18] then
    table.insert(resizes, {['Part'] = generatedParts[18], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 6.600, 47.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(8.000, 1.200, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[18], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[18], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[18], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[18], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[18], ['Name'] = "Smooth Block Model33"})
end
if generatedParts[19] then
    table.insert(resizes, {['Part'] = generatedParts[19], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[19], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[19], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[19], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[19], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[19], ['Name'] = "Smooth Block Model34"})
end
if generatedParts[20] then
    table.insert(resizes, {['Part'] = generatedParts[20], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 16.800, 45.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[20], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[20], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[20], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[20], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[20], ['Name'] = "Smooth Block Model38"})
end
if generatedParts[21] then
    table.insert(resizes, {['Part'] = generatedParts[21], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 16.800, 39.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[21], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[21], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[21], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[21], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[21], ['Name'] = "Smooth Block Model41"})
end
if generatedParts[22] then
    table.insert(resizes, {['Part'] = generatedParts[22], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 14.400, 43.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[22], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[22], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[22], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[22], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[22], ['Name'] = "Smooth Block Model43"})
end
if generatedParts[23] then
    table.insert(resizes, {['Part'] = generatedParts[23], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, 43.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[23], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[23], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[23], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[23], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[23], ['Name'] = "Smooth Block Model48"})
end
if generatedParts[24] then
    table.insert(resizes, {['Part'] = generatedParts[24], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 12.000, 43.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[24], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[24], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[24], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[24], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[24], ['Name'] = "Smooth Block Model50"})
end
if generatedParts[25] then
    table.insert(resizes, {['Part'] = generatedParts[25], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 7.200, 43.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[25], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[25], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[25], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[25], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[25], ['Name'] = "Smooth Block Model51"})
end
if generatedParts[26] then
    table.insert(resizes, {['Part'] = generatedParts[26], ['CFrame'] = (origin + offset) * CFrame.new(-17.000, 14.400, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[26], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[26], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[26], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[26], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[26], ['Name'] = "Smooth Block Model55"})
end
if generatedParts[27] then
    table.insert(resizes, {['Part'] = generatedParts[27], ['CFrame'] = (origin + offset) * CFrame.new(-23.500, 14.400, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[27], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[27], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[27], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[27], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[27], ['Name'] = "Smooth Block Model59"})
end
if generatedParts[28] then
    table.insert(resizes, {['Part'] = generatedParts[28], ['CFrame'] = (origin + offset) * CFrame.new(-3.500, 14.400, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[28], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[28], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[28], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[28], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[28], ['Name'] = "Smooth Block Model61"})
end
if generatedParts[29] then
    table.insert(resizes, {['Part'] = generatedParts[29], ['CFrame'] = (origin + offset) * CFrame.new(-17.500, 12.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[29], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[29], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[29], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[29], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[29], ['Name'] = "Smooth Block Model65"})
end
if generatedParts[30] then
    table.insert(resizes, {['Part'] = generatedParts[30], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 12.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[30], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[30], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[30], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[30], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[30], ['Name'] = "Smooth Block Model68"})
end
if generatedParts[31] then
    table.insert(resizes, {['Part'] = generatedParts[31], ['CFrame'] = (origin + offset) * CFrame.new(-23.500, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[31], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[31], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[31], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[31], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[31], ['Name'] = "Smooth Block Model69"})
end
if generatedParts[32] then
    table.insert(resizes, {['Part'] = generatedParts[32], ['CFrame'] = (origin + offset) * CFrame.new(-17.000, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[32], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[32], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[32], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[32], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[32], ['Name'] = "Smooth Block Model71"})
end
if generatedParts[33] then
    table.insert(resizes, {['Part'] = generatedParts[33], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 7.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[33], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[33], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[33], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[33], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[33], ['Name'] = "Smooth Block Model74"})
end
if generatedParts[34] then
    table.insert(resizes, {['Part'] = generatedParts[34], ['CFrame'] = (origin + offset) * CFrame.new(-17.500, 7.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[34], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[34], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[34], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[34], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[34], ['Name'] = "Smooth Block Model77"})
end
if generatedParts[35] then
    table.insert(resizes, {['Part'] = generatedParts[35], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[35], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[35], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[35], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[35], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[35], ['Name'] = "Smooth Block Model80"})
end
if generatedParts[36] then
    table.insert(resizes, {['Part'] = generatedParts[36], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[36], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[36], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[36], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[36], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[36], ['Name'] = "Smooth Block Model83"})
end
if generatedParts[37] then
    table.insert(resizes, {['Part'] = generatedParts[37], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[37], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[37], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[37], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[37], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[37], ['Name'] = "Smooth Block Model87"})
end
if generatedParts[38] then
    table.insert(resizes, {['Part'] = generatedParts[38], ['CFrame'] = (origin + offset) * CFrame.new(-0.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[38], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[38], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[38], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[38], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[38], ['Name'] = "Smooth Block Model90"})
end
if generatedParts[39] then
    table.insert(resizes, {['Part'] = generatedParts[39], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[39], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[39], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[39], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[39], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[39], ['Name'] = "Smooth Block Model91"})
end
if generatedParts[40] then
    table.insert(resizes, {['Part'] = generatedParts[40], ['CFrame'] = (origin + offset) * CFrame.new(-13.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[40], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[40], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[40], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[40], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[40], ['Name'] = "Smooth Block Model93"})
end
if generatedParts[41] then
    table.insert(resizes, {['Part'] = generatedParts[41], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[41], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[41], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[41], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[41], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[41], ['Name'] = "Smooth Block Model94"})
end
if generatedParts[42] then
    table.insert(resizes, {['Part'] = generatedParts[42], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[42], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[42], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[42], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[42], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[42], ['Name'] = "Smooth Block Model95"})
end
if generatedParts[43] then
    table.insert(resizes, {['Part'] = generatedParts[43], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[43], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[43], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[43], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[43], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[43], ['Name'] = "Smooth Block Model100"})
end
if generatedParts[44] then
    table.insert(resizes, {['Part'] = generatedParts[44], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[44], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[44], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[44], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[44], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[44], ['Name'] = "Smooth Block Model102"})
end
if generatedParts[45] then
    table.insert(resizes, {['Part'] = generatedParts[45], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 4.800, 39.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[45], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[45], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[45], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[45], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[45], ['Name'] = "Smooth Block Model104"})
end
if generatedParts[46] then
    table.insert(resizes, {['Part'] = generatedParts[46], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 4.800, 33.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[46], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[46], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[46], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[46], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[46], ['Name'] = "Smooth Block Model106"})
end
if generatedParts[47] then
    table.insert(resizes, {['Part'] = generatedParts[47], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 4.800, 27.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[47], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[47], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[47], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[47], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[47], ['Name'] = "Smooth Block Model109"})
end
if generatedParts[48] then
    table.insert(resizes, {['Part'] = generatedParts[48], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 19.200, 47.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.000, 2.400, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[48], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[48], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[48], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[48], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[48], ['Name'] = "Smooth Block Model111"})
end
if generatedParts[49] then
    table.insert(resizes, {['Part'] = generatedParts[49], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 19.200, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[49], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[49], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[49], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[49], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[49], ['Name'] = "Smooth Block Model112"})
end
if generatedParts[50] then
    table.insert(resizes, {['Part'] = generatedParts[50], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 19.200, 31.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[50], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[50], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[50], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[50], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[50], ['Name'] = "Smooth Block Model117"})
end
if generatedParts[51] then
    table.insert(resizes, {['Part'] = generatedParts[51], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[51], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[51], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[51], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[51], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[51], ['Name'] = "Smooth Block Model121"})
end
if generatedParts[52] then
    table.insert(resizes, {['Part'] = generatedParts[52], ['CFrame'] = (origin + offset) * CFrame.new(2.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[52], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[52], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[52], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[52], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[52], ['Name'] = "Smooth Block Model123"})
end
if generatedParts[53] then
    table.insert(resizes, {['Part'] = generatedParts[53], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 16.800, 27.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[53], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[53], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[53], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[53], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[53], ['Name'] = "Smooth Block Model127"})
end
if generatedParts[54] then
    table.insert(resizes, {['Part'] = generatedParts[54], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 16.800, 33.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[54], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[54], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[54], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[54], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[54], ['Name'] = "Smooth Block Model131"})
end
if generatedParts[55] then
    table.insert(resizes, {['Part'] = generatedParts[55], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 15.000, 28.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[55], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[55], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[55], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[55], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[55], ['Name'] = "Smooth Block Model135"})
end
if generatedParts[56] then
    table.insert(resizes, {['Part'] = generatedParts[56], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 13.200, 27.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[56], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[56], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[56], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[56], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[56], ['Name'] = "Smooth Block Model136"})
end
if generatedParts[57] then
    table.insert(resizes, {['Part'] = generatedParts[57], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 13.200, 28.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[57], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[57], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[57], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[57], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[57], ['Name'] = "Smooth Block Model140"})
end
if generatedParts[58] then
    table.insert(resizes, {['Part'] = generatedParts[58], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 15.000, 31.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[58], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[58], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[58], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[58], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[58], ['Name'] = "Smooth Block Model142"})
end
if generatedParts[59] then
    table.insert(resizes, {['Part'] = generatedParts[59], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, 27.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[59], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[59], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[59], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[59], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[59], ['Name'] = "Smooth Block Model144"})
end
if generatedParts[60] then
    table.insert(resizes, {['Part'] = generatedParts[60], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 13.200, 33.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[60], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[60], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[60], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[60], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[60], ['Name'] = "Smooth Block Model145"})
end
if generatedParts[61] then
    table.insert(resizes, {['Part'] = generatedParts[61], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 13.200, 34.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[61], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[61], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[61], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[61], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[61], ['Name'] = "Smooth Block Model148"})
end
if generatedParts[62] then
    table.insert(resizes, {['Part'] = generatedParts[62], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 15.000, 34.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[62], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[62], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[62], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[62], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[62], ['Name'] = "Smooth Block Model150"})
end
if generatedParts[63] then
    table.insert(resizes, {['Part'] = generatedParts[63], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, 34.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[63], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[63], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[63], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[63], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[63], ['Name'] = "Smooth Block Model"})
end
if generatedParts[64] then
    table.insert(resizes, {['Part'] = generatedParts[64], ['CFrame'] = (origin + offset) * CFrame.new(-26.500, 6.600, 31.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(8.000, 1.200, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[64], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[64], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[64], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[64], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[64], ['Name'] = "Smooth Block Model154"})
end
if generatedParts[65] then
    table.insert(resizes, {['Part'] = generatedParts[65], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 12.000, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[65], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[65], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[65], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[65], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[65], ['Name'] = "Smooth Block Model156"})
end
if generatedParts[66] then
    table.insert(resizes, {['Part'] = generatedParts[66], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 14.400, 37.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[66], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[66], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[66], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[66], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[66], ['Name'] = "Smooth Block Model158"})
end
if generatedParts[67] then
    table.insert(resizes, {['Part'] = generatedParts[67], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, 37.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[67], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[67], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[67], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[67], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[67], ['Name'] = "Smooth Block Model162"})
end
if generatedParts[68] then
    table.insert(resizes, {['Part'] = generatedParts[68], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 7.200, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[68], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[68], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[68], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[68], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[68], ['Name'] = "Smooth Block Model165"})
end
if generatedParts[69] then
    table.insert(resizes, {['Part'] = generatedParts[69], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 12.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[69], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[69], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[69], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[69], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[69], ['Name'] = "Smooth Block Model167"})
end
if generatedParts[70] then
    table.insert(resizes, {['Part'] = generatedParts[70], ['CFrame'] = (origin + offset) * CFrame.new(1.500, 14.400, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[70], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[70], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[70], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[70], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[70], ['Name'] = "Smooth Block Model168"})
end
if generatedParts[71] then
    table.insert(resizes, {['Part'] = generatedParts[71], ['CFrame'] = (origin + offset) * CFrame.new(0.500, 12.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[71], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[71], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[71], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[71], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[71], ['Name'] = "Smooth Block Model171"})
end
if generatedParts[72] then
    table.insert(resizes, {['Part'] = generatedParts[72], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 14.400, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[72], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[72], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[72], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[72], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[72], ['Name'] = "Smooth Block Model173"})
end
if generatedParts[73] then
    table.insert(resizes, {['Part'] = generatedParts[73], ['CFrame'] = (origin + offset) * CFrame.new(-3.500, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[73], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[73], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[73], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[73], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[73], ['Name'] = "Smooth Block Model177"})
end
if generatedParts[74] then
    table.insert(resizes, {['Part'] = generatedParts[74], ['CFrame'] = (origin + offset) * CFrame.new(7.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(8.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[74], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[74], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[74], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[74], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[74], ['Name'] = "Smooth Block Model182"})
end
if generatedParts[75] then
    table.insert(resizes, {['Part'] = generatedParts[75], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[75], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[75], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[75], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[75], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[75], ['Name'] = "Smooth Block Model185"})
end
if generatedParts[76] then
    table.insert(resizes, {['Part'] = generatedParts[76], ['CFrame'] = (origin + offset) * CFrame.new(5.500, 12.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[76], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[76], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[76], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[76], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[76], ['Name'] = "Smooth Block Model190"})
end
if generatedParts[77] then
    table.insert(resizes, {['Part'] = generatedParts[77], ['CFrame'] = (origin + offset) * CFrame.new(9.000, 15.000, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[77], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[77], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[77], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[77], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[77], ['Name'] = "Smooth Block Model192"})
end
if generatedParts[78] then
    table.insert(resizes, {['Part'] = generatedParts[78], ['CFrame'] = (origin + offset) * CFrame.new(1.500, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[78], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[78], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[78], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[78], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[78], ['Name'] = "Smooth Block Model196"})
end
if generatedParts[79] then
    table.insert(resizes, {['Part'] = generatedParts[79], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 7.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[79], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[79], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[79], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[79], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[79], ['Name'] = "Smooth Block Model198"})
end
if generatedParts[80] then
    table.insert(resizes, {['Part'] = generatedParts[80], ['CFrame'] = (origin + offset) * CFrame.new(14.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[80], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[80], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[80], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[80], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[80], ['Name'] = "Smooth Block Model199"})
end
if generatedParts[81] then
    table.insert(resizes, {['Part'] = generatedParts[81], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 19.200, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[81], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[81], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[81], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[81], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[81], ['Name'] = "Smooth Block Model201"})
end
if generatedParts[82] then
    table.insert(resizes, {['Part'] = generatedParts[82], ['CFrame'] = (origin + offset) * CFrame.new(14.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[82], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[82], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[82], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[82], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[82], ['Name'] = "Smooth Block Model202"})
end
if generatedParts[83] then
    table.insert(resizes, {['Part'] = generatedParts[83], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 14.400, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[83], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[83], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[83], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[83], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[83], ['Name'] = "Smooth Block Model204"})
end
if generatedParts[84] then
    table.insert(resizes, {['Part'] = generatedParts[84], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 12.000, 24.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[84], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[84], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[84], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[84], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[84], ['Name'] = "Smooth Block Model206"})
end
if generatedParts[85] then
    table.insert(resizes, {['Part'] = generatedParts[85], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[85], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[85], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[85], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[85], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[85], ['Name'] = "Smooth Block Model211"})
end
if generatedParts[86] then
    table.insert(resizes, {['Part'] = generatedParts[86], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 7.200, 24.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[86], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[86], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[86], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[86], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[86], ['Name'] = "Smooth Block Model212"})
end
if generatedParts[87] then
    table.insert(resizes, {['Part'] = generatedParts[87], ['CFrame'] = (origin + offset) * CFrame.new(8.500, 13.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[87], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[87], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[87], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[87], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[87], ['Name'] = "Smooth Block Model217"})
end
if generatedParts[88] then
    table.insert(resizes, {['Part'] = generatedParts[88], ['CFrame'] = (origin + offset) * CFrame.new(9.500, 13.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[88], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[88], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[88], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[88], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[88], ['Name'] = "Smooth Block Model220"})
end
if generatedParts[89] then
    table.insert(resizes, {['Part'] = generatedParts[89], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 15.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[89], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[89], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[89], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[89], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[89], ['Name'] = "Smooth Block Model221"})
end
if generatedParts[90] then
    table.insert(resizes, {['Part'] = generatedParts[90], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 9.600, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[90], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[90], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[90], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[90], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[90], ['Name'] = "Smooth Block Model223"})
end
if generatedParts[91] then
    table.insert(resizes, {['Part'] = generatedParts[91], ['CFrame'] = (origin + offset) * CFrame.new(0.500, 7.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[91], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[91], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[91], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[91], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[91], ['Name'] = "Smooth Block Model226"})
end
if generatedParts[92] then
    table.insert(resizes, {['Part'] = generatedParts[92], ['CFrame'] = (origin + offset) * CFrame.new(18.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[92], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[92], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[92], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[92], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[92], ['Name'] = "Smooth Block Model228"})
end
if generatedParts[93] then
    table.insert(resizes, {['Part'] = generatedParts[93], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 4.800, 21.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[93], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[93], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[93], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[93], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[93], ['Name'] = "Smooth Block Model231"})
end
if generatedParts[94] then
    table.insert(resizes, {['Part'] = generatedParts[94], ['CFrame'] = (origin + offset) * CFrame.new(2.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[94], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[94], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[94], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[94], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[94], ['Name'] = "Smooth Block Model232"})
end
if generatedParts[95] then
    table.insert(resizes, {['Part'] = generatedParts[95], ['CFrame'] = (origin + offset) * CFrame.new(6.500, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(3.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[95], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[95], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[95], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[95], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[95], ['Name'] = "Smooth Block Model235"})
end
if generatedParts[96] then
    table.insert(resizes, {['Part'] = generatedParts[96], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 19.200, 20.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.400, 54.000)})
    table.insert(colors, {['Part'] = generatedParts[96], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[96], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[96], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[96], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[96], ['Name'] = "Smooth Block Model238"})
end
if generatedParts[97] then
    table.insert(resizes, {['Part'] = generatedParts[97], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 19.200, 19.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[97], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[97], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[97], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[97], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[97], ['Name'] = "Smooth Block Model241"})
end
if generatedParts[98] then
    table.insert(resizes, {['Part'] = generatedParts[98], ['CFrame'] = (origin + offset) * CFrame.new(20.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[98], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[98], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[98], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[98], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[98], ['Name'] = "Smooth Block Model243"})
end
if generatedParts[99] then
    table.insert(resizes, {['Part'] = generatedParts[99], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 16.800, 21.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[99], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[99], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[99], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[99], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[99], ['Name'] = "Smooth Block Model246"})
end
if generatedParts[100] then
    table.insert(resizes, {['Part'] = generatedParts[100], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 14.400, 20.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[100], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[100], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[100], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[100], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[100], ['Name'] = "Smooth Block Model251"})
end
if generatedParts[101] then
    table.insert(resizes, {['Part'] = generatedParts[101], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 12.000, 19.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[101], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[101], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[101], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[101], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[101], ['Name'] = "Smooth Block Model253"})
end
if generatedParts[102] then
    table.insert(resizes, {['Part'] = generatedParts[102], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, 20.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[102], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[102], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[102], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[102], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[102], ['Name'] = "Smooth Block Model254"})
end
if generatedParts[103] then
    table.insert(resizes, {['Part'] = generatedParts[103], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 7.200, 19.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[103], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[103], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[103], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[103], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[103], ['Name'] = "Smooth Block Model256"})
end
if generatedParts[104] then
    table.insert(resizes, {['Part'] = generatedParts[104], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 2.400, 20.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(56.000, 2.400, 56.000)})
    table.insert(colors, {['Part'] = generatedParts[104], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[104], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[104], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[104], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[104], ['Name'] = "Smooth Block Model259"})
end
if generatedParts[105] then
    table.insert(resizes, {['Part'] = generatedParts[105], ['CFrame'] = (origin + offset) * CFrame.new(8.500, 7.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 8.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[105], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[105], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[105], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[105], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[105], ['Name'] = "Smooth Block Model298"})
end
if generatedParts[106] then
    table.insert(resizes, {['Part'] = generatedParts[106], ['CFrame'] = (origin + offset) * CFrame.new(14.500, 13.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[106], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[106], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[106], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[106], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[106], ['Name'] = "Smooth Block Model299"})
end
if generatedParts[107] then
    table.insert(resizes, {['Part'] = generatedParts[107], ['CFrame'] = (origin + offset) * CFrame.new(15.500, 13.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[107], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[107], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[107], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[107], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[107], ['Name'] = "Smooth Block Model300"})
end
if generatedParts[108] then
    table.insert(resizes, {['Part'] = generatedParts[108], ['CFrame'] = (origin + offset) * CFrame.new(15.000, 15.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[108], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[108], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[108], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[108], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[108], ['Name'] = "Smooth Block Model303"})
end
if generatedParts[109] then
    table.insert(resizes, {['Part'] = generatedParts[109], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 4.200, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(52.000, 1.200, 52.000)})
    table.insert(colors, {['Part'] = generatedParts[109], ['Color'] = Color3.new(0.431, 0.600, 0.792), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[109], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[109], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[109], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[109], ['Name'] = "Smooth Block Model308"})
end
if generatedParts[110] then
    table.insert(resizes, {['Part'] = generatedParts[110], ['CFrame'] = (origin + offset) * CFrame.new(18.500, 14.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[110], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[110], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[110], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[110], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[110], ['Name'] = "Smooth Block Model309"})
end
if generatedParts[111] then
    table.insert(resizes, {['Part'] = generatedParts[111], ['CFrame'] = (origin + offset) * CFrame.new(5.500, 7.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[111], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[111], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[111], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[111], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[111], ['Name'] = "Smooth Block Model311"})
end
if generatedParts[112] then
    table.insert(resizes, {['Part'] = generatedParts[112], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 19.200, 20.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.400, 54.000)})
    table.insert(colors, {['Part'] = generatedParts[112], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[112], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[112], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[112], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[112], ['Name'] = "Smooth Block Model312"})
end
if generatedParts[113] then
    table.insert(resizes, {['Part'] = generatedParts[113], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 19.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[113], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[113], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[113], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[113], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[113], ['Name'] = "Smooth Block Model317"})
end
if generatedParts[114] then
    table.insert(resizes, {['Part'] = generatedParts[114], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 19.200, 27.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[114], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[114], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[114], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[114], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[114], ['Name'] = "Smooth Block Model320"})
end
if generatedParts[115] then
    table.insert(resizes, {['Part'] = generatedParts[115], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 19.200, 21.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[115], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[115], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[115], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[115], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[115], ['Name'] = "Smooth Block Model322"})
end
if generatedParts[116] then
    table.insert(resizes, {['Part'] = generatedParts[116], ['CFrame'] = (origin + offset) * CFrame.new(16.500, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[116], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[116], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[116], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[116], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[116], ['Name'] = "Smooth Block Model326"})
end
if generatedParts[117] then
    table.insert(resizes, {['Part'] = generatedParts[117], ['CFrame'] = (origin + offset) * CFrame.new(20.000, 4.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[117], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[117], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[117], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[117], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[117], ['Name'] = "Smooth Block Model327"})
end
if generatedParts[118] then
    table.insert(resizes, {['Part'] = generatedParts[118], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 4.800, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[118], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[118], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[118], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[118], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[118], ['Name'] = "Smooth Block Model328"})
end
if generatedParts[119] then
    table.insert(resizes, {['Part'] = generatedParts[119], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 4.800, 3.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[119], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[119], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[119], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[119], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[119], ['Name'] = "Smooth Block Model332"})
end
if generatedParts[120] then
    table.insert(resizes, {['Part'] = generatedParts[120], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 4.800, 9.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[120], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[120], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[120], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[120], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[120], ['Name'] = "Smooth Block Model334"})
end
if generatedParts[121] then
    table.insert(resizes, {['Part'] = generatedParts[121], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 16.800, 7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[121], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[121], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[121], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[121], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[121], ['Name'] = "Smooth Block Model336"})
end
if generatedParts[122] then
    table.insert(resizes, {['Part'] = generatedParts[122], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 16.800, 13.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[122], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[122], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[122], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[122], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[122], ['Name'] = "Smooth Block Model340"})
end
if generatedParts[123] then
    table.insert(resizes, {['Part'] = generatedParts[123], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 16.800, 19.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[123], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[123], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[123], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[123], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[123], ['Name'] = "Smooth Block Model341"})
end
if generatedParts[124] then
    table.insert(resizes, {['Part'] = generatedParts[124], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 16.800, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[124], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[124], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[124], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[124], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[124], ['Name'] = "Smooth Block Model344"})
end
if generatedParts[125] then
    table.insert(resizes, {['Part'] = generatedParts[125], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 16.800, 31.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[125], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[125], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[125], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[125], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[125], ['Name'] = "Smooth Block Model347"})
end
if generatedParts[126] then
    table.insert(resizes, {['Part'] = generatedParts[126], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 16.800, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[126], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[126], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[126], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[126], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[126], ['Name'] = "Smooth Block Model350"})
end
if generatedParts[127] then
    table.insert(resizes, {['Part'] = generatedParts[127], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 14.400, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[127], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[127], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[127], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[127], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[127], ['Name'] = "Smooth Block Model352"})
end
if generatedParts[128] then
    table.insert(resizes, {['Part'] = generatedParts[128], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 14.400, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[128], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[128], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[128], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[128], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[128], ['Name'] = "Smooth Block Model354"})
end
if generatedParts[129] then
    table.insert(resizes, {['Part'] = generatedParts[129], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 12.000, 15.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[129], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[129], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[129], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[129], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[129], ['Name'] = "Smooth Block Model356"})
end
if generatedParts[130] then
    table.insert(resizes, {['Part'] = generatedParts[130], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 14.400, 44.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[130], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[130], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[130], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[130], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[130], ['Name'] = "Smooth Block Model361"})
end
if generatedParts[131] then
    table.insert(resizes, {['Part'] = generatedParts[131], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 14.400, 24.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[131], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[131], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[131], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[131], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[131], ['Name'] = "Smooth Block Model362"})
end
if generatedParts[132] then
    table.insert(resizes, {['Part'] = generatedParts[132], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 14.400, 19.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[132], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[132], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[132], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[132], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[132], ['Name'] = "Smooth Block Model364"})
end
if generatedParts[133] then
    table.insert(resizes, {['Part'] = generatedParts[133], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 12.000, 20.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[133], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[133], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[133], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[133], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[133], ['Name'] = "Smooth Block Model365"})
end
if generatedParts[134] then
    table.insert(resizes, {['Part'] = generatedParts[134], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 12.000, 38.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[134], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[134], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[134], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[134], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[134], ['Name'] = "Smooth Block Model370"})
end
if generatedParts[135] then
    table.insert(resizes, {['Part'] = generatedParts[135], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 15.000, 12.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[135], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[135], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[135], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[135], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[135], ['Name'] = "Smooth Block Model376"})
end
if generatedParts[136] then
    table.insert(resizes, {['Part'] = generatedParts[136], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 13.200, 12.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[136], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[136], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[136], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[136], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[136], ['Name'] = "Smooth Block Model380"})
end
if generatedParts[137] then
    table.insert(resizes, {['Part'] = generatedParts[137], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 13.200, 11.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[137], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[137], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[137], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[137], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[137], ['Name'] = "Smooth Block Model381"})
end
if generatedParts[138] then
    table.insert(resizes, {['Part'] = generatedParts[138], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 15.000, 9.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[138], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[138], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[138], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[138], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[138], ['Name'] = "Smooth Block Model383"})
end
if generatedParts[139] then
    table.insert(resizes, {['Part'] = generatedParts[139], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, 12.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[139], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[139], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[139], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[139], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[139], ['Name'] = "Smooth Block Model385"})
end
if generatedParts[140] then
    table.insert(resizes, {['Part'] = generatedParts[140], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 13.200, 6.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[140], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[140], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[140], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[140], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[140], ['Name'] = "Smooth Block Model"})
end
if generatedParts[141] then
    table.insert(resizes, {['Part'] = generatedParts[141], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 13.200, 5.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[141], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[141], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[141], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[141], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[141], ['Name'] = "Smooth Block Model388"})
end
if generatedParts[142] then
    table.insert(resizes, {['Part'] = generatedParts[142], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 15.000, 6.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[142], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[142], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[142], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[142], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[142], ['Name'] = "Smooth Block Model392"})
end
if generatedParts[143] then
    table.insert(resizes, {['Part'] = generatedParts[143], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, 5.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[143], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[143], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[143], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[143], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[143], ['Name'] = "Smooth Block Model396"})
end
if generatedParts[144] then
    table.insert(resizes, {['Part'] = generatedParts[144], ['CFrame'] = (origin + offset) * CFrame.new(28.500, 6.600, 9.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(8.000, 1.200, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[144], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[144], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[144], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[144], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[144], ['Name'] = "Smooth Block Model397"})
end
if generatedParts[145] then
    table.insert(resizes, {['Part'] = generatedParts[145], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 12.000, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[145], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[145], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[145], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[145], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[145], ['Name'] = "Smooth Block Model402"})
end
if generatedParts[146] then
    table.insert(resizes, {['Part'] = generatedParts[146], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 12.000, 45.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[146], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[146], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[146], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[146], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[146], ['Name'] = "Smooth Block Model404"})
end
if generatedParts[147] then
    table.insert(resizes, {['Part'] = generatedParts[147], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 2.400, 50.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 4.000)})
    table.insert(colors, {['Part'] = generatedParts[147], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[147], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[147], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[147], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[147], ['Name'] = "Smooth Block Model406"})
end
if generatedParts[148] then
    table.insert(resizes, {['Part'] = generatedParts[148], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 19.200, 13.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[148], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[148], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[148], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[148], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[148], ['Name'] = "Smooth Block Model407"})
end
if generatedParts[149] then
    table.insert(resizes, {['Part'] = generatedParts[149], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 19.200, 7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[149], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[149], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[149], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[149], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[149], ['Name'] = "Smooth Block Model411"})
end
if generatedParts[150] then
    table.insert(resizes, {['Part'] = generatedParts[150], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 19.200, 1.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[150], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[150], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[150], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[150], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[150], ['Name'] = "Smooth Block Model415"})
end
if generatedParts[151] then
    table.insert(resizes, {['Part'] = generatedParts[151], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 16.800, 3.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[151], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[151], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[151], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[151], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[151], ['Name'] = "Smooth Block Model417"})
end
if generatedParts[152] then
    table.insert(resizes, {['Part'] = generatedParts[152], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 16.800, 9.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[152], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[152], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[152], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[152], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[152], ['Name'] = "Smooth Block Model419"})
end
if generatedParts[153] then
    table.insert(resizes, {['Part'] = generatedParts[153], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 16.800, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[153], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[153], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[153], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[153], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[153], ['Name'] = "Smooth Block Model420"})
end
if generatedParts[154] then
    table.insert(resizes, {['Part'] = generatedParts[154], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 16.800, 43.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[154], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[154], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[154], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[154], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[154], ['Name'] = "Smooth Block Model421"})
end
if generatedParts[155] then
    table.insert(resizes, {['Part'] = generatedParts[155], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 16.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[155], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[155], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[155], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[155], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[155], ['Name'] = "Smooth Block Model426"})
end
if generatedParts[156] then
    table.insert(resizes, {['Part'] = generatedParts[156], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 14.400, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[156], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[156], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[156], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[156], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[156], ['Name'] = "Smooth Block Model429"})
end
if generatedParts[157] then
    table.insert(resizes, {['Part'] = generatedParts[157], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 14.400, 15.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[157], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[157], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[157], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[157], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[157], ['Name'] = "Smooth Block Model432"})
end
if generatedParts[158] then
    table.insert(resizes, {['Part'] = generatedParts[158], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 12.000, 1.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[158], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[158], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[158], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[158], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[158], ['Name'] = "Smooth Block Model436"})
end
if generatedParts[159] then
    table.insert(resizes, {['Part'] = generatedParts[159], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 12.000, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[159], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[159], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[159], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[159], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[159], ['Name'] = "Smooth Block Model440"})
end
if generatedParts[160] then
    table.insert(resizes, {['Part'] = generatedParts[160], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 15.000, 6.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[160], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[160], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[160], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[160], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[160], ['Name'] = "Smooth Block Model442"})
end
if generatedParts[161] then
    table.insert(resizes, {['Part'] = generatedParts[161], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 13.200, 5.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[161], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[161], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[161], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[161], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[161], ['Name'] = "Smooth Block Model447"})
end
if generatedParts[162] then
    table.insert(resizes, {['Part'] = generatedParts[162], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 13.200, 6.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[162], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[162], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[162], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[162], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[162], ['Name'] = "Smooth Block Model448"})
end
if generatedParts[163] then
    table.insert(resizes, {['Part'] = generatedParts[163], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 15.000, 9.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[163], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[163], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[163], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[163], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[163], ['Name'] = "Smooth Block Model450"})
end
if generatedParts[164] then
    table.insert(resizes, {['Part'] = generatedParts[164], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, 5.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[164], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[164], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[164], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[164], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[164], ['Name'] = "Smooth Block Model453"})
end
if generatedParts[165] then
    table.insert(resizes, {['Part'] = generatedParts[165], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 13.200, 11.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[165], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[165], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[165], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[165], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[165], ['Name'] = "Smooth Block Model456"})
end
if generatedParts[166] then
    table.insert(resizes, {['Part'] = generatedParts[166], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 13.200, 12.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[166], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[166], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[166], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[166], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[166], ['Name'] = "Smooth Block Model457"})
end
if generatedParts[167] then
    table.insert(resizes, {['Part'] = generatedParts[167], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 15.000, 12.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[167], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[167], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[167], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[167], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[167], ['Name'] = "Smooth Block Model459"})
end
if generatedParts[168] then
    table.insert(resizes, {['Part'] = generatedParts[168], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, 12.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[168], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[168], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[168], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[168], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[168], ['Name'] = "Smooth Block Model"})
end
if generatedParts[169] then
    table.insert(resizes, {['Part'] = generatedParts[169], ['CFrame'] = (origin + offset) * CFrame.new(-26.500, 6.600, 9.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(8.000, 1.200, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[169], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[169], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[169], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[169], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[169], ['Name'] = "Smooth Block Model467"})
end
if generatedParts[170] then
    table.insert(resizes, {['Part'] = generatedParts[170], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, 15.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[170], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[170], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[170], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[170], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[170], ['Name'] = "Smooth Block Model468"})
end
if generatedParts[171] then
    table.insert(resizes, {['Part'] = generatedParts[171], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[171], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[171], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[171], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[171], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[171], ['Name'] = "Smooth Block Model473"})
end
if generatedParts[172] then
    table.insert(resizes, {['Part'] = generatedParts[172], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 7.200, 1.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[172], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[172], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[172], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[172], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[172], ['Name'] = "Smooth Block Model476"})
end
if generatedParts[173] then
    table.insert(resizes, {['Part'] = generatedParts[173], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 7.200, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[173], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[173], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[173], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[173], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[173], ['Name'] = "Smooth Block Model479"})
end
if generatedParts[174] then
    table.insert(resizes, {['Part'] = generatedParts[174], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 4.200, 48.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 1.200, 4.000)})
    table.insert(colors, {['Part'] = generatedParts[174], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[174], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[174], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[174], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[174], ['Name'] = "Smooth Block Model480"})
end
if generatedParts[175] then
    table.insert(resizes, {['Part'] = generatedParts[175], ['CFrame'] = (origin + offset) * CFrame.new(15.500, 7.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 8.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[175], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[175], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[175], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[175], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[175], ['Name'] = "Smooth Block Model482"})
end
if generatedParts[176] then
    table.insert(resizes, {['Part'] = generatedParts[176], ['CFrame'] = (origin + offset) * CFrame.new(19.000, 12.000, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[176], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[176], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[176], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[176], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[176], ['Name'] = "Smooth Block Model483"})
end
if generatedParts[177] then
    table.insert(resizes, {['Part'] = generatedParts[177], ['CFrame'] = (origin + offset) * CFrame.new(18.500, 9.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[177], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[177], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[177], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[177], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[177], ['Name'] = "Smooth Block Model487"})
end
if generatedParts[178] then
    table.insert(resizes, {['Part'] = generatedParts[178], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 14.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[178], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[178], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[178], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[178], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[178], ['Name'] = "Smooth Block Model490"})
end
if generatedParts[179] then
    table.insert(resizes, {['Part'] = generatedParts[179], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 9.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[179], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[179], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[179], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[179], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[179], ['Name'] = "Smooth Block Model492"})
end
if generatedParts[180] then
    table.insert(resizes, {['Part'] = generatedParts[180], ['CFrame'] = (origin + offset) * CFrame.new(24.500, 12.000, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[180], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[180], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[180], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[180], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[180], ['Name'] = "Smooth Block Model493"})
end
if generatedParts[181] then
    table.insert(resizes, {['Part'] = generatedParts[181], ['CFrame'] = (origin + offset) * CFrame.new(19.000, 7.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[181], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[181], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[181], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[181], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[181], ['Name'] = "Smooth Block Model496"})
end
if generatedParts[182] then
    table.insert(resizes, {['Part'] = generatedParts[182], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 1.202, 53.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[182], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[182], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[182], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[182], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[182], ['Name'] = "Smooth Block Model"})
end
if generatedParts[183] then
    table.insert(resizes, {['Part'] = generatedParts[183], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 0.602, 55.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[183], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[183], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[183], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[183], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[183], ['Name'] = "Smooth Block Model"})
end
if generatedParts[184] then
    table.insert(resizes, {['Part'] = generatedParts[184], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 19.200, 45.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[184], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[184], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[184], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[184], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[184], ['Name'] = "Smooth Block Model502"})
end
if generatedParts[185] then
    table.insert(resizes, {['Part'] = generatedParts[185], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 19.200, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[185], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[185], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[185], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[185], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[185], ['Name'] = "Smooth Block Model503"})
end
if generatedParts[186] then
    table.insert(resizes, {['Part'] = generatedParts[186], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 19.200, 33.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[186], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[186], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[186], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[186], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[186], ['Name'] = "Smooth Block Model506"})
end
if generatedParts[187] then
    table.insert(resizes, {['Part'] = generatedParts[187], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 19.200, 15.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[187], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[187], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[187], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[187], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[187], ['Name'] = "Smooth Block Model509"})
end
if generatedParts[188] then
    table.insert(resizes, {['Part'] = generatedParts[188], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 19.200, 9.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[188], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[188], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[188], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[188], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[188], ['Name'] = "Smooth Block Model514"})
end
if generatedParts[189] then
    table.insert(resizes, {['Part'] = generatedParts[189], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 15.000, 34.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[189], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[189], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[189], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[189], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[189], ['Name'] = "Smooth Block Model519"})
end
if generatedParts[190] then
    table.insert(resizes, {['Part'] = generatedParts[190], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 13.200, 34.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[190], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[190], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[190], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[190], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[190], ['Name'] = "Smooth Block Model521"})
end
if generatedParts[191] then
    table.insert(resizes, {['Part'] = generatedParts[191], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 13.200, 33.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[191], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[191], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[191], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[191], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[191], ['Name'] = "Smooth Block Model524"})
end
if generatedParts[192] then
    table.insert(resizes, {['Part'] = generatedParts[192], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 15.000, 31.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[192], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[192], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[192], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[192], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[192], ['Name'] = "Smooth Block Model525"})
end
if generatedParts[193] then
    table.insert(resizes, {['Part'] = generatedParts[193], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, 34.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[193], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[193], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[193], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[193], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[193], ['Name'] = "Smooth Block Model528"})
end
if generatedParts[194] then
    table.insert(resizes, {['Part'] = generatedParts[194], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 13.200, 28.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[194], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[194], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[194], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[194], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[194], ['Name'] = "Smooth Block Model531"})
end
if generatedParts[195] then
    table.insert(resizes, {['Part'] = generatedParts[195], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 13.200, 27.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[195], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[195], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[195], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[195], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[195], ['Name'] = "Smooth Block Model534"})
end
if generatedParts[196] then
    table.insert(resizes, {['Part'] = generatedParts[196], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 15.000, 28.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[196], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[196], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[196], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[196], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[196], ['Name'] = "Smooth Block Model535"})
end
if generatedParts[197] then
    table.insert(resizes, {['Part'] = generatedParts[197], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, 27.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[197], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[197], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[197], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[197], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[197], ['Name'] = "Smooth Block Model"})
end
if generatedParts[198] then
    table.insert(resizes, {['Part'] = generatedParts[198], ['CFrame'] = (origin + offset) * CFrame.new(28.500, 6.600, 31.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(8.000, 1.200, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[198], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[198], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[198], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[198], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[198], ['Name'] = "Smooth Block Model542"})
end
if generatedParts[199] then
    table.insert(resizes, {['Part'] = generatedParts[199], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 4.800, -3.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[199], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[199], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[199], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[199], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[199], ['Name'] = "Smooth Block Model543"})
end
if generatedParts[200] then
    table.insert(resizes, {['Part'] = generatedParts[200], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 16.800, -3.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[200], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[200], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[200], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[200], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[200], ['Name'] = "Smooth Block Model544"})
end
if generatedParts[201] then
    table.insert(resizes, {['Part'] = generatedParts[201], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 9.600, -4.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[201], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[201], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[201], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[201], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[201], ['Name'] = "Smooth Block Model545"})
end
if generatedParts[202] then
    table.insert(resizes, {['Part'] = generatedParts[202], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, 2.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[202], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[202], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[202], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[202], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[202], ['Name'] = "Smooth Block Model549"})
end
if generatedParts[203] then
    table.insert(resizes, {['Part'] = generatedParts[203], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 14.400, -4.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[203], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[203], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[203], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[203], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[203], ['Name'] = "Smooth Block Model551"})
end
if generatedParts[204] then
    table.insert(resizes, {['Part'] = generatedParts[204], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 12.000, -5.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[204], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[204], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[204], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[204], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[204], ['Name'] = "Smooth Block Model555"})
end
if generatedParts[205] then
    table.insert(resizes, {['Part'] = generatedParts[205], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 7.200, -5.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[205], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[205], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[205], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[205], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[205], ['Name'] = "Smooth Block Model556"})
end
if generatedParts[206] then
    table.insert(resizes, {['Part'] = generatedParts[206], ['CFrame'] = (origin + offset) * CFrame.new(24.500, 7.200, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[206], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[206], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[206], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[206], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[206], ['Name'] = "Smooth Block Model559"})
end
if generatedParts[207] then
    table.insert(resizes, {['Part'] = generatedParts[207], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 14.400, 2.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[207], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[207], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[207], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[207], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[207], ['Name'] = "Smooth Block Model562"})
end
if generatedParts[208] then
    table.insert(resizes, {['Part'] = generatedParts[208], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 19.200, 3.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[208], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[208], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[208], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[208], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[208], ['Name'] = "Smooth Block Model563"})
end
if generatedParts[209] then
    table.insert(resizes, {['Part'] = generatedParts[209], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 4.800, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[209], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[209], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[209], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[209], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[209], ['Name'] = "Smooth Block Model565"})
end
if generatedParts[210] then
    table.insert(resizes, {['Part'] = generatedParts[210], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, 44.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[210], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[210], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[210], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[210], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[210], ['Name'] = "Smooth Block Model566"})
end
if generatedParts[211] then
    table.insert(resizes, {['Part'] = generatedParts[211], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, 24.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[211], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[211], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[211], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[211], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[211], ['Name'] = "Smooth Block Model569"})
end
if generatedParts[212] then
    table.insert(resizes, {['Part'] = generatedParts[212], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[212], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[212], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[212], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[212], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[212], ['Name'] = "Smooth Block Model571"})
end
if generatedParts[213] then
    table.insert(resizes, {['Part'] = generatedParts[213], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, 19.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[213], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[213], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[213], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[213], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[213], ['Name'] = "Smooth Block Model573"})
end
if generatedParts[214] then
    table.insert(resizes, {['Part'] = generatedParts[214], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 12.000, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[214], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[214], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[214], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[214], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[214], ['Name'] = "Smooth Block Model575"})
end
if generatedParts[215] then
    table.insert(resizes, {['Part'] = generatedParts[215], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, 15.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[215], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[215], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[215], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[215], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[215], ['Name'] = "Smooth Block Model580"})
end
if generatedParts[216] then
    table.insert(resizes, {['Part'] = generatedParts[216], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 19.200, -5.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[216], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[216], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[216], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[216], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[216], ['Name'] = "Smooth Block Model582"})
end
if generatedParts[217] then
    table.insert(resizes, {['Part'] = generatedParts[217], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[217], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[217], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[217], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[217], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[217], ['Name'] = "Smooth Block Model586"})
end
if generatedParts[218] then
    table.insert(resizes, {['Part'] = generatedParts[218], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[218], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[218], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[218], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[218], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[218], ['Name'] = "Smooth Block Model587"})
end
if generatedParts[219] then
    table.insert(resizes, {['Part'] = generatedParts[219], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[219], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[219], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[219], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[219], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[219], ['Name'] = "Smooth Block Model588"})
end
if generatedParts[220] then
    table.insert(resizes, {['Part'] = generatedParts[220], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 16.800, 1.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[220], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[220], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[220], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[220], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[220], ['Name'] = "Smooth Block Model590"})
end
if generatedParts[221] then
    table.insert(resizes, {['Part'] = generatedParts[221], ['CFrame'] = (origin + offset) * CFrame.new(-17.000, 12.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[221], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[221], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[221], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[221], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[221], ['Name'] = "Smooth Block Model594"})
end
if generatedParts[222] then
    table.insert(resizes, {['Part'] = generatedParts[222], ['CFrame'] = (origin + offset) * CFrame.new(-16.500, 14.400, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[222], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[222], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[222], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[222], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[222], ['Name'] = "Smooth Block Model595"})
end
if generatedParts[223] then
    table.insert(resizes, {['Part'] = generatedParts[223], ['CFrame'] = (origin + offset) * CFrame.new(-16.500, 9.600, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[223], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[223], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[223], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[223], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[223], ['Name'] = "Smooth Block Model598"})
end
if generatedParts[224] then
    table.insert(resizes, {['Part'] = generatedParts[224], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 14.400, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[224], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[224], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[224], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[224], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[224], ['Name'] = "Smooth Block Model601"})
end
if generatedParts[225] then
    table.insert(resizes, {['Part'] = generatedParts[225], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 9.600, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[225], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[225], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[225], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[225], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[225], ['Name'] = "Smooth Block Model606"})
end
if generatedParts[226] then
    table.insert(resizes, {['Part'] = generatedParts[226], ['CFrame'] = (origin + offset) * CFrame.new(-22.500, 12.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[226], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[226], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[226], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[226], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[226], ['Name'] = "Smooth Block Model608"})
end
if generatedParts[227] then
    table.insert(resizes, {['Part'] = generatedParts[227], ['CFrame'] = (origin + offset) * CFrame.new(-22.500, 7.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[227], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[227], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[227], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[227], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[227], ['Name'] = "Smooth Block Model610"})
end
if generatedParts[228] then
    table.insert(resizes, {['Part'] = generatedParts[228], ['CFrame'] = (origin + offset) * CFrame.new(-17.000, 7.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[228], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[228], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[228], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[228], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[228], ['Name'] = "Smooth Block Model614"})
end
if generatedParts[229] then
    table.insert(resizes, {['Part'] = generatedParts[229], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[229], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[229], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[229], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[229], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[229], ['Name'] = "Smooth Block Model618"})
end
if generatedParts[230] then
    table.insert(resizes, {['Part'] = generatedParts[230], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[230], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[230], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[230], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[230], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[230], ['Name'] = "Smooth Block Model626"})
end
if generatedParts[231] then
    table.insert(resizes, {['Part'] = generatedParts[231], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[231], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[231], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[231], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[231], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[231], ['Name'] = "Smooth Block Model627"})
end
if generatedParts[232] then
    table.insert(resizes, {['Part'] = generatedParts[232], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[232], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[232], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[232], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[232], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[232], ['Name'] = "Smooth Block Model629"})
end
if generatedParts[233] then
    table.insert(resizes, {['Part'] = generatedParts[233], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[233], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[233], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[233], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[233], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[233], ['Name'] = "Smooth Block Model631"})
end
if generatedParts[234] then
    table.insert(resizes, {['Part'] = generatedParts[234], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 7.200, 20.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[234], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[234], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[234], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[234], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[234], ['Name'] = "Smooth Block Model633"})
end
if generatedParts[235] then
    table.insert(resizes, {['Part'] = generatedParts[235], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 4.800, 47.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[235], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[235], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[235], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[235], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[235], ['Name'] = "Smooth Block Model638"})
end
if generatedParts[236] then
    table.insert(resizes, {['Part'] = generatedParts[236], ['CFrame'] = (origin + offset) * CFrame.new(0.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[236], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[236], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[236], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[236], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[236], ['Name'] = "Smooth Block Model640"})
end
if generatedParts[237] then
    table.insert(resizes, {['Part'] = generatedParts[237], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[237], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[237], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[237], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[237], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[237], ['Name'] = "Smooth Block Model641"})
end
if generatedParts[238] then
    table.insert(resizes, {['Part'] = generatedParts[238], ['CFrame'] = (origin + offset) * CFrame.new(18.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[238], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[238], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[238], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[238], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[238], ['Name'] = "Smooth Block Model645"})
end
if generatedParts[239] then
    table.insert(resizes, {['Part'] = generatedParts[239], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[239], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[239], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[239], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[239], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[239], ['Name'] = "Smooth Block Model648"})
end
if generatedParts[240] then
    table.insert(resizes, {['Part'] = generatedParts[240], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 7.200, 45.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[240], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[240], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[240], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[240], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[240], ['Name'] = "Smooth Block Model650"})
end
if generatedParts[241] then
    table.insert(resizes, {['Part'] = generatedParts[241], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 7.200, 38.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[241], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[241], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[241], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[241], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[241], ['Name'] = "Smooth Block Model654"})
end
if generatedParts[242] then
    table.insert(resizes, {['Part'] = generatedParts[242], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 12.000, -3.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[242], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[242], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[242], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[242], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[242], ['Name'] = "Smooth Block Model655"})
end
if generatedParts[243] then
    table.insert(resizes, {['Part'] = generatedParts[243], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 14.400, -3.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[243], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[243], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[243], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[243], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[243], ['Name'] = "Smooth Block Model658"})
end
if generatedParts[244] then
    table.insert(resizes, {['Part'] = generatedParts[244], ['CFrame'] = (origin + offset) * CFrame.new(15.000, 15.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[244], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[244], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[244], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[244], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[244], ['Name'] = "Smooth Block Model661"})
end
if generatedParts[245] then
    table.insert(resizes, {['Part'] = generatedParts[245], ['CFrame'] = (origin + offset) * CFrame.new(15.500, 13.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[245], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[245], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[245], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[245], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[245], ['Name'] = "Smooth Block Model662"})
end
if generatedParts[246] then
    table.insert(resizes, {['Part'] = generatedParts[246], ['CFrame'] = (origin + offset) * CFrame.new(14.500, 13.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[246], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[246], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[246], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[246], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[246], ['Name'] = "Smooth Block Model665"})
end
if generatedParts[247] then
    table.insert(resizes, {['Part'] = generatedParts[247], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 15.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(4.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[247], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[247], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[247], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[247], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[247], ['Name'] = "Smooth Block Model668"})
end
if generatedParts[248] then
    table.insert(resizes, {['Part'] = generatedParts[248], ['CFrame'] = (origin + offset) * CFrame.new(15.500, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[248], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[248], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[248], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[248], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[248], ['Name'] = "Smooth Block Model671"})
end
if generatedParts[249] then
    table.insert(resizes, {['Part'] = generatedParts[249], ['CFrame'] = (origin + offset) * CFrame.new(9.500, 13.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[249], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[249], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[249], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[249], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[249], ['Name'] = "Smooth Block Model672"})
end
if generatedParts[250] then
    table.insert(resizes, {['Part'] = generatedParts[250], ['CFrame'] = (origin + offset) * CFrame.new(8.500, 13.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[250], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[250], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[250], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[250], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[250], ['Name'] = "Smooth Block Model675"})
end
if generatedParts[251] then
    table.insert(resizes, {['Part'] = generatedParts[251], ['CFrame'] = (origin + offset) * CFrame.new(9.000, 15.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[251], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[251], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[251], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[251], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[251], ['Name'] = "Smooth Block Model676"})
end
if generatedParts[252] then
    table.insert(resizes, {['Part'] = generatedParts[252], ['CFrame'] = (origin + offset) * CFrame.new(8.500, 9.600, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[252], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[252], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[252], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[252], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[252], ['Name'] = "Smooth Block Model"})
end
if generatedParts[253] then
    table.insert(resizes, {['Part'] = generatedParts[253], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 6.600, -7.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(8.000, 1.200, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[253], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[253], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[253], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[253], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[253], ['Name'] = "Smooth Block Model681"})
end
if generatedParts[254] then
    table.insert(resizes, {['Part'] = generatedParts[254], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 19.200, -7.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.400, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[254], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[254], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[254], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[254], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[254], ['Name'] = "Smooth Block Model683"})
end
if generatedParts[255] then
    table.insert(resizes, {['Part'] = generatedParts[255], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 9.600, -3.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[255], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[255], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[255], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[255], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[255], ['Name'] = "Smooth Block Model684"})
end
if generatedParts[256] then
    table.insert(resizes, {['Part'] = generatedParts[256], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 7.200, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[256], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[256], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[256], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[256], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[256], ['Name'] = "Smooth Block Model686"})
end
if generatedParts[257] then
    table.insert(resizes, {['Part'] = generatedParts[257], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 7.200, 15.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[257], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[257], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[257], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[257], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[257], ['Name'] = "Smooth Block Model687"})
end
if generatedParts[258] then
    table.insert(resizes, {['Part'] = generatedParts[258], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 7.200, -3.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[258], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[258], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[258], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[258], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[258], ['Name'] = "Smooth Block Model688"})
end
if generatedParts[259] then
    table.insert(resizes, {['Part'] = generatedParts[259], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 7.200, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[259], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[259], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[259], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[259], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[259], ['Name'] = "Smooth Block Model690"})
end
if generatedParts[260] then
    table.insert(resizes, {['Part'] = generatedParts[260], ['CFrame'] = (origin + offset) * CFrame.new(5.500, 14.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[260], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[260], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[260], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[260], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[260], ['Name'] = "Smooth Block Model691"})
end
if generatedParts[261] then
    table.insert(resizes, {['Part'] = generatedParts[261], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 12.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[261], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[261], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[261], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[261], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[261], ['Name'] = "Smooth Block Model693"})
end
if generatedParts[262] then
    table.insert(resizes, {['Part'] = generatedParts[262], ['CFrame'] = (origin + offset) * CFrame.new(0.500, 14.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[262], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[262], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[262], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[262], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[262], ['Name'] = "Smooth Block Model696"})
end
if generatedParts[263] then
    table.insert(resizes, {['Part'] = generatedParts[263], ['CFrame'] = (origin + offset) * CFrame.new(1.500, 12.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[263], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[263], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[263], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[263], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[263], ['Name'] = "Smooth Block Model700"})
end
if generatedParts[264] then
    table.insert(resizes, {['Part'] = generatedParts[264], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 14.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[264], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[264], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[264], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[264], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[264], ['Name'] = "Smooth Block Model702"})
end
if generatedParts[265] then
    table.insert(resizes, {['Part'] = generatedParts[265], ['CFrame'] = (origin + offset) * CFrame.new(-3.500, 12.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[265], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[265], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[265], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[265], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[265], ['Name'] = "Smooth Block Model704"})
end
if generatedParts[266] then
    table.insert(resizes, {['Part'] = generatedParts[266], ['CFrame'] = (origin + offset) * CFrame.new(-7.000, 15.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[266], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[266], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[266], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[266], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[266], ['Name'] = "Smooth Block Model707"})
end
if generatedParts[267] then
    table.insert(resizes, {['Part'] = generatedParts[267], ['CFrame'] = (origin + offset) * CFrame.new(-6.500, 13.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[267], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[267], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[267], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[267], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[267], ['Name'] = "Smooth Block Model710"})
end
if generatedParts[268] then
    table.insert(resizes, {['Part'] = generatedParts[268], ['CFrame'] = (origin + offset) * CFrame.new(-7.500, 13.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[268], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[268], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[268], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[268], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[268], ['Name'] = "Smooth Block Model712"})
end
if generatedParts[269] then
    table.insert(resizes, {['Part'] = generatedParts[269], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 15.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(4.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[269], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[269], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[269], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[269], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[269], ['Name'] = "Smooth Block Model713"})
end
if generatedParts[270] then
    table.insert(resizes, {['Part'] = generatedParts[270], ['CFrame'] = (origin + offset) * CFrame.new(-6.500, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[270], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[270], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[270], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[270], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[270], ['Name'] = "Smooth Block Model714"})
end
if generatedParts[271] then
    table.insert(resizes, {['Part'] = generatedParts[271], ['CFrame'] = (origin + offset) * CFrame.new(-12.500, 13.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[271], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[271], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[271], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[271], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[271], ['Name'] = "Smooth Block Model716"})
end
if generatedParts[272] then
    table.insert(resizes, {['Part'] = generatedParts[272], ['CFrame'] = (origin + offset) * CFrame.new(-13.500, 13.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[272], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[272], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[272], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[272], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[272], ['Name'] = "Smooth Block Model719"})
end
if generatedParts[273] then
    table.insert(resizes, {['Part'] = generatedParts[273], ['CFrame'] = (origin + offset) * CFrame.new(-13.000, 15.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[273], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[273], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[273], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[273], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[273], ['Name'] = "Smooth Block Model722"})
end
if generatedParts[274] then
    table.insert(resizes, {['Part'] = generatedParts[274], ['CFrame'] = (origin + offset) * CFrame.new(-13.500, 9.600, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 4.800, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[274], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[274], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[274], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[274], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[274], ['Name'] = "Smooth Block Model"})
end
if generatedParts[275] then
    table.insert(resizes, {['Part'] = generatedParts[275], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 6.600, -7.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(8.000, 1.200, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[275], ['Color'] = Color3.new(0.627, 0.373, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[275], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[275], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[275], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[275], ['Name'] = "Smooth Block Model725"})
end
if generatedParts[276] then
    table.insert(resizes, {['Part'] = generatedParts[276], ['CFrame'] = (origin + offset) * CFrame.new(5.500, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[276], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[276], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[276], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[276], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[276], ['Name'] = "Smooth Block Model730"})
end
if generatedParts[277] then
    table.insert(resizes, {['Part'] = generatedParts[277], ['CFrame'] = (origin + offset) * CFrame.new(0.500, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[277], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[277], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[277], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[277], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[277], ['Name'] = "Smooth Block Model733"})
end
if generatedParts[278] then
    table.insert(resizes, {['Part'] = generatedParts[278], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[278], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[278], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[278], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[278], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[278], ['Name'] = "Smooth Block Model734"})
end
if generatedParts[279] then
    table.insert(resizes, {['Part'] = generatedParts[279], ['CFrame'] = (origin + offset) * CFrame.new(1.500, 7.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[279], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[279], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[279], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[279], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[279], ['Name'] = "Smooth Block Model737"})
end
if generatedParts[280] then
    table.insert(resizes, {['Part'] = generatedParts[280], ['CFrame'] = (origin + offset) * CFrame.new(19.500, 7.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[280], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[280], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[280], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[280], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[280], ['Name'] = "Smooth Block Model741"})
end
if generatedParts[281] then
    table.insert(resizes, {['Part'] = generatedParts[281], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 7.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[281], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[281], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[281], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[281], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[281], ['Name'] = "Smooth Block Model742"})
end
if generatedParts[282] then
    table.insert(resizes, {['Part'] = generatedParts[282], ['CFrame'] = (origin + offset) * CFrame.new(-3.500, 7.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[282], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[282], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[282], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[282], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[282], ['Name'] = "Smooth Block Model743"})
end
if generatedParts[283] then
    table.insert(resizes, {['Part'] = generatedParts[283], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[283], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[283], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[283], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[283], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[283], ['Name'] = "Smooth Block Model746"})
end
if generatedParts[284] then
    table.insert(resizes, {['Part'] = generatedParts[284], ['CFrame'] = (origin + offset) * CFrame.new(-0.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[284], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[284], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[284], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[284], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[284], ['Name'] = "Smooth Block Model751"})
end
if generatedParts[285] then
    table.insert(resizes, {['Part'] = generatedParts[285], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[285], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[285], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[285], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[285], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[285], ['Name'] = "Smooth Block Model754"})
end
if generatedParts[286] then
    table.insert(resizes, {['Part'] = generatedParts[286], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[286], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[286], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[286], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[286], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[286], ['Name'] = "Smooth Block Model759"})
end
if generatedParts[287] then
    table.insert(resizes, {['Part'] = generatedParts[287], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[287], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[287], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[287], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[287], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[287], ['Name'] = "Smooth Block Model765"})
end
if generatedParts[288] then
    table.insert(resizes, {['Part'] = generatedParts[288], ['CFrame'] = (origin + offset) * CFrame.new(-5.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(8.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[288], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[288], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[288], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[288], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[288], ['Name'] = "Smooth Block Model766"})
end
if generatedParts[289] then
    table.insert(resizes, {['Part'] = generatedParts[289], ['CFrame'] = (origin + offset) * CFrame.new(2.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[289], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[289], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[289], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[289], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[289], ['Name'] = "Smooth Block Model768"})
end
if generatedParts[290] then
    table.insert(resizes, {['Part'] = generatedParts[290], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[290], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[290], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[290], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[290], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[290], ['Name'] = "Smooth Block Model771"})
end
if generatedParts[291] then
    table.insert(resizes, {['Part'] = generatedParts[291], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 19.200, -3.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[291], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[291], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[291], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[291], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[291], ['Name'] = "Smooth Block Model773"})
end
if generatedParts[292] then
    table.insert(resizes, {['Part'] = generatedParts[292], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 4.800, 1.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[292], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[292], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[292], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[292], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[292], ['Name'] = "Smooth Block Model777"})
end
if generatedParts[293] then
    table.insert(resizes, {['Part'] = generatedParts[293], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 4.800, 7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[293], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[293], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[293], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[293], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[293], ['Name'] = "Smooth Block Model780"})
end
if generatedParts[294] then
    table.insert(resizes, {['Part'] = generatedParts[294], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 4.800, 13.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[294], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[294], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[294], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[294], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[294], ['Name'] = "Smooth Block Model782"})
end
if generatedParts[295] then
    table.insert(resizes, {['Part'] = generatedParts[295], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 4.800, 19.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[295], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[295], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[295], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[295], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[295], ['Name'] = "Smooth Block Model784"})
end
if generatedParts[296] then
    table.insert(resizes, {['Part'] = generatedParts[296], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 4.800, 25.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[296], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[296], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[296], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[296], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[296], ['Name'] = "Smooth Block Model786"})
end
if generatedParts[297] then
    table.insert(resizes, {['Part'] = generatedParts[297], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 4.800, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[297], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[297], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[297], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[297], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[297], ['Name'] = "Smooth Block Model789"})
end
if generatedParts[298] then
    table.insert(resizes, {['Part'] = generatedParts[298], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 4.800, 43.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[298], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[298], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[298], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[298], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[298], ['Name'] = "Smooth Block Model793"})
end
if generatedParts[299] then
    table.insert(resizes, {['Part'] = generatedParts[299], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 4.800, 31.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[299], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[299], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[299], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[299], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[299], ['Name'] = "Smooth Block Model795"})
end
if generatedParts[300] then
    table.insert(resizes, {['Part'] = generatedParts[300], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 4.800, -5.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[300], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[300], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[300], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[300], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[300], ['Name'] = "Smooth Block Model797"})
end
if generatedParts[301] then
    table.insert(resizes, {['Part'] = generatedParts[301], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 4.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[301], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[301], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[301], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[301], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[301], ['Name'] = "Smooth Block Model800"})
end
if generatedParts[302] then
    table.insert(resizes, {['Part'] = generatedParts[302], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 16.800, -5.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[302], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[302], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[302], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[302], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[302], ['Name'] = "Smooth Block Model803"})
end
if generatedParts[303] then
    table.insert(resizes, {['Part'] = generatedParts[303], ['CFrame'] = (origin + offset) * CFrame.new(19.000, 14.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[303], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[303], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[303], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[303], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[303], ['Name'] = "Smooth Block Model804"})
end
if generatedParts[304] then
    table.insert(resizes, {['Part'] = generatedParts[304], ['CFrame'] = (origin + offset) * CFrame.new(25.500, 14.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[304], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[304], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[304], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[304], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[304], ['Name'] = "Smooth Block Model808"})
end
if generatedParts[305] then
    table.insert(resizes, {['Part'] = generatedParts[305], ['CFrame'] = (origin + offset) * CFrame.new(19.500, 12.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[305], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[305], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[305], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[305], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[305], ['Name'] = "Smooth Block Model813"})
end
if generatedParts[306] then
    table.insert(resizes, {['Part'] = generatedParts[306], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 12.000, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[306], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[306], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[306], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[306], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[306], ['Name'] = "Smooth Block Model814"})
end
if generatedParts[307] then
    table.insert(resizes, {['Part'] = generatedParts[307], ['CFrame'] = (origin + offset) * CFrame.new(25.500, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(7.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[307], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[307], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[307], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[307], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[307], ['Name'] = "Smooth Block Model815"})
end
if generatedParts[308] then
    table.insert(resizes, {['Part'] = generatedParts[308], ['CFrame'] = (origin + offset) * CFrame.new(19.000, 9.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[308], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[308], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[308], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[308], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[308], ['Name'] = "Smooth Block Model820"})
end
if generatedParts[309] then
    table.insert(resizes, {['Part'] = generatedParts[309], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 7.200, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[309], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[309], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[309], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[309], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[309], ['Name'] = "Smooth Block Model823"})
end
if generatedParts[310] then
    table.insert(resizes, {['Part'] = generatedParts[310], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[310], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[310], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[310], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[310], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[310], ['Name'] = "Smooth Block Model824"})
end
if generatedParts[311] then
    table.insert(resizes, {['Part'] = generatedParts[311], ['CFrame'] = (origin + offset) * CFrame.new(18.000, 16.800, -7.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[311], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[311], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[311], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[311], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[311], ['Name'] = "Smooth Block Model827"})
end
if generatedParts[312] then
    table.insert(resizes, {['Part'] = generatedParts[312], ['CFrame'] = (origin + offset) * CFrame.new(18.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(10.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[312], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[312], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[312], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[312], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[312], ['Name'] = "Smooth Block Model830"})
end
if generatedParts[313] then
    table.insert(resizes, {['Part'] = generatedParts[313], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 19.200, -7.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.400, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[313], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[313], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[313], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[313], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[313], ['Name'] = "Smooth Block Model831"})
end
if generatedParts[314] then
    table.insert(resizes, {['Part'] = generatedParts[314], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 19.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[314], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[314], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[314], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[314], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[314], ['Name'] = "Smooth Block Model832"})
end
if generatedParts[315] then
    table.insert(resizes, {['Part'] = generatedParts[315], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 28.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[315], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[315], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[315], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[315], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[315], ['Name'] = "Smooth Block Model837"})
end
if generatedParts[316] then
    table.insert(resizes, {['Part'] = generatedParts[316], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 26.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[316], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[316], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[316], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[316], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[316], ['Name'] = "Smooth Block Model839"})
end
if generatedParts[317] then
    table.insert(resizes, {['Part'] = generatedParts[317], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 28.200, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[317], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[317], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[317], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[317], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[317], ['Name'] = "Smooth Block Model844"})
end
if generatedParts[318] then
    table.insert(resizes, {['Part'] = generatedParts[318], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 31.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[318], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[318], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[318], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[318], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[318], ['Name'] = "Smooth Block Model845"})
end
if generatedParts[319] then
    table.insert(resizes, {['Part'] = generatedParts[319], ['CFrame'] = (origin + offset) * CFrame.new(14.000, 29.400, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[319], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[319], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[319], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[319], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[319], ['Name'] = "Smooth Block Model846"})
end
if generatedParts[320] then
    table.insert(resizes, {['Part'] = generatedParts[320], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 35.400, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[320], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[320], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[320], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[320], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[320], ['Name'] = "Smooth Block Model850"})
end
if generatedParts[321] then
    table.insert(resizes, {['Part'] = generatedParts[321], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 30.600, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[321], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[321], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[321], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[321], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[321], ['Name'] = "Smooth Block Model854"})
end
if generatedParts[322] then
    table.insert(resizes, {['Part'] = generatedParts[322], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 33.000, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[322], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[322], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[322], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[322], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[322], ['Name'] = "Smooth Block Model857"})
end
if generatedParts[323] then
    table.insert(resizes, {['Part'] = generatedParts[323], ['CFrame'] = (origin + offset) * CFrame.new(10.000, 31.800, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[323], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[323], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[323], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[323], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[323], ['Name'] = "Smooth Block Model863"})
end
if generatedParts[324] then
    table.insert(resizes, {['Part'] = generatedParts[324], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 34.200, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[324], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[324], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[324], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[324], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[324], ['Name'] = "Smooth Block Model865"})
end
if generatedParts[325] then
    table.insert(resizes, {['Part'] = generatedParts[325], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 34.200, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[325], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[325], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[325], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[325], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[325], ['Name'] = "Smooth Block Model866"})
end
if generatedParts[326] then
    table.insert(resizes, {['Part'] = generatedParts[326], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 30.600, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[326], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[326], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[326], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[326], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[326], ['Name'] = "Smooth Block Model867"})
end
if generatedParts[327] then
    table.insert(resizes, {['Part'] = generatedParts[327], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 33.000, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[327], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[327], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[327], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[327], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[327], ['Name'] = "Smooth Block Model870"})
end
if generatedParts[328] then
    table.insert(resizes, {['Part'] = generatedParts[328], ['CFrame'] = (origin + offset) * CFrame.new(2.000, 28.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[328], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[328], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[328], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[328], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[328], ['Name'] = "Smooth Block Model873"})
end
if generatedParts[329] then
    table.insert(resizes, {['Part'] = generatedParts[329], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 28.200, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[329], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[329], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[329], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[329], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[329], ['Name'] = "Smooth Block Model875"})
end
if generatedParts[330] then
    table.insert(resizes, {['Part'] = generatedParts[330], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 29.400, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[330], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[330], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[330], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[330], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[330], ['Name'] = "Smooth Block Model877"})
end
if generatedParts[331] then
    table.insert(resizes, {['Part'] = generatedParts[331], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[331], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[331], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[331], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[331], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[331], ['Name'] = "Smooth Block Model879"})
end
if generatedParts[332] then
    table.insert(resizes, {['Part'] = generatedParts[332], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 25.800, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[332], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[332], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[332], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[332], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[332], ['Name'] = "Smooth Block Model881"})
end
if generatedParts[333] then
    table.insert(resizes, {['Part'] = generatedParts[333], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 33.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[333], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[333], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[333], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[333], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[333], ['Name'] = "Smooth Block Model884"})
end
if generatedParts[334] then
    table.insert(resizes, {['Part'] = generatedParts[334], ['CFrame'] = (origin + offset) * CFrame.new(10.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[334], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[334], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[334], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[334], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[334], ['Name'] = "Smooth Block Model888"})
end
if generatedParts[335] then
    table.insert(resizes, {['Part'] = generatedParts[335], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 34.200, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[335], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[335], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[335], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[335], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[335], ['Name'] = "Smooth Block Model890"})
end
if generatedParts[336] then
    table.insert(resizes, {['Part'] = generatedParts[336], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 33.000, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[336], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[336], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[336], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[336], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[336], ['Name'] = "Smooth Block Model892"})
end
if generatedParts[337] then
    table.insert(resizes, {['Part'] = generatedParts[337], ['CFrame'] = (origin + offset) * CFrame.new(-8.000, 31.800, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[337], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[337], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[337], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[337], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[337], ['Name'] = "Smooth Block Model896"})
end
if generatedParts[338] then
    table.insert(resizes, {['Part'] = generatedParts[338], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 30.600, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[338], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[338], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[338], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[338], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[338], ['Name'] = "Smooth Block Model897"})
end
if generatedParts[339] then
    table.insert(resizes, {['Part'] = generatedParts[339], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 33.000, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[339], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[339], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[339], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[339], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[339], ['Name'] = "Smooth Block Model902"})
end
if generatedParts[340] then
    table.insert(resizes, {['Part'] = generatedParts[340], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 30.600, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[340], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[340], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[340], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[340], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[340], ['Name'] = "Smooth Block Model907"})
end
if generatedParts[341] then
    table.insert(resizes, {['Part'] = generatedParts[341], ['CFrame'] = (origin + offset) * CFrame.new(-8.000, 31.800, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[341], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[341], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[341], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[341], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[341], ['Name'] = "Smooth Block Model914"})
end
if generatedParts[342] then
    table.insert(resizes, {['Part'] = generatedParts[342], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 30.600, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[342], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[342], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[342], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[342], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[342], ['Name'] = "Smooth Block Model917"})
end
if generatedParts[343] then
    table.insert(resizes, {['Part'] = generatedParts[343], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 33.000, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[343], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[343], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[343], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[343], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[343], ['Name'] = "Smooth Block Model920"})
end
if generatedParts[344] then
    table.insert(resizes, {['Part'] = generatedParts[344], ['CFrame'] = (origin + offset) * CFrame.new(-8.000, 31.800, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[344], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[344], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[344], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[344], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[344], ['Name'] = "Smooth Block Model923"})
end
if generatedParts[345] then
    table.insert(resizes, {['Part'] = generatedParts[345], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 35.400, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[345], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[345], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[345], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[345], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[345], ['Name'] = "Smooth Block Model924"})
end
if generatedParts[346] then
    table.insert(resizes, {['Part'] = generatedParts[346], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[346], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[346], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[346], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[346], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[346], ['Name'] = "Smooth Block Model926"})
end
if generatedParts[347] then
    table.insert(resizes, {['Part'] = generatedParts[347], ['CFrame'] = (origin + offset) * CFrame.new(16.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[347], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[347], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[347], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[347], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[347], ['Name'] = "Smooth Block Model927"})
end
if generatedParts[348] then
    table.insert(resizes, {['Part'] = generatedParts[348], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 26.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[348], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[348], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[348], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[348], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[348], ['Name'] = "Smooth Block Model930"})
end
if generatedParts[349] then
    table.insert(resizes, {['Part'] = generatedParts[349], ['CFrame'] = (origin + offset) * CFrame.new(-5.000, 28.800, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(8.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[349], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[349], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[349], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[349], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[349], ['Name'] = "Smooth Block Model936"})
end
if generatedParts[350] then
    table.insert(resizes, {['Part'] = generatedParts[350], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 23.400, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[350], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[350], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[350], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[350], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[350], ['Name'] = "Smooth Block Model937"})
end
if generatedParts[351] then
    table.insert(resizes, {['Part'] = generatedParts[351], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[351], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[351], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[351], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[351], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[351], ['Name'] = "Smooth Block Model938"})
end
if generatedParts[352] then
    table.insert(resizes, {['Part'] = generatedParts[352], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[352], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[352], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[352], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[352], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[352], ['Name'] = "Smooth Block Model942"})
end
if generatedParts[353] then
    table.insert(resizes, {['Part'] = generatedParts[353], ['CFrame'] = (origin + offset) * CFrame.new(-0.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[353], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[353], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[353], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[353], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[353], ['Name'] = "Smooth Block Model946"})
end
if generatedParts[354] then
    table.insert(resizes, {['Part'] = generatedParts[354], ['CFrame'] = (origin + offset) * CFrame.new(-11.000, 26.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[354], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[354], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[354], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[354], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[354], ['Name'] = "Smooth Block Model949"})
end
if generatedParts[355] then
    table.insert(resizes, {['Part'] = generatedParts[355], ['CFrame'] = (origin + offset) * CFrame.new(-0.000, 26.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[355], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[355], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[355], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[355], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[355], ['Name'] = "Smooth Block Model954"})
end
if generatedParts[356] then
    table.insert(resizes, {['Part'] = generatedParts[356], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[356], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[356], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[356], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[356], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[356], ['Name'] = "Smooth Block Model958"})
end
if generatedParts[357] then
    table.insert(resizes, {['Part'] = generatedParts[357], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[357], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[357], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[357], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[357], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[357], ['Name'] = "Smooth Block Model962"})
end
if generatedParts[358] then
    table.insert(resizes, {['Part'] = generatedParts[358], ['CFrame'] = (origin + offset) * CFrame.new(-8.000, 24.000, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[358], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[358], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[358], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[358], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[358], ['Name'] = "Smooth Block Model964"})
end
if generatedParts[359] then
    table.insert(resizes, {['Part'] = generatedParts[359], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 26.400, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[359], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[359], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[359], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[359], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[359], ['Name'] = "Smooth Block Model965"})
end
if generatedParts[360] then
    table.insert(resizes, {['Part'] = generatedParts[360], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[360], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[360], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[360], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[360], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[360], ['Name'] = "Smooth Block Model968"})
end
if generatedParts[361] then
    table.insert(resizes, {['Part'] = generatedParts[361], ['CFrame'] = (origin + offset) * CFrame.new(19.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(8.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[361], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[361], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[361], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[361], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[361], ['Name'] = "Smooth Block Model974"})
end
if generatedParts[362] then
    table.insert(resizes, {['Part'] = generatedParts[362], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 35.400, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[362], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[362], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[362], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[362], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[362], ['Name'] = "Smooth Block Model980"})
end
if generatedParts[363] then
    table.insert(resizes, {['Part'] = generatedParts[363], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 22.200, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[363], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[363], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[363], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[363], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[363], ['Name'] = "Smooth Block Model983"})
end
if generatedParts[364] then
    table.insert(resizes, {['Part'] = generatedParts[364], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 37.800, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 4.000)})
    table.insert(colors, {['Part'] = generatedParts[364], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[364], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[364], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[364], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[364], ['Name'] = "Smooth Block Model985"})
end
if generatedParts[365] then
    table.insert(resizes, {['Part'] = generatedParts[365], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 21.000, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[365], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[365], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[365], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[365], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[365], ['Name'] = "Smooth Block Model987"})
end
if generatedParts[366] then
    table.insert(resizes, {['Part'] = generatedParts[366], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 35.400, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[366], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[366], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[366], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[366], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[366], ['Name'] = "Smooth Block Model990"})
end
if generatedParts[367] then
    table.insert(resizes, {['Part'] = generatedParts[367], ['CFrame'] = (origin + offset) * CFrame.new(10.000, 31.800, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[367], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[367], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[367], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[367], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[367], ['Name'] = "Smooth Block Model991"})
end
if generatedParts[368] then
    table.insert(resizes, {['Part'] = generatedParts[368], ['CFrame'] = (origin + offset) * CFrame.new(20.000, 25.800, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[368], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[368], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[368], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[368], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[368], ['Name'] = "Smooth Block Model992"})
end
if generatedParts[369] then
    table.insert(resizes, {['Part'] = generatedParts[369], ['CFrame'] = (origin + offset) * CFrame.new(16.000, 28.200, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[369], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[369], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[369], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[369], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[369], ['Name'] = "Smooth Block Model994"})
end
if generatedParts[370] then
    table.insert(resizes, {['Part'] = generatedParts[370], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 34.200, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[370], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[370], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[370], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[370], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[370], ['Name'] = "Smooth Block Model996"})
end
if generatedParts[371] then
    table.insert(resizes, {['Part'] = generatedParts[371], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 37.800, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 4.000)})
    table.insert(colors, {['Part'] = generatedParts[371], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[371], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[371], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[371], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[371], ['Name'] = "Smooth Block Model1001"})
end
if generatedParts[372] then
    table.insert(resizes, {['Part'] = generatedParts[372], ['CFrame'] = (origin + offset) * CFrame.new(16.000, 25.800, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[372], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[372], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[372], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[372], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[372], ['Name'] = "Smooth Block Model1002"})
end
if generatedParts[373] then
    table.insert(resizes, {['Part'] = generatedParts[373], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 30.600, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[373], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[373], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[373], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[373], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[373], ['Name'] = "Smooth Block Model1004"})
end
if generatedParts[374] then
    table.insert(resizes, {['Part'] = generatedParts[374], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 37.800, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 4.000)})
    table.insert(colors, {['Part'] = generatedParts[374], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[374], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[374], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[374], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[374], ['Name'] = "Smooth Block Model1009"})
end
if generatedParts[375] then
    table.insert(resizes, {['Part'] = generatedParts[375], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 34.200, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[375], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[375], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[375], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[375], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[375], ['Name'] = "Smooth Block Model1010"})
end
if generatedParts[376] then
    table.insert(resizes, {['Part'] = generatedParts[376], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 33.000, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[376], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[376], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[376], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[376], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[376], ['Name'] = "Smooth Block Model1013"})
end
if generatedParts[377] then
    table.insert(resizes, {['Part'] = generatedParts[377], ['CFrame'] = (origin + offset) * CFrame.new(18.000, 27.000, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[377], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[377], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[377], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[377], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[377], ['Name'] = "Smooth Block Model1014"})
end
if generatedParts[378] then
    table.insert(resizes, {['Part'] = generatedParts[378], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 36.600, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[378], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[378], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[378], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[378], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[378], ['Name'] = "Smooth Block Model1019"})
end
if generatedParts[379] then
    table.insert(resizes, {['Part'] = generatedParts[379], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 36.600, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[379], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[379], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[379], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[379], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[379], ['Name'] = "Smooth Block Model1025"})
end
if generatedParts[380] then
    table.insert(resizes, {['Part'] = generatedParts[380], ['CFrame'] = (origin + offset) * CFrame.new(22.000, 24.600, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[380], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[380], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[380], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[380], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[380], ['Name'] = "Smooth Block Model1032"})
end
if generatedParts[381] then
    table.insert(resizes, {['Part'] = generatedParts[381], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 36.600, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[381], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[381], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[381], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[381], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[381], ['Name'] = "Smooth Block Model1036"})
end
if generatedParts[382] then
    table.insert(resizes, {['Part'] = generatedParts[382], ['CFrame'] = (origin + offset) * CFrame.new(14.000, 29.400, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[382], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[382], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[382], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[382], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[382], ['Name'] = "Smooth Block Model1037"})
end
if generatedParts[383] then
    table.insert(resizes, {['Part'] = generatedParts[383], ['CFrame'] = (origin + offset) * CFrame.new(20.000, 23.400, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[383], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[383], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[383], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[383], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[383], ['Name'] = "Smooth Block Model1040"})
end
if generatedParts[384] then
    table.insert(resizes, {['Part'] = generatedParts[384], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 34.200, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[384], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[384], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[384], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[384], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[384], ['Name'] = "Smooth Block Model1041"})
end
if generatedParts[385] then
    table.insert(resizes, {['Part'] = generatedParts[385], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 21.000, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[385], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[385], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[385], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[385], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[385], ['Name'] = "Smooth Block Model1046"})
end
if generatedParts[386] then
    table.insert(resizes, {['Part'] = generatedParts[386], ['CFrame'] = (origin + offset) * CFrame.new(18.000, 27.000, 47.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[386], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[386], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[386], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[386], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[386], ['Name'] = "Smooth Block Model1051"})
end
if generatedParts[387] then
    table.insert(resizes, {['Part'] = generatedParts[387], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 31.200, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[387], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[387], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[387], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[387], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[387], ['Name'] = "Smooth Block Model1052"})
end
if generatedParts[388] then
    table.insert(resizes, {['Part'] = generatedParts[388], ['CFrame'] = (origin + offset) * CFrame.new(22.000, 24.600, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[388], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[388], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[388], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[388], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[388], ['Name'] = "Smooth Block Model1057"})
end
if generatedParts[389] then
    table.insert(resizes, {['Part'] = generatedParts[389], ['CFrame'] = (origin + offset) * CFrame.new(16.000, 28.200, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[389], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[389], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[389], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[389], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[389], ['Name'] = "Smooth Block Model1061"})
end
if generatedParts[390] then
    table.insert(resizes, {['Part'] = generatedParts[390], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 29.400, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[390], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[390], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[390], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[390], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[390], ['Name'] = "Smooth Block Model1064"})
end
if generatedParts[391] then
    table.insert(resizes, {['Part'] = generatedParts[391], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 33.000, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[391], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[391], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[391], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[391], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[391], ['Name'] = "Smooth Block Model1066"})
end
if generatedParts[392] then
    table.insert(resizes, {['Part'] = generatedParts[392], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 34.200, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[392], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[392], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[392], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[392], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[392], ['Name'] = "Smooth Block Model1070"})
end
if generatedParts[393] then
    table.insert(resizes, {['Part'] = generatedParts[393], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 35.400, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[393], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[393], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[393], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[393], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[393], ['Name'] = "Smooth Block Model1074"})
end
if generatedParts[394] then
    table.insert(resizes, {['Part'] = generatedParts[394], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 23.400, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[394], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[394], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[394], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[394], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[394], ['Name'] = "Smooth Block Model1077"})
end
if generatedParts[395] then
    table.insert(resizes, {['Part'] = generatedParts[395], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 22.200, 38.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[395], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[395], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[395], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[395], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[395], ['Name'] = "Smooth Block Model1081"})
end
if generatedParts[396] then
    table.insert(resizes, {['Part'] = generatedParts[396], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 36.600, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[396], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[396], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[396], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[396], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[396], ['Name'] = "Smooth Block Model1086"})
end
if generatedParts[397] then
    table.insert(resizes, {['Part'] = generatedParts[397], ['CFrame'] = (origin + offset) * CFrame.new(20.000, 25.800, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[397], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[397], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[397], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[397], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[397], ['Name'] = "Smooth Block Model1090"})
end
if generatedParts[398] then
    table.insert(resizes, {['Part'] = generatedParts[398], ['CFrame'] = (origin + offset) * CFrame.new(18.000, 27.000, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[398], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[398], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[398], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[398], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[398], ['Name'] = "Smooth Block Model1091"})
end
if generatedParts[399] then
    table.insert(resizes, {['Part'] = generatedParts[399], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 33.000, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[399], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[399], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[399], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[399], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[399], ['Name'] = "Smooth Block Model1094"})
end
if generatedParts[400] then
    table.insert(resizes, {['Part'] = generatedParts[400], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 35.400, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[400], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[400], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[400], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[400], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[400], ['Name'] = "Smooth Block Model1095"})
end
if generatedParts[401] then
    table.insert(resizes, {['Part'] = generatedParts[401], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 30.600, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[401], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[401], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[401], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[401], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[401], ['Name'] = "Smooth Block Model1096"})
end
if generatedParts[402] then
    table.insert(resizes, {['Part'] = generatedParts[402], ['CFrame'] = (origin + offset) * CFrame.new(10.000, 31.800, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[402], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[402], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[402], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[402], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[402], ['Name'] = "Smooth Block Model1099"})
end
if generatedParts[403] then
    table.insert(resizes, {['Part'] = generatedParts[403], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 21.000, 32.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[403], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[403], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[403], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[403], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[403], ['Name'] = "Smooth Block Model1101"})
end
if generatedParts[404] then
    table.insert(resizes, {['Part'] = generatedParts[404], ['CFrame'] = (origin + offset) * CFrame.new(14.000, 29.400, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[404], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[404], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[404], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[404], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[404], ['Name'] = "Smooth Block Model1105"})
end
if generatedParts[405] then
    table.insert(resizes, {['Part'] = generatedParts[405], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 28.200, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[405], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[405], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[405], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[405], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[405], ['Name'] = "Smooth Block Model1106"})
end
if generatedParts[406] then
    table.insert(resizes, {['Part'] = generatedParts[406], ['CFrame'] = (origin + offset) * CFrame.new(-20.000, 24.600, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[406], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[406], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[406], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[406], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[406], ['Name'] = "Smooth Block Model1108"})
end
if generatedParts[407] then
    table.insert(resizes, {['Part'] = generatedParts[407], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 29.400, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[407], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[407], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[407], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[407], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[407], ['Name'] = "Smooth Block Model1110"})
end
if generatedParts[408] then
    table.insert(resizes, {['Part'] = generatedParts[408], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 27.000, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[408], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[408], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[408], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[408], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[408], ['Name'] = "Smooth Block Model1111"})
end
if generatedParts[409] then
    table.insert(resizes, {['Part'] = generatedParts[409], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 29.400, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[409], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[409], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[409], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[409], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[409], ['Name'] = "Smooth Block Model1112"})
end
if generatedParts[410] then
    table.insert(resizes, {['Part'] = generatedParts[410], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 28.200, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[410], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[410], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[410], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[410], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[410], ['Name'] = "Smooth Block Model1114"})
end
if generatedParts[411] then
    table.insert(resizes, {['Part'] = generatedParts[411], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 25.800, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[411], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[411], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[411], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[411], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[411], ['Name'] = "Smooth Block Model1116"})
end
if generatedParts[412] then
    table.insert(resizes, {['Part'] = generatedParts[412], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 27.000, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[412], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[412], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[412], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[412], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[412], ['Name'] = "Smooth Block Model1122"})
end
if generatedParts[413] then
    table.insert(resizes, {['Part'] = generatedParts[413], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 23.400, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[413], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[413], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[413], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[413], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[413], ['Name'] = "Smooth Block Model1124"})
end
if generatedParts[414] then
    table.insert(resizes, {['Part'] = generatedParts[414], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 28.200, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[414], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[414], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[414], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[414], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[414], ['Name'] = "Smooth Block Model1127"})
end
if generatedParts[415] then
    table.insert(resizes, {['Part'] = generatedParts[415], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 27.000, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[415], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[415], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[415], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[415], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[415], ['Name'] = "Smooth Block Model1133"})
end
if generatedParts[416] then
    table.insert(resizes, {['Part'] = generatedParts[416], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 34.200, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[416], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[416], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[416], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[416], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[416], ['Name'] = "Smooth Block Model1136"})
end
if generatedParts[417] then
    table.insert(resizes, {['Part'] = generatedParts[417], ['CFrame'] = (origin + offset) * CFrame.new(-8.000, 31.800, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[417], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[417], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[417], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[417], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[417], ['Name'] = "Smooth Block Model1141"})
end
if generatedParts[418] then
    table.insert(resizes, {['Part'] = generatedParts[418], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 30.600, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[418], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[418], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[418], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[418], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[418], ['Name'] = "Smooth Block Model1143"})
end
if generatedParts[419] then
    table.insert(resizes, {['Part'] = generatedParts[419], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 33.000, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[419], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[419], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[419], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[419], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[419], ['Name'] = "Smooth Block Model1148"})
end
if generatedParts[420] then
    table.insert(resizes, {['Part'] = generatedParts[420], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 30.600, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[420], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[420], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[420], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[420], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[420], ['Name'] = "Smooth Block Model1150"})
end
if generatedParts[421] then
    table.insert(resizes, {['Part'] = generatedParts[421], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 34.200, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[421], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[421], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[421], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[421], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[421], ['Name'] = "Smooth Block Model1154"})
end
if generatedParts[422] then
    table.insert(resizes, {['Part'] = generatedParts[422], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 23.400, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[422], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[422], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[422], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[422], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[422], ['Name'] = "Smooth Block Model1155"})
end
if generatedParts[423] then
    table.insert(resizes, {['Part'] = generatedParts[423], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 35.400, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[423], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[423], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[423], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[423], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[423], ['Name'] = "Smooth Block Model1156"})
end
if generatedParts[424] then
    table.insert(resizes, {['Part'] = generatedParts[424], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 21.600, 47.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[424], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[424], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[424], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[424], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[424], ['Name'] = "Smooth Block Model1161"})
end
if generatedParts[425] then
    table.insert(resizes, {['Part'] = generatedParts[425], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 33.000, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[425], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[425], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[425], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[425], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[425], ['Name'] = "Smooth Block Model1165"})
end
if generatedParts[426] then
    table.insert(resizes, {['Part'] = generatedParts[426], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 37.800, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 4.000)})
    table.insert(colors, {['Part'] = generatedParts[426], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[426], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[426], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[426], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[426], ['Name'] = "Smooth Block Model1166"})
end
if generatedParts[427] then
    table.insert(resizes, {['Part'] = generatedParts[427], ['CFrame'] = (origin + offset) * CFrame.new(22.000, 24.600, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[427], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[427], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[427], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[427], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[427], ['Name'] = "Smooth Block Model1169"})
end
if generatedParts[428] then
    table.insert(resizes, {['Part'] = generatedParts[428], ['CFrame'] = (origin + offset) * CFrame.new(22.000, 24.600, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[428], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[428], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[428], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[428], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[428], ['Name'] = "Smooth Block Model1172"})
end
if generatedParts[429] then
    table.insert(resizes, {['Part'] = generatedParts[429], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 30.600, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[429], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[429], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[429], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[429], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[429], ['Name'] = "Smooth Block Model1175"})
end
if generatedParts[430] then
    table.insert(resizes, {['Part'] = generatedParts[430], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 35.400, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[430], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[430], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[430], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[430], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[430], ['Name'] = "Smooth Block Model1179"})
end
if generatedParts[431] then
    table.insert(resizes, {['Part'] = generatedParts[431], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 21.000, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[431], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[431], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[431], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[431], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[431], ['Name'] = "Smooth Block Model1181"})
end
if generatedParts[432] then
    table.insert(resizes, {['Part'] = generatedParts[432], ['CFrame'] = (origin + offset) * CFrame.new(10.000, 31.800, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[432], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[432], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[432], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[432], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[432], ['Name'] = "Smooth Block Model1182"})
end
if generatedParts[433] then
    table.insert(resizes, {['Part'] = generatedParts[433], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 22.200, 26.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[433], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[433], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[433], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[433], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[433], ['Name'] = "Smooth Block Model1187"})
end
if generatedParts[434] then
    table.insert(resizes, {['Part'] = generatedParts[434], ['CFrame'] = (origin + offset) * CFrame.new(16.000, 28.200, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[434], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[434], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[434], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[434], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[434], ['Name'] = "Smooth Block Model1190"})
end
if generatedParts[435] then
    table.insert(resizes, {['Part'] = generatedParts[435], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 36.600, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[435], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[435], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[435], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[435], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[435], ['Name'] = "Smooth Block Model1194"})
end
if generatedParts[436] then
    table.insert(resizes, {['Part'] = generatedParts[436], ['CFrame'] = (origin + offset) * CFrame.new(14.000, 29.400, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[436], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[436], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[436], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[436], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[436], ['Name'] = "Smooth Block Model1195"})
end
if generatedParts[437] then
    table.insert(resizes, {['Part'] = generatedParts[437], ['CFrame'] = (origin + offset) * CFrame.new(20.000, 25.800, 20.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[437], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[437], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[437], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[437], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[437], ['Name'] = "Smooth Block Model1198"})
end
if generatedParts[438] then
    table.insert(resizes, {['Part'] = generatedParts[438], ['CFrame'] = (origin + offset) * CFrame.new(18.000, 27.000, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[438], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[438], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[438], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[438], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[438], ['Name'] = "Smooth Block Model1203"})
end
if generatedParts[439] then
    table.insert(resizes, {['Part'] = generatedParts[439], ['CFrame'] = (origin + offset) * CFrame.new(-20.000, 24.600, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[439], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[439], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[439], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[439], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[439], ['Name'] = "Smooth Block Model1204"})
end
if generatedParts[440] then
    table.insert(resizes, {['Part'] = generatedParts[440], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 27.000, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[440], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[440], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[440], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[440], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[440], ['Name'] = "Smooth Block Model1207"})
end
if generatedParts[441] then
    table.insert(resizes, {['Part'] = generatedParts[441], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 28.200, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[441], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[441], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[441], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[441], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[441], ['Name'] = "Smooth Block Model1210"})
end
if generatedParts[442] then
    table.insert(resizes, {['Part'] = generatedParts[442], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 25.800, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[442], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[442], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[442], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[442], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[442], ['Name'] = "Smooth Block Model1215"})
end
if generatedParts[443] then
    table.insert(resizes, {['Part'] = generatedParts[443], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 25.800, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[443], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[443], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[443], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[443], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[443], ['Name'] = "Smooth Block Model1216"})
end
if generatedParts[444] then
    table.insert(resizes, {['Part'] = generatedParts[444], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 22.200, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[444], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[444], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[444], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[444], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[444], ['Name'] = "Smooth Block Model1219"})
end
if generatedParts[445] then
    table.insert(resizes, {['Part'] = generatedParts[445], ['CFrame'] = (origin + offset) * CFrame.new(-20.000, 24.600, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[445], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[445], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[445], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[445], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[445], ['Name'] = "Smooth Block Model1222"})
end
if generatedParts[446] then
    table.insert(resizes, {['Part'] = generatedParts[446], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 23.400, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[446], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[446], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[446], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[446], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[446], ['Name'] = "Smooth Block Model1225"})
end
if generatedParts[447] then
    table.insert(resizes, {['Part'] = generatedParts[447], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 21.000, 44.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[447], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[447], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[447], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[447], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[447], ['Name'] = "Smooth Block Model1226"})
end
if generatedParts[448] then
    table.insert(resizes, {['Part'] = generatedParts[448], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 22.200, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[448], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[448], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[448], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[448], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[448], ['Name'] = "Smooth Block Model1230"})
end
if generatedParts[449] then
    table.insert(resizes, {['Part'] = generatedParts[449], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 21.000, 47.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[449], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[449], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[449], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[449], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[449], ['Name'] = "Smooth Block Model1232"})
end
if generatedParts[450] then
    table.insert(resizes, {['Part'] = generatedParts[450], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 23.400, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[450], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[450], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[450], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[450], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[450], ['Name'] = "Smooth Block Model1233"})
end
if generatedParts[451] then
    table.insert(resizes, {['Part'] = generatedParts[451], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 29.400, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[451], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[451], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[451], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[451], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[451], ['Name'] = "Smooth Block Model1238"})
end
if generatedParts[452] then
    table.insert(resizes, {['Part'] = generatedParts[452], ['CFrame'] = (origin + offset) * CFrame.new(-8.000, 31.800, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[452], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[452], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[452], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[452], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[452], ['Name'] = "Smooth Block Model1239"})
end
if generatedParts[453] then
    table.insert(resizes, {['Part'] = generatedParts[453], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 33.000, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[453], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[453], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[453], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[453], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[453], ['Name'] = "Smooth Block Model1243"})
end
if generatedParts[454] then
    table.insert(resizes, {['Part'] = generatedParts[454], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 35.400, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[454], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[454], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[454], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[454], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[454], ['Name'] = "Smooth Block Model1249"})
end
if generatedParts[455] then
    table.insert(resizes, {['Part'] = generatedParts[455], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 23.400, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[455], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[455], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[455], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[455], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[455], ['Name'] = "Smooth Block Model1252"})
end
if generatedParts[456] then
    table.insert(resizes, {['Part'] = generatedParts[456], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 22.200, 14.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[456], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[456], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[456], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[456], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[456], ['Name'] = "Smooth Block Model1255"})
end
if generatedParts[457] then
    table.insert(resizes, {['Part'] = generatedParts[457], ['CFrame'] = (origin + offset) * CFrame.new(20.000, 25.800, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[457], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[457], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[457], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[457], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[457], ['Name'] = "Smooth Block Model1260"})
end
if generatedParts[458] then
    table.insert(resizes, {['Part'] = generatedParts[458], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 34.200, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[458], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[458], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[458], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[458], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[458], ['Name'] = "Smooth Block Model1265"})
end
if generatedParts[459] then
    table.insert(resizes, {['Part'] = generatedParts[459], ['CFrame'] = (origin + offset) * CFrame.new(10.000, 31.800, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[459], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[459], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[459], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[459], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[459], ['Name'] = "Smooth Block Model1270"})
end
if generatedParts[460] then
    table.insert(resizes, {['Part'] = generatedParts[460], ['CFrame'] = (origin + offset) * CFrame.new(16.000, 28.200, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[460], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[460], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[460], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[460], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[460], ['Name'] = "Smooth Block Model1273"})
end
if generatedParts[461] then
    table.insert(resizes, {['Part'] = generatedParts[461], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 37.800, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 4.000)})
    table.insert(colors, {['Part'] = generatedParts[461], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[461], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[461], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[461], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[461], ['Name'] = "Smooth Block Model1278"})
end
if generatedParts[462] then
    table.insert(resizes, {['Part'] = generatedParts[462], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 36.600, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[462], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[462], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[462], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[462], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[462], ['Name'] = "Smooth Block Model1281"})
end
if generatedParts[463] then
    table.insert(resizes, {['Part'] = generatedParts[463], ['CFrame'] = (origin + offset) * CFrame.new(14.000, 29.400, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[463], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[463], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[463], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[463], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[463], ['Name'] = "Smooth Block Model1283"})
end
if generatedParts[464] then
    table.insert(resizes, {['Part'] = generatedParts[464], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 35.400, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[464], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[464], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[464], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[464], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[464], ['Name'] = "Smooth Block Model1284"})
end
if generatedParts[465] then
    table.insert(resizes, {['Part'] = generatedParts[465], ['CFrame'] = (origin + offset) * CFrame.new(-20.000, 24.600, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[465], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[465], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[465], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[465], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[465], ['Name'] = "Smooth Block Model1287"})
end
if generatedParts[466] then
    table.insert(resizes, {['Part'] = generatedParts[466], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 23.400, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[466], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[466], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[466], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[466], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[466], ['Name'] = "Smooth Block Model1289"})
end
if generatedParts[467] then
    table.insert(resizes, {['Part'] = generatedParts[467], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 22.200, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[467], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[467], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[467], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[467], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[467], ['Name'] = "Smooth Block Model1293"})
end
if generatedParts[468] then
    table.insert(resizes, {['Part'] = generatedParts[468], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 21.000, 20.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[468], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[468], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[468], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[468], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[468], ['Name'] = "Smooth Block Model1295"})
end
if generatedParts[469] then
    table.insert(resizes, {['Part'] = generatedParts[469], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 23.400, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[469], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[469], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[469], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[469], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[469], ['Name'] = "Smooth Block Model1301"})
end
if generatedParts[470] then
    table.insert(resizes, {['Part'] = generatedParts[470], ['CFrame'] = (origin + offset) * CFrame.new(-20.000, 24.600, 14.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[470], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[470], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[470], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[470], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[470], ['Name'] = "Smooth Block Model1303"})
end
if generatedParts[471] then
    table.insert(resizes, {['Part'] = generatedParts[471], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 21.000, 32.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[471], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[471], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[471], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[471], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[471], ['Name'] = "Smooth Block Model1308"})
end
if generatedParts[472] then
    table.insert(resizes, {['Part'] = generatedParts[472], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 22.200, 26.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[472], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[472], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[472], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[472], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[472], ['Name'] = "Smooth Block Model1312"})
end
if generatedParts[473] then
    table.insert(resizes, {['Part'] = generatedParts[473], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 25.800, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[473], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[473], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[473], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[473], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[473], ['Name'] = "Smooth Block Model1313"})
end
if generatedParts[474] then
    table.insert(resizes, {['Part'] = generatedParts[474], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 27.000, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[474], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[474], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[474], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[474], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[474], ['Name'] = "Smooth Block Model1317"})
end
if generatedParts[475] then
    table.insert(resizes, {['Part'] = generatedParts[475], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 28.200, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[475], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[475], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[475], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[475], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[475], ['Name'] = "Smooth Block Model1318"})
end
if generatedParts[476] then
    table.insert(resizes, {['Part'] = generatedParts[476], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 25.800, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[476], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[476], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[476], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[476], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[476], ['Name'] = "Smooth Block Model1321"})
end
if generatedParts[477] then
    table.insert(resizes, {['Part'] = generatedParts[477], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 28.200, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[477], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[477], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[477], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[477], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[477], ['Name'] = "Smooth Block Model1325"})
end
if generatedParts[478] then
    table.insert(resizes, {['Part'] = generatedParts[478], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 27.000, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[478], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[478], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[478], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[478], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[478], ['Name'] = "Smooth Block Model1326"})
end
if generatedParts[479] then
    table.insert(resizes, {['Part'] = generatedParts[479], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 29.400, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[479], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[479], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[479], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[479], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[479], ['Name'] = "Smooth Block Model1330"})
end
if generatedParts[480] then
    table.insert(resizes, {['Part'] = generatedParts[480], ['CFrame'] = (origin + offset) * CFrame.new(-10.000, 30.600, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[480], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[480], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[480], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[480], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[480], ['Name'] = "Smooth Block Model1334"})
end
if generatedParts[481] then
    table.insert(resizes, {['Part'] = generatedParts[481], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 33.000, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[481], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[481], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[481], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[481], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[481], ['Name'] = "Smooth Block Model1336"})
end
if generatedParts[482] then
    table.insert(resizes, {['Part'] = generatedParts[482], ['CFrame'] = (origin + offset) * CFrame.new(-8.000, 31.800, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[482], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[482], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[482], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[482], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[482], ['Name'] = "Smooth Block Model1337"})
end
if generatedParts[483] then
    table.insert(resizes, {['Part'] = generatedParts[483], ['CFrame'] = (origin + offset) * CFrame.new(-4.000, 34.200, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[483], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[483], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[483], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[483], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[483], ['Name'] = "Smooth Block Model1340"})
end
if generatedParts[484] then
    table.insert(resizes, {['Part'] = generatedParts[484], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 30.600, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[484], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[484], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[484], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[484], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[484], ['Name'] = "Smooth Block Model1343"})
end
if generatedParts[485] then
    table.insert(resizes, {['Part'] = generatedParts[485], ['CFrame'] = (origin + offset) * CFrame.new(-5.000, 28.800, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(8.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[485], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[485], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[485], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[485], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[485], ['Name'] = "Smooth Block Model1344"})
end
if generatedParts[486] then
    table.insert(resizes, {['Part'] = generatedParts[486], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 33.000, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[486], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[486], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[486], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[486], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[486], ['Name'] = "Smooth Block Model1349"})
end
if generatedParts[487] then
    table.insert(resizes, {['Part'] = generatedParts[487], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 30.600, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[487], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[487], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[487], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[487], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[487], ['Name'] = "Smooth Block Model1350"})
end
if generatedParts[488] then
    table.insert(resizes, {['Part'] = generatedParts[488], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 31.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[488], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[488], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[488], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[488], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[488], ['Name'] = "Smooth Block Model1352"})
end
if generatedParts[489] then
    table.insert(resizes, {['Part'] = generatedParts[489], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 33.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[489], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[489], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[489], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[489], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[489], ['Name'] = "Smooth Block Model1357"})
end
if generatedParts[490] then
    table.insert(resizes, {['Part'] = generatedParts[490], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 31.200, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[490], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[490], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[490], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[490], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[490], ['Name'] = "Smooth Block Model1361"})
end
if generatedParts[491] then
    table.insert(resizes, {['Part'] = generatedParts[491], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 30.600, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[491], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[491], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[491], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[491], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[491], ['Name'] = "Smooth Block Model1364"})
end
if generatedParts[492] then
    table.insert(resizes, {['Part'] = generatedParts[492], ['CFrame'] = (origin + offset) * CFrame.new(18.000, 27.000, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[492], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[492], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[492], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[492], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[492], ['Name'] = "Smooth Block Model1368"})
end
if generatedParts[493] then
    table.insert(resizes, {['Part'] = generatedParts[493], ['CFrame'] = (origin + offset) * CFrame.new(22.000, 24.600, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[493], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[493], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[493], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[493], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[493], ['Name'] = "Smooth Block Model1370"})
end
if generatedParts[494] then
    table.insert(resizes, {['Part'] = generatedParts[494], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 21.000, 8.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[494], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[494], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[494], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[494], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[494], ['Name'] = "Smooth Block Model1371"})
end
if generatedParts[495] then
    table.insert(resizes, {['Part'] = generatedParts[495], ['CFrame'] = (origin + offset) * CFrame.new(10.000, 31.800, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[495], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[495], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[495], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[495], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[495], ['Name'] = "Smooth Block Model1374"})
end
if generatedParts[496] then
    table.insert(resizes, {['Part'] = generatedParts[496], ['CFrame'] = (origin + offset) * CFrame.new(16.000, 28.200, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[496], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[496], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[496], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[496], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[496], ['Name'] = "Smooth Block Model1378"})
end
if generatedParts[497] then
    table.insert(resizes, {['Part'] = generatedParts[497], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 34.200, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[497], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[497], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[497], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[497], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[497], ['Name'] = "Smooth Block Model1380"})
end
if generatedParts[498] then
    table.insert(resizes, {['Part'] = generatedParts[498], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 33.000, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[498], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[498], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[498], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[498], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[498], ['Name'] = "Smooth Block Model1384"})
end
if generatedParts[499] then
    table.insert(resizes, {['Part'] = generatedParts[499], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 23.400, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[499], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[499], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[499], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[499], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[499], ['Name'] = "Smooth Block Model1386"})
end
if generatedParts[500] then
    table.insert(resizes, {['Part'] = generatedParts[500], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 23.400, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[500], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[500], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[500], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[500], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[500], ['Name'] = "Smooth Block Model1387"})
end
if generatedParts[501] then
    table.insert(resizes, {['Part'] = generatedParts[501], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 22.200, 2.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[501], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[501], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[501], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[501], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[501], ['Name'] = "Smooth Block Model1391"})
end
if generatedParts[502] then
    table.insert(resizes, {['Part'] = generatedParts[502], ['CFrame'] = (origin + offset) * CFrame.new(-24.000, 22.200, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[502], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[502], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[502], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[502], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[502], ['Name'] = "Smooth Block Model1392"})
end
if generatedParts[503] then
    table.insert(resizes, {['Part'] = generatedParts[503], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 21.000, 8.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[503], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[503], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[503], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[503], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[503], ['Name'] = "Smooth Block Model1393"})
end
if generatedParts[504] then
    table.insert(resizes, {['Part'] = generatedParts[504], ['CFrame'] = (origin + offset) * CFrame.new(-20.000, 24.600, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[504], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[504], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[504], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[504], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[504], ['Name'] = "Smooth Block Model1397"})
end
if generatedParts[505] then
    table.insert(resizes, {['Part'] = generatedParts[505], ['CFrame'] = (origin + offset) * CFrame.new(-26.000, 21.000, -4.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[505], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[505], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[505], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[505], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[505], ['Name'] = "Smooth Block Model1401"})
end
if generatedParts[506] then
    table.insert(resizes, {['Part'] = generatedParts[506], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 25.800, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[506], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[506], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[506], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[506], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[506], ['Name'] = "Smooth Block Model1406"})
end
if generatedParts[507] then
    table.insert(resizes, {['Part'] = generatedParts[507], ['CFrame'] = (origin + offset) * CFrame.new(-11.000, 26.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[507], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[507], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[507], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[507], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[507], ['Name'] = "Smooth Block Model1408"})
end
if generatedParts[508] then
    table.insert(resizes, {['Part'] = generatedParts[508], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 28.800, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[508], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[508], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[508], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[508], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[508], ['Name'] = "Smooth Block Model1412"})
end
if generatedParts[509] then
    table.insert(resizes, {['Part'] = generatedParts[509], ['CFrame'] = (origin + offset) * CFrame.new(2.000, 28.800, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[509], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[509], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[509], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[509], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[509], ['Name'] = "Smooth Block Model1413"})
end
if generatedParts[510] then
    table.insert(resizes, {['Part'] = generatedParts[510], ['CFrame'] = (origin + offset) * CFrame.new(-8.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[510], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[510], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[510], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[510], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[510], ['Name'] = "Smooth Block Model1415"})
end
if generatedParts[511] then
    table.insert(resizes, {['Part'] = generatedParts[511], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 26.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[511], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[511], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[511], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[511], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[511], ['Name'] = "Smooth Block Model1419"})
end
if generatedParts[512] then
    table.insert(resizes, {['Part'] = generatedParts[512], ['CFrame'] = (origin + offset) * CFrame.new(-0.000, 26.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[512], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[512], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[512], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[512], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[512], ['Name'] = "Smooth Block Model1422"})
end
if generatedParts[513] then
    table.insert(resizes, {['Part'] = generatedParts[513], ['CFrame'] = (origin + offset) * CFrame.new(14.000, 29.400, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[513], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[513], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[513], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[513], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[513], ['Name'] = "Smooth Block Model1425"})
end
if generatedParts[514] then
    table.insert(resizes, {['Part'] = generatedParts[514], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[514], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[514], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[514], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[514], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[514], ['Name'] = "Smooth Block Model1429"})
end
if generatedParts[515] then
    table.insert(resizes, {['Part'] = generatedParts[515], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 28.200, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[515], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[515], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[515], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[515], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[515], ['Name'] = "Smooth Block Model1430"})
end
if generatedParts[516] then
    table.insert(resizes, {['Part'] = generatedParts[516], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 22.200, 2.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[516], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[516], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[516], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[516], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[516], ['Name'] = "Smooth Block Model1432"})
end
if generatedParts[517] then
    table.insert(resizes, {['Part'] = generatedParts[517], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 26.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[517], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[517], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[517], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[517], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[517], ['Name'] = "Smooth Block Model1433"})
end
if generatedParts[518] then
    table.insert(resizes, {['Part'] = generatedParts[518], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 26.400, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[518], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[518], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[518], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[518], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[518], ['Name'] = "Smooth Block Model1435"})
end
if generatedParts[519] then
    table.insert(resizes, {['Part'] = generatedParts[519], ['CFrame'] = (origin + offset) * CFrame.new(20.000, 25.800, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[519], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[519], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[519], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[519], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[519], ['Name'] = "Smooth Block Model1438"})
end
if generatedParts[520] then
    table.insert(resizes, {['Part'] = generatedParts[520], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 21.000, -7.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[520], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[520], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[520], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[520], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[520], ['Name'] = "Smooth Block Model1443"})
end
if generatedParts[521] then
    table.insert(resizes, {['Part'] = generatedParts[521], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[521], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[521], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[521], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[521], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[521], ['Name'] = "Smooth Block Model1446"})
end
if generatedParts[522] then
    table.insert(resizes, {['Part'] = generatedParts[522], ['CFrame'] = (origin + offset) * CFrame.new(18.000, 27.000, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[522], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[522], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[522], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[522], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[522], ['Name'] = "Smooth Block Model1452"})
end
if generatedParts[523] then
    table.insert(resizes, {['Part'] = generatedParts[523], ['CFrame'] = (origin + offset) * CFrame.new(-2.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[523], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[523], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[523], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[523], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[523], ['Name'] = "Smooth Block Model1456"})
end
if generatedParts[524] then
    table.insert(resizes, {['Part'] = generatedParts[524], ['CFrame'] = (origin + offset) * CFrame.new(6.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[524], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[524], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[524], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[524], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[524], ['Name'] = "Smooth Block Model1458"})
end
if generatedParts[525] then
    table.insert(resizes, {['Part'] = generatedParts[525], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[525], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[525], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[525], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[525], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[525], ['Name'] = "Smooth Block Model1462"})
end
if generatedParts[526] then
    table.insert(resizes, {['Part'] = generatedParts[526], ['CFrame'] = (origin + offset) * CFrame.new(10.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[526], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[526], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[526], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[526], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[526], ['Name'] = "Smooth Block Model1467"})
end
if generatedParts[527] then
    table.insert(resizes, {['Part'] = generatedParts[527], ['CFrame'] = (origin + offset) * CFrame.new(16.000, 24.000, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[527], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[527], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[527], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[527], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[527], ['Name'] = "Smooth Block Model1471"})
end
if generatedParts[528] then
    table.insert(resizes, {['Part'] = generatedParts[528], ['CFrame'] = (origin + offset) * CFrame.new(28.000, 21.000, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[528], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[528], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[528], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[528], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[528], ['Name'] = "Smooth Block Model1475"})
end
if generatedParts[529] then
    table.insert(resizes, {['Part'] = generatedParts[529], ['CFrame'] = (origin + offset) * CFrame.new(-6.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[529], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[529], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[529], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[529], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[529], ['Name'] = "Smooth Block Model1477"})
end
if generatedParts[530] then
    table.insert(resizes, {['Part'] = generatedParts[530], ['CFrame'] = (origin + offset) * CFrame.new(22.000, 24.600, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[530], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[530], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[530], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[530], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[530], ['Name'] = "Smooth Block Model1480"})
end
if generatedParts[531] then
    table.insert(resizes, {['Part'] = generatedParts[531], ['CFrame'] = (origin + offset) * CFrame.new(16.000, 25.800, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[531], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[531], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[531], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[531], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[531], ['Name'] = "Smooth Block Model1481"})
end
if generatedParts[532] then
    table.insert(resizes, {['Part'] = generatedParts[532], ['CFrame'] = (origin + offset) * CFrame.new(20.000, 23.400, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[532], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[532], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[532], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[532], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[532], ['Name'] = "Smooth Block Model1483"})
end
if generatedParts[533] then
    table.insert(resizes, {['Part'] = generatedParts[533], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[533], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[533], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[533], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[533], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[533], ['Name'] = "Smooth Block Model1486"})
end
if generatedParts[534] then
    table.insert(resizes, {['Part'] = generatedParts[534], ['CFrame'] = (origin + offset) * CFrame.new(-0.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[534], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[534], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[534], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[534], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[534], ['Name'] = "Smooth Block Model1493"})
end
if generatedParts[535] then
    table.insert(resizes, {['Part'] = generatedParts[535], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 23.400, -4.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[535], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[535], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[535], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[535], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[535], ['Name'] = "Smooth Block Model1494"})
end
if generatedParts[536] then
    table.insert(resizes, {['Part'] = generatedParts[536], ['CFrame'] = (origin + offset) * CFrame.new(12.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[536], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[536], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[536], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[536], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[536], ['Name'] = "Smooth Block Model1500"})
end
if generatedParts[537] then
    table.insert(resizes, {['Part'] = generatedParts[537], ['CFrame'] = (origin + offset) * CFrame.new(19.000, 21.600, -7.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(8.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[537], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[537], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[537], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[537], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[537], ['Name'] = "Smooth Block Model1503"})
end
if generatedParts[538] then
    table.insert(resizes, {['Part'] = generatedParts[538], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 21.000, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[538], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[538], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[538], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[538], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[538], ['Name'] = "Smooth Block Model1505"})
end
if generatedParts[539] then
    table.insert(resizes, {['Part'] = generatedParts[539], ['CFrame'] = (origin + offset) * CFrame.new(26.000, 22.200, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[539], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[539], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[539], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[539], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[539], ['Name'] = "Smooth Block Model"})
end
if generatedParts[540] then
    table.insert(resizes, {['Part'] = generatedParts[540], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 45.000, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[540], ['Color'] = Color3.new(0.584, 0.475, 0.467), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[540], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[540], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[540], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[540], ['Name'] = "Smooth Block Model1510"})
end
if generatedParts[541] then
    table.insert(resizes, {['Part'] = generatedParts[541], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 43.200, 37.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[541], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[541], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[541], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[541], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[541], ['Name'] = "Smooth Block Model1512"})
end
if generatedParts[542] then
    table.insert(resizes, {['Part'] = generatedParts[542], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 45.000, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[542], ['Color'] = Color3.new(0.584, 0.475, 0.467), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[542], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[542], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[542], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[542], ['Name'] = "Smooth Block Model1513"})
end
if generatedParts[543] then
    table.insert(resizes, {['Part'] = generatedParts[543], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 43.200, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[543], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[543], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[543], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[543], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[543], ['Name'] = "Smooth Block Model1515"})
end
if generatedParts[544] then
    table.insert(resizes, {['Part'] = generatedParts[544], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 45.000, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[544], ['Color'] = Color3.new(0.584, 0.475, 0.467), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[544], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[544], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[544], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[544], ['Name'] = "Smooth Block Model1520"})
end
if generatedParts[545] then
    table.insert(resizes, {['Part'] = generatedParts[545], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 40.800, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[545], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[545], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[545], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[545], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[545], ['Name'] = "Smooth Block Model1521"})
end
if generatedParts[546] then
    table.insert(resizes, {['Part'] = generatedParts[546], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 40.800, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[546], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[546], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[546], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[546], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[546], ['Name'] = "Smooth Block Model1526"})
end
if generatedParts[547] then
    table.insert(resizes, {['Part'] = generatedParts[547], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 40.800, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[547], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[547], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[547], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[547], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[547], ['Name'] = "Smooth Block Model1528"})
end
if generatedParts[548] then
    table.insert(resizes, {['Part'] = generatedParts[548], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 38.400, 37.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[548], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[548], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[548], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[548], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[548], ['Name'] = "Smooth Block Model1530"})
end
if generatedParts[549] then
    table.insert(resizes, {['Part'] = generatedParts[549], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 38.400, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[549], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[549], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[549], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[549], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[549], ['Name'] = "Smooth Block Model1533"})
end
if generatedParts[550] then
    table.insert(resizes, {['Part'] = generatedParts[550], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 43.200, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[550], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[550], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[550], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[550], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[550], ['Name'] = "Smooth Block Model1536"})
end
if generatedParts[551] then
    table.insert(resizes, {['Part'] = generatedParts[551], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 38.400, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[551], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[551], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[551], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[551], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[551], ['Name'] = "Smooth Block Model1540"})
end
if generatedParts[552] then
    table.insert(resizes, {['Part'] = generatedParts[552], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 36.000, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[552], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[552], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[552], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[552], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[552], ['Name'] = "Smooth Block Model1543"})
end
if generatedParts[553] then
    table.insert(resizes, {['Part'] = generatedParts[553], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 36.000, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[553], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[553], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[553], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[553], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[553], ['Name'] = "Smooth Block Model1545"})
end
if generatedParts[554] then
    table.insert(resizes, {['Part'] = generatedParts[554], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 36.000, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[554], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[554], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[554], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[554], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[554], ['Name'] = "Smooth Block Model1550"})
end
if generatedParts[555] then
    table.insert(resizes, {['Part'] = generatedParts[555], ['CFrame'] = (origin + offset) * CFrame.new(-14.000, 33.600, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[555], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[555], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[555], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[555], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[555], ['Name'] = "Smooth Block Model1554"})
end
if generatedParts[556] then
    table.insert(resizes, {['Part'] = generatedParts[556], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 33.600, 37.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[556], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[556], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[556], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[556], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[556], ['Name'] = "Smooth Block Model1559"})
end
if generatedParts[557] then
    table.insert(resizes, {['Part'] = generatedParts[557], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 33.600, 41.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[557], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[557], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[557], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[557], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[557], ['Name'] = "Smooth Block Model1560"})
end
if generatedParts[558] then
    table.insert(resizes, {['Part'] = generatedParts[558], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 31.200, 35.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[558], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[558], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[558], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[558], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[558], ['Name'] = "Smooth Block Model1561"})
end
if generatedParts[559] then
    table.insert(resizes, {['Part'] = generatedParts[559], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 31.200, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[559], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[559], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[559], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[559], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[559], ['Name'] = "Smooth Block Model1565"})
end
if generatedParts[560] then
    table.insert(resizes, {['Part'] = generatedParts[560], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 33.600, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[560], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[560], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[560], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[560], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[560], ['Name'] = "Smooth Block Model1567"})
end
if generatedParts[561] then
    table.insert(resizes, {['Part'] = generatedParts[561], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 43.200, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[561], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[561], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[561], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[561], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[561], ['Name'] = "Smooth Block Model1569"})
end
if generatedParts[562] then
    table.insert(resizes, {['Part'] = generatedParts[562], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 38.400, 39.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[562], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[562], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[562], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[562], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[562], ['Name'] = "Smooth Block Model1573"})
end
if generatedParts[563] then
    table.insert(resizes, {['Part'] = generatedParts[563], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 40.800, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[563], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[563], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[563], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[563], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[563], ['Name'] = "Smooth Block Model1578"})
end
if generatedParts[564] then
    table.insert(resizes, {['Part'] = generatedParts[564], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 36.000, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[564], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[564], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[564], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[564], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[564], ['Name'] = "Smooth Block Model1579"})
end
if generatedParts[565] then
    table.insert(resizes, {['Part'] = generatedParts[565], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 31.800, 38.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(8.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[565], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[565], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[565], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[565], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[565], ['Name'] = "Smooth Block Model1582"})
end
if generatedParts[566] then
    table.insert(resizes, {['Part'] = generatedParts[566], ['CFrame'] = (origin + offset) * CFrame.new(-12.000, 45.000, 37.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[566], ['Color'] = Color3.new(0.584, 0.475, 0.467), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[566], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[566], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[566], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[566], ['Name'] = "Smooth Block Model1583"})
end
if generatedParts[567] then
    table.insert(resizes, {['Part'] = generatedParts[567], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 28.800, 35.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[567], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[567], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[567], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[567], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[567], ['Name'] = "Smooth Block Model1584"})
end
if generatedParts[568] then
    table.insert(resizes, {['Part'] = generatedParts[568], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 29.400, 35.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[568], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[568], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[568], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[568], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[568], ['Name'] = "Smooth Block Model1587"})
end
if generatedParts[569] then
    table.insert(resizes, {['Part'] = generatedParts[569], ['CFrame'] = (origin + offset) * CFrame.new(-18.000, 28.800, 39.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[569], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[569], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[569], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[569], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[569], ['Name'] = "Smooth Block Model1588"})
end
if generatedParts[570] then
    table.insert(resizes, {['Part'] = generatedParts[570], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 29.400, 41.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.000, 1.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[570], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[570], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[570], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[570], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[570], ['Name'] = "Smooth Block Model1591"})
end
if generatedParts[571] then
    table.insert(resizes, {['Part'] = generatedParts[571], ['CFrame'] = (origin + offset) * CFrame.new(-16.000, 31.200, 41.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 2.400, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[571], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[571], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[571], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[571], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[571], ['Name'] = "Smooth Block Model"})
end
if generatedParts[572] then
    table.insert(resizes, {['Part'] = generatedParts[572], ['CFrame'] = (origin + offset) * CFrame.new(4.000, 0.600, 25.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(184.000, 1.200, 210.000)})
    table.insert(colors, {['Part'] = generatedParts[572], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[572], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[572], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[572], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[572], ['Name'] = "Smooth Block Model"})
end
if generatedParts[573] then
    table.insert(resizes, {['Part'] = generatedParts[573], ['CFrame'] = (origin + offset) * CFrame.new(2.000, 15.300, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.667, 2.333, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[573], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[573], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[573], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[573], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[573], ['Name'] = "Head"})
end
if generatedParts[574] then
    table.insert(resizes, {['Part'] = generatedParts[574], ['CFrame'] = (origin + offset) * CFrame.new(2.000, 11.800, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.667, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[574], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[574], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[574], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[574], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[574], ['Name'] = "Torso"})
end
if generatedParts[575] then
    table.insert(resizes, {['Part'] = generatedParts[575], ['CFrame'] = (origin + offset) * CFrame.new(5.500, 11.800, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.333, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[575], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[575], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[575], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[575], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[575], ['Name'] = "Left Arm"})
end
if generatedParts[576] then
    table.insert(resizes, {['Part'] = generatedParts[576], ['CFrame'] = (origin + offset) * CFrame.new(-1.500, 11.800, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.333, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[576], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[576], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[576], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[576], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[576], ['Name'] = "Right Arm"})
end
if generatedParts[577] then
    table.insert(resizes, {['Part'] = generatedParts[577], ['CFrame'] = (origin + offset) * CFrame.new(3.167, 7.133, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.333, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[577], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[577], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[577], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[577], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[577], ['Name'] = "Left Leg"})
end
if generatedParts[578] then
    table.insert(resizes, {['Part'] = generatedParts[578], ['CFrame'] = (origin + offset) * CFrame.new(0.833, 7.133, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.333, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[578], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[578], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[578], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[578], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[578], ['Name'] = "Right Leg"})
end
if generatedParts[579] then
    table.insert(resizes, {['Part'] = generatedParts[579], ['CFrame'] = (origin + offset) * CFrame.new(2.000, 11.800, 0.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.667, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[579], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[579], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[579], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[579], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[579], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[580] then
    table.insert(resizes, {['Part'] = generatedParts[580], ['CFrame'] = (origin + offset) * CFrame.new(2.005, 18.658, 0.148, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(7.000, 4.667, 1.750)})
    table.insert(colors, {['Part'] = generatedParts[580], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[580], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[580], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[580], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[580], ['Name'] = "Handle"})
end
if generatedParts[581] then
    table.insert(resizes, {['Part'] = generatedParts[581], ['CFrame'] = (origin + offset) * CFrame.new(-1.657, 9.915, 0.911, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.333, 2.333, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[581], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[581], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[581], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[581], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[581], ['Name'] = "Handle"})
end
if generatedParts[582] then
    table.insert(resizes, {['Part'] = generatedParts[582], ['CFrame'] = (origin + offset) * CFrame.new(3.144, 12.899, 1.309, -0.889, -0.399, 0.223, -0.091, -0.323, -0.942, 0.448, -0.858, 0.251), ['Size'] = Vector3.new(2.333, 2.333, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[582], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[582], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[582], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[582], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[582], ['Name'] = "Handle"})
end
if generatedParts[583] then
    table.insert(resizes, {['Part'] = generatedParts[583], ['CFrame'] = (origin + offset) * CFrame.new(2.040, 15.707, 0.431, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.333, 2.333, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[583], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[583], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[583], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[583], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[583], ['Name'] = "Handle"})
end
if generatedParts[584] then
    table.insert(resizes, {['Part'] = generatedParts[584], ['CFrame'] = (origin + offset) * CFrame.new(2.043, 15.456, 0.388, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.333, 2.333, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[584], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[584], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[584], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[584], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[584], ['Name'] = "Handle"})
end
if generatedParts[585] then
    table.insert(resizes, {['Part'] = generatedParts[585], ['CFrame'] = (origin + offset) * CFrame.new(0.000, 15.000, -30.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[585], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[585], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[585], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[585], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[585], ['Name'] = "FlyCameraFocus"})
end
task.wait(0.1)
pcall(function() _({'SyncResize', resizes}) end)
task.wait(0.35)
pcall(function() _({'SyncColor', colors}) end)
task.wait(0.35)
pcall(function() _({'SyncMaterial', materials}) end)
task.wait(0.35)
pcall(function() _({'SyncAnchor', anchors}) end)
task.wait(0.35)
pcall(function() _({'SyncCollision', collisions}) end)
task.wait(0.35)
for _, v in ipairs(names) do if v.Part then pcall(function() _({'SetName', {v.Part}, v.Name}) end) end end
if generatedParts[4] then
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "rbxasset://textures/SpawnLocation.png", Enum.NormalId.Top) end)
end
if generatedParts[573] then
    pcall(function() AddMesh(generatedParts[573]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[573], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[573], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[573], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[573], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[574] then
    pcall(function() SpawnDecal(generatedParts[574], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[574], "", Enum.NormalId.Front) end)
end
if generatedParts[580] then
    pcall(function() AddMesh(generatedParts[580]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[580], "6243244191") end)
    pcall(function() MeshResize(generatedParts[580], Vector3.new(2.333, 2.333, 2.333)) end)
    pcall(function() vect(generatedParts[580], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[581] then
    pcall(function() AddMesh(generatedParts[581]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[581], "89446919321065") end)
    pcall(function() MeshResize(generatedParts[581], Vector3.new(2.333, 2.333, 2.333)) end)
    pcall(function() vect(generatedParts[581], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[582] then
    pcall(function() AddMesh(generatedParts[582]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[582], "18707529577") end)
    pcall(function() MeshResize(generatedParts[582], Vector3.new(2.333, 2.333, 2.333)) end)
    pcall(function() vect(generatedParts[582], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[583] then
    pcall(function() AddMesh(generatedParts[583]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[583], "84744134444840") end)
    pcall(function() MeshResize(generatedParts[583], Vector3.new(2.333, 2.333, 2.333)) end)
    pcall(function() vect(generatedParts[583], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[584] then
    pcall(function() AddMesh(generatedParts[584]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[584], "77057171956569") end)
    pcall(function() MeshResize(generatedParts[584], Vector3.new(2.333, 2.333, 2.333)) end)
    pcall(function() vect(generatedParts[584], Vector3.new(0.000, 0.000, 0.000)) end)
end
if root then root.Anchored = false end