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
task.spawn(function() pcall(function() generatedParts[1] = CreatePart("Normal", CFrame.new(-49.580, 4.800, -35.418, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[2] = CreatePart("Normal", CFrame.new(-49.081, 1.300, -35.439, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[3] = CreatePart("Normal", CFrame.new(-51.079, 3.300, -35.354, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[4] = CreatePart("Normal", CFrame.new(-50.080, 1.300, -35.396, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[5] = CreatePart("Normal", CFrame.new(-49.580, 3.300, -35.418, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[6] = CreatePart("Normal", CFrame.new(-49.580, 4.800, -35.418, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[7] = CreatePart("Normal", CFrame.new(-48.082, 3.300, -35.482, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[8] = CreatePart("Normal", CFrame.new(-51.079, 3.300, -35.354, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[9] = CreatePart("Normal", CFrame.new(-49.081, 1.300, -35.439, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[10] = CreatePart("Normal", CFrame.new(-49.580, 4.800, -35.418, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[11] = CreatePart("Normal", CFrame.new(-50.080, 1.300, -35.396, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[12] = CreatePart("Normal", CFrame.new(-48.082, 3.300, -35.482, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[13] = CreatePart("Normal", CFrame.new(-49.580, 3.300, -35.418, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[14] = CreatePart("Normal", CFrame.new(-21.998, 5.797, 6.160, -0.999, 0.000, 0.034, 0.000, 1.000, 0.000, -0.034, 0.000, -0.999), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[15] = CreatePart("Normal", CFrame.new(-22.000, 4.300, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[16] = CreatePart("Normal", CFrame.new(-20.500, 4.300, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[17] = CreatePart("Normal", CFrame.new(-22.500, 2.300, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[18] = CreatePart("Normal", CFrame.new(-21.500, 2.300, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[19] = CreatePart("Normal", CFrame.new(-23.500, 4.300, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[20] = CreatePart("Normal", CFrame.new(-22.000, 5.800, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[21] = CreatePart("Normal", CFrame.new(-17.051, 4.170, -157.929, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[22] = CreatePart("Wedge", CFrame.new(-16.457, 5.770, -156.523, 0.814, 0.000, -0.581, 0.000, 1.000, 0.000, 0.581, 0.000, 0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[23] = CreatePart("Normal", CFrame.new(-17.597, 5.070, -157.336, -0.581, 0.814, 0.000, 0.000, 0.000, 1.000, 0.814, 0.581, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[24] = CreatePart("Ball", CFrame.new(-15.817, 3.070, -154.838, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[25] = CreatePart("Cylinder", CFrame.new(-15.236, 3.070, -155.652, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[26] = CreatePart("Normal", CFrame.new(-16.457, 5.420, -156.523, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[27] = CreatePart("Cylinder", CFrame.new(-15.666, 4.170, -155.222, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[28] = CreatePart("Normal", CFrame.new(-16.980, 3.270, -155.790, -0.814, -0.581, -0.000, -0.000, -0.000, 1.000, -0.581, 0.814, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[29] = CreatePart("Cylinder", CFrame.new(-17.678, 3.070, -157.394, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[30] = CreatePart("Cylinder", CFrame.new(-17.945, 4.170, -156.848, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[31] = CreatePart("Normal", CFrame.new(-16.457, 5.570, -156.523, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[32] = CreatePart("Ball", CFrame.new(-14.655, 3.070, -156.466, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[33] = CreatePart("Cylinder", CFrame.new(-17.556, 4.170, -157.307, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[34] = CreatePart("Cylinder", CFrame.new(-16.980, 3.470, -155.790, -0.814, -0.581, -0.000, -0.000, -0.000, 1.000, -0.581, 0.814, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[35] = CreatePart("Cylinder", CFrame.new(-15.877, 3.070, -157.338, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[36] = CreatePart("Normal", CFrame.new(-15.874, 5.709, -157.341, -0.814, -0.577, 0.064, -0.000, 0.110, 0.994, -0.581, 0.809, -0.090), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[37] = CreatePart("Normal", CFrame.new(-15.378, 4.170, -155.754, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[38] = CreatePart("Normal", CFrame.new(-17.980, 4.170, -156.627, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[39] = CreatePart("Normal", CFrame.new(-16.370, 3.070, -156.645, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[40] = CreatePart("Normal", CFrame.new(-17.031, 5.880, -155.719, -0.814, 0.577, -0.064, -0.000, -0.110, -0.994, -0.581, -0.809, 0.090), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[41] = CreatePart("Cylinder", CFrame.new(-17.399, 4.170, -156.150, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[42] = CreatePart("Normal", CFrame.new(-15.317, 5.070, -155.710, -0.581, 0.814, 0.000, 0.000, 0.000, 1.000, 0.814, 0.581, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[43] = CreatePart("Ball", CFrame.new(-17.098, 3.070, -158.208, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[44] = CreatePart("Normal", CFrame.new(-15.863, 4.170, -155.117, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[45] = CreatePart("Normal", CFrame.new(-16.428, 4.170, -156.564, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[46] = CreatePart("Normal", CFrame.new(-16.980, 5.070, -155.790, -0.814, -0.581, -0.000, -0.000, -0.000, 1.000, -0.581, 0.814, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[47] = CreatePart("Normal", CFrame.new(-16.448, 5.869, -156.537, -0.814, 0.064, 0.577, -0.000, 0.994, -0.110, -0.581, -0.090, -0.809), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[48] = CreatePart("Cylinder", CFrame.new(-17.597, 3.470, -157.336, -0.581, 0.000, 0.814, 0.000, -1.000, 0.000, 0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[49] = CreatePart("Cylinder", CFrame.new(-15.317, 3.470, -155.710, -0.581, 0.000, 0.814, 0.000, -1.000, 0.000, 0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[50] = CreatePart("Cylinder", CFrame.new(-15.317, 4.870, -155.710, -0.581, 0.000, 0.814, 0.000, -1.000, 0.000, 0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[51] = CreatePart("Normal", CFrame.new(-17.597, 3.270, -157.336, -0.581, 0.814, 0.000, 0.000, 0.000, 1.000, 0.814, 0.581, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[52] = CreatePart("Cylinder", CFrame.new(-16.980, 4.870, -155.790, -0.814, -0.581, -0.000, -0.000, -0.000, 1.000, -0.581, 0.814, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[53] = CreatePart("Ball", CFrame.new(-18.259, 3.070, -156.580, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[54] = CreatePart("Cylinder", CFrame.new(-17.597, 4.870, -157.336, -0.581, 0.000, 0.814, 0.000, -1.000, 0.000, 0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[55] = CreatePart("Cylinder", CFrame.new(-15.993, 4.170, -157.174, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[56] = CreatePart("Normal", CFrame.new(-14.934, 4.170, -156.419, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[57] = CreatePart("Cylinder", CFrame.new(-16.951, 4.170, -155.831, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[58] = CreatePart("Cylinder", CFrame.new(-16.503, 4.170, -155.512, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[59] = CreatePart("Cylinder", CFrame.new(-14.969, 4.170, -156.199, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[60] = CreatePart("Cylinder", CFrame.new(-17.875, 4.170, -156.429, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[61] = CreatePart("Normal", CFrame.new(-17.536, 4.170, -157.292, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[62] = CreatePart("Normal", CFrame.new(-16.457, 5.420, -156.523, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[63] = CreatePart("Cylinder", CFrame.new(-15.358, 4.170, -155.739, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[64] = CreatePart("Cylinder", CFrame.new(-17.249, 4.170, -157.825, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[65] = CreatePart("Cylinder", CFrame.new(-16.084, 4.170, -155.152, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[66] = CreatePart("Cylinder", CFrame.new(-17.038, 3.070, -155.709, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[67] = CreatePart("Normal", CFrame.new(-15.317, 3.270, -155.710, -0.581, 0.814, 0.000, 0.000, 0.000, 1.000, 0.814, 0.581, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[68] = CreatePart("Normal", CFrame.new(-16.936, 4.170, -155.851, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[69] = CreatePart("Normal", CFrame.new(-41.800, 0.400, -115.206, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[70] = CreatePart("Normal", CFrame.new(-37.813, 0.400, -115.519, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[71] = CreatePart("Normal", CFrame.new(-45.788, 0.400, -114.892, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[72] = CreatePart("Normal", CFrame.new(-49.776, 0.400, -114.578, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[73] = CreatePart("Normal", CFrame.new(-65.727, 0.400, -113.323, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[74] = CreatePart("Normal", CFrame.new(-61.739, 0.400, -113.637, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[75] = CreatePart("Normal", CFrame.new(-53.764, 0.400, -114.264, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[76] = CreatePart("Normal", CFrame.new(-57.752, 0.400, -113.951, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[77] = CreatePart("Normal", CFrame.new(-27.305, 4.565, -95.330, 0.165, 0.000, -0.986, 0.000, 1.000, 0.000, 0.986, 0.000, 0.165), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[78] = CreatePart("Normal", CFrame.new(-26.704, 4.544, -95.430, 0.415, 0.000, -0.910, 0.000, 1.000, 0.000, 0.910, 0.000, 0.415), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[79] = CreatePart("Cylinder", CFrame.new(-27.365, 4.550, -96.199, -0.000, 0.078, -0.997, -1.000, -0.000, 0.000, -0.000, 0.997, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[80] = CreatePart("Normal", CFrame.new(-27.480, 4.545, -97.203, -0.165, 0.000, 0.986, 0.000, 1.000, 0.000, -0.986, 0.000, -0.165), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[81] = CreatePart("Normal", CFrame.new(-27.991, 4.555, -95.276, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[82] = CreatePart("Normal", CFrame.new(-26.642, 4.665, -96.449, 0.772, 0.000, 0.636, 0.000, 1.000, 0.000, -0.636, 0.000, 0.772), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[83] = CreatePart("Normal", CFrame.new(-28.400, 4.535, -96.160, -0.995, 0.000, 0.096, 0.000, 1.000, 0.000, -0.096, 0.000, -0.995), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[84] = CreatePart("Normal", CFrame.new(-26.987, 4.645, -96.952, 0.649, 0.000, 0.760, 0.000, 1.000, 0.000, -0.760, 0.000, 0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[85] = CreatePart("Normal", CFrame.new(-26.306, 4.545, -95.921, -0.964, 0.000, 0.267, 0.000, 1.000, 0.000, -0.267, 0.000, -0.964), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[86] = CreatePart("Normal", CFrame.new(-28.016, 4.555, -96.749, -0.760, 0.000, 0.649, 0.000, 1.000, 0.000, -0.649, 0.000, -0.760), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[87] = CreatePart("Cylinder", CFrame.new(-27.396, 12.524, -96.271, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[88] = CreatePart("Cylinder", CFrame.new(-27.386, 3.459, -96.272, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[89] = CreatePart("Cylinder", CFrame.new(-27.396, 1.930, -96.271, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[90] = CreatePart("Cylinder", CFrame.new(-27.396, 5.640, -96.271, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[91] = CreatePart("Normal", CFrame.new(-44.827, 0.400, -153.798, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[92] = CreatePart("Normal", CFrame.new(-40.840, 0.400, -154.112, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[93] = CreatePart("Normal", CFrame.new(-64.766, 0.400, -152.228, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[94] = CreatePart("Normal", CFrame.new(-68.754, 0.400, -151.915, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[95] = CreatePart("Normal", CFrame.new(-60.779, 0.400, -152.542, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[96] = CreatePart("Normal", CFrame.new(-56.791, 0.400, -152.856, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[97] = CreatePart("Normal", CFrame.new(-48.816, 0.400, -153.484, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[98] = CreatePart("Normal", CFrame.new(-52.803, 0.400, -153.170, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[99] = CreatePart("Normal", CFrame.new(-57.432, 7.110, -36.154, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[100] = CreatePart("Normal", CFrame.new(-57.432, 2.760, -36.154, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[101] = CreatePart("Normal", CFrame.new(-51.915, 5.465, -36.589, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[102] = CreatePart("Normal", CFrame.new(-57.432, 5.010, -36.154, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[103] = CreatePart("Normal", CFrame.new(-57.432, 9.160, -36.154, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[104] = CreatePart("Normal", CFrame.new(-62.998, 5.465, -35.716, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[105] = CreatePart("Normal", CFrame.new(-67.467, 5.465, -35.365, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[106] = CreatePart("Normal", CFrame.new(-72.984, 2.760, -34.930, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[107] = CreatePart("Normal", CFrame.new(-72.984, 5.010, -34.930, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[108] = CreatePart("Normal", CFrame.new(-72.984, 7.110, -34.930, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[109] = CreatePart("Normal", CFrame.new(-78.550, 5.465, -34.492, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[110] = CreatePart("Normal", CFrame.new(-72.984, 9.160, -34.930, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[111] = CreatePart("Normal", CFrame.new(-66.742, 0.400, -87.354, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[112] = CreatePart("Normal", CFrame.new(-70.731, 0.400, -87.040, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[113] = CreatePart("Normal", CFrame.new(-62.754, 0.400, -87.668, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[114] = CreatePart("Normal", CFrame.new(-58.767, 0.400, -87.982, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[115] = CreatePart("Normal", CFrame.new(-78.705, 0.400, -86.413, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[116] = CreatePart("Normal", CFrame.new(-74.718, 0.400, -86.727, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[117] = CreatePart("Normal", CFrame.new(-54.778, 0.400, -88.296, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[118] = CreatePart("Normal", CFrame.new(-55.750, 4.555, -93.344, 0.415, 0.000, -0.910, 0.000, 1.000, 0.000, 0.910, 0.000, 0.415), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[119] = CreatePart("Normal", CFrame.new(-56.351, 4.575, -93.244, 0.165, 0.000, -0.986, 0.000, 1.000, 0.000, 0.986, 0.000, 0.165), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[120] = CreatePart("Normal", CFrame.new(-56.033, 4.655, -94.866, 0.649, 0.000, 0.760, 0.000, 1.000, 0.000, -0.760, 0.000, 0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[121] = CreatePart("Normal", CFrame.new(-55.352, 4.555, -93.835, -0.964, 0.000, 0.267, 0.000, 1.000, 0.000, -0.267, 0.000, -0.964), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[122] = CreatePart("Normal", CFrame.new(-56.526, 4.555, -95.117, -0.165, 0.000, 0.986, 0.000, 1.000, 0.000, -0.986, 0.000, -0.165), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[123] = CreatePart("Normal", CFrame.new(-57.446, 4.545, -94.074, -0.995, 0.000, 0.096, 0.000, 1.000, 0.000, -0.096, 0.000, -0.995), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[124] = CreatePart("Cylinder", CFrame.new(-56.411, 4.560, -94.113, -0.000, 0.078, -0.997, -1.000, -0.000, 0.000, -0.000, 0.997, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[125] = CreatePart("Normal", CFrame.new(-55.687, 4.675, -94.363, 0.772, 0.000, 0.636, 0.000, 1.000, 0.000, -0.636, 0.000, 0.772), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[126] = CreatePart("Normal", CFrame.new(-57.037, 4.565, -93.191, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[127] = CreatePart("Normal", CFrame.new(-57.062, 4.565, -94.664, -0.760, 0.000, 0.649, 0.000, 1.000, 0.000, -0.649, 0.000, -0.760), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[128] = CreatePart("Cylinder", CFrame.new(-56.442, 1.940, -94.186, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[129] = CreatePart("Cylinder", CFrame.new(-56.442, 12.544, -94.186, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[130] = CreatePart("Cylinder", CFrame.new(-56.442, 3.460, -94.186, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[131] = CreatePart("Cylinder", CFrame.new(-56.442, 5.650, -94.186, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[132] = CreatePart("Normal", CFrame.new(-28.344, 1.000, -69.484, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[133] = CreatePart("Normal", CFrame.new(-28.344, 1.000, -69.484, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[134] = CreatePart("Normal", CFrame.new(-32.813, 0.400, -102.974, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[135] = CreatePart("Normal", CFrame.new(-28.826, 0.400, -103.288, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[136] = CreatePart("Normal", CFrame.new(-16.863, 0.400, -104.229, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[137] = CreatePart("Normal", CFrame.new(-12.875, 0.400, -104.543, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[138] = CreatePart("Normal", CFrame.new(-8.887, 0.400, -104.857, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[139] = CreatePart("Normal", CFrame.new(-4.900, 0.400, -105.171, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[140] = CreatePart("Normal", CFrame.new(-24.838, 0.400, -103.602, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[141] = CreatePart("Normal", CFrame.new(-20.851, 0.400, -103.915, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[142] = CreatePart("Normal", CFrame.new(-31.905, 0.400, -90.026, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[143] = CreatePart("Normal", CFrame.new(-35.892, 0.400, -89.712, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[144] = CreatePart("Normal", CFrame.new(-67.775, 0.400, -100.213, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[145] = CreatePart("Normal", CFrame.new(-71.763, 0.400, -99.899, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[146] = CreatePart("Normal", CFrame.new(-63.786, 0.400, -100.527, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[147] = CreatePart("Normal", CFrame.new(-59.799, 0.400, -100.841, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[148] = CreatePart("Normal", CFrame.new(-79.738, 0.400, -99.272, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[149] = CreatePart("Normal", CFrame.new(-75.750, 0.400, -99.585, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[150] = CreatePart("Normal", CFrame.new(-55.811, 0.400, -101.155, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[151] = CreatePart("Normal", CFrame.new(-5.990, 0.400, -66.125, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[152] = CreatePart("Normal", CFrame.new(-9.978, 0.400, -65.811, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[153] = CreatePart("Normal", CFrame.new(-24.660, 4.534, -69.463, 0.415, 0.000, -0.910, 0.000, 1.000, 0.000, 0.910, 0.000, 0.415), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[154] = CreatePart("Normal", CFrame.new(-25.262, 4.555, -69.363, 0.165, 0.000, -0.986, 0.000, 1.000, 0.000, 0.986, 0.000, 0.165), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[155] = CreatePart("Normal", CFrame.new(-24.262, 4.535, -69.954, -0.964, 0.000, 0.267, 0.000, 1.000, 0.000, -0.267, 0.000, -0.964), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[156] = CreatePart("Normal", CFrame.new(-26.356, 4.525, -70.194, -0.995, 0.000, 0.096, 0.000, 1.000, 0.000, -0.096, 0.000, -0.995), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[157] = CreatePart("Normal", CFrame.new(-25.947, 4.545, -69.310, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[158] = CreatePart("Cylinder", CFrame.new(-25.321, 4.540, -70.232, -0.000, 0.078, -0.997, -1.000, -0.000, 0.000, -0.000, 0.997, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[159] = CreatePart("Normal", CFrame.new(-25.973, 4.545, -70.783, -0.760, 0.000, 0.649, 0.000, 1.000, 0.000, -0.649, 0.000, -0.760), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[160] = CreatePart("Normal", CFrame.new(-24.944, 4.635, -70.985, 0.649, 0.000, 0.760, 0.000, 1.000, 0.000, -0.760, 0.000, 0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[161] = CreatePart("Normal", CFrame.new(-25.437, 4.535, -71.236, -0.165, 0.000, 0.986, 0.000, 1.000, 0.000, -0.986, 0.000, -0.165), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[162] = CreatePart("Normal", CFrame.new(-24.598, 4.655, -70.483, 0.772, 0.000, 0.636, 0.000, 1.000, 0.000, -0.636, 0.000, 0.772), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[163] = CreatePart("Cylinder", CFrame.new(-25.352, 12.525, -70.305, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[164] = CreatePart("Cylinder", CFrame.new(-25.352, 5.630, -70.305, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[165] = CreatePart("Cylinder", CFrame.new(-25.342, 3.450, -70.305, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[166] = CreatePart("Cylinder", CFrame.new(-25.352, 1.920, -70.305, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[167] = CreatePart("Normal", CFrame.new(-71.741, 0.400, -48.002, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[168] = CreatePart("Normal", CFrame.new(-67.753, 0.400, -48.315, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[169] = CreatePart("Normal", CFrame.new(-78.702, 0.400, -125.251, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[170] = CreatePart("Normal", CFrame.new(-82.689, 0.400, -124.937, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[171] = CreatePart("Normal", CFrame.new(-84.250, 10.799, -65.366, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[172] = CreatePart("Normal", CFrame.new(-86.248, 1.300, -92.022, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[173] = CreatePart("Normal", CFrame.new(-84.250, 1.300, -65.366, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[174] = CreatePart("Normal", CFrame.new(-86.248, 10.800, -92.022, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[175] = CreatePart("Normal", CFrame.new(-5.885, 5.465, -40.211, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[176] = CreatePart("Normal", CFrame.new(-0.319, 5.010, -40.649, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[177] = CreatePart("Normal", CFrame.new(-0.319, 7.110, -40.649, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[178] = CreatePart("Normal", CFrame.new(-0.319, 2.760, -40.649, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[179] = CreatePart("Normal", CFrame.new(-0.319, 9.160, -40.649, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[180] = CreatePart("Normal", CFrame.new(5.198, 5.465, -41.083, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[181] = CreatePart("Normal", CFrame.new(-10.354, 5.465, -39.860, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[182] = CreatePart("Normal", CFrame.new(-21.437, 5.465, -38.987, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[183] = CreatePart("Normal", CFrame.new(-15.870, 2.760, -39.425, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[184] = CreatePart("Normal", CFrame.new(-15.870, 7.110, -39.425, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[185] = CreatePart("Normal", CFrame.new(-15.870, 5.010, -39.425, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[186] = CreatePart("Normal", CFrame.new(-15.870, 9.160, -39.425, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[187] = CreatePart("Normal", CFrame.new(-10.954, 0.399, -78.725, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[188] = CreatePart("Normal", CFrame.new(-14.941, 0.399, -78.412, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[189] = CreatePart("Normal", CFrame.new(-22.917, 0.399, -77.784, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[190] = CreatePart("Normal", CFrame.new(-18.929, 0.399, -78.098, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[191] = CreatePart("Normal", CFrame.new(-30.892, 0.399, -77.156, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[192] = CreatePart("Normal", CFrame.new(-34.880, 0.399, -76.842, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[193] = CreatePart("Normal", CFrame.new(2.478, 1.300, -99.005, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[194] = CreatePart("Normal", CFrame.new(2.478, 10.800, -99.005, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[195] = CreatePart("Normal", CFrame.new(4.475, 10.799, -72.349, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[196] = CreatePart("Normal", CFrame.new(4.475, 1.300, -72.349, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[197] = CreatePart("Normal", CFrame.new(-63.754, 0.400, -139.368, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[198] = CreatePart("Normal", CFrame.new(-67.742, 0.400, -139.055, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[199] = CreatePart("Normal", CFrame.new(-39.828, 0.400, -141.251, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[200] = CreatePart("Normal", CFrame.new(-43.815, 0.400, -140.938, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[201] = CreatePart("Normal", CFrame.new(-51.791, 0.400, -140.310, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[202] = CreatePart("Normal", CFrame.new(-47.804, 0.400, -140.624, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[203] = CreatePart("Normal", CFrame.new(-59.767, 0.400, -139.682, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[204] = CreatePart("Normal", CFrame.new(-55.779, 0.400, -139.996, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[205] = CreatePart("Normal", CFrame.new(-61.762, 0.400, -74.807, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[206] = CreatePart("Normal", CFrame.new(-57.775, 0.400, -75.121, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[207] = CreatePart("Normal", CFrame.new(-73.726, 0.400, -73.865, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[208] = CreatePart("Normal", CFrame.new(-77.713, 0.400, -73.551, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[209] = CreatePart("Normal", CFrame.new(-65.751, 0.400, -74.493, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[210] = CreatePart("Normal", CFrame.new(-69.739, 0.400, -74.179, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[211] = CreatePart("Normal", CFrame.new(-53.787, 0.400, -75.434, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[212] = CreatePart("Normal", CFrame.new(-71.730, 0.400, -138.741, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[213] = CreatePart("Normal", CFrame.new(-75.717, 0.400, -138.427, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[214] = CreatePart("Normal", CFrame.new(-66.739, 0.400, -126.192, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[215] = CreatePart("Normal", CFrame.new(-62.752, 0.400, -126.506, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[216] = CreatePart("Normal", CFrame.new(-42.813, 0.400, -128.075, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[217] = CreatePart("Normal", CFrame.new(-38.825, 0.400, -128.389, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[218] = CreatePart("Normal", CFrame.new(-46.801, 0.400, -127.761, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[219] = CreatePart("Normal", CFrame.new(-50.789, 0.400, -127.448, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[220] = CreatePart("Normal", CFrame.new(-54.777, 0.400, -127.134, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[221] = CreatePart("Normal", CFrame.new(-58.764, 0.400, -126.820, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[222] = CreatePart("Normal", CFrame.new(-18.888, 0.400, -129.958, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[223] = CreatePart("Normal", CFrame.new(-14.900, 0.400, -130.272, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[224] = CreatePart("Normal", CFrame.new(-30.851, 0.400, -129.017, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[225] = CreatePart("Normal", CFrame.new(-34.838, 0.400, -128.703, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[226] = CreatePart("Normal", CFrame.new(-10.912, 0.400, -130.586, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[227] = CreatePart("Normal", CFrame.new(-6.925, 0.400, -130.900, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[228] = CreatePart("Normal", CFrame.new(-26.863, 0.400, -129.331, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[229] = CreatePart("Normal", CFrame.new(-22.876, 0.400, -129.644, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[230] = CreatePart("Normal", CFrame.new(-63.765, 0.400, -48.629, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[231] = CreatePart("Normal", CFrame.new(-59.777, 0.400, -48.943, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[232] = CreatePart("Normal", CFrame.new(-35.841, 0.400, -141.565, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[233] = CreatePart("Normal", CFrame.new(-31.853, 0.400, -141.879, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[234] = CreatePart("Normal", CFrame.new(-11.914, 0.400, -143.448, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[235] = CreatePart("Normal", CFrame.new(-7.927, 0.400, -143.762, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[236] = CreatePart("Normal", CFrame.new(-23.878, 0.400, -142.507, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[237] = CreatePart("Normal", CFrame.new(-27.865, 0.400, -142.193, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[238] = CreatePart("Normal", CFrame.new(-19.890, 0.400, -142.821, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[239] = CreatePart("Normal", CFrame.new(-15.903, 0.400, -143.134, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[240] = CreatePart("Normal", CFrame.new(-44.776, 0.400, -102.033, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[241] = CreatePart("Normal", CFrame.new(-48.765, 0.400, -101.719, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[242] = CreatePart("Normal", CFrame.new(-36.800, 0.400, -102.661, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[243] = CreatePart("Normal", CFrame.new(-40.788, 0.400, -102.347, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[244] = CreatePart("Normal", CFrame.new(-80.716, 0.400, -150.973, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[245] = CreatePart("Normal", CFrame.new(-84.704, 0.400, -150.659, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[246] = CreatePart("Normal", CFrame.new(-25.850, 0.400, -116.461, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[247] = CreatePart("Normal", CFrame.new(-21.863, 0.400, -116.775, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[248] = CreatePart("Normal", CFrame.new(-17.875, 0.400, -117.089, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[249] = CreatePart("Normal", CFrame.new(-13.888, 0.400, -117.403, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[250] = CreatePart("Normal", CFrame.new(-29.838, 0.400, -116.147, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[251] = CreatePart("Normal", CFrame.new(-33.825, 0.400, -115.834, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[252] = CreatePart("Normal", CFrame.new(-5.912, 0.400, -118.030, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[253] = CreatePart("Normal", CFrame.new(-9.900, 0.400, -117.717, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[254] = CreatePart("Normal", CFrame.new(-64.777, 0.400, -61.489, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[255] = CreatePart("Normal", CFrame.new(-60.789, 0.400, -61.803, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[256] = CreatePart("Normal", CFrame.new(-4.977, 0.400, -53.256, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[257] = CreatePart("Normal", CFrame.new(-8.965, 0.400, -52.942, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[258] = CreatePart("Normal", CFrame.new(-85.042, 1.000, -155.344, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[259] = CreatePart("Normal", CFrame.new(-85.042, 1.000, -155.344, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[260] = CreatePart("Normal", CFrame.new(-72.742, 0.400, -151.601, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[261] = CreatePart("Normal", CFrame.new(-76.729, 0.400, -151.287, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[262] = CreatePart("Cylinder", CFrame.new(-81.969, 86.660, -81.181, -0.000, -0.078, 0.997, -1.000, 0.000, -0.000, -0.000, -0.997, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[263] = CreatePart("Normal", CFrame.new(-84.119, 42.750, -80.956, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[264] = CreatePart("Normal", CFrame.new(-15.954, 0.400, -91.278, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[265] = CreatePart("Normal", CFrame.new(-11.967, 0.400, -91.592, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[266] = CreatePart("Normal", CFrame.new(-53.668, 4.465, -66.900, 0.415, 0.000, -0.910, 0.000, 1.000, 0.000, 0.910, 0.000, 0.415), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[267] = CreatePart("Normal", CFrame.new(-54.270, 4.485, -66.799, 0.165, 0.000, -0.986, 0.000, 1.000, 0.000, 0.986, 0.000, 0.165), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[268] = CreatePart("Normal", CFrame.new(-53.606, 4.585, -67.919, 0.772, 0.000, 0.636, 0.000, 1.000, 0.000, -0.636, 0.000, 0.772), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[269] = CreatePart("Cylinder", CFrame.new(-54.330, 4.470, -67.668, -0.000, 0.078, -0.997, -1.000, -0.000, 0.000, -0.000, 0.997, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[270] = CreatePart("Normal", CFrame.new(-55.365, 4.455, -67.630, -0.995, 0.000, 0.096, 0.000, 1.000, 0.000, -0.096, 0.000, -0.995), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[271] = CreatePart("Normal", CFrame.new(-54.955, 4.475, -66.746, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[272] = CreatePart("Normal", CFrame.new(-53.271, 4.465, -67.390, -0.964, 0.000, 0.267, 0.000, 1.000, 0.000, -0.267, 0.000, -0.964), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[273] = CreatePart("Normal", CFrame.new(-54.445, 4.465, -68.672, -0.165, 0.000, 0.986, 0.000, 1.000, 0.000, -0.986, 0.000, -0.165), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[274] = CreatePart("Normal", CFrame.new(-53.952, 4.565, -68.422, 0.649, 0.000, 0.760, 0.000, 1.000, 0.000, -0.760, 0.000, 0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[275] = CreatePart("Normal", CFrame.new(-54.981, 4.475, -68.219, -0.760, 0.000, 0.649, 0.000, 1.000, 0.000, -0.649, 0.000, -0.760), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[276] = CreatePart("Cylinder", CFrame.new(-54.360, 1.850, -67.741, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[277] = CreatePart("Cylinder", CFrame.new(-54.360, 3.370, -67.741, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[278] = CreatePart("Cylinder", CFrame.new(-54.360, 12.455, -67.741, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[279] = CreatePart("Cylinder", CFrame.new(-54.360, 5.560, -67.741, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[280] = CreatePart("Normal", CFrame.new(-74.715, 0.400, -125.565, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[281] = CreatePart("Normal", CFrame.new(-70.728, 0.400, -125.878, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[282] = CreatePart("Normal", CFrame.new(-31.645, 1.000, -95.534, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[283] = CreatePart("Normal", CFrame.new(-31.645, 1.000, -95.534, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[284] = CreatePart("Normal", CFrame.new(-81.676, 0.400, -112.068, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[285] = CreatePart("Normal", CFrame.new(-77.689, 0.400, -112.381, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[286] = CreatePart("Normal", CFrame.new(-65.467, 1.861, 43.977, -0.000, 0.000, -1.000, 0.000, 1.000, -0.000, 1.000, 0.000, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[287] = CreatePart("Normal", CFrame.new(-65.467, 1.861, 37.752, -0.000, 0.000, -1.000, 0.000, 1.000, -0.000, 1.000, 0.000, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[288] = CreatePart("Normal", CFrame.new(-65.467, 6.694, 40.864, -0.000, 0.000, -1.000, 0.000, 1.000, -0.000, 1.000, 0.000, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[289] = CreatePart("Normal", CFrame.new(-19.942, 0.400, -90.965, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[290] = CreatePart("Normal", CFrame.new(-23.929, 0.400, -90.651, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[291] = CreatePart("Normal", CFrame.new(-42.852, 0.399, -76.175, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[292] = CreatePart("Normal", CFrame.new(-38.864, 0.399, -76.488, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[293] = CreatePart("Normal", CFrame.new(-39.880, 0.399, -89.398, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[294] = CreatePart("Normal", CFrame.new(-43.868, 0.399, -89.085, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[295] = CreatePart("Normal", CFrame.new(-36.853, 0.400, -154.425, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[296] = CreatePart("Normal", CFrame.new(-32.865, 0.400, -154.739, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[297] = CreatePart("Normal", CFrame.new(-20.902, 0.400, -155.681, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[298] = CreatePart("Normal", CFrame.new(-16.915, 0.400, -155.994, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[299] = CreatePart("Normal", CFrame.new(-24.890, 0.400, -155.367, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[300] = CreatePart("Normal", CFrame.new(-28.878, 0.400, -155.053, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[301] = CreatePart("Normal", CFrame.new(-8.939, 0.400, -156.622, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[302] = CreatePart("Normal", CFrame.new(-12.927, 0.400, -156.308, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[303] = CreatePart("Normal", CFrame.new(-73.702, 0.400, -112.695, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[304] = CreatePart("Normal", CFrame.new(-69.715, 0.400, -113.009, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[305] = CreatePart("Normal", CFrame.new(-21.325, 1.000, -162.006, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[306] = CreatePart("Normal", CFrame.new(-21.325, 1.000, -162.006, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[307] = CreatePart("Normal", CFrame.new(-3.990, 0.400, -92.220, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[308] = CreatePart("Normal", CFrame.new(-7.978, 0.400, -91.906, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[309] = CreatePart("Normal", CFrame.new(-2.978, 0.399, -79.353, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[310] = CreatePart("Normal", CFrame.new(-6.966, 0.399, -79.039, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[311] = CreatePart("Normal", CFrame.new(-72.753, 0.400, -60.862, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[312] = CreatePart("Normal", CFrame.new(-68.765, 0.400, -61.175, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[313] = CreatePart("Normal", CFrame.new(-52.752, 1.000, -94.869, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[314] = CreatePart("Normal", CFrame.new(-52.752, 1.000, -94.869, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[315] = CreatePart("Normal", CFrame.new(-13.966, 0.400, -65.498, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[316] = CreatePart("Normal", CFrame.new(-17.953, 0.400, -65.184, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[317] = CreatePart("Normal", CFrame.new(-42.597, 8.600, 5.494, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[318] = CreatePart("Normal", CFrame.new(-39.910, 2.700, 2.807, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[319] = CreatePart("Normal", CFrame.new(-45.284, 2.700, 8.181, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[320] = CreatePart("Normal", CFrame.new(0.081, 42.750, -87.583, 0.997, 0.078, 0.000, -0.000, 0.000, -1.000, -0.078, 0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[321] = CreatePart("Cylinder", CFrame.new(-2.068, 86.660, -87.359, 0.000, 0.078, -0.997, -1.000, 0.000, -0.000, 0.000, 0.997, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[322] = CreatePart("Normal", CFrame.new(-51.192, 1.000, -68.041, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[323] = CreatePart("Normal", CFrame.new(-51.192, 1.000, -68.041, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[324] = CreatePart("Normal", CFrame.new(-83.692, 0.400, -137.799, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[325] = CreatePart("Normal", CFrame.new(-79.704, 0.400, -138.113, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[326] = CreatePart("Normal", CFrame.new(-12.953, 0.400, -52.628, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[327] = CreatePart("Normal", CFrame.new(-16.940, 0.400, -52.314, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[328] = CreatePart("Spawn", CFrame.new(-30.000, 1.450, 40.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[329] = CreatePart("Normal", CFrame.new(-42.696, 46.890, -84.151, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[330] = CreatePart("Normal", CFrame.new(-69.986, 0.408, -67.579, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[331] = CreatePart("Normal", CFrame.new(-65.220, 0.400, -42.070, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[332] = CreatePart("Normal", CFrame.new(-66.424, 20.320, -37.687, -0.078, 0.997, -0.000, -0.000, -0.000, -1.000, -0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[333] = CreatePart("Normal", CFrame.new(-83.007, 20.315, -50.841, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[334] = CreatePart("Normal", CFrame.new(-66.265, 0.400, -54.907, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[335] = CreatePart("Normal", CFrame.new(-79.871, 1.300, -9.719, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[336] = CreatePart("Normal", CFrame.new(-77.604, 2.800, -9.828, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[337] = CreatePart("Normal", CFrame.new(-76.740, 0.400, -60.548, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[338] = CreatePart("Normal", CFrame.new(-77.604, 1.300, -9.828, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[339] = CreatePart("Normal", CFrame.new(-77.604, 10.799, -9.828, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[340] = CreatePart("Normal", CFrame.new(-79.709, 0.400, -47.359, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[341] = CreatePart("Normal", CFrame.new(-81.868, 10.800, -36.374, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[342] = CreatePart("Normal", CFrame.new(-75.728, 0.400, -47.687, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[343] = CreatePart("Normal", CFrame.new(-80.724, 0.400, -60.249, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[344] = CreatePart("Normal", CFrame.new(-79.871, 10.799, -9.719, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[345] = CreatePart("Normal", CFrame.new(-81.868, 1.300, -36.374, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[346] = CreatePart("Normal", CFrame.new(-79.871, 2.800, -9.719, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[347] = CreatePart("Normal", CFrame.new(-81.868, 2.800, -36.374, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[348] = CreatePart("Normal", CFrame.new(-42.304, 42.740, -87.828, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[349] = CreatePart("Normal", CFrame.new(-34.599, 0.200, -24.272, -0.078, 0.997, -0.000, -0.000, -0.000, -1.000, -0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[350] = CreatePart("Normal", CFrame.new(-40.777, 0.200, -103.337, -0.078, 0.997, -0.000, -0.000, -0.000, -1.000, -0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[351] = CreatePart("Normal", CFrame.new(-41.365, 40.380, -88.705, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[352] = CreatePart("Normal", CFrame.new(-52.805, 0.400, -62.442, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[353] = CreatePart("Normal", CFrame.new(-56.801, 0.400, -62.117, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[354] = CreatePart("Normal", CFrame.new(-25.912, 0.400, -64.538, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[355] = CreatePart("Normal", CFrame.new(-21.940, 0.400, -64.870, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[356] = CreatePart("Normal", CFrame.new(-19.783, 1.300, -14.379, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[357] = CreatePart("Normal", CFrame.new(-50.949, 2.800, -11.826, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[358] = CreatePart("Normal", CFrame.new(-50.949, 10.800, -11.826, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[359] = CreatePart("Normal", CFrame.new(-20.928, 0.400, -52.001, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[360] = CreatePart("Normal", CFrame.new(-19.783, 2.800, -14.379, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[361] = CreatePart("Normal", CFrame.new(-55.789, 0.400, -49.257, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[362] = CreatePart("Normal", CFrame.new(-51.791, 0.400, -49.557, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[363] = CreatePart("Normal", CFrame.new(-19.783, 10.799, -14.379, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[364] = CreatePart("Normal", CFrame.new(-50.812, 2.800, -39.020, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[365] = CreatePart("Normal", CFrame.new(-48.694, 2.800, -12.104, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[366] = CreatePart("Normal", CFrame.new(-22.038, 1.300, -14.101, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[367] = CreatePart("Normal", CFrame.new(-24.156, 2.800, -41.018, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[368] = CreatePart("Normal", CFrame.new(-24.156, 1.300, -41.018, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[369] = CreatePart("Normal", CFrame.new(-22.038, 2.800, -14.101, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[370] = CreatePart("Normal", CFrame.new(-48.694, 10.799, -12.104, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[371] = CreatePart("Normal", CFrame.new(-50.949, 1.300, -11.826, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[372] = CreatePart("Normal", CFrame.new(-24.871, 0.400, -51.640, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[373] = CreatePart("Normal", CFrame.new(-50.812, 1.300, -39.020, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[374] = CreatePart("Normal", CFrame.new(-48.694, 1.300, -12.104, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[375] = CreatePart("Normal", CFrame.new(-24.156, 10.800, -41.018, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[376] = CreatePart("Normal", CFrame.new(-37.504, 0.400, -40.026, -0.078, 0.997, -0.000, -0.000, -0.000, -1.000, -0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[377] = CreatePart("Normal", CFrame.new(-50.812, 10.799, -39.020, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[378] = CreatePart("Normal", CFrame.new(-22.038, 10.800, -14.101, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[379] = CreatePart("Normal", CFrame.new(-8.598, 20.295, -42.238, -0.078, 0.997, -0.000, -0.000, -0.000, -1.000, -0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[380] = CreatePart("Normal", CFrame.new(-0.989, 0.400, -53.570, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[381] = CreatePart("Normal", CFrame.new(-12.421, 0.400, -46.195, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[382] = CreatePart("Normal", CFrame.new(-13.428, 0.400, -59.051, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[383] = CreatePart("Normal", CFrame.new(-2.002, 0.400, -66.439, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[384] = CreatePart("Normal", CFrame.new(2.760, 0.400, -57.095, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[385] = CreatePart("Normal", CFrame.new(6.872, 10.800, -16.376, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[386] = CreatePart("Normal", CFrame.new(6.856, 10.800, -43.357, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[387] = CreatePart("Normal", CFrame.new(6.872, 1.300, -16.376, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[388] = CreatePart("Normal", CFrame.new(6.872, 2.800, -16.376, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[389] = CreatePart("Normal", CFrame.new(8.854, 10.799, -16.702, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[390] = CreatePart("Normal", CFrame.new(6.856, 2.800, -43.357, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[391] = CreatePart("Normal", CFrame.new(8.854, 1.300, -16.702, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[392] = CreatePart("Normal", CFrame.new(6.856, 1.300, -43.357, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[393] = CreatePart("Normal", CFrame.new(5.693, 20.265, -57.816, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[394] = CreatePart("Normal", CFrame.new(8.854, 2.800, -16.702, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[395] = CreatePart("Normal", CFrame.new(3.761, 16.620, -85.690, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[396] = CreatePart("Normal", CFrame.new(-85.478, 0.399, -114.988, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[397] = CreatePart("Normal", CFrame.new(-45.293, 0.400, -134.348, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[398] = CreatePart("Normal", CFrame.new(-89.045, 21.290, -127.493, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[399] = CreatePart("Normal", CFrame.new(-66.261, 0.400, -80.913, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[400] = CreatePart("Normal", CFrame.new(-44.261, 0.400, -121.479, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[401] = CreatePart("Normal", CFrame.new(-43.284, 0.400, -108.621, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[402] = CreatePart("Normal", CFrame.new(-85.333, 17.990, -78.678, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[403] = CreatePart("Normal", CFrame.new(-81.184, 0.400, -86.173, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[404] = CreatePart("Normal", CFrame.new(-40.165, 0.408, -95.886, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[405] = CreatePart("Normal", CFrame.new(-26.913, 0.400, -83.950, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[406] = CreatePart("Normal", CFrame.new(-54.033, 0.400, -68.875, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[407] = CreatePart("Normal", CFrame.new(-32.405, 32.230, -71.284, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[408] = CreatePart("Normal", CFrame.new(-26.904, 0.399, -77.470, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[409] = CreatePart("Normal", CFrame.new(-51.300, 0.399, -88.500, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[410] = CreatePart("Normal", CFrame.new(-49.793, 0.399, -75.669, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[411] = CreatePart("Normal", CFrame.new(-52.297, 0.400, -101.441, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[412] = CreatePart("Normal", CFrame.new(-46.324, 0.419, -75.942, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[413] = CreatePart("Normal", CFrame.new(-37.401, 0.400, -70.134, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[414] = CreatePart("Normal", CFrame.new(-27.917, 0.400, -90.337, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[415] = CreatePart("Normal", CFrame.new(-47.855, 0.399, -88.771, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[416] = CreatePart("Normal", CFrame.new(-0.320, 20.290, -134.476, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[417] = CreatePart("Normal", CFrame.new(-10.051, 0.400, -72.287, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[418] = CreatePart("Normal", CFrame.new(-3.250, 0.400, -134.426, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[419] = CreatePart("Normal", CFrame.new(0.443, 0.400, -86.097, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[420] = CreatePart("Normal", CFrame.new(-47.169, 21.290, -162.638, 0.078, -0.997, -0.000, 0.000, 0.000, -1.000, 0.997, 0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[421] = CreatePart("Normal", CFrame.new(-46.316, 0.400, -147.212, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[422] = CreatePart("Normal", CFrame.new(-47.338, 0.400, -160.067, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[423] = CreatePart("Normal", CFrame.new(-7.667, 0.730, -158.368, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[424] = CreatePart("Normal", CFrame.new(-8.967, 1.245, -158.180, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[425] = CreatePart("Normal", CFrame.new(-14.330, 1.580, -157.759, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[426] = CreatePart("Normal", CFrame.new(-8.311, 0.955, -158.262, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[427] = CreatePart("Normal", CFrame.new(0.996, 26.680, -117.066, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[428] = CreatePart("Normal", CFrame.new(0.996, 26.480, -117.066, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[429] = CreatePart("Normal", CFrame.new(0.996, 26.280, -117.066, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[430] = CreatePart("Normal", CFrame.new(0.983, 20.980, -117.045, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[431] = CreatePart("Normal", CFrame.new(-87.394, 25.430, -119.328, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[432] = CreatePart("Normal", CFrame.new(-87.394, 25.630, -119.328, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[433] = CreatePart("Normal", CFrame.new(-87.408, 19.930, -119.306, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[434] = CreatePart("Normal", CFrame.new(-87.394, 25.230, -119.328, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[435] = CreatePart("Normal", CFrame.new(-66.316, 3.462, -142.946, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[436] = CreatePart("Normal", CFrame.new(-66.316, 4.962, -142.946, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[437] = CreatePart("Cylinder", CFrame.new(-64.101, 36.591, -39.881, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[438] = CreatePart("Ball", CFrame.new(-64.097, 36.260, -39.871, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[439] = CreatePart("Cylinder", CFrame.new(-64.138, 38.523, -39.897, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[440] = CreatePart("Normal", CFrame.new(-56.209, 3.500, -140.802, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[441] = CreatePart("Normal", CFrame.new(-56.209, 5.000, -140.802, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[442] = CreatePart("Normal", CFrame.new(-5.671, 22.100, -84.908, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[443] = CreatePart("Normal", CFrame.new(-5.627, 23.327, -84.908, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[444] = CreatePart("Normal", CFrame.new(-76.958, 11.507, 12.547, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[445] = CreatePart("Normal", CFrame.new(-76.958, 16.685, 12.547, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[446] = CreatePart("Normal", CFrame.new(-83.134, 6.270, -95.729, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[447] = CreatePart("Normal", CFrame.new(-83.134, 9.028, -95.729, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[448] = CreatePart("Normal", CFrame.new(-5.599, 39.680, -148.645, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[449] = CreatePart("Normal", CFrame.new(-5.599, 39.280, -148.645, -0.000, 0.997, 0.078, -1.000, -0.000, -0.000, 0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[450] = CreatePart("Normal", CFrame.new(-5.599, 39.480, -148.645, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[451] = CreatePart("Normal", CFrame.new(-5.613, 33.980, -148.624, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[452] = CreatePart("Normal", CFrame.new(-77.021, 11.597, 28.244, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[453] = CreatePart("Normal", CFrame.new(-77.021, 16.920, 28.244, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[454] = CreatePart("Cylinder", CFrame.new(-85.256, -3.911, 28.596, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[455] = CreatePart("Ball", CFrame.new(-85.256, -3.922, 28.596, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[456] = CreatePart("Cylinder", CFrame.new(-85.256, -3.887, 28.596, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[457] = CreatePart("Cylinder", CFrame.new(-85.256, -3.896, 28.596, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[458] = CreatePart("Cylinder", CFrame.new(-88.839, 2.488, -149.646, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[459] = CreatePart("Cylinder", CFrame.new(-81.681, 1.685, -143.558, 0.997, -0.078, -0.000, -0.000, -0.000, 1.000, -0.078, -0.997, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[460] = CreatePart("Cylinder", CFrame.new(-82.509, 0.783, -156.717, -0.997, 0.078, -0.000, 0.000, 0.000, 1.000, 0.078, 0.997, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[461] = CreatePart("Cylinder", CFrame.new(-82.509, 1.685, -156.717, -0.997, 0.078, -0.000, 0.000, 0.000, 1.000, 0.078, 0.997, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[462] = CreatePart("Normal", CFrame.new(-82.141, 2.350, -150.123, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[463] = CreatePart("Cylinder", CFrame.new(-75.485, 2.488, -150.697, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[464] = CreatePart("Cylinder", CFrame.new(-75.485, 0.783, -150.697, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[465] = CreatePart("Normal", CFrame.new(-82.122, 0.449, -150.166, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[466] = CreatePart("Cylinder", CFrame.new(-75.485, 1.685, -150.697, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[467] = CreatePart("Cylinder", CFrame.new(-81.703, 0.783, -143.556, 0.997, -0.078, -0.000, -0.000, -0.000, 1.000, -0.078, -0.997, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[468] = CreatePart("Cylinder", CFrame.new(-81.685, 2.488, -143.557, 0.997, -0.078, -0.000, -0.000, -0.000, 1.000, -0.078, -0.997, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[469] = CreatePart("Cylinder", CFrame.new(-82.509, 2.488, -156.717, -0.997, 0.078, -0.000, 0.000, 0.000, 1.000, 0.078, 0.997, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[470] = CreatePart("Cylinder", CFrame.new(-88.839, 1.685, -149.646, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[471] = CreatePart("Cylinder", CFrame.new(-88.839, 0.783, -149.646, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[472] = CreatePart("Normal", CFrame.new(-68.500, 8.656, 41.136, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[473] = CreatePart("Normal", CFrame.new(-68.500, 8.656, 41.136, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[474] = CreatePart("Normal", CFrame.new(-68.500, 3.518, 42.420, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[475] = CreatePart("Normal", CFrame.new(-68.500, 8.656, 44.989, 0.000, -0.707, -0.707, 0.000, 0.707, -0.707, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[476] = CreatePart("Normal", CFrame.new(-68.500, 3.518, 39.852, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[477] = CreatePart("Normal", CFrame.new(-68.500, 8.656, 37.283, 0.000, -0.707, -0.707, 0.000, 0.707, -0.707, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[478] = CreatePart("Normal", CFrame.new(-68.500, 12.509, 41.136, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[479] = CreatePart("Normal", CFrame.new(-88.151, 33.980, -142.128, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[480] = CreatePart("Normal", CFrame.new(-88.137, 39.280, -142.150, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[481] = CreatePart("Normal", CFrame.new(-88.137, 39.480, -142.150, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[482] = CreatePart("Normal", CFrame.new(-88.137, 39.680, -142.150, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[483] = CreatePart("Ball", CFrame.new(-84.100, -1.426, 32.136, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[484] = CreatePart("Cylinder", CFrame.new(-84.100, -1.206, 32.136, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[485] = CreatePart("Cylinder", CFrame.new(-84.100, -0.766, 32.136, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[486] = CreatePart("Cylinder", CFrame.new(-84.100, -0.942, 32.136, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[487] = CreatePart("Normal", CFrame.new(-31.207, 32.559, 7.707, -0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[488] = CreatePart("Normal", CFrame.new(-88.675, 35.980, -122.025, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[489] = CreatePart("Normal", CFrame.new(-88.661, 41.280, -122.047, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[490] = CreatePart("Normal", CFrame.new(-88.661, 41.680, -122.047, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[491] = CreatePart("Normal", CFrame.new(-88.661, 41.480, -122.047, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[492] = CreatePart("Normal", CFrame.new(-45.363, 27.097, -160.083, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[493] = CreatePart("Normal", CFrame.new(-45.346, 27.079, -160.084, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[494] = CreatePart("Normal", CFrame.new(-3.024, 33.980, -115.726, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[495] = CreatePart("Normal", CFrame.new(-3.010, 39.480, -115.747, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[496] = CreatePart("Normal", CFrame.new(-3.010, 39.680, -115.747, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[497] = CreatePart("Normal", CFrame.new(-3.010, 39.280, -115.747, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[498] = CreatePart("Normal", CFrame.new(-56.590, 0.550, -49.702, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[499] = CreatePart("Normal", CFrame.new(-73.504, 0.550, -48.371, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[500] = CreatePart("Normal", CFrame.new(-22.362, 0.550, -52.396, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[501] = CreatePart("Normal", CFrame.new(-39.409, 0.550, -51.054, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[502] = CreatePart("Normal", CFrame.new(-5.314, 0.550, -53.738, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[503] = CreatePart("Normal", CFrame.new(-79.731, 0.550, -127.493, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[504] = CreatePart("Normal", CFrame.new(-62.817, 0.550, -128.824, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[505] = CreatePart("Normal", CFrame.new(-45.636, 0.550, -130.176, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[506] = CreatePart("Normal", CFrame.new(-28.589, 0.550, -131.518, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[507] = CreatePart("Normal", CFrame.new(-11.541, 0.550, -132.859, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[508] = CreatePart("Cylinder", CFrame.new(-5.320, 38.523, -44.526, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[509] = CreatePart("Ball", CFrame.new(-5.279, 36.260, -44.500, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[510] = CreatePart("Cylinder", CFrame.new(-5.283, 36.591, -44.510, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[511] = CreatePart("Normal", CFrame.new(-3.147, 21.500, -79.970, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[512] = CreatePart("Normal", CFrame.new(-4.010, 21.500, -90.936, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[513] = CreatePart("Normal", CFrame.new(-3.579, 16.000, -85.453, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[514] = CreatePart("Normal", CFrame.new(-58.634, 0.550, -75.669, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[515] = CreatePart("Normal", CFrame.new(-75.548, 0.550, -74.338, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[516] = CreatePart("Normal", CFrame.new(-41.453, 0.550, -77.021, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[517] = CreatePart("Normal", CFrame.new(-24.406, 0.550, -78.363, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[518] = CreatePart("Normal", CFrame.new(-7.358, 0.550, -79.704, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[519] = CreatePart("Cylinder", CFrame.new(139.000, 35.350, -322.800, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[520] = CreatePart("Ball", CFrame.new(139.000, 35.100, -322.800, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[521] = CreatePart("Cylinder", CFrame.new(139.000, 35.850, -322.800, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[522] = CreatePart("Cylinder", CFrame.new(139.000, 35.650, -322.800, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[523] = CreatePart("Normal", CFrame.new(-85.783, 39.280, -112.242, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[524] = CreatePart("Normal", CFrame.new(-85.797, 33.980, -112.221, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[525] = CreatePart("Normal", CFrame.new(-85.783, 39.480, -112.242, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[526] = CreatePart("Normal", CFrame.new(-85.783, 39.680, -112.242, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[527] = CreatePart("Normal", CFrame.new(-34.793, 32.559, 7.603, -0.000, 0.000, -1.000, 0.000, 1.000, -0.000, 1.000, 0.000, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[528] = CreatePart("Normal", CFrame.new(-66.800, 1.050, 12.691, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[529] = CreatePart("Normal", CFrame.new(-66.800, 1.050, 28.691, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[530] = CreatePart("Normal", CFrame.new(-34.500, 0.300, 24.963, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[531] = CreatePart("Normal", CFrame.new(-80.295, 9.123, -61.300, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[532] = CreatePart("Normal", CFrame.new(-80.466, 2.480, -62.280, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[533] = CreatePart("Normal", CFrame.new(-80.388, 6.440, -61.293, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[534] = CreatePart("Normal", CFrame.new(-80.388, 9.410, -61.293, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[535] = CreatePart("Normal", CFrame.new(-80.621, 6.440, -64.254, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[536] = CreatePart("Normal", CFrame.new(-80.310, 2.480, -60.306, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[537] = CreatePart("Normal", CFrame.new(-80.388, 6.440, -61.293, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[538] = CreatePart("Normal", CFrame.new(-80.155, 6.440, -58.332, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[539] = CreatePart("Normal", CFrame.new(-8.321, 24.280, -44.259, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[540] = CreatePart("Normal", CFrame.new(-54.825, 6.443, -44.142, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[541] = CreatePart("Normal", CFrame.new(-54.825, 9.411, -44.142, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[542] = CreatePart("Normal", CFrame.new(-57.784, 6.443, -43.909, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[543] = CreatePart("Normal", CFrame.new(-55.811, 2.486, -44.064, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[544] = CreatePart("Normal", CFrame.new(-54.825, 6.443, -44.142, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[545] = CreatePart("Normal", CFrame.new(-54.853, 9.733, -44.497, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[546] = CreatePart("Normal", CFrame.new(-53.839, 2.486, -44.219, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[547] = CreatePart("Normal", CFrame.new(-51.867, 6.443, -44.375, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[548] = CreatePart("Normal", CFrame.new(-54.848, 9.199, -44.438, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[549] = CreatePart("Normal", CFrame.new(-65.212, 6.923, 40.864, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[550] = CreatePart("Normal", CFrame.new(-60.791, 0.550, -103.082, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[551] = CreatePart("Normal", CFrame.new(-60.791, 0.550, -103.082, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[552] = CreatePart("Normal", CFrame.new(-77.705, 0.550, -101.751, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[553] = CreatePart("Normal", CFrame.new(-85.655, 23.280, -111.249, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[554] = CreatePart("Normal", CFrame.new(-26.484, 0.550, -104.779, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[555] = CreatePart("Normal", CFrame.new(-43.611, 0.550, -104.434, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[556] = CreatePart("Normal", CFrame.new(-9.437, 0.550, -106.120, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[557] = CreatePart("Normal", CFrame.new(-6.032, 2.116, -84.758, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[558] = CreatePart("Normal", CFrame.new(-4.431, 22.975, -84.991, 0.000, 0.050, -0.999, -0.000, 0.999, 0.050, 1.000, -0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[559] = CreatePart("Normal", CFrame.new(0.156, 23.780, -114.993, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[560] = CreatePart("Normal", CFrame.new(-72.329, 22.780, -158.596, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[561] = CreatePart("Normal", CFrame.new(-88.087, 23.280, -142.154, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[562] = CreatePart("Normal", CFrame.new(-71.140, 3.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[563] = CreatePart("Normal", CFrame.new(-69.640, 3.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[564] = CreatePart("Normal", CFrame.new(-71.640, 1.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[565] = CreatePart("Normal", CFrame.new(-71.140, 3.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[566] = CreatePart("Normal", CFrame.new(-71.140, 5.000, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[567] = CreatePart("Normal", CFrame.new(-72.640, 3.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[568] = CreatePart("Normal", CFrame.new(-70.640, 1.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[569] = CreatePart("Normal", CFrame.new(-86.710, 4.283, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[570] = CreatePart("Normal", CFrame.new(-85.884, 3.011, -154.869, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[571] = CreatePart("Normal", CFrame.new(-86.710, 4.274, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[572] = CreatePart("Normal", CFrame.new(-86.710, 3.011, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[573] = CreatePart("Normal", CFrame.new(-86.710, 3.011, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[574] = CreatePart("Normal", CFrame.new(-86.710, 4.783, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[575] = CreatePart("Normal", CFrame.new(-86.986, 1.315, -153.580, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[576] = CreatePart("Normal", CFrame.new(-86.435, 1.315, -154.224, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[577] = CreatePart("Normal", CFrame.new(-87.536, 3.011, -152.935, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[578] = CreatePart("Normal", CFrame.new(-86.710, 4.783, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[579] = CreatePart("Normal", CFrame.new(-86.609, 3.905, -148.549, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[580] = CreatePart("Normal", CFrame.new(-88.213, 4.703, -148.423, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[581] = CreatePart("Normal", CFrame.new(-20.489, 22.780, -162.676, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[582] = CreatePart("Normal", CFrame.new(-2.506, 23.800, -148.809, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[583] = CreatePart("Normal", CFrame.new(-44.841, 39.901, -147.080, 0.997, -0.078, -0.000, -0.000, -0.000, 1.000, -0.078, -0.997, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[584] = CreatePart("Normal", CFrame.new(-44.692, 40.228, -146.565, 0.997, -0.078, 0.000, 0.000, 0.000, 1.000, -0.078, -0.997, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[585] = CreatePart("Normal", CFrame.new(-17.235, 3.500, -147.314, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[586] = CreatePart("Normal", CFrame.new(-16.736, 1.500, -147.353, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[587] = CreatePart("Normal", CFrame.new(-17.235, 5.000, -147.314, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[588] = CreatePart("Normal", CFrame.new(-17.237, 5.512, -147.267, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[589] = CreatePart("Normal", CFrame.new(-17.733, 1.500, -147.275, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[590] = CreatePart("Normal", CFrame.new(-17.235, 3.500, -147.314, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[591] = CreatePart("Normal", CFrame.new(-15.739, 3.500, -147.432, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[592] = CreatePart("Normal", CFrame.new(-18.730, 3.500, -147.196, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[593] = CreatePart("Normal", CFrame.new(-12.443, 3.500, -150.154, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[594] = CreatePart("Normal", CFrame.new(-12.443, 5.500, -150.154, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[595] = CreatePart("Normal", CFrame.new(-12.941, 1.500, -150.115, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[596] = CreatePart("Normal", CFrame.new(-12.445, 5.513, -150.107, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[597] = CreatePart("Normal", CFrame.new(-11.944, 1.500, -150.193, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[598] = CreatePart("Normal", CFrame.new(-12.443, 3.500, -150.154, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[599] = CreatePart("Normal", CFrame.new(-12.443, 5.000, -150.154, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[600] = CreatePart("Normal", CFrame.new(-10.947, 3.500, -150.272, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[601] = CreatePart("Normal", CFrame.new(-13.938, 3.500, -150.036, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[602] = CreatePart("Normal", CFrame.new(-22.137, 5.313, -145.879, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[603] = CreatePart("Normal", CFrame.new(-22.626, 1.500, -145.728, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[604] = CreatePart("Normal", CFrame.new(-22.095, 5.723, -145.763, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[605] = CreatePart("Normal", CFrame.new(-21.629, 1.500, -145.806, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[606] = CreatePart("Normal", CFrame.new(-22.128, 3.500, -145.767, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[607] = CreatePart("Normal", CFrame.new(-22.128, 3.500, -145.767, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[608] = CreatePart("Normal", CFrame.new(-23.623, 3.500, -145.649, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[609] = CreatePart("Normal", CFrame.new(-20.633, 3.500, -145.885, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[610] = CreatePart("Normal", CFrame.new(-22.128, 5.000, -145.767, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[611] = CreatePart("Normal", CFrame.new(-27.004, 6.870, -143.541, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[612] = CreatePart("Normal", CFrame.new(-25.447, 3.500, -143.329, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[613] = CreatePart("Normal", CFrame.new(-28.438, 3.500, -143.093, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[614] = CreatePart("Normal", CFrame.new(-27.441, 1.500, -143.172, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[615] = CreatePart("Normal", CFrame.new(-26.444, 1.500, -143.250, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[616] = CreatePart("Normal", CFrame.new(-26.944, 5.512, -143.164, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[617] = CreatePart("Normal", CFrame.new(-26.942, 3.500, -143.211, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[618] = CreatePart("Normal", CFrame.new(-26.942, 3.500, -143.211, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[619] = CreatePart("Normal", CFrame.new(-26.942, 5.000, -143.211, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[620] = CreatePart("Normal", CFrame.new(-61.140, 3.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[621] = CreatePart("Normal", CFrame.new(-60.827, 5.910, -141.916, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[622] = CreatePart("Normal", CFrame.new(-61.640, 1.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[623] = CreatePart("Normal", CFrame.new(-62.640, 3.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[624] = CreatePart("Normal", CFrame.new(-60.640, 1.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[625] = CreatePart("Normal", CFrame.new(-61.140, 3.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[626] = CreatePart("Normal", CFrame.new(-61.140, 5.000, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[627] = CreatePart("Normal", CFrame.new(-59.640, 3.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[628] = CreatePart("Normal", CFrame.new(-44.768, 21.900, -148.577, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[629] = CreatePart("Normal", CFrame.new(-47.161, 5.100, -148.389, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[630] = CreatePart("Normal", CFrame.new(-51.946, 14.700, -148.012, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[631] = CreatePart("Normal", CFrame.new(-37.591, 14.650, -149.143, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[632] = CreatePart("Normal", CFrame.new(-44.768, 14.700, -148.577, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[633] = CreatePart("Normal", CFrame.new(-44.768, 14.700, -148.577, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[634] = CreatePart("Normal", CFrame.new(-42.376, 5.100, -148.766, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), workspace) end) end)
local maxWait = 3.0
local start = os.clock()
while os.clock() - start < maxWait do
    local completed = true
    for i = 1, 634 do
        if not generatedParts[i] then completed = false break end
    end
    if completed then break end
    task.wait(0.05)
end
if generatedParts[1] then
    table.insert(resizes, {['Part'] = generatedParts[1], ['CFrame'] = (origin + offset) * CFrame.new(-49.580, 4.800, -35.418, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[1], ['Color'] = Color3.new(0.843, 0.773, 0.604), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[1], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[1], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[1], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[1], ['Name'] = "Handle"})
end
if generatedParts[2] then
    table.insert(resizes, {['Part'] = generatedParts[2], ['CFrame'] = (origin + offset) * CFrame.new(-49.081, 1.300, -35.439, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[2], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[2], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[2], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[2], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[2], ['Name'] = "Middle"})
end
if generatedParts[3] then
    table.insert(resizes, {['Part'] = generatedParts[3], ['CFrame'] = (origin + offset) * CFrame.new(-51.079, 3.300, -35.354, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[3], ['Color'] = Color3.new(0.949, 0.953, 0.953), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[3], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[3], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[3], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[3], ['Name'] = "Middle"})
end
if generatedParts[4] then
    table.insert(resizes, {['Part'] = generatedParts[4], ['CFrame'] = (origin + offset) * CFrame.new(-50.080, 1.300, -35.396, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[4], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[4], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[4], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[4], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[4], ['Name'] = "Middle"})
end
if generatedParts[5] then
    table.insert(resizes, {['Part'] = generatedParts[5], ['CFrame'] = (origin + offset) * CFrame.new(-49.580, 3.300, -35.418, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[5], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[5], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[5], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[5], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[5], ['Name'] = "Middle"})
end
if generatedParts[6] then
    table.insert(resizes, {['Part'] = generatedParts[6], ['CFrame'] = (origin + offset) * CFrame.new(-49.580, 4.800, -35.418, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[6], ['Color'] = Color3.new(0.800, 0.557, 0.412), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[6], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[6], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[6], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[6], ['Name'] = "Part"})
end
if generatedParts[7] then
    table.insert(resizes, {['Part'] = generatedParts[7], ['CFrame'] = (origin + offset) * CFrame.new(-48.082, 3.300, -35.482, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[7], ['Color'] = Color3.new(0.949, 0.953, 0.953), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[7], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[7], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[7], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[7], ['Name'] = "Middle"})
end
if generatedParts[8] then
    table.insert(resizes, {['Part'] = generatedParts[8], ['CFrame'] = (origin + offset) * CFrame.new(-51.079, 3.300, -35.354, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[8], ['Color'] = Color3.new(0.961, 0.804, 0.188), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[8], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[8], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[8], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[8], ['Name'] = "Right Arm"})
end
if generatedParts[9] then
    table.insert(resizes, {['Part'] = generatedParts[9], ['CFrame'] = (origin + offset) * CFrame.new(-49.081, 1.300, -35.439, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[9], ['Color'] = Color3.new(0.294, 0.592, 0.294), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[9], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[9], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[9], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[9], ['Name'] = "Left Leg"})
end
if generatedParts[10] then
    table.insert(resizes, {['Part'] = generatedParts[10], ['CFrame'] = (origin + offset) * CFrame.new(-49.580, 4.800, -35.418, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[10], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[10], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.980, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[10], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[10], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[10], ['Name'] = "Head"})
end
if generatedParts[11] then
    table.insert(resizes, {['Part'] = generatedParts[11], ['CFrame'] = (origin + offset) * CFrame.new(-50.080, 1.300, -35.396, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[11], ['Color'] = Color3.new(0.294, 0.592, 0.294), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[11], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[11], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[11], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[11], ['Name'] = "Right Leg"})
end
if generatedParts[12] then
    table.insert(resizes, {['Part'] = generatedParts[12], ['CFrame'] = (origin + offset) * CFrame.new(-48.082, 3.300, -35.482, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[12], ['Color'] = Color3.new(0.961, 0.804, 0.188), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[12], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[12], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[12], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[12], ['Name'] = "Left Arm"})
end
if generatedParts[13] then
    table.insert(resizes, {['Part'] = generatedParts[13], ['CFrame'] = (origin + offset) * CFrame.new(-49.580, 3.300, -35.418, -0.999, 0.000, -0.043, 0.000, 1.000, 0.000, 0.043, 0.000, -0.999), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[13], ['Color'] = Color3.new(0.051, 0.412, 0.675), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[13], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[13], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[13], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[13], ['Name'] = "Torso"})
end
if generatedParts[14] then
    table.insert(resizes, {['Part'] = generatedParts[14], ['CFrame'] = (origin + offset) * CFrame.new(-21.998, 5.797, 6.160, -0.999, 0.000, 0.034, 0.000, 1.000, 0.000, -0.034, 0.000, -0.999), ['Size'] = Vector3.new(2.000, 0.400, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[14], ['Color'] = Color3.new(0.294, 0.592, 0.294), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[14], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[14], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[14], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[14], ['Name'] = "Part"})
end
if generatedParts[15] then
    table.insert(resizes, {['Part'] = generatedParts[15], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 4.300, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[15], ['Color'] = Color3.new(1.000, 0.800, 0.600), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[15], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[15], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[15], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[15], ['Name'] = "Torso"})
end
if generatedParts[16] then
    table.insert(resizes, {['Part'] = generatedParts[16], ['CFrame'] = (origin + offset) * CFrame.new(-20.500, 4.300, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[16], ['Color'] = Color3.new(1.000, 0.800, 0.600), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[16], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[16], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[16], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[16], ['Name'] = "Left Arm"})
end
if generatedParts[17] then
    table.insert(resizes, {['Part'] = generatedParts[17], ['CFrame'] = (origin + offset) * CFrame.new(-22.500, 2.300, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[17], ['Color'] = Color3.new(1.000, 0.800, 0.600), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[17], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[17], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[17], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[17], ['Name'] = "Right Leg"})
end
if generatedParts[18] then
    table.insert(resizes, {['Part'] = generatedParts[18], ['CFrame'] = (origin + offset) * CFrame.new(-21.500, 2.300, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[18], ['Color'] = Color3.new(1.000, 0.800, 0.600), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[18], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[18], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[18], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[18], ['Name'] = "Left Leg"})
end
if generatedParts[19] then
    table.insert(resizes, {['Part'] = generatedParts[19], ['CFrame'] = (origin + offset) * CFrame.new(-23.500, 4.300, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[19], ['Color'] = Color3.new(1.000, 0.800, 0.600), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[19], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[19], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[19], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[19], ['Name'] = "Right Arm"})
end
if generatedParts[20] then
    table.insert(resizes, {['Part'] = generatedParts[20], ['CFrame'] = (origin + offset) * CFrame.new(-22.000, 5.800, 6.155, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[20], ['Color'] = Color3.new(1.000, 0.800, 0.600), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[20], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[20], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[20], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[20], ['Name'] = "Head"})
end
if generatedParts[21] then
    table.insert(resizes, {['Part'] = generatedParts[21], ['CFrame'] = (origin + offset) * CFrame.new(-17.051, 4.170, -157.929, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), ['Size'] = Vector3.new(2.200, 0.400, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[21], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[21], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[21], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[21], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[21], ['Name'] = "Part"})
end
if generatedParts[22] then
    table.insert(resizes, {['Part'] = generatedParts[22], ['CFrame'] = (origin + offset) * CFrame.new(-16.457, 5.770, -156.523, 0.814, 0.000, -0.581, 0.000, 1.000, 0.000, 0.581, 0.000, 0.814), ['Size'] = Vector3.new(2.000, 0.200, 1.800)})
    table.insert(colors, {['Part'] = generatedParts[22], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[22], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[22], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[22], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[22], ['Name'] = "Wedge"})
end
if generatedParts[23] then
    table.insert(resizes, {['Part'] = generatedParts[23], ['CFrame'] = (origin + offset) * CFrame.new(-17.597, 5.070, -157.336, -0.581, 0.814, 0.000, 0.000, 0.000, 1.000, 0.814, 0.581, -0.000), ['Size'] = Vector3.new(1.200, 0.200, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[23], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[23], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[23], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[23], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[23], ['Name'] = "Part"})
end
if generatedParts[24] then
    table.insert(resizes, {['Part'] = generatedParts[24], ['CFrame'] = (origin + offset) * CFrame.new(-15.817, 3.070, -154.838, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), ['Size'] = Vector3.new(0.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[24], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[24], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[24], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[24], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[24], ['Name'] = "Part"})
end
if generatedParts[25] then
    table.insert(resizes, {['Part'] = generatedParts[25], ['CFrame'] = (origin + offset) * CFrame.new(-15.236, 3.070, -155.652, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), ['Size'] = Vector3.new(2.000, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[25], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[25], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[25], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[25], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[25], ['Name'] = "Part"})
end
if generatedParts[26] then
    table.insert(resizes, {['Part'] = generatedParts[26], ['CFrame'] = (origin + offset) * CFrame.new(-16.457, 5.420, -156.523, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), ['Size'] = Vector3.new(3.200, 0.300, 2.200)})
    table.insert(colors, {['Part'] = generatedParts[26], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[26], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[26], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[26], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[26], ['Name'] = "Part"})
end
if generatedParts[27] then
    table.insert(resizes, {['Part'] = generatedParts[27], ['CFrame'] = (origin + offset) * CFrame.new(-15.666, 4.170, -155.222, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[27], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[27], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[27], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[27], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[27], ['Name'] = "Part"})
end
if generatedParts[28] then
    table.insert(resizes, {['Part'] = generatedParts[28], ['CFrame'] = (origin + offset) * CFrame.new(-16.980, 3.270, -155.790, -0.814, -0.581, -0.000, -0.000, -0.000, 1.000, -0.581, 0.814, -0.000), ['Size'] = Vector3.new(2.200, 0.200, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[28], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[28], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[28], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[28], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[28], ['Name'] = "Part"})
end
if generatedParts[29] then
    table.insert(resizes, {['Part'] = generatedParts[29], ['CFrame'] = (origin + offset) * CFrame.new(-17.678, 3.070, -157.394, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), ['Size'] = Vector3.new(2.000, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[29], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[29], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[29], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[29], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[29], ['Name'] = "Part"})
end
if generatedParts[30] then
    table.insert(resizes, {['Part'] = generatedParts[30], ['CFrame'] = (origin + offset) * CFrame.new(-17.945, 4.170, -156.848, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[30], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[30], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[30], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[30], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[30], ['Name'] = "Part"})
end
if generatedParts[31] then
    table.insert(resizes, {['Part'] = generatedParts[31], ['CFrame'] = (origin + offset) * CFrame.new(-16.457, 5.570, -156.523, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), ['Size'] = Vector3.new(2.000, 0.200, 1.800)})
    table.insert(colors, {['Part'] = generatedParts[31], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[31], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[31], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[31], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[31], ['Name'] = "Part"})
end
if generatedParts[32] then
    table.insert(resizes, {['Part'] = generatedParts[32], ['CFrame'] = (origin + offset) * CFrame.new(-14.655, 3.070, -156.466, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), ['Size'] = Vector3.new(0.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[32], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[32], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[32], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[32], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[32], ['Name'] = "Part"})
end
if generatedParts[33] then
    table.insert(resizes, {['Part'] = generatedParts[33], ['CFrame'] = (origin + offset) * CFrame.new(-17.556, 4.170, -157.307, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[33], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[33], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[33], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[33], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[33], ['Name'] = "Part"})
end
if generatedParts[34] then
    table.insert(resizes, {['Part'] = generatedParts[34], ['CFrame'] = (origin + offset) * CFrame.new(-16.980, 3.470, -155.790, -0.814, -0.581, -0.000, -0.000, -0.000, 1.000, -0.581, 0.814, -0.000), ['Size'] = Vector3.new(2.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[34], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[34], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[34], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[34], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[34], ['Name'] = "Part"})
end
if generatedParts[35] then
    table.insert(resizes, {['Part'] = generatedParts[35], ['CFrame'] = (origin + offset) * CFrame.new(-15.877, 3.070, -157.338, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), ['Size'] = Vector3.new(3.000, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[35], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[35], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[35], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[35], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[35], ['Name'] = "Part"})
end
if generatedParts[36] then
    table.insert(resizes, {['Part'] = generatedParts[36], ['CFrame'] = (origin + offset) * CFrame.new(-15.874, 5.709, -157.341, -0.814, -0.577, 0.064, -0.000, 0.110, 0.994, -0.581, 0.809, -0.090), ['Size'] = Vector3.new(2.800, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[36], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[36], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[36], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[36], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[36], ['Name'] = "Part"})
end
if generatedParts[37] then
    table.insert(resizes, {['Part'] = generatedParts[37], ['CFrame'] = (origin + offset) * CFrame.new(-15.378, 4.170, -155.754, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), ['Size'] = Vector3.new(2.200, 0.250, 1.200)})
    table.insert(colors, {['Part'] = generatedParts[37], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[37], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[37], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[37], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[37], ['Name'] = "Part"})
end
if generatedParts[38] then
    table.insert(resizes, {['Part'] = generatedParts[38], ['CFrame'] = (origin + offset) * CFrame.new(-17.980, 4.170, -156.627, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), ['Size'] = Vector3.new(2.200, 0.400, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[38], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[38], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[38], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[38], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[38], ['Name'] = "Part"})
end
if generatedParts[39] then
    table.insert(resizes, {['Part'] = generatedParts[39], ['CFrame'] = (origin + offset) * CFrame.new(-16.370, 3.070, -156.645, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), ['Size'] = Vector3.new(2.400, 0.200, 1.700)})
    table.insert(colors, {['Part'] = generatedParts[39], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[39], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[39], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[39], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[39], ['Name'] = "Part"})
end
if generatedParts[40] then
    table.insert(resizes, {['Part'] = generatedParts[40], ['CFrame'] = (origin + offset) * CFrame.new(-17.031, 5.880, -155.719, -0.814, 0.577, -0.064, -0.000, -0.110, -0.994, -0.581, -0.809, 0.090), ['Size'] = Vector3.new(2.800, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[40], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[40], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[40], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[40], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[40], ['Name'] = "Part"})
end
if generatedParts[41] then
    table.insert(resizes, {['Part'] = generatedParts[41], ['CFrame'] = (origin + offset) * CFrame.new(-17.399, 4.170, -156.150, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[41], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[41], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[41], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[41], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[41], ['Name'] = "Part"})
end
if generatedParts[42] then
    table.insert(resizes, {['Part'] = generatedParts[42], ['CFrame'] = (origin + offset) * CFrame.new(-15.317, 5.070, -155.710, -0.581, 0.814, 0.000, 0.000, 0.000, 1.000, 0.814, 0.581, -0.000), ['Size'] = Vector3.new(1.200, 0.200, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[42], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[42], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[42], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[42], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[42], ['Name'] = "Part"})
end
if generatedParts[43] then
    table.insert(resizes, {['Part'] = generatedParts[43], ['CFrame'] = (origin + offset) * CFrame.new(-17.098, 3.070, -158.208, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), ['Size'] = Vector3.new(0.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[43], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[43], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[43], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[43], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[43], ['Name'] = "Part"})
end
if generatedParts[44] then
    table.insert(resizes, {['Part'] = generatedParts[44], ['CFrame'] = (origin + offset) * CFrame.new(-15.863, 4.170, -155.117, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), ['Size'] = Vector3.new(2.200, 0.400, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[44], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[44], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[44], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[44], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[44], ['Name'] = "Part"})
end
if generatedParts[45] then
    table.insert(resizes, {['Part'] = generatedParts[45], ['CFrame'] = (origin + offset) * CFrame.new(-16.428, 4.170, -156.564, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), ['Size'] = Vector3.new(2.400, 0.200, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[45], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[45], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[45], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[45], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[45], ['Name'] = "Part"})
end
if generatedParts[46] then
    table.insert(resizes, {['Part'] = generatedParts[46], ['CFrame'] = (origin + offset) * CFrame.new(-16.980, 5.070, -155.790, -0.814, -0.581, -0.000, -0.000, -0.000, 1.000, -0.581, 0.814, -0.000), ['Size'] = Vector3.new(2.200, 0.200, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[46], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[46], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[46], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[46], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[46], ['Name'] = "Part"})
end
if generatedParts[47] then
    table.insert(resizes, {['Part'] = generatedParts[47], ['CFrame'] = (origin + offset) * CFrame.new(-16.448, 5.869, -156.537, -0.814, 0.064, 0.577, -0.000, 0.994, -0.110, -0.581, -0.090, -0.809), ['Size'] = Vector3.new(2.800, 0.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[47], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[47], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[47], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[47], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[47], ['Name'] = "Part"})
end
if generatedParts[48] then
    table.insert(resizes, {['Part'] = generatedParts[48], ['CFrame'] = (origin + offset) * CFrame.new(-17.597, 3.470, -157.336, -0.581, 0.000, 0.814, 0.000, -1.000, 0.000, 0.814, 0.000, 0.581), ['Size'] = Vector3.new(1.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[48], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[48], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[48], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[48], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[48], ['Name'] = "Part"})
end
if generatedParts[49] then
    table.insert(resizes, {['Part'] = generatedParts[49], ['CFrame'] = (origin + offset) * CFrame.new(-15.317, 3.470, -155.710, -0.581, 0.000, 0.814, 0.000, -1.000, 0.000, 0.814, 0.000, 0.581), ['Size'] = Vector3.new(1.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[49], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[49], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[49], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[49], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[49], ['Name'] = "Part"})
end
if generatedParts[50] then
    table.insert(resizes, {['Part'] = generatedParts[50], ['CFrame'] = (origin + offset) * CFrame.new(-15.317, 4.870, -155.710, -0.581, 0.000, 0.814, 0.000, -1.000, 0.000, 0.814, 0.000, 0.581), ['Size'] = Vector3.new(1.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[50], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[50], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[50], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[50], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[50], ['Name'] = "Part"})
end
if generatedParts[51] then
    table.insert(resizes, {['Part'] = generatedParts[51], ['CFrame'] = (origin + offset) * CFrame.new(-17.597, 3.270, -157.336, -0.581, 0.814, 0.000, 0.000, 0.000, 1.000, 0.814, 0.581, -0.000), ['Size'] = Vector3.new(1.200, 0.200, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[51], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[51], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[51], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[51], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[51], ['Name'] = "Part"})
end
if generatedParts[52] then
    table.insert(resizes, {['Part'] = generatedParts[52], ['CFrame'] = (origin + offset) * CFrame.new(-16.980, 4.870, -155.790, -0.814, -0.581, -0.000, -0.000, -0.000, 1.000, -0.581, 0.814, -0.000), ['Size'] = Vector3.new(2.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[52], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[52], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[52], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[52], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[52], ['Name'] = "Part"})
end
if generatedParts[53] then
    table.insert(resizes, {['Part'] = generatedParts[53], ['CFrame'] = (origin + offset) * CFrame.new(-18.259, 3.070, -156.580, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), ['Size'] = Vector3.new(0.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[53], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[53], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[53], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[53], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[53], ['Name'] = "Part"})
end
if generatedParts[54] then
    table.insert(resizes, {['Part'] = generatedParts[54], ['CFrame'] = (origin + offset) * CFrame.new(-17.597, 4.870, -157.336, -0.581, 0.000, 0.814, 0.000, -1.000, 0.000, 0.814, 0.000, 0.581), ['Size'] = Vector3.new(1.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[54], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[54], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[54], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[54], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[54], ['Name'] = "Part"})
end
if generatedParts[55] then
    table.insert(resizes, {['Part'] = generatedParts[55], ['CFrame'] = (origin + offset) * CFrame.new(-15.993, 4.170, -157.174, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), ['Size'] = Vector3.new(2.200, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[55], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[55], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[55], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[55], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[55], ['Name'] = "Part"})
end
if generatedParts[56] then
    table.insert(resizes, {['Part'] = generatedParts[56], ['CFrame'] = (origin + offset) * CFrame.new(-14.934, 4.170, -156.419, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), ['Size'] = Vector3.new(2.200, 0.400, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[56], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[56], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[56], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[56], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[56], ['Name'] = "Part"})
end
if generatedParts[57] then
    table.insert(resizes, {['Part'] = generatedParts[57], ['CFrame'] = (origin + offset) * CFrame.new(-16.951, 4.170, -155.831, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[57], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[57], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[57], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[57], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[57], ['Name'] = "Part"})
end
if generatedParts[58] then
    table.insert(resizes, {['Part'] = generatedParts[58], ['CFrame'] = (origin + offset) * CFrame.new(-16.503, 4.170, -155.512, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[58], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[58], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[58], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[58], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[58], ['Name'] = "Part"})
end
if generatedParts[59] then
    table.insert(resizes, {['Part'] = generatedParts[59], ['CFrame'] = (origin + offset) * CFrame.new(-14.969, 4.170, -156.199, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[59], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[59], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[59], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[59], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[59], ['Name'] = "Part"})
end
if generatedParts[60] then
    table.insert(resizes, {['Part'] = generatedParts[60], ['CFrame'] = (origin + offset) * CFrame.new(-17.875, 4.170, -156.429, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[60], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[60], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[60], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[60], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[60], ['Name'] = "Part"})
end
if generatedParts[61] then
    table.insert(resizes, {['Part'] = generatedParts[61], ['CFrame'] = (origin + offset) * CFrame.new(-17.536, 4.170, -157.292, -0.000, -0.814, -0.581, 1.000, -0.000, -0.000, -0.000, -0.581, 0.814), ['Size'] = Vector3.new(2.200, 0.250, 1.200)})
    table.insert(colors, {['Part'] = generatedParts[61], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[61], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[61], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[61], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[61], ['Name'] = "Part"})
end
if generatedParts[62] then
    table.insert(resizes, {['Part'] = generatedParts[62], ['CFrame'] = (origin + offset) * CFrame.new(-16.457, 5.420, -156.523, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), ['Size'] = Vector3.new(3.300, 0.200, 2.300)})
    table.insert(colors, {['Part'] = generatedParts[62], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[62], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[62], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[62], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[62], ['Name'] = "Part"})
end
if generatedParts[63] then
    table.insert(resizes, {['Part'] = generatedParts[63], ['CFrame'] = (origin + offset) * CFrame.new(-15.358, 4.170, -155.739, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[63], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[63], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[63], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[63], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[63], ['Name'] = "Part"})
end
if generatedParts[64] then
    table.insert(resizes, {['Part'] = generatedParts[64], ['CFrame'] = (origin + offset) * CFrame.new(-17.249, 4.170, -157.825, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[64], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[64], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[64], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[64], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[64], ['Name'] = "Part"})
end
if generatedParts[65] then
    table.insert(resizes, {['Part'] = generatedParts[65], ['CFrame'] = (origin + offset) * CFrame.new(-16.084, 4.170, -155.152, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(1.400, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[65], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[65], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[65], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[65], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[65], ['Name'] = "Part"})
end
if generatedParts[66] then
    table.insert(resizes, {['Part'] = generatedParts[66], ['CFrame'] = (origin + offset) * CFrame.new(-17.038, 3.070, -155.709, -0.814, 0.000, 0.581, 0.000, 1.000, 0.000, -0.581, 0.000, -0.814), ['Size'] = Vector3.new(3.000, 0.200, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[66], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[66], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[66], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[66], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[66], ['Name'] = "Part"})
end
if generatedParts[67] then
    table.insert(resizes, {['Part'] = generatedParts[67], ['CFrame'] = (origin + offset) * CFrame.new(-15.317, 3.270, -155.710, -0.581, 0.814, 0.000, 0.000, 0.000, 1.000, 0.814, 0.581, -0.000), ['Size'] = Vector3.new(1.200, 0.200, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[67], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[67], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[67], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[67], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[67], ['Name'] = "Part"})
end
if generatedParts[68] then
    table.insert(resizes, {['Part'] = generatedParts[68], ['CFrame'] = (origin + offset) * CFrame.new(-16.936, 4.170, -155.851, -0.000, -0.581, 0.814, 1.000, -0.000, 0.000, -0.000, 0.814, 0.581), ['Size'] = Vector3.new(2.200, 0.250, 2.200)})
    table.insert(colors, {['Part'] = generatedParts[68], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[68], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[68], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[68], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[68], ['Name'] = "Part"})
end
if generatedParts[69] then
    table.insert(resizes, {['Part'] = generatedParts[69], ['CFrame'] = (origin + offset) * CFrame.new(-41.800, 0.400, -115.206, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[69], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[69], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[69], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[69], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[69], ['Name'] = "Part"})
end
if generatedParts[70] then
    table.insert(resizes, {['Part'] = generatedParts[70], ['CFrame'] = (origin + offset) * CFrame.new(-37.813, 0.400, -115.519, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[70], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[70], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[70], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[70], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[70], ['Name'] = "Part"})
end
if generatedParts[71] then
    table.insert(resizes, {['Part'] = generatedParts[71], ['CFrame'] = (origin + offset) * CFrame.new(-45.788, 0.400, -114.892, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[71], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[71], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[71], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[71], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[71], ['Name'] = "Part"})
end
if generatedParts[72] then
    table.insert(resizes, {['Part'] = generatedParts[72], ['CFrame'] = (origin + offset) * CFrame.new(-49.776, 0.400, -114.578, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[72], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[72], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[72], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[72], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[72], ['Name'] = "Part"})
end
if generatedParts[73] then
    table.insert(resizes, {['Part'] = generatedParts[73], ['CFrame'] = (origin + offset) * CFrame.new(-65.727, 0.400, -113.323, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[73], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[73], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[73], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[73], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[73], ['Name'] = "Part"})
end
if generatedParts[74] then
    table.insert(resizes, {['Part'] = generatedParts[74], ['CFrame'] = (origin + offset) * CFrame.new(-61.739, 0.400, -113.637, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[74], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[74], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[74], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[74], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[74], ['Name'] = "Part"})
end
if generatedParts[75] then
    table.insert(resizes, {['Part'] = generatedParts[75], ['CFrame'] = (origin + offset) * CFrame.new(-53.764, 0.400, -114.264, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[75], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[75], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[75], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[75], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[75], ['Name'] = "Part"})
end
if generatedParts[76] then
    table.insert(resizes, {['Part'] = generatedParts[76], ['CFrame'] = (origin + offset) * CFrame.new(-57.752, 0.400, -113.951, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[76], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[76], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[76], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[76], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[76], ['Name'] = "Part"})
end
if generatedParts[77] then
    table.insert(resizes, {['Part'] = generatedParts[77], ['CFrame'] = (origin + offset) * CFrame.new(-27.305, 4.565, -95.330, 0.165, 0.000, -0.986, 0.000, 1.000, 0.000, 0.986, 0.000, 0.165), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[77], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[77], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[77], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[77], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[77], ['Name'] = "Part"})
end
if generatedParts[78] then
    table.insert(resizes, {['Part'] = generatedParts[78], ['CFrame'] = (origin + offset) * CFrame.new(-26.704, 4.544, -95.430, 0.415, 0.000, -0.910, 0.000, 1.000, 0.000, 0.910, 0.000, 0.415), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[78], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[78], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[78], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[78], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[78], ['Name'] = "Part"})
end
if generatedParts[79] then
    table.insert(resizes, {['Part'] = generatedParts[79], ['CFrame'] = (origin + offset) * CFrame.new(-27.365, 4.550, -96.199, -0.000, 0.078, -0.997, -1.000, -0.000, 0.000, -0.000, 0.997, 0.078), ['Size'] = Vector3.new(1.980, 1.250, 3.620)})
    table.insert(colors, {['Part'] = generatedParts[79], ['Color'] = Color3.new(0.416, 0.224, 0.035), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[79], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[79], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[79], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[79], ['Name'] = "Part"})
end
if generatedParts[80] then
    table.insert(resizes, {['Part'] = generatedParts[80], ['CFrame'] = (origin + offset) * CFrame.new(-27.480, 4.545, -97.203, -0.165, 0.000, 0.986, 0.000, 1.000, 0.000, -0.986, 0.000, -0.165), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[80], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[80], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[80], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[80], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[80], ['Name'] = "Part"})
end
if generatedParts[81] then
    table.insert(resizes, {['Part'] = generatedParts[81], ['CFrame'] = (origin + offset) * CFrame.new(-27.991, 4.555, -95.276, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[81], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[81], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[81], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[81], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[81], ['Name'] = "Part"})
end
if generatedParts[82] then
    table.insert(resizes, {['Part'] = generatedParts[82], ['CFrame'] = (origin + offset) * CFrame.new(-26.642, 4.665, -96.449, 0.772, 0.000, 0.636, 0.000, 1.000, 0.000, -0.636, 0.000, 0.772), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[82], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[82], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[82], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[82], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[82], ['Name'] = "Part"})
end
if generatedParts[83] then
    table.insert(resizes, {['Part'] = generatedParts[83], ['CFrame'] = (origin + offset) * CFrame.new(-28.400, 4.535, -96.160, -0.995, 0.000, 0.096, 0.000, 1.000, 0.000, -0.096, 0.000, -0.995), ['Size'] = Vector3.new(1.150, 1.610, 2.550)})
    table.insert(colors, {['Part'] = generatedParts[83], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[83], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[83], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[83], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[83], ['Name'] = "Part"})
end
if generatedParts[84] then
    table.insert(resizes, {['Part'] = generatedParts[84], ['CFrame'] = (origin + offset) * CFrame.new(-26.987, 4.645, -96.952, 0.649, 0.000, 0.760, 0.000, 1.000, 0.000, -0.760, 0.000, 0.649), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[84], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[84], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[84], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[84], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[84], ['Name'] = "Part"})
end
if generatedParts[85] then
    table.insert(resizes, {['Part'] = generatedParts[85], ['CFrame'] = (origin + offset) * CFrame.new(-26.306, 4.545, -95.921, -0.964, 0.000, 0.267, 0.000, 1.000, 0.000, -0.267, 0.000, -0.964), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[85], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[85], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[85], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[85], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[85], ['Name'] = "Part"})
end
if generatedParts[86] then
    table.insert(resizes, {['Part'] = generatedParts[86], ['CFrame'] = (origin + offset) * CFrame.new(-28.016, 4.555, -96.749, -0.760, 0.000, 0.649, 0.000, 1.000, 0.000, -0.649, 0.000, -0.760), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[86], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[86], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[86], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[86], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[86], ['Name'] = "Part"})
end
if generatedParts[87] then
    table.insert(resizes, {['Part'] = generatedParts[87], ['CFrame'] = (origin + offset) * CFrame.new(-27.396, 12.524, -96.271, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(13.570, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[87], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[87], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[87], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[87], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[87], ['Name'] = "Part"})
end
if generatedParts[88] then
    table.insert(resizes, {['Part'] = generatedParts[88], ['CFrame'] = (origin + offset) * CFrame.new(-27.386, 3.459, -96.272, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.200, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[88], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[88], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[88], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[88], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[88], ['Name'] = "Part"})
end
if generatedParts[89] then
    table.insert(resizes, {['Part'] = generatedParts[89], ['CFrame'] = (origin + offset) * CFrame.new(-27.396, 1.930, -96.271, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(2.840, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[89], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[89], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[89], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[89], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[89], ['Name'] = "Part"})
end
if generatedParts[90] then
    table.insert(resizes, {['Part'] = generatedParts[90], ['CFrame'] = (origin + offset) * CFrame.new(-27.396, 5.640, -96.271, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.200, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[90], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[90], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[90], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[90], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[90], ['Name'] = "Part"})
end
if generatedParts[91] then
    table.insert(resizes, {['Part'] = generatedParts[91], ['CFrame'] = (origin + offset) * CFrame.new(-44.827, 0.400, -153.798, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[91], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[91], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[91], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[91], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[91], ['Name'] = "Part"})
end
if generatedParts[92] then
    table.insert(resizes, {['Part'] = generatedParts[92], ['CFrame'] = (origin + offset) * CFrame.new(-40.840, 0.400, -154.112, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[92], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[92], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[92], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[92], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[92], ['Name'] = "Part"})
end
if generatedParts[93] then
    table.insert(resizes, {['Part'] = generatedParts[93], ['CFrame'] = (origin + offset) * CFrame.new(-64.766, 0.400, -152.228, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[93], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[93], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[93], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[93], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[93], ['Name'] = "Part"})
end
if generatedParts[94] then
    table.insert(resizes, {['Part'] = generatedParts[94], ['CFrame'] = (origin + offset) * CFrame.new(-68.754, 0.400, -151.915, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[94], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[94], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[94], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[94], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[94], ['Name'] = "Part"})
end
if generatedParts[95] then
    table.insert(resizes, {['Part'] = generatedParts[95], ['CFrame'] = (origin + offset) * CFrame.new(-60.779, 0.400, -152.542, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[95], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[95], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[95], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[95], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[95], ['Name'] = "Part"})
end
if generatedParts[96] then
    table.insert(resizes, {['Part'] = generatedParts[96], ['CFrame'] = (origin + offset) * CFrame.new(-56.791, 0.400, -152.856, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[96], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[96], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[96], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[96], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[96], ['Name'] = "Part"})
end
if generatedParts[97] then
    table.insert(resizes, {['Part'] = generatedParts[97], ['CFrame'] = (origin + offset) * CFrame.new(-48.816, 0.400, -153.484, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[97], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[97], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[97], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[97], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[97], ['Name'] = "Part"})
end
if generatedParts[98] then
    table.insert(resizes, {['Part'] = generatedParts[98], ['CFrame'] = (origin + offset) * CFrame.new(-52.803, 0.400, -153.170, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[98], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[98], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[98], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[98], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[98], ['Name'] = "Part"})
end
if generatedParts[99] then
    table.insert(resizes, {['Part'] = generatedParts[99], ['CFrame'] = (origin + offset) * CFrame.new(-57.432, 7.110, -36.154, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[99], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[99], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[99], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[99], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[99], ['Name'] = "Part"})
end
if generatedParts[100] then
    table.insert(resizes, {['Part'] = generatedParts[100], ['CFrame'] = (origin + offset) * CFrame.new(-57.432, 2.760, -36.154, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[100], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[100], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[100], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[100], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[100], ['Name'] = "Part"})
end
if generatedParts[101] then
    table.insert(resizes, {['Part'] = generatedParts[101], ['CFrame'] = (origin + offset) * CFrame.new(-51.915, 5.465, -36.589, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 10.330, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[101], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[101], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[101], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[101], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[101], ['Name'] = "Part"})
end
if generatedParts[102] then
    table.insert(resizes, {['Part'] = generatedParts[102], ['CFrame'] = (origin + offset) * CFrame.new(-57.432, 5.010, -36.154, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[102], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[102], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[102], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[102], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[102], ['Name'] = "Part"})
end
if generatedParts[103] then
    table.insert(resizes, {['Part'] = generatedParts[103], ['CFrame'] = (origin + offset) * CFrame.new(-57.432, 9.160, -36.154, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[103], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[103], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[103], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[103], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[103], ['Name'] = "Part"})
end
if generatedParts[104] then
    table.insert(resizes, {['Part'] = generatedParts[104], ['CFrame'] = (origin + offset) * CFrame.new(-62.998, 5.465, -35.716, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 10.330, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[104], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[104], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[104], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[104], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[104], ['Name'] = "Part"})
end
if generatedParts[105] then
    table.insert(resizes, {['Part'] = generatedParts[105], ['CFrame'] = (origin + offset) * CFrame.new(-67.467, 5.465, -35.365, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 10.330, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[105], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[105], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[105], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[105], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[105], ['Name'] = "Part"})
end
if generatedParts[106] then
    table.insert(resizes, {['Part'] = generatedParts[106], ['CFrame'] = (origin + offset) * CFrame.new(-72.984, 2.760, -34.930, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[106], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[106], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[106], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[106], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[106], ['Name'] = "Part"})
end
if generatedParts[107] then
    table.insert(resizes, {['Part'] = generatedParts[107], ['CFrame'] = (origin + offset) * CFrame.new(-72.984, 5.010, -34.930, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[107], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[107], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[107], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[107], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[107], ['Name'] = "Part"})
end
if generatedParts[108] then
    table.insert(resizes, {['Part'] = generatedParts[108], ['CFrame'] = (origin + offset) * CFrame.new(-72.984, 7.110, -34.930, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[108], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[108], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[108], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[108], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[108], ['Name'] = "Part"})
end
if generatedParts[109] then
    table.insert(resizes, {['Part'] = generatedParts[109], ['CFrame'] = (origin + offset) * CFrame.new(-78.550, 5.465, -34.492, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 10.330, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[109], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[109], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[109], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[109], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[109], ['Name'] = "Part"})
end
if generatedParts[110] then
    table.insert(resizes, {['Part'] = generatedParts[110], ['CFrame'] = (origin + offset) * CFrame.new(-72.984, 9.160, -34.930, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[110], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[110], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[110], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[110], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[110], ['Name'] = "Part"})
end
if generatedParts[111] then
    table.insert(resizes, {['Part'] = generatedParts[111], ['CFrame'] = (origin + offset) * CFrame.new(-66.742, 0.400, -87.354, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[111], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[111], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[111], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[111], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[111], ['Name'] = "Part"})
end
if generatedParts[112] then
    table.insert(resizes, {['Part'] = generatedParts[112], ['CFrame'] = (origin + offset) * CFrame.new(-70.731, 0.400, -87.040, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[112], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[112], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[112], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[112], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[112], ['Name'] = "Part"})
end
if generatedParts[113] then
    table.insert(resizes, {['Part'] = generatedParts[113], ['CFrame'] = (origin + offset) * CFrame.new(-62.754, 0.400, -87.668, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[113], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[113], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[113], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[113], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[113], ['Name'] = "Part"})
end
if generatedParts[114] then
    table.insert(resizes, {['Part'] = generatedParts[114], ['CFrame'] = (origin + offset) * CFrame.new(-58.767, 0.400, -87.982, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[114], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[114], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[114], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[114], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[114], ['Name'] = "Part"})
end
if generatedParts[115] then
    table.insert(resizes, {['Part'] = generatedParts[115], ['CFrame'] = (origin + offset) * CFrame.new(-78.705, 0.400, -86.413, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[115], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[115], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[115], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[115], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[115], ['Name'] = "Part"})
end
if generatedParts[116] then
    table.insert(resizes, {['Part'] = generatedParts[116], ['CFrame'] = (origin + offset) * CFrame.new(-74.718, 0.400, -86.727, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[116], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[116], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[116], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[116], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[116], ['Name'] = "Part"})
end
if generatedParts[117] then
    table.insert(resizes, {['Part'] = generatedParts[117], ['CFrame'] = (origin + offset) * CFrame.new(-54.778, 0.400, -88.296, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[117], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[117], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[117], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[117], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[117], ['Name'] = "Part"})
end
if generatedParts[118] then
    table.insert(resizes, {['Part'] = generatedParts[118], ['CFrame'] = (origin + offset) * CFrame.new(-55.750, 4.555, -93.344, 0.415, 0.000, -0.910, 0.000, 1.000, 0.000, 0.910, 0.000, 0.415), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[118], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[118], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[118], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[118], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[118], ['Name'] = "Part"})
end
if generatedParts[119] then
    table.insert(resizes, {['Part'] = generatedParts[119], ['CFrame'] = (origin + offset) * CFrame.new(-56.351, 4.575, -93.244, 0.165, 0.000, -0.986, 0.000, 1.000, 0.000, 0.986, 0.000, 0.165), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[119], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[119], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[119], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[119], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[119], ['Name'] = "Part"})
end
if generatedParts[120] then
    table.insert(resizes, {['Part'] = generatedParts[120], ['CFrame'] = (origin + offset) * CFrame.new(-56.033, 4.655, -94.866, 0.649, 0.000, 0.760, 0.000, 1.000, 0.000, -0.760, 0.000, 0.649), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[120], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[120], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[120], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[120], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[120], ['Name'] = "Part"})
end
if generatedParts[121] then
    table.insert(resizes, {['Part'] = generatedParts[121], ['CFrame'] = (origin + offset) * CFrame.new(-55.352, 4.555, -93.835, -0.964, 0.000, 0.267, 0.000, 1.000, 0.000, -0.267, 0.000, -0.964), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[121], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[121], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[121], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[121], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[121], ['Name'] = "Part"})
end
if generatedParts[122] then
    table.insert(resizes, {['Part'] = generatedParts[122], ['CFrame'] = (origin + offset) * CFrame.new(-56.526, 4.555, -95.117, -0.165, 0.000, 0.986, 0.000, 1.000, 0.000, -0.986, 0.000, -0.165), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[122], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[122], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[122], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[122], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[122], ['Name'] = "Part"})
end
if generatedParts[123] then
    table.insert(resizes, {['Part'] = generatedParts[123], ['CFrame'] = (origin + offset) * CFrame.new(-57.446, 4.545, -94.074, -0.995, 0.000, 0.096, 0.000, 1.000, 0.000, -0.096, 0.000, -0.995), ['Size'] = Vector3.new(1.150, 1.610, 2.550)})
    table.insert(colors, {['Part'] = generatedParts[123], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[123], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[123], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[123], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[123], ['Name'] = "Part"})
end
if generatedParts[124] then
    table.insert(resizes, {['Part'] = generatedParts[124], ['CFrame'] = (origin + offset) * CFrame.new(-56.411, 4.560, -94.113, -0.000, 0.078, -0.997, -1.000, -0.000, 0.000, -0.000, 0.997, 0.078), ['Size'] = Vector3.new(1.980, 1.250, 3.620)})
    table.insert(colors, {['Part'] = generatedParts[124], ['Color'] = Color3.new(0.416, 0.224, 0.035), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[124], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[124], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[124], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[124], ['Name'] = "Part"})
end
if generatedParts[125] then
    table.insert(resizes, {['Part'] = generatedParts[125], ['CFrame'] = (origin + offset) * CFrame.new(-55.687, 4.675, -94.363, 0.772, 0.000, 0.636, 0.000, 1.000, 0.000, -0.636, 0.000, 0.772), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[125], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[125], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[125], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[125], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[125], ['Name'] = "Part"})
end
if generatedParts[126] then
    table.insert(resizes, {['Part'] = generatedParts[126], ['CFrame'] = (origin + offset) * CFrame.new(-57.037, 4.565, -93.191, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[126], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[126], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[126], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[126], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[126], ['Name'] = "Part"})
end
if generatedParts[127] then
    table.insert(resizes, {['Part'] = generatedParts[127], ['CFrame'] = (origin + offset) * CFrame.new(-57.062, 4.565, -94.664, -0.760, 0.000, 0.649, 0.000, 1.000, 0.000, -0.649, 0.000, -0.760), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[127], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[127], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[127], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[127], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[127], ['Name'] = "Part"})
end
if generatedParts[128] then
    table.insert(resizes, {['Part'] = generatedParts[128], ['CFrame'] = (origin + offset) * CFrame.new(-56.442, 1.940, -94.186, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(2.840, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[128], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[128], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[128], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[128], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[128], ['Name'] = "Part"})
end
if generatedParts[129] then
    table.insert(resizes, {['Part'] = generatedParts[129], ['CFrame'] = (origin + offset) * CFrame.new(-56.442, 12.544, -94.186, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(13.590, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[129], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[129], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[129], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[129], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[129], ['Name'] = "Part"})
end
if generatedParts[130] then
    table.insert(resizes, {['Part'] = generatedParts[130], ['CFrame'] = (origin + offset) * CFrame.new(-56.442, 3.460, -94.186, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.200, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[130], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[130], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[130], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[130], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[130], ['Name'] = "Part"})
end
if generatedParts[131] then
    table.insert(resizes, {['Part'] = generatedParts[131], ['CFrame'] = (origin + offset) * CFrame.new(-56.442, 5.650, -94.186, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.200, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[131], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[131], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[131], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[131], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[131], ['Name'] = "Part"})
end
if generatedParts[132] then
    table.insert(resizes, {['Part'] = generatedParts[132], ['CFrame'] = (origin + offset) * CFrame.new(-28.344, 1.000, -69.484, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 0.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[132], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[132], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.400})
    table.insert(anchors, {['Part'] = generatedParts[132], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[132], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[132], ['Name'] = "Light"})
end
if generatedParts[133] then
    table.insert(resizes, {['Part'] = generatedParts[133], ['CFrame'] = (origin + offset) * CFrame.new(-28.344, 1.000, -69.484, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.400, 0.200, 2.400)})
    table.insert(colors, {['Part'] = generatedParts[133], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[133], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[133], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[133], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[133], ['Name'] = "Part"})
end
if generatedParts[134] then
    table.insert(resizes, {['Part'] = generatedParts[134], ['CFrame'] = (origin + offset) * CFrame.new(-32.813, 0.400, -102.974, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[134], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[134], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[134], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[134], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[134], ['Name'] = "Part"})
end
if generatedParts[135] then
    table.insert(resizes, {['Part'] = generatedParts[135], ['CFrame'] = (origin + offset) * CFrame.new(-28.826, 0.400, -103.288, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[135], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[135], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[135], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[135], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[135], ['Name'] = "Part"})
end
if generatedParts[136] then
    table.insert(resizes, {['Part'] = generatedParts[136], ['CFrame'] = (origin + offset) * CFrame.new(-16.863, 0.400, -104.229, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[136], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[136], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[136], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[136], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[136], ['Name'] = "Part"})
end
if generatedParts[137] then
    table.insert(resizes, {['Part'] = generatedParts[137], ['CFrame'] = (origin + offset) * CFrame.new(-12.875, 0.400, -104.543, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[137], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[137], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[137], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[137], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[137], ['Name'] = "Part"})
end
if generatedParts[138] then
    table.insert(resizes, {['Part'] = generatedParts[138], ['CFrame'] = (origin + offset) * CFrame.new(-8.887, 0.400, -104.857, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[138], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[138], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[138], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[138], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[138], ['Name'] = "Part"})
end
if generatedParts[139] then
    table.insert(resizes, {['Part'] = generatedParts[139], ['CFrame'] = (origin + offset) * CFrame.new(-4.900, 0.400, -105.171, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[139], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[139], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[139], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[139], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[139], ['Name'] = "Part"})
end
if generatedParts[140] then
    table.insert(resizes, {['Part'] = generatedParts[140], ['CFrame'] = (origin + offset) * CFrame.new(-24.838, 0.400, -103.602, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[140], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[140], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[140], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[140], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[140], ['Name'] = "Part"})
end
if generatedParts[141] then
    table.insert(resizes, {['Part'] = generatedParts[141], ['CFrame'] = (origin + offset) * CFrame.new(-20.851, 0.400, -103.915, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[141], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[141], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[141], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[141], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[141], ['Name'] = "Part"})
end
if generatedParts[142] then
    table.insert(resizes, {['Part'] = generatedParts[142], ['CFrame'] = (origin + offset) * CFrame.new(-31.905, 0.400, -90.026, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[142], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[142], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[142], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[142], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[142], ['Name'] = "Part"})
end
if generatedParts[143] then
    table.insert(resizes, {['Part'] = generatedParts[143], ['CFrame'] = (origin + offset) * CFrame.new(-35.892, 0.400, -89.712, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[143], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[143], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[143], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[143], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[143], ['Name'] = "Part"})
end
if generatedParts[144] then
    table.insert(resizes, {['Part'] = generatedParts[144], ['CFrame'] = (origin + offset) * CFrame.new(-67.775, 0.400, -100.213, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[144], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[144], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[144], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[144], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[144], ['Name'] = "Part"})
end
if generatedParts[145] then
    table.insert(resizes, {['Part'] = generatedParts[145], ['CFrame'] = (origin + offset) * CFrame.new(-71.763, 0.400, -99.899, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[145], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[145], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[145], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[145], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[145], ['Name'] = "Part"})
end
if generatedParts[146] then
    table.insert(resizes, {['Part'] = generatedParts[146], ['CFrame'] = (origin + offset) * CFrame.new(-63.786, 0.400, -100.527, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[146], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[146], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[146], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[146], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[146], ['Name'] = "Part"})
end
if generatedParts[147] then
    table.insert(resizes, {['Part'] = generatedParts[147], ['CFrame'] = (origin + offset) * CFrame.new(-59.799, 0.400, -100.841, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[147], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[147], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[147], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[147], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[147], ['Name'] = "Part"})
end
if generatedParts[148] then
    table.insert(resizes, {['Part'] = generatedParts[148], ['CFrame'] = (origin + offset) * CFrame.new(-79.738, 0.400, -99.272, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[148], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[148], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[148], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[148], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[148], ['Name'] = "Part"})
end
if generatedParts[149] then
    table.insert(resizes, {['Part'] = generatedParts[149], ['CFrame'] = (origin + offset) * CFrame.new(-75.750, 0.400, -99.585, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[149], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[149], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[149], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[149], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[149], ['Name'] = "Part"})
end
if generatedParts[150] then
    table.insert(resizes, {['Part'] = generatedParts[150], ['CFrame'] = (origin + offset) * CFrame.new(-55.811, 0.400, -101.155, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[150], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[150], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[150], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[150], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[150], ['Name'] = "Part"})
end
if generatedParts[151] then
    table.insert(resizes, {['Part'] = generatedParts[151], ['CFrame'] = (origin + offset) * CFrame.new(-5.990, 0.400, -66.125, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[151], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[151], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[151], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[151], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[151], ['Name'] = "Part"})
end
if generatedParts[152] then
    table.insert(resizes, {['Part'] = generatedParts[152], ['CFrame'] = (origin + offset) * CFrame.new(-9.978, 0.400, -65.811, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[152], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[152], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[152], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[152], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[152], ['Name'] = "Part"})
end
if generatedParts[153] then
    table.insert(resizes, {['Part'] = generatedParts[153], ['CFrame'] = (origin + offset) * CFrame.new(-24.660, 4.534, -69.463, 0.415, 0.000, -0.910, 0.000, 1.000, 0.000, 0.910, 0.000, 0.415), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[153], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[153], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[153], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[153], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[153], ['Name'] = "Part"})
end
if generatedParts[154] then
    table.insert(resizes, {['Part'] = generatedParts[154], ['CFrame'] = (origin + offset) * CFrame.new(-25.262, 4.555, -69.363, 0.165, 0.000, -0.986, 0.000, 1.000, 0.000, 0.986, 0.000, 0.165), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[154], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[154], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[154], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[154], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[154], ['Name'] = "Part"})
end
if generatedParts[155] then
    table.insert(resizes, {['Part'] = generatedParts[155], ['CFrame'] = (origin + offset) * CFrame.new(-24.262, 4.535, -69.954, -0.964, 0.000, 0.267, 0.000, 1.000, 0.000, -0.267, 0.000, -0.964), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[155], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[155], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[155], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[155], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[155], ['Name'] = "Part"})
end
if generatedParts[156] then
    table.insert(resizes, {['Part'] = generatedParts[156], ['CFrame'] = (origin + offset) * CFrame.new(-26.356, 4.525, -70.194, -0.995, 0.000, 0.096, 0.000, 1.000, 0.000, -0.096, 0.000, -0.995), ['Size'] = Vector3.new(1.150, 1.610, 2.550)})
    table.insert(colors, {['Part'] = generatedParts[156], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[156], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[156], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[156], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[156], ['Name'] = "Part"})
end
if generatedParts[157] then
    table.insert(resizes, {['Part'] = generatedParts[157], ['CFrame'] = (origin + offset) * CFrame.new(-25.947, 4.545, -69.310, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[157], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[157], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[157], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[157], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[157], ['Name'] = "Part"})
end
if generatedParts[158] then
    table.insert(resizes, {['Part'] = generatedParts[158], ['CFrame'] = (origin + offset) * CFrame.new(-25.321, 4.540, -70.232, -0.000, 0.078, -0.997, -1.000, -0.000, 0.000, -0.000, 0.997, 0.078), ['Size'] = Vector3.new(1.980, 1.250, 3.620)})
    table.insert(colors, {['Part'] = generatedParts[158], ['Color'] = Color3.new(0.416, 0.224, 0.035), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[158], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[158], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[158], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[158], ['Name'] = "Part"})
end
if generatedParts[159] then
    table.insert(resizes, {['Part'] = generatedParts[159], ['CFrame'] = (origin + offset) * CFrame.new(-25.973, 4.545, -70.783, -0.760, 0.000, 0.649, 0.000, 1.000, 0.000, -0.649, 0.000, -0.760), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[159], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[159], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[159], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[159], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[159], ['Name'] = "Part"})
end
if generatedParts[160] then
    table.insert(resizes, {['Part'] = generatedParts[160], ['CFrame'] = (origin + offset) * CFrame.new(-24.944, 4.635, -70.985, 0.649, 0.000, 0.760, 0.000, 1.000, 0.000, -0.760, 0.000, 0.649), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[160], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[160], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[160], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[160], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[160], ['Name'] = "Part"})
end
if generatedParts[161] then
    table.insert(resizes, {['Part'] = generatedParts[161], ['CFrame'] = (origin + offset) * CFrame.new(-25.437, 4.535, -71.236, -0.165, 0.000, 0.986, 0.000, 1.000, 0.000, -0.986, 0.000, -0.165), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[161], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[161], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[161], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[161], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[161], ['Name'] = "Part"})
end
if generatedParts[162] then
    table.insert(resizes, {['Part'] = generatedParts[162], ['CFrame'] = (origin + offset) * CFrame.new(-24.598, 4.655, -70.483, 0.772, 0.000, 0.636, 0.000, 1.000, 0.000, -0.636, 0.000, 0.772), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[162], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[162], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[162], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[162], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[162], ['Name'] = "Part"})
end
if generatedParts[163] then
    table.insert(resizes, {['Part'] = generatedParts[163], ['CFrame'] = (origin + offset) * CFrame.new(-25.352, 12.525, -70.305, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(13.590, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[163], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[163], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[163], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[163], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[163], ['Name'] = "Part"})
end
if generatedParts[164] then
    table.insert(resizes, {['Part'] = generatedParts[164], ['CFrame'] = (origin + offset) * CFrame.new(-25.352, 5.630, -70.305, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.200, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[164], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[164], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[164], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[164], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[164], ['Name'] = "Part"})
end
if generatedParts[165] then
    table.insert(resizes, {['Part'] = generatedParts[165], ['CFrame'] = (origin + offset) * CFrame.new(-25.342, 3.450, -70.305, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.200, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[165], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[165], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[165], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[165], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[165], ['Name'] = "Part"})
end
if generatedParts[166] then
    table.insert(resizes, {['Part'] = generatedParts[166], ['CFrame'] = (origin + offset) * CFrame.new(-25.352, 1.920, -70.305, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(2.840, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[166], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[166], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[166], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[166], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[166], ['Name'] = "Part"})
end
if generatedParts[167] then
    table.insert(resizes, {['Part'] = generatedParts[167], ['CFrame'] = (origin + offset) * CFrame.new(-71.741, 0.400, -48.002, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[167], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[167], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[167], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[167], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[167], ['Name'] = "Part"})
end
if generatedParts[168] then
    table.insert(resizes, {['Part'] = generatedParts[168], ['CFrame'] = (origin + offset) * CFrame.new(-67.753, 0.400, -48.315, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[168], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[168], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[168], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[168], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[168], ['Name'] = "Part"})
end
if generatedParts[169] then
    table.insert(resizes, {['Part'] = generatedParts[169], ['CFrame'] = (origin + offset) * CFrame.new(-78.702, 0.400, -125.251, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[169], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[169], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[169], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[169], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[169], ['Name'] = "Part"})
end
if generatedParts[170] then
    table.insert(resizes, {['Part'] = generatedParts[170], ['CFrame'] = (origin + offset) * CFrame.new(-82.689, 0.400, -124.937, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[170], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[170], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[170], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[170], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[170], ['Name'] = "Part"})
end
if generatedParts[171] then
    table.insert(resizes, {['Part'] = generatedParts[171], ['CFrame'] = (origin + offset) * CFrame.new(-84.250, 10.799, -65.366, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[171], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[171], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[171], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[171], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[171], ['Name'] = "Part"})
end
if generatedParts[172] then
    table.insert(resizes, {['Part'] = generatedParts[172], ['CFrame'] = (origin + offset) * CFrame.new(-86.248, 1.300, -92.022, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[172], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[172], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[172], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[172], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[172], ['Name'] = "Part"})
end
if generatedParts[173] then
    table.insert(resizes, {['Part'] = generatedParts[173], ['CFrame'] = (origin + offset) * CFrame.new(-84.250, 1.300, -65.366, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[173], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[173], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[173], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[173], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[173], ['Name'] = "Part"})
end
if generatedParts[174] then
    table.insert(resizes, {['Part'] = generatedParts[174], ['CFrame'] = (origin + offset) * CFrame.new(-86.248, 10.800, -92.022, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[174], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[174], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[174], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[174], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[174], ['Name'] = "Part"})
end
if generatedParts[175] then
    table.insert(resizes, {['Part'] = generatedParts[175], ['CFrame'] = (origin + offset) * CFrame.new(-5.885, 5.465, -40.211, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 10.330, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[175], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[175], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[175], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[175], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[175], ['Name'] = "Part"})
end
if generatedParts[176] then
    table.insert(resizes, {['Part'] = generatedParts[176], ['CFrame'] = (origin + offset) * CFrame.new(-0.319, 5.010, -40.649, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[176], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[176], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[176], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[176], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[176], ['Name'] = "Part"})
end
if generatedParts[177] then
    table.insert(resizes, {['Part'] = generatedParts[177], ['CFrame'] = (origin + offset) * CFrame.new(-0.319, 7.110, -40.649, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[177], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[177], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[177], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[177], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[177], ['Name'] = "Part"})
end
if generatedParts[178] then
    table.insert(resizes, {['Part'] = generatedParts[178], ['CFrame'] = (origin + offset) * CFrame.new(-0.319, 2.760, -40.649, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[178], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[178], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[178], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[178], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[178], ['Name'] = "Part"})
end
if generatedParts[179] then
    table.insert(resizes, {['Part'] = generatedParts[179], ['CFrame'] = (origin + offset) * CFrame.new(-0.319, 9.160, -40.649, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[179], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[179], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[179], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[179], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[179], ['Name'] = "Part"})
end
if generatedParts[180] then
    table.insert(resizes, {['Part'] = generatedParts[180], ['CFrame'] = (origin + offset) * CFrame.new(5.198, 5.465, -41.083, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 10.330, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[180], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[180], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[180], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[180], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[180], ['Name'] = "Part"})
end
if generatedParts[181] then
    table.insert(resizes, {['Part'] = generatedParts[181], ['CFrame'] = (origin + offset) * CFrame.new(-10.354, 5.465, -39.860, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 10.330, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[181], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[181], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[181], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[181], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[181], ['Name'] = "Part"})
end
if generatedParts[182] then
    table.insert(resizes, {['Part'] = generatedParts[182], ['CFrame'] = (origin + offset) * CFrame.new(-21.437, 5.465, -38.987, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 10.330, 0.400)})
    table.insert(colors, {['Part'] = generatedParts[182], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[182], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[182], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[182], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[182], ['Name'] = "Part"})
end
if generatedParts[183] then
    table.insert(resizes, {['Part'] = generatedParts[183], ['CFrame'] = (origin + offset) * CFrame.new(-15.870, 2.760, -39.425, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[183], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[183], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[183], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[183], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[183], ['Name'] = "Part"})
end
if generatedParts[184] then
    table.insert(resizes, {['Part'] = generatedParts[184], ['CFrame'] = (origin + offset) * CFrame.new(-15.870, 7.110, -39.425, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[184], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[184], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[184], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[184], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[184], ['Name'] = "Part"})
end
if generatedParts[185] then
    table.insert(resizes, {['Part'] = generatedParts[185], ['CFrame'] = (origin + offset) * CFrame.new(-15.870, 5.010, -39.425, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[185], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[185], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[185], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[185], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[185], ['Name'] = "Part"})
end
if generatedParts[186] then
    table.insert(resizes, {['Part'] = generatedParts[186], ['CFrame'] = (origin + offset) * CFrame.new(-15.870, 9.160, -39.425, 0.078, 0.000, 0.997, 0.000, -1.000, 0.000, 0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.410, 0.560, 10.830)})
    table.insert(colors, {['Part'] = generatedParts[186], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[186], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[186], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[186], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[186], ['Name'] = "Part"})
end
if generatedParts[187] then
    table.insert(resizes, {['Part'] = generatedParts[187], ['CFrame'] = (origin + offset) * CFrame.new(-10.954, 0.399, -78.725, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[187], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[187], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[187], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[187], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[187], ['Name'] = "Part"})
end
if generatedParts[188] then
    table.insert(resizes, {['Part'] = generatedParts[188], ['CFrame'] = (origin + offset) * CFrame.new(-14.941, 0.399, -78.412, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[188], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[188], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[188], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[188], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[188], ['Name'] = "Part"})
end
if generatedParts[189] then
    table.insert(resizes, {['Part'] = generatedParts[189], ['CFrame'] = (origin + offset) * CFrame.new(-22.917, 0.399, -77.784, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[189], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[189], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[189], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[189], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[189], ['Name'] = "Part"})
end
if generatedParts[190] then
    table.insert(resizes, {['Part'] = generatedParts[190], ['CFrame'] = (origin + offset) * CFrame.new(-18.929, 0.399, -78.098, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[190], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[190], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[190], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[190], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[190], ['Name'] = "Part"})
end
if generatedParts[191] then
    table.insert(resizes, {['Part'] = generatedParts[191], ['CFrame'] = (origin + offset) * CFrame.new(-30.892, 0.399, -77.156, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[191], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[191], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[191], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[191], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[191], ['Name'] = "Part"})
end
if generatedParts[192] then
    table.insert(resizes, {['Part'] = generatedParts[192], ['CFrame'] = (origin + offset) * CFrame.new(-34.880, 0.399, -76.842, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[192], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[192], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[192], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[192], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[192], ['Name'] = "Part"})
end
if generatedParts[193] then
    table.insert(resizes, {['Part'] = generatedParts[193], ['CFrame'] = (origin + offset) * CFrame.new(2.478, 1.300, -99.005, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[193], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[193], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[193], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[193], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[193], ['Name'] = "Part"})
end
if generatedParts[194] then
    table.insert(resizes, {['Part'] = generatedParts[194], ['CFrame'] = (origin + offset) * CFrame.new(2.478, 10.800, -99.005, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[194], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[194], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[194], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[194], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[194], ['Name'] = "Part"})
end
if generatedParts[195] then
    table.insert(resizes, {['Part'] = generatedParts[195], ['CFrame'] = (origin + offset) * CFrame.new(4.475, 10.799, -72.349, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[195], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[195], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[195], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[195], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[195], ['Name'] = "Part"})
end
if generatedParts[196] then
    table.insert(resizes, {['Part'] = generatedParts[196], ['CFrame'] = (origin + offset) * CFrame.new(4.475, 1.300, -72.349, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[196], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[196], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[196], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[196], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[196], ['Name'] = "Part"})
end
if generatedParts[197] then
    table.insert(resizes, {['Part'] = generatedParts[197], ['CFrame'] = (origin + offset) * CFrame.new(-63.754, 0.400, -139.368, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[197], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[197], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[197], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[197], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[197], ['Name'] = "Part"})
end
if generatedParts[198] then
    table.insert(resizes, {['Part'] = generatedParts[198], ['CFrame'] = (origin + offset) * CFrame.new(-67.742, 0.400, -139.055, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[198], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[198], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[198], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[198], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[198], ['Name'] = "Part"})
end
if generatedParts[199] then
    table.insert(resizes, {['Part'] = generatedParts[199], ['CFrame'] = (origin + offset) * CFrame.new(-39.828, 0.400, -141.251, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[199], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[199], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[199], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[199], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[199], ['Name'] = "Part"})
end
if generatedParts[200] then
    table.insert(resizes, {['Part'] = generatedParts[200], ['CFrame'] = (origin + offset) * CFrame.new(-43.815, 0.400, -140.938, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[200], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[200], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[200], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[200], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[200], ['Name'] = "Part"})
end
if generatedParts[201] then
    table.insert(resizes, {['Part'] = generatedParts[201], ['CFrame'] = (origin + offset) * CFrame.new(-51.791, 0.400, -140.310, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[201], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[201], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[201], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[201], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[201], ['Name'] = "Part"})
end
if generatedParts[202] then
    table.insert(resizes, {['Part'] = generatedParts[202], ['CFrame'] = (origin + offset) * CFrame.new(-47.804, 0.400, -140.624, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[202], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[202], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[202], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[202], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[202], ['Name'] = "Part"})
end
if generatedParts[203] then
    table.insert(resizes, {['Part'] = generatedParts[203], ['CFrame'] = (origin + offset) * CFrame.new(-59.767, 0.400, -139.682, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[203], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[203], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[203], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[203], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[203], ['Name'] = "Part"})
end
if generatedParts[204] then
    table.insert(resizes, {['Part'] = generatedParts[204], ['CFrame'] = (origin + offset) * CFrame.new(-55.779, 0.400, -139.996, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[204], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[204], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[204], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[204], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[204], ['Name'] = "Part"})
end
if generatedParts[205] then
    table.insert(resizes, {['Part'] = generatedParts[205], ['CFrame'] = (origin + offset) * CFrame.new(-61.762, 0.400, -74.807, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[205], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[205], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[205], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[205], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[205], ['Name'] = "Part"})
end
if generatedParts[206] then
    table.insert(resizes, {['Part'] = generatedParts[206], ['CFrame'] = (origin + offset) * CFrame.new(-57.775, 0.400, -75.121, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[206], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[206], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[206], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[206], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[206], ['Name'] = "Part"})
end
if generatedParts[207] then
    table.insert(resizes, {['Part'] = generatedParts[207], ['CFrame'] = (origin + offset) * CFrame.new(-73.726, 0.400, -73.865, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[207], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[207], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[207], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[207], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[207], ['Name'] = "Part"})
end
if generatedParts[208] then
    table.insert(resizes, {['Part'] = generatedParts[208], ['CFrame'] = (origin + offset) * CFrame.new(-77.713, 0.400, -73.551, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[208], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[208], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[208], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[208], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[208], ['Name'] = "Part"})
end
if generatedParts[209] then
    table.insert(resizes, {['Part'] = generatedParts[209], ['CFrame'] = (origin + offset) * CFrame.new(-65.751, 0.400, -74.493, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[209], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[209], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[209], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[209], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[209], ['Name'] = "Part"})
end
if generatedParts[210] then
    table.insert(resizes, {['Part'] = generatedParts[210], ['CFrame'] = (origin + offset) * CFrame.new(-69.739, 0.400, -74.179, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[210], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[210], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[210], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[210], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[210], ['Name'] = "Part"})
end
if generatedParts[211] then
    table.insert(resizes, {['Part'] = generatedParts[211], ['CFrame'] = (origin + offset) * CFrame.new(-53.787, 0.400, -75.434, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[211], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[211], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[211], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[211], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[211], ['Name'] = "Part"})
end
if generatedParts[212] then
    table.insert(resizes, {['Part'] = generatedParts[212], ['CFrame'] = (origin + offset) * CFrame.new(-71.730, 0.400, -138.741, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[212], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[212], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[212], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[212], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[212], ['Name'] = "Part"})
end
if generatedParts[213] then
    table.insert(resizes, {['Part'] = generatedParts[213], ['CFrame'] = (origin + offset) * CFrame.new(-75.717, 0.400, -138.427, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[213], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[213], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[213], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[213], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[213], ['Name'] = "Part"})
end
if generatedParts[214] then
    table.insert(resizes, {['Part'] = generatedParts[214], ['CFrame'] = (origin + offset) * CFrame.new(-66.739, 0.400, -126.192, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[214], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[214], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[214], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[214], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[214], ['Name'] = "Part"})
end
if generatedParts[215] then
    table.insert(resizes, {['Part'] = generatedParts[215], ['CFrame'] = (origin + offset) * CFrame.new(-62.752, 0.400, -126.506, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[215], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[215], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[215], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[215], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[215], ['Name'] = "Part"})
end
if generatedParts[216] then
    table.insert(resizes, {['Part'] = generatedParts[216], ['CFrame'] = (origin + offset) * CFrame.new(-42.813, 0.400, -128.075, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[216], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[216], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[216], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[216], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[216], ['Name'] = "Part"})
end
if generatedParts[217] then
    table.insert(resizes, {['Part'] = generatedParts[217], ['CFrame'] = (origin + offset) * CFrame.new(-38.825, 0.400, -128.389, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[217], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[217], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[217], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[217], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[217], ['Name'] = "Part"})
end
if generatedParts[218] then
    table.insert(resizes, {['Part'] = generatedParts[218], ['CFrame'] = (origin + offset) * CFrame.new(-46.801, 0.400, -127.761, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[218], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[218], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[218], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[218], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[218], ['Name'] = "Part"})
end
if generatedParts[219] then
    table.insert(resizes, {['Part'] = generatedParts[219], ['CFrame'] = (origin + offset) * CFrame.new(-50.789, 0.400, -127.448, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[219], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[219], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[219], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[219], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[219], ['Name'] = "Part"})
end
if generatedParts[220] then
    table.insert(resizes, {['Part'] = generatedParts[220], ['CFrame'] = (origin + offset) * CFrame.new(-54.777, 0.400, -127.134, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[220], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[220], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[220], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[220], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[220], ['Name'] = "Part"})
end
if generatedParts[221] then
    table.insert(resizes, {['Part'] = generatedParts[221], ['CFrame'] = (origin + offset) * CFrame.new(-58.764, 0.400, -126.820, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[221], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[221], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[221], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[221], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[221], ['Name'] = "Part"})
end
if generatedParts[222] then
    table.insert(resizes, {['Part'] = generatedParts[222], ['CFrame'] = (origin + offset) * CFrame.new(-18.888, 0.400, -129.958, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[222], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[222], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[222], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[222], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[222], ['Name'] = "Part"})
end
if generatedParts[223] then
    table.insert(resizes, {['Part'] = generatedParts[223], ['CFrame'] = (origin + offset) * CFrame.new(-14.900, 0.400, -130.272, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[223], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[223], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[223], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[223], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[223], ['Name'] = "Part"})
end
if generatedParts[224] then
    table.insert(resizes, {['Part'] = generatedParts[224], ['CFrame'] = (origin + offset) * CFrame.new(-30.851, 0.400, -129.017, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[224], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[224], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[224], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[224], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[224], ['Name'] = "Part"})
end
if generatedParts[225] then
    table.insert(resizes, {['Part'] = generatedParts[225], ['CFrame'] = (origin + offset) * CFrame.new(-34.838, 0.400, -128.703, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[225], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[225], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[225], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[225], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[225], ['Name'] = "Part"})
end
if generatedParts[226] then
    table.insert(resizes, {['Part'] = generatedParts[226], ['CFrame'] = (origin + offset) * CFrame.new(-10.912, 0.400, -130.586, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[226], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[226], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[226], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[226], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[226], ['Name'] = "Part"})
end
if generatedParts[227] then
    table.insert(resizes, {['Part'] = generatedParts[227], ['CFrame'] = (origin + offset) * CFrame.new(-6.925, 0.400, -130.900, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[227], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[227], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[227], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[227], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[227], ['Name'] = "Part"})
end
if generatedParts[228] then
    table.insert(resizes, {['Part'] = generatedParts[228], ['CFrame'] = (origin + offset) * CFrame.new(-26.863, 0.400, -129.331, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[228], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[228], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[228], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[228], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[228], ['Name'] = "Part"})
end
if generatedParts[229] then
    table.insert(resizes, {['Part'] = generatedParts[229], ['CFrame'] = (origin + offset) * CFrame.new(-22.876, 0.400, -129.644, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[229], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[229], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[229], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[229], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[229], ['Name'] = "Part"})
end
if generatedParts[230] then
    table.insert(resizes, {['Part'] = generatedParts[230], ['CFrame'] = (origin + offset) * CFrame.new(-63.765, 0.400, -48.629, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[230], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[230], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[230], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[230], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[230], ['Name'] = "Part"})
end
if generatedParts[231] then
    table.insert(resizes, {['Part'] = generatedParts[231], ['CFrame'] = (origin + offset) * CFrame.new(-59.777, 0.400, -48.943, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[231], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[231], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[231], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[231], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[231], ['Name'] = "Part"})
end
if generatedParts[232] then
    table.insert(resizes, {['Part'] = generatedParts[232], ['CFrame'] = (origin + offset) * CFrame.new(-35.841, 0.400, -141.565, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[232], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[232], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[232], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[232], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[232], ['Name'] = "Part"})
end
if generatedParts[233] then
    table.insert(resizes, {['Part'] = generatedParts[233], ['CFrame'] = (origin + offset) * CFrame.new(-31.853, 0.400, -141.879, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[233], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[233], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[233], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[233], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[233], ['Name'] = "Part"})
end
if generatedParts[234] then
    table.insert(resizes, {['Part'] = generatedParts[234], ['CFrame'] = (origin + offset) * CFrame.new(-11.914, 0.400, -143.448, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[234], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[234], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[234], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[234], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[234], ['Name'] = "Part"})
end
if generatedParts[235] then
    table.insert(resizes, {['Part'] = generatedParts[235], ['CFrame'] = (origin + offset) * CFrame.new(-7.927, 0.400, -143.762, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[235], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[235], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[235], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[235], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[235], ['Name'] = "Part"})
end
if generatedParts[236] then
    table.insert(resizes, {['Part'] = generatedParts[236], ['CFrame'] = (origin + offset) * CFrame.new(-23.878, 0.400, -142.507, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[236], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[236], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[236], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[236], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[236], ['Name'] = "Part"})
end
if generatedParts[237] then
    table.insert(resizes, {['Part'] = generatedParts[237], ['CFrame'] = (origin + offset) * CFrame.new(-27.865, 0.400, -142.193, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[237], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[237], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[237], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[237], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[237], ['Name'] = "Part"})
end
if generatedParts[238] then
    table.insert(resizes, {['Part'] = generatedParts[238], ['CFrame'] = (origin + offset) * CFrame.new(-19.890, 0.400, -142.821, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[238], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[238], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[238], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[238], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[238], ['Name'] = "Part"})
end
if generatedParts[239] then
    table.insert(resizes, {['Part'] = generatedParts[239], ['CFrame'] = (origin + offset) * CFrame.new(-15.903, 0.400, -143.134, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[239], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[239], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[239], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[239], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[239], ['Name'] = "Part"})
end
if generatedParts[240] then
    table.insert(resizes, {['Part'] = generatedParts[240], ['CFrame'] = (origin + offset) * CFrame.new(-44.776, 0.400, -102.033, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[240], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[240], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[240], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[240], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[240], ['Name'] = "Part"})
end
if generatedParts[241] then
    table.insert(resizes, {['Part'] = generatedParts[241], ['CFrame'] = (origin + offset) * CFrame.new(-48.765, 0.400, -101.719, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[241], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[241], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[241], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[241], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[241], ['Name'] = "Part"})
end
if generatedParts[242] then
    table.insert(resizes, {['Part'] = generatedParts[242], ['CFrame'] = (origin + offset) * CFrame.new(-36.800, 0.400, -102.661, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[242], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[242], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[242], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[242], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[242], ['Name'] = "Part"})
end
if generatedParts[243] then
    table.insert(resizes, {['Part'] = generatedParts[243], ['CFrame'] = (origin + offset) * CFrame.new(-40.788, 0.400, -102.347, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[243], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[243], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[243], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[243], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[243], ['Name'] = "Part"})
end
if generatedParts[244] then
    table.insert(resizes, {['Part'] = generatedParts[244], ['CFrame'] = (origin + offset) * CFrame.new(-80.716, 0.400, -150.973, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[244], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[244], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[244], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[244], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[244], ['Name'] = "Part"})
end
if generatedParts[245] then
    table.insert(resizes, {['Part'] = generatedParts[245], ['CFrame'] = (origin + offset) * CFrame.new(-84.704, 0.400, -150.659, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[245], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[245], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[245], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[245], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[245], ['Name'] = "Part"})
end
if generatedParts[246] then
    table.insert(resizes, {['Part'] = generatedParts[246], ['CFrame'] = (origin + offset) * CFrame.new(-25.850, 0.400, -116.461, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[246], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[246], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[246], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[246], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[246], ['Name'] = "Part"})
end
if generatedParts[247] then
    table.insert(resizes, {['Part'] = generatedParts[247], ['CFrame'] = (origin + offset) * CFrame.new(-21.863, 0.400, -116.775, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[247], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[247], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[247], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[247], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[247], ['Name'] = "Part"})
end
if generatedParts[248] then
    table.insert(resizes, {['Part'] = generatedParts[248], ['CFrame'] = (origin + offset) * CFrame.new(-17.875, 0.400, -117.089, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[248], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[248], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[248], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[248], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[248], ['Name'] = "Part"})
end
if generatedParts[249] then
    table.insert(resizes, {['Part'] = generatedParts[249], ['CFrame'] = (origin + offset) * CFrame.new(-13.888, 0.400, -117.403, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[249], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[249], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[249], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[249], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[249], ['Name'] = "Part"})
end
if generatedParts[250] then
    table.insert(resizes, {['Part'] = generatedParts[250], ['CFrame'] = (origin + offset) * CFrame.new(-29.838, 0.400, -116.147, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[250], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[250], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[250], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[250], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[250], ['Name'] = "Part"})
end
if generatedParts[251] then
    table.insert(resizes, {['Part'] = generatedParts[251], ['CFrame'] = (origin + offset) * CFrame.new(-33.825, 0.400, -115.834, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[251], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[251], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[251], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[251], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[251], ['Name'] = "Part"})
end
if generatedParts[252] then
    table.insert(resizes, {['Part'] = generatedParts[252], ['CFrame'] = (origin + offset) * CFrame.new(-5.912, 0.400, -118.030, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[252], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[252], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[252], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[252], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[252], ['Name'] = "Part"})
end
if generatedParts[253] then
    table.insert(resizes, {['Part'] = generatedParts[253], ['CFrame'] = (origin + offset) * CFrame.new(-9.900, 0.400, -117.717, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[253], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[253], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[253], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[253], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[253], ['Name'] = "Part"})
end
if generatedParts[254] then
    table.insert(resizes, {['Part'] = generatedParts[254], ['CFrame'] = (origin + offset) * CFrame.new(-64.777, 0.400, -61.489, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[254], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[254], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[254], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[254], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[254], ['Name'] = "Part"})
end
if generatedParts[255] then
    table.insert(resizes, {['Part'] = generatedParts[255], ['CFrame'] = (origin + offset) * CFrame.new(-60.789, 0.400, -61.803, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[255], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[255], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[255], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[255], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[255], ['Name'] = "Part"})
end
if generatedParts[256] then
    table.insert(resizes, {['Part'] = generatedParts[256], ['CFrame'] = (origin + offset) * CFrame.new(-4.977, 0.400, -53.256, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[256], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[256], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[256], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[256], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[256], ['Name'] = "Part"})
end
if generatedParts[257] then
    table.insert(resizes, {['Part'] = generatedParts[257], ['CFrame'] = (origin + offset) * CFrame.new(-8.965, 0.400, -52.942, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[257], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[257], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[257], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[257], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[257], ['Name'] = "Part"})
end
if generatedParts[258] then
    table.insert(resizes, {['Part'] = generatedParts[258], ['CFrame'] = (origin + offset) * CFrame.new(-85.042, 1.000, -155.344, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.400, 0.200, 2.400)})
    table.insert(colors, {['Part'] = generatedParts[258], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[258], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[258], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[258], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[258], ['Name'] = "Part"})
end
if generatedParts[259] then
    table.insert(resizes, {['Part'] = generatedParts[259], ['CFrame'] = (origin + offset) * CFrame.new(-85.042, 1.000, -155.344, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 0.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[259], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[259], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.400})
    table.insert(anchors, {['Part'] = generatedParts[259], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[259], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[259], ['Name'] = "Light"})
end
if generatedParts[260] then
    table.insert(resizes, {['Part'] = generatedParts[260], ['CFrame'] = (origin + offset) * CFrame.new(-72.742, 0.400, -151.601, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[260], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[260], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[260], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[260], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[260], ['Name'] = "Part"})
end
if generatedParts[261] then
    table.insert(resizes, {['Part'] = generatedParts[261], ['CFrame'] = (origin + offset) * CFrame.new(-76.729, 0.400, -151.287, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[261], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[261], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[261], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[261], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[261], ['Name'] = "Part"})
end
if generatedParts[262] then
    table.insert(resizes, {['Part'] = generatedParts[262], ['CFrame'] = (origin + offset) * CFrame.new(-81.969, 86.660, -81.181, -0.000, -0.078, 0.997, -1.000, 0.000, -0.000, -0.000, -0.997, -0.078), ['Size'] = Vector3.new(83.280, 9.510, 8.190)})
    table.insert(colors, {['Part'] = generatedParts[262], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[262], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[262], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[262], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[262], ['Name'] = "Part"})
end
if generatedParts[263] then
    table.insert(resizes, {['Part'] = generatedParts[263], ['CFrame'] = (origin + offset) * CFrame.new(-84.119, 42.750, -80.956, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(4.490, 10.160, 4.540)})
    table.insert(colors, {['Part'] = generatedParts[263], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[263], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[263], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[263], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[263], ['Name'] = "Part"})
end
if generatedParts[264] then
    table.insert(resizes, {['Part'] = generatedParts[264], ['CFrame'] = (origin + offset) * CFrame.new(-15.954, 0.400, -91.278, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[264], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[264], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[264], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[264], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[264], ['Name'] = "Part"})
end
if generatedParts[265] then
    table.insert(resizes, {['Part'] = generatedParts[265], ['CFrame'] = (origin + offset) * CFrame.new(-11.967, 0.400, -91.592, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[265], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[265], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[265], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[265], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[265], ['Name'] = "Part"})
end
if generatedParts[266] then
    table.insert(resizes, {['Part'] = generatedParts[266], ['CFrame'] = (origin + offset) * CFrame.new(-53.668, 4.465, -66.900, 0.415, 0.000, -0.910, 0.000, 1.000, 0.000, 0.910, 0.000, 0.415), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[266], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[266], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[266], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[266], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[266], ['Name'] = "Part"})
end
if generatedParts[267] then
    table.insert(resizes, {['Part'] = generatedParts[267], ['CFrame'] = (origin + offset) * CFrame.new(-54.270, 4.485, -66.799, 0.165, 0.000, -0.986, 0.000, 1.000, 0.000, 0.986, 0.000, 0.165), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[267], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[267], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[267], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[267], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[267], ['Name'] = "Part"})
end
if generatedParts[268] then
    table.insert(resizes, {['Part'] = generatedParts[268], ['CFrame'] = (origin + offset) * CFrame.new(-53.606, 4.585, -67.919, 0.772, 0.000, 0.636, 0.000, 1.000, 0.000, -0.636, 0.000, 0.772), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[268], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[268], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[268], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[268], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[268], ['Name'] = "Part"})
end
if generatedParts[269] then
    table.insert(resizes, {['Part'] = generatedParts[269], ['CFrame'] = (origin + offset) * CFrame.new(-54.330, 4.470, -67.668, -0.000, 0.078, -0.997, -1.000, -0.000, 0.000, -0.000, 0.997, 0.078), ['Size'] = Vector3.new(1.980, 1.250, 3.620)})
    table.insert(colors, {['Part'] = generatedParts[269], ['Color'] = Color3.new(0.416, 0.224, 0.035), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[269], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[269], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[269], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[269], ['Name'] = "Part"})
end
if generatedParts[270] then
    table.insert(resizes, {['Part'] = generatedParts[270], ['CFrame'] = (origin + offset) * CFrame.new(-55.365, 4.455, -67.630, -0.995, 0.000, 0.096, 0.000, 1.000, 0.000, -0.096, 0.000, -0.995), ['Size'] = Vector3.new(1.150, 1.610, 2.550)})
    table.insert(colors, {['Part'] = generatedParts[270], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[270], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[270], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[270], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[270], ['Name'] = "Part"})
end
if generatedParts[271] then
    table.insert(resizes, {['Part'] = generatedParts[271], ['CFrame'] = (origin + offset) * CFrame.new(-54.955, 4.475, -66.746, 0.581, 0.000, 0.814, 0.000, 1.000, 0.000, -0.814, 0.000, 0.581), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[271], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[271], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[271], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[271], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[271], ['Name'] = "Part"})
end
if generatedParts[272] then
    table.insert(resizes, {['Part'] = generatedParts[272], ['CFrame'] = (origin + offset) * CFrame.new(-53.271, 4.465, -67.390, -0.964, 0.000, 0.267, 0.000, 1.000, 0.000, -0.267, 0.000, -0.964), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[272], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[272], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[272], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[272], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[272], ['Name'] = "Part"})
end
if generatedParts[273] then
    table.insert(resizes, {['Part'] = generatedParts[273], ['CFrame'] = (origin + offset) * CFrame.new(-54.445, 4.465, -68.672, -0.165, 0.000, 0.986, 0.000, 1.000, 0.000, -0.986, 0.000, -0.165), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[273], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[273], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[273], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[273], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[273], ['Name'] = "Part"})
end
if generatedParts[274] then
    table.insert(resizes, {['Part'] = generatedParts[274], ['CFrame'] = (origin + offset) * CFrame.new(-53.952, 4.565, -68.422, 0.649, 0.000, 0.760, 0.000, 1.000, 0.000, -0.760, 0.000, 0.649), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[274], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[274], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[274], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[274], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[274], ['Name'] = "Part"})
end
if generatedParts[275] then
    table.insert(resizes, {['Part'] = generatedParts[275], ['CFrame'] = (origin + offset) * CFrame.new(-54.981, 4.475, -68.219, -0.760, 0.000, 0.649, 0.000, 1.000, 0.000, -0.649, 0.000, -0.760), ['Size'] = Vector3.new(1.150, 1.610, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[275], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[275], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[275], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[275], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[275], ['Name'] = "Part"})
end
if generatedParts[276] then
    table.insert(resizes, {['Part'] = generatedParts[276], ['CFrame'] = (origin + offset) * CFrame.new(-54.360, 1.850, -67.741, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(2.840, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[276], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[276], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[276], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[276], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[276], ['Name'] = "Part"})
end
if generatedParts[277] then
    table.insert(resizes, {['Part'] = generatedParts[277], ['CFrame'] = (origin + offset) * CFrame.new(-54.360, 3.370, -67.741, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.200, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[277], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[277], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[277], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[277], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[277], ['Name'] = "Part"})
end
if generatedParts[278] then
    table.insert(resizes, {['Part'] = generatedParts[278], ['CFrame'] = (origin + offset) * CFrame.new(-54.360, 12.455, -67.741, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(13.590, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[278], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[278], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[278], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[278], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[278], ['Name'] = "Part"})
end
if generatedParts[279] then
    table.insert(resizes, {['Part'] = generatedParts[279], ['CFrame'] = (origin + offset) * CFrame.new(-54.360, 5.560, -67.741, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.200, 2.870, 3.220)})
    table.insert(colors, {['Part'] = generatedParts[279], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[279], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[279], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[279], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[279], ['Name'] = "Part"})
end
if generatedParts[280] then
    table.insert(resizes, {['Part'] = generatedParts[280], ['CFrame'] = (origin + offset) * CFrame.new(-74.715, 0.400, -125.565, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[280], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[280], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[280], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[280], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[280], ['Name'] = "Part"})
end
if generatedParts[281] then
    table.insert(resizes, {['Part'] = generatedParts[281], ['CFrame'] = (origin + offset) * CFrame.new(-70.728, 0.400, -125.878, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[281], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[281], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[281], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[281], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[281], ['Name'] = "Part"})
end
if generatedParts[282] then
    table.insert(resizes, {['Part'] = generatedParts[282], ['CFrame'] = (origin + offset) * CFrame.new(-31.645, 1.000, -95.534, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 0.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[282], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[282], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.400})
    table.insert(anchors, {['Part'] = generatedParts[282], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[282], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[282], ['Name'] = "Light"})
end
if generatedParts[283] then
    table.insert(resizes, {['Part'] = generatedParts[283], ['CFrame'] = (origin + offset) * CFrame.new(-31.645, 1.000, -95.534, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.400, 0.200, 2.400)})
    table.insert(colors, {['Part'] = generatedParts[283], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[283], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[283], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[283], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[283], ['Name'] = "Part"})
end
if generatedParts[284] then
    table.insert(resizes, {['Part'] = generatedParts[284], ['CFrame'] = (origin + offset) * CFrame.new(-81.676, 0.400, -112.068, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[284], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[284], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[284], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[284], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[284], ['Name'] = "Part"})
end
if generatedParts[285] then
    table.insert(resizes, {['Part'] = generatedParts[285], ['CFrame'] = (origin + offset) * CFrame.new(-77.689, 0.400, -112.381, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[285], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[285], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[285], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[285], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[285], ['Name'] = "Part"})
end
if generatedParts[286] then
    table.insert(resizes, {['Part'] = generatedParts[286], ['CFrame'] = (origin + offset) * CFrame.new(-65.467, 1.861, 43.977, -0.000, 0.000, -1.000, 0.000, 1.000, -0.000, 1.000, 0.000, -0.000), ['Size'] = Vector3.new(0.655, 4.423, 0.491)})
    table.insert(colors, {['Part'] = generatedParts[286], ['Color'] = Color3.new(1.000, 0.690, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[286], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[286], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[286], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[286], ['Name'] = "Pole"})
end
if generatedParts[287] then
    table.insert(resizes, {['Part'] = generatedParts[287], ['CFrame'] = (origin + offset) * CFrame.new(-65.467, 1.861, 37.752, -0.000, 0.000, -1.000, 0.000, 1.000, -0.000, 1.000, 0.000, -0.000), ['Size'] = Vector3.new(0.655, 4.423, 0.491)})
    table.insert(colors, {['Part'] = generatedParts[287], ['Color'] = Color3.new(1.000, 0.690, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[287], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[287], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[287], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[287], ['Name'] = "Pole"})
end
if generatedParts[288] then
    table.insert(resizes, {['Part'] = generatedParts[288], ['CFrame'] = (origin + offset) * CFrame.new(-65.467, 6.694, 40.864, -0.000, 0.000, -1.000, 0.000, 1.000, -0.000, 1.000, 0.000, -0.000), ['Size'] = Vector3.new(6.880, 5.242, 0.491)})
    table.insert(colors, {['Part'] = generatedParts[288], ['Color'] = Color3.new(1.000, 0.690, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[288], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[288], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[288], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[288], ['Name'] = "Sign"})
end
if generatedParts[289] then
    table.insert(resizes, {['Part'] = generatedParts[289], ['CFrame'] = (origin + offset) * CFrame.new(-19.942, 0.400, -90.965, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[289], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[289], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[289], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[289], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[289], ['Name'] = "Part"})
end
if generatedParts[290] then
    table.insert(resizes, {['Part'] = generatedParts[290], ['CFrame'] = (origin + offset) * CFrame.new(-23.929, 0.400, -90.651, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[290], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[290], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[290], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[290], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[290], ['Name'] = "Part"})
end
if generatedParts[291] then
    table.insert(resizes, {['Part'] = generatedParts[291], ['CFrame'] = (origin + offset) * CFrame.new(-42.852, 0.399, -76.175, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[291], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[291], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[291], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[291], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[291], ['Name'] = "Part"})
end
if generatedParts[292] then
    table.insert(resizes, {['Part'] = generatedParts[292], ['CFrame'] = (origin + offset) * CFrame.new(-38.864, 0.399, -76.488, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[292], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[292], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[292], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[292], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[292], ['Name'] = "Part"})
end
if generatedParts[293] then
    table.insert(resizes, {['Part'] = generatedParts[293], ['CFrame'] = (origin + offset) * CFrame.new(-39.880, 0.399, -89.398, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[293], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[293], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[293], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[293], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[293], ['Name'] = "Part"})
end
if generatedParts[294] then
    table.insert(resizes, {['Part'] = generatedParts[294], ['CFrame'] = (origin + offset) * CFrame.new(-43.868, 0.399, -89.085, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[294], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[294], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[294], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[294], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[294], ['Name'] = "Part"})
end
if generatedParts[295] then
    table.insert(resizes, {['Part'] = generatedParts[295], ['CFrame'] = (origin + offset) * CFrame.new(-36.853, 0.400, -154.425, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[295], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[295], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[295], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[295], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[295], ['Name'] = "Part"})
end
if generatedParts[296] then
    table.insert(resizes, {['Part'] = generatedParts[296], ['CFrame'] = (origin + offset) * CFrame.new(-32.865, 0.400, -154.739, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[296], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[296], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[296], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[296], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[296], ['Name'] = "Part"})
end
if generatedParts[297] then
    table.insert(resizes, {['Part'] = generatedParts[297], ['CFrame'] = (origin + offset) * CFrame.new(-20.902, 0.400, -155.681, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[297], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[297], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[297], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[297], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[297], ['Name'] = "Part"})
end
if generatedParts[298] then
    table.insert(resizes, {['Part'] = generatedParts[298], ['CFrame'] = (origin + offset) * CFrame.new(-16.915, 0.400, -155.994, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[298], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[298], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[298], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[298], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[298], ['Name'] = "Part"})
end
if generatedParts[299] then
    table.insert(resizes, {['Part'] = generatedParts[299], ['CFrame'] = (origin + offset) * CFrame.new(-24.890, 0.400, -155.367, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[299], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[299], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[299], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[299], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[299], ['Name'] = "Part"})
end
if generatedParts[300] then
    table.insert(resizes, {['Part'] = generatedParts[300], ['CFrame'] = (origin + offset) * CFrame.new(-28.878, 0.400, -155.053, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[300], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[300], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[300], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[300], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[300], ['Name'] = "Part"})
end
if generatedParts[301] then
    table.insert(resizes, {['Part'] = generatedParts[301], ['CFrame'] = (origin + offset) * CFrame.new(-8.939, 0.400, -156.622, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[301], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[301], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[301], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[301], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[301], ['Name'] = "Part"})
end
if generatedParts[302] then
    table.insert(resizes, {['Part'] = generatedParts[302], ['CFrame'] = (origin + offset) * CFrame.new(-12.927, 0.400, -156.308, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[302], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[302], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[302], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[302], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[302], ['Name'] = "Part"})
end
if generatedParts[303] then
    table.insert(resizes, {['Part'] = generatedParts[303], ['CFrame'] = (origin + offset) * CFrame.new(-73.702, 0.400, -112.695, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[303], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[303], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[303], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[303], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[303], ['Name'] = "Part"})
end
if generatedParts[304] then
    table.insert(resizes, {['Part'] = generatedParts[304], ['CFrame'] = (origin + offset) * CFrame.new(-69.715, 0.400, -113.009, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[304], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[304], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[304], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[304], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[304], ['Name'] = "Part"})
end
if generatedParts[305] then
    table.insert(resizes, {['Part'] = generatedParts[305], ['CFrame'] = (origin + offset) * CFrame.new(-21.325, 1.000, -162.006, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 0.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[305], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[305], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.400})
    table.insert(anchors, {['Part'] = generatedParts[305], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[305], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[305], ['Name'] = "Light"})
end
if generatedParts[306] then
    table.insert(resizes, {['Part'] = generatedParts[306], ['CFrame'] = (origin + offset) * CFrame.new(-21.325, 1.000, -162.006, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.400, 0.200, 2.400)})
    table.insert(colors, {['Part'] = generatedParts[306], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[306], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[306], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[306], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[306], ['Name'] = "Part"})
end
if generatedParts[307] then
    table.insert(resizes, {['Part'] = generatedParts[307], ['CFrame'] = (origin + offset) * CFrame.new(-3.990, 0.400, -92.220, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[307], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[307], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[307], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[307], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[307], ['Name'] = "Part"})
end
if generatedParts[308] then
    table.insert(resizes, {['Part'] = generatedParts[308], ['CFrame'] = (origin + offset) * CFrame.new(-7.978, 0.400, -91.906, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[308], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[308], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[308], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[308], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[308], ['Name'] = "Part"})
end
if generatedParts[309] then
    table.insert(resizes, {['Part'] = generatedParts[309], ['CFrame'] = (origin + offset) * CFrame.new(-2.978, 0.399, -79.353, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[309], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[309], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[309], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[309], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[309], ['Name'] = "Part"})
end
if generatedParts[310] then
    table.insert(resizes, {['Part'] = generatedParts[310], ['CFrame'] = (origin + offset) * CFrame.new(-6.966, 0.399, -79.039, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[310], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[310], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[310], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[310], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[310], ['Name'] = "Part"})
end
if generatedParts[311] then
    table.insert(resizes, {['Part'] = generatedParts[311], ['CFrame'] = (origin + offset) * CFrame.new(-72.753, 0.400, -60.862, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[311], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[311], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[311], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[311], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[311], ['Name'] = "Part"})
end
if generatedParts[312] then
    table.insert(resizes, {['Part'] = generatedParts[312], ['CFrame'] = (origin + offset) * CFrame.new(-68.765, 0.400, -61.175, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[312], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[312], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[312], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[312], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[312], ['Name'] = "Part"})
end
if generatedParts[313] then
    table.insert(resizes, {['Part'] = generatedParts[313], ['CFrame'] = (origin + offset) * CFrame.new(-52.752, 1.000, -94.869, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.400, 0.200, 2.400)})
    table.insert(colors, {['Part'] = generatedParts[313], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[313], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[313], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[313], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[313], ['Name'] = "Part"})
end
if generatedParts[314] then
    table.insert(resizes, {['Part'] = generatedParts[314], ['CFrame'] = (origin + offset) * CFrame.new(-52.752, 1.000, -94.869, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 0.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[314], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[314], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.400})
    table.insert(anchors, {['Part'] = generatedParts[314], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[314], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[314], ['Name'] = "Light"})
end
if generatedParts[315] then
    table.insert(resizes, {['Part'] = generatedParts[315], ['CFrame'] = (origin + offset) * CFrame.new(-13.966, 0.400, -65.498, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[315], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[315], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[315], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[315], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[315], ['Name'] = "Part"})
end
if generatedParts[316] then
    table.insert(resizes, {['Part'] = generatedParts[316], ['CFrame'] = (origin + offset) * CFrame.new(-17.953, 0.400, -65.184, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[316], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[316], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[316], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[316], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[316], ['Name'] = "Part"})
end
if generatedParts[317] then
    table.insert(resizes, {['Part'] = generatedParts[317], ['CFrame'] = (origin + offset) * CFrame.new(-42.597, 8.600, 5.494, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), ['Size'] = Vector3.new(8.400, 6.400, 0.600)})
    table.insert(colors, {['Part'] = generatedParts[317], ['Color'] = Color3.new(1.000, 0.690, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[317], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[317], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[317], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[317], ['Name'] = "Sign"})
end
if generatedParts[318] then
    table.insert(resizes, {['Part'] = generatedParts[318], ['CFrame'] = (origin + offset) * CFrame.new(-39.910, 2.700, 2.807, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), ['Size'] = Vector3.new(0.800, 5.400, 0.600)})
    table.insert(colors, {['Part'] = generatedParts[318], ['Color'] = Color3.new(1.000, 0.690, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[318], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[318], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[318], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[318], ['Name'] = "Pole"})
end
if generatedParts[319] then
    table.insert(resizes, {['Part'] = generatedParts[319], ['CFrame'] = (origin + offset) * CFrame.new(-45.284, 2.700, 8.181, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), ['Size'] = Vector3.new(0.800, 5.400, 0.600)})
    table.insert(colors, {['Part'] = generatedParts[319], ['Color'] = Color3.new(1.000, 0.690, 0.000), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[319], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[319], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[319], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[319], ['Name'] = "Pole"})
end
if generatedParts[320] then
    table.insert(resizes, {['Part'] = generatedParts[320], ['CFrame'] = (origin + offset) * CFrame.new(0.081, 42.750, -87.583, 0.997, 0.078, 0.000, -0.000, 0.000, -1.000, -0.078, 0.997, 0.000), ['Size'] = Vector3.new(4.490, 10.160, 4.540)})
    table.insert(colors, {['Part'] = generatedParts[320], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[320], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[320], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[320], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[320], ['Name'] = "Part"})
end
if generatedParts[321] then
    table.insert(resizes, {['Part'] = generatedParts[321], ['CFrame'] = (origin + offset) * CFrame.new(-2.068, 86.660, -87.359, 0.000, 0.078, -0.997, -1.000, 0.000, -0.000, 0.000, 0.997, 0.078), ['Size'] = Vector3.new(83.280, 9.510, 8.190)})
    table.insert(colors, {['Part'] = generatedParts[321], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[321], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[321], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[321], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[321], ['Name'] = "Part"})
end
if generatedParts[322] then
    table.insert(resizes, {['Part'] = generatedParts[322], ['CFrame'] = (origin + offset) * CFrame.new(-51.192, 1.000, -68.041, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.400, 0.200, 2.400)})
    table.insert(colors, {['Part'] = generatedParts[322], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[322], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[322], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[322], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[322], ['Name'] = "Part"})
end
if generatedParts[323] then
    table.insert(resizes, {['Part'] = generatedParts[323], ['CFrame'] = (origin + offset) * CFrame.new(-51.192, 1.000, -68.041, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 0.200, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[323], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[323], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.400})
    table.insert(anchors, {['Part'] = generatedParts[323], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[323], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[323], ['Name'] = "Light"})
end
if generatedParts[324] then
    table.insert(resizes, {['Part'] = generatedParts[324], ['CFrame'] = (origin + offset) * CFrame.new(-83.692, 0.400, -137.799, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[324], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[324], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[324], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[324], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[324], ['Name'] = "Part"})
end
if generatedParts[325] then
    table.insert(resizes, {['Part'] = generatedParts[325], ['CFrame'] = (origin + offset) * CFrame.new(-79.704, 0.400, -138.113, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[325], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[325], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[325], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[325], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[325], ['Name'] = "Part"})
end
if generatedParts[326] then
    table.insert(resizes, {['Part'] = generatedParts[326], ['CFrame'] = (origin + offset) * CFrame.new(-12.953, 0.400, -52.628, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[326], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[326], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[326], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[326], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[326], ['Name'] = "Part"})
end
if generatedParts[327] then
    table.insert(resizes, {['Part'] = generatedParts[327], ['CFrame'] = (origin + offset) * CFrame.new(-16.940, 0.400, -52.314, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[327], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[327], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[327], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[327], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[327], ['Name'] = "Part"})
end
if generatedParts[328] then
    table.insert(resizes, {['Part'] = generatedParts[328], ['CFrame'] = (origin + offset) * CFrame.new(-30.000, 1.450, 40.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(12.000, 1.000, 12.000)})
    table.insert(colors, {['Part'] = generatedParts[328], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[328], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[328], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[328], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[328], ['Name'] = "SpawnLocation"})
end
if generatedParts[329] then
    table.insert(resizes, {['Part'] = generatedParts[329], ['CFrame'] = (origin + offset) * CFrame.new(-42.696, 46.890, -84.151, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(70.380, 119.130, 3.780)})
    table.insert(colors, {['Part'] = generatedParts[329], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[329], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[329], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[329], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[329], ['Name'] = "Part"})
end
if generatedParts[330] then
    table.insert(resizes, {['Part'] = generatedParts[330], ['CFrame'] = (origin + offset) * CFrame.new(-69.986, 0.408, -67.579, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(26.530, 6.510, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[330], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[330], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[330], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[330], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[330], ['Name'] = "Part"})
end
if generatedParts[331] then
    table.insert(resizes, {['Part'] = generatedParts[331], ['CFrame'] = (origin + offset) * CFrame.new(-65.220, 0.400, -42.070, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(32.010, 6.400, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[331], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[331], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[331], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[331], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[331], ['Name'] = "Part"})
end
if generatedParts[332] then
    table.insert(resizes, {['Part'] = generatedParts[332], ['CFrame'] = (origin + offset) * CFrame.new(-66.424, 20.320, -37.687, -0.078, 0.997, -0.000, -0.000, -0.000, -1.000, -0.997, -0.078, 0.000), ['Size'] = Vector3.new(2.050, 29.000, 39.940)})
    table.insert(colors, {['Part'] = generatedParts[332], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[332], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[332], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[332], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[332], ['Name'] = "Part"})
end
if generatedParts[333] then
    table.insert(resizes, {['Part'] = generatedParts[333], ['CFrame'] = (origin + offset) * CFrame.new(-83.007, 20.315, -50.841, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(2.020, 26.820, 39.970)})
    table.insert(colors, {['Part'] = generatedParts[333], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[333], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[333], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[333], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[333], ['Name'] = "Part"})
end
if generatedParts[334] then
    table.insert(resizes, {['Part'] = generatedParts[334], ['CFrame'] = (origin + offset) * CFrame.new(-66.265, 0.400, -54.907, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(32.020, 6.480, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[334], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[334], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[334], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[334], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[334], ['Name'] = "Part"})
end
if generatedParts[335] then
    table.insert(resizes, {['Part'] = generatedParts[335], ['CFrame'] = (origin + offset) * CFrame.new(-79.871, 1.300, -9.719, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[335], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[335], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[335], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[335], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[335], ['Name'] = "Part"})
end
if generatedParts[336] then
    table.insert(resizes, {['Part'] = generatedParts[336], ['CFrame'] = (origin + offset) * CFrame.new(-77.604, 2.800, -9.828, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[336], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[336], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[336], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[336], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[336], ['Name'] = "Part"})
end
if generatedParts[337] then
    table.insert(resizes, {['Part'] = generatedParts[337], ['CFrame'] = (origin + offset) * CFrame.new(-76.740, 0.400, -60.548, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[337], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[337], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[337], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[337], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[337], ['Name'] = "Part"})
end
if generatedParts[338] then
    table.insert(resizes, {['Part'] = generatedParts[338], ['CFrame'] = (origin + offset) * CFrame.new(-77.604, 1.300, -9.828, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[338], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[338], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[338], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[338], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[338], ['Name'] = "Part"})
end
if generatedParts[339] then
    table.insert(resizes, {['Part'] = generatedParts[339], ['CFrame'] = (origin + offset) * CFrame.new(-77.604, 10.799, -9.828, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[339], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[339], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[339], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[339], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[339], ['Name'] = "Part"})
end
if generatedParts[340] then
    table.insert(resizes, {['Part'] = generatedParts[340], ['CFrame'] = (origin + offset) * CFrame.new(-79.709, 0.400, -47.359, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(4.010, 6.480, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[340], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[340], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[340], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[340], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[340], ['Name'] = "Part"})
end
if generatedParts[341] then
    table.insert(resizes, {['Part'] = generatedParts[341], ['CFrame'] = (origin + offset) * CFrame.new(-81.868, 10.800, -36.374, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[341], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[341], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[341], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[341], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[341], ['Name'] = "Part"})
end
if generatedParts[342] then
    table.insert(resizes, {['Part'] = generatedParts[342], ['CFrame'] = (origin + offset) * CFrame.new(-75.728, 0.400, -47.687, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[342], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[342], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[342], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[342], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[342], ['Name'] = "Part"})
end
if generatedParts[343] then
    table.insert(resizes, {['Part'] = generatedParts[343], ['CFrame'] = (origin + offset) * CFrame.new(-80.724, 0.400, -60.249, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(4.030, 6.420, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[343], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[343], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[343], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[343], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[343], ['Name'] = "Part"})
end
if generatedParts[344] then
    table.insert(resizes, {['Part'] = generatedParts[344], ['CFrame'] = (origin + offset) * CFrame.new(-79.871, 10.799, -9.719, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[344], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[344], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[344], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[344], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[344], ['Name'] = "Part"})
end
if generatedParts[345] then
    table.insert(resizes, {['Part'] = generatedParts[345], ['CFrame'] = (origin + offset) * CFrame.new(-81.868, 1.300, -36.374, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[345], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[345], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[345], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[345], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[345], ['Name'] = "Part"})
end
if generatedParts[346] then
    table.insert(resizes, {['Part'] = generatedParts[346], ['CFrame'] = (origin + offset) * CFrame.new(-79.871, 2.800, -9.719, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[346], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[346], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[346], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[346], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[346], ['Name'] = "Part"})
end
if generatedParts[347] then
    table.insert(resizes, {['Part'] = generatedParts[347], ['CFrame'] = (origin + offset) * CFrame.new(-81.868, 2.800, -36.374, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[347], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[347], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[347], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[347], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[347], ['Name'] = "Part"})
end
if generatedParts[348] then
    table.insert(resizes, {['Part'] = generatedParts[348], ['CFrame'] = (origin + offset) * CFrame.new(-42.304, 42.740, -87.828, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(79.980, 133.700, 4.520)})
    table.insert(colors, {['Part'] = generatedParts[348], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[348], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[348], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[348], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[348], ['Name'] = "Part"})
end
if generatedParts[349] then
    table.insert(resizes, {['Part'] = generatedParts[349], ['CFrame'] = (origin + offset) * CFrame.new(-34.599, 0.200, -24.272, -0.078, 0.997, -0.000, -0.000, -0.000, -1.000, -0.997, -0.078, 0.000), ['Size'] = Vector3.new(33.790, 97.330, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[349], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[349], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[349], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[349], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[349], ['Name'] = "Part"})
end
if generatedParts[350] then
    table.insert(resizes, {['Part'] = generatedParts[350], ['CFrame'] = (origin + offset) * CFrame.new(-40.777, 0.200, -103.337, -0.078, 0.997, -0.000, -0.000, -0.000, -1.000, -0.997, -0.078, 0.000), ['Size'] = Vector3.new(124.700, 97.240, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[350], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[350], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[350], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[350], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[350], ['Name'] = "Part"})
end
if generatedParts[351] then
    table.insert(resizes, {['Part'] = generatedParts[351], ['CFrame'] = (origin + offset) * CFrame.new(-41.365, 40.380, -88.705, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(91.030, 153.800, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[351], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[351], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[351], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[351], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[351], ['Name'] = "Part"})
end
if generatedParts[352] then
    table.insert(resizes, {['Part'] = generatedParts[352], ['CFrame'] = (origin + offset) * CFrame.new(-52.805, 0.400, -62.442, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(4.060, 6.470, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[352], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[352], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[352], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[352], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[352], ['Name'] = "Part"})
end
if generatedParts[353] then
    table.insert(resizes, {['Part'] = generatedParts[353], ['CFrame'] = (origin + offset) * CFrame.new(-56.801, 0.400, -62.117, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[353], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[353], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[353], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[353], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[353], ['Name'] = "Part"})
end
if generatedParts[354] then
    table.insert(resizes, {['Part'] = generatedParts[354], ['CFrame'] = (origin + offset) * CFrame.new(-25.912, 0.400, -64.538, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(4.030, 6.510, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[354], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[354], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[354], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[354], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[354], ['Name'] = "Part"})
end
if generatedParts[355] then
    table.insert(resizes, {['Part'] = generatedParts[355], ['CFrame'] = (origin + offset) * CFrame.new(-21.940, 0.400, -64.870, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[355], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[355], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[355], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[355], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[355], ['Name'] = "Part"})
end
if generatedParts[356] then
    table.insert(resizes, {['Part'] = generatedParts[356], ['CFrame'] = (origin + offset) * CFrame.new(-19.783, 1.300, -14.379, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[356], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[356], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[356], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[356], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[356], ['Name'] = "Part"})
end
if generatedParts[357] then
    table.insert(resizes, {['Part'] = generatedParts[357], ['CFrame'] = (origin + offset) * CFrame.new(-50.949, 2.800, -11.826, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[357], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[357], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[357], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[357], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[357], ['Name'] = "Part"})
end
if generatedParts[358] then
    table.insert(resizes, {['Part'] = generatedParts[358], ['CFrame'] = (origin + offset) * CFrame.new(-50.949, 10.800, -11.826, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[358], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[358], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[358], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[358], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[358], ['Name'] = "Part"})
end
if generatedParts[359] then
    table.insert(resizes, {['Part'] = generatedParts[359], ['CFrame'] = (origin + offset) * CFrame.new(-20.928, 0.400, -52.001, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[359], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[359], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[359], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[359], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[359], ['Name'] = "Part"})
end
if generatedParts[360] then
    table.insert(resizes, {['Part'] = generatedParts[360], ['CFrame'] = (origin + offset) * CFrame.new(-19.783, 2.800, -14.379, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[360], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[360], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[360], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[360], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[360], ['Name'] = "Part"})
end
if generatedParts[361] then
    table.insert(resizes, {['Part'] = generatedParts[361], ['CFrame'] = (origin + offset) * CFrame.new(-55.789, 0.400, -49.257, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[361], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[361], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[361], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[361], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[361], ['Name'] = "Part"})
end
if generatedParts[362] then
    table.insert(resizes, {['Part'] = generatedParts[362], ['CFrame'] = (origin + offset) * CFrame.new(-51.791, 0.400, -49.557, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(4.060, 6.440, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[362], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[362], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[362], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[362], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[362], ['Name'] = "Part"})
end
if generatedParts[363] then
    table.insert(resizes, {['Part'] = generatedParts[363], ['CFrame'] = (origin + offset) * CFrame.new(-19.783, 10.799, -14.379, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[363], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[363], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[363], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[363], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[363], ['Name'] = "Part"})
end
if generatedParts[364] then
    table.insert(resizes, {['Part'] = generatedParts[364], ['CFrame'] = (origin + offset) * CFrame.new(-50.812, 2.800, -39.020, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[364], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[364], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[364], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[364], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[364], ['Name'] = "Part"})
end
if generatedParts[365] then
    table.insert(resizes, {['Part'] = generatedParts[365], ['CFrame'] = (origin + offset) * CFrame.new(-48.694, 2.800, -12.104, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[365], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[365], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[365], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[365], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[365], ['Name'] = "Part"})
end
if generatedParts[366] then
    table.insert(resizes, {['Part'] = generatedParts[366], ['CFrame'] = (origin + offset) * CFrame.new(-22.038, 1.300, -14.101, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[366], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[366], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[366], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[366], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[366], ['Name'] = "Part"})
end
if generatedParts[367] then
    table.insert(resizes, {['Part'] = generatedParts[367], ['CFrame'] = (origin + offset) * CFrame.new(-24.156, 2.800, -41.018, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[367], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[367], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[367], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[367], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[367], ['Name'] = "Part"})
end
if generatedParts[368] then
    table.insert(resizes, {['Part'] = generatedParts[368], ['CFrame'] = (origin + offset) * CFrame.new(-24.156, 1.300, -41.018, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[368], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[368], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[368], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[368], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[368], ['Name'] = "Part"})
end
if generatedParts[369] then
    table.insert(resizes, {['Part'] = generatedParts[369], ['CFrame'] = (origin + offset) * CFrame.new(-22.038, 2.800, -14.101, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[369], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[369], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[369], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[369], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[369], ['Name'] = "Part"})
end
if generatedParts[370] then
    table.insert(resizes, {['Part'] = generatedParts[370], ['CFrame'] = (origin + offset) * CFrame.new(-48.694, 10.799, -12.104, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[370], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[370], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[370], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[370], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[370], ['Name'] = "Part"})
end
if generatedParts[371] then
    table.insert(resizes, {['Part'] = generatedParts[371], ['CFrame'] = (origin + offset) * CFrame.new(-50.949, 1.300, -11.826, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[371], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[371], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[371], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[371], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[371], ['Name'] = "Part"})
end
if generatedParts[372] then
    table.insert(resizes, {['Part'] = generatedParts[372], ['CFrame'] = (origin + offset) * CFrame.new(-24.871, 0.400, -51.640, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(3.960, 6.430, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[372], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[372], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[372], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[372], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[372], ['Name'] = "Part"})
end
if generatedParts[373] then
    table.insert(resizes, {['Part'] = generatedParts[373], ['CFrame'] = (origin + offset) * CFrame.new(-50.812, 1.300, -39.020, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[373], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[373], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[373], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[373], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[373], ['Name'] = "Part"})
end
if generatedParts[374] then
    table.insert(resizes, {['Part'] = generatedParts[374], ['CFrame'] = (origin + offset) * CFrame.new(-48.694, 1.300, -12.104, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[374], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[374], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[374], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[374], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[374], ['Name'] = "Part"})
end
if generatedParts[375] then
    table.insert(resizes, {['Part'] = generatedParts[375], ['CFrame'] = (origin + offset) * CFrame.new(-24.156, 10.800, -41.018, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[375], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[375], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[375], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[375], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[375], ['Name'] = "Part"})
end
if generatedParts[376] then
    table.insert(resizes, {['Part'] = generatedParts[376], ['CFrame'] = (origin + offset) * CFrame.new(-37.504, 0.400, -40.026, -0.078, 0.997, -0.000, -0.000, -0.000, -1.000, -0.997, -0.078, 0.000), ['Size'] = Vector3.new(1.920, 24.710, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[376], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[376], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[376], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[376], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[376], ['Name'] = "Part"})
end
if generatedParts[377] then
    table.insert(resizes, {['Part'] = generatedParts[377], ['CFrame'] = (origin + offset) * CFrame.new(-50.812, 10.799, -39.020, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[377], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[377], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[377], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[377], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[377], ['Name'] = "Part"})
end
if generatedParts[378] then
    table.insert(resizes, {['Part'] = generatedParts[378], ['CFrame'] = (origin + offset) * CFrame.new(-22.038, 10.800, -14.101, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[378], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[378], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[378], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[378], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[378], ['Name'] = "Part"})
end
if generatedParts[379] then
    table.insert(resizes, {['Part'] = generatedParts[379], ['CFrame'] = (origin + offset) * CFrame.new(-8.598, 20.295, -42.238, -0.078, 0.997, -0.000, -0.000, -0.000, -1.000, -0.997, -0.078, 0.000), ['Size'] = Vector3.new(2.050, 29.010, 39.990)})
    table.insert(colors, {['Part'] = generatedParts[379], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[379], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[379], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[379], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[379], ['Name'] = "Part"})
end
if generatedParts[380] then
    table.insert(resizes, {['Part'] = generatedParts[380], ['CFrame'] = (origin + offset) * CFrame.new(-0.989, 0.400, -53.570, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[380], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[380], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[380], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[380], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[380], ['Name'] = "Part"})
end
if generatedParts[381] then
    table.insert(resizes, {['Part'] = generatedParts[381], ['CFrame'] = (origin + offset) * CFrame.new(-12.421, 0.400, -46.195, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(27.930, 6.420, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[381], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[381], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[381], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[381], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[381], ['Name'] = "Part"})
end
if generatedParts[382] then
    table.insert(resizes, {['Part'] = generatedParts[382], ['CFrame'] = (origin + offset) * CFrame.new(-13.428, 0.400, -59.051, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(27.980, 6.450, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[382], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[382], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[382], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[382], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[382], ['Name'] = "Part"})
end
if generatedParts[383] then
    table.insert(resizes, {['Part'] = generatedParts[383], ['CFrame'] = (origin + offset) * CFrame.new(-2.002, 0.400, -66.439, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[383], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[383], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[383], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[383], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[383], ['Name'] = "Part"})
end
if generatedParts[384] then
    table.insert(resizes, {['Part'] = generatedParts[384], ['CFrame'] = (origin + offset) * CFrame.new(2.760, 0.400, -57.095, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(4.030, 25.810, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[384], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[384], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[384], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[384], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[384], ['Name'] = "Part"})
end
if generatedParts[385] then
    table.insert(resizes, {['Part'] = generatedParts[385], ['CFrame'] = (origin + offset) * CFrame.new(6.872, 10.800, -16.376, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[385], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[385], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[385], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[385], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[385], ['Name'] = "Part"})
end
if generatedParts[386] then
    table.insert(resizes, {['Part'] = generatedParts[386], ['CFrame'] = (origin + offset) * CFrame.new(6.856, 10.800, -43.357, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[386], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[386], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[386], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[386], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[386], ['Name'] = "Part"})
end
if generatedParts[387] then
    table.insert(resizes, {['Part'] = generatedParts[387], ['CFrame'] = (origin + offset) * CFrame.new(6.872, 1.300, -16.376, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[387], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[387], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[387], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[387], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[387], ['Name'] = "Part"})
end
if generatedParts[388] then
    table.insert(resizes, {['Part'] = generatedParts[388], ['CFrame'] = (origin + offset) * CFrame.new(6.872, 2.800, -16.376, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[388], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[388], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[388], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[388], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[388], ['Name'] = "Part"})
end
if generatedParts[389] then
    table.insert(resizes, {['Part'] = generatedParts[389], ['CFrame'] = (origin + offset) * CFrame.new(8.854, 10.799, -16.702, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 17.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[389], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[389], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[389], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[389], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[389], ['Name'] = "Part"})
end
if generatedParts[390] then
    table.insert(resizes, {['Part'] = generatedParts[390], ['CFrame'] = (origin + offset) * CFrame.new(6.856, 2.800, -43.357, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[390], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[390], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[390], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[390], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[390], ['Name'] = "Part"})
end
if generatedParts[391] then
    table.insert(resizes, {['Part'] = generatedParts[391], ['CFrame'] = (origin + offset) * CFrame.new(8.854, 1.300, -16.702, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[391], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[391], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[391], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[391], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[391], ['Name'] = "Part"})
end
if generatedParts[392] then
    table.insert(resizes, {['Part'] = generatedParts[392], ['CFrame'] = (origin + offset) * CFrame.new(6.856, 1.300, -43.357, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[392], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[392], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[392], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[392], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[392], ['Name'] = "Part"})
end
if generatedParts[393] then
    table.insert(resizes, {['Part'] = generatedParts[393], ['CFrame'] = (origin + offset) * CFrame.new(5.693, 20.265, -57.816, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(1.990, 26.810, 39.990)})
    table.insert(colors, {['Part'] = generatedParts[393], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[393], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[393], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[393], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[393], ['Name'] = "Part"})
end
if generatedParts[394] then
    table.insert(resizes, {['Part'] = generatedParts[394], ['CFrame'] = (origin + offset) * CFrame.new(8.854, 2.800, -16.702, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[394], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[394], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[394], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[394], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[394], ['Name'] = "Part"})
end
if generatedParts[395] then
    table.insert(resizes, {['Part'] = generatedParts[395], ['CFrame'] = (origin + offset) * CFrame.new(3.761, 16.620, -85.690, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(24.750, 35.240, 0.730)})
    table.insert(colors, {['Part'] = generatedParts[395], ['Color'] = Color3.new(0.337, 0.259, 0.212), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[395], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[395], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[395], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[395], ['Name'] = "Part"})
end
if generatedParts[396] then
    table.insert(resizes, {['Part'] = generatedParts[396], ['CFrame'] = (origin + offset) * CFrame.new(-85.478, 0.399, -114.988, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(3.140, 90.370, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[396], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[396], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[396], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[396], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[396], ['Name'] = "Part"})
end
if generatedParts[397] then
    table.insert(resizes, {['Part'] = generatedParts[397], ['CFrame'] = (origin + offset) * CFrame.new(-45.293, 0.400, -134.348, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(80.000, 6.500, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[397], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[397], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[397], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[397], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[397], ['Name'] = "Part"})
end
if generatedParts[398] then
    table.insert(resizes, {['Part'] = generatedParts[398], ['CFrame'] = (origin + offset) * CFrame.new(-89.045, 21.290, -127.493, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(2.010, 68.920, 39.980)})
    table.insert(colors, {['Part'] = generatedParts[398], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[398], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[398], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[398], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[398], ['Name'] = "Part"})
end
if generatedParts[399] then
    table.insert(resizes, {['Part'] = generatedParts[399], ['CFrame'] = (origin + offset) * CFrame.new(-66.261, 0.400, -80.913, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(28.010, 6.490, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[399], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[399], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[399], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[399], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[399], ['Name'] = "Part"})
end
if generatedParts[400] then
    table.insert(resizes, {['Part'] = generatedParts[400], ['CFrame'] = (origin + offset) * CFrame.new(-44.261, 0.400, -121.479, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(79.960, 6.480, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[400], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[400], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[400], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[400], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[400], ['Name'] = "Part"})
end
if generatedParts[401] then
    table.insert(resizes, {['Part'] = generatedParts[401], ['CFrame'] = (origin + offset) * CFrame.new(-43.284, 0.400, -108.621, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(79.990, 6.470, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[401], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[401], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[401], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[401], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[401], ['Name'] = "Part"})
end
if generatedParts[402] then
    table.insert(resizes, {['Part'] = generatedParts[402], ['CFrame'] = (origin + offset) * CFrame.new(-85.333, 17.990, -78.678, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(24.750, 35.240, 0.730)})
    table.insert(colors, {['Part'] = generatedParts[402], ['Color'] = Color3.new(0.337, 0.259, 0.212), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[402], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[402], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[402], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[402], ['Name'] = "Part"})
end
if generatedParts[403] then
    table.insert(resizes, {['Part'] = generatedParts[403], ['CFrame'] = (origin + offset) * CFrame.new(-81.184, 0.400, -86.173, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(0.940, 32.320, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[403], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[403], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[403], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[403], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[403], ['Name'] = "Part"})
end
if generatedParts[404] then
    table.insert(resizes, {['Part'] = generatedParts[404], ['CFrame'] = (origin + offset) * CFrame.new(-40.165, 0.408, -95.886, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(83.350, 6.530, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[404], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[404], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[404], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[404], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[404], ['Name'] = "Part"})
end
if generatedParts[405] then
    table.insert(resizes, {['Part'] = generatedParts[405], ['CFrame'] = (origin + offset) * CFrame.new(-26.913, 0.400, -83.950, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(50.940, 6.490, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[405], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[405], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[405], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[405], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[405], ['Name'] = "Part"})
end
if generatedParts[406] then
    table.insert(resizes, {['Part'] = generatedParts[406], ['CFrame'] = (origin + offset) * CFrame.new(-54.033, 0.400, -68.875, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(5.480, 6.570, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[406], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[406], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[406], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[406], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[406], ['Name'] = "Part"})
end
if generatedParts[407] then
    table.insert(resizes, {['Part'] = generatedParts[407], ['CFrame'] = (origin + offset) * CFrame.new(-32.405, 32.230, -71.284, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.000, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[407], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[407], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[407], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[407], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[407], ['Name'] = "Part"})
end
if generatedParts[408] then
    table.insert(resizes, {['Part'] = generatedParts[408], ['CFrame'] = (origin + offset) * CFrame.new(-26.904, 0.399, -77.470, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[408], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[408], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[408], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[408], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[408], ['Name'] = "Part"})
end
if generatedParts[409] then
    table.insert(resizes, {['Part'] = generatedParts[409], ['CFrame'] = (origin + offset) * CFrame.new(-51.300, 0.399, -88.500, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.950, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[409], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[409], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[409], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[409], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[409], ['Name'] = "Part"})
end
if generatedParts[410] then
    table.insert(resizes, {['Part'] = generatedParts[410], ['CFrame'] = (origin + offset) * CFrame.new(-49.793, 0.399, -75.669, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[410], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[410], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[410], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[410], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[410], ['Name'] = "Part"})
end
if generatedParts[411] then
    table.insert(resizes, {['Part'] = generatedParts[411], ['CFrame'] = (origin + offset) * CFrame.new(-52.297, 0.400, -101.441, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(3.090, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[411], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[411], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[411], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[411], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[411], ['Name'] = "Part"})
end
if generatedParts[412] then
    table.insert(resizes, {['Part'] = generatedParts[412], ['CFrame'] = (origin + offset) * CFrame.new(-46.324, 0.419, -75.942, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(3.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[412], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[412], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[412], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[412], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[412], ['Name'] = "Part"})
end
if generatedParts[413] then
    table.insert(resizes, {['Part'] = generatedParts[413], ['CFrame'] = (origin + offset) * CFrame.new(-37.401, 0.400, -70.134, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(27.920, 6.450, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[413], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[413], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[413], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[413], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[413], ['Name'] = "Part"})
end
if generatedParts[414] then
    table.insert(resizes, {['Part'] = generatedParts[414], ['CFrame'] = (origin + offset) * CFrame.new(-27.917, 0.400, -90.337, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[414], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[414], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[414], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[414], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[414], ['Name'] = "Part"})
end
if generatedParts[415] then
    table.insert(resizes, {['Part'] = generatedParts[415], ['CFrame'] = (origin + offset) * CFrame.new(-47.855, 0.399, -88.771, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.000, 0.200, 6.450)})
    table.insert(colors, {['Part'] = generatedParts[415], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[415], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[415], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[415], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[415], ['Name'] = "Part"})
end
if generatedParts[416] then
    table.insert(resizes, {['Part'] = generatedParts[416], ['CFrame'] = (origin + offset) * CFrame.new(-0.320, 20.290, -134.476, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(2.010, 68.920, 39.980)})
    table.insert(colors, {['Part'] = generatedParts[416], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[416], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[416], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[416], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[416], ['Name'] = "Part"})
end
if generatedParts[417] then
    table.insert(resizes, {['Part'] = generatedParts[417], ['CFrame'] = (origin + offset) * CFrame.new(-10.051, 0.400, -72.287, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(27.010, 6.530, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[417], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[417], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[417], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[417], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[417], ['Name'] = "Part"})
end
if generatedParts[418] then
    table.insert(resizes, {['Part'] = generatedParts[418], ['CFrame'] = (origin + offset) * CFrame.new(-3.250, 0.400, -134.426, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(3.880, 64.560, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[418], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[418], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[418], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[418], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[418], ['Name'] = "Part"})
end
if generatedParts[419] then
    table.insert(resizes, {['Part'] = generatedParts[419], ['CFrame'] = (origin + offset) * CFrame.new(0.443, 0.400, -86.097, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(3.880, 19.360, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[419], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[419], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[419], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[419], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[419], ['Name'] = "Part"})
end
if generatedParts[420] then
    table.insert(resizes, {['Part'] = generatedParts[420], ['CFrame'] = (origin + offset) * CFrame.new(-47.169, 21.290, -162.638, 0.078, -0.997, -0.000, 0.000, 0.000, -1.000, 0.997, 0.078, 0.000), ['Size'] = Vector3.new(2.010, 86.980, 39.980)})
    table.insert(colors, {['Part'] = generatedParts[420], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[420], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[420], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[420], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[420], ['Name'] = "Part"})
end
if generatedParts[421] then
    table.insert(resizes, {['Part'] = generatedParts[421], ['CFrame'] = (origin + offset) * CFrame.new(-46.316, 0.400, -147.212, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(80.000, 6.450, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[421], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[421], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[421], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[421], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[421], ['Name'] = "Part"})
end
if generatedParts[422] then
    table.insert(resizes, {['Part'] = generatedParts[422], ['CFrame'] = (origin + offset) * CFrame.new(-47.338, 0.400, -160.067, -0.997, -0.078, 0.000, 0.000, -0.000, -1.000, 0.078, -0.997, 0.000), ['Size'] = Vector3.new(80.020, 6.480, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[422], ['Color'] = Color3.new(0.686, 0.580, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[422], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[422], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[422], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[422], ['Name'] = "Part"})
end
if generatedParts[423] then
    table.insert(resizes, {['Part'] = generatedParts[423], ['CFrame'] = (origin + offset) * CFrame.new(-7.667, 0.730, -158.368, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(5.370, 0.460, 0.650)})
    table.insert(colors, {['Part'] = generatedParts[423], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[423], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[423], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[423], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[423], ['Name'] = "Part"})
end
if generatedParts[424] then
    table.insert(resizes, {['Part'] = generatedParts[424], ['CFrame'] = (origin + offset) * CFrame.new(-8.967, 1.245, -158.180, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(5.440, 1.490, 0.650)})
    table.insert(colors, {['Part'] = generatedParts[424], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[424], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[424], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[424], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[424], ['Name'] = "Part"})
end
if generatedParts[425] then
    table.insert(resizes, {['Part'] = generatedParts[425], ['CFrame'] = (origin + offset) * CFrame.new(-14.330, 1.580, -157.759, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(5.440, 2.160, 10.110)})
    table.insert(colors, {['Part'] = generatedParts[425], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[425], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[425], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[425], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[425], ['Name'] = "Part"})
end
if generatedParts[426] then
    table.insert(resizes, {['Part'] = generatedParts[426], ['CFrame'] = (origin + offset) * CFrame.new(-8.311, 0.955, -158.262, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(5.380, 0.910, 0.650)})
    table.insert(colors, {['Part'] = generatedParts[426], ['Color'] = Color3.new(0.486, 0.361, 0.275), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[426], ['Material'] = Enum.Material.WoodPlanks, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[426], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[426], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[426], ['Name'] = "Part"})
end
if generatedParts[427] then
    table.insert(resizes, {['Part'] = generatedParts[427], ['CFrame'] = (origin + offset) * CFrame.new(0.996, 26.680, -117.066, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.100, 0.300, 2.100)})
    table.insert(colors, {['Part'] = generatedParts[427], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[427], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[427], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[427], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[427], ['Name'] = "base"})
end
if generatedParts[428] then
    table.insert(resizes, {['Part'] = generatedParts[428], ['CFrame'] = (origin + offset) * CFrame.new(0.996, 26.480, -117.066, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.900, 0.100, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[428], ['Color'] = Color3.new(0.945, 0.906, 0.780), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[428], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[428], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[428], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[428], ['Name'] = "lightbase"})
end
if generatedParts[429] then
    table.insert(resizes, {['Part'] = generatedParts[429], ['CFrame'] = (origin + offset) * CFrame.new(0.996, 26.280, -117.066, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.300, 0.700, 0.800)})
    table.insert(colors, {['Part'] = generatedParts[429], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[429], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[429], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[429], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[429], ['Name'] = "BeamBase"})
end
if generatedParts[430] then
    table.insert(resizes, {['Part'] = generatedParts[430], ['CFrame'] = (origin + offset) * CFrame.new(0.983, 20.980, -117.045, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.730, 10.900, 1.660)})
    table.insert(colors, {['Part'] = generatedParts[430], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[430], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[430], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[430], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[430], ['Name'] = "Specks"})
end
if generatedParts[431] then
    table.insert(resizes, {['Part'] = generatedParts[431], ['CFrame'] = (origin + offset) * CFrame.new(-87.394, 25.430, -119.328, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.900, 0.100, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[431], ['Color'] = Color3.new(0.945, 0.906, 0.780), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[431], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[431], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[431], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[431], ['Name'] = "lightbase"})
end
if generatedParts[432] then
    table.insert(resizes, {['Part'] = generatedParts[432], ['CFrame'] = (origin + offset) * CFrame.new(-87.394, 25.630, -119.328, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.100, 0.300, 2.100)})
    table.insert(colors, {['Part'] = generatedParts[432], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[432], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[432], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[432], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[432], ['Name'] = "base"})
end
if generatedParts[433] then
    table.insert(resizes, {['Part'] = generatedParts[433], ['CFrame'] = (origin + offset) * CFrame.new(-87.408, 19.930, -119.306, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.730, 10.900, 1.660)})
    table.insert(colors, {['Part'] = generatedParts[433], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[433], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[433], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[433], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[433], ['Name'] = "Specks"})
end
if generatedParts[434] then
    table.insert(resizes, {['Part'] = generatedParts[434], ['CFrame'] = (origin + offset) * CFrame.new(-87.394, 25.230, -119.328, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.300, 0.700, 0.800)})
    table.insert(colors, {['Part'] = generatedParts[434], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[434], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[434], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[434], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[434], ['Name'] = "BeamBase"})
end
if generatedParts[435] then
    table.insert(resizes, {['Part'] = generatedParts[435], ['CFrame'] = (origin + offset) * CFrame.new(-66.316, 3.462, -142.946, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[435], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[435], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[435], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[435], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[435], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[436] then
    table.insert(resizes, {['Part'] = generatedParts[436], ['CFrame'] = (origin + offset) * CFrame.new(-66.316, 4.962, -142.946, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[436], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[436], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[436], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[436], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[436], ['Name'] = "Head"})
end
if generatedParts[437] then
    table.insert(resizes, {['Part'] = generatedParts[437], ['CFrame'] = (origin + offset) * CFrame.new(-64.101, 36.591, -39.881, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), ['Size'] = Vector3.new(0.418, 0.839, 0.434)})
    table.insert(colors, {['Part'] = generatedParts[437], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[437], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[437], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[437], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[437], ['Name'] = "Part"})
end
if generatedParts[438] then
    table.insert(resizes, {['Part'] = generatedParts[438], ['CFrame'] = (origin + offset) * CFrame.new(-64.097, 36.260, -39.871, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), ['Size'] = Vector3.new(0.760, 0.760, 0.760)})
    table.insert(colors, {['Part'] = generatedParts[438], ['Color'] = Color3.new(0.945, 0.906, 0.780), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[438], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.350})
    table.insert(anchors, {['Part'] = generatedParts[438], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[438], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[438], ['Name'] = "Part"})
end
if generatedParts[439] then
    table.insert(resizes, {['Part'] = generatedParts[439], ['CFrame'] = (origin + offset) * CFrame.new(-64.138, 38.523, -39.897, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), ['Size'] = Vector3.new(3.515, 0.839, 0.059)})
    table.insert(colors, {['Part'] = generatedParts[439], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[439], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[439], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[439], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[439], ['Name'] = "Part"})
end
if generatedParts[440] then
    table.insert(resizes, {['Part'] = generatedParts[440], ['CFrame'] = (origin + offset) * CFrame.new(-56.209, 3.500, -140.802, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[440], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[440], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[440], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[440], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[440], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[441] then
    table.insert(resizes, {['Part'] = generatedParts[441], ['CFrame'] = (origin + offset) * CFrame.new(-56.209, 5.000, -140.802, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[441], ['Color'] = Color3.new(1.000, 1.000, 0.200), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[441], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[441], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[441], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[441], ['Name'] = "Head"})
end
if generatedParts[442] then
    table.insert(resizes, {['Part'] = generatedParts[442], ['CFrame'] = (origin + offset) * CFrame.new(-5.671, 22.100, -84.908, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.960, 2.100, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[442], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[442], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[442], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[442], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[442], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[443] then
    table.insert(resizes, {['Part'] = generatedParts[443], ['CFrame'] = (origin + offset) * CFrame.new(-5.627, 23.327, -84.908, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(1.884, 0.942, 0.942)})
    table.insert(colors, {['Part'] = generatedParts[443], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[443], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[443], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[443], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[443], ['Name'] = "Head"})
end
if generatedParts[444] then
    table.insert(resizes, {['Part'] = generatedParts[444], ['CFrame'] = (origin + offset) * CFrame.new(-76.958, 11.507, 12.547, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.905, 6.905, 3.452)})
    table.insert(colors, {['Part'] = generatedParts[444], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[444], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[444], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[444], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[444], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[445] then
    table.insert(resizes, {['Part'] = generatedParts[445], ['CFrame'] = (origin + offset) * CFrame.new(-76.958, 16.685, 12.547, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.905, 3.452, 3.452)})
    table.insert(colors, {['Part'] = generatedParts[445], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[445], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[445], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[445], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[445], ['Name'] = "Head"})
end
if generatedParts[446] then
    table.insert(resizes, {['Part'] = generatedParts[446], ['CFrame'] = (origin + offset) * CFrame.new(-83.134, 6.270, -95.729, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.964, 3.639, 1.876)})
    table.insert(colors, {['Part'] = generatedParts[446], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[446], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[446], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[446], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[446], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[447] then
    table.insert(resizes, {['Part'] = generatedParts[447], ['CFrame'] = (origin + offset) * CFrame.new(-83.134, 9.028, -95.729, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(3.752, 1.876, 1.876)})
    table.insert(colors, {['Part'] = generatedParts[447], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[447], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[447], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[447], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[447], ['Name'] = "Head"})
end
if generatedParts[448] then
    table.insert(resizes, {['Part'] = generatedParts[448], ['CFrame'] = (origin + offset) * CFrame.new(-5.599, 39.680, -148.645, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.100, 0.300, 2.100)})
    table.insert(colors, {['Part'] = generatedParts[448], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[448], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[448], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[448], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[448], ['Name'] = "base"})
end
if generatedParts[449] then
    table.insert(resizes, {['Part'] = generatedParts[449], ['CFrame'] = (origin + offset) * CFrame.new(-5.599, 39.280, -148.645, -0.000, 0.997, 0.078, -1.000, -0.000, -0.000, 0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.300, 0.700, 0.800)})
    table.insert(colors, {['Part'] = generatedParts[449], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[449], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[449], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[449], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[449], ['Name'] = "BeamBase"})
end
if generatedParts[450] then
    table.insert(resizes, {['Part'] = generatedParts[450], ['CFrame'] = (origin + offset) * CFrame.new(-5.599, 39.480, -148.645, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.900, 0.100, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[450], ['Color'] = Color3.new(0.945, 0.906, 0.780), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[450], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[450], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[450], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[450], ['Name'] = "lightbase"})
end
if generatedParts[451] then
    table.insert(resizes, {['Part'] = generatedParts[451], ['CFrame'] = (origin + offset) * CFrame.new(-5.613, 33.980, -148.624, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.730, 10.900, 1.660)})
    table.insert(colors, {['Part'] = generatedParts[451], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[451], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[451], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[451], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[451], ['Name'] = "Specks"})
end
if generatedParts[452] then
    table.insert(resizes, {['Part'] = generatedParts[452], ['CFrame'] = (origin + offset) * CFrame.new(-77.021, 11.597, 28.244, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.098, 7.098, 3.549)})
    table.insert(colors, {['Part'] = generatedParts[452], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[452], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[452], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[452], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[452], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[453] then
    table.insert(resizes, {['Part'] = generatedParts[453], ['CFrame'] = (origin + offset) * CFrame.new(-77.021, 16.920, 28.244, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.098, 3.549, 3.549)})
    table.insert(colors, {['Part'] = generatedParts[453], ['Color'] = Color3.new(0.541, 0.349, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[453], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[453], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[453], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[453], ['Name'] = "Head"})
end
if generatedParts[454] then
    table.insert(resizes, {['Part'] = generatedParts[454], ['CFrame'] = (origin + offset) * CFrame.new(-85.256, -3.911, 28.596, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.033, 0.038, 0.038)})
    table.insert(colors, {['Part'] = generatedParts[454], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[454], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[454], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[454], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[454], ['Name'] = "Part"})
end
if generatedParts[455] then
    table.insert(resizes, {['Part'] = generatedParts[455], ['CFrame'] = (origin + offset) * CFrame.new(-85.256, -3.922, 28.596, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.048, 0.048, 0.048)})
    table.insert(colors, {['Part'] = generatedParts[455], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[455], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[455], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[455], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[455], ['Name'] = "Part"})
end
if generatedParts[456] then
    table.insert(resizes, {['Part'] = generatedParts[456], ['CFrame'] = (origin + offset) * CFrame.new(-85.256, -3.887, 28.596, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.014, 0.057, 0.057)})
    table.insert(colors, {['Part'] = generatedParts[456], ['Color'] = Color3.new(0.624, 0.631, 0.675), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[456], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[456], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[456], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[456], ['Name'] = "Part"})
end
if generatedParts[457] then
    table.insert(resizes, {['Part'] = generatedParts[457], ['CFrame'] = (origin + offset) * CFrame.new(-85.256, -3.896, 28.596, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.005, 0.048, 0.048)})
    table.insert(colors, {['Part'] = generatedParts[457], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[457], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[457], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[457], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[457], ['Name'] = "Black Part"})
end
if generatedParts[458] then
    table.insert(resizes, {['Part'] = generatedParts[458], ['CFrame'] = (origin + offset) * CFrame.new(-88.839, 2.488, -149.646, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), ['Size'] = Vector3.new(13.614, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[458], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[458], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[458], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[458], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[458], ['Name'] = "Part"})
end
if generatedParts[459] then
    table.insert(resizes, {['Part'] = generatedParts[459], ['CFrame'] = (origin + offset) * CFrame.new(-81.681, 1.685, -143.558, 0.997, -0.078, -0.000, -0.000, -0.000, 1.000, -0.078, -0.997, -0.000), ['Size'] = Vector3.new(14.142, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[459], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[459], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[459], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[459], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[459], ['Name'] = "Part"})
end
if generatedParts[460] then
    table.insert(resizes, {['Part'] = generatedParts[460], ['CFrame'] = (origin + offset) * CFrame.new(-82.509, 0.783, -156.717, -0.997, 0.078, -0.000, 0.000, 0.000, 1.000, 0.078, 0.997, -0.000), ['Size'] = Vector3.new(13.614, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[460], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[460], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[460], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[460], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[460], ['Name'] = "Part"})
end
if generatedParts[461] then
    table.insert(resizes, {['Part'] = generatedParts[461], ['CFrame'] = (origin + offset) * CFrame.new(-82.509, 1.685, -156.717, -0.997, 0.078, -0.000, 0.000, 0.000, 1.000, 0.078, 0.997, -0.000), ['Size'] = Vector3.new(13.614, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[461], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[461], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[461], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[461], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[461], ['Name'] = "Part"})
end
if generatedParts[462] then
    table.insert(resizes, {['Part'] = generatedParts[462], ['CFrame'] = (origin + offset) * CFrame.new(-82.141, 2.350, -150.123, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(12.818, 0.001, 12.747)})
    table.insert(colors, {['Part'] = generatedParts[462], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[462], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[462], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[462], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[462], ['Name'] = "Part"})
end
if generatedParts[463] then
    table.insert(resizes, {['Part'] = generatedParts[463], ['CFrame'] = (origin + offset) * CFrame.new(-75.485, 2.488, -150.697, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), ['Size'] = Vector3.new(13.614, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[463], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[463], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[463], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[463], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[463], ['Name'] = "Part"})
end
if generatedParts[464] then
    table.insert(resizes, {['Part'] = generatedParts[464], ['CFrame'] = (origin + offset) * CFrame.new(-75.485, 0.783, -150.697, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), ['Size'] = Vector3.new(13.614, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[464], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[464], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[464], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[464], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[464], ['Name'] = "Part"})
end
if generatedParts[465] then
    table.insert(resizes, {['Part'] = generatedParts[465], ['CFrame'] = (origin + offset) * CFrame.new(-82.122, 0.449, -150.166, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(12.776, 0.288, 12.714)})
    table.insert(colors, {['Part'] = generatedParts[465], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[465], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[465], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[465], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[465], ['Name'] = "Part"})
end
if generatedParts[466] then
    table.insert(resizes, {['Part'] = generatedParts[466], ['CFrame'] = (origin + offset) * CFrame.new(-75.485, 1.685, -150.697, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), ['Size'] = Vector3.new(13.614, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[466], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[466], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[466], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[466], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[466], ['Name'] = "Part"})
end
if generatedParts[467] then
    table.insert(resizes, {['Part'] = generatedParts[467], ['CFrame'] = (origin + offset) * CFrame.new(-81.703, 0.783, -143.556, 0.997, -0.078, -0.000, -0.000, -0.000, 1.000, -0.078, -0.997, -0.000), ['Size'] = Vector3.new(14.096, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[467], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[467], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[467], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[467], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[467], ['Name'] = "Part"})
end
if generatedParts[468] then
    table.insert(resizes, {['Part'] = generatedParts[468], ['CFrame'] = (origin + offset) * CFrame.new(-81.685, 2.488, -143.557, 0.997, -0.078, -0.000, -0.000, -0.000, 1.000, -0.078, -0.997, -0.000), ['Size'] = Vector3.new(14.133, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[468], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[468], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[468], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[468], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[468], ['Name'] = "Part"})
end
if generatedParts[469] then
    table.insert(resizes, {['Part'] = generatedParts[469], ['CFrame'] = (origin + offset) * CFrame.new(-82.509, 2.488, -156.717, -0.997, 0.078, -0.000, 0.000, 0.000, 1.000, 0.078, 0.997, -0.000), ['Size'] = Vector3.new(13.614, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[469], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[469], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[469], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[469], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[469], ['Name'] = "Part"})
end
if generatedParts[470] then
    table.insert(resizes, {['Part'] = generatedParts[470], ['CFrame'] = (origin + offset) * CFrame.new(-88.839, 1.685, -149.646, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), ['Size'] = Vector3.new(13.614, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[470], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[470], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[470], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[470], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[470], ['Name'] = "Part"})
end
if generatedParts[471] then
    table.insert(resizes, {['Part'] = generatedParts[471], ['CFrame'] = (origin + offset) * CFrame.new(-88.839, 0.783, -149.646, 0.078, 0.997, -0.000, -0.000, 0.000, 1.000, 0.997, -0.078, 0.000), ['Size'] = Vector3.new(13.614, 2.342, 0.955)})
    table.insert(colors, {['Part'] = generatedParts[471], ['Color'] = Color3.new(0.063, 0.165, 0.863), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[471], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[471], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[471], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[471], ['Name'] = "Part"})
end
if generatedParts[472] then
    table.insert(resizes, {['Part'] = generatedParts[472], ['CFrame'] = (origin + offset) * CFrame.new(-68.500, 8.656, 41.136, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.137, 5.137, 2.569)})
    table.insert(colors, {['Part'] = generatedParts[472], ['Color'] = Color3.new(0.004, 0.035, 0.051), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[472], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[472], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[472], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[472], ['Name'] = "Torso"})
end
if generatedParts[473] then
    table.insert(resizes, {['Part'] = generatedParts[473], ['CFrame'] = (origin + offset) * CFrame.new(-68.500, 8.656, 41.136, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.137, 5.137, 2.569)})
    table.insert(colors, {['Part'] = generatedParts[473], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[473], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[473], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[473], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[473], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[474] then
    table.insert(resizes, {['Part'] = generatedParts[474], ['CFrame'] = (origin + offset) * CFrame.new(-68.500, 3.518, 42.420, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.569, 5.137, 2.569)})
    table.insert(colors, {['Part'] = generatedParts[474], ['Color'] = Color3.new(0.416, 0.012, 0.412), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[474], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[474], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[474], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[474], ['Name'] = "Right Leg"})
end
if generatedParts[475] then
    table.insert(resizes, {['Part'] = generatedParts[475], ['CFrame'] = (origin + offset) * CFrame.new(-68.500, 8.656, 44.989, 0.000, -0.707, -0.707, 0.000, 0.707, -0.707, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.569, 5.137, 2.569)})
    table.insert(colors, {['Part'] = generatedParts[475], ['Color'] = Color3.new(0.478, 0.055, 0.467), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[475], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[475], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[475], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[475], ['Name'] = "Right Arm"})
end
if generatedParts[476] then
    table.insert(resizes, {['Part'] = generatedParts[476], ['CFrame'] = (origin + offset) * CFrame.new(-68.500, 3.518, 39.852, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.569, 5.137, 2.569)})
    table.insert(colors, {['Part'] = generatedParts[476], ['Color'] = Color3.new(0.427, 0.020, 0.424), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[476], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[476], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[476], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[476], ['Name'] = "Left Leg"})
end
if generatedParts[477] then
    table.insert(resizes, {['Part'] = generatedParts[477], ['CFrame'] = (origin + offset) * CFrame.new(-68.500, 8.656, 37.283, 0.000, -0.707, -0.707, 0.000, 0.707, -0.707, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(2.569, 5.137, 2.569)})
    table.insert(colors, {['Part'] = generatedParts[477], ['Color'] = Color3.new(0.478, 0.055, 0.467), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[477], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[477], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[477], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[477], ['Name'] = "Left Arm"})
end
if generatedParts[478] then
    table.insert(resizes, {['Part'] = generatedParts[478], ['CFrame'] = (origin + offset) * CFrame.new(-68.500, 12.509, 41.136, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(5.137, 2.569, 2.569)})
    table.insert(colors, {['Part'] = generatedParts[478], ['Color'] = Color3.new(0.004, 0.035, 0.051), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[478], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[478], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[478], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[478], ['Name'] = "Head"})
end
if generatedParts[479] then
    table.insert(resizes, {['Part'] = generatedParts[479], ['CFrame'] = (origin + offset) * CFrame.new(-88.151, 33.980, -142.128, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.730, 10.900, 1.660)})
    table.insert(colors, {['Part'] = generatedParts[479], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[479], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[479], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[479], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[479], ['Name'] = "Specks"})
end
if generatedParts[480] then
    table.insert(resizes, {['Part'] = generatedParts[480], ['CFrame'] = (origin + offset) * CFrame.new(-88.137, 39.280, -142.150, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.300, 0.700, 0.800)})
    table.insert(colors, {['Part'] = generatedParts[480], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[480], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[480], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[480], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[480], ['Name'] = "BeamBase"})
end
if generatedParts[481] then
    table.insert(resizes, {['Part'] = generatedParts[481], ['CFrame'] = (origin + offset) * CFrame.new(-88.137, 39.480, -142.150, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.900, 0.100, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[481], ['Color'] = Color3.new(0.945, 0.906, 0.780), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[481], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[481], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[481], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[481], ['Name'] = "lightbase"})
end
if generatedParts[482] then
    table.insert(resizes, {['Part'] = generatedParts[482], ['CFrame'] = (origin + offset) * CFrame.new(-88.137, 39.680, -142.150, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.100, 0.300, 2.100)})
    table.insert(colors, {['Part'] = generatedParts[482], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[482], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[482], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[482], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[482], ['Name'] = "base"})
end
if generatedParts[483] then
    table.insert(resizes, {['Part'] = generatedParts[483], ['CFrame'] = (origin + offset) * CFrame.new(-84.100, -1.426, 32.136, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.881, 0.881, 0.881)})
    table.insert(colors, {['Part'] = generatedParts[483], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[483], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[483], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[483], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[483], ['Name'] = "Part"})
end
if generatedParts[484] then
    table.insert(resizes, {['Part'] = generatedParts[484], ['CFrame'] = (origin + offset) * CFrame.new(-84.100, -1.206, 32.136, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.617, 0.705, 0.705)})
    table.insert(colors, {['Part'] = generatedParts[484], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[484], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[484], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[484], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[484], ['Name'] = "Part"})
end
if generatedParts[485] then
    table.insert(resizes, {['Part'] = generatedParts[485], ['CFrame'] = (origin + offset) * CFrame.new(-84.100, -0.766, 32.136, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.264, 1.057, 1.057)})
    table.insert(colors, {['Part'] = generatedParts[485], ['Color'] = Color3.new(0.624, 0.631, 0.675), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[485], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[485], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[485], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[485], ['Name'] = "Part"})
end
if generatedParts[486] then
    table.insert(resizes, {['Part'] = generatedParts[486], ['CFrame'] = (origin + offset) * CFrame.new(-84.100, -0.942, 32.136, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.088, 0.881, 0.881)})
    table.insert(colors, {['Part'] = generatedParts[486], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[486], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[486], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[486], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[486], ['Name'] = "Black Part"})
end
if generatedParts[487] then
    table.insert(resizes, {['Part'] = generatedParts[487], ['CFrame'] = (origin + offset) * CFrame.new(-31.207, 32.559, 7.707, -0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, -0.000), ['Size'] = Vector3.new(0.740, 0.167, 1.742)})
    table.insert(colors, {['Part'] = generatedParts[487], ['Color'] = Color3.new(0.973, 0.851, 0.427), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[487], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[487], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[487], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[487], ['Name'] = "Part"})
end
if generatedParts[488] then
    table.insert(resizes, {['Part'] = generatedParts[488], ['CFrame'] = (origin + offset) * CFrame.new(-88.675, 35.980, -122.025, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.730, 10.900, 1.660)})
    table.insert(colors, {['Part'] = generatedParts[488], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[488], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[488], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[488], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[488], ['Name'] = "Specks"})
end
if generatedParts[489] then
    table.insert(resizes, {['Part'] = generatedParts[489], ['CFrame'] = (origin + offset) * CFrame.new(-88.661, 41.280, -122.047, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.300, 0.700, 0.800)})
    table.insert(colors, {['Part'] = generatedParts[489], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[489], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[489], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[489], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[489], ['Name'] = "BeamBase"})
end
if generatedParts[490] then
    table.insert(resizes, {['Part'] = generatedParts[490], ['CFrame'] = (origin + offset) * CFrame.new(-88.661, 41.680, -122.047, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.100, 0.300, 2.100)})
    table.insert(colors, {['Part'] = generatedParts[490], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[490], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[490], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[490], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[490], ['Name'] = "base"})
end
if generatedParts[491] then
    table.insert(resizes, {['Part'] = generatedParts[491], ['CFrame'] = (origin + offset) * CFrame.new(-88.661, 41.480, -122.047, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.900, 0.100, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[491], ['Color'] = Color3.new(0.945, 0.906, 0.780), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[491], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[491], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[491], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[491], ['Name'] = "lightbase"})
end
if generatedParts[492] then
    table.insert(resizes, {['Part'] = generatedParts[492], ['CFrame'] = (origin + offset) * CFrame.new(-45.363, 27.097, -160.083, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(16.825, 23.000, 0.344)})
    table.insert(colors, {['Part'] = generatedParts[492], ['Color'] = Color3.new(0.949, 0.953, 0.953), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[492], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[492], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[492], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[492], ['Name'] = "Frame"})
end
if generatedParts[493] then
    table.insert(resizes, {['Part'] = generatedParts[493], ['CFrame'] = (origin + offset) * CFrame.new(-45.346, 27.079, -160.084, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(15.104, 21.279, 0.344)})
    table.insert(colors, {['Part'] = generatedParts[493], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[493], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[493], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[493], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[493], ['Name'] = "Picture"})
end
if generatedParts[494] then
    table.insert(resizes, {['Part'] = generatedParts[494], ['CFrame'] = (origin + offset) * CFrame.new(-3.024, 33.980, -115.726, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.730, 10.900, 1.660)})
    table.insert(colors, {['Part'] = generatedParts[494], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[494], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[494], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[494], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[494], ['Name'] = "Specks"})
end
if generatedParts[495] then
    table.insert(resizes, {['Part'] = generatedParts[495], ['CFrame'] = (origin + offset) * CFrame.new(-3.010, 39.480, -115.747, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.900, 0.100, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[495], ['Color'] = Color3.new(0.945, 0.906, 0.780), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[495], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[495], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[495], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[495], ['Name'] = "lightbase"})
end
if generatedParts[496] then
    table.insert(resizes, {['Part'] = generatedParts[496], ['CFrame'] = (origin + offset) * CFrame.new(-3.010, 39.680, -115.747, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.100, 0.300, 2.100)})
    table.insert(colors, {['Part'] = generatedParts[496], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[496], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[496], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[496], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[496], ['Name'] = "base"})
end
if generatedParts[497] then
    table.insert(resizes, {['Part'] = generatedParts[497], ['CFrame'] = (origin + offset) * CFrame.new(-3.010, 39.280, -115.747, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.300, 0.700, 0.800)})
    table.insert(colors, {['Part'] = generatedParts[497], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[497], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[497], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[497], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[497], ['Name'] = "BeamBase"})
end
if generatedParts[498] then
    table.insert(resizes, {['Part'] = generatedParts[498], ['CFrame'] = (origin + offset) * CFrame.new(-56.590, 0.550, -49.702, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[498], ['Color'] = Color3.new(0.353, 0.298, 0.259), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[498], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[498], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[498], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[498], ['Name'] = "Rug"})
end
if generatedParts[499] then
    table.insert(resizes, {['Part'] = generatedParts[499], ['CFrame'] = (origin + offset) * CFrame.new(-73.504, 0.550, -48.371, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[499], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[499], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[499], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[499], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[499], ['Name'] = "Rug"})
end
if generatedParts[500] then
    table.insert(resizes, {['Part'] = generatedParts[500], ['CFrame'] = (origin + offset) * CFrame.new(-22.362, 0.550, -52.396, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(25.250, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[500], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[500], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[500], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[500], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[500], ['Name'] = "Rug"})
end
if generatedParts[501] then
    table.insert(resizes, {['Part'] = generatedParts[501], ['CFrame'] = (origin + offset) * CFrame.new(-39.409, 0.550, -51.054, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[501], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[501], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[501], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[501], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[501], ['Name'] = "Rug"})
end
if generatedParts[502] then
    table.insert(resizes, {['Part'] = generatedParts[502], ['CFrame'] = (origin + offset) * CFrame.new(-5.314, 0.550, -53.738, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(25.250, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[502], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[502], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[502], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[502], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[502], ['Name'] = "Rug"})
end
if generatedParts[503] then
    table.insert(resizes, {['Part'] = generatedParts[503], ['CFrame'] = (origin + offset) * CFrame.new(-79.731, 0.550, -127.493, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[503], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[503], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[503], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[503], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[503], ['Name'] = "Rug"})
end
if generatedParts[504] then
    table.insert(resizes, {['Part'] = generatedParts[504], ['CFrame'] = (origin + offset) * CFrame.new(-62.817, 0.550, -128.824, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[504], ['Color'] = Color3.new(0.353, 0.298, 0.259), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[504], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[504], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[504], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[504], ['Name'] = "Rug"})
end
if generatedParts[505] then
    table.insert(resizes, {['Part'] = generatedParts[505], ['CFrame'] = (origin + offset) * CFrame.new(-45.636, 0.550, -130.176, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[505], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[505], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[505], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[505], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[505], ['Name'] = "Rug"})
end
if generatedParts[506] then
    table.insert(resizes, {['Part'] = generatedParts[506], ['CFrame'] = (origin + offset) * CFrame.new(-28.589, 0.550, -131.518, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(25.250, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[506], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[506], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[506], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[506], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[506], ['Name'] = "Rug"})
end
if generatedParts[507] then
    table.insert(resizes, {['Part'] = generatedParts[507], ['CFrame'] = (origin + offset) * CFrame.new(-11.541, 0.550, -132.859, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(25.250, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[507], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[507], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[507], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[507], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[507], ['Name'] = "Rug"})
end
if generatedParts[508] then
    table.insert(resizes, {['Part'] = generatedParts[508], ['CFrame'] = (origin + offset) * CFrame.new(-5.320, 38.523, -44.526, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), ['Size'] = Vector3.new(3.515, 0.839, 0.059)})
    table.insert(colors, {['Part'] = generatedParts[508], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[508], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[508], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[508], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[508], ['Name'] = "Part"})
end
if generatedParts[509] then
    table.insert(resizes, {['Part'] = generatedParts[509], ['CFrame'] = (origin + offset) * CFrame.new(-5.279, 36.260, -44.500, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), ['Size'] = Vector3.new(0.760, 0.760, 0.760)})
    table.insert(colors, {['Part'] = generatedParts[509], ['Color'] = Color3.new(0.945, 0.906, 0.780), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[509], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.350})
    table.insert(anchors, {['Part'] = generatedParts[509], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[509], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[509], ['Name'] = "Part"})
end
if generatedParts[510] then
    table.insert(resizes, {['Part'] = generatedParts[510], ['CFrame'] = (origin + offset) * CFrame.new(-5.283, 36.591, -44.510, -0.000, -0.997, 0.078, 1.000, -0.000, 0.000, 0.000, 0.078, 0.997), ['Size'] = Vector3.new(0.418, 0.839, 0.434)})
    table.insert(colors, {['Part'] = generatedParts[510], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[510], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[510], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[510], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[510], ['Name'] = "Part"})
end
if generatedParts[511] then
    table.insert(resizes, {['Part'] = generatedParts[511], ['CFrame'] = (origin + offset) * CFrame.new(-3.147, 21.500, -79.970, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), ['Size'] = Vector3.new(9.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[511], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[511], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[511], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[511], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[511], ['Name'] = "Part"})
end
if generatedParts[512] then
    table.insert(resizes, {['Part'] = generatedParts[512], ['CFrame'] = (origin + offset) * CFrame.new(-4.010, 21.500, -90.936, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), ['Size'] = Vector3.new(9.000, 2.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[512], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[512], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[512], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[512], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[512], ['Name'] = "Part"})
end
if generatedParts[513] then
    table.insert(resizes, {['Part'] = generatedParts[513], ['CFrame'] = (origin + offset) * CFrame.new(-3.579, 16.000, -85.453, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), ['Size'] = Vector3.new(2.000, 31.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[513], ['Color'] = Color3.new(0.494, 0.408, 0.247), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[513], ['Material'] = Enum.Material.Wood, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[513], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[513], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[513], ['Name'] = "Part"})
end
if generatedParts[514] then
    table.insert(resizes, {['Part'] = generatedParts[514], ['CFrame'] = (origin + offset) * CFrame.new(-58.634, 0.550, -75.669, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[514], ['Color'] = Color3.new(0.353, 0.298, 0.259), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[514], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[514], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[514], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[514], ['Name'] = "Rug"})
end
if generatedParts[515] then
    table.insert(resizes, {['Part'] = generatedParts[515], ['CFrame'] = (origin + offset) * CFrame.new(-75.548, 0.550, -74.338, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[515], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[515], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[515], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[515], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[515], ['Name'] = "Rug"})
end
if generatedParts[516] then
    table.insert(resizes, {['Part'] = generatedParts[516], ['CFrame'] = (origin + offset) * CFrame.new(-41.453, 0.550, -77.021, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[516], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[516], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[516], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[516], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[516], ['Name'] = "Rug"})
end
if generatedParts[517] then
    table.insert(resizes, {['Part'] = generatedParts[517], ['CFrame'] = (origin + offset) * CFrame.new(-24.406, 0.550, -78.363, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(25.250, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[517], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[517], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[517], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[517], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[517], ['Name'] = "Rug"})
end
if generatedParts[518] then
    table.insert(resizes, {['Part'] = generatedParts[518], ['CFrame'] = (origin + offset) * CFrame.new(-7.358, 0.550, -79.704, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(25.250, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[518], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[518], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[518], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[518], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[518], ['Name'] = "Rug"})
end
if generatedParts[519] then
    table.insert(resizes, {['Part'] = generatedParts[519], ['CFrame'] = (origin + offset) * CFrame.new(139.000, 35.350, -322.800, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.700, 0.800, 0.800)})
    table.insert(colors, {['Part'] = generatedParts[519], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[519], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[519], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[519], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[519], ['Name'] = "Part"})
end
if generatedParts[520] then
    table.insert(resizes, {['Part'] = generatedParts[520], ['CFrame'] = (origin + offset) * CFrame.new(139.000, 35.100, -322.800, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[520], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[520], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[520], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[520], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[520], ['Name'] = "Part"})
end
if generatedParts[521] then
    table.insert(resizes, {['Part'] = generatedParts[521], ['CFrame'] = (origin + offset) * CFrame.new(139.000, 35.850, -322.800, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.300, 1.200, 1.200)})
    table.insert(colors, {['Part'] = generatedParts[521], ['Color'] = Color3.new(0.624, 0.631, 0.675), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[521], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[521], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[521], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[521], ['Name'] = "Part"})
end
if generatedParts[522] then
    table.insert(resizes, {['Part'] = generatedParts[522], ['CFrame'] = (origin + offset) * CFrame.new(139.000, 35.650, -322.800, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.100, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[522], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[522], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[522], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[522], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[522], ['Name'] = "Black Part"})
end
if generatedParts[523] then
    table.insert(resizes, {['Part'] = generatedParts[523], ['CFrame'] = (origin + offset) * CFrame.new(-85.783, 39.280, -112.242, 0.000, 0.997, 0.078, -1.000, 0.000, 0.000, -0.000, -0.078, 0.997), ['Size'] = Vector3.new(0.300, 0.700, 0.800)})
    table.insert(colors, {['Part'] = generatedParts[523], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[523], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[523], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[523], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[523], ['Name'] = "BeamBase"})
end
if generatedParts[524] then
    table.insert(resizes, {['Part'] = generatedParts[524], ['CFrame'] = (origin + offset) * CFrame.new(-85.797, 33.980, -112.221, 0.997, 0.000, -0.078, 0.000, -1.000, -0.000, -0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.730, 10.900, 1.660)})
    table.insert(colors, {['Part'] = generatedParts[524], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[524], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[524], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[524], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[524], ['Name'] = "Specks"})
end
if generatedParts[525] then
    table.insert(resizes, {['Part'] = generatedParts[525], ['CFrame'] = (origin + offset) * CFrame.new(-85.783, 39.480, -112.242, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.900, 0.100, 1.900)})
    table.insert(colors, {['Part'] = generatedParts[525], ['Color'] = Color3.new(0.945, 0.906, 0.780), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[525], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[525], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[525], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[525], ['Name'] = "lightbase"})
end
if generatedParts[526] then
    table.insert(resizes, {['Part'] = generatedParts[526], ['CFrame'] = (origin + offset) * CFrame.new(-85.783, 39.680, -112.242, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.100, 0.300, 2.100)})
    table.insert(colors, {['Part'] = generatedParts[526], ['Color'] = Color3.new(0.804, 0.804, 0.804), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[526], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[526], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[526], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[526], ['Name'] = "base"})
end
if generatedParts[527] then
    table.insert(resizes, {['Part'] = generatedParts[527], ['CFrame'] = (origin + offset) * CFrame.new(-34.793, 32.559, 7.603, -0.000, 0.000, -1.000, 0.000, 1.000, -0.000, 1.000, 0.000, -0.000), ['Size'] = Vector3.new(0.740, 0.167, 1.742)})
    table.insert(colors, {['Part'] = generatedParts[527], ['Color'] = Color3.new(0.973, 0.851, 0.427), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[527], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[527], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[527], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[527], ['Name'] = "Part"})
end
if generatedParts[528] then
    table.insert(resizes, {['Part'] = generatedParts[528], ['CFrame'] = (origin + offset) * CFrame.new(-66.800, 1.050, 12.691, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.800, 0.200, 15.600)})
    table.insert(colors, {['Part'] = generatedParts[528], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[528], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[528], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[528], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[528], ['Name'] = "Part7"})
end
if generatedParts[529] then
    table.insert(resizes, {['Part'] = generatedParts[529], ['CFrame'] = (origin + offset) * CFrame.new(-66.800, 1.050, 28.691, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.800, 0.200, 15.600)})
    table.insert(colors, {['Part'] = generatedParts[529], ['Color'] = Color3.new(0.780, 0.675, 0.471), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[529], ['Material'] = Enum.Material.Concrete, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[529], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[529], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[529], ['Name'] = "Part"})
end
if generatedParts[530] then
    table.insert(resizes, {['Part'] = generatedParts[530], ['CFrame'] = (origin + offset) * CFrame.new(-34.500, 0.300, 24.963, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(70.345, 1.300, 97.000)})
    table.insert(colors, {['Part'] = generatedParts[530], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[530], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[530], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[530], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[530], ['Name'] = "Part"})
end
if generatedParts[531] then
    table.insert(resizes, {['Part'] = generatedParts[531], ['CFrame'] = (origin + offset) * CFrame.new(-80.295, 9.123, -61.300, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), ['Size'] = Vector3.new(1.980, 1.980, 1.980)})
    table.insert(colors, {['Part'] = generatedParts[531], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[531], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[531], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[531], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[531], ['Name'] = "Handle"})
end
if generatedParts[532] then
    table.insert(resizes, {['Part'] = generatedParts[532], ['CFrame'] = (origin + offset) * CFrame.new(-80.466, 2.480, -62.280, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(1.980, 3.960, 1.980)})
    table.insert(colors, {['Part'] = generatedParts[532], ['Color'] = Color3.new(0.686, 0.678, 0.682), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[532], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[532], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[532], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[532], ['Name'] = "Left Leg"})
end
if generatedParts[533] then
    table.insert(resizes, {['Part'] = generatedParts[533], ['CFrame'] = (origin + offset) * CFrame.new(-80.388, 6.440, -61.293, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(3.960, 3.960, 1.980)})
    table.insert(colors, {['Part'] = generatedParts[533], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[533], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[533], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[533], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[533], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[534] then
    table.insert(resizes, {['Part'] = generatedParts[534], ['CFrame'] = (origin + offset) * CFrame.new(-80.388, 9.410, -61.293, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(3.960, 1.980, 1.980)})
    table.insert(colors, {['Part'] = generatedParts[534], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[534], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[534], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[534], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[534], ['Name'] = "Head"})
end
if generatedParts[535] then
    table.insert(resizes, {['Part'] = generatedParts[535], ['CFrame'] = (origin + offset) * CFrame.new(-80.621, 6.440, -64.254, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(1.980, 3.960, 1.980)})
    table.insert(colors, {['Part'] = generatedParts[535], ['Color'] = Color3.new(0.686, 0.678, 0.682), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[535], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[535], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[535], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[535], ['Name'] = "Left Arm"})
end
if generatedParts[536] then
    table.insert(resizes, {['Part'] = generatedParts[536], ['CFrame'] = (origin + offset) * CFrame.new(-80.310, 2.480, -60.306, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(1.980, 3.960, 1.980)})
    table.insert(colors, {['Part'] = generatedParts[536], ['Color'] = Color3.new(0.686, 0.678, 0.682), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[536], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[536], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[536], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[536], ['Name'] = "Right Leg"})
end
if generatedParts[537] then
    table.insert(resizes, {['Part'] = generatedParts[537], ['CFrame'] = (origin + offset) * CFrame.new(-80.388, 6.440, -61.293, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(3.960, 3.960, 1.980)})
    table.insert(colors, {['Part'] = generatedParts[537], ['Color'] = Color3.new(0.871, 0.871, 0.871), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[537], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[537], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[537], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[537], ['Name'] = "Torso"})
end
if generatedParts[538] then
    table.insert(resizes, {['Part'] = generatedParts[538], ['CFrame'] = (origin + offset) * CFrame.new(-80.155, 6.440, -58.332, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(1.980, 3.960, 1.980)})
    table.insert(colors, {['Part'] = generatedParts[538], ['Color'] = Color3.new(0.686, 0.678, 0.682), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[538], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[538], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[538], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[538], ['Name'] = "Right Arm"})
end
if generatedParts[539] then
    table.insert(resizes, {['Part'] = generatedParts[539], ['CFrame'] = (origin + offset) * CFrame.new(-8.321, 24.280, -44.259, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(26.000, 16.000, 0.100)})
    table.insert(colors, {['Part'] = generatedParts[539], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[539], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[539], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[539], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[539], ['Name'] = "Part8"})
end
if generatedParts[540] then
    table.insert(resizes, {['Part'] = generatedParts[540], ['CFrame'] = (origin + offset) * CFrame.new(-54.825, 6.443, -44.142, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(3.957, 3.957, 1.978)})
    table.insert(colors, {['Part'] = generatedParts[540], ['Color'] = Color3.new(0.965, 0.071, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[540], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[540], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[540], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[540], ['Name'] = "Torso"})
end
if generatedParts[541] then
    table.insert(resizes, {['Part'] = generatedParts[541], ['CFrame'] = (origin + offset) * CFrame.new(-54.825, 9.411, -44.142, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(3.957, 1.978, 1.978)})
    table.insert(colors, {['Part'] = generatedParts[541], ['Color'] = Color3.new(0.000, 0.016, 0.914), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[541], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[541], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[541], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[541], ['Name'] = "Head"})
end
if generatedParts[542] then
    table.insert(resizes, {['Part'] = generatedParts[542], ['CFrame'] = (origin + offset) * CFrame.new(-57.784, 6.443, -43.909, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.978, 3.957, 1.978)})
    table.insert(colors, {['Part'] = generatedParts[542], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[542], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[542], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[542], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[542], ['Name'] = "Left Arm"})
end
if generatedParts[543] then
    table.insert(resizes, {['Part'] = generatedParts[543], ['CFrame'] = (origin + offset) * CFrame.new(-55.811, 2.486, -44.064, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.978, 3.957, 1.978)})
    table.insert(colors, {['Part'] = generatedParts[543], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[543], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[543], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[543], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[543], ['Name'] = "Left Leg"})
end
if generatedParts[544] then
    table.insert(resizes, {['Part'] = generatedParts[544], ['CFrame'] = (origin + offset) * CFrame.new(-54.825, 6.443, -44.142, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(3.957, 3.957, 1.978)})
    table.insert(colors, {['Part'] = generatedParts[544], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[544], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[544], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[544], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[544], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[545] then
    table.insert(resizes, {['Part'] = generatedParts[545], ['CFrame'] = (origin + offset) * CFrame.new(-54.853, 9.733, -44.497, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.978, 0.791, 1.978)})
    table.insert(colors, {['Part'] = generatedParts[545], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[545], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[545], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[545], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[545], ['Name'] = "Handle"})
end
if generatedParts[546] then
    table.insert(resizes, {['Part'] = generatedParts[546], ['CFrame'] = (origin + offset) * CFrame.new(-53.839, 2.486, -44.219, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.978, 3.957, 1.978)})
    table.insert(colors, {['Part'] = generatedParts[546], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[546], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[546], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[546], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[546], ['Name'] = "Right Leg"})
end
if generatedParts[547] then
    table.insert(resizes, {['Part'] = generatedParts[547], ['CFrame'] = (origin + offset) * CFrame.new(-51.867, 6.443, -44.375, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.978, 3.957, 1.978)})
    table.insert(colors, {['Part'] = generatedParts[547], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[547], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[547], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[547], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[547], ['Name'] = "Right Arm"})
end
if generatedParts[548] then
    table.insert(resizes, {['Part'] = generatedParts[548], ['CFrame'] = (origin + offset) * CFrame.new(-54.848, 9.199, -44.438, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(2.327, 0.776, 1.939)})
    table.insert(colors, {['Part'] = generatedParts[548], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[548], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[548], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[548], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[548], ['Name'] = "Handle"})
end
if generatedParts[549] then
    table.insert(resizes, {['Part'] = generatedParts[549], ['CFrame'] = (origin + offset) * CFrame.new(-65.212, 6.923, 40.864, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 4.784, 6.880)})
    table.insert(colors, {['Part'] = generatedParts[549], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[549], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[549], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[549], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[549], ['Name'] = "Part10"})
end
if generatedParts[550] then
    table.insert(resizes, {['Part'] = generatedParts[550], ['CFrame'] = (origin + offset) * CFrame.new(-60.791, 0.550, -103.082, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[550], ['Color'] = Color3.new(0.353, 0.298, 0.259), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[550], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[550], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[550], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[550], ['Name'] = "Rug"})
end
if generatedParts[551] then
    table.insert(resizes, {['Part'] = generatedParts[551], ['CFrame'] = (origin + offset) * CFrame.new(-60.791, 0.550, -103.082, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[551], ['Color'] = Color3.new(0.353, 0.298, 0.259), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[551], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[551], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[551], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[551], ['Name'] = "Rug1"})
end
if generatedParts[552] then
    table.insert(resizes, {['Part'] = generatedParts[552], ['CFrame'] = (origin + offset) * CFrame.new(-77.705, 0.550, -101.751, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[552], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[552], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[552], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[552], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[552], ['Name'] = "Rug"})
end
if generatedParts[553] then
    table.insert(resizes, {['Part'] = generatedParts[553], ['CFrame'] = (origin + offset) * CFrame.new(-85.655, 23.280, -111.249, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), ['Size'] = Vector3.new(26.000, 19.000, 0.100)})
    table.insert(colors, {['Part'] = generatedParts[553], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[553], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[553], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[553], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[553], ['Name'] = "Part3"})
end
if generatedParts[554] then
    table.insert(resizes, {['Part'] = generatedParts[554], ['CFrame'] = (origin + offset) * CFrame.new(-26.484, 0.550, -104.779, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(25.250, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[554], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[554], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[554], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[554], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[554], ['Name'] = "Rug"})
end
if generatedParts[555] then
    table.insert(resizes, {['Part'] = generatedParts[555], ['CFrame'] = (origin + offset) * CFrame.new(-43.611, 0.550, -104.434, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(22.845, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[555], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[555], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[555], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[555], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[555], ['Name'] = "Rug"})
end
if generatedParts[556] then
    table.insert(resizes, {['Part'] = generatedParts[556], ['CFrame'] = (origin + offset) * CFrame.new(-9.437, 0.550, -106.120, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(25.250, 0.134, 16.299)})
    table.insert(colors, {['Part'] = generatedParts[556], ['Color'] = Color3.new(0.533, 0.243, 0.243), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[556], ['Material'] = Enum.Material.Fabric, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[556], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[556], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[556], ['Name'] = "Rug"})
end
if generatedParts[557] then
    table.insert(resizes, {['Part'] = generatedParts[557], ['CFrame'] = (origin + offset) * CFrame.new(-6.032, 2.116, -84.758, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[557], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[557], ['Material'] = Enum.Material.SmoothPlastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[557], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[557], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[557], ['Name'] = "Fire"})
end
if generatedParts[558] then
    table.insert(resizes, {['Part'] = generatedParts[558], ['CFrame'] = (origin + offset) * CFrame.new(-4.431, 22.975, -84.991, 0.000, 0.050, -0.999, -0.000, 0.999, 0.050, 1.000, -0.000, 0.000), ['Size'] = Vector3.new(1.000, 1.000, 4.000)})
    table.insert(colors, {['Part'] = generatedParts[558], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[558], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[558], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[558], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[558], ['Name'] = "Part"})
end
if generatedParts[559] then
    table.insert(resizes, {['Part'] = generatedParts[559], ['CFrame'] = (origin + offset) * CFrame.new(0.156, 23.780, -114.993, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(26.000, 21.000, 0.100)})
    table.insert(colors, {['Part'] = generatedParts[559], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[559], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[559], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[559], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[559], ['Name'] = "Part1"})
end
if generatedParts[560] then
    table.insert(resizes, {['Part'] = generatedParts[560], ['CFrame'] = (origin + offset) * CFrame.new(-72.329, 22.780, -158.596, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(28.000, 18.000, 0.100)})
    table.insert(colors, {['Part'] = generatedParts[560], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[560], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[560], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[560], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[560], ['Name'] = "Part5"})
end
if generatedParts[561] then
    table.insert(resizes, {['Part'] = generatedParts[561], ['CFrame'] = (origin + offset) * CFrame.new(-88.087, 23.280, -142.154, -0.078, 0.000, 0.997, 0.000, 1.000, 0.000, -0.997, 0.000, -0.078), ['Size'] = Vector3.new(26.000, 19.000, 0.100)})
    table.insert(colors, {['Part'] = generatedParts[561], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[561], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[561], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[561], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[561], ['Name'] = "Part2"})
end
if generatedParts[562] then
    table.insert(resizes, {['Part'] = generatedParts[562], ['CFrame'] = (origin + offset) * CFrame.new(-71.140, 3.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[562], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[562], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[562], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[562], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[562], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[563] then
    table.insert(resizes, {['Part'] = generatedParts[563], ['CFrame'] = (origin + offset) * CFrame.new(-69.640, 3.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[563], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[563], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[563], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[563], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[563], ['Name'] = "Left Arm"})
end
if generatedParts[564] then
    table.insert(resizes, {['Part'] = generatedParts[564], ['CFrame'] = (origin + offset) * CFrame.new(-71.640, 1.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[564], ['Color'] = Color3.new(0.000, 0.098, 0.502), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[564], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[564], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[564], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[564], ['Name'] = "Right Leg"})
end
if generatedParts[565] then
    table.insert(resizes, {['Part'] = generatedParts[565], ['CFrame'] = (origin + offset) * CFrame.new(-71.140, 3.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[565], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[565], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[565], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[565], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[565], ['Name'] = "Torso"})
end
if generatedParts[566] then
    table.insert(resizes, {['Part'] = generatedParts[566], ['CFrame'] = (origin + offset) * CFrame.new(-71.140, 5.000, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[566], ['Color'] = Color3.new(0.000, 0.090, 0.537), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[566], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[566], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[566], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[566], ['Name'] = "Head"})
end
if generatedParts[567] then
    table.insert(resizes, {['Part'] = generatedParts[567], ['CFrame'] = (origin + offset) * CFrame.new(-72.640, 3.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[567], ['Color'] = Color3.new(0.067, 0.067, 0.067), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[567], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[567], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[567], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[567], ['Name'] = "Right Arm"})
end
if generatedParts[568] then
    table.insert(resizes, {['Part'] = generatedParts[568], ['CFrame'] = (origin + offset) * CFrame.new(-70.640, 1.500, -144.316, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[568], ['Color'] = Color3.new(0.000, 0.082, 0.576), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[568], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[568], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[568], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[568], ['Name'] = "Left Leg"})
end
if generatedParts[569] then
    table.insert(resizes, {['Part'] = generatedParts[569], ['CFrame'] = (origin + offset) * CFrame.new(-86.710, 4.283, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), ['Size'] = Vector3.new(1.696, 0.848, 0.848)})
    table.insert(colors, {['Part'] = generatedParts[569], ['Color'] = Color3.new(0.706, 0.227, 0.204), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[569], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[569], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[569], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[569], ['Name'] = "Head"})
end
if generatedParts[570] then
    table.insert(resizes, {['Part'] = generatedParts[570], ['CFrame'] = (origin + offset) * CFrame.new(-85.884, 3.011, -154.869, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), ['Size'] = Vector3.new(0.848, 1.696, 0.848)})
    table.insert(colors, {['Part'] = generatedParts[570], ['Color'] = Color3.new(0.706, 0.227, 0.204), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[570], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[570], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[570], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[570], ['Name'] = "Left Arm"})
end
if generatedParts[571] then
    table.insert(resizes, {['Part'] = generatedParts[571], ['CFrame'] = (origin + offset) * CFrame.new(-86.710, 4.274, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), ['Size'] = Vector3.new(0.848, 0.848, 0.848)})
    table.insert(colors, {['Part'] = generatedParts[571], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[571], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[571], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[571], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[571], ['Name'] = "Handle"})
end
if generatedParts[572] then
    table.insert(resizes, {['Part'] = generatedParts[572], ['CFrame'] = (origin + offset) * CFrame.new(-86.710, 3.011, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), ['Size'] = Vector3.new(1.696, 1.696, 0.848)})
    table.insert(colors, {['Part'] = generatedParts[572], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[572], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[572], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[572], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[572], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[573] then
    table.insert(resizes, {['Part'] = generatedParts[573], ['CFrame'] = (origin + offset) * CFrame.new(-86.710, 3.011, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), ['Size'] = Vector3.new(1.696, 1.696, 0.848)})
    table.insert(colors, {['Part'] = generatedParts[573], ['Color'] = Color3.new(0.192, 0.173, 0.145), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[573], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[573], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[573], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[573], ['Name'] = "Torso"})
end
if generatedParts[574] then
    table.insert(resizes, {['Part'] = generatedParts[574], ['CFrame'] = (origin + offset) * CFrame.new(-86.710, 4.783, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), ['Size'] = Vector3.new(0.389, 0.430, 0.084)})
    table.insert(colors, {['Part'] = generatedParts[574], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[574], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[574], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[574], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[574], ['Name'] = "Handle"})
end
if generatedParts[575] then
    table.insert(resizes, {['Part'] = generatedParts[575], ['CFrame'] = (origin + offset) * CFrame.new(-86.986, 1.315, -153.580, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), ['Size'] = Vector3.new(0.848, 1.696, 0.848)})
    table.insert(colors, {['Part'] = generatedParts[575], ['Color'] = Color3.new(0.706, 0.227, 0.204), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[575], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[575], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[575], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[575], ['Name'] = "Right Leg"})
end
if generatedParts[576] then
    table.insert(resizes, {['Part'] = generatedParts[576], ['CFrame'] = (origin + offset) * CFrame.new(-86.435, 1.315, -154.224, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), ['Size'] = Vector3.new(0.848, 1.696, 0.848)})
    table.insert(colors, {['Part'] = generatedParts[576], ['Color'] = Color3.new(0.706, 0.227, 0.204), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[576], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[576], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[576], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[576], ['Name'] = "Left Leg"})
end
if generatedParts[577] then
    table.insert(resizes, {['Part'] = generatedParts[577], ['CFrame'] = (origin + offset) * CFrame.new(-87.536, 3.011, -152.935, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), ['Size'] = Vector3.new(0.848, 1.696, 0.848)})
    table.insert(colors, {['Part'] = generatedParts[577], ['Color'] = Color3.new(0.847, 0.118, 0.106), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[577], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[577], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[577], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[577], ['Name'] = "Right Arm"})
end
if generatedParts[578] then
    table.insert(resizes, {['Part'] = generatedParts[578], ['CFrame'] = (origin + offset) * CFrame.new(-86.710, 4.783, -153.902, -0.649, 0.000, -0.760, 0.000, 1.000, 0.000, 0.760, 0.000, -0.649), ['Size'] = Vector3.new(1.874, 2.673, 0.266)})
    table.insert(colors, {['Part'] = generatedParts[578], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[578], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[578], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[578], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[578], ['Name'] = "Handle"})
end
if generatedParts[579] then
    table.insert(resizes, {['Part'] = generatedParts[579], ['CFrame'] = (origin + offset) * CFrame.new(-86.609, 3.905, -148.549, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(1.227, 1.298, 0.951)})
    table.insert(colors, {['Part'] = generatedParts[579], ['Color'] = Color3.new(0.910, 0.725, 0.584), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[579], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[579], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[579], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[579], ['Name'] = "Head"})
end
if generatedParts[580] then
    table.insert(resizes, {['Part'] = generatedParts[580], ['CFrame'] = (origin + offset) * CFrame.new(-88.213, 4.703, -148.423, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[580], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[580], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[580], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[580], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[580], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[581] then
    table.insert(resizes, {['Part'] = generatedParts[581], ['CFrame'] = (origin + offset) * CFrame.new(-20.489, 22.780, -162.676, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(28.000, 18.000, 0.100)})
    table.insert(colors, {['Part'] = generatedParts[581], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[581], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[581], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[581], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[581], ['Name'] = "Part6"})
end
if generatedParts[582] then
    table.insert(resizes, {['Part'] = generatedParts[582], ['CFrame'] = (origin + offset) * CFrame.new(-2.506, 23.800, -148.809, 0.078, 0.000, -0.997, 0.000, 1.000, 0.000, 0.997, 0.000, 0.078), ['Size'] = Vector3.new(26.000, 21.000, 0.100)})
    table.insert(colors, {['Part'] = generatedParts[582], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[582], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[582], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[582], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[582], ['Name'] = "Part4"})
end
if generatedParts[583] then
    table.insert(resizes, {['Part'] = generatedParts[583], ['CFrame'] = (origin + offset) * CFrame.new(-44.841, 39.901, -147.080, 0.997, -0.078, -0.000, -0.000, -0.000, 1.000, -0.078, -0.997, -0.000), ['Size'] = Vector3.new(27.601, 15.932, 0.663)})
    table.insert(colors, {['Part'] = generatedParts[583], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[583], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[583], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[583], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[583], ['Name'] = "VLight"})
end
if generatedParts[584] then
    table.insert(resizes, {['Part'] = generatedParts[584], ['CFrame'] = (origin + offset) * CFrame.new(-44.692, 40.228, -146.565, 0.997, -0.078, 0.000, 0.000, 0.000, 1.000, -0.078, -0.997, 0.000), ['Size'] = Vector3.new(31.554, 20.650, 0.008)})
    table.insert(colors, {['Part'] = generatedParts[584], ['Color'] = Color3.new(0.357, 0.365, 0.412), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[584], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[584], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[584], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[584], ['Name'] = "VLight"})
end
if generatedParts[585] then
    table.insert(resizes, {['Part'] = generatedParts[585], ['CFrame'] = (origin + offset) * CFrame.new(-17.235, 3.500, -147.314, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[585], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[585], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[585], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[585], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[585], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[586] then
    table.insert(resizes, {['Part'] = generatedParts[586], ['CFrame'] = (origin + offset) * CFrame.new(-16.736, 1.500, -147.353, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[586], ['Color'] = Color3.new(0.486, 0.255, 0.878), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[586], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[586], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[586], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[586], ['Name'] = "Left Leg"})
end
if generatedParts[587] then
    table.insert(resizes, {['Part'] = generatedParts[587], ['CFrame'] = (origin + offset) * CFrame.new(-17.235, 5.000, -147.314, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[587], ['Color'] = Color3.new(0.486, 0.255, 0.878), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[587], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[587], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[587], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[587], ['Name'] = "Head"})
end
if generatedParts[588] then
    table.insert(resizes, {['Part'] = generatedParts[588], ['CFrame'] = (origin + offset) * CFrame.new(-17.237, 5.512, -147.267, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 1.200, 2.200)})
    table.insert(colors, {['Part'] = generatedParts[588], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[588], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[588], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[588], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[588], ['Name'] = "Handle"})
end
if generatedParts[589] then
    table.insert(resizes, {['Part'] = generatedParts[589], ['CFrame'] = (origin + offset) * CFrame.new(-17.733, 1.500, -147.275, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[589], ['Color'] = Color3.new(0.486, 0.255, 0.878), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[589], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[589], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[589], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[589], ['Name'] = "Right Leg"})
end
if generatedParts[590] then
    table.insert(resizes, {['Part'] = generatedParts[590], ['CFrame'] = (origin + offset) * CFrame.new(-17.235, 3.500, -147.314, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[590], ['Color'] = Color3.new(0.055, 0.016, 0.110), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[590], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[590], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[590], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[590], ['Name'] = "Torso"})
end
if generatedParts[591] then
    table.insert(resizes, {['Part'] = generatedParts[591], ['CFrame'] = (origin + offset) * CFrame.new(-15.739, 3.500, -147.432, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[591], ['Color'] = Color3.new(0.486, 0.255, 0.878), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[591], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[591], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[591], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[591], ['Name'] = "Left Arm"})
end
if generatedParts[592] then
    table.insert(resizes, {['Part'] = generatedParts[592], ['CFrame'] = (origin + offset) * CFrame.new(-18.730, 3.500, -147.196, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[592], ['Color'] = Color3.new(0.486, 0.255, 0.878), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[592], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[592], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[592], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[592], ['Name'] = "Right Arm"})
end
if generatedParts[593] then
    table.insert(resizes, {['Part'] = generatedParts[593], ['CFrame'] = (origin + offset) * CFrame.new(-12.443, 3.500, -150.154, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[593], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[593], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[593], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[593], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[593], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[594] then
    table.insert(resizes, {['Part'] = generatedParts[594], ['CFrame'] = (origin + offset) * CFrame.new(-12.443, 5.500, -150.154, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[594], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[594], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[594], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[594], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[594], ['Name'] = "Handle"})
end
if generatedParts[595] then
    table.insert(resizes, {['Part'] = generatedParts[595], ['CFrame'] = (origin + offset) * CFrame.new(-12.941, 1.500, -150.115, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[595], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[595], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[595], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[595], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[595], ['Name'] = "Right Leg"})
end
if generatedParts[596] then
    table.insert(resizes, {['Part'] = generatedParts[596], ['CFrame'] = (origin + offset) * CFrame.new(-12.445, 5.513, -150.107, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 1.200, 2.200)})
    table.insert(colors, {['Part'] = generatedParts[596], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[596], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[596], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[596], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[596], ['Name'] = "Handle"})
end
if generatedParts[597] then
    table.insert(resizes, {['Part'] = generatedParts[597], ['CFrame'] = (origin + offset) * CFrame.new(-11.944, 1.500, -150.193, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[597], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[597], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[597], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[597], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[597], ['Name'] = "Left Leg"})
end
if generatedParts[598] then
    table.insert(resizes, {['Part'] = generatedParts[598], ['CFrame'] = (origin + offset) * CFrame.new(-12.443, 3.500, -150.154, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[598], ['Color'] = Color3.new(0.000, 1.000, 0.996), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[598], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[598], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[598], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[598], ['Name'] = "Torso"})
end
if generatedParts[599] then
    table.insert(resizes, {['Part'] = generatedParts[599], ['CFrame'] = (origin + offset) * CFrame.new(-12.443, 5.000, -150.154, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[599], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[599], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[599], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[599], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[599], ['Name'] = "Head"})
end
if generatedParts[600] then
    table.insert(resizes, {['Part'] = generatedParts[600], ['CFrame'] = (origin + offset) * CFrame.new(-10.947, 3.500, -150.272, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[600], ['Color'] = Color3.new(0.000, 1.000, 0.996), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[600], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[600], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[600], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[600], ['Name'] = "Left Arm"})
end
if generatedParts[601] then
    table.insert(resizes, {['Part'] = generatedParts[601], ['CFrame'] = (origin + offset) * CFrame.new(-13.938, 3.500, -150.036, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[601], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[601], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[601], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[601], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[601], ['Name'] = "Right Arm"})
end
if generatedParts[602] then
    table.insert(resizes, {['Part'] = generatedParts[602], ['CFrame'] = (origin + offset) * CFrame.new(-22.137, 5.313, -145.879, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.800, 1.300, 1.800)})
    table.insert(colors, {['Part'] = generatedParts[602], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[602], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[602], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[602], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[602], ['Name'] = "Handle"})
end
if generatedParts[603] then
    table.insert(resizes, {['Part'] = generatedParts[603], ['CFrame'] = (origin + offset) * CFrame.new(-22.626, 1.500, -145.728, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[603], ['Color'] = Color3.new(0.835, 0.835, 0.835), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[603], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[603], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[603], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[603], ['Name'] = "Right Leg"})
end
if generatedParts[604] then
    table.insert(resizes, {['Part'] = generatedParts[604], ['CFrame'] = (origin + offset) * CFrame.new(-22.095, 5.723, -145.763, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.130, 1.130, 1.130)})
    table.insert(colors, {['Part'] = generatedParts[604], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[604], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[604], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[604], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[604], ['Name'] = "Handle"})
end
if generatedParts[605] then
    table.insert(resizes, {['Part'] = generatedParts[605], ['CFrame'] = (origin + offset) * CFrame.new(-21.629, 1.500, -145.806, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[605], ['Color'] = Color3.new(0.831, 0.831, 0.831), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[605], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[605], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[605], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[605], ['Name'] = "Left Leg"})
end
if generatedParts[606] then
    table.insert(resizes, {['Part'] = generatedParts[606], ['CFrame'] = (origin + offset) * CFrame.new(-22.128, 3.500, -145.767, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[606], ['Color'] = Color3.new(0.004, 0.063, 0.086), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[606], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[606], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[606], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[606], ['Name'] = "Torso"})
end
if generatedParts[607] then
    table.insert(resizes, {['Part'] = generatedParts[607], ['CFrame'] = (origin + offset) * CFrame.new(-22.128, 3.500, -145.767, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[607], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[607], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[607], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[607], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[607], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[608] then
    table.insert(resizes, {['Part'] = generatedParts[608], ['CFrame'] = (origin + offset) * CFrame.new(-23.623, 3.500, -145.649, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[608], ['Color'] = Color3.new(0.004, 0.063, 0.086), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[608], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[608], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[608], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[608], ['Name'] = "Right Arm"})
end
if generatedParts[609] then
    table.insert(resizes, {['Part'] = generatedParts[609], ['CFrame'] = (origin + offset) * CFrame.new(-20.633, 3.500, -145.885, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[609], ['Color'] = Color3.new(0.051, 0.110, 0.145), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[609], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[609], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[609], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[609], ['Name'] = "Left Arm"})
end
if generatedParts[610] then
    table.insert(resizes, {['Part'] = generatedParts[610], ['CFrame'] = (origin + offset) * CFrame.new(-22.128, 5.000, -145.767, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[610], ['Color'] = Color3.new(0.976, 0.976, 0.976), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[610], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[610], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[610], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[610], ['Name'] = "Head"})
end
if generatedParts[611] then
    table.insert(resizes, {['Part'] = generatedParts[611], ['CFrame'] = (origin + offset) * CFrame.new(-27.004, 6.870, -143.541, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[611], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[611], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[611], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[611], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[611], ['Name'] = "Handle"})
end
if generatedParts[612] then
    table.insert(resizes, {['Part'] = generatedParts[612], ['CFrame'] = (origin + offset) * CFrame.new(-25.447, 3.500, -143.329, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[612], ['Color'] = Color3.new(0.827, 0.655, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[612], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[612], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[612], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[612], ['Name'] = "Left Arm"})
end
if generatedParts[613] then
    table.insert(resizes, {['Part'] = generatedParts[613], ['CFrame'] = (origin + offset) * CFrame.new(-28.438, 3.500, -143.093, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[613], ['Color'] = Color3.new(0.827, 0.655, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[613], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[613], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[613], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[613], ['Name'] = "Right Arm"})
end
if generatedParts[614] then
    table.insert(resizes, {['Part'] = generatedParts[614], ['CFrame'] = (origin + offset) * CFrame.new(-27.441, 1.500, -143.172, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[614], ['Color'] = Color3.new(0.827, 0.655, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[614], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[614], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[614], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[614], ['Name'] = "Right Leg"})
end
if generatedParts[615] then
    table.insert(resizes, {['Part'] = generatedParts[615], ['CFrame'] = (origin + offset) * CFrame.new(-26.444, 1.500, -143.250, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[615], ['Color'] = Color3.new(0.827, 0.655, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[615], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[615], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[615], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[615], ['Name'] = "Left Leg"})
end
if generatedParts[616] then
    table.insert(resizes, {['Part'] = generatedParts[616], ['CFrame'] = (origin + offset) * CFrame.new(-26.944, 5.512, -143.164, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 1.200, 2.200)})
    table.insert(colors, {['Part'] = generatedParts[616], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[616], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[616], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[616], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[616], ['Name'] = "Handle"})
end
if generatedParts[617] then
    table.insert(resizes, {['Part'] = generatedParts[617], ['CFrame'] = (origin + offset) * CFrame.new(-26.942, 3.500, -143.211, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[617], ['Color'] = Color3.new(0.827, 0.655, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[617], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[617], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[617], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[617], ['Name'] = "Torso"})
end
if generatedParts[618] then
    table.insert(resizes, {['Part'] = generatedParts[618], ['CFrame'] = (origin + offset) * CFrame.new(-26.942, 3.500, -143.211, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[618], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[618], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[618], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[618], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[618], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[619] then
    table.insert(resizes, {['Part'] = generatedParts[619], ['CFrame'] = (origin + offset) * CFrame.new(-26.942, 5.000, -143.211, -0.997, 0.000, -0.078, 0.000, 1.000, 0.000, 0.078, 0.000, -0.997), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[619], ['Color'] = Color3.new(0.827, 0.655, 0.514), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[619], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[619], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[619], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[619], ['Name'] = "Head"})
end
if generatedParts[620] then
    table.insert(resizes, {['Part'] = generatedParts[620], ['CFrame'] = (origin + offset) * CFrame.new(-61.140, 3.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[620], ['Color'] = Color3.new(0.624, 0.161, 0.125), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[620], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[620], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[620], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[620], ['Name'] = "Torso"})
end
if generatedParts[621] then
    table.insert(resizes, {['Part'] = generatedParts[621], ['CFrame'] = (origin + offset) * CFrame.new(-60.827, 5.910, -141.916, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[621], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[621], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[621], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[621], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[621], ['Name'] = "Handle"})
end
if generatedParts[622] then
    table.insert(resizes, {['Part'] = generatedParts[622], ['CFrame'] = (origin + offset) * CFrame.new(-61.640, 1.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[622], ['Color'] = Color3.new(0.910, 0.180, 0.180), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[622], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[622], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[622], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[622], ['Name'] = "Right Leg"})
end
if generatedParts[623] then
    table.insert(resizes, {['Part'] = generatedParts[623], ['CFrame'] = (origin + offset) * CFrame.new(-62.640, 3.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[623], ['Color'] = Color3.new(0.980, 0.039, 0.039), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[623], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[623], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[623], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[623], ['Name'] = "Right Arm"})
end
if generatedParts[624] then
    table.insert(resizes, {['Part'] = generatedParts[624], ['CFrame'] = (origin + offset) * CFrame.new(-60.640, 1.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[624], ['Color'] = Color3.new(0.871, 0.098, 0.086), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[624], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[624], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[624], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[624], ['Name'] = "Left Leg"})
end
if generatedParts[625] then
    table.insert(resizes, {['Part'] = generatedParts[625], ['CFrame'] = (origin + offset) * CFrame.new(-61.140, 3.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[625], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[625], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[625], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[625], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[625], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[626] then
    table.insert(resizes, {['Part'] = generatedParts[626], ['CFrame'] = (origin + offset) * CFrame.new(-61.140, 5.000, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[626], ['Color'] = Color3.new(0.965, 0.024, 0.024), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[626], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[626], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[626], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[626], ['Name'] = "Head"})
end
if generatedParts[627] then
    table.insert(resizes, {['Part'] = generatedParts[627], ['CFrame'] = (origin + offset) * CFrame.new(-59.640, 3.500, -141.816, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.000, 2.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[627], ['Color'] = Color3.new(0.965, 0.024, 0.024), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[627], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[627], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[627], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[627], ['Name'] = "Left Arm"})
end
if generatedParts[628] then
    table.insert(resizes, {['Part'] = generatedParts[628], ['CFrame'] = (origin + offset) * CFrame.new(-44.768, 21.900, -148.577, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(9.600, 4.800, 4.800)})
    table.insert(colors, {['Part'] = generatedParts[628], ['Color'] = Color3.new(0.004, 0.035, 0.051), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[628], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[628], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[628], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[628], ['Name'] = "Head"})
end
if generatedParts[629] then
    table.insert(resizes, {['Part'] = generatedParts[629], ['CFrame'] = (origin + offset) * CFrame.new(-47.161, 5.100, -148.389, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.800, 9.600, 4.800)})
    table.insert(colors, {['Part'] = generatedParts[629], ['Color'] = Color3.new(0.427, 0.020, 0.424), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[629], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[629], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[629], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[629], ['Name'] = "Left Leg"})
end
if generatedParts[630] then
    table.insert(resizes, {['Part'] = generatedParts[630], ['CFrame'] = (origin + offset) * CFrame.new(-51.946, 14.700, -148.012, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.800, 9.600, 4.800)})
    table.insert(colors, {['Part'] = generatedParts[630], ['Color'] = Color3.new(0.478, 0.055, 0.467), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[630], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[630], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[630], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[630], ['Name'] = "Left Arm"})
end
if generatedParts[631] then
    table.insert(resizes, {['Part'] = generatedParts[631], ['CFrame'] = (origin + offset) * CFrame.new(-37.591, 14.650, -149.143, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.800, 9.600, 4.800)})
    table.insert(colors, {['Part'] = generatedParts[631], ['Color'] = Color3.new(0.478, 0.055, 0.467), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[631], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[631], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[631], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[631], ['Name'] = "Right Arm"})
end
if generatedParts[632] then
    table.insert(resizes, {['Part'] = generatedParts[632], ['CFrame'] = (origin + offset) * CFrame.new(-44.768, 14.700, -148.577, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(9.600, 9.600, 4.800)})
    table.insert(colors, {['Part'] = generatedParts[632], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[632], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[632], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[632], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[632], ['Name'] = "HumanoidRootPart"})
end
if generatedParts[633] then
    table.insert(resizes, {['Part'] = generatedParts[633], ['CFrame'] = (origin + offset) * CFrame.new(-44.768, 14.700, -148.577, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(9.600, 9.600, 4.800)})
    table.insert(colors, {['Part'] = generatedParts[633], ['Color'] = Color3.new(0.004, 0.035, 0.051), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[633], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[633], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[633], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[633], ['Name'] = "Torso"})
end
if generatedParts[634] then
    table.insert(resizes, {['Part'] = generatedParts[634], ['CFrame'] = (origin + offset) * CFrame.new(-42.376, 5.100, -148.766, 0.997, 0.000, 0.078, 0.000, 1.000, 0.000, -0.078, 0.000, 0.997), ['Size'] = Vector3.new(4.800, 9.600, 4.800)})
    table.insert(colors, {['Part'] = generatedParts[634], ['Color'] = Color3.new(0.416, 0.012, 0.412), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[634], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[634], ['Anchored'] = false})
    table.insert(collisions, {['Part'] = generatedParts[634], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[634], ['Name'] = "Right Leg"})
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
if generatedParts[1] then
    pcall(function() AddMesh(generatedParts[1]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[1], "12305010") end)
    pcall(function() MeshResize(generatedParts[1], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[1], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[2] then
    pcall(function() SpawnDecal(generatedParts[2], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[2], "18563226", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[2], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[2], "18563226", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[2], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[2], "18563226", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[2], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[2], "41128519", Enum.NormalId.Top) end)
    pcall(function() SpawnDecal(generatedParts[2], Enum.NormalId.Left) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[2], "18563226", Enum.NormalId.Left) end)
    pcall(function() SpawnDecal(generatedParts[2], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[2], "13386572", Enum.NormalId.Top) end)
    pcall(function() SpawnDecal(generatedParts[2], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[2], "41128519", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[2], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[2], "41128519", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[2], Enum.NormalId.Left) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[2], "41128519", Enum.NormalId.Left) end)
    pcall(function() SpawnDecal(generatedParts[2], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[2], "41128519", Enum.NormalId.Back) end)
end
if generatedParts[3] then
    pcall(function() SpawnDecal(generatedParts[3], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[3], "41128519", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[3], Enum.NormalId.Left) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[3], "41128519", Enum.NormalId.Left) end)
    pcall(function() SpawnDecal(generatedParts[3], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[3], "41128519", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[3], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[3], "41128519", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[3], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[3], "41128519", Enum.NormalId.Top) end)
end
if generatedParts[4] then
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "41128519", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Left) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "41128519", Enum.NormalId.Left) end)
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "13386572", Enum.NormalId.Top) end)
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "18563226", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "41128519", Enum.NormalId.Top) end)
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "41128519", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "18563226", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "41128519", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Left) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "18563226", Enum.NormalId.Left) end)
    pcall(function() SpawnDecal(generatedParts[4], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[4], "18563226", Enum.NormalId.Right) end)
end
if generatedParts[5] then
    pcall(function() SpawnDecal(generatedParts[5], Enum.NormalId.Left) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[5], "41128519", Enum.NormalId.Left) end)
    pcall(function() SpawnDecal(generatedParts[5], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[5], "41128519", Enum.NormalId.Top) end)
    pcall(function() SpawnDecal(generatedParts[5], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[5], "41128519", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[5], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[5], "41128519", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[5], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[5], "62308883", Enum.NormalId.Front) end)
end
if generatedParts[6] then
    pcall(function() AddMesh(generatedParts[6]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[6], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[6], Vector3.new(1.200, 1.200, 1.200)) end)
    pcall(function() vect(generatedParts[6], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[6], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[6], "62308971", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[6], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[6], "62308950", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[6], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[6], "58965400", Enum.NormalId.Front) end)
end
if generatedParts[7] then
    pcall(function() SpawnDecal(generatedParts[7], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[7], "41128519", Enum.NormalId.Top) end)
    pcall(function() SpawnDecal(generatedParts[7], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[7], "41128519", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[7], Enum.NormalId.Left) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[7], "41128519", Enum.NormalId.Left) end)
    pcall(function() SpawnDecal(generatedParts[7], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[7], "41128519", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[7], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[7], "41128519", Enum.NormalId.Front) end)
end
if generatedParts[9] then
    pcall(function() SpawnDecal(generatedParts[9], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[9], "15829969", Enum.NormalId.Top) end)
end
if generatedParts[10] then
    pcall(function() AddMesh(generatedParts[10]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[10], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[10], Vector3.new(1.250, 1.250, 1.250)) end)
end
if generatedParts[11] then
    pcall(function() SpawnDecal(generatedParts[11], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[11], "15829969", Enum.NormalId.Top) end)
end
if generatedParts[14] then
    pcall(function() AddMesh(generatedParts[14]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[14], "12305010") end)
    pcall(function() MeshResize(generatedParts[14], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[14], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[20] then
    pcall(function() AddMesh(generatedParts[20]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[20], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[20], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[20], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[20], "62308950", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[20], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[20], "58965400", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[20], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[20], "62308971", Enum.NormalId.Front) end)
end
if generatedParts[69] then
    pcall(function() SpawnDecal(generatedParts[69], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[69], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[70] then
    pcall(function() SpawnDecal(generatedParts[70], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[70], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[71] then
    pcall(function() SpawnDecal(generatedParts[71], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[71], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[72] then
    pcall(function() SpawnDecal(generatedParts[72], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[72], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[73] then
    pcall(function() SpawnDecal(generatedParts[73], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[73], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[74] then
    pcall(function() SpawnDecal(generatedParts[74], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[74], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[75] then
    pcall(function() SpawnDecal(generatedParts[75], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[75], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[76] then
    pcall(function() SpawnDecal(generatedParts[76], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[76], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[77] then
    pcall(function() SpawnDecal(generatedParts[77], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[77], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[77], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[77], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[77], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[77], "13943307", Enum.NormalId.Right) end)
    pcall(function() AddMesh(generatedParts[77]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[77], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[77], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[77], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[78] then
    pcall(function() SpawnDecal(generatedParts[78], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[78], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[78], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[78], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[78]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[78], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[78], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[78], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[78], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[78], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[80] then
    pcall(function() SpawnDecal(generatedParts[80], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[80], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[80], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[80], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[80], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[80], "13943307", Enum.NormalId.Right) end)
    pcall(function() AddMesh(generatedParts[80]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[80], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[80], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[80], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[81] then
    pcall(function() SpawnDecal(generatedParts[81], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[81], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[81]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[81], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[81], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[81], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[81], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[81], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[81], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[81], "70983855", Enum.NormalId.Front) end)
end
if generatedParts[82] then
    pcall(function() SpawnDecal(generatedParts[82], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[82], "13943307", Enum.NormalId.Right) end)
    pcall(function() AddMesh(generatedParts[82]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[82], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[82], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[82], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[82], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[82], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[82], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[82], "70983855", Enum.NormalId.Back) end)
end
if generatedParts[83] then
    pcall(function() SpawnDecal(generatedParts[83], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[83], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[83], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[83], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[83], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[83], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[83]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[83], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[83], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[83], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[84] then
    pcall(function() SpawnDecal(generatedParts[84], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[84], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[84], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[84], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[84]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[84], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[84], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[84], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[84], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[84], "70983855", Enum.NormalId.Front) end)
end
if generatedParts[85] then
    pcall(function() SpawnDecal(generatedParts[85], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[85], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[85]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[85], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[85], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[85], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[85], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[85], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[85], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[85], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[86] then
    pcall(function() AddMesh(generatedParts[86]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[86], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[86], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[86], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[86], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[86], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[86], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[86], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[86], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[86], "70983855", Enum.NormalId.Front) end)
end
if generatedParts[91] then
    pcall(function() SpawnDecal(generatedParts[91], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[91], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[92] then
    pcall(function() SpawnDecal(generatedParts[92], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[92], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[93] then
    pcall(function() SpawnDecal(generatedParts[93], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[93], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[94] then
    pcall(function() SpawnDecal(generatedParts[94], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[94], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[95] then
    pcall(function() SpawnDecal(generatedParts[95], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[95], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[96] then
    pcall(function() SpawnDecal(generatedParts[96], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[96], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[97] then
    pcall(function() SpawnDecal(generatedParts[97], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[97], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[98] then
    pcall(function() SpawnDecal(generatedParts[98], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[98], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[111] then
    pcall(function() SpawnDecal(generatedParts[111], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[111], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[112] then
    pcall(function() SpawnDecal(generatedParts[112], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[112], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[113] then
    pcall(function() SpawnDecal(generatedParts[113], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[113], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[114] then
    pcall(function() SpawnDecal(generatedParts[114], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[114], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[115] then
    pcall(function() SpawnDecal(generatedParts[115], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[115], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[116] then
    pcall(function() SpawnDecal(generatedParts[116], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[116], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[117] then
    pcall(function() SpawnDecal(generatedParts[117], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[117], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[118] then
    pcall(function() SpawnDecal(generatedParts[118], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[118], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[118]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[118], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[118], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[118], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[118], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[118], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[118], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[118], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[119] then
    pcall(function() SpawnDecal(generatedParts[119], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[119], "13943307", Enum.NormalId.Right) end)
    pcall(function() AddMesh(generatedParts[119]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[119], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[119], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[119], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[119], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[119], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[119], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[119], "70983855", Enum.NormalId.Front) end)
end
if generatedParts[120] then
    pcall(function() SpawnDecal(generatedParts[120], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[120], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[120], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[120], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[120]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[120], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[120], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[120], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[120], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[120], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[121] then
    pcall(function() SpawnDecal(generatedParts[121], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[121], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[121]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[121], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[121], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[121], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[121], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[121], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[121], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[121], "70983855", Enum.NormalId.Front) end)
end
if generatedParts[122] then
    pcall(function() SpawnDecal(generatedParts[122], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[122], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[122]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[122], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[122], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[122], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[122], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[122], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[122], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[122], "70983855", Enum.NormalId.Back) end)
end
if generatedParts[123] then
    pcall(function() SpawnDecal(generatedParts[123], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[123], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[123], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[123], "13943307", Enum.NormalId.Right) end)
    pcall(function() AddMesh(generatedParts[123]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[123], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[123], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[123], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[123], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[123], "70983855", Enum.NormalId.Back) end)
end
if generatedParts[125] then
    pcall(function() SpawnDecal(generatedParts[125], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[125], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[125], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[125], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[125], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[125], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[125]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[125], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[125], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[125], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[126] then
    pcall(function() SpawnDecal(generatedParts[126], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[126], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[126]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[126], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[126], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[126], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[126], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[126], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[126], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[126], "70983855", Enum.NormalId.Front) end)
end
if generatedParts[127] then
    pcall(function() SpawnDecal(generatedParts[127], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[127], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[127]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[127], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[127], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[127], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[127], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[127], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[127], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[127], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[134] then
    pcall(function() SpawnDecal(generatedParts[134], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[134], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[135] then
    pcall(function() SpawnDecal(generatedParts[135], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[135], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[136] then
    pcall(function() SpawnDecal(generatedParts[136], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[136], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[137] then
    pcall(function() SpawnDecal(generatedParts[137], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[137], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[138] then
    pcall(function() SpawnDecal(generatedParts[138], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[138], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[139] then
    pcall(function() SpawnDecal(generatedParts[139], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[139], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[140] then
    pcall(function() SpawnDecal(generatedParts[140], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[140], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[141] then
    pcall(function() SpawnDecal(generatedParts[141], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[141], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[142] then
    pcall(function() SpawnDecal(generatedParts[142], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[142], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[143] then
    pcall(function() SpawnDecal(generatedParts[143], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[143], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[144] then
    pcall(function() SpawnDecal(generatedParts[144], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[144], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[145] then
    pcall(function() SpawnDecal(generatedParts[145], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[145], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[146] then
    pcall(function() SpawnDecal(generatedParts[146], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[146], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[147] then
    pcall(function() SpawnDecal(generatedParts[147], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[147], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[148] then
    pcall(function() SpawnDecal(generatedParts[148], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[148], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[149] then
    pcall(function() SpawnDecal(generatedParts[149], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[149], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[150] then
    pcall(function() SpawnDecal(generatedParts[150], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[150], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[151] then
    pcall(function() SpawnDecal(generatedParts[151], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[151], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[152] then
    pcall(function() SpawnDecal(generatedParts[152], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[152], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[153] then
    pcall(function() AddMesh(generatedParts[153]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[153], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[153], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[153], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[153], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[153], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[153], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[153], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[153], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[153], "70983855", Enum.NormalId.Front) end)
end
if generatedParts[154] then
    pcall(function() AddMesh(generatedParts[154]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[154], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[154], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[154], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[154], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[154], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[154], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[154], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[154], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[154], "70983855", Enum.NormalId.Front) end)
end
if generatedParts[155] then
    pcall(function() SpawnDecal(generatedParts[155], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[155], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[155]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[155], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[155], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[155], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[155], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[155], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[155], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[155], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[156] then
    pcall(function() SpawnDecal(generatedParts[156], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[156], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[156], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[156], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[156], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[156], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[156]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[156], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[156], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[156], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[157] then
    pcall(function() SpawnDecal(generatedParts[157], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[157], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[157], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[157], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[157], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[157], "13943307", Enum.NormalId.Right) end)
    pcall(function() AddMesh(generatedParts[157]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[157], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[157], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[157], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[159] then
    pcall(function() SpawnDecal(generatedParts[159], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[159], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[159], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[159], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[159]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[159], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[159], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[159], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[159], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[159], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[160] then
    pcall(function() SpawnDecal(generatedParts[160], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[160], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[160]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[160], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[160], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[160], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[160], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[160], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[160], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[160], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[161] then
    pcall(function() SpawnDecal(generatedParts[161], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[161], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[161], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[161], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[161]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[161], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[161], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[161], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[161], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[161], "70983855", Enum.NormalId.Front) end)
end
if generatedParts[162] then
    pcall(function() SpawnDecal(generatedParts[162], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[162], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[162], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[162], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[162]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[162], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[162], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[162], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[162], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[162], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[167] then
    pcall(function() SpawnDecal(generatedParts[167], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[167], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[168] then
    pcall(function() SpawnDecal(generatedParts[168], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[168], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[169] then
    pcall(function() SpawnDecal(generatedParts[169], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[169], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[170] then
    pcall(function() SpawnDecal(generatedParts[170], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[170], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[187] then
    pcall(function() SpawnDecal(generatedParts[187], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[187], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[188] then
    pcall(function() SpawnDecal(generatedParts[188], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[188], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[189] then
    pcall(function() SpawnDecal(generatedParts[189], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[189], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[190] then
    pcall(function() SpawnDecal(generatedParts[190], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[190], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[191] then
    pcall(function() SpawnDecal(generatedParts[191], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[191], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[192] then
    pcall(function() SpawnDecal(generatedParts[192], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[192], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[197] then
    pcall(function() SpawnDecal(generatedParts[197], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[197], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[198] then
    pcall(function() SpawnDecal(generatedParts[198], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[198], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[199] then
    pcall(function() SpawnDecal(generatedParts[199], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[199], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[200] then
    pcall(function() SpawnDecal(generatedParts[200], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[200], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[201] then
    pcall(function() SpawnDecal(generatedParts[201], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[201], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[202] then
    pcall(function() SpawnDecal(generatedParts[202], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[202], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[203] then
    pcall(function() SpawnDecal(generatedParts[203], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[203], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[204] then
    pcall(function() SpawnDecal(generatedParts[204], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[204], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[205] then
    pcall(function() SpawnDecal(generatedParts[205], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[205], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[206] then
    pcall(function() SpawnDecal(generatedParts[206], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[206], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[207] then
    pcall(function() SpawnDecal(generatedParts[207], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[207], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[208] then
    pcall(function() SpawnDecal(generatedParts[208], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[208], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[209] then
    pcall(function() SpawnDecal(generatedParts[209], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[209], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[210] then
    pcall(function() SpawnDecal(generatedParts[210], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[210], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[211] then
    pcall(function() SpawnDecal(generatedParts[211], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[211], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[212] then
    pcall(function() SpawnDecal(generatedParts[212], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[212], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[213] then
    pcall(function() SpawnDecal(generatedParts[213], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[213], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[214] then
    pcall(function() SpawnDecal(generatedParts[214], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[214], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[215] then
    pcall(function() SpawnDecal(generatedParts[215], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[215], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[216] then
    pcall(function() SpawnDecal(generatedParts[216], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[216], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[217] then
    pcall(function() SpawnDecal(generatedParts[217], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[217], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[218] then
    pcall(function() SpawnDecal(generatedParts[218], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[218], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[219] then
    pcall(function() SpawnDecal(generatedParts[219], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[219], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[220] then
    pcall(function() SpawnDecal(generatedParts[220], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[220], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[221] then
    pcall(function() SpawnDecal(generatedParts[221], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[221], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[222] then
    pcall(function() SpawnDecal(generatedParts[222], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[222], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[223] then
    pcall(function() SpawnDecal(generatedParts[223], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[223], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[224] then
    pcall(function() SpawnDecal(generatedParts[224], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[224], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[225] then
    pcall(function() SpawnDecal(generatedParts[225], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[225], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[226] then
    pcall(function() SpawnDecal(generatedParts[226], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[226], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[227] then
    pcall(function() SpawnDecal(generatedParts[227], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[227], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[228] then
    pcall(function() SpawnDecal(generatedParts[228], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[228], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[229] then
    pcall(function() SpawnDecal(generatedParts[229], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[229], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[230] then
    pcall(function() SpawnDecal(generatedParts[230], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[230], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[231] then
    pcall(function() SpawnDecal(generatedParts[231], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[231], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[232] then
    pcall(function() SpawnDecal(generatedParts[232], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[232], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[233] then
    pcall(function() SpawnDecal(generatedParts[233], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[233], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[234] then
    pcall(function() SpawnDecal(generatedParts[234], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[234], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[235] then
    pcall(function() SpawnDecal(generatedParts[235], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[235], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[236] then
    pcall(function() SpawnDecal(generatedParts[236], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[236], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[237] then
    pcall(function() SpawnDecal(generatedParts[237], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[237], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[238] then
    pcall(function() SpawnDecal(generatedParts[238], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[238], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[239] then
    pcall(function() SpawnDecal(generatedParts[239], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[239], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[240] then
    pcall(function() SpawnDecal(generatedParts[240], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[240], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[241] then
    pcall(function() SpawnDecal(generatedParts[241], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[241], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[242] then
    pcall(function() SpawnDecal(generatedParts[242], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[242], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[243] then
    pcall(function() SpawnDecal(generatedParts[243], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[243], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[244] then
    pcall(function() SpawnDecal(generatedParts[244], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[244], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[245] then
    pcall(function() SpawnDecal(generatedParts[245], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[245], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[246] then
    pcall(function() SpawnDecal(generatedParts[246], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[246], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[247] then
    pcall(function() SpawnDecal(generatedParts[247], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[247], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[248] then
    pcall(function() SpawnDecal(generatedParts[248], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[248], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[249] then
    pcall(function() SpawnDecal(generatedParts[249], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[249], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[250] then
    pcall(function() SpawnDecal(generatedParts[250], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[250], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[251] then
    pcall(function() SpawnDecal(generatedParts[251], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[251], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[252] then
    pcall(function() SpawnDecal(generatedParts[252], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[252], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[253] then
    pcall(function() SpawnDecal(generatedParts[253], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[253], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[254] then
    pcall(function() SpawnDecal(generatedParts[254], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[254], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[255] then
    pcall(function() SpawnDecal(generatedParts[255], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[255], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[256] then
    pcall(function() SpawnDecal(generatedParts[256], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[256], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[257] then
    pcall(function() SpawnDecal(generatedParts[257], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[257], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[260] then
    pcall(function() SpawnDecal(generatedParts[260], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[260], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[261] then
    pcall(function() SpawnDecal(generatedParts[261], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[261], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[264] then
    pcall(function() SpawnDecal(generatedParts[264], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[264], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[265] then
    pcall(function() SpawnDecal(generatedParts[265], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[265], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[266] then
    pcall(function() SpawnDecal(generatedParts[266], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[266], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[266]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[266], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[266], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[266], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[266], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[266], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[266], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[266], "70983855", Enum.NormalId.Back) end)
end
if generatedParts[267] then
    pcall(function() SpawnDecal(generatedParts[267], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[267], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[267], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[267], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[267], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[267], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[267]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[267], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[267], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[267], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[268] then
    pcall(function() SpawnDecal(generatedParts[268], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[268], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[268]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[268], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[268], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[268], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[268], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[268], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[268], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[268], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[270] then
    pcall(function() SpawnDecal(generatedParts[270], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[270], "70983855", Enum.NormalId.Back) end)
    pcall(function() AddMesh(generatedParts[270]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[270], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[270], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[270], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[270], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[270], "70983855", Enum.NormalId.Front) end)
    pcall(function() SpawnDecal(generatedParts[270], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[270], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[271] then
    pcall(function() SpawnDecal(generatedParts[271], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[271], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[271], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[271], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[271], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[271], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[271]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[271], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[271], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[271], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[272] then
    pcall(function() SpawnDecal(generatedParts[272], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[272], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[272], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[272], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[272]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[272], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[272], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[272], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[272], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[272], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[273] then
    pcall(function() SpawnDecal(generatedParts[273], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[273], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[273]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[273], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[273], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[273], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[273], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[273], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[273], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[273], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[274] then
    pcall(function() SpawnDecal(generatedParts[274], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[274], "70983855", Enum.NormalId.Front) end)
    pcall(function() AddMesh(generatedParts[274]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[274], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[274], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[274], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[274], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[274], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[274], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[274], "13943307", Enum.NormalId.Right) end)
end
if generatedParts[275] then
    pcall(function() AddMesh(generatedParts[275]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[275], Enum.MeshType.Brick) end)
    pcall(function() MeshResize(generatedParts[275], Vector3.new(1.000, 1.000, 0.100)) end)
    pcall(function() vect(generatedParts[275], Vector3.new(0.000, 0.000, 0.000)) end)
    pcall(function() SpawnDecal(generatedParts[275], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[275], "70983855", Enum.NormalId.Back) end)
    pcall(function() SpawnDecal(generatedParts[275], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[275], "13943307", Enum.NormalId.Right) end)
    pcall(function() SpawnDecal(generatedParts[275], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[275], "70983855", Enum.NormalId.Front) end)
end
if generatedParts[280] then
    pcall(function() SpawnDecal(generatedParts[280], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[280], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[281] then
    pcall(function() SpawnDecal(generatedParts[281], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[281], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[284] then
    pcall(function() SpawnDecal(generatedParts[284], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[284], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[285] then
    pcall(function() SpawnDecal(generatedParts[285], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[285], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[288] then
    pcall(function() SpawnDecal(generatedParts[288], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[288], "6598434718", Enum.NormalId.Front) end)
end
if generatedParts[289] then
    pcall(function() SpawnDecal(generatedParts[289], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[289], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[290] then
    pcall(function() SpawnDecal(generatedParts[290], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[290], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[291] then
    pcall(function() SpawnDecal(generatedParts[291], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[291], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[292] then
    pcall(function() SpawnDecal(generatedParts[292], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[292], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[293] then
    pcall(function() SpawnDecal(generatedParts[293], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[293], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[294] then
    pcall(function() SpawnDecal(generatedParts[294], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[294], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[295] then
    pcall(function() SpawnDecal(generatedParts[295], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[295], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[296] then
    pcall(function() SpawnDecal(generatedParts[296], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[296], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[297] then
    pcall(function() SpawnDecal(generatedParts[297], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[297], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[298] then
    pcall(function() SpawnDecal(generatedParts[298], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[298], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[299] then
    pcall(function() SpawnDecal(generatedParts[299], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[299], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[300] then
    pcall(function() SpawnDecal(generatedParts[300], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[300], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[301] then
    pcall(function() SpawnDecal(generatedParts[301], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[301], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[302] then
    pcall(function() SpawnDecal(generatedParts[302], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[302], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[303] then
    pcall(function() SpawnDecal(generatedParts[303], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[303], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[304] then
    pcall(function() SpawnDecal(generatedParts[304], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[304], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[307] then
    pcall(function() SpawnDecal(generatedParts[307], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[307], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[308] then
    pcall(function() SpawnDecal(generatedParts[308], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[308], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[309] then
    pcall(function() SpawnDecal(generatedParts[309], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[309], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[310] then
    pcall(function() SpawnDecal(generatedParts[310], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[310], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[311] then
    pcall(function() SpawnDecal(generatedParts[311], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[311], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[312] then
    pcall(function() SpawnDecal(generatedParts[312], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[312], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[315] then
    pcall(function() SpawnDecal(generatedParts[315], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[315], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[316] then
    pcall(function() SpawnDecal(generatedParts[316], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[316], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[317] then
    pcall(function() SpawnDecal(generatedParts[317], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[317], "6598434718", Enum.NormalId.Front) end)
end
if generatedParts[324] then
    pcall(function() SpawnDecal(generatedParts[324], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[324], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[325] then
    pcall(function() SpawnDecal(generatedParts[325], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[325], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[326] then
    pcall(function() SpawnDecal(generatedParts[326], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[326], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[327] then
    pcall(function() SpawnDecal(generatedParts[327], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[327], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[337] then
    pcall(function() SpawnDecal(generatedParts[337], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[337], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[342] then
    pcall(function() SpawnDecal(generatedParts[342], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[342], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[353] then
    pcall(function() SpawnDecal(generatedParts[353], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[353], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[355] then
    pcall(function() SpawnDecal(generatedParts[355], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[355], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[359] then
    pcall(function() SpawnDecal(generatedParts[359], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[359], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[361] then
    pcall(function() SpawnDecal(generatedParts[361], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[361], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[380] then
    pcall(function() SpawnDecal(generatedParts[380], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[380], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[383] then
    pcall(function() SpawnDecal(generatedParts[383], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[383], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[408] then
    pcall(function() SpawnDecal(generatedParts[408], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[408], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[409] then
    pcall(function() SpawnDecal(generatedParts[409], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[409], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[410] then
    pcall(function() SpawnDecal(generatedParts[410], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[410], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[411] then
    pcall(function() SpawnDecal(generatedParts[411], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[411], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[412] then
    pcall(function() SpawnDecal(generatedParts[412], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[412], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[414] then
    pcall(function() SpawnDecal(generatedParts[414], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[414], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[415] then
    pcall(function() SpawnDecal(generatedParts[415], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[415], "183709887", Enum.NormalId.Top) end)
end
if generatedParts[436] then
    pcall(function() AddMesh(generatedParts[436]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[436], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[436], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[436], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[436], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[441] then
    pcall(function() AddMesh(generatedParts[441]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[441], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[441], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[441], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[441], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[443] then
    pcall(function() AddMesh(generatedParts[443]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[443], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[443], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[443], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[443], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[445] then
    pcall(function() AddMesh(generatedParts[445]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[445], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[445], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[445], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[445], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[447] then
    pcall(function() AddMesh(generatedParts[447]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[447], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[447], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[447], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[447], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[453] then
    pcall(function() AddMesh(generatedParts[453]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[453], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[453], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[453], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[453], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[462] then
    pcall(function() SpawnDecal(generatedParts[462], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[462], "15839616470", Enum.NormalId.Top) end)
end
if generatedParts[472] then
    pcall(function() SpawnDecal(generatedParts[472], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[472], "75550574286644", Enum.NormalId.Front) end)
end
if generatedParts[478] then
    pcall(function() AddMesh(generatedParts[478]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[478], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[478], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[478], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[478], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[492] then
    pcall(function() AddMesh(generatedParts[492]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[492], "157957944") end)
    pcall(function() MeshResize(generatedParts[492], Vector3.new(3.028, 3.795, 0.344)) end)
    pcall(function() vect(generatedParts[492], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[493] then
    pcall(function() SpawnDecal(generatedParts[493], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[493], "57029310", Enum.NormalId.Front) end)
end
if generatedParts[498] then
    pcall(function() SpawnDecal(generatedParts[498], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[498], "11370384650", Enum.NormalId.Top) end)
end
if generatedParts[499] then
    pcall(function() SpawnDecal(generatedParts[499], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[499], "11370387949", Enum.NormalId.Top) end)
end
if generatedParts[500] then
    pcall(function() SpawnDecal(generatedParts[500], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[500], "11370377608", Enum.NormalId.Top) end)
end
if generatedParts[501] then
    pcall(function() SpawnDecal(generatedParts[501], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[501], "11370381413", Enum.NormalId.Top) end)
end
if generatedParts[502] then
    pcall(function() SpawnDecal(generatedParts[502], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[502], "11370373575", Enum.NormalId.Top) end)
end
if generatedParts[503] then
    pcall(function() SpawnDecal(generatedParts[503], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[503], "11370387949", Enum.NormalId.Top) end)
end
if generatedParts[504] then
    pcall(function() SpawnDecal(generatedParts[504], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[504], "11370384650", Enum.NormalId.Top) end)
end
if generatedParts[505] then
    pcall(function() SpawnDecal(generatedParts[505], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[505], "11370381413", Enum.NormalId.Top) end)
end
if generatedParts[506] then
    pcall(function() SpawnDecal(generatedParts[506], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[506], "11370377608", Enum.NormalId.Top) end)
end
if generatedParts[507] then
    pcall(function() SpawnDecal(generatedParts[507], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[507], "11370373575", Enum.NormalId.Top) end)
end
if generatedParts[514] then
    pcall(function() SpawnDecal(generatedParts[514], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[514], "11370384650", Enum.NormalId.Top) end)
end
if generatedParts[515] then
    pcall(function() SpawnDecal(generatedParts[515], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[515], "11370387949", Enum.NormalId.Top) end)
end
if generatedParts[516] then
    pcall(function() SpawnDecal(generatedParts[516], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[516], "11370381413", Enum.NormalId.Top) end)
end
if generatedParts[517] then
    pcall(function() SpawnDecal(generatedParts[517], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[517], "11370377608", Enum.NormalId.Top) end)
end
if generatedParts[518] then
    pcall(function() SpawnDecal(generatedParts[518], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[518], "11370373575", Enum.NormalId.Top) end)
end
if generatedParts[528] then
    pcall(function() SpawnDecal(generatedParts[528], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[528], "290658294", Enum.NormalId.Top) end)
end
if generatedParts[529] then
    pcall(function() SpawnDecal(generatedParts[529], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[529], "290658294", Enum.NormalId.Top) end)
end
if generatedParts[531] then
    pcall(function() AddMesh(generatedParts[531]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[531], "97862817026181") end)
    pcall(function() MeshResize(generatedParts[531], Vector3.new(1.980, 1.980, 1.980)) end)
    pcall(function() vect(generatedParts[531], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[534] then
    pcall(function() AddMesh(generatedParts[534]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[534], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[534], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[534], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[534], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[539] then
    pcall(function() SpawnDecal(generatedParts[539], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[539], "74401785079387", Enum.NormalId.Back) end)
end
if generatedParts[541] then
    pcall(function() AddMesh(generatedParts[541]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[541], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[541], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[541], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[541], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[545] then
    pcall(function() AddMesh(generatedParts[545]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[545], "1081088") end)
    pcall(function() MeshResize(generatedParts[545], Vector3.new(2.018, 2.018, 2.018)) end)
    pcall(function() vect(generatedParts[545], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[548] then
    pcall(function() AddMesh(generatedParts[548]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[548], "116436358") end)
    pcall(function() MeshResize(generatedParts[548], Vector3.new(1.939, 1.939, 1.939)) end)
    pcall(function() vect(generatedParts[548], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[549] then
    pcall(function() SpawnDecal(generatedParts[549], Enum.NormalId.Right) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[549], "79660367227190", Enum.NormalId.Right) end)
end
if generatedParts[550] then
    pcall(function() SpawnDecal(generatedParts[550], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[550], "11370384650", Enum.NormalId.Top) end)
end
if generatedParts[551] then
    pcall(function() SpawnDecal(generatedParts[551], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[551], "11370384650", Enum.NormalId.Top) end)
end
if generatedParts[552] then
    pcall(function() SpawnDecal(generatedParts[552], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[552], "11370387949", Enum.NormalId.Top) end)
end
if generatedParts[553] then
    pcall(function() SpawnDecal(generatedParts[553], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[553], "84626262797583", Enum.NormalId.Back) end)
end
if generatedParts[554] then
    pcall(function() SpawnDecal(generatedParts[554], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[554], "11370377608", Enum.NormalId.Top) end)
end
if generatedParts[555] then
    pcall(function() SpawnDecal(generatedParts[555], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[555], "11370381413", Enum.NormalId.Top) end)
end
if generatedParts[556] then
    pcall(function() SpawnDecal(generatedParts[556], Enum.NormalId.Top) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[556], "11370373575", Enum.NormalId.Top) end)
end
if generatedParts[559] then
    pcall(function() SpawnDecal(generatedParts[559], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[559], "73582392390128", Enum.NormalId.Back) end)
end
if generatedParts[560] then
    pcall(function() SpawnDecal(generatedParts[560], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[560], "92432955156178", Enum.NormalId.Back) end)
end
if generatedParts[561] then
    pcall(function() SpawnDecal(generatedParts[561], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[561], "76569694429214", Enum.NormalId.Back) end)
end
if generatedParts[566] then
    pcall(function() AddMesh(generatedParts[566]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[566], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[566], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[566], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[566], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[569] then
    pcall(function() AddMesh(generatedParts[569]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[569], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[569], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[569], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[569], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[571] then
    pcall(function() AddMesh(generatedParts[571]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[571], "6352154013") end)
    pcall(function() MeshResize(generatedParts[571], Vector3.new(0.848, 0.848, 0.848)) end)
    pcall(function() vect(generatedParts[571], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[574] then
    pcall(function() AddMesh(generatedParts[574]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[574], "119679157975172") end)
    pcall(function() MeshResize(generatedParts[574], Vector3.new(0.848, 0.848, 0.848)) end)
    pcall(function() vect(generatedParts[574], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[578] then
    pcall(function() AddMesh(generatedParts[578]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[578], "84809134311466") end)
    pcall(function() MeshResize(generatedParts[578], Vector3.new(0.848, 0.848, 0.848)) end)
    pcall(function() vect(generatedParts[578], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[579] then
    pcall(function() AddMesh(generatedParts[579]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[579], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[579], Vector3.new(1.250, 1.250, 1.250)) end)
end
if generatedParts[581] then
    pcall(function() SpawnDecal(generatedParts[581], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[581], "76773109757449", Enum.NormalId.Back) end)
end
if generatedParts[582] then
    pcall(function() SpawnDecal(generatedParts[582], Enum.NormalId.Back) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[582], "131709207394174", Enum.NormalId.Back) end)
end
if generatedParts[587] then
    pcall(function() AddMesh(generatedParts[587]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[587], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[587], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[587], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[587], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[588] then
    pcall(function() AddMesh(generatedParts[588]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[588], "15172160765") end)
    pcall(function() MeshResize(generatedParts[588], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[588], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[594] then
    pcall(function() AddMesh(generatedParts[594]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[594], "94261097867705") end)
    pcall(function() MeshResize(generatedParts[594], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[594], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[596] then
    pcall(function() AddMesh(generatedParts[596]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[596], "15172160765") end)
    pcall(function() MeshResize(generatedParts[596], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[596], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[599] then
    pcall(function() AddMesh(generatedParts[599]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[599], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[599], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[599], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[599], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[602] then
    pcall(function() AddMesh(generatedParts[602]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[602], "10067421032") end)
    pcall(function() MeshResize(generatedParts[602], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[602], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[604] then
    pcall(function() AddMesh(generatedParts[604]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[604], "3030546036") end)
    pcall(function() MeshResize(generatedParts[604], Vector3.new(1.130, 1.130, 1.130)) end)
    pcall(function() vect(generatedParts[604], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[610] then
    pcall(function() AddMesh(generatedParts[610]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[610], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[610], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[610], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[610], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[611] then
    pcall(function() AddMesh(generatedParts[611]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[611], "3302582015") end)
    pcall(function() MeshResize(generatedParts[611], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[611], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[616] then
    pcall(function() AddMesh(generatedParts[616]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[616], "15172160765") end)
    pcall(function() MeshResize(generatedParts[616], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[616], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[619] then
    pcall(function() AddMesh(generatedParts[619]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[619], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[619], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[619], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[619], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[621] then
    pcall(function() AddMesh(generatedParts[621]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[621], "3164803967") end)
    pcall(function() MeshResize(generatedParts[621], Vector3.new(1.000, 1.000, 1.000)) end)
    pcall(function() vect(generatedParts[621], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[626] then
    pcall(function() AddMesh(generatedParts[626]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[626], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[626], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[626], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[626], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if generatedParts[628] then
    pcall(function() AddMesh(generatedParts[628]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[628], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[628], Vector3.new(1.250, 1.250, 1.250)) end)
    pcall(function() SpawnDecal(generatedParts[628], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[628], "rbxasset://textures/face.png", Enum.NormalId.Front) end)
end
if root then root.Anchored = false end