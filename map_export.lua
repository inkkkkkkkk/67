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
task.spawn(function() pcall(function() generatedParts[1] = CreatePart("Normal", CFrame.new(-211.984, 42.050, 877.080, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[2] = CreatePart("Normal", CFrame.new(-211.843, 64.238, 877.089, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[3] = CreatePart("Normal", CFrame.new(-211.843, 59.782, 877.089, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[4] = CreatePart("Normal", CFrame.new(-211.843, 67.181, 877.089, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[5] = CreatePart("Normal", CFrame.new(-211.843, 69.353, 877.089, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[6] = CreatePart("Normal", CFrame.new(-214.253, 10.085, 849.702, 1.000, 0.003, -0.001, -0.001, -0.005, -1.000, -0.003, 1.000, -0.005), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[7] = CreatePart("Cylinder", CFrame.new(-217.864, 7.555, 849.792, -0.003, 0.001, 1.000, 0.004, 1.000, -0.001, -1.000, 0.004, -0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[8] = CreatePart("Normal", CFrame.new(-215.881, 7.580, 850.278, -1.000, -0.001, -0.003, -0.001, 1.000, -0.004, 0.003, -0.004, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[9] = CreatePart("Normal", CFrame.new(-212.640, 14.540, 850.258, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[10] = CreatePart("Normal", CFrame.new(-209.430, 7.580, 850.207, 1.000, 0.001, 0.003, -0.001, 1.000, -0.004, -0.003, 0.004, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[11] = CreatePart("Normal", CFrame.new(-214.254, 10.084, 850.729, -1.000, -0.003, 0.001, -0.001, -0.005, -1.000, 0.003, -1.000, 0.005), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[12] = CreatePart("Normal", CFrame.new(-214.244, 10.153, 850.918, -1.000, -0.001, -0.003, -0.001, 1.000, -0.005, 0.003, -0.005, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[13] = CreatePart("Cylinder", CFrame.new(-214.048, 7.553, 850.699, -0.003, -0.001, 1.000, -0.004, 1.000, 0.001, -1.000, -0.004, -0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[14] = CreatePart("Normal", CFrame.new(-211.123, 10.153, 849.620, 1.000, 0.001, 0.003, -0.001, 1.000, -0.005, -0.003, 0.005, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[15] = CreatePart("Normal", CFrame.new(-209.431, 7.580, 850.278, -1.000, -0.001, -0.003, -0.001, 1.000, -0.004, 0.003, -0.004, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[16] = CreatePart("Cylinder", CFrame.new(-209.313, 7.552, 849.780, 0.003, 0.001, -1.000, -0.004, 1.000, 0.001, 1.000, 0.004, 0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[17] = CreatePart("Normal", CFrame.new(-215.880, 7.580, 850.207, 1.000, 0.001, 0.003, -0.001, 1.000, -0.004, -0.003, 0.004, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[18] = CreatePart("Normal", CFrame.new(-211.104, 10.153, 850.918, -1.000, -0.001, -0.003, -0.001, 1.000, -0.005, 0.003, -0.005, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[19] = CreatePart("Cylinder", CFrame.new(-207.446, 7.555, 850.692, 0.003, -0.001, -1.000, 0.004, 1.000, -0.001, 1.000, -0.004, 0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[20] = CreatePart("Normal", CFrame.new(-214.254, 10.085, 850.836, -1.000, -0.003, 0.001, -0.001, -0.005, -1.000, 0.003, -1.000, 0.005), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[21] = CreatePart("Cylinder", CFrame.new(-211.290, 7.552, 850.703, 0.003, -0.001, -1.000, 0.004, 1.000, -0.001, 1.000, -0.004, 0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[22] = CreatePart("Normal", CFrame.new(-211.113, 10.084, 849.809, 1.000, 0.003, -0.001, -0.001, -0.005, -1.000, -0.003, 1.000, -0.005), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[23] = CreatePart("Normal", CFrame.new(-214.263, 10.153, 849.620, 1.000, 0.001, 0.003, -0.001, 1.000, -0.005, -0.003, 0.005, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[24] = CreatePart("Cylinder", CFrame.new(-217.864, 7.555, 850.733, -0.003, 0.001, 1.000, 0.004, 1.000, -0.001, -1.000, 0.004, -0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[25] = CreatePart("Normal", CFrame.new(-214.253, 10.084, 849.809, 1.000, 0.003, -0.001, -0.001, -0.005, -1.000, -0.003, 1.000, -0.005), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[26] = CreatePart("Cylinder", CFrame.new(-215.998, 7.552, 850.704, -0.003, -0.001, 1.000, -0.004, 1.000, 0.001, -1.000, -0.004, -0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[27] = CreatePart("Normal", CFrame.new(-211.113, 10.085, 849.702, 1.000, 0.003, -0.001, -0.001, -0.005, -1.000, -0.003, 1.000, -0.005), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[28] = CreatePart("Cylinder", CFrame.new(-214.020, 7.552, 849.782, -0.003, 0.001, 1.000, 0.004, 1.000, -0.001, -1.000, 0.004, -0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[29] = CreatePart("Cylinder", CFrame.new(-207.419, 7.550, 849.775, 0.003, 0.001, -1.000, -0.004, 1.000, 0.001, 1.000, 0.004, 0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[30] = CreatePart("Cylinder", CFrame.new(-209.341, 7.553, 850.697, 0.003, -0.001, -1.000, 0.004, 1.000, -0.001, 1.000, -0.004, 0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[31] = CreatePart("Normal", CFrame.new(-211.114, 10.085, 850.836, -1.000, -0.003, 0.001, -0.001, -0.005, -1.000, 0.003, -1.000, 0.005), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[32] = CreatePart("Cylinder", CFrame.new(-215.970, 7.553, 849.787, -0.003, 0.001, 1.000, 0.004, 1.000, -0.001, -1.000, 0.004, -0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[33] = CreatePart("Cylinder", CFrame.new(-211.263, 7.553, 849.785, 0.003, 0.001, -1.000, -0.004, 1.000, 0.001, 1.000, 0.004, 0.003), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[34] = CreatePart("Normal", CFrame.new(-211.114, 10.084, 850.729, -1.000, -0.003, 0.001, -0.001, -0.005, -1.000, 0.003, -1.000, 0.005), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[35] = CreatePart("Normal", CFrame.new(-236.690, 3.921, 899.084, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[36] = CreatePart("Normal", CFrame.new(-236.690, 3.921, 873.123, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[37] = CreatePart("Normal", CFrame.new(-236.690, 3.921, 882.004, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[38] = CreatePart("Normal", CFrame.new(-236.690, 3.921, 855.952, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[39] = CreatePart("Normal", CFrame.new(-236.690, 3.921, 890.534, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[40] = CreatePart("Normal", CFrame.new(-236.690, 3.921, 864.593, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[41] = CreatePart("Normal", CFrame.new(-236.690, 3.921, 916.125, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[42] = CreatePart("Normal", CFrame.new(-236.690, 3.921, 907.614, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[43] = CreatePart("Normal", CFrame.new(-236.690, 3.921, 924.655, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[44] = CreatePart("Normal", CFrame.new(-244.210, 3.921, 899.084, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[45] = CreatePart("Normal", CFrame.new(-244.210, 3.921, 864.593, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[46] = CreatePart("Normal", CFrame.new(-244.210, 3.921, 855.952, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[47] = CreatePart("Normal", CFrame.new(-244.210, 3.921, 890.534, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[48] = CreatePart("Normal", CFrame.new(-244.210, 3.921, 882.003, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[49] = CreatePart("Normal", CFrame.new(-244.210, 3.921, 873.123, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[50] = CreatePart("Normal", CFrame.new(-244.210, 3.921, 907.614, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[51] = CreatePart("Normal", CFrame.new(-244.210, 3.921, 924.655, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[52] = CreatePart("Normal", CFrame.new(-244.210, 3.921, 916.125, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[53] = CreatePart("Normal", CFrame.new(-214.899, 3.921, 899.084, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[54] = CreatePart("Normal", CFrame.new(-229.639, 3.921, 899.084, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[55] = CreatePart("Normal", CFrame.new(-222.119, 3.921, 899.084, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[56] = CreatePart("Normal", CFrame.new(-214.899, 3.921, 882.003, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[57] = CreatePart("Normal", CFrame.new(-222.119, 3.921, 882.003, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[58] = CreatePart("Normal", CFrame.new(-222.119, 3.921, 873.123, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[59] = CreatePart("Normal", CFrame.new(-214.899, 3.921, 890.534, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[60] = CreatePart("Normal", CFrame.new(-229.639, 3.921, 864.593, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[61] = CreatePart("Normal", CFrame.new(-222.119, 3.921, 890.534, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[62] = CreatePart("Normal", CFrame.new(-222.119, 3.921, 864.593, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[63] = CreatePart("Normal", CFrame.new(-214.899, 3.921, 855.952, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[64] = CreatePart("Normal", CFrame.new(-214.899, 3.921, 864.593, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[65] = CreatePart("Normal", CFrame.new(-229.639, 3.921, 873.123, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[66] = CreatePart("Normal", CFrame.new(-229.639, 3.921, 855.952, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[67] = CreatePart("Normal", CFrame.new(-229.639, 3.921, 890.534, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[68] = CreatePart("Normal", CFrame.new(-229.639, 3.921, 882.003, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[69] = CreatePart("Normal", CFrame.new(-222.119, 3.921, 855.952, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[70] = CreatePart("Normal", CFrame.new(-214.899, 3.921, 873.123, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[71] = CreatePart("Normal", CFrame.new(-214.899, 3.921, 907.614, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[72] = CreatePart("Normal", CFrame.new(-229.639, 3.921, 907.614, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[73] = CreatePart("Normal", CFrame.new(-222.119, 3.921, 907.614, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[74] = CreatePart("Normal", CFrame.new(-207.966, 3.921, 898.659, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[75] = CreatePart("Normal", CFrame.new(-200.446, 3.921, 898.659, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[76] = CreatePart("Normal", CFrame.new(-193.226, 3.921, 898.659, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[77] = CreatePart("Normal", CFrame.new(-193.226, 3.921, 890.109, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[78] = CreatePart("Normal", CFrame.new(-193.226, 3.921, 864.168, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[79] = CreatePart("Normal", CFrame.new(-193.226, 3.921, 872.698, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[80] = CreatePart("Normal", CFrame.new(-193.226, 3.921, 881.579, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[81] = CreatePart("Normal", CFrame.new(-193.226, 3.921, 855.528, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[82] = CreatePart("Normal", CFrame.new(-200.446, 3.921, 881.579, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[83] = CreatePart("Normal", CFrame.new(-200.446, 3.921, 872.698, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[84] = CreatePart("Normal", CFrame.new(-207.966, 3.921, 855.528, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[85] = CreatePart("Normal", CFrame.new(-200.446, 3.921, 864.168, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[86] = CreatePart("Normal", CFrame.new(-200.446, 3.921, 855.528, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[87] = CreatePart("Normal", CFrame.new(-207.966, 3.921, 864.168, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[88] = CreatePart("Normal", CFrame.new(-200.446, 3.921, 890.109, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[89] = CreatePart("Normal", CFrame.new(-207.966, 3.921, 872.698, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[90] = CreatePart("Normal", CFrame.new(-207.966, 3.921, 890.109, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[91] = CreatePart("Normal", CFrame.new(-207.966, 3.921, 881.579, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[92] = CreatePart("Normal", CFrame.new(-193.226, 3.921, 907.190, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[93] = CreatePart("Normal", CFrame.new(-200.446, 3.921, 907.190, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[94] = CreatePart("Normal", CFrame.new(-207.966, 3.921, 907.190, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[95] = CreatePart("Normal", CFrame.new(-186.244, 3.921, 898.847, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[96] = CreatePart("Normal", CFrame.new(-186.244, 3.921, 890.297, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[97] = CreatePart("Normal", CFrame.new(-186.244, 3.921, 864.355, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[98] = CreatePart("Normal", CFrame.new(-186.244, 3.921, 872.886, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[99] = CreatePart("Normal", CFrame.new(-186.244, 3.921, 881.766, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[100] = CreatePart("Normal", CFrame.new(-186.244, 3.921, 855.715, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[101] = CreatePart("Normal", CFrame.new(-186.244, 3.921, 915.888, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[102] = CreatePart("Normal", CFrame.new(-186.244, 3.921, 907.377, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[103] = CreatePart("Normal", CFrame.new(-186.244, 3.921, 924.418, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[104] = CreatePart("Normal", CFrame.new(-178.723, 3.921, 898.847, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[105] = CreatePart("Normal", CFrame.new(-178.723, 3.921, 890.297, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[106] = CreatePart("Normal", CFrame.new(-178.723, 3.921, 855.715, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[107] = CreatePart("Normal", CFrame.new(-178.723, 3.921, 864.355, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[108] = CreatePart("Normal", CFrame.new(-178.723, 3.921, 872.886, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[109] = CreatePart("Normal", CFrame.new(-178.723, 3.921, 881.766, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[110] = CreatePart("Normal", CFrame.new(-178.723, 3.921, 907.377, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[111] = CreatePart("Normal", CFrame.new(-178.723, 3.921, 915.888, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[112] = CreatePart("Normal", CFrame.new(-178.723, 3.921, 924.418, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[113] = CreatePart("Normal", CFrame.new(-218.608, 46.013, 877.692, 0.260, -0.966, 0.000, 0.966, 0.260, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[114] = CreatePart("Normal", CFrame.new(-205.862, 46.192, 877.692, -0.260, 0.966, 0.000, 0.966, 0.260, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[115] = CreatePart("Normal", CFrame.new(-212.213, 46.013, 883.556, -0.000, 0.000, 1.000, 0.966, 0.260, 0.000, -0.260, 0.966, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[116] = CreatePart("Normal", CFrame.new(-212.213, 46.192, 870.810, -0.000, 0.000, -1.000, 0.966, 0.260, -0.000, 0.260, -0.966, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[117] = CreatePart("Normal", CFrame.new(-227.790, 41.043, 932.266, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[118] = CreatePart("Normal", CFrame.new(-227.790, 40.769, 932.266, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[119] = CreatePart("Normal", CFrame.new(-227.790, 39.836, 932.266, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[120] = CreatePart("Normal", CFrame.new(-227.790, 40.398, 932.266, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[121] = CreatePart("Normal", CFrame.new(-229.886, 13.928, 932.320, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[122] = CreatePart("Normal", CFrame.new(-227.717, 4.942, 921.690, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[123] = CreatePart("Normal", CFrame.new(-227.717, 7.957, 925.065, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[124] = CreatePart("Normal", CFrame.new(-225.636, 21.968, 932.320, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[125] = CreatePart("Normal", CFrame.new(-227.717, 5.767, 922.525, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[126] = CreatePart("Normal", CFrame.new(-227.717, 6.032, 923.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[127] = CreatePart("Normal", CFrame.new(-227.717, 9.007, 926.335, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[128] = CreatePart("Normal", CFrame.new(-229.886, 14.018, 934.981, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[129] = CreatePart("Normal", CFrame.new(-229.886, 16.345, 933.564, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[130] = CreatePart("Normal", CFrame.new(-225.636, 5.982, 920.290, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[131] = CreatePart("Normal", CFrame.new(-229.886, 10.037, 929.520, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[132] = CreatePart("Normal", CFrame.new(-225.636, 14.018, 934.981, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[133] = CreatePart("Normal", CFrame.new(-227.717, 10.362, 928.120, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[134] = CreatePart("Normal", CFrame.new(-227.717, 12.287, 930.185, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[135] = CreatePart("Normal", CFrame.new(-227.717, 8.127, 929.410, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[136] = CreatePart("Normal", CFrame.new(-227.717, 6.867, 923.755, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[137] = CreatePart("Normal", CFrame.new(-225.636, 16.345, 933.564, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[138] = CreatePart("Normal", CFrame.new(-227.816, 12.552, 932.305, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[139] = CreatePart("Normal", CFrame.new(-227.791, 19.703, 934.706, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[140] = CreatePart("Normal", CFrame.new(-227.717, 11.197, 928.875, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[141] = CreatePart("Normal", CFrame.new(-227.761, 23.992, 932.250, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[142] = CreatePart("Normal", CFrame.new(-227.791, 10.097, 934.706, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[143] = CreatePart("Normal", CFrame.new(-225.636, 13.928, 932.320, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[144] = CreatePart("Normal", CFrame.new(-227.717, 9.272, 926.810, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[145] = CreatePart("Normal", CFrame.new(-227.717, 8.222, 925.540, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[146] = CreatePart("Normal", CFrame.new(-227.781, 21.968, 929.935, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[147] = CreatePart("Normal", CFrame.new(-229.886, 21.968, 932.320, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[148] = CreatePart("Normal", CFrame.new(-227.717, 4.677, 921.215, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[149] = CreatePart("Normal", CFrame.new(-225.636, 10.037, 929.520, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[150] = CreatePart("Normal", CFrame.new(-227.717, 8.127, 929.410, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[151] = CreatePart("Normal", CFrame.new(-227.781, 23.143, 932.310, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[152] = CreatePart("Normal", CFrame.new(-227.717, 7.132, 924.230, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[153] = CreatePart("Normal", CFrame.new(-227.717, 10.097, 927.645, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[154] = CreatePart("Normal", CFrame.new(-229.886, 5.982, 920.290, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[155] = CreatePart("Normal", CFrame.new(-197.648, 8.869, 929.107, -1.000, 0.000, 0.000, 0.000, 0.956, 0.295, 0.000, 0.295, -0.956), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[156] = CreatePart("Normal", CFrame.new(-197.648, 7.517, 927.734, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[157] = CreatePart("Normal", CFrame.new(-197.668, 4.917, 932.559, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[158] = CreatePart("Normal", CFrame.new(-197.668, 4.412, 932.559, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[159] = CreatePart("Normal", CFrame.new(-197.648, 6.447, 934.034, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[160] = CreatePart("Normal", CFrame.new(-197.668, 4.622, 932.559, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[161] = CreatePart("Normal", CFrame.new(-197.648, 5.122, 930.779, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[162] = CreatePart("Normal", CFrame.new(-197.668, 4.292, 932.559, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[163] = CreatePart("Cylinder", CFrame.new(-220.520, 11.344, 837.788, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[164] = CreatePart("Cylinder", CFrame.new(-220.583, 4.443, 837.791, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[165] = CreatePart("Cylinder", CFrame.new(-220.562, 4.054, 837.810, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[166] = CreatePart("Normal", CFrame.new(-265.161, 144.958, 933.077, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[167] = CreatePart("Normal", CFrame.new(-265.161, 142.348, 933.077, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[168] = CreatePart("Normal", CFrame.new(-265.161, 143.920, 933.077, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[169] = CreatePart("Normal", CFrame.new(-265.161, 145.724, 933.077, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[170] = CreatePart("Normal", CFrame.new(-265.080, 99.899, 933.032, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[171] = CreatePart("Normal", CFrame.new(-265.087, 51.876, 933.068, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[172] = CreatePart("Normal", CFrame.new(-249.258, 41.778, 849.537, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[173] = CreatePart("Normal", CFrame.new(-249.177, 57.461, 849.542, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[174] = CreatePart("Normal", CFrame.new(-249.177, 51.963, 849.542, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[175] = CreatePart("Normal", CFrame.new(-249.177, 54.523, 849.542, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[176] = CreatePart("Normal", CFrame.new(-249.177, 56.213, 849.542, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[177] = CreatePart("Normal", CFrame.new(-158.987, 145.725, 932.907, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[178] = CreatePart("Normal", CFrame.new(-158.987, 144.959, 932.907, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[179] = CreatePart("Normal", CFrame.new(-158.987, 142.349, 932.907, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[180] = CreatePart("Normal", CFrame.new(-158.987, 143.921, 932.907, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[181] = CreatePart("Normal", CFrame.new(-158.906, 99.899, 932.862, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[182] = CreatePart("Normal", CFrame.new(-158.913, 51.876, 932.898, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[183] = CreatePart("Cylinder", CFrame.new(-204.643, 11.391, 837.114, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[184] = CreatePart("Cylinder", CFrame.new(-204.706, 4.490, 837.117, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[185] = CreatePart("Cylinder", CFrame.new(-204.686, 4.101, 837.137, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[186] = CreatePart("Normal", CFrame.new(-174.271, 51.963, 925.690, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[187] = CreatePart("Normal", CFrame.new(-174.271, 56.213, 925.690, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[188] = CreatePart("Normal", CFrame.new(-174.271, 57.461, 925.690, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[189] = CreatePart("Normal", CFrame.new(-174.271, 54.523, 925.690, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[190] = CreatePart("Normal", CFrame.new(-174.352, 41.778, 925.685, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[191] = CreatePart("Normal", CFrame.new(-174.126, 57.461, 849.492, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[192] = CreatePart("Normal", CFrame.new(-174.207, 41.778, 849.487, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[193] = CreatePart("Normal", CFrame.new(-174.126, 51.963, 849.492, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[194] = CreatePart("Normal", CFrame.new(-174.126, 56.213, 849.492, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[195] = CreatePart("Normal", CFrame.new(-174.126, 54.523, 849.492, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[196] = CreatePart("Normal", CFrame.new(-249.044, 41.778, 925.347, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[197] = CreatePart("Normal", CFrame.new(-248.963, 56.213, 925.352, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[198] = CreatePart("Normal", CFrame.new(-248.963, 51.963, 925.352, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[199] = CreatePart("Normal", CFrame.new(-248.963, 54.523, 925.352, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[200] = CreatePart("Normal", CFrame.new(-248.963, 57.461, 925.352, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[201] = CreatePart("Normal", CFrame.new(-211.913, 3.817, 888.265, 0.000, 0.000, -1.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[202] = CreatePart("Normal", CFrame.new(-212.144, 41.281, 887.279, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[203] = CreatePart("Normal", CFrame.new(-212.684, 3.939, 843.513, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[204] = CreatePart("Normal", CFrame.new(-260.187, 22.568, 888.311, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[205] = CreatePart("Normal", CFrame.new(-163.475, 22.551, 888.311, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[206] = CreatePart("Normal", CFrame.new(-212.812, 2.325, 936.840, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[207] = CreatePart("Normal", CFrame.new(-210.720, 22.548, 936.683, 0.000, 0.000, -1.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[208] = CreatePart("Normal", CFrame.new(-214.330, 3.867, 930.548, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[209] = CreatePart("Normal", CFrame.new(-211.531, 42.790, 878.321, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[210] = CreatePart("Normal", CFrame.new(-257.408, 42.245, 845.315, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[211] = CreatePart("Normal", CFrame.new(-175.664, 42.245, 847.604, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[212] = CreatePart("Normal", CFrame.new(-251.389, 42.245, 923.597, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[213] = CreatePart("Normal", CFrame.new(-175.994, 42.245, 926.565, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[214] = CreatePart("Normal", CFrame.new(-198.098, 13.511, 932.207, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[215] = CreatePart("Normal", CFrame.new(-198.098, 8.680, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[216] = CreatePart("Normal", CFrame.new(-198.126, 14.440, 932.623, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[217] = CreatePart("Normal", CFrame.new(-198.098, 12.336, 932.831, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[218] = CreatePart("Normal", CFrame.new(-197.329, 7.940, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[219] = CreatePart("Normal", CFrame.new(-198.098, 13.323, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[220] = CreatePart("Normal", CFrame.new(-198.098, 11.016, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[221] = CreatePart("Normal", CFrame.new(-195.084, 11.723, 932.605, -0.707, -0.707, 0.000, 0.707, -0.707, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[222] = CreatePart("Normal", CFrame.new(-198.867, 7.940, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[223] = CreatePart("Normal", CFrame.new(-198.098, 11.016, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[224] = CreatePart("Normal", CFrame.new(-200.405, 11.016, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[225] = CreatePart("Normal", CFrame.new(-214.390, 14.883, 931.832, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[226] = CreatePart("Normal", CFrame.new(-214.390, 7.299, 932.436, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[227] = CreatePart("Normal", CFrame.new(-214.390, 14.925, 931.853, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[228] = CreatePart("Normal", CFrame.new(-214.619, 12.068, 932.432, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[229] = CreatePart("Normal", CFrame.new(-213.280, 10.842, 930.075, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[230] = CreatePart("Normal", CFrame.new(-215.556, 6.175, 932.436, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[231] = CreatePart("Normal", CFrame.new(-214.390, 10.842, 932.436, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[232] = CreatePart("Normal", CFrame.new(-214.390, 10.842, 932.436, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[233] = CreatePart("Normal", CFrame.new(-217.890, 10.842, 932.436, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[234] = CreatePart("Normal", CFrame.new(-213.223, 6.175, 932.436, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[235] = CreatePart("Normal", CFrame.new(-214.390, 14.342, 932.436, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[236] = CreatePart("Normal", CFrame.new(-226.093, 15.055, 931.860, 0.909, 0.000, -0.416, 0.000, 1.000, 0.000, 0.416, 0.000, 0.909), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[237] = CreatePart("Normal", CFrame.new(-227.761, 17.130, 931.998, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[238] = CreatePart("Normal", CFrame.new(-227.761, 14.754, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[239] = CreatePart("Normal", CFrame.new(-227.761, 18.024, 931.723, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[240] = CreatePart("Normal", CFrame.new(-227.781, 17.967, 931.907, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[241] = CreatePart("Normal", CFrame.new(-228.261, 14.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[242] = CreatePart("Normal", CFrame.new(-227.261, 14.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[243] = CreatePart("Normal", CFrame.new(-229.261, 16.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[244] = CreatePart("Normal", CFrame.new(-226.261, 16.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[245] = CreatePart("Normal", CFrame.new(-227.761, 16.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[246] = CreatePart("Normal", CFrame.new(-227.761, 16.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[247] = CreatePart("Normal", CFrame.new(-227.761, 17.772, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[248] = CreatePart("Normal", CFrame.new(-183.536, 7.080, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[249] = CreatePart("Normal", CFrame.new(-186.774, 13.555, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[250] = CreatePart("Normal", CFrame.new(-181.917, 13.555, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[251] = CreatePart("Normal", CFrame.new(-181.917, 13.555, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[252] = CreatePart("Normal", CFrame.new(-180.299, 7.080, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[253] = CreatePart("Normal", CFrame.new(-181.917, 18.411, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[254] = CreatePart("Normal", CFrame.new(-177.061, 13.555, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[255] = CreatePart("Normal", CFrame.new(-240.917, 18.681, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[256] = CreatePart("Normal", CFrame.new(-235.971, 13.735, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[257] = CreatePart("Normal", CFrame.new(-242.566, 7.140, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[258] = CreatePart("Normal", CFrame.new(-245.864, 13.735, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[259] = CreatePart("Normal", CFrame.new(-240.917, 13.735, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[260] = CreatePart("Normal", CFrame.new(-240.917, 13.735, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[261] = CreatePart("Normal", CFrame.new(-239.269, 7.140, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[262] = CreatePart("Normal", CFrame.new(-220.251, 11.388, 844.150, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[263] = CreatePart("Normal", CFrame.new(-205.378, 11.388, 843.979, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[264] = CreatePart("Spawn", CFrame.new(-212.560, 2.292, 858.214, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
local maxWait = 3.0
local start = os.clock()
while os.clock() - start < maxWait do
    local completed = true
    for i = 1, 264 do
        if not generatedParts[i] then completed = false break end
    end
    if completed then break end
    task.wait(0.05)
end
if generatedParts[1] then
    table.insert(resizes, {['Part'] = generatedParts[1], ['CFrame'] = (origin + offset) * CFrame.new(-211.984, 42.050, 877.080, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(39.769, 1.279, 39.957)})
    table.insert(colors, {['Part'] = generatedParts[1], ['Color'] = Color3.new(0.302, 0.290, 0.298), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[1], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[1], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[1], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[1], ['Name'] = "Part"})
end
if generatedParts[2] then
    table.insert(resizes, {['Part'] = generatedParts[2], ['CFrame'] = (origin + offset) * CFrame.new(-211.843, 64.238, 877.089, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.858, 0.564, 0.508)})
    table.insert(colors, {['Part'] = generatedParts[2], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[2], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[2], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[2], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[2], ['Name'] = "Part"})
end
if generatedParts[3] then
    table.insert(resizes, {['Part'] = generatedParts[3], ['CFrame'] = (origin + offset) * CFrame.new(-211.843, 59.782, 877.089, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.942, 0.978, 0.921)})
    table.insert(colors, {['Part'] = generatedParts[3], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[3], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[3], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[3], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[3], ['Name'] = "Part"})
end
if generatedParts[4] then
    table.insert(resizes, {['Part'] = generatedParts[4], ['CFrame'] = (origin + offset) * CFrame.new(-211.843, 67.181, 877.089, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.554, 0.301, 0.320)})
    table.insert(colors, {['Part'] = generatedParts[4], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[4], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[4], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[4], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[4], ['Name'] = "Part"})
end
if generatedParts[5] then
    table.insert(resizes, {['Part'] = generatedParts[5], ['CFrame'] = (origin + offset) * CFrame.new(-211.843, 69.353, 877.089, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.053, 0.226, 0.244)})
    table.insert(colors, {['Part'] = generatedParts[5], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[5], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[5], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[5], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[5], ['Name'] = "Part"})
end
if generatedParts[6] then
    table.insert(resizes, {['Part'] = generatedParts[6], ['CFrame'] = (origin + offset) * CFrame.new(-214.253, 10.085, 849.702, 1.000, 0.003, -0.001, -0.001, -0.005, -1.000, -0.003, 1.000, -0.005), ['Size'] = Vector3.new(0.162, 0.321, 0.749)})
    table.insert(colors, {['Part'] = generatedParts[6], ['Color'] = Color3.new(0.337, 0.259, 0.212), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[6], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[6], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[6], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[6], ['Name'] = "Phase(1)"})
end
if generatedParts[7] then
    table.insert(resizes, {['Part'] = generatedParts[7], ['CFrame'] = (origin + offset) * CFrame.new(-217.864, 7.555, 849.792, -0.003, 0.001, 1.000, 0.004, 1.000, -0.001, -1.000, 0.004, -0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[7], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[7], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[7], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[7], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[7], ['Name'] = "Part"})
end
if generatedParts[8] then
    table.insert(resizes, {['Part'] = generatedParts[8], ['CFrame'] = (origin + offset) * CFrame.new(-215.881, 7.580, 850.278, -1.000, -0.001, -0.003, -0.001, 1.000, -0.004, 0.003, -0.004, -1.000), ['Size'] = Vector3.new(6.277, 0.995, 1.090)})
    table.insert(colors, {['Part'] = generatedParts[8], ['Color'] = Color3.new(0.424, 0.345, 0.294), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[8], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[8], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[8], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[8], ['Name'] = "Part"})
end
if generatedParts[9] then
    table.insert(resizes, {['Part'] = generatedParts[9], ['CFrame'] = (origin + offset) * CFrame.new(-212.640, 14.540, 850.258, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(18.960, 0.170, 1.050)})
    table.insert(colors, {['Part'] = generatedParts[9], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[9], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[9], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[9], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[9], ['Name'] = "Part"})
end
if generatedParts[10] then
    table.insert(resizes, {['Part'] = generatedParts[10], ['CFrame'] = (origin + offset) * CFrame.new(-209.430, 7.580, 850.207, 1.000, 0.001, 0.003, -0.001, 1.000, -0.004, -0.003, 0.004, 1.000), ['Size'] = Vector3.new(6.277, 0.995, 1.090)})
    table.insert(colors, {['Part'] = generatedParts[10], ['Color'] = Color3.new(0.424, 0.345, 0.294), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[10], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[10], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[10], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[10], ['Name'] = "Part"})
end
if generatedParts[11] then
    table.insert(resizes, {['Part'] = generatedParts[11], ['CFrame'] = (origin + offset) * CFrame.new(-214.254, 10.084, 850.729, -1.000, -0.003, 0.001, -0.001, -0.005, -1.000, 0.003, -1.000, 0.005), ['Size'] = Vector3.new(0.749, 0.162, 0.749)})
    table.insert(colors, {['Part'] = generatedParts[11], ['Color'] = Color3.new(0.337, 0.259, 0.212), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[11], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[11], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[11], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[11], ['Name'] = "Phase(1)"})
end
if generatedParts[12] then
    table.insert(resizes, {['Part'] = generatedParts[12], ['CFrame'] = (origin + offset) * CFrame.new(-214.244, 10.153, 850.918, -1.000, -0.001, -0.003, -0.001, 1.000, -0.005, 0.003, -0.005, -1.000), ['Size'] = Vector3.new(0.162, 0.162, 0.162)})
    table.insert(colors, {['Part'] = generatedParts[12], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[12], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[12], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[12], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[12], ['Name'] = "Phase(1)"})
end
if generatedParts[13] then
    table.insert(resizes, {['Part'] = generatedParts[13], ['CFrame'] = (origin + offset) * CFrame.new(-214.048, 7.553, 850.699, -0.003, -0.001, 1.000, -0.004, 1.000, 0.001, -1.000, -0.004, -0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[13], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[13], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[13], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[13], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[13], ['Name'] = "Part"})
end
if generatedParts[14] then
    table.insert(resizes, {['Part'] = generatedParts[14], ['CFrame'] = (origin + offset) * CFrame.new(-211.123, 10.153, 849.620, 1.000, 0.001, 0.003, -0.001, 1.000, -0.005, -0.003, 0.005, 1.000), ['Size'] = Vector3.new(0.162, 0.162, 0.162)})
    table.insert(colors, {['Part'] = generatedParts[14], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[14], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[14], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[14], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[14], ['Name'] = "Phase(1)"})
end
if generatedParts[15] then
    table.insert(resizes, {['Part'] = generatedParts[15], ['CFrame'] = (origin + offset) * CFrame.new(-209.431, 7.580, 850.278, -1.000, -0.001, -0.003, -0.001, 1.000, -0.004, 0.003, -0.004, -1.000), ['Size'] = Vector3.new(6.277, 0.995, 1.090)})
    table.insert(colors, {['Part'] = generatedParts[15], ['Color'] = Color3.new(0.424, 0.345, 0.294), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[15], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[15], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[15], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[15], ['Name'] = "Part"})
end
if generatedParts[16] then
    table.insert(resizes, {['Part'] = generatedParts[16], ['CFrame'] = (origin + offset) * CFrame.new(-209.313, 7.552, 849.780, 0.003, 0.001, -1.000, -0.004, 1.000, 0.001, 1.000, 0.004, 0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[16], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[16], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[16], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[16], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[16], ['Name'] = "Part"})
end
if generatedParts[17] then
    table.insert(resizes, {['Part'] = generatedParts[17], ['CFrame'] = (origin + offset) * CFrame.new(-215.880, 7.580, 850.207, 1.000, 0.001, 0.003, -0.001, 1.000, -0.004, -0.003, 0.004, 1.000), ['Size'] = Vector3.new(6.277, 0.995, 1.090)})
    table.insert(colors, {['Part'] = generatedParts[17], ['Color'] = Color3.new(0.424, 0.345, 0.294), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[17], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[17], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[17], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[17], ['Name'] = "Part"})
end
if generatedParts[18] then
    table.insert(resizes, {['Part'] = generatedParts[18], ['CFrame'] = (origin + offset) * CFrame.new(-211.104, 10.153, 850.918, -1.000, -0.001, -0.003, -0.001, 1.000, -0.005, 0.003, -0.005, -1.000), ['Size'] = Vector3.new(0.162, 0.162, 0.162)})
    table.insert(colors, {['Part'] = generatedParts[18], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[18], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[18], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[18], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[18], ['Name'] = "Phase(1)"})
end
if generatedParts[19] then
    table.insert(resizes, {['Part'] = generatedParts[19], ['CFrame'] = (origin + offset) * CFrame.new(-207.446, 7.555, 850.692, 0.003, -0.001, -1.000, 0.004, 1.000, -0.001, 1.000, -0.004, 0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[19], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[19], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[19], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[19], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[19], ['Name'] = "Part"})
end
if generatedParts[20] then
    table.insert(resizes, {['Part'] = generatedParts[20], ['CFrame'] = (origin + offset) * CFrame.new(-214.254, 10.085, 850.836, -1.000, -0.003, 0.001, -0.001, -0.005, -1.000, 0.003, -1.000, 0.005), ['Size'] = Vector3.new(0.162, 0.321, 0.749)})
    table.insert(colors, {['Part'] = generatedParts[20], ['Color'] = Color3.new(0.337, 0.259, 0.212), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[20], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[20], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[20], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[20], ['Name'] = "Phase(1)"})
end
if generatedParts[21] then
    table.insert(resizes, {['Part'] = generatedParts[21], ['CFrame'] = (origin + offset) * CFrame.new(-211.290, 7.552, 850.703, 0.003, -0.001, -1.000, 0.004, 1.000, -0.001, 1.000, -0.004, 0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[21], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[21], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[21], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[21], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[21], ['Name'] = "Part"})
end
if generatedParts[22] then
    table.insert(resizes, {['Part'] = generatedParts[22], ['CFrame'] = (origin + offset) * CFrame.new(-211.113, 10.084, 849.809, 1.000, 0.003, -0.001, -0.001, -0.005, -1.000, -0.003, 1.000, -0.005), ['Size'] = Vector3.new(0.749, 0.162, 0.749)})
    table.insert(colors, {['Part'] = generatedParts[22], ['Color'] = Color3.new(0.337, 0.259, 0.212), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[22], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[22], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[22], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[22], ['Name'] = "Phase(1)"})
end
if generatedParts[23] then
    table.insert(resizes, {['Part'] = generatedParts[23], ['CFrame'] = (origin + offset) * CFrame.new(-214.263, 10.153, 849.620, 1.000, 0.001, 0.003, -0.001, 1.000, -0.005, -0.003, 0.005, 1.000), ['Size'] = Vector3.new(0.162, 0.162, 0.162)})
    table.insert(colors, {['Part'] = generatedParts[23], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[23], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[23], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[23], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[23], ['Name'] = "Phase(1)"})
end
if generatedParts[24] then
    table.insert(resizes, {['Part'] = generatedParts[24], ['CFrame'] = (origin + offset) * CFrame.new(-217.864, 7.555, 850.733, -0.003, 0.001, 1.000, 0.004, 1.000, -0.001, -1.000, 0.004, -0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[24], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[24], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[24], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[24], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[24], ['Name'] = "Part"})
end
if generatedParts[25] then
    table.insert(resizes, {['Part'] = generatedParts[25], ['CFrame'] = (origin + offset) * CFrame.new(-214.253, 10.084, 849.809, 1.000, 0.003, -0.001, -0.001, -0.005, -1.000, -0.003, 1.000, -0.005), ['Size'] = Vector3.new(0.749, 0.162, 0.749)})
    table.insert(colors, {['Part'] = generatedParts[25], ['Color'] = Color3.new(0.337, 0.259, 0.212), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[25], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[25], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[25], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[25], ['Name'] = "Phase(1)"})
end
if generatedParts[26] then
    table.insert(resizes, {['Part'] = generatedParts[26], ['CFrame'] = (origin + offset) * CFrame.new(-215.998, 7.552, 850.704, -0.003, -0.001, 1.000, -0.004, 1.000, 0.001, -1.000, -0.004, -0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[26], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[26], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[26], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[26], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[26], ['Name'] = "Part"})
end
if generatedParts[27] then
    table.insert(resizes, {['Part'] = generatedParts[27], ['CFrame'] = (origin + offset) * CFrame.new(-211.113, 10.085, 849.702, 1.000, 0.003, -0.001, -0.001, -0.005, -1.000, -0.003, 1.000, -0.005), ['Size'] = Vector3.new(0.162, 0.321, 0.749)})
    table.insert(colors, {['Part'] = generatedParts[27], ['Color'] = Color3.new(0.337, 0.259, 0.212), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[27], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[27], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[27], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[27], ['Name'] = "Phase(1)"})
end
if generatedParts[28] then
    table.insert(resizes, {['Part'] = generatedParts[28], ['CFrame'] = (origin + offset) * CFrame.new(-214.020, 7.552, 849.782, -0.003, 0.001, 1.000, 0.004, 1.000, -0.001, -1.000, 0.004, -0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[28], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[28], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[28], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[28], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[28], ['Name'] = "Part"})
end
if generatedParts[29] then
    table.insert(resizes, {['Part'] = generatedParts[29], ['CFrame'] = (origin + offset) * CFrame.new(-207.419, 7.550, 849.775, 0.003, 0.001, -1.000, -0.004, 1.000, 0.001, 1.000, 0.004, 0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[29], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[29], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[29], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[29], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[29], ['Name'] = "Part"})
end
if generatedParts[30] then
    table.insert(resizes, {['Part'] = generatedParts[30], ['CFrame'] = (origin + offset) * CFrame.new(-209.341, 7.553, 850.697, 0.003, -0.001, -1.000, 0.004, 1.000, -0.001, 1.000, -0.004, 0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[30], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[30], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[30], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[30], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[30], ['Name'] = "Part"})
end
if generatedParts[31] then
    table.insert(resizes, {['Part'] = generatedParts[31], ['CFrame'] = (origin + offset) * CFrame.new(-211.114, 10.085, 850.836, -1.000, -0.003, 0.001, -0.001, -0.005, -1.000, 0.003, -1.000, 0.005), ['Size'] = Vector3.new(0.162, 0.321, 0.749)})
    table.insert(colors, {['Part'] = generatedParts[31], ['Color'] = Color3.new(0.337, 0.259, 0.212), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[31], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[31], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[31], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[31], ['Name'] = "Phase(1)"})
end
if generatedParts[32] then
    table.insert(resizes, {['Part'] = generatedParts[32], ['CFrame'] = (origin + offset) * CFrame.new(-215.970, 7.553, 849.787, -0.003, 0.001, 1.000, 0.004, 1.000, -0.001, -1.000, 0.004, -0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[32], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[32], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[32], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[32], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[32], ['Name'] = "Part"})
end
if generatedParts[33] then
    table.insert(resizes, {['Part'] = generatedParts[33], ['CFrame'] = (origin + offset) * CFrame.new(-211.263, 7.553, 849.785, 0.003, 0.001, -1.000, -0.004, 1.000, 0.001, 1.000, 0.004, 0.003), ['Size'] = Vector3.new(0.549, 0.549, 1.098)})
    table.insert(colors, {['Part'] = generatedParts[33], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[33], ['Material'] = Enum.Material.Slate, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[33], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[33], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[33], ['Name'] = "Part"})
end
if generatedParts[34] then
    table.insert(resizes, {['Part'] = generatedParts[34], ['CFrame'] = (origin + offset) * CFrame.new(-211.114, 10.084, 850.729, -1.000, -0.003, 0.001, -0.001, -0.005, -1.000, 0.003, -1.000, 0.005), ['Size'] = Vector3.new(0.749, 0.162, 0.749)})
    table.insert(colors, {['Part'] = generatedParts[34], ['Color'] = Color3.new(0.337, 0.259, 0.212), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[34], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[34], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[34], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[34], ['Name'] = "Phase(1)"})
end
if generatedParts[35] then
    table.insert(resizes, {['Part'] = generatedParts[35], ['CFrame'] = (origin + offset) * CFrame.new(-236.690, 3.921, 899.084, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[35], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[35], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[35], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[35], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[35], ['Name'] = "Carpet"})
end
if generatedParts[36] then
    table.insert(resizes, {['Part'] = generatedParts[36], ['CFrame'] = (origin + offset) * CFrame.new(-236.690, 3.921, 873.123, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[36], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[36], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[36], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[36], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[36], ['Name'] = "Carpet"})
end
if generatedParts[37] then
    table.insert(resizes, {['Part'] = generatedParts[37], ['CFrame'] = (origin + offset) * CFrame.new(-236.690, 3.921, 882.004, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[37], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[37], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[37], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[37], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[37], ['Name'] = "Carpet"})
end
if generatedParts[38] then
    table.insert(resizes, {['Part'] = generatedParts[38], ['CFrame'] = (origin + offset) * CFrame.new(-236.690, 3.921, 855.952, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[38], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[38], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[38], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[38], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[38], ['Name'] = "Carpet"})
end
if generatedParts[39] then
    table.insert(resizes, {['Part'] = generatedParts[39], ['CFrame'] = (origin + offset) * CFrame.new(-236.690, 3.921, 890.534, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[39], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[39], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[39], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[39], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[39], ['Name'] = "Carpet"})
end
if generatedParts[40] then
    table.insert(resizes, {['Part'] = generatedParts[40], ['CFrame'] = (origin + offset) * CFrame.new(-236.690, 3.921, 864.593, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[40], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[40], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[40], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[40], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[40], ['Name'] = "Carpet"})
end
if generatedParts[41] then
    table.insert(resizes, {['Part'] = generatedParts[41], ['CFrame'] = (origin + offset) * CFrame.new(-236.690, 3.921, 916.125, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[41], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[41], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[41], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[41], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[41], ['Name'] = "Carpet"})
end
if generatedParts[42] then
    table.insert(resizes, {['Part'] = generatedParts[42], ['CFrame'] = (origin + offset) * CFrame.new(-236.690, 3.921, 907.614, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[42], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[42], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[42], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[42], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[42], ['Name'] = "Carpet"})
end
if generatedParts[43] then
    table.insert(resizes, {['Part'] = generatedParts[43], ['CFrame'] = (origin + offset) * CFrame.new(-236.690, 3.921, 924.655, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[43], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[43], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[43], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[43], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[43], ['Name'] = "Carpet"})
end
if generatedParts[44] then
    table.insert(resizes, {['Part'] = generatedParts[44], ['CFrame'] = (origin + offset) * CFrame.new(-244.210, 3.921, 899.084, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[44], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[44], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[44], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[44], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[44], ['Name'] = "Carpet"})
end
if generatedParts[45] then
    table.insert(resizes, {['Part'] = generatedParts[45], ['CFrame'] = (origin + offset) * CFrame.new(-244.210, 3.921, 864.593, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[45], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[45], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[45], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[45], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[45], ['Name'] = "Carpet"})
end
if generatedParts[46] then
    table.insert(resizes, {['Part'] = generatedParts[46], ['CFrame'] = (origin + offset) * CFrame.new(-244.210, 3.921, 855.952, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[46], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[46], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[46], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[46], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[46], ['Name'] = "Carpet"})
end
if generatedParts[47] then
    table.insert(resizes, {['Part'] = generatedParts[47], ['CFrame'] = (origin + offset) * CFrame.new(-244.210, 3.921, 890.534, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[47], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[47], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[47], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[47], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[47], ['Name'] = "Carpet"})
end
if generatedParts[48] then
    table.insert(resizes, {['Part'] = generatedParts[48], ['CFrame'] = (origin + offset) * CFrame.new(-244.210, 3.921, 882.003, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[48], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[48], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[48], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[48], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[48], ['Name'] = "Carpet"})
end
if generatedParts[49] then
    table.insert(resizes, {['Part'] = generatedParts[49], ['CFrame'] = (origin + offset) * CFrame.new(-244.210, 3.921, 873.123, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[49], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[49], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[49], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[49], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[49], ['Name'] = "Carpet"})
end
if generatedParts[50] then
    table.insert(resizes, {['Part'] = generatedParts[50], ['CFrame'] = (origin + offset) * CFrame.new(-244.210, 3.921, 907.614, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[50], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[50], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[50], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[50], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[50], ['Name'] = "Carpet"})
end
if generatedParts[51] then
    table.insert(resizes, {['Part'] = generatedParts[51], ['CFrame'] = (origin + offset) * CFrame.new(-244.210, 3.921, 924.655, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[51], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[51], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[51], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[51], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[51], ['Name'] = "Carpet"})
end
if generatedParts[52] then
    table.insert(resizes, {['Part'] = generatedParts[52], ['CFrame'] = (origin + offset) * CFrame.new(-244.210, 3.921, 916.125, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[52], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[52], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[52], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[52], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[52], ['Name'] = "Carpet"})
end
if generatedParts[53] then
    table.insert(resizes, {['Part'] = generatedParts[53], ['CFrame'] = (origin + offset) * CFrame.new(-214.899, 3.921, 899.084, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[53], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[53], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[53], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[53], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[53], ['Name'] = "Carpet"})
end
if generatedParts[54] then
    table.insert(resizes, {['Part'] = generatedParts[54], ['CFrame'] = (origin + offset) * CFrame.new(-229.639, 3.921, 899.084, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[54], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[54], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[54], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[54], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[54], ['Name'] = "Carpet"})
end
if generatedParts[55] then
    table.insert(resizes, {['Part'] = generatedParts[55], ['CFrame'] = (origin + offset) * CFrame.new(-222.119, 3.921, 899.084, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[55], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[55], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[55], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[55], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[55], ['Name'] = "Carpet"})
end
if generatedParts[56] then
    table.insert(resizes, {['Part'] = generatedParts[56], ['CFrame'] = (origin + offset) * CFrame.new(-214.899, 3.921, 882.003, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[56], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[56], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[56], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[56], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[56], ['Name'] = "Carpet"})
end
if generatedParts[57] then
    table.insert(resizes, {['Part'] = generatedParts[57], ['CFrame'] = (origin + offset) * CFrame.new(-222.119, 3.921, 882.003, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[57], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[57], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[57], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[57], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[57], ['Name'] = "Carpet"})
end
if generatedParts[58] then
    table.insert(resizes, {['Part'] = generatedParts[58], ['CFrame'] = (origin + offset) * CFrame.new(-222.119, 3.921, 873.123, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[58], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[58], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[58], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[58], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[58], ['Name'] = "Carpet"})
end
if generatedParts[59] then
    table.insert(resizes, {['Part'] = generatedParts[59], ['CFrame'] = (origin + offset) * CFrame.new(-214.899, 3.921, 890.534, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[59], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[59], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[59], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[59], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[59], ['Name'] = "Carpet"})
end
if generatedParts[60] then
    table.insert(resizes, {['Part'] = generatedParts[60], ['CFrame'] = (origin + offset) * CFrame.new(-229.639, 3.921, 864.593, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[60], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[60], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[60], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[60], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[60], ['Name'] = "Carpet"})
end
if generatedParts[61] then
    table.insert(resizes, {['Part'] = generatedParts[61], ['CFrame'] = (origin + offset) * CFrame.new(-222.119, 3.921, 890.534, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[61], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[61], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[61], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[61], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[61], ['Name'] = "Carpet"})
end
if generatedParts[62] then
    table.insert(resizes, {['Part'] = generatedParts[62], ['CFrame'] = (origin + offset) * CFrame.new(-222.119, 3.921, 864.593, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[62], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[62], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[62], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[62], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[62], ['Name'] = "Carpet"})
end
if generatedParts[63] then
    table.insert(resizes, {['Part'] = generatedParts[63], ['CFrame'] = (origin + offset) * CFrame.new(-214.899, 3.921, 855.952, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[63], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[63], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[63], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[63], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[63], ['Name'] = "Carpet"})
end
if generatedParts[64] then
    table.insert(resizes, {['Part'] = generatedParts[64], ['CFrame'] = (origin + offset) * CFrame.new(-214.899, 3.921, 864.593, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[64], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[64], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[64], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[64], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[64], ['Name'] = "Carpet"})
end
if generatedParts[65] then
    table.insert(resizes, {['Part'] = generatedParts[65], ['CFrame'] = (origin + offset) * CFrame.new(-229.639, 3.921, 873.123, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[65], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[65], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[65], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[65], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[65], ['Name'] = "Carpet"})
end
if generatedParts[66] then
    table.insert(resizes, {['Part'] = generatedParts[66], ['CFrame'] = (origin + offset) * CFrame.new(-229.639, 3.921, 855.952, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[66], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[66], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[66], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[66], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[66], ['Name'] = "Carpet"})
end
if generatedParts[67] then
    table.insert(resizes, {['Part'] = generatedParts[67], ['CFrame'] = (origin + offset) * CFrame.new(-229.639, 3.921, 890.534, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[67], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[67], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[67], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[67], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[67], ['Name'] = "Carpet"})
end
if generatedParts[68] then
    table.insert(resizes, {['Part'] = generatedParts[68], ['CFrame'] = (origin + offset) * CFrame.new(-229.639, 3.921, 882.003, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[68], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[68], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[68], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[68], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[68], ['Name'] = "Carpet"})
end
if generatedParts[69] then
    table.insert(resizes, {['Part'] = generatedParts[69], ['CFrame'] = (origin + offset) * CFrame.new(-222.119, 3.921, 855.952, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[69], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[69], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[69], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[69], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[69], ['Name'] = "Carpet"})
end
if generatedParts[70] then
    table.insert(resizes, {['Part'] = generatedParts[70], ['CFrame'] = (origin + offset) * CFrame.new(-214.899, 3.921, 873.123, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[70], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[70], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[70], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[70], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[70], ['Name'] = "Carpet"})
end
if generatedParts[71] then
    table.insert(resizes, {['Part'] = generatedParts[71], ['CFrame'] = (origin + offset) * CFrame.new(-214.899, 3.921, 907.614, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[71], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[71], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[71], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[71], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[71], ['Name'] = "Carpet"})
end
if generatedParts[72] then
    table.insert(resizes, {['Part'] = generatedParts[72], ['CFrame'] = (origin + offset) * CFrame.new(-229.639, 3.921, 907.614, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[72], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[72], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[72], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[72], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[72], ['Name'] = "Carpet"})
end
if generatedParts[73] then
    table.insert(resizes, {['Part'] = generatedParts[73], ['CFrame'] = (origin + offset) * CFrame.new(-222.119, 3.921, 907.614, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[73], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[73], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[73], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[73], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[73], ['Name'] = "Carpet"})
end
if generatedParts[74] then
    table.insert(resizes, {['Part'] = generatedParts[74], ['CFrame'] = (origin + offset) * CFrame.new(-207.966, 3.921, 898.659, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[74], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[74], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[74], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[74], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[74], ['Name'] = "Carpet"})
end
if generatedParts[75] then
    table.insert(resizes, {['Part'] = generatedParts[75], ['CFrame'] = (origin + offset) * CFrame.new(-200.446, 3.921, 898.659, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[75], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[75], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[75], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[75], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[75], ['Name'] = "Carpet"})
end
if generatedParts[76] then
    table.insert(resizes, {['Part'] = generatedParts[76], ['CFrame'] = (origin + offset) * CFrame.new(-193.226, 3.921, 898.659, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[76], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[76], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[76], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[76], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[76], ['Name'] = "Carpet"})
end
if generatedParts[77] then
    table.insert(resizes, {['Part'] = generatedParts[77], ['CFrame'] = (origin + offset) * CFrame.new(-193.226, 3.921, 890.109, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[77], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[77], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[77], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[77], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[77], ['Name'] = "Carpet"})
end
if generatedParts[78] then
    table.insert(resizes, {['Part'] = generatedParts[78], ['CFrame'] = (origin + offset) * CFrame.new(-193.226, 3.921, 864.168, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[78], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[78], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[78], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[78], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[78], ['Name'] = "Carpet"})
end
if generatedParts[79] then
    table.insert(resizes, {['Part'] = generatedParts[79], ['CFrame'] = (origin + offset) * CFrame.new(-193.226, 3.921, 872.698, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[79], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[79], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[79], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[79], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[79], ['Name'] = "Carpet"})
end
if generatedParts[80] then
    table.insert(resizes, {['Part'] = generatedParts[80], ['CFrame'] = (origin + offset) * CFrame.new(-193.226, 3.921, 881.579, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[80], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[80], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[80], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[80], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[80], ['Name'] = "Carpet"})
end
if generatedParts[81] then
    table.insert(resizes, {['Part'] = generatedParts[81], ['CFrame'] = (origin + offset) * CFrame.new(-193.226, 3.921, 855.528, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[81], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[81], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[81], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[81], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[81], ['Name'] = "Carpet"})
end
if generatedParts[82] then
    table.insert(resizes, {['Part'] = generatedParts[82], ['CFrame'] = (origin + offset) * CFrame.new(-200.446, 3.921, 881.579, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[82], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[82], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[82], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[82], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[82], ['Name'] = "Carpet"})
end
if generatedParts[83] then
    table.insert(resizes, {['Part'] = generatedParts[83], ['CFrame'] = (origin + offset) * CFrame.new(-200.446, 3.921, 872.698, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[83], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[83], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[83], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[83], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[83], ['Name'] = "Carpet"})
end
if generatedParts[84] then
    table.insert(resizes, {['Part'] = generatedParts[84], ['CFrame'] = (origin + offset) * CFrame.new(-207.966, 3.921, 855.528, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[84], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[84], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[84], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[84], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[84], ['Name'] = "Carpet"})
end
if generatedParts[85] then
    table.insert(resizes, {['Part'] = generatedParts[85], ['CFrame'] = (origin + offset) * CFrame.new(-200.446, 3.921, 864.168, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[85], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[85], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[85], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[85], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[85], ['Name'] = "Carpet"})
end
if generatedParts[86] then
    table.insert(resizes, {['Part'] = generatedParts[86], ['CFrame'] = (origin + offset) * CFrame.new(-200.446, 3.921, 855.528, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[86], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[86], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[86], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[86], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[86], ['Name'] = "Carpet"})
end
if generatedParts[87] then
    table.insert(resizes, {['Part'] = generatedParts[87], ['CFrame'] = (origin + offset) * CFrame.new(-207.966, 3.921, 864.168, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[87], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[87], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[87], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[87], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[87], ['Name'] = "Carpet"})
end
if generatedParts[88] then
    table.insert(resizes, {['Part'] = generatedParts[88], ['CFrame'] = (origin + offset) * CFrame.new(-200.446, 3.921, 890.109, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[88], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[88], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[88], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[88], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[88], ['Name'] = "Carpet"})
end
if generatedParts[89] then
    table.insert(resizes, {['Part'] = generatedParts[89], ['CFrame'] = (origin + offset) * CFrame.new(-207.966, 3.921, 872.698, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[89], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[89], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[89], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[89], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[89], ['Name'] = "Carpet"})
end
if generatedParts[90] then
    table.insert(resizes, {['Part'] = generatedParts[90], ['CFrame'] = (origin + offset) * CFrame.new(-207.966, 3.921, 890.109, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[90], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[90], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[90], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[90], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[90], ['Name'] = "Carpet"})
end
if generatedParts[91] then
    table.insert(resizes, {['Part'] = generatedParts[91], ['CFrame'] = (origin + offset) * CFrame.new(-207.966, 3.921, 881.579, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[91], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[91], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[91], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[91], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[91], ['Name'] = "Carpet"})
end
if generatedParts[92] then
    table.insert(resizes, {['Part'] = generatedParts[92], ['CFrame'] = (origin + offset) * CFrame.new(-193.226, 3.921, 907.190, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[92], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[92], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[92], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[92], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[92], ['Name'] = "Carpet"})
end
if generatedParts[93] then
    table.insert(resizes, {['Part'] = generatedParts[93], ['CFrame'] = (origin + offset) * CFrame.new(-200.446, 3.921, 907.190, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[93], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[93], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[93], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[93], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[93], ['Name'] = "Carpet"})
end
if generatedParts[94] then
    table.insert(resizes, {['Part'] = generatedParts[94], ['CFrame'] = (origin + offset) * CFrame.new(-207.966, 3.921, 907.190, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[94], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[94], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[94], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[94], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[94], ['Name'] = "Carpet"})
end
if generatedParts[95] then
    table.insert(resizes, {['Part'] = generatedParts[95], ['CFrame'] = (origin + offset) * CFrame.new(-186.244, 3.921, 898.847, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[95], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[95], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[95], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[95], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[95], ['Name'] = "Carpet"})
end
if generatedParts[96] then
    table.insert(resizes, {['Part'] = generatedParts[96], ['CFrame'] = (origin + offset) * CFrame.new(-186.244, 3.921, 890.297, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[96], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[96], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[96], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[96], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[96], ['Name'] = "Carpet"})
end
if generatedParts[97] then
    table.insert(resizes, {['Part'] = generatedParts[97], ['CFrame'] = (origin + offset) * CFrame.new(-186.244, 3.921, 864.355, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[97], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[97], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[97], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[97], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[97], ['Name'] = "Carpet"})
end
if generatedParts[98] then
    table.insert(resizes, {['Part'] = generatedParts[98], ['CFrame'] = (origin + offset) * CFrame.new(-186.244, 3.921, 872.886, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[98], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[98], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[98], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[98], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[98], ['Name'] = "Carpet"})
end
if generatedParts[99] then
    table.insert(resizes, {['Part'] = generatedParts[99], ['CFrame'] = (origin + offset) * CFrame.new(-186.244, 3.921, 881.766, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[99], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[99], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[99], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[99], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[99], ['Name'] = "Carpet"})
end
if generatedParts[100] then
    table.insert(resizes, {['Part'] = generatedParts[100], ['CFrame'] = (origin + offset) * CFrame.new(-186.244, 3.921, 855.715, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[100], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[100], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[100], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[100], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[100], ['Name'] = "Carpet"})
end
if generatedParts[101] then
    table.insert(resizes, {['Part'] = generatedParts[101], ['CFrame'] = (origin + offset) * CFrame.new(-186.244, 3.921, 915.888, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[101], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[101], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[101], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[101], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[101], ['Name'] = "Carpet"})
end
if generatedParts[102] then
    table.insert(resizes, {['Part'] = generatedParts[102], ['CFrame'] = (origin + offset) * CFrame.new(-186.244, 3.921, 907.377, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[102], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[102], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[102], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[102], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[102], ['Name'] = "Carpet"})
end
if generatedParts[103] then
    table.insert(resizes, {['Part'] = generatedParts[103], ['CFrame'] = (origin + offset) * CFrame.new(-186.244, 3.921, 924.418, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[103], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[103], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[103], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[103], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[103], ['Name'] = "Carpet"})
end
if generatedParts[104] then
    table.insert(resizes, {['Part'] = generatedParts[104], ['CFrame'] = (origin + offset) * CFrame.new(-178.723, 3.921, 898.847, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[104], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[104], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[104], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[104], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[104], ['Name'] = "Carpet"})
end
if generatedParts[105] then
    table.insert(resizes, {['Part'] = generatedParts[105], ['CFrame'] = (origin + offset) * CFrame.new(-178.723, 3.921, 890.297, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[105], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[105], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[105], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[105], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[105], ['Name'] = "Carpet"})
end
if generatedParts[106] then
    table.insert(resizes, {['Part'] = generatedParts[106], ['CFrame'] = (origin + offset) * CFrame.new(-178.723, 3.921, 855.715, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[106], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[106], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[106], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[106], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[106], ['Name'] = "Carpet"})
end
if generatedParts[107] then
    table.insert(resizes, {['Part'] = generatedParts[107], ['CFrame'] = (origin + offset) * CFrame.new(-178.723, 3.921, 864.355, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[107], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[107], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[107], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[107], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[107], ['Name'] = "Carpet"})
end
if generatedParts[108] then
    table.insert(resizes, {['Part'] = generatedParts[108], ['CFrame'] = (origin + offset) * CFrame.new(-178.723, 3.921, 872.886, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[108], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[108], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[108], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[108], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[108], ['Name'] = "Carpet"})
end
if generatedParts[109] then
    table.insert(resizes, {['Part'] = generatedParts[109], ['CFrame'] = (origin + offset) * CFrame.new(-178.723, 3.921, 881.766, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[109], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[109], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[109], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[109], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[109], ['Name'] = "Carpet"})
end
if generatedParts[110] then
    table.insert(resizes, {['Part'] = generatedParts[110], ['CFrame'] = (origin + offset) * CFrame.new(-178.723, 3.921, 907.377, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[110], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[110], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[110], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[110], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[110], ['Name'] = "Carpet"})
end
if generatedParts[111] then
    table.insert(resizes, {['Part'] = generatedParts[111], ['CFrame'] = (origin + offset) * CFrame.new(-178.723, 3.921, 915.888, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[111], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[111], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[111], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[111], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[111], ['Name'] = "Carpet"})
end
if generatedParts[112] then
    table.insert(resizes, {['Part'] = generatedParts[112], ['CFrame'] = (origin + offset) * CFrame.new(-178.723, 3.921, 924.418, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.157, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[112], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[112], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[112], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[112], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[112], ['Name'] = "Carpet"})
end
if generatedParts[113] then
    table.insert(resizes, {['Part'] = generatedParts[113], ['CFrame'] = (origin + offset) * CFrame.new(-218.608, 46.013, 877.692, 0.260, -0.966, 0.000, 0.966, 0.260, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(29.261, 0.280, 0.305)})
    table.insert(colors, {['Part'] = generatedParts[113], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[113], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[113], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[113], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[113], ['Name'] = "Part"})
end
if generatedParts[114] then
    table.insert(resizes, {['Part'] = generatedParts[114], ['CFrame'] = (origin + offset) * CFrame.new(-205.862, 46.192, 877.692, -0.260, 0.966, 0.000, 0.966, 0.260, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(29.631, 0.280, 0.305)})
    table.insert(colors, {['Part'] = generatedParts[114], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[114], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[114], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[114], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[114], ['Name'] = "Part"})
end
if generatedParts[115] then
    table.insert(resizes, {['Part'] = generatedParts[115], ['CFrame'] = (origin + offset) * CFrame.new(-212.213, 46.013, 883.556, -0.000, 0.000, 1.000, 0.966, 0.260, 0.000, -0.260, 0.966, -0.000), ['Size'] = Vector3.new(29.261, 0.280, 0.305)})
    table.insert(colors, {['Part'] = generatedParts[115], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[115], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[115], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[115], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[115], ['Name'] = "Part"})
end
if generatedParts[116] then
    table.insert(resizes, {['Part'] = generatedParts[116], ['CFrame'] = (origin + offset) * CFrame.new(-212.213, 46.192, 870.810, -0.000, 0.000, -1.000, 0.966, 0.260, -0.000, 0.260, -0.966, -0.000), ['Size'] = Vector3.new(29.631, 0.280, 0.305)})
    table.insert(colors, {['Part'] = generatedParts[116], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[116], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[116], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[116], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[116], ['Name'] = "Part"})
end
if generatedParts[117] then
    table.insert(resizes, {['Part'] = generatedParts[117], ['CFrame'] = (origin + offset) * CFrame.new(-227.790, 41.043, 932.266, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.133, 0.050, 0.050)})
    table.insert(colors, {['Part'] = generatedParts[117], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[117], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[117], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[117], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[117], ['Name'] = "Part"})
end
if generatedParts[118] then
    table.insert(resizes, {['Part'] = generatedParts[118], ['CFrame'] = (origin + offset) * CFrame.new(-227.790, 40.769, 932.266, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.448, 0.050, 0.050)})
    table.insert(colors, {['Part'] = generatedParts[118], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[118], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[118], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[118], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[118], ['Name'] = "Part"})
end
if generatedParts[119] then
    table.insert(resizes, {['Part'] = generatedParts[119], ['CFrame'] = (origin + offset) * CFrame.new(-227.790, 39.836, 932.266, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.749, 0.123, 0.116)})
    table.insert(colors, {['Part'] = generatedParts[119], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[119], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[119], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[119], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[119], ['Name'] = "Part"})
end
if generatedParts[120] then
    table.insert(resizes, {['Part'] = generatedParts[120], ['CFrame'] = (origin + offset) * CFrame.new(-227.790, 40.398, 932.266, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.360, 0.071, 0.064)})
    table.insert(colors, {['Part'] = generatedParts[120], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[120], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[120], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[120], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[120], ['Name'] = "Part"})
end
if generatedParts[121] then
    table.insert(resizes, {['Part'] = generatedParts[121], ['CFrame'] = (origin + offset) * CFrame.new(-229.886, 13.928, 932.320, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.250, 4.510, 5.010)})
    table.insert(colors, {['Part'] = generatedParts[121], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[121], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[121], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[121], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[121], ['Name'] = "Part"})
end
if generatedParts[122] then
    table.insert(resizes, {['Part'] = generatedParts[122], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 4.942, 921.690, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 1.440, 1.470)})
    table.insert(colors, {['Part'] = generatedParts[122], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[122], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[122], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[122], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[122], ['Name'] = "Part"})
end
if generatedParts[123] then
    table.insert(resizes, {['Part'] = generatedParts[123], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 7.957, 925.065, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 0.910, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[123], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[123], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[123], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[123], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[123], ['Name'] = "Part"})
end
if generatedParts[124] then
    table.insert(resizes, {['Part'] = generatedParts[124], ['CFrame'] = (origin + offset) * CFrame.new(-225.636, 21.968, 932.320, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.250, 4.510, 5.010)})
    table.insert(colors, {['Part'] = generatedParts[124], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[124], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[124], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[124], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[124], ['Name'] = "Part"})
end
if generatedParts[125] then
    table.insert(resizes, {['Part'] = generatedParts[125], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 5.767, 922.525, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 0.910, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[125], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[125], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[125], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[125], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[125], ['Name'] = "Part"})
end
if generatedParts[126] then
    table.insert(resizes, {['Part'] = generatedParts[126], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 6.032, 923.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 1.440, 1.470)})
    table.insert(colors, {['Part'] = generatedParts[126], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[126], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[126], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[126], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[126], ['Name'] = "Part"})
end
if generatedParts[127] then
    table.insert(resizes, {['Part'] = generatedParts[127], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 9.007, 926.335, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 0.910, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[127], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[127], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[127], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[127], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[127], ['Name'] = "Part"})
end
if generatedParts[128] then
    table.insert(resizes, {['Part'] = generatedParts[128], ['CFrame'] = (origin + offset) * CFrame.new(-229.886, 14.018, 934.981, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.530, 20.350, 0.570)})
    table.insert(colors, {['Part'] = generatedParts[128], ['Color'] = Color3.new(0.627, 0.518, 0.310), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[128], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[128], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[128], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[128], ['Name'] = "Part"})
end
if generatedParts[129] then
    table.insert(resizes, {['Part'] = generatedParts[129], ['CFrame'] = (origin + offset) * CFrame.new(-229.886, 16.345, 933.564, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.250, 9.345, 2.523)})
    table.insert(colors, {['Part'] = generatedParts[129], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[129], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[129], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[129], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[129], ['Name'] = "Part"})
end
if generatedParts[130] then
    table.insert(resizes, {['Part'] = generatedParts[130], ['CFrame'] = (origin + offset) * CFrame.new(-225.636, 5.982, 920.290, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.530, 4.280, 0.570)})
    table.insert(colors, {['Part'] = generatedParts[130], ['Color'] = Color3.new(0.627, 0.518, 0.310), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[130], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[130], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[130], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[130], ['Name'] = "Part"})
end
if generatedParts[131] then
    table.insert(resizes, {['Part'] = generatedParts[131], ['CFrame'] = (origin + offset) * CFrame.new(-229.886, 10.037, 929.520, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.530, 12.390, 0.570)})
    table.insert(colors, {['Part'] = generatedParts[131], ['Color'] = Color3.new(0.627, 0.518, 0.310), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[131], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[131], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[131], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[131], ['Name'] = "Part"})
end
if generatedParts[132] then
    table.insert(resizes, {['Part'] = generatedParts[132], ['CFrame'] = (origin + offset) * CFrame.new(-225.636, 14.018, 934.981, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.530, 20.350, 0.570)})
    table.insert(colors, {['Part'] = generatedParts[132], ['Color'] = Color3.new(0.627, 0.518, 0.310), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[132], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[132], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[132], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[132], ['Name'] = "Part"})
end
if generatedParts[133] then
    table.insert(resizes, {['Part'] = generatedParts[133], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 10.362, 928.120, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 1.440, 1.470)})
    table.insert(colors, {['Part'] = generatedParts[133], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[133], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[133], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[133], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[133], ['Name'] = "Part"})
end
if generatedParts[134] then
    table.insert(resizes, {['Part'] = generatedParts[134], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 12.287, 930.185, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 0.910, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[134], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[134], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[134], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[134], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[134], ['Name'] = "Part"})
end
if generatedParts[135] then
    table.insert(resizes, {['Part'] = generatedParts[135], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 8.127, 929.410, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 8.110, 1.470)})
    table.insert(colors, {['Part'] = generatedParts[135], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[135], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[135], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[135], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[135], ['Name'] = "Part"})
end
if generatedParts[136] then
    table.insert(resizes, {['Part'] = generatedParts[136], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 6.867, 923.755, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 0.910, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[136], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[136], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[136], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[136], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[136], ['Name'] = "Part"})
end
if generatedParts[137] then
    table.insert(resizes, {['Part'] = generatedParts[137], ['CFrame'] = (origin + offset) * CFrame.new(-225.636, 16.345, 933.564, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.250, 9.345, 2.523)})
    table.insert(colors, {['Part'] = generatedParts[137], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[137], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[137], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[137], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[137], ['Name'] = "Part"})
end
if generatedParts[138] then
    table.insert(resizes, {['Part'] = generatedParts[138], ['CFrame'] = (origin + offset) * CFrame.new(-227.816, 12.552, 932.305, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.210, 1.440, 4.760)})
    table.insert(colors, {['Part'] = generatedParts[138], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[138], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[138], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[138], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[138], ['Name'] = "Part"})
end
if generatedParts[139] then
    table.insert(resizes, {['Part'] = generatedParts[139], ['CFrame'] = (origin + offset) * CFrame.new(-227.791, 19.703, 934.706, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.440, 9.040, 0.240)})
    table.insert(colors, {['Part'] = generatedParts[139], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[139], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[139], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[139], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[139], ['Name'] = "Part"})
end
if generatedParts[140] then
    table.insert(resizes, {['Part'] = generatedParts[140], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 11.197, 928.875, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 0.910, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[140], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[140], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[140], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[140], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[140], ['Name'] = "Part"})
end
if generatedParts[141] then
    table.insert(resizes, {['Part'] = generatedParts[141], ['CFrame'] = (origin + offset) * CFrame.new(-227.761, 23.992, 932.250, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.490, 1.419, 4.112)})
    table.insert(colors, {['Part'] = generatedParts[141], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[141], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[141], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[141], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[141], ['Name'] = "Part"})
end
if generatedParts[142] then
    table.insert(resizes, {['Part'] = generatedParts[142], ['CFrame'] = (origin + offset) * CFrame.new(-227.791, 10.097, 934.706, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.440, 12.170, 0.240)})
    table.insert(colors, {['Part'] = generatedParts[142], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[142], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[142], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[142], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[142], ['Name'] = "Part"})
end
if generatedParts[143] then
    table.insert(resizes, {['Part'] = generatedParts[143], ['CFrame'] = (origin + offset) * CFrame.new(-225.636, 13.928, 932.320, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.250, 4.510, 5.010)})
    table.insert(colors, {['Part'] = generatedParts[143], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[143], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[143], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[143], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[143], ['Name'] = "Part"})
end
if generatedParts[144] then
    table.insert(resizes, {['Part'] = generatedParts[144], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 9.272, 926.810, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 1.440, 1.470)})
    table.insert(colors, {['Part'] = generatedParts[144], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[144], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[144], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[144], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[144], ['Name'] = "Part"})
end
if generatedParts[145] then
    table.insert(resizes, {['Part'] = generatedParts[145], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 8.222, 925.540, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 1.440, 1.470)})
    table.insert(colors, {['Part'] = generatedParts[145], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[145], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[145], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[145], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[145], ['Name'] = "Part"})
end
if generatedParts[146] then
    table.insert(resizes, {['Part'] = generatedParts[146], ['CFrame'] = (origin + offset) * CFrame.new(-227.781, 21.968, 929.935, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.460, 4.510, 0.240)})
    table.insert(colors, {['Part'] = generatedParts[146], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[146], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[146], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[146], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[146], ['Name'] = "Part"})
end
if generatedParts[147] then
    table.insert(resizes, {['Part'] = generatedParts[147], ['CFrame'] = (origin + offset) * CFrame.new(-229.886, 21.968, 932.320, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.250, 4.510, 5.010)})
    table.insert(colors, {['Part'] = generatedParts[147], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[147], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[147], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[147], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[147], ['Name'] = "Part"})
end
if generatedParts[148] then
    table.insert(resizes, {['Part'] = generatedParts[148], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 4.677, 921.215, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 0.910, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[148], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[148], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[148], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[148], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[148], ['Name'] = "Part"})
end
if generatedParts[149] then
    table.insert(resizes, {['Part'] = generatedParts[149], ['CFrame'] = (origin + offset) * CFrame.new(-225.636, 10.037, 929.520, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.530, 12.390, 0.570)})
    table.insert(colors, {['Part'] = generatedParts[149], ['Color'] = Color3.new(0.627, 0.518, 0.310), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[149], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[149], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[149], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[149], ['Name'] = "Part"})
end
if generatedParts[150] then
    table.insert(resizes, {['Part'] = generatedParts[150], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 8.127, 929.410, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 8.110, 1.470)})
    table.insert(colors, {['Part'] = generatedParts[150], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[150], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[150], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[150], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[150], ['Name'] = "Part"})
end
if generatedParts[151] then
    table.insert(resizes, {['Part'] = generatedParts[151], ['CFrame'] = (origin + offset) * CFrame.new(-227.781, 23.143, 932.310, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.460, 2.160, 4.990)})
    table.insert(colors, {['Part'] = generatedParts[151], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[151], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[151], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[151], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[151], ['Name'] = "Part"})
end
if generatedParts[152] then
    table.insert(resizes, {['Part'] = generatedParts[152], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 7.132, 924.230, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 1.440, 1.470)})
    table.insert(colors, {['Part'] = generatedParts[152], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[152], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[152], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[152], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[152], ['Name'] = "Part"})
end
if generatedParts[153] then
    table.insert(resizes, {['Part'] = generatedParts[153], ['CFrame'] = (origin + offset) * CFrame.new(-227.717, 10.097, 927.645, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.010, 0.910, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[153], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[153], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[153], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[153], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[153], ['Name'] = "Part"})
end
if generatedParts[154] then
    table.insert(resizes, {['Part'] = generatedParts[154], ['CFrame'] = (origin + offset) * CFrame.new(-229.886, 5.982, 920.290, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.530, 4.280, 0.570)})
    table.insert(colors, {['Part'] = generatedParts[154], ['Color'] = Color3.new(0.627, 0.518, 0.310), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[154], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[154], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[154], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[154], ['Name'] = "Part"})
end
if generatedParts[155] then
    table.insert(resizes, {['Part'] = generatedParts[155], ['CFrame'] = (origin + offset) * CFrame.new(-197.648, 8.869, 929.107, -1.000, 0.000, 0.000, 0.000, 0.956, 0.295, 0.000, 0.295, -0.956), ['Size'] = Vector3.new(4.900, 0.050, 2.600)})
    table.insert(colors, {['Part'] = generatedParts[155], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[155], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[155], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[155], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[155], ['Name'] = "Part"})
end
if generatedParts[156] then
    table.insert(resizes, {['Part'] = generatedParts[156], ['CFrame'] = (origin + offset) * CFrame.new(-197.648, 7.517, 927.734, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.900, 4.230, 0.370)})
    table.insert(colors, {['Part'] = generatedParts[156], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[156], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[156], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[156], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[156], ['Name'] = "Part"})
end
if generatedParts[157] then
    table.insert(resizes, {['Part'] = generatedParts[157], ['CFrame'] = (origin + offset) * CFrame.new(-197.668, 4.917, 932.559, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.380, 1.810, 2.860)})
    table.insert(colors, {['Part'] = generatedParts[157], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[157], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[157], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[157], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[157], ['Name'] = "Part"})
end
if generatedParts[158] then
    table.insert(resizes, {['Part'] = generatedParts[158], ['CFrame'] = (origin + offset) * CFrame.new(-197.668, 4.412, 932.559, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(8.700, 0.800, 2.860)})
    table.insert(colors, {['Part'] = generatedParts[158], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[158], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[158], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[158], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[158], ['Name'] = "Part"})
end
if generatedParts[159] then
    table.insert(resizes, {['Part'] = generatedParts[159], ['CFrame'] = (origin + offset) * CFrame.new(-197.648, 6.447, 934.034, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.900, 4.970, 0.210)})
    table.insert(colors, {['Part'] = generatedParts[159], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[159], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[159], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[159], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[159], ['Name'] = "Part"})
end
if generatedParts[160] then
    table.insert(resizes, {['Part'] = generatedParts[160], ['CFrame'] = (origin + offset) * CFrame.new(-197.668, 4.622, 932.559, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(7.600, 1.220, 2.860)})
    table.insert(colors, {['Part'] = generatedParts[160], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[160], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[160], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[160], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[160], ['Name'] = "Part"})
end
if generatedParts[161] then
    table.insert(resizes, {['Part'] = generatedParts[161], ['CFrame'] = (origin + offset) * CFrame.new(-197.648, 5.122, 930.779, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.900, 2.560, 6.420)})
    table.insert(colors, {['Part'] = generatedParts[161], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[161], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[161], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[161], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[161], ['Name'] = "Part"})
end
if generatedParts[162] then
    table.insert(resizes, {['Part'] = generatedParts[162], ['CFrame'] = (origin + offset) * CFrame.new(-197.668, 4.292, 932.559, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(9.680, 0.560, 2.860)})
    table.insert(colors, {['Part'] = generatedParts[162], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[162], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[162], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[162], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[162], ['Name'] = "Part"})
end
if generatedParts[163] then
    table.insert(resizes, {['Part'] = generatedParts[163], ['CFrame'] = (origin + offset) * CFrame.new(-220.520, 11.344, 837.788, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(15.103, 2.861, 4.105)})
    table.insert(colors, {['Part'] = generatedParts[163], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[163], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[163], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[163], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[163], ['Name'] = "Part"})
end
if generatedParts[164] then
    table.insert(resizes, {['Part'] = generatedParts[164], ['CFrame'] = (origin + offset) * CFrame.new(-220.583, 4.443, 837.791, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.255, 3.467, 5.349)})
    table.insert(colors, {['Part'] = generatedParts[164], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[164], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[164], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[164], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[164], ['Name'] = "Part"})
end
if generatedParts[165] then
    table.insert(resizes, {['Part'] = generatedParts[165], ['CFrame'] = (origin + offset) * CFrame.new(-220.562, 4.054, 837.810, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.523, 3.858, 5.621)})
    table.insert(colors, {['Part'] = generatedParts[165], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[165], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[165], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[165], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[165], ['Name'] = "Part"})
end
if generatedParts[166] then
    table.insert(resizes, {['Part'] = generatedParts[166], ['CFrame'] = (origin + offset) * CFrame.new(-265.161, 144.958, 933.077, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.253, 0.106, 0.113)})
    table.insert(colors, {['Part'] = generatedParts[166], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[166], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[166], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[166], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[166], ['Name'] = "Part"})
end
if generatedParts[167] then
    table.insert(resizes, {['Part'] = generatedParts[167], ['CFrame'] = (origin + offset) * CFrame.new(-265.161, 142.348, 933.077, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.095, 0.345, 0.325)})
    table.insert(colors, {['Part'] = generatedParts[167], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[167], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[167], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[167], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[167], ['Name'] = "Part"})
end
if generatedParts[168] then
    table.insert(resizes, {['Part'] = generatedParts[168], ['CFrame'] = (origin + offset) * CFrame.new(-265.161, 143.920, 933.077, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.008, 0.199, 0.179)})
    table.insert(colors, {['Part'] = generatedParts[168], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[168], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[168], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[168], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[168], ['Name'] = "Part"})
end
if generatedParts[169] then
    table.insert(resizes, {['Part'] = generatedParts[169], ['CFrame'] = (origin + offset) * CFrame.new(-265.161, 145.724, 933.077, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.371, 0.080, 0.086)})
    table.insert(colors, {['Part'] = generatedParts[169], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[169], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[169], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[169], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[169], ['Name'] = "Part"})
end
if generatedParts[170] then
    table.insert(resizes, {['Part'] = generatedParts[170], ['CFrame'] = (origin + offset) * CFrame.new(-265.080, 99.899, 933.032, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(10.210, 0.220, 10.160)})
    table.insert(colors, {['Part'] = generatedParts[170], ['Color'] = Color3.new(0.302, 0.290, 0.298), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[170], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[170], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[170], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[170], ['Name'] = "Part"})
end
if generatedParts[171] then
    table.insert(resizes, {['Part'] = generatedParts[171], ['CFrame'] = (origin + offset) * CFrame.new(-265.087, 51.876, 933.068, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(96.164, 8.960, 8.990)})
    table.insert(colors, {['Part'] = generatedParts[171], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[171], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[171], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[171], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[171], ['Name'] = "Part"})
end
if generatedParts[172] then
    table.insert(resizes, {['Part'] = generatedParts[172], ['CFrame'] = (origin + offset) * CFrame.new(-249.258, 41.778, 849.537, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(22.843, 0.734, 22.951)})
    table.insert(colors, {['Part'] = generatedParts[172], ['Color'] = Color3.new(0.302, 0.290, 0.298), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[172], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[172], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[172], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[172], ['Name'] = "Part"})
end
if generatedParts[173] then
    table.insert(resizes, {['Part'] = generatedParts[173], ['CFrame'] = (origin + offset) * CFrame.new(-249.177, 57.461, 849.542, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.605, 0.130, 0.140)})
    table.insert(colors, {['Part'] = generatedParts[173], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[173], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[173], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[173], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[173], ['Name'] = "Part"})
end
if generatedParts[174] then
    table.insert(resizes, {['Part'] = generatedParts[174], ['CFrame'] = (origin + offset) * CFrame.new(-249.177, 51.963, 849.542, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.413, 0.562, 0.529)})
    table.insert(colors, {['Part'] = generatedParts[174], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[174], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[174], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[174], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[174], ['Name'] = "Part"})
end
if generatedParts[175] then
    table.insert(resizes, {['Part'] = generatedParts[175], ['CFrame'] = (origin + offset) * CFrame.new(-249.177, 54.523, 849.542, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.642, 0.324, 0.292)})
    table.insert(colors, {['Part'] = generatedParts[175], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[175], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[175], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[175], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[175], ['Name'] = "Part"})
end
if generatedParts[176] then
    table.insert(resizes, {['Part'] = generatedParts[176], ['CFrame'] = (origin + offset) * CFrame.new(-249.177, 56.213, 849.542, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.041, 0.173, 0.184)})
    table.insert(colors, {['Part'] = generatedParts[176], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[176], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[176], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[176], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[176], ['Name'] = "Part"})
end
if generatedParts[177] then
    table.insert(resizes, {['Part'] = generatedParts[177], ['CFrame'] = (origin + offset) * CFrame.new(-158.987, 145.725, 932.907, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.371, 0.080, 0.086)})
    table.insert(colors, {['Part'] = generatedParts[177], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[177], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[177], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[177], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[177], ['Name'] = "Part"})
end
if generatedParts[178] then
    table.insert(resizes, {['Part'] = generatedParts[178], ['CFrame'] = (origin + offset) * CFrame.new(-158.987, 144.959, 932.907, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.253, 0.106, 0.113)})
    table.insert(colors, {['Part'] = generatedParts[178], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[178], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[178], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[178], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[178], ['Name'] = "Part"})
end
if generatedParts[179] then
    table.insert(resizes, {['Part'] = generatedParts[179], ['CFrame'] = (origin + offset) * CFrame.new(-158.987, 142.349, 932.907, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.095, 0.345, 0.325)})
    table.insert(colors, {['Part'] = generatedParts[179], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[179], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[179], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[179], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[179], ['Name'] = "Part"})
end
if generatedParts[180] then
    table.insert(resizes, {['Part'] = generatedParts[180], ['CFrame'] = (origin + offset) * CFrame.new(-158.987, 143.921, 932.907, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.008, 0.199, 0.179)})
    table.insert(colors, {['Part'] = generatedParts[180], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[180], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[180], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[180], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[180], ['Name'] = "Part"})
end
if generatedParts[181] then
    table.insert(resizes, {['Part'] = generatedParts[181], ['CFrame'] = (origin + offset) * CFrame.new(-158.906, 99.899, 932.862, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(10.210, 0.220, 10.160)})
    table.insert(colors, {['Part'] = generatedParts[181], ['Color'] = Color3.new(0.302, 0.290, 0.298), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[181], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[181], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[181], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[181], ['Name'] = "Part"})
end
if generatedParts[182] then
    table.insert(resizes, {['Part'] = generatedParts[182], ['CFrame'] = (origin + offset) * CFrame.new(-158.913, 51.876, 932.898, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(96.164, 8.960, 8.990)})
    table.insert(colors, {['Part'] = generatedParts[182], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[182], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[182], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[182], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[182], ['Name'] = "Part"})
end
if generatedParts[183] then
    table.insert(resizes, {['Part'] = generatedParts[183], ['CFrame'] = (origin + offset) * CFrame.new(-204.643, 11.391, 837.114, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(15.103, 2.861, 4.105)})
    table.insert(colors, {['Part'] = generatedParts[183], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[183], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[183], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[183], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[183], ['Name'] = "Part"})
end
if generatedParts[184] then
    table.insert(resizes, {['Part'] = generatedParts[184], ['CFrame'] = (origin + offset) * CFrame.new(-204.706, 4.490, 837.117, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.255, 3.467, 5.349)})
    table.insert(colors, {['Part'] = generatedParts[184], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[184], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[184], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[184], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[184], ['Name'] = "Part"})
end
if generatedParts[185] then
    table.insert(resizes, {['Part'] = generatedParts[185], ['CFrame'] = (origin + offset) * CFrame.new(-204.686, 4.101, 837.137, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.523, 3.858, 5.621)})
    table.insert(colors, {['Part'] = generatedParts[185], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[185], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[185], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[185], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[185], ['Name'] = "Part"})
end
if generatedParts[186] then
    table.insert(resizes, {['Part'] = generatedParts[186], ['CFrame'] = (origin + offset) * CFrame.new(-174.271, 51.963, 925.690, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.413, 0.562, 0.529)})
    table.insert(colors, {['Part'] = generatedParts[186], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[186], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[186], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[186], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[186], ['Name'] = "Part"})
end
if generatedParts[187] then
    table.insert(resizes, {['Part'] = generatedParts[187], ['CFrame'] = (origin + offset) * CFrame.new(-174.271, 56.213, 925.690, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.041, 0.173, 0.184)})
    table.insert(colors, {['Part'] = generatedParts[187], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[187], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[187], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[187], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[187], ['Name'] = "Part"})
end
if generatedParts[188] then
    table.insert(resizes, {['Part'] = generatedParts[188], ['CFrame'] = (origin + offset) * CFrame.new(-174.271, 57.461, 925.690, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.605, 0.130, 0.140)})
    table.insert(colors, {['Part'] = generatedParts[188], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[188], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[188], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[188], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[188], ['Name'] = "Part"})
end
if generatedParts[189] then
    table.insert(resizes, {['Part'] = generatedParts[189], ['CFrame'] = (origin + offset) * CFrame.new(-174.271, 54.523, 925.690, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.642, 0.324, 0.292)})
    table.insert(colors, {['Part'] = generatedParts[189], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[189], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[189], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[189], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[189], ['Name'] = "Part"})
end
if generatedParts[190] then
    table.insert(resizes, {['Part'] = generatedParts[190], ['CFrame'] = (origin + offset) * CFrame.new(-174.352, 41.778, 925.685, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(22.843, 0.734, 22.951)})
    table.insert(colors, {['Part'] = generatedParts[190], ['Color'] = Color3.new(0.302, 0.290, 0.298), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[190], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[190], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[190], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[190], ['Name'] = "Part"})
end
if generatedParts[191] then
    table.insert(resizes, {['Part'] = generatedParts[191], ['CFrame'] = (origin + offset) * CFrame.new(-174.126, 57.461, 849.492, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.605, 0.130, 0.140)})
    table.insert(colors, {['Part'] = generatedParts[191], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[191], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[191], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[191], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[191], ['Name'] = "Part"})
end
if generatedParts[192] then
    table.insert(resizes, {['Part'] = generatedParts[192], ['CFrame'] = (origin + offset) * CFrame.new(-174.207, 41.778, 849.487, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(22.843, 0.734, 22.951)})
    table.insert(colors, {['Part'] = generatedParts[192], ['Color'] = Color3.new(0.302, 0.290, 0.298), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[192], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[192], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[192], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[192], ['Name'] = "Part"})
end
if generatedParts[193] then
    table.insert(resizes, {['Part'] = generatedParts[193], ['CFrame'] = (origin + offset) * CFrame.new(-174.126, 51.963, 849.492, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.413, 0.562, 0.529)})
    table.insert(colors, {['Part'] = generatedParts[193], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[193], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[193], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[193], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[193], ['Name'] = "Part"})
end
if generatedParts[194] then
    table.insert(resizes, {['Part'] = generatedParts[194], ['CFrame'] = (origin + offset) * CFrame.new(-174.126, 56.213, 849.492, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.041, 0.173, 0.184)})
    table.insert(colors, {['Part'] = generatedParts[194], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[194], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[194], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[194], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[194], ['Name'] = "Part"})
end
if generatedParts[195] then
    table.insert(resizes, {['Part'] = generatedParts[195], ['CFrame'] = (origin + offset) * CFrame.new(-174.126, 54.523, 849.492, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.642, 0.324, 0.292)})
    table.insert(colors, {['Part'] = generatedParts[195], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[195], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[195], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[195], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[195], ['Name'] = "Part"})
end
if generatedParts[196] then
    table.insert(resizes, {['Part'] = generatedParts[196], ['CFrame'] = (origin + offset) * CFrame.new(-249.044, 41.778, 925.347, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(22.843, 0.734, 22.951)})
    table.insert(colors, {['Part'] = generatedParts[196], ['Color'] = Color3.new(0.302, 0.290, 0.298), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[196], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[196], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[196], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[196], ['Name'] = "Part"})
end
if generatedParts[197] then
    table.insert(resizes, {['Part'] = generatedParts[197], ['CFrame'] = (origin + offset) * CFrame.new(-248.963, 56.213, 925.352, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.041, 0.173, 0.184)})
    table.insert(colors, {['Part'] = generatedParts[197], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[197], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[197], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[197], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[197], ['Name'] = "Part"})
end
if generatedParts[198] then
    table.insert(resizes, {['Part'] = generatedParts[198], ['CFrame'] = (origin + offset) * CFrame.new(-248.963, 51.963, 925.352, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.413, 0.562, 0.529)})
    table.insert(colors, {['Part'] = generatedParts[198], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[198], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[198], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[198], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[198], ['Name'] = "Part"})
end
if generatedParts[199] then
    table.insert(resizes, {['Part'] = generatedParts[199], ['CFrame'] = (origin + offset) * CFrame.new(-248.963, 54.523, 925.352, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.642, 0.324, 0.292)})
    table.insert(colors, {['Part'] = generatedParts[199], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[199], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[199], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[199], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[199], ['Name'] = "Part"})
end
if generatedParts[200] then
    table.insert(resizes, {['Part'] = generatedParts[200], ['CFrame'] = (origin + offset) * CFrame.new(-248.963, 57.461, 925.352, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.605, 0.130, 0.140)})
    table.insert(colors, {['Part'] = generatedParts[200], ['Color'] = Color3.new(0.937, 0.722, 0.220), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[200], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[200], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[200], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[200], ['Name'] = "Part"})
end
if generatedParts[201] then
    table.insert(resizes, {['Part'] = generatedParts[201], ['CFrame'] = (origin + offset) * CFrame.new(-211.913, 3.817, 888.265, 0.000, 0.000, -1.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000), ['Size'] = Vector3.new(0.050, 97.740, 97.560)})
    table.insert(colors, {['Part'] = generatedParts[201], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[201], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[201], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[201], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[201], ['Name'] = "BeveledGreyTilesTexture"})
end
if generatedParts[202] then
    table.insert(resizes, {['Part'] = generatedParts[202], ['CFrame'] = (origin + offset) * CFrame.new(-212.144, 41.281, 887.279, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(0.260, 97.410, 98.000)})
    table.insert(colors, {['Part'] = generatedParts[202], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[202], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[202], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[202], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[202], ['Name'] = "BeveledGreyTilesTexture"})
end
if generatedParts[203] then
    table.insert(resizes, {['Part'] = generatedParts[203], ['CFrame'] = (origin + offset) * CFrame.new(-212.684, 3.939, 843.513, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(14.032, 0.167, 14.543)})
    table.insert(colors, {['Part'] = generatedParts[203], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[203], ['Material'] = Enum.Material.Cobblestone, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[203], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[203], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[203], ['Name'] = "Part"})
end
if generatedParts[204] then
    table.insert(resizes, {['Part'] = generatedParts[204], ['CFrame'] = (origin + offset) * CFrame.new(-260.187, 22.568, 888.311, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(37.410, 1.000, 98.000)})
    table.insert(colors, {['Part'] = generatedParts[204], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[204], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[204], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[204], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[204], ['Name'] = "BeveledGreyTilesTexture"})
end
if generatedParts[205] then
    table.insert(resizes, {['Part'] = generatedParts[205], ['CFrame'] = (origin + offset) * CFrame.new(-163.475, 22.551, 888.311, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(37.410, 1.000, 98.000)})
    table.insert(colors, {['Part'] = generatedParts[205], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[205], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[205], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[205], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[205], ['Name'] = "BeveledGreyTilesTexture"})
end
if generatedParts[206] then
    table.insert(resizes, {['Part'] = generatedParts[206], ['CFrame'] = (origin + offset) * CFrame.new(-212.812, 2.325, 936.840, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(0.460, 3.070, 87.530)})
    table.insert(colors, {['Part'] = generatedParts[206], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[206], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[206], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[206], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[206], ['Name'] = "Part"})
end
if generatedParts[207] then
    table.insert(resizes, {['Part'] = generatedParts[207], ['CFrame'] = (origin + offset) * CFrame.new(-210.720, 22.548, 936.683, 0.000, 0.000, -1.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000), ['Size'] = Vector3.new(37.410, 1.000, 98.000)})
    table.insert(colors, {['Part'] = generatedParts[207], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[207], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[207], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[207], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[207], ['Name'] = "BeveledGreyTilesTexture"})
end
if generatedParts[208] then
    table.insert(resizes, {['Part'] = generatedParts[208], ['CFrame'] = (origin + offset) * CFrame.new(-214.330, 3.867, 930.548, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(5.220, 0.050, 7.260)})
    table.insert(colors, {['Part'] = generatedParts[208], ['Color'] = Color3.new(0.769, 0.157, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[208], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[208], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[208], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[208], ['Name'] = "Carpet"})
end
if generatedParts[209] then
    table.insert(resizes, {['Part'] = generatedParts[209], ['CFrame'] = (origin + offset) * CFrame.new(-211.531, 42.790, 878.321, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.200, 1.200, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[209], ['Color'] = Color3.new(1.000, 1.000, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[209], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[209], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[209], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[209], ['Name'] = "Part"})
end
if generatedParts[210] then
    table.insert(resizes, {['Part'] = generatedParts[210], ['CFrame'] = (origin + offset) * CFrame.new(-257.408, 42.245, 845.315, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.200, 1.200, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[210], ['Color'] = Color3.new(1.000, 1.000, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[210], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[210], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[210], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[210], ['Name'] = "Part"})
end
if generatedParts[211] then
    table.insert(resizes, {['Part'] = generatedParts[211], ['CFrame'] = (origin + offset) * CFrame.new(-175.664, 42.245, 847.604, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.200, 1.200, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[211], ['Color'] = Color3.new(1.000, 1.000, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[211], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[211], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[211], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[211], ['Name'] = "Part"})
end
if generatedParts[212] then
    table.insert(resizes, {['Part'] = generatedParts[212], ['CFrame'] = (origin + offset) * CFrame.new(-251.389, 42.245, 923.597, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.200, 1.200, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[212], ['Color'] = Color3.new(1.000, 1.000, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[212], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[212], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[212], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[212], ['Name'] = "Part"})
end
if generatedParts[213] then
    table.insert(resizes, {['Part'] = generatedParts[213], ['CFrame'] = (origin + offset) * CFrame.new(-175.994, 42.245, 926.565, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.200, 1.200, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[213], ['Color'] = Color3.new(1.000, 1.000, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[213], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[213], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[213], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[213], ['Name'] = "Part"})
end
if generatedParts[214] then
    table.insert(resizes, {['Part'] = generatedParts[214], ['CFrame'] = (origin + offset) * CFrame.new(-198.098, 13.511, 932.207, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.538, 1.538, 1.538)})
    table.insert(colors, {['Part'] = generatedParts[214], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[214], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[214], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[214], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[214], ['Name'] = "Handle"})
end
if generatedParts[215] then
    table.insert(resizes, {['Part'] = generatedParts[215], ['CFrame'] = (origin + offset) * CFrame.new(-198.098, 8.680, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.538, 1.538, 1.538)})
    table.insert(colors, {['Part'] = generatedParts[215], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[215], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[215], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[215], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[215], ['Name'] = "Handle"})
end
if generatedParts[216] then
    table.insert(resizes, {['Part'] = generatedParts[216], ['CFrame'] = (origin + offset) * CFrame.new(-198.126, 14.440, 932.623, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.092, 1.077, 1.132)})
    table.insert(colors, {['Part'] = generatedParts[216], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[216], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[216], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[216], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[216], ['Name'] = "Handle"})
end
if generatedParts[217] then
    table.insert(resizes, {['Part'] = generatedParts[217], ['CFrame'] = (origin + offset) * CFrame.new(-198.098, 12.336, 932.831, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.538, 1.538, 1.538)})
    table.insert(colors, {['Part'] = generatedParts[217], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[217], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[217], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[217], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[217], ['Name'] = "Handle"})
end
if generatedParts[218] then
    table.insert(resizes, {['Part'] = generatedParts[218], ['CFrame'] = (origin + offset) * CFrame.new(-197.329, 7.940, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.538, 3.076, 1.538)})
    table.insert(colors, {['Part'] = generatedParts[218], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[218], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[218], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[218], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[218], ['Name'] = "Right Leg"})
end
if generatedParts[219] then
    table.insert(resizes, {['Part'] = generatedParts[219], ['CFrame'] = (origin + offset) * CFrame.new(-198.098, 13.323, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.076, 1.538, 1.538)})
    table.insert(colors, {['Part'] = generatedParts[219], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[219], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[219], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[219], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[219], ['Name'] = "Head"})
end
if generatedParts[220] then
    table.insert(resizes, {['Part'] = generatedParts[220], ['CFrame'] = (origin + offset) * CFrame.new(-198.098, 11.016, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.076, 3.076, 1.538)})
    table.insert(colors, {['Part'] = generatedParts[220], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[220], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[220], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[220], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[220], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[221] then
    table.insert(resizes, {['Part'] = generatedParts[221], ['CFrame'] = (origin + offset) * CFrame.new(-195.084, 11.723, 932.605, -0.707, -0.707, 0.000, 0.707, -0.707, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.538, 3.076, 1.538)})
    table.insert(colors, {['Part'] = generatedParts[221], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[221], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[221], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[221], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[221], ['Name'] = "Right Arm"})
end
if generatedParts[222] then
    table.insert(resizes, {['Part'] = generatedParts[222], ['CFrame'] = (origin + offset) * CFrame.new(-198.867, 7.940, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.538, 3.076, 1.538)})
    table.insert(colors, {['Part'] = generatedParts[222], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[222], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[222], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[222], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[222], ['Name'] = "Left Leg"})
end
if generatedParts[223] then
    table.insert(resizes, {['Part'] = generatedParts[223], ['CFrame'] = (origin + offset) * CFrame.new(-198.098, 11.016, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.076, 3.076, 1.538)})
    table.insert(colors, {['Part'] = generatedParts[223], ['Color'] = Color3.new(0.525, 0.522, 0.529), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[223], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[223], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[223], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[223], ['Name'] = "Torso"})
end
if generatedParts[224] then
    table.insert(resizes, {['Part'] = generatedParts[224], ['CFrame'] = (origin + offset) * CFrame.new(-200.405, 11.016, 932.605, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.538, 3.076, 1.538)})
    table.insert(colors, {['Part'] = generatedParts[224], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[224], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[224], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[224], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[224], ['Name'] = "Left Arm"})
end
if generatedParts[225] then
    table.insert(resizes, {['Part'] = generatedParts[225], ['CFrame'] = (origin + offset) * CFrame.new(-214.390, 14.883, 931.832, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.333, 2.333, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[225], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[225], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[225], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[225], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[225], ['Name'] = "Handle"})
end
if generatedParts[226] then
    table.insert(resizes, {['Part'] = generatedParts[226], ['CFrame'] = (origin + offset) * CFrame.new(-214.390, 7.299, 932.436, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.333, 2.333, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[226], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[226], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[226], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[226], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[226], ['Name'] = "Handle"})
end
if generatedParts[227] then
    table.insert(resizes, {['Part'] = generatedParts[227], ['CFrame'] = (origin + offset) * CFrame.new(-214.390, 14.925, 931.853, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.333, 2.333, 4.667)})
    table.insert(colors, {['Part'] = generatedParts[227], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[227], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[227], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[227], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[227], ['Name'] = "Handle"})
end
if generatedParts[228] then
    table.insert(resizes, {['Part'] = generatedParts[228], ['CFrame'] = (origin + offset) * CFrame.new(-214.619, 12.068, 932.432, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.333, 2.333, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[228], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[228], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[228], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[228], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[228], ['Name'] = "Handle"})
end
if generatedParts[229] then
    table.insert(resizes, {['Part'] = generatedParts[229], ['CFrame'] = (origin + offset) * CFrame.new(-213.280, 10.842, 930.075, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.333, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[229], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[229], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[229], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[229], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[229], ['Name'] = "Right Arm"})
end
if generatedParts[230] then
    table.insert(resizes, {['Part'] = generatedParts[230], ['CFrame'] = (origin + offset) * CFrame.new(-215.556, 6.175, 932.436, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), ['Size'] = Vector3.new(2.333, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[230], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[230], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[230], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[230], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[230], ['Name'] = "Left Leg"})
end
if generatedParts[231] then
    table.insert(resizes, {['Part'] = generatedParts[231], ['CFrame'] = (origin + offset) * CFrame.new(-214.390, 10.842, 932.436, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(4.667, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[231], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[231], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[231], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[231], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[231], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[232] then
    table.insert(resizes, {['Part'] = generatedParts[232], ['CFrame'] = (origin + offset) * CFrame.new(-214.390, 10.842, 932.436, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(4.667, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[232], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[232], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[232], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[232], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[232], ['Name'] = "Torso"})
end
if generatedParts[233] then
    table.insert(resizes, {['Part'] = generatedParts[233], ['CFrame'] = (origin + offset) * CFrame.new(-217.890, 10.842, 932.436, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), ['Size'] = Vector3.new(2.333, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[233], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[233], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[233], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[233], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[233], ['Name'] = "Left Arm"})
end
if generatedParts[234] then
    table.insert(resizes, {['Part'] = generatedParts[234], ['CFrame'] = (origin + offset) * CFrame.new(-213.223, 6.175, 932.436, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.333, 4.667, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[234], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[234], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[234], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[234], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[234], ['Name'] = "Right Leg"})
end
if generatedParts[235] then
    table.insert(resizes, {['Part'] = generatedParts[235], ['CFrame'] = (origin + offset) * CFrame.new(-214.390, 14.342, 932.436, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(4.667, 2.333, 2.333)})
    table.insert(colors, {['Part'] = generatedParts[235], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[235], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[235], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[235], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[235], ['Name'] = "Head"})
end
if generatedParts[236] then
    table.insert(resizes, {['Part'] = generatedParts[236], ['CFrame'] = (origin + offset) * CFrame.new(-226.093, 15.055, 931.860, 0.909, 0.000, -0.416, 0.000, 1.000, 0.000, 0.416, 0.000, 0.909), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[236], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[236], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[236], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[236], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[236], ['Name'] = "Handle"})
end
if generatedParts[237] then
    table.insert(resizes, {['Part'] = generatedParts[237], ['CFrame'] = (origin + offset) * CFrame.new(-227.761, 17.130, 931.998, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[237], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[237], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[237], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[237], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[237], ['Name'] = "Handle"})
end
if generatedParts[238] then
    table.insert(resizes, {['Part'] = generatedParts[238], ['CFrame'] = (origin + offset) * CFrame.new(-227.761, 14.754, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[238], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[238], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[238], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[238], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[238], ['Name'] = "Handle"})
end
if generatedParts[239] then
    table.insert(resizes, {['Part'] = generatedParts[239], ['CFrame'] = (origin + offset) * CFrame.new(-227.761, 18.024, 931.723, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.253, 0.287, 0.991)})
    table.insert(colors, {['Part'] = generatedParts[239], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[239], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[239], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[239], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[239], ['Name'] = "Handle"})
end
if generatedParts[240] then
    table.insert(resizes, {['Part'] = generatedParts[240], ['CFrame'] = (origin + offset) * CFrame.new(-227.781, 17.967, 931.907, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[240], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[240], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[240], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[240], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[240], ['Name'] = "Handle"})
end
if generatedParts[241] then
    table.insert(resizes, {['Part'] = generatedParts[241], ['CFrame'] = (origin + offset) * CFrame.new(-228.261, 14.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[241], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[241], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[241], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[241], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[241], ['Name'] = "Left Leg"})
end
if generatedParts[242] then
    table.insert(resizes, {['Part'] = generatedParts[242], ['CFrame'] = (origin + offset) * CFrame.new(-227.261, 14.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[242], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[242], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[242], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[242], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[242], ['Name'] = "Right Leg"})
end
if generatedParts[243] then
    table.insert(resizes, {['Part'] = generatedParts[243], ['CFrame'] = (origin + offset) * CFrame.new(-229.261, 16.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[243], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[243], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[243], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[243], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[243], ['Name'] = "Left Arm"})
end
if generatedParts[244] then
    table.insert(resizes, {['Part'] = generatedParts[244], ['CFrame'] = (origin + offset) * CFrame.new(-226.261, 16.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[244], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[244], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[244], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[244], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[244], ['Name'] = "Right Arm"})
end
if generatedParts[245] then
    table.insert(resizes, {['Part'] = generatedParts[245], ['CFrame'] = (origin + offset) * CFrame.new(-227.761, 16.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[245], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[245], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[245], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[245], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[245], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[246] then
    table.insert(resizes, {['Part'] = generatedParts[246], ['CFrame'] = (origin + offset) * CFrame.new(-227.761, 16.272, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[246], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[246], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[246], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[246], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[246], ['Name'] = "Torso"})
end
if generatedParts[247] then
    table.insert(resizes, {['Part'] = generatedParts[247], ['CFrame'] = (origin + offset) * CFrame.new(-227.761, 17.772, 931.851, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[247], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[247], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[247], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[247], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[247], ['Name'] = "Head"})
end
if generatedParts[248] then
    table.insert(resizes, {['Part'] = generatedParts[248], ['CFrame'] = (origin + offset) * CFrame.new(-183.536, 7.080, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.238, 6.475, 3.238)})
    table.insert(colors, {['Part'] = generatedParts[248], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[248], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[248], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[248], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[248], ['Name'] = "Left Leg"})
end
if generatedParts[249] then
    table.insert(resizes, {['Part'] = generatedParts[249], ['CFrame'] = (origin + offset) * CFrame.new(-186.774, 13.555, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.238, 6.475, 3.238)})
    table.insert(colors, {['Part'] = generatedParts[249], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[249], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[249], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[249], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[249], ['Name'] = "Left Arm"})
end
if generatedParts[250] then
    table.insert(resizes, {['Part'] = generatedParts[250], ['CFrame'] = (origin + offset) * CFrame.new(-181.917, 13.555, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.475, 6.475, 3.238)})
    table.insert(colors, {['Part'] = generatedParts[250], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[250], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[250], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[250], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[250], ['Name'] = "Torso"})
end
if generatedParts[251] then
    table.insert(resizes, {['Part'] = generatedParts[251], ['CFrame'] = (origin + offset) * CFrame.new(-181.917, 13.555, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.475, 6.475, 3.238)})
    table.insert(colors, {['Part'] = generatedParts[251], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[251], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[251], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[251], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[251], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[252] then
    table.insert(resizes, {['Part'] = generatedParts[252], ['CFrame'] = (origin + offset) * CFrame.new(-180.299, 7.080, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.238, 6.475, 3.238)})
    table.insert(colors, {['Part'] = generatedParts[252], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[252], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[252], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[252], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[252], ['Name'] = "Right Leg"})
end
if generatedParts[253] then
    table.insert(resizes, {['Part'] = generatedParts[253], ['CFrame'] = (origin + offset) * CFrame.new(-181.917, 18.411, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.475, 3.238, 3.238)})
    table.insert(colors, {['Part'] = generatedParts[253], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[253], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[253], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[253], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[253], ['Name'] = "Head"})
end
if generatedParts[254] then
    table.insert(resizes, {['Part'] = generatedParts[254], ['CFrame'] = (origin + offset) * CFrame.new(-177.061, 13.555, 929.995, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.238, 6.475, 3.238)})
    table.insert(colors, {['Part'] = generatedParts[254], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[254], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[254], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[254], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[254], ['Name'] = "Right Arm"})
end
if generatedParts[255] then
    table.insert(resizes, {['Part'] = generatedParts[255], ['CFrame'] = (origin + offset) * CFrame.new(-240.917, 18.681, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.595, 3.298, 3.298)})
    table.insert(colors, {['Part'] = generatedParts[255], ['Color'] = Color3.new(0.004, 0.035, 0.051), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[255], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[255], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[255], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[255], ['Name'] = "Head"})
end
if generatedParts[256] then
    table.insert(resizes, {['Part'] = generatedParts[256], ['CFrame'] = (origin + offset) * CFrame.new(-235.971, 13.735, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.298, 6.595, 3.298)})
    table.insert(colors, {['Part'] = generatedParts[256], ['Color'] = Color3.new(0.478, 0.055, 0.467), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[256], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[256], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[256], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[256], ['Name'] = "Right Arm"})
end
if generatedParts[257] then
    table.insert(resizes, {['Part'] = generatedParts[257], ['CFrame'] = (origin + offset) * CFrame.new(-242.566, 7.140, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.298, 6.595, 3.298)})
    table.insert(colors, {['Part'] = generatedParts[257], ['Color'] = Color3.new(0.427, 0.020, 0.424), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[257], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[257], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[257], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[257], ['Name'] = "Left Leg"})
end
if generatedParts[258] then
    table.insert(resizes, {['Part'] = generatedParts[258], ['CFrame'] = (origin + offset) * CFrame.new(-245.864, 13.735, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.298, 6.595, 3.298)})
    table.insert(colors, {['Part'] = generatedParts[258], ['Color'] = Color3.new(0.478, 0.055, 0.467), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[258], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[258], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[258], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[258], ['Name'] = "Left Arm"})
end
if generatedParts[259] then
    table.insert(resizes, {['Part'] = generatedParts[259], ['CFrame'] = (origin + offset) * CFrame.new(-240.917, 13.735, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.595, 6.595, 3.298)})
    table.insert(colors, {['Part'] = generatedParts[259], ['Color'] = Color3.new(0.004, 0.035, 0.051), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[259], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[259], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[259], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[259], ['Name'] = "Torso"})
end
if generatedParts[260] then
    table.insert(resizes, {['Part'] = generatedParts[260], ['CFrame'] = (origin + offset) * CFrame.new(-240.917, 13.735, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.595, 6.595, 3.298)})
    table.insert(colors, {['Part'] = generatedParts[260], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[260], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[260], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[260], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[260], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[261] then
    table.insert(resizes, {['Part'] = generatedParts[261], ['CFrame'] = (origin + offset) * CFrame.new(-239.269, 7.140, 929.710, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.298, 6.595, 3.298)})
    table.insert(colors, {['Part'] = generatedParts[261], ['Color'] = Color3.new(0.416, 0.012, 0.412), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[261], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[261], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[261], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[261], ['Name'] = "Right Leg"})
end
if generatedParts[262] then
    table.insert(resizes, {['Part'] = generatedParts[262], ['CFrame'] = (origin + offset) * CFrame.new(-220.251, 11.388, 844.150, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.755, 15.092, 8.994)})
    table.insert(colors, {['Part'] = generatedParts[262], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[262], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[262], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[262], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[262], ['Name'] = "Part"})
end
if generatedParts[263] then
    table.insert(resizes, {['Part'] = generatedParts[263], ['CFrame'] = (origin + offset) * CFrame.new(-205.378, 11.388, 843.979, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.467, 15.092, 8.994)})
    table.insert(colors, {['Part'] = generatedParts[263], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[263], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[263], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[263], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[263], ['Name'] = "Part"})
end
if generatedParts[264] then
    table.insert(resizes, {['Part'] = generatedParts[264], ['CFrame'] = (origin + offset) * CFrame.new(-212.560, 2.292, 858.214, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(12.000, 1.000, 12.000)})
    table.insert(colors, {['Part'] = generatedParts[264], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[264], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[264], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[264], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[264], ['Name'] = "SpawnLocation"})
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
if generatedParts[12] then
    pcall(function() AddMesh(generatedParts[12]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[12], "15010063") end)
    pcall(function() MeshResize(generatedParts[12], Vector3.new(0.268, 0.268, 0.161)) end)
    pcall(function() vect(generatedParts[12], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[14] then
    pcall(function() AddMesh(generatedParts[14]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[14], "15010063") end)
    pcall(function() MeshResize(generatedParts[14], Vector3.new(0.268, 0.268, 0.161)) end)
    pcall(function() vect(generatedParts[14], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[18] then
    pcall(function() AddMesh(generatedParts[18]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[18], "15010063") end)
    pcall(function() MeshResize(generatedParts[18], Vector3.new(0.268, 0.268, 0.161)) end)
    pcall(function() vect(generatedParts[18], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[23] then
    pcall(function() AddMesh(generatedParts[23]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[23], "15010063") end)
    pcall(function() MeshResize(generatedParts[23], Vector3.new(0.268, 0.268, 0.161)) end)
    pcall(function() vect(generatedParts[23], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[35] then
    pcall(function() SpawnDecal(generatedParts[35], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[35], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[36] then
    pcall(function() SpawnDecal(generatedParts[36], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[36], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[37] then
    pcall(function() SpawnDecal(generatedParts[37], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[37], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[38] then
    pcall(function() SpawnDecal(generatedParts[38], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[38], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[39] then
    pcall(function() SpawnDecal(generatedParts[39], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[39], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[40] then
    pcall(function() SpawnDecal(generatedParts[40], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[40], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[41] then
    pcall(function() SpawnDecal(generatedParts[41], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[41], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[42] then
    pcall(function() SpawnDecal(generatedParts[42], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[42], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[43] then
    pcall(function() SpawnDecal(generatedParts[43], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[43], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[44] then
    pcall(function() SpawnDecal(generatedParts[44], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[44], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[45] then
    pcall(function() SpawnDecal(generatedParts[45], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[45], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[46] then
    pcall(function() SpawnDecal(generatedParts[46], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[46], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[47] then
    pcall(function() SpawnDecal(generatedParts[47], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[47], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[48] then
    pcall(function() SpawnDecal(generatedParts[48], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[48], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[49] then
    pcall(function() SpawnDecal(generatedParts[49], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[49], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[50] then
    pcall(function() SpawnDecal(generatedParts[50], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[50], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[51] then
    pcall(function() SpawnDecal(generatedParts[51], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[51], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[52] then
    pcall(function() SpawnDecal(generatedParts[52], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[52], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[53] then
    pcall(function() SpawnDecal(generatedParts[53], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[53], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[54] then
    pcall(function() SpawnDecal(generatedParts[54], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[54], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[55] then
    pcall(function() SpawnDecal(generatedParts[55], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[55], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[56] then
    pcall(function() SpawnDecal(generatedParts[56], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[56], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[57] then
    pcall(function() SpawnDecal(generatedParts[57], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[57], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[58] then
    pcall(function() SpawnDecal(generatedParts[58], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[58], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[59] then
    pcall(function() SpawnDecal(generatedParts[59], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[59], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[60] then
    pcall(function() SpawnDecal(generatedParts[60], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[60], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[61] then
    pcall(function() SpawnDecal(generatedParts[61], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[61], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[62] then
    pcall(function() SpawnDecal(generatedParts[62], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[62], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[63] then
    pcall(function() SpawnDecal(generatedParts[63], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[63], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[64] then
    pcall(function() SpawnDecal(generatedParts[64], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[64], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[65] then
    pcall(function() SpawnDecal(generatedParts[65], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[65], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[66] then
    pcall(function() SpawnDecal(generatedParts[66], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[66], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[67] then
    pcall(function() SpawnDecal(generatedParts[67], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[67], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[68] then
    pcall(function() SpawnDecal(generatedParts[68], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[68], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[69] then
    pcall(function() SpawnDecal(generatedParts[69], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[69], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[70] then
    pcall(function() SpawnDecal(generatedParts[70], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[70], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[71] then
    pcall(function() SpawnDecal(generatedParts[71], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[71], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[72] then
    pcall(function() SpawnDecal(generatedParts[72], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[72], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[73] then
    pcall(function() SpawnDecal(generatedParts[73], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[73], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[74] then
    pcall(function() SpawnDecal(generatedParts[74], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[74], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[75] then
    pcall(function() SpawnDecal(generatedParts[75], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[75], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[76] then
    pcall(function() SpawnDecal(generatedParts[76], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[76], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[77] then
    pcall(function() SpawnDecal(generatedParts[77], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[77], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[78] then
    pcall(function() SpawnDecal(generatedParts[78], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[78], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[79] then
    pcall(function() SpawnDecal(generatedParts[79], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[79], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[80] then
    pcall(function() SpawnDecal(generatedParts[80], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[80], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[81] then
    pcall(function() SpawnDecal(generatedParts[81], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[81], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[82] then
    pcall(function() SpawnDecal(generatedParts[82], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[82], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[83] then
    pcall(function() SpawnDecal(generatedParts[83], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[83], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[84] then
    pcall(function() SpawnDecal(generatedParts[84], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[84], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[85] then
    pcall(function() SpawnDecal(generatedParts[85], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[85], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[86] then
    pcall(function() SpawnDecal(generatedParts[86], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[86], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[87] then
    pcall(function() SpawnDecal(generatedParts[87], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[87], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[88] then
    pcall(function() SpawnDecal(generatedParts[88], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[88], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[89] then
    pcall(function() SpawnDecal(generatedParts[89], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[89], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[90] then
    pcall(function() SpawnDecal(generatedParts[90], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[90], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[91] then
    pcall(function() SpawnDecal(generatedParts[91], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[91], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[92] then
    pcall(function() SpawnDecal(generatedParts[92], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[92], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[93] then
    pcall(function() SpawnDecal(generatedParts[93], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[93], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[94] then
    pcall(function() SpawnDecal(generatedParts[94], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[94], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[95] then
    pcall(function() SpawnDecal(generatedParts[95], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[95], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[96] then
    pcall(function() SpawnDecal(generatedParts[96], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[96], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[97] then
    pcall(function() SpawnDecal(generatedParts[97], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[97], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[98] then
    pcall(function() SpawnDecal(generatedParts[98], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[98], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[99] then
    pcall(function() SpawnDecal(generatedParts[99], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[99], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[100] then
    pcall(function() SpawnDecal(generatedParts[100], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[100], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[101] then
    pcall(function() SpawnDecal(generatedParts[101], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[101], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[102] then
    pcall(function() SpawnDecal(generatedParts[102], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[102], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[103] then
    pcall(function() SpawnDecal(generatedParts[103], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[103], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[104] then
    pcall(function() SpawnDecal(generatedParts[104], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[104], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[105] then
    pcall(function() SpawnDecal(generatedParts[105], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[105], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[106] then
    pcall(function() SpawnDecal(generatedParts[106], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[106], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[107] then
    pcall(function() SpawnDecal(generatedParts[107], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[107], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[108] then
    pcall(function() SpawnDecal(generatedParts[108], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[108], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[109] then
    pcall(function() SpawnDecal(generatedParts[109], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[109], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[110] then
    pcall(function() SpawnDecal(generatedParts[110], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[110], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[111] then
    pcall(function() SpawnDecal(generatedParts[111], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[111], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[112] then
    pcall(function() SpawnDecal(generatedParts[112], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[112], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[208] then
    pcall(function() SpawnDecal(generatedParts[208], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[208], "45666330", Enum.NormalId.Top) end)
end
if generatedParts[209] then
    pcall(function() AddMesh(generatedParts[209]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[209], Enum.MeshType.Cylinder) end)
    pcall(function() MeshResize(generatedParts[209], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[209], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[210] then
    pcall(function() AddMesh(generatedParts[210]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[210], Enum.MeshType.Cylinder) end)
    pcall(function() MeshResize(generatedParts[210], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[210], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[211] then
    pcall(function() AddMesh(generatedParts[211]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[211], Enum.MeshType.Cylinder) end)
    pcall(function() MeshResize(generatedParts[211], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[211], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[212] then
    pcall(function() AddMesh(generatedParts[212]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[212], Enum.MeshType.Cylinder) end)
    pcall(function() MeshResize(generatedParts[212], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[212], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[213] then
    pcall(function() AddMesh(generatedParts[213]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[213], Enum.MeshType.Cylinder) end)
    pcall(function() MeshResize(generatedParts[213], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[213], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[214] then
    pcall(function() AddMesh(generatedParts[214]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[214], "138331682762957") end)
    pcall(function() MeshResize(generatedParts[214], Vector3.new(1.538, 1.538, 1.538)) end)
    pcall(function() vect(generatedParts[214], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[215] then
    pcall(function() AddMesh(generatedParts[215]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[215], "18154333421") end)
    pcall(function() MeshResize(generatedParts[215], Vector3.new(1.538, 1.538, 1.538)) end)
    pcall(function() vect(generatedParts[215], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[216] then
    pcall(function() AddMesh(generatedParts[216]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[216], "119957598075087") end)
    pcall(function() MeshResize(generatedParts[216], Vector3.new(1.092, 1.077, 1.132)) end)
    pcall(function() vect(generatedParts[216], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[217] then
    pcall(function() AddMesh(generatedParts[217]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[217], "17523149727") end)
    pcall(function() MeshResize(generatedParts[217], Vector3.new(1.538, 1.538, 1.538)) end)
    pcall(function() vect(generatedParts[217], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[219] then
    pcall(function() AddMesh(generatedParts[219]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[219], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[219], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[219], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[219], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[223] then
    pcall(function() SpawnDecal(generatedParts[223], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[223], "107039115828792", Enum.NormalId.Front) end)
end
if generatedParts[225] then
    pcall(function() AddMesh(generatedParts[225]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[225], "138331682762957") end)
    pcall(function() MeshResize(generatedParts[225], Vector3.new(2.333, 2.333, 2.333)) end)
    pcall(function() vect(generatedParts[225], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[226] then
    pcall(function() AddMesh(generatedParts[226]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[226], "18154333421") end)
    pcall(function() MeshResize(generatedParts[226], Vector3.new(2.333, 2.333, 2.333)) end)
    pcall(function() vect(generatedParts[226], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[227] then
    pcall(function() AddMesh(generatedParts[227]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[227], "83293901") end)
    pcall(function() MeshResize(generatedParts[227], Vector3.new(2.333, 2.450, 2.333)) end)
    pcall(function() vect(generatedParts[227], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[228] then
    pcall(function() AddMesh(generatedParts[228]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[228], "138076927962847") end)
    pcall(function() MeshResize(generatedParts[228], Vector3.new(2.333, 2.333, 2.333)) end)
    pcall(function() vect(generatedParts[228], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[232] then
    pcall(function() SpawnDecal(generatedParts[232], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[232], "", Enum.NormalId.Front) end)
end
if generatedParts[235] then
    pcall(function() AddMesh(generatedParts[235]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[235], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[235], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[235], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[235], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[236] then
    pcall(function() AddMesh(generatedParts[236]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[236], "3339200953") end)
    pcall(function() MeshResize(generatedParts[236], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[236], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[237] then
    pcall(function() AddMesh(generatedParts[237]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[237], "17523149727") end)
    pcall(function() MeshResize(generatedParts[237], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[237], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[238] then
    pcall(function() AddMesh(generatedParts[238]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[238], "18154333421") end)
    pcall(function() MeshResize(generatedParts[238], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[238], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[239] then
    pcall(function() AddMesh(generatedParts[239]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[239], "97917681139961") end)
    pcall(function() MeshResize(generatedParts[239], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[239], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[240] then
    pcall(function() AddMesh(generatedParts[240]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[240], "122649632041428") end)
    pcall(function() MeshResize(generatedParts[240], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[240], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[246] then
    pcall(function() SpawnDecal(generatedParts[246], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[246], "", Enum.NormalId.Front) end)
end
if generatedParts[247] then
    pcall(function() AddMesh(generatedParts[247]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[247], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[247], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[247], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[247], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[250] then
    pcall(function() SpawnDecal(generatedParts[250], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[250], "", Enum.NormalId.Front) end)
end
if generatedParts[253] then
    pcall(function() AddMesh(generatedParts[253]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[253], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[253], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[253], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[253], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[255] then
    pcall(function() AddMesh(generatedParts[255]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[255], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[255], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[255], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[255], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[259] then
    pcall(function() SpawnDecal(generatedParts[259], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[259], "", Enum.NormalId.Front) end)
end
if generatedParts[264] then
    pcall(function() SpawnDecal(generatedParts[264], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[264], "83078799816107", Enum.NormalId.Top) end)
end
if root then root.Anchored = false end