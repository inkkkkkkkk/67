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
task.spawn(function() pcall(function() generatedParts[1] = CreatePart("Normal", CFrame.new(-310.046, 199.900, 393.039, 0.862, 0.000, -0.507, 0.000, 1.000, 0.000, 0.507, 0.000, 0.862), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[2] = CreatePart("Normal", CFrame.new(-309.742, 201.400, 392.522, 0.862, 0.000, -0.507, 0.000, 1.000, 0.000, 0.507, 0.000, 0.862), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[3] = CreatePart("Normal", CFrame.new(-309.737, 201.400, 392.513, 0.862, 0.000, -0.507, 0.000, 1.000, 0.000, 0.507, 0.000, 0.862), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[4] = CreatePart("Normal", CFrame.new(-310.046, 191.900, 393.039, 0.862, 0.000, -0.507, 0.000, 1.000, 0.000, 0.507, 0.000, 0.862), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[5] = CreatePart("Normal", CFrame.new(-330.412, 200.400, 370.683, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[6] = CreatePart("Normal", CFrame.new(-332.912, 198.900, 366.353, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[7] = CreatePart("Normal", CFrame.new(-327.913, 198.900, 375.013, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[8] = CreatePart("Normal", CFrame.new(-330.412, 206.900, 370.683, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[9] = CreatePart("Normal", CFrame.new(-330.412, 193.900, 370.683, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[10] = CreatePart("Spawn", CFrame.new(-251.009, 176.900, 312.716, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[11] = CreatePart("Spawn", CFrame.new(-268.776, 176.900, 301.044, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[12] = CreatePart("Spawn", CFrame.new(-239.785, 176.900, 330.742, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[13] = CreatePart("Spawn", CFrame.new(-310.406, 176.900, 370.698, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[14] = CreatePart("Spawn", CFrame.new(-322.147, 176.900, 351.776, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[15] = CreatePart("Spawn", CFrame.new(-239.078, 176.900, 352.483, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[16] = CreatePart("Spawn", CFrame.new(-250.302, 176.900, 369.991, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[17] = CreatePart("Spawn", CFrame.new(-321.888, 176.900, 329.258, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[18] = CreatePart("Spawn", CFrame.new(-290.965, 176.900, 379.991, -0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, -0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[19] = CreatePart("Spawn", CFrame.new(-289.999, 176.900, 301.751, 0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, 0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[20] = CreatePart("Spawn", CFrame.new(-308.991, 176.900, 311.301, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[21] = CreatePart("Spawn", CFrame.new(-269.483, 176.900, 382.181, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[22] = CreatePart("Normal", CFrame.new(-280.000, 201.500, 401.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[23] = CreatePart("Normal", CFrame.new(-268.700, 200.000, 401.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[24] = CreatePart("Normal", CFrame.new(-280.000, 208.100, 401.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[25] = CreatePart("Normal", CFrame.new(-291.300, 200.000, 401.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[26] = CreatePart("Normal", CFrame.new(-280.000, 194.900, 401.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[27] = CreatePart("Normal", CFrame.new(-255.381, 198.900, 394.133, 0.864, 0.000, 0.504, 0.000, 1.000, 0.000, -0.504, 0.000, 0.864), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[28] = CreatePart("Normal", CFrame.new(-251.063, 200.400, 391.613, 0.864, 0.000, 0.504, 0.000, 1.000, 0.000, -0.504, 0.000, 0.864), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[29] = CreatePart("Normal", CFrame.new(-251.063, 193.900, 391.613, 0.864, 0.000, 0.504, 0.000, 1.000, 0.000, -0.504, 0.000, 0.864), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[30] = CreatePart("Normal", CFrame.new(-251.063, 206.900, 391.613, 0.864, 0.000, 0.504, 0.000, 1.000, 0.000, -0.504, 0.000, 0.864), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[31] = CreatePart("Normal", CFrame.new(-246.744, 198.900, 389.093, 0.864, 0.000, 0.504, 0.000, 1.000, 0.000, -0.504, 0.000, 0.864), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[32] = CreatePart("Normal", CFrame.new(-318.734, 191.000, 330.621, -0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, -0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[33] = CreatePart("Normal", CFrame.new(-241.266, 191.000, 351.379, 0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, 0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[34] = CreatePart("Normal", CFrame.new(-251.645, 191.000, 312.645, -0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, -0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[35] = CreatePart("Normal", CFrame.new(-269.621, 191.000, 302.266, -0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, -0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[36] = CreatePart("Normal", CFrame.new(-290.379, 191.000, 302.266, -0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, -0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[37] = CreatePart("Normal", CFrame.new(-308.355, 191.000, 312.645, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[38] = CreatePart("Normal", CFrame.new(-318.734, 191.000, 351.379, 0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, 0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[39] = CreatePart("Normal", CFrame.new(-308.355, 191.000, 369.355, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[40] = CreatePart("Normal", CFrame.new(-241.266, 191.000, 330.621, -0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, -0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[41] = CreatePart("Normal", CFrame.new(-269.621, 191.000, 379.734, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[42] = CreatePart("Normal", CFrame.new(-290.379, 191.000, 379.734, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[43] = CreatePart("Normal", CFrame.new(-251.645, 191.000, 369.355, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[44] = CreatePart("Normal", CFrame.new(-251.645, 176.100, 369.355, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[45] = CreatePart("Normal", CFrame.new(-269.621, 176.100, 302.266, -0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, -0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[46] = CreatePart("Normal", CFrame.new(-308.355, 176.100, 312.645, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[47] = CreatePart("Normal", CFrame.new(-290.379, 176.100, 302.266, -0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, -0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[48] = CreatePart("Normal", CFrame.new(-290.379, 176.100, 379.734, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[49] = CreatePart("Normal", CFrame.new(-269.621, 176.100, 379.734, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[50] = CreatePart("Normal", CFrame.new(-241.266, 176.100, 351.379, 0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, 0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[51] = CreatePart("Normal", CFrame.new(-318.734, 176.100, 330.621, -0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, -0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[52] = CreatePart("Normal", CFrame.new(-251.645, 176.100, 312.645, -0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, -0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[53] = CreatePart("Normal", CFrame.new(-241.266, 176.100, 330.621, -0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, -0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[54] = CreatePart("Normal", CFrame.new(-308.355, 176.100, 369.355, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[55] = CreatePart("Normal", CFrame.new(-318.734, 176.100, 351.379, 0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, 0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[56] = CreatePart("Wedge", CFrame.new(-320.000, 169.500, 341.000, 0.000, 0.000, 1.000, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[57] = CreatePart("Wedge", CFrame.new(-260.000, 169.500, 306.359, -0.866, 0.000, -0.500, 0.000, -1.000, 0.000, -0.500, 0.000, 0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[58] = CreatePart("Wedge", CFrame.new(-240.000, 169.500, 341.000, 0.000, 0.000, -1.000, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[59] = CreatePart("Wedge", CFrame.new(-280.000, 169.500, 301.000, -1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[60] = CreatePart("Wedge", CFrame.new(-300.000, 169.500, 375.641, 0.866, 0.000, 0.500, 0.000, -1.000, 0.000, 0.500, 0.000, -0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[61] = CreatePart("Wedge", CFrame.new(-260.000, 169.500, 375.641, 0.866, 0.000, -0.500, 0.000, -1.000, -0.000, -0.500, 0.000, -0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[62] = CreatePart("Wedge", CFrame.new(-314.641, 169.500, 321.000, -0.500, 0.000, 0.866, 0.000, -1.000, 0.000, 0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[63] = CreatePart("Wedge", CFrame.new(-280.000, 169.500, 381.000, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[64] = CreatePart("Wedge", CFrame.new(-300.000, 169.500, 306.359, -0.866, 0.000, 0.500, 0.000, -1.000, 0.000, 0.500, 0.000, 0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[65] = CreatePart("Wedge", CFrame.new(-245.359, 169.500, 321.000, -0.500, 0.000, -0.866, 0.000, -1.000, 0.000, -0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[66] = CreatePart("Wedge", CFrame.new(-245.359, 169.500, 361.000, 0.500, 0.000, -0.866, 0.000, -1.000, -0.000, -0.866, 0.000, -0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[67] = CreatePart("Wedge", CFrame.new(-314.641, 169.500, 361.000, 0.500, 0.000, 0.866, 0.000, -1.000, 0.000, 0.866, 0.000, -0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[68] = CreatePart("Normal", CFrame.new(-300.000, 190.900, 375.641, 0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, 0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[69] = CreatePart("Normal", CFrame.new(-314.641, 190.900, 361.000, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[70] = CreatePart("Normal", CFrame.new(-240.000, 190.900, 341.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[71] = CreatePart("Normal", CFrame.new(-260.000, 190.900, 306.359, -0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, -0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[72] = CreatePart("Normal", CFrame.new(-320.000, 190.900, 341.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[73] = CreatePart("Normal", CFrame.new(-245.359, 190.900, 321.000, -0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, -0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[74] = CreatePart("Normal", CFrame.new(-314.641, 190.900, 321.000, -0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, -0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[75] = CreatePart("Normal", CFrame.new(-280.000, 190.900, 301.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[76] = CreatePart("Normal", CFrame.new(-260.000, 190.900, 375.641, 0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, 0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[77] = CreatePart("Normal", CFrame.new(-300.000, 190.900, 306.359, -0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, -0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[78] = CreatePart("Normal", CFrame.new(-245.359, 190.900, 361.000, 0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[79] = CreatePart("Normal", CFrame.new(-280.000, 190.900, 381.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[80] = CreatePart("Normal", CFrame.new(-288.229, 179.000, 329.674, -0.809, 0.000, -0.588, 0.000, 1.000, 0.000, 0.588, 0.000, -0.809), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[81] = CreatePart("Normal", CFrame.new(-285.694, 189.000, 353.790, 0.914, 0.000, -0.407, 0.000, 1.000, 0.000, 0.407, 0.000, 0.914), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[82] = CreatePart("Normal", CFrame.new(-290.404, 187.000, 350.368, 0.669, 0.000, -0.743, 0.000, 1.000, 0.000, 0.743, 0.000, 0.669), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[83] = CreatePart("Normal", CFrame.new(-273.500, 191.000, 355.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[84] = CreatePart("Normal", CFrame.new(-293.315, 182.000, 336.674, -0.309, 0.000, -0.951, 0.000, 1.000, 0.000, 0.951, 0.000, -0.309), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[85] = CreatePart("Normal", CFrame.new(-292.124, 186.000, 348.000, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[86] = CreatePart("Normal", CFrame.new(-282.911, 177.000, 327.306, -0.978, 0.000, -0.208, 0.000, 1.000, 0.000, 0.208, 0.000, -0.978), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[87] = CreatePart("Normal", CFrame.new(-292.124, 181.000, 334.000, -0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, -0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[88] = CreatePart("Normal", CFrame.new(-285.694, 178.000, 328.210, -0.914, 0.000, -0.407, 0.000, 1.000, 0.000, 0.407, 0.000, -0.914), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[89] = CreatePart("Normal", CFrame.new(-290.404, 180.000, 331.632, -0.669, 0.000, -0.743, 0.000, 1.000, 0.000, 0.743, 0.000, -0.669), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[90] = CreatePart("Normal", CFrame.new(-282.911, 190.000, 354.694, 0.978, 0.000, -0.208, 0.000, 1.000, 0.000, 0.208, 0.000, 0.978), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[91] = CreatePart("Normal", CFrame.new(-288.229, 188.000, 352.326, 0.809, 0.000, -0.588, 0.000, 1.000, 0.000, 0.588, 0.000, 0.809), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[92] = CreatePart("Normal", CFrame.new(-293.923, 183.000, 339.537, -0.105, 0.000, -0.995, 0.000, 1.000, 0.000, 0.995, 0.000, -0.105), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[93] = CreatePart("Normal", CFrame.new(-293.315, 185.000, 345.326, 0.309, 0.000, -0.951, 0.000, 1.000, 0.000, 0.951, 0.000, 0.309), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[94] = CreatePart("Normal", CFrame.new(-293.923, 184.000, 342.463, 0.105, 0.000, -0.995, 0.000, 1.000, 0.000, 0.995, 0.000, 0.105), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[95] = CreatePart("Normal", CFrame.new(-260.000, 176.000, 306.359, -0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, -0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[96] = CreatePart("Normal", CFrame.new(-314.641, 176.000, 321.000, -0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, -0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[97] = CreatePart("Normal", CFrame.new(-280.000, 176.000, 381.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[98] = CreatePart("Normal", CFrame.new(-260.000, 176.000, 375.641, 0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, 0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[99] = CreatePart("Normal", CFrame.new(-245.359, 176.000, 361.000, 0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[100] = CreatePart("Normal", CFrame.new(-320.000, 176.000, 341.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[101] = CreatePart("Normal", CFrame.new(-314.641, 176.000, 361.000, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[102] = CreatePart("Normal", CFrame.new(-280.000, 176.000, 301.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[103] = CreatePart("Normal", CFrame.new(-300.000, 176.000, 375.641, 0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, 0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[104] = CreatePart("Normal", CFrame.new(-245.359, 176.000, 321.000, -0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, -0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[105] = CreatePart("Normal", CFrame.new(-240.000, 176.000, 341.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[106] = CreatePart("Normal", CFrame.new(-300.000, 176.000, 306.359, -0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, -0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[107] = CreatePart("Normal", CFrame.new(-263.824, 183.500, 280.630, -0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, -0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[108] = CreatePart("Normal", CFrame.new(-333.520, 183.500, 371.900, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[109] = CreatePart("Normal", CFrame.new(-296.176, 183.500, 280.630, -0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, -0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[110] = CreatePart("Normal", CFrame.new(-324.194, 183.500, 296.806, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[111] = CreatePart("Normal", CFrame.new(-341.800, 183.500, 341.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[112] = CreatePart("Normal", CFrame.new(-340.370, 183.500, 357.176, 0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, 0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[113] = CreatePart("Normal", CFrame.new(-235.806, 183.500, 296.806, -0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, -0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[114] = CreatePart("Normal", CFrame.new(-340.370, 183.500, 324.824, -0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, -0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[115] = CreatePart("Normal", CFrame.new(-280.000, 183.500, 402.800, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[116] = CreatePart("Normal", CFrame.new(-280.000, 183.500, 279.200, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[117] = CreatePart("Normal", CFrame.new(-219.630, 183.500, 357.176, 0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, 0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[118] = CreatePart("Normal", CFrame.new(-249.100, 183.500, 287.480, -0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, -0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[119] = CreatePart("Normal", CFrame.new(-219.630, 183.500, 324.824, -0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, -0.259), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[120] = CreatePart("Normal", CFrame.new(-310.900, 183.500, 394.520, 0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, 0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[121] = CreatePart("Normal", CFrame.new(-226.480, 183.500, 310.100, -0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, -0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[122] = CreatePart("Normal", CFrame.new(-310.900, 183.500, 287.480, -0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, -0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[123] = CreatePart("Normal", CFrame.new(-333.520, 183.500, 310.100, -0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, -0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[124] = CreatePart("Normal", CFrame.new(-226.480, 183.500, 371.900, 0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[125] = CreatePart("Normal", CFrame.new(-218.200, 183.500, 341.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[126] = CreatePart("Normal", CFrame.new(-296.176, 183.500, 401.370, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[127] = CreatePart("Normal", CFrame.new(-263.824, 183.500, 401.370, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[128] = CreatePart("Normal", CFrame.new(-235.806, 183.500, 385.194, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[129] = CreatePart("Normal", CFrame.new(-249.100, 183.500, 394.520, 0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, 0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[130] = CreatePart("Normal", CFrame.new(-324.194, 183.500, 385.194, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[131] = CreatePart("Normal", CFrame.new(-269.596, 187.000, 331.632, -0.669, 0.000, 0.743, 0.000, 1.000, 0.000, -0.743, 0.000, -0.669), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[132] = CreatePart("Normal", CFrame.new(-274.306, 178.000, 353.790, 0.914, 0.000, 0.407, 0.000, 1.000, 0.000, -0.407, 0.000, 0.914), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[133] = CreatePart("Normal", CFrame.new(-271.771, 188.000, 329.674, -0.809, 0.000, 0.588, 0.000, 1.000, 0.000, -0.588, 0.000, -0.809), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[134] = CreatePart("Normal", CFrame.new(-267.876, 186.000, 334.000, -0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, -0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[135] = CreatePart("Normal", CFrame.new(-266.685, 185.000, 336.674, -0.309, 0.000, 0.951, 0.000, 1.000, 0.000, -0.951, 0.000, -0.309), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[136] = CreatePart("Normal", CFrame.new(-286.500, 191.000, 327.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[137] = CreatePart("Normal", CFrame.new(-266.077, 184.000, 339.537, -0.105, 0.000, 0.995, 0.000, 1.000, 0.000, -0.995, 0.000, -0.105), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[138] = CreatePart("Normal", CFrame.new(-274.306, 189.000, 328.210, -0.914, 0.000, 0.407, 0.000, 1.000, 0.000, -0.407, 0.000, -0.914), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[139] = CreatePart("Normal", CFrame.new(-266.077, 183.000, 342.463, 0.105, 0.000, 0.995, 0.000, 1.000, 0.000, -0.995, 0.000, 0.105), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[140] = CreatePart("Normal", CFrame.new(-277.089, 190.000, 327.306, -0.978, 0.000, 0.208, 0.000, 1.000, 0.000, -0.208, 0.000, -0.978), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[141] = CreatePart("Normal", CFrame.new(-271.771, 179.000, 352.326, 0.809, 0.000, 0.588, 0.000, 1.000, 0.000, -0.588, 0.000, 0.809), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[142] = CreatePart("Normal", CFrame.new(-269.596, 180.000, 350.368, 0.669, 0.000, 0.743, 0.000, 1.000, 0.000, -0.743, 0.000, 0.669), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[143] = CreatePart("Normal", CFrame.new(-267.876, 181.000, 348.000, 0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, 0.500), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[144] = CreatePart("Normal", CFrame.new(-266.685, 182.000, 345.326, 0.309, 0.000, 0.951, 0.000, 1.000, 0.000, -0.951, 0.000, 0.309), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[145] = CreatePart("Normal", CFrame.new(-277.089, 177.000, 354.694, 0.978, 0.000, 0.208, 0.000, 1.000, 0.000, -0.208, 0.000, 0.978), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[146] = CreatePart("Cylinder", CFrame.new(-280.000, 168.100, 341.000, 0.000, 0.000, -1.000, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[147] = CreatePart("Cylinder", CFrame.new(-280.000, 82.000, 341.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[148] = CreatePart("Normal", CFrame.new(-111.500, 44.200, 29.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[149] = CreatePart("Normal", CFrame.new(-51.500, 27.500, -113.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[150] = CreatePart("Normal", CFrame.new(-109.000, 44.200, 44.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[151] = CreatePart("Normal", CFrame.new(-11.500, 44.200, 99.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[152] = CreatePart("Normal", CFrame.new(-31.500, 16.500, 130.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[153] = CreatePart("Normal", CFrame.new(62.000, 44.200, -100.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[154] = CreatePart("Normal", CFrame.new(-94.500, 44.200, 83.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[155] = CreatePart("Normal", CFrame.new(66.500, 38.500, -59.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[156] = CreatePart("Normal", CFrame.new(-94.000, 44.200, 72.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[157] = CreatePart("Normal", CFrame.new(-101.500, 44.200, -51.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[158] = CreatePart("Normal", CFrame.new(24.500, 38.500, 54.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[159] = CreatePart("Normal", CFrame.new(102.500, 38.500, -2.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[160] = CreatePart("Normal", CFrame.new(-1.500, 16.500, 134.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[161] = CreatePart("Normal", CFrame.new(-6.500, 27.500, -126.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[162] = CreatePart("Normal", CFrame.new(-153.500, 16.500, 20.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[163] = CreatePart("Normal", CFrame.new(43.500, 16.500, 121.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[164] = CreatePart("Normal", CFrame.new(-98.000, 27.500, 94.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[165] = CreatePart("Normal", CFrame.new(130.500, 16.500, 3.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[166] = CreatePart("Normal", CFrame.new(-98.500, 38.500, 90.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[167] = CreatePart("Normal", CFrame.new(109.500, 16.500, -71.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[168] = CreatePart("Normal", CFrame.new(-112.500, 44.200, -8.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[169] = CreatePart("Normal", CFrame.new(-111.500, 16.500, -78.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[170] = CreatePart("Normal", CFrame.new(-149.500, 27.500, 16.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[171] = CreatePart("Normal", CFrame.new(51.500, 38.500, -63.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[172] = CreatePart("Normal", CFrame.new(-100.500, 27.500, -77.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[173] = CreatePart("Normal", CFrame.new(4.500, 44.200, 98.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[174] = CreatePart("Normal", CFrame.new(-53.500, 38.500, 101.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[175] = CreatePart("Normal", CFrame.new(51.000, 44.200, 90.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[176] = CreatePart("Normal", CFrame.new(-106.500, 44.200, 75.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[177] = CreatePart("Normal", CFrame.new(69.500, 27.500, -107.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[178] = CreatePart("Normal", CFrame.new(46.500, 27.500, 112.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[179] = CreatePart("Normal", CFrame.new(124.500, 27.500, 0.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[180] = CreatePart("Normal", CFrame.new(-141.500, 27.500, -13.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[181] = CreatePart("Normal", CFrame.new(-61.500, 16.500, 123.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[182] = CreatePart("Normal", CFrame.new(-77.500, 38.500, 70.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[183] = CreatePart("Normal", CFrame.new(-53.500, 38.500, -96.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[184] = CreatePart("Normal", CFrame.new(-70.000, 38.500, -66.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[185] = CreatePart("Normal", CFrame.new(-122.500, 16.500, -67.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[186] = CreatePart("Normal", CFrame.new(96.000, 44.200, 12.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[187] = CreatePart("Normal", CFrame.new(-144.500, 27.500, 31.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[188] = CreatePart("Normal", CFrame.new(-149.500, 16.500, 35.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[189] = CreatePart("Normal", CFrame.new(28.500, 16.500, 125.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[190] = CreatePart("Normal", CFrame.new(-6.500, 44.200, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[191] = CreatePart("Normal", CFrame.new(-133.500, 16.500, -56.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[192] = CreatePart("Normal", CFrame.new(93.500, 44.200, -13.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[193] = CreatePart("Normal", CFrame.new(74.500, 27.500, 94.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[194] = CreatePart("Normal", CFrame.new(-12.500, 16.500, -131.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[195] = CreatePart("Normal", CFrame.new(92.000, 44.200, -28.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[196] = CreatePart("Normal", CFrame.new(-42.500, 16.500, -123.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[197] = CreatePart("Normal", CFrame.new(-36.500, 27.500, -118.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[198] = CreatePart("Normal", CFrame.new(120.500, 16.500, -41.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[199] = CreatePart("Normal", CFrame.new(116.500, 16.500, 48.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[200] = CreatePart("Normal", CFrame.new(-8.500, 38.500, -67.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[201] = CreatePart("Normal", CFrame.new(17.500, 16.500, -133.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[202] = CreatePart("Normal", CFrame.new(-125.500, 16.500, 78.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[203] = CreatePart("Normal", CFrame.new(6.500, 38.500, -69.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[204] = CreatePart("Normal", CFrame.new(64.000, 44.200, 84.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[205] = CreatePart("Normal", CFrame.new(81.500, 16.500, -114.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[206] = CreatePart("Normal", CFrame.new(90.000, 44.200, -43.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[207] = CreatePart("Normal", CFrame.new(-23.500, 38.500, -64.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[208] = CreatePart("Normal", CFrame.new(91.500, 16.500, -101.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[209] = CreatePart("Normal", CFrame.new(-58.500, 27.500, 116.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[210] = CreatePart("Normal", CFrame.new(-102.500, 16.500, 100.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[211] = CreatePart("Normal", CFrame.new(96.500, 38.500, 42.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[212] = CreatePart("Normal", CFrame.new(99.000, 27.500, -74.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[213] = CreatePart("Normal", CFrame.new(79.500, 38.500, -92.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[214] = CreatePart("Normal", CFrame.new(-148.500, 27.500, 1.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[215] = CreatePart("Normal", CFrame.new(1.500, 27.500, 127.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[216] = CreatePart("Normal", CFrame.new(-68.500, 38.500, 97.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[217] = CreatePart("Normal", CFrame.new(-154.500, 16.500, -9.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[218] = CreatePart("Normal", CFrame.new(109.500, 16.500, 63.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[219] = CreatePart("Normal", CFrame.new(89.500, 38.500, 72.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[220] = CreatePart("Normal", CFrame.new(78.500, 38.500, 40.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[221] = CreatePart("Normal", CFrame.new(104.500, 16.500, 78.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[222] = CreatePart("Normal", CFrame.new(39.500, 38.500, 52.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[223] = CreatePart("Normal", CFrame.new(-90.500, 38.500, 2.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[224] = CreatePart("Normal", CFrame.new(-46.500, 16.500, 126.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[225] = CreatePart("Normal", CFrame.new(90.000, 27.500, -89.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[226] = CreatePart("Normal", CFrame.new(108.000, 27.500, 45.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[227] = CreatePart("Normal", CFrame.new(-43.500, 27.500, 122.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[228] = CreatePart("Normal", CFrame.new(115.500, 27.500, -29.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[229] = CreatePart("Normal", CFrame.new(-79.500, 44.200, 88.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[230] = CreatePart("Normal", CFrame.new(-144.500, 16.500, 50.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[231] = CreatePart("Normal", CFrame.new(31.500, 27.500, 117.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[232] = CreatePart("Normal", CFrame.new(119.500, 27.500, -14.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[233] = CreatePart("Normal", CFrame.new(66.500, 16.500, -121.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[234] = CreatePart("Normal", CFrame.new(14.000, 44.200, -110.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[235] = CreatePart("Normal", CFrame.new(36.500, 38.500, -66.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[236] = CreatePart("Normal", CFrame.new(96.500, 27.500, 75.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[237] = CreatePart("Normal", CFrame.new(-67.000, 38.500, -77.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[238] = CreatePart("Normal", CFrame.new(127.500, 16.500, -11.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[239] = CreatePart("Normal", CFrame.new(-135.500, 27.500, -28.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[240] = CreatePart("Normal", CFrame.new(-32.000, 44.200, -104.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[241] = CreatePart("Normal", CFrame.new(-48.500, 44.200, -101.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[242] = CreatePart("Normal", CFrame.new(-126.500, 27.500, -43.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[243] = CreatePart("Normal", CFrame.new(-68.500, 38.500, -92.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[244] = CreatePart("Normal", CFrame.new(-140.500, 27.500, 46.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[245] = CreatePart("Normal", CFrame.new(92.000, 38.500, -47.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[246] = CreatePart("Normal", CFrame.new(-115.000, 27.500, -66.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[247] = CreatePart("Normal", CFrame.new(-38.500, 38.500, 105.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[248] = CreatePart("Normal", CFrame.new(54.500, 38.500, 103.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[249] = CreatePart("Normal", CFrame.new(-91.500, 16.500, 111.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[250] = CreatePart("Normal", CFrame.new(-49.500, 44.200, 94.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[251] = CreatePart("Normal", CFrame.new(-101.500, 44.200, -61.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[252] = CreatePart("Normal", CFrame.new(36.000, 44.200, 93.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[253] = CreatePart("Normal", CFrame.new(24.000, 27.500, -127.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[254] = CreatePart("Normal", CFrame.new(-92.000, 44.200, -67.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[255] = CreatePart("Normal", CFrame.new(-109.000, 44.200, -23.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[256] = CreatePart("Normal", CFrame.new(-112.500, 27.500, 83.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[257] = CreatePart("Normal", CFrame.new(-38.500, 38.500, -99.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[258] = CreatePart("Normal", CFrame.new(-134.500, 27.500, 61.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[259] = CreatePart("Normal", CFrame.new(-34.500, 44.200, 98.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[260] = CreatePart("Normal", CFrame.new(54.500, 27.500, -114.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[261] = CreatePart("Normal", CFrame.new(88.000, 38.500, -62.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[262] = CreatePart("Normal", CFrame.new(96.000, 38.500, -17.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[263] = CreatePart("Normal", CFrame.new(-83.500, 38.500, 94.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[264] = CreatePart("Normal", CFrame.new(115.500, 27.500, 30.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[265] = CreatePart("Normal", CFrame.new(-21.500, 27.500, -122.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[266] = CreatePart("Normal", CFrame.new(75.000, 44.200, 80.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[267] = CreatePart("Normal", CFrame.new(126.500, 16.500, 18.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[268] = CreatePart("Normal", CFrame.new(111.500, 27.500, -44.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[269] = CreatePart("Normal", CFrame.new(-83.500, 38.500, -27.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[270] = CreatePart("Normal", CFrame.new(93.500, 44.200, 23.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[271] = CreatePart("Normal", CFrame.new(-72.500, 16.500, -110.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[272] = CreatePart("Normal", CFrame.new(82.000, 44.200, 68.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[273] = CreatePart("Normal", CFrame.new(-23.500, 38.500, 59.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[274] = CreatePart("Normal", CFrame.new(8.000, 38.500, 57.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[275] = CreatePart("Normal", CFrame.new(-87.500, 16.500, -101.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[276] = CreatePart("Normal", CFrame.new(89.000, 44.200, 38.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[277] = CreatePart("Normal", CFrame.new(121.000, 16.500, 33.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[278] = CreatePart("Normal", CFrame.new(-16.500, 16.500, 133.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[279] = CreatePart("Normal", CFrame.new(-73.500, 27.500, 110.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[280] = CreatePart("Normal", CFrame.new(-138.000, 16.500, -40.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[281] = CreatePart("Normal", CFrame.new(124.500, 16.500, -26.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[282] = CreatePart("Normal", CFrame.new(100.500, 38.500, 27.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[283] = CreatePart("Normal", CFrame.new(58.500, 16.500, 116.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[284] = CreatePart("Normal", CFrame.new(-13.500, 27.500, 130.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[285] = CreatePart("Normal", CFrame.new(86.000, 44.200, -59.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[286] = CreatePart("Normal", CFrame.new(82.500, 16.500, 97.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[287] = CreatePart("Normal", CFrame.new(13.500, 16.500, 130.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[288] = CreatePart("Normal", CFrame.new(16.500, 27.500, 122.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[289] = CreatePart("Normal", CFrame.new(82.000, 44.200, -74.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[290] = CreatePart("Normal", CFrame.new(71.500, 16.500, 105.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[291] = CreatePart("Normal", CFrame.new(-88.500, 38.500, 17.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[292] = CreatePart("Normal", CFrame.new(-23.000, 44.200, 100.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[293] = CreatePart("Normal", CFrame.new(32.500, 16.500, -129.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[294] = CreatePart("Normal", CFrame.new(61.500, 27.500, 104.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[295] = CreatePart("Normal", CFrame.new(-135.000, 16.500, 65.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[296] = CreatePart("Normal", CFrame.new(-27.500, 16.500, -127.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[297] = CreatePart("Normal", CFrame.new(2.500, 16.500, -135.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[298] = CreatePart("Normal", CFrame.new(46.500, 44.200, -104.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[299] = CreatePart("Normal", CFrame.new(-57.500, 16.500, -117.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[300] = CreatePart("Normal", CFrame.new(-3.500, 44.200, -108.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[301] = CreatePart("Normal", CFrame.new(101.500, 27.500, 60.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[302] = CreatePart("Normal", CFrame.new(-95.500, 27.500, -90.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[303] = CreatePart("Normal", CFrame.new(-66.500, 27.500, -107.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[304] = CreatePart("Normal", CFrame.new(8.500, 27.500, -129.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[305] = CreatePart("Normal", CFrame.new(-64.500, 44.200, 90.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[306] = CreatePart("Normal", CFrame.new(-81.500, 27.500, -99.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[307] = CreatePart("Normal", CFrame.new(-114.500, 16.500, 89.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[308] = CreatePart("Normal", CFrame.new(49.500, 16.500, -125.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[309] = CreatePart("Normal", CFrame.new(1.000, 44.200, -93.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[310] = CreatePart("Normal", CFrame.new(21.500, 38.500, -70.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[311] = CreatePart("Normal", CFrame.new(-105.500, 44.200, -38.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[312] = CreatePart("Normal", CFrame.new(-119.500, 27.500, -56.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[313] = CreatePart("Normal", CFrame.new(-76.500, 16.500, 116.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[314] = CreatePart("Normal", CFrame.new(-83.500, 38.500, 47.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[315] = CreatePart("Normal", CFrame.new(60.000, 38.500, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[316] = CreatePart("Normal", CFrame.new(-116.000, 44.200, 2.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[317] = CreatePart("Normal", CFrame.new(84.000, 38.500, -77.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[318] = CreatePart("Normal", CFrame.new(94.000, 38.500, -32.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[319] = CreatePart("Normal", CFrame.new(121.500, 27.500, 15.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[320] = CreatePart("Normal", CFrame.new(39.500, 27.500, -121.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[321] = CreatePart("Normal", CFrame.new(-114.000, 44.200, 13.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[322] = CreatePart("Normal", CFrame.new(-121.500, 27.500, 71.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[323] = CreatePart("Normal", CFrame.new(82.500, 27.500, -104.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[324] = CreatePart("Normal", CFrame.new(-17.000, 44.200, -106.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[325] = CreatePart("Normal", CFrame.new(-107.500, 44.200, 57.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[326] = CreatePart("Normal", CFrame.new(-8.500, 38.500, 58.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[327] = CreatePart("Normal", CFrame.new(116.500, 16.500, -56.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[328] = CreatePart("Normal", CFrame.new(-88.500, 27.500, 105.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[329] = CreatePart("Normal", CFrame.new(85.500, 27.500, 84.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[330] = CreatePart("Normal", CFrame.new(93.000, 38.500, 57.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[331] = CreatePart("Normal", CFrame.new(-147.500, 16.500, -24.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[332] = CreatePart("Normal", CFrame.new(31.500, 44.200, -107.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[333] = CreatePart("Normal", CFrame.new(-80.000, 38.500, -42.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[334] = CreatePart("Normal", CFrame.new(20.500, 44.200, 95.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[335] = CreatePart("Normal", CFrame.new(-87.000, 38.500, -12.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[336] = CreatePart("Normal", CFrame.new(-73.500, 38.500, 79.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[337] = CreatePart("Normal", CFrame.new(-28.500, 27.500, 128.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[338] = CreatePart("Normal", CFrame.new(85.500, 44.200, 53.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[339] = CreatePart("Normal", CFrame.new(-82.000, 38.500, 60.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[340] = CreatePart("Normal", CFrame.new(-103.000, 44.200, 66.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[341] = CreatePart("Normal", CFrame.new(95.000, 44.200, 1.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[342] = CreatePart("Normal", CFrame.new(93.500, 16.500, 87.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[343] = CreatePart("Normal", CFrame.new(103.500, 38.500, 12.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[344] = CreatePart("Normal", CFrame.new(100.500, 16.500, -86.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[345] = CreatePart("Normal", CFrame.new(77.000, 44.200, -89.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[346] = CreatePart("Normal", CFrame.new(-76.000, 38.500, -55.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[347] = CreatePart("Normal", CFrame.new(106.500, 27.500, -59.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[348] = CreatePart("Normal", CFrame.new(-159.500, 16.500, 5.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[349] = CreatePart("Normal", CFrame.new(-83.500, 38.500, -88.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[350] = CreatePart("Normal", CFrame.new(-100.500, 16.500, -91.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[351] = CreatePart("Normal", CFrame.new(-86.000, 38.500, 32.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[352] = CreatePart("Ball", CFrame.new(-335.113, 200.548, 339.681, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[353] = CreatePart("Cylinder", CFrame.new(-333.324, 191.700, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[354] = CreatePart("Cylinder", CFrame.new(-336.603, 196.349, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[355] = CreatePart("Cylinder", CFrame.new(-333.324, 196.349, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[356] = CreatePart("Normal", CFrame.new(-334.964, 191.701, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[357] = CreatePart("Normal", CFrame.new(-334.964, 195.599, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[358] = CreatePart("Cylinder", CFrame.new(-333.324, 193.650, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[359] = CreatePart("Cylinder", CFrame.new(-333.324, 195.599, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[360] = CreatePart("Ball", CFrame.new(-333.324, 195.899, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[361] = CreatePart("Ball", CFrame.new(-336.603, 195.899, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[362] = CreatePart("Cylinder", CFrame.new(-336.603, 191.700, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[363] = CreatePart("Cylinder", CFrame.new(-336.603, 195.599, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[364] = CreatePart("Cylinder", CFrame.new(-336.603, 193.650, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[365] = CreatePart("Cylinder", CFrame.new(-339.434, 196.799, 343.405, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[366] = CreatePart("Cylinder", CFrame.new(-338.689, 194.400, 343.405, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[367] = CreatePart("Ball", CFrame.new(-339.434, 194.400, 343.405, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[368] = CreatePart("Ball", CFrame.new(-339.435, 195.899, 340.425, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[369] = CreatePart("Cylinder", CFrame.new(-338.689, 195.899, 340.425, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[370] = CreatePart("Cylinder", CFrame.new(-339.435, 198.299, 340.425, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[371] = CreatePart("Normal", CFrame.new(-333.175, 194.400, 332.877, -0.865, -0.002, -0.502, -0.435, 0.501, 0.748, 0.250, 0.865, -0.435), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[372] = CreatePart("Normal", CFrame.new(-333.175, 194.400, 335.457, -0.865, 0.002, -0.502, 0.435, 0.501, -0.748, 0.250, -0.865, -0.435), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[373] = CreatePart("Normal", CFrame.new(-333.175, 195.899, 335.457, 0.865, 0.002, -0.502, -0.435, 0.501, -0.748, 0.250, 0.865, 0.435), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[374] = CreatePart("Normal", CFrame.new(-333.175, 196.448, 333.421, 0.866, -0.002, -0.501, 0.252, 0.867, 0.431, 0.433, -0.499, 0.751), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[375] = CreatePart("Normal", CFrame.new(-333.175, 195.150, 335.657, -0.865, -0.000, -0.502, 0.502, -0.000, -0.865, -0.000, -1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[376] = CreatePart("Normal", CFrame.new(-333.175, 193.650, 334.166, -0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, -0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[377] = CreatePart("Normal", CFrame.new(-333.175, 196.448, 334.911, 0.866, 0.002, -0.501, -0.252, 0.867, -0.431, 0.433, 0.499, 0.751), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[378] = CreatePart("Normal", CFrame.new(-333.175, 193.851, 334.911, -0.866, 0.002, -0.501, 0.252, 0.867, -0.431, 0.433, -0.499, -0.751), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[379] = CreatePart("Normal", CFrame.new(-333.175, 195.150, 332.677, 0.865, -0.000, -0.502, 0.502, 0.000, 0.865, 0.000, -1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[380] = CreatePart("Normal", CFrame.new(-333.175, 196.649, 334.166, 0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, 0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[381] = CreatePart("Normal", CFrame.new(-333.175, 195.899, 332.877, 0.865, -0.002, -0.502, 0.435, 0.501, 0.748, 0.250, -0.865, 0.435), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[382] = CreatePart("Normal", CFrame.new(-333.175, 193.851, 333.421, -0.866, -0.002, -0.501, -0.252, 0.867, 0.431, 0.433, 0.499, -0.751), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[383] = CreatePart("Normal", CFrame.new(-337.347, 193.650, 334.166, -0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, -0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[384] = CreatePart("Normal", CFrame.new(-337.347, 196.649, 334.166, 0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, 0.866), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[385] = CreatePart("Normal", CFrame.new(-337.347, 196.448, 334.911, 0.866, 0.002, -0.501, -0.252, 0.867, -0.431, 0.433, 0.499, 0.751), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[386] = CreatePart("Normal", CFrame.new(-337.347, 195.899, 335.458, 0.865, 0.002, -0.502, -0.435, 0.501, -0.748, 0.250, 0.865, 0.435), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[387] = CreatePart("Normal", CFrame.new(-337.347, 195.150, 332.677, 0.865, -0.000, -0.502, 0.502, 0.000, 0.865, 0.000, -1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[388] = CreatePart("Normal", CFrame.new(-337.347, 194.400, 332.877, -0.865, -0.002, -0.502, -0.435, 0.501, 0.748, 0.250, 0.865, -0.435), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[389] = CreatePart("Normal", CFrame.new(-337.347, 195.150, 335.657, -0.865, -0.000, -0.502, 0.502, -0.000, -0.865, -0.000, -1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[390] = CreatePart("Normal", CFrame.new(-337.347, 194.400, 335.458, -0.865, 0.002, -0.502, 0.435, 0.501, -0.748, 0.250, -0.865, -0.435), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[391] = CreatePart("Normal", CFrame.new(-337.347, 195.899, 332.877, 0.865, -0.002, -0.502, 0.435, 0.501, 0.748, 0.250, -0.865, 0.435), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[392] = CreatePart("Normal", CFrame.new(-337.347, 193.851, 334.911, -0.866, 0.002, -0.501, 0.252, 0.867, -0.431, 0.433, -0.499, -0.751), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[393] = CreatePart("Normal", CFrame.new(-337.347, 193.851, 333.421, -0.866, -0.002, -0.501, -0.252, 0.867, 0.431, 0.433, 0.499, -0.751), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[394] = CreatePart("Normal", CFrame.new(-337.347, 196.448, 333.421, 0.866, -0.002, -0.501, 0.252, 0.867, 0.431, 0.433, -0.499, 0.751), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[395] = CreatePart("Cylinder", CFrame.new(-335.262, 195.150, 334.166, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000, 0.000, -1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[396] = CreatePart("Cylinder", CFrame.new(-335.262, 195.150, 334.166, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000, 0.000, -1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[397] = CreatePart("Wedge", CFrame.new(-335.113, 191.851, 335.210, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[398] = CreatePart("Wedge", CFrame.new(-335.113, 198.149, 336.701, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[399] = CreatePart("Normal", CFrame.new(-335.113, 192.150, 341.171, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[400] = CreatePart("Ball", CFrame.new(-333.324, 197.099, 344.598, 0.000, 0.000, -1.000, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[401] = CreatePart("Normal", CFrame.new(-335.113, 194.850, 341.171, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[402] = CreatePart("Cylinder", CFrame.new(-335.113, 195.150, 334.166, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000, 0.000, -1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[403] = CreatePart("Cylinder", CFrame.new(-333.323, 196.949, 342.511, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[404] = CreatePart("Ball", CFrame.new(-336.603, 197.099, 344.598, 0.000, 0.000, -1.000, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[405] = CreatePart("Cylinder", CFrame.new(-336.603, 196.949, 342.511, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[406] = CreatePart("Wedge", CFrame.new(-335.113, 197.249, 344.916, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[407] = CreatePart("Normal", CFrame.new(-330.501, 195.543, 341.171, 0.000, -0.779, 0.627, 0.000, 0.627, 0.779, -1.000, -0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[408] = CreatePart("Wedge", CFrame.new(-335.113, 192.450, 335.508, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000, 0.000, -1.000, -0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[409] = CreatePart("Wedge", CFrame.new(-335.113, 197.999, 336.253, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[410] = CreatePart("Wedge", CFrame.new(-330.642, 195.400, 341.171, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[411] = CreatePart("Wedge", CFrame.new(-335.113, 192.150, 335.806, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[412] = CreatePart("Normal", CFrame.new(-330.572, 195.535, 341.171, 0.779, 0.627, 0.000, -0.627, 0.779, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[413] = CreatePart("Normal", CFrame.new(-335.113, 197.249, 340.475, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[414] = CreatePart("Normal", CFrame.new(-330.642, 192.900, 341.171, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[415] = CreatePart("Normal", CFrame.new(-330.344, 192.150, 341.171, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[416] = CreatePart("Cylinder", CFrame.new(-335.113, 197.849, 339.681, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[417] = CreatePart("Normal", CFrame.new(0.000, 5.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
task.spawn(function() pcall(function() generatedParts[418] = CreatePart("Normal", CFrame.new(-2.120, 15.483, -1.461, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), workspace) end) end)
local maxWait = 3.0
local start = os.clock()
while os.clock() - start < maxWait do
    local completed = true
    for i = 1, 418 do
        if not generatedParts[i] then completed = false break end
    end
    if completed then break end
    task.wait(0.05)
end
if generatedParts[1] then
    table.insert(resizes, {['Part'] = generatedParts[1], ['CFrame'] = (origin + offset) * CFrame.new(-310.046, 199.900, 393.039, 0.862, 0.000, -0.507, 0.000, 1.000, 0.000, 0.507, 0.000, 0.862), ['Size'] = Vector3.new(13.000, 17.000, 1.200)})
    table.insert(colors, {['Part'] = generatedParts[1], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[1], ['Material'] = Enum.Material.Brick, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[1], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[1], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[1], ['Name'] = "Backing"})
end
if generatedParts[2] then
    table.insert(resizes, {['Part'] = generatedParts[2], ['CFrame'] = (origin + offset) * CFrame.new(-309.742, 201.400, 392.522, 0.862, 0.000, -0.507, 0.000, 1.000, 0.000, 0.507, 0.000, 0.862), ['Size'] = Vector3.new(11.000, 12.000, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[2], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[2], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[2], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[2], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[2], ['Name'] = "Whiteboard"})
end
if generatedParts[3] then
    table.insert(resizes, {['Part'] = generatedParts[3], ['CFrame'] = (origin + offset) * CFrame.new(-309.737, 201.400, 392.513, 0.862, 0.000, -0.507, 0.000, 1.000, 0.000, 0.507, 0.000, 0.862), ['Size'] = Vector3.new(11.000, 12.000, 0.200)})
    table.insert(colors, {['Part'] = generatedParts[3], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[3], ['Material'] = Enum.Material.Slate, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[3], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[3], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[3], ['Name'] = "Board"})
end
if generatedParts[4] then
    table.insert(resizes, {['Part'] = generatedParts[4], ['CFrame'] = (origin + offset) * CFrame.new(-310.046, 191.900, 393.039, 0.862, 0.000, -0.507, 0.000, 1.000, 0.000, 0.507, 0.000, 0.862), ['Size'] = Vector3.new(13.800, 1.000, 2.000)})
    table.insert(colors, {['Part'] = generatedParts[4], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[4], ['Material'] = Enum.Material.Brick, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[4], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[4], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[4], ['Name'] = "Base"})
end
if generatedParts[5] then
    table.insert(resizes, {['Part'] = generatedParts[5], ['CFrame'] = (origin + offset) * CFrame.new(-330.412, 200.400, 370.683, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), ['Size'] = Vector3.new(9.000, 12.000, 0.600)})
    table.insert(colors, {['Part'] = generatedParts[5], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[5], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[5], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[5], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[5], ['Name'] = "Board"})
end
if generatedParts[6] then
    table.insert(resizes, {['Part'] = generatedParts[6], ['CFrame'] = (origin + offset) * CFrame.new(-332.912, 198.900, 366.353, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), ['Size'] = Vector3.new(1.000, 15.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[6], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[6], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[6], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[6], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[6], ['Name'] = "Part"})
end
if generatedParts[7] then
    table.insert(resizes, {['Part'] = generatedParts[7], ['CFrame'] = (origin + offset) * CFrame.new(-327.913, 198.900, 375.013, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), ['Size'] = Vector3.new(1.000, 15.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[7], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[7], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[7], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[7], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[7], ['Name'] = "Part"})
end
if generatedParts[8] then
    table.insert(resizes, {['Part'] = generatedParts[8], ['CFrame'] = (origin + offset) * CFrame.new(-330.412, 206.900, 370.683, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), ['Size'] = Vector3.new(11.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[8], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[8], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[8], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[8], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[8], ['Name'] = "Part"})
end
if generatedParts[9] then
    table.insert(resizes, {['Part'] = generatedParts[9], ['CFrame'] = (origin + offset) * CFrame.new(-330.412, 193.900, 370.683, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), ['Size'] = Vector3.new(9.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[9], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[9], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[9], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[9], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[9], ['Name'] = "Part"})
end
if generatedParts[10] then
    table.insert(resizes, {['Part'] = generatedParts[10], ['CFrame'] = (origin + offset) * CFrame.new(-251.009, 176.900, 312.716, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[10], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[10], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[10], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[10], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[10], ['Name'] = "SpawnLocation"})
end
if generatedParts[11] then
    table.insert(resizes, {['Part'] = generatedParts[11], ['CFrame'] = (origin + offset) * CFrame.new(-268.776, 176.900, 301.044, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[11], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[11], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[11], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[11], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[11], ['Name'] = "SpawnLocation"})
end
if generatedParts[12] then
    table.insert(resizes, {['Part'] = generatedParts[12], ['CFrame'] = (origin + offset) * CFrame.new(-239.785, 176.900, 330.742, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[12], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[12], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[12], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[12], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[12], ['Name'] = "SpawnLocation"})
end
if generatedParts[13] then
    table.insert(resizes, {['Part'] = generatedParts[13], ['CFrame'] = (origin + offset) * CFrame.new(-310.406, 176.900, 370.698, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[13], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[13], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[13], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[13], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[13], ['Name'] = "SpawnLocation"})
end
if generatedParts[14] then
    table.insert(resizes, {['Part'] = generatedParts[14], ['CFrame'] = (origin + offset) * CFrame.new(-322.147, 176.900, 351.776, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[14], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[14], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[14], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[14], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[14], ['Name'] = "SpawnLocation"})
end
if generatedParts[15] then
    table.insert(resizes, {['Part'] = generatedParts[15], ['CFrame'] = (origin + offset) * CFrame.new(-239.078, 176.900, 352.483, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[15], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[15], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[15], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[15], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[15], ['Name'] = "SpawnLocation"})
end
if generatedParts[16] then
    table.insert(resizes, {['Part'] = generatedParts[16], ['CFrame'] = (origin + offset) * CFrame.new(-250.302, 176.900, 369.991, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[16], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[16], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[16], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[16], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[16], ['Name'] = "SpawnLocation"})
end
if generatedParts[17] then
    table.insert(resizes, {['Part'] = generatedParts[17], ['CFrame'] = (origin + offset) * CFrame.new(-321.888, 176.900, 329.258, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[17], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[17], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[17], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[17], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[17], ['Name'] = "SpawnLocation"})
end
if generatedParts[18] then
    table.insert(resizes, {['Part'] = generatedParts[18], ['CFrame'] = (origin + offset) * CFrame.new(-290.965, 176.900, 379.991, -0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, -0.966), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[18], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[18], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[18], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[18], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[18], ['Name'] = "SpawnLocation"})
end
if generatedParts[19] then
    table.insert(resizes, {['Part'] = generatedParts[19], ['CFrame'] = (origin + offset) * CFrame.new(-289.999, 176.900, 301.751, 0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, 0.259), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[19], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[19], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[19], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[19], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[19], ['Name'] = "SpawnLocation"})
end
if generatedParts[20] then
    table.insert(resizes, {['Part'] = generatedParts[20], ['CFrame'] = (origin + offset) * CFrame.new(-308.991, 176.900, 311.301, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[20], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[20], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[20], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[20], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[20], ['Name'] = "SpawnLocation"})
end
if generatedParts[21] then
    table.insert(resizes, {['Part'] = generatedParts[21], ['CFrame'] = (origin + offset) * CFrame.new(-269.483, 176.900, 382.181, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), ['Size'] = Vector3.new(6.000, 1.200, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[21], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[21], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[21], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[21], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[21], ['Name'] = "SpawnLocation"})
end
if generatedParts[22] then
    table.insert(resizes, {['Part'] = generatedParts[22], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 201.500, 401.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(21.600, 12.200, 0.600)})
    table.insert(colors, {['Part'] = generatedParts[22], ['Color'] = Color3.new(0.290, 0.322, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[22], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[22], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[22], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[22], ['Name'] = "Board1"})
end
if generatedParts[23] then
    table.insert(resizes, {['Part'] = generatedParts[23], ['CFrame'] = (origin + offset) * CFrame.new(-268.700, 200.000, 401.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 17.200, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[23], ['Color'] = Color3.new(0.949, 0.953, 0.953), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[23], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[23], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[23], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[23], ['Name'] = "Smooth Block Model"})
end
if generatedParts[24] then
    table.insert(resizes, {['Part'] = generatedParts[24], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 208.100, 401.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(21.600, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[24], ['Color'] = Color3.new(0.949, 0.953, 0.953), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[24], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[24], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[24], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[24], ['Name'] = "Smooth Block Model"})
end
if generatedParts[25] then
    table.insert(resizes, {['Part'] = generatedParts[25], ['CFrame'] = (origin + offset) * CFrame.new(-291.300, 200.000, 401.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(1.000, 17.200, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[25], ['Color'] = Color3.new(0.949, 0.953, 0.953), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[25], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[25], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[25], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[25], ['Name'] = "Smooth Block Model"})
end
if generatedParts[26] then
    table.insert(resizes, {['Part'] = generatedParts[26], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 194.900, 401.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(21.600, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[26], ['Color'] = Color3.new(0.949, 0.953, 0.953), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[26], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[26], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[26], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[26], ['Name'] = "Smooth Block Model"})
end
if generatedParts[27] then
    table.insert(resizes, {['Part'] = generatedParts[27], ['CFrame'] = (origin + offset) * CFrame.new(-255.381, 198.900, 394.133, 0.864, 0.000, 0.504, 0.000, 1.000, 0.000, -0.504, 0.000, 0.864), ['Size'] = Vector3.new(1.000, 15.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[27], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[27], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[27], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[27], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[27], ['Name'] = "Part"})
end
if generatedParts[28] then
    table.insert(resizes, {['Part'] = generatedParts[28], ['CFrame'] = (origin + offset) * CFrame.new(-251.063, 200.400, 391.613, 0.864, 0.000, 0.504, 0.000, 1.000, 0.000, -0.504, 0.000, 0.864), ['Size'] = Vector3.new(9.000, 12.000, 0.600)})
    table.insert(colors, {['Part'] = generatedParts[28], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[28], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[28], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[28], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[28], ['Name'] = "Board"})
end
if generatedParts[29] then
    table.insert(resizes, {['Part'] = generatedParts[29], ['CFrame'] = (origin + offset) * CFrame.new(-251.063, 193.900, 391.613, 0.864, 0.000, 0.504, 0.000, 1.000, 0.000, -0.504, 0.000, 0.864), ['Size'] = Vector3.new(9.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[29], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[29], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[29], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[29], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[29], ['Name'] = "Part"})
end
if generatedParts[30] then
    table.insert(resizes, {['Part'] = generatedParts[30], ['CFrame'] = (origin + offset) * CFrame.new(-251.063, 206.900, 391.613, 0.864, 0.000, 0.504, 0.000, 1.000, 0.000, -0.504, 0.000, 0.864), ['Size'] = Vector3.new(11.000, 1.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[30], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[30], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[30], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[30], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[30], ['Name'] = "Part"})
end
if generatedParts[31] then
    table.insert(resizes, {['Part'] = generatedParts[31], ['CFrame'] = (origin + offset) * CFrame.new(-246.744, 198.900, 389.093, 0.864, 0.000, 0.504, 0.000, 1.000, 0.000, -0.504, 0.000, 0.864), ['Size'] = Vector3.new(1.000, 15.000, 1.000)})
    table.insert(colors, {['Part'] = generatedParts[31], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[31], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[31], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[31], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[31], ['Name'] = "Part"})
end
if generatedParts[32] then
    table.insert(resizes, {['Part'] = generatedParts[32], ['CFrame'] = (origin + offset) * CFrame.new(-318.734, 191.000, 330.621, -0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, -0.259), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[32], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[32], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[32], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[32], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[32], ['Name'] = "PlatformPart"})
end
if generatedParts[33] then
    table.insert(resizes, {['Part'] = generatedParts[33], ['CFrame'] = (origin + offset) * CFrame.new(-241.266, 191.000, 351.379, 0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, 0.259), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[33], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[33], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[33], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[33], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[33], ['Name'] = "PlatformPart"})
end
if generatedParts[34] then
    table.insert(resizes, {['Part'] = generatedParts[34], ['CFrame'] = (origin + offset) * CFrame.new(-251.645, 191.000, 312.645, -0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, -0.707), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[34], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[34], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[34], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[34], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[34], ['Name'] = "PlatformPart"})
end
if generatedParts[35] then
    table.insert(resizes, {['Part'] = generatedParts[35], ['CFrame'] = (origin + offset) * CFrame.new(-269.621, 191.000, 302.266, -0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, -0.966), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[35], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[35], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[35], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[35], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[35], ['Name'] = "PlatformPart"})
end
if generatedParts[36] then
    table.insert(resizes, {['Part'] = generatedParts[36], ['CFrame'] = (origin + offset) * CFrame.new(-290.379, 191.000, 302.266, -0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, -0.966), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[36], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[36], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[36], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[36], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[36], ['Name'] = "PlatformPart"})
end
if generatedParts[37] then
    table.insert(resizes, {['Part'] = generatedParts[37], ['CFrame'] = (origin + offset) * CFrame.new(-308.355, 191.000, 312.645, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[37], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[37], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[37], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[37], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[37], ['Name'] = "PlatformPart"})
end
if generatedParts[38] then
    table.insert(resizes, {['Part'] = generatedParts[38], ['CFrame'] = (origin + offset) * CFrame.new(-318.734, 191.000, 351.379, 0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, 0.259), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[38], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[38], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[38], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[38], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[38], ['Name'] = "PlatformPart"})
end
if generatedParts[39] then
    table.insert(resizes, {['Part'] = generatedParts[39], ['CFrame'] = (origin + offset) * CFrame.new(-308.355, 191.000, 369.355, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[39], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[39], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[39], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[39], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[39], ['Name'] = "PlatformPart"})
end
if generatedParts[40] then
    table.insert(resizes, {['Part'] = generatedParts[40], ['CFrame'] = (origin + offset) * CFrame.new(-241.266, 191.000, 330.621, -0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, -0.259), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[40], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[40], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[40], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[40], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[40], ['Name'] = "PlatformPart"})
end
if generatedParts[41] then
    table.insert(resizes, {['Part'] = generatedParts[41], ['CFrame'] = (origin + offset) * CFrame.new(-269.621, 191.000, 379.734, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[41], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[41], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[41], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[41], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[41], ['Name'] = "PlatformPart"})
end
if generatedParts[42] then
    table.insert(resizes, {['Part'] = generatedParts[42], ['CFrame'] = (origin + offset) * CFrame.new(-290.379, 191.000, 379.734, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[42], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[42], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[42], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[42], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[42], ['Name'] = "PlatformPart"})
end
if generatedParts[43] then
    table.insert(resizes, {['Part'] = generatedParts[43], ['CFrame'] = (origin + offset) * CFrame.new(-251.645, 191.000, 369.355, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[43], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[43], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[43], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[43], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[43], ['Name'] = "PlatformPart"})
end
if generatedParts[44] then
    table.insert(resizes, {['Part'] = generatedParts[44], ['CFrame'] = (origin + offset) * CFrame.new(-251.645, 176.100, 369.355, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[44], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[44], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[44], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[44], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[44], ['Name'] = "PlatformPart"})
end
if generatedParts[45] then
    table.insert(resizes, {['Part'] = generatedParts[45], ['CFrame'] = (origin + offset) * CFrame.new(-269.621, 176.100, 302.266, -0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, -0.966), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[45], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[45], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[45], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[45], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[45], ['Name'] = "PlatformPart"})
end
if generatedParts[46] then
    table.insert(resizes, {['Part'] = generatedParts[46], ['CFrame'] = (origin + offset) * CFrame.new(-308.355, 176.100, 312.645, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[46], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[46], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[46], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[46], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[46], ['Name'] = "PlatformPart"})
end
if generatedParts[47] then
    table.insert(resizes, {['Part'] = generatedParts[47], ['CFrame'] = (origin + offset) * CFrame.new(-290.379, 176.100, 302.266, -0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, -0.966), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[47], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[47], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[47], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[47], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[47], ['Name'] = "PlatformPart"})
end
if generatedParts[48] then
    table.insert(resizes, {['Part'] = generatedParts[48], ['CFrame'] = (origin + offset) * CFrame.new(-290.379, 176.100, 379.734, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[48], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[48], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[48], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[48], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[48], ['Name'] = "PlatformPart"})
end
if generatedParts[49] then
    table.insert(resizes, {['Part'] = generatedParts[49], ['CFrame'] = (origin + offset) * CFrame.new(-269.621, 176.100, 379.734, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[49], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[49], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[49], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[49], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[49], ['Name'] = "PlatformPart"})
end
if generatedParts[50] then
    table.insert(resizes, {['Part'] = generatedParts[50], ['CFrame'] = (origin + offset) * CFrame.new(-241.266, 176.100, 351.379, 0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, 0.259), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[50], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[50], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[50], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[50], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[50], ['Name'] = "PlatformPart"})
end
if generatedParts[51] then
    table.insert(resizes, {['Part'] = generatedParts[51], ['CFrame'] = (origin + offset) * CFrame.new(-318.734, 176.100, 330.621, -0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, -0.259), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[51], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[51], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[51], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[51], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[51], ['Name'] = "PlatformPart"})
end
if generatedParts[52] then
    table.insert(resizes, {['Part'] = generatedParts[52], ['CFrame'] = (origin + offset) * CFrame.new(-251.645, 176.100, 312.645, -0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, -0.707), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[52], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[52], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[52], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[52], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[52], ['Name'] = "PlatformPart"})
end
if generatedParts[53] then
    table.insert(resizes, {['Part'] = generatedParts[53], ['CFrame'] = (origin + offset) * CFrame.new(-241.266, 176.100, 330.621, -0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, -0.259), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[53], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[53], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[53], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[53], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[53], ['Name'] = "PlatformPart"})
end
if generatedParts[54] then
    table.insert(resizes, {['Part'] = generatedParts[54], ['CFrame'] = (origin + offset) * CFrame.new(-308.355, 176.100, 369.355, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[54], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[54], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[54], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[54], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[54], ['Name'] = "PlatformPart"})
end
if generatedParts[55] then
    table.insert(resizes, {['Part'] = generatedParts[55], ['CFrame'] = (origin + offset) * CFrame.new(-318.734, 176.100, 351.379, 0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, 0.259), ['Size'] = Vector3.new(11.000, 1.000, 45.200)})
    table.insert(colors, {['Part'] = generatedParts[55], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[55], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[55], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[55], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[55], ['Name'] = "PlatformPart"})
end
if generatedParts[56] then
    table.insert(resizes, {['Part'] = generatedParts[56], ['CFrame'] = (origin + offset) * CFrame.new(-320.000, 169.500, 341.000, 0.000, 0.000, 1.000, 0.000, -1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[56], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[56], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[56], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[56], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[56], ['Name'] = "BottomWedge"})
end
if generatedParts[57] then
    table.insert(resizes, {['Part'] = generatedParts[57], ['CFrame'] = (origin + offset) * CFrame.new(-260.000, 169.500, 306.359, -0.866, 0.000, -0.500, 0.000, -1.000, 0.000, -0.500, 0.000, 0.866), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[57], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[57], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[57], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[57], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[57], ['Name'] = "BottomWedge"})
end
if generatedParts[58] then
    table.insert(resizes, {['Part'] = generatedParts[58], ['CFrame'] = (origin + offset) * CFrame.new(-240.000, 169.500, 341.000, 0.000, 0.000, -1.000, 0.000, -1.000, -0.000, -1.000, 0.000, -0.000), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[58], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[58], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[58], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[58], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[58], ['Name'] = "BottomWedge"})
end
if generatedParts[59] then
    table.insert(resizes, {['Part'] = generatedParts[59], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 169.500, 301.000, -1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[59], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[59], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[59], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[59], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[59], ['Name'] = "BottomWedge"})
end
if generatedParts[60] then
    table.insert(resizes, {['Part'] = generatedParts[60], ['CFrame'] = (origin + offset) * CFrame.new(-300.000, 169.500, 375.641, 0.866, 0.000, 0.500, 0.000, -1.000, 0.000, 0.500, 0.000, -0.866), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[60], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[60], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[60], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[60], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[60], ['Name'] = "BottomWedge"})
end
if generatedParts[61] then
    table.insert(resizes, {['Part'] = generatedParts[61], ['CFrame'] = (origin + offset) * CFrame.new(-260.000, 169.500, 375.641, 0.866, 0.000, -0.500, 0.000, -1.000, -0.000, -0.500, 0.000, -0.866), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[61], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[61], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[61], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[61], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[61], ['Name'] = "BottomWedge"})
end
if generatedParts[62] then
    table.insert(resizes, {['Part'] = generatedParts[62], ['CFrame'] = (origin + offset) * CFrame.new(-314.641, 169.500, 321.000, -0.500, 0.000, 0.866, 0.000, -1.000, 0.000, 0.866, 0.000, 0.500), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[62], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[62], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[62], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[62], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[62], ['Name'] = "BottomWedge"})
end
if generatedParts[63] then
    table.insert(resizes, {['Part'] = generatedParts[63], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 169.500, 381.000, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[63], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[63], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[63], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[63], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[63], ['Name'] = "BottomWedge"})
end
if generatedParts[64] then
    table.insert(resizes, {['Part'] = generatedParts[64], ['CFrame'] = (origin + offset) * CFrame.new(-300.000, 169.500, 306.359, -0.866, 0.000, 0.500, 0.000, -1.000, 0.000, 0.500, 0.000, 0.866), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[64], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[64], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[64], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[64], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[64], ['Name'] = "BottomWedge"})
end
if generatedParts[65] then
    table.insert(resizes, {['Part'] = generatedParts[65], ['CFrame'] = (origin + offset) * CFrame.new(-245.359, 169.500, 321.000, -0.500, 0.000, -0.866, 0.000, -1.000, 0.000, -0.866, 0.000, 0.500), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[65], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[65], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[65], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[65], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[65], ['Name'] = "BottomWedge"})
end
if generatedParts[66] then
    table.insert(resizes, {['Part'] = generatedParts[66], ['CFrame'] = (origin + offset) * CFrame.new(-245.359, 169.500, 361.000, 0.500, 0.000, -0.866, 0.000, -1.000, -0.000, -0.866, 0.000, -0.500), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[66], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[66], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[66], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[66], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[66], ['Name'] = "BottomWedge"})
end
if generatedParts[67] then
    table.insert(resizes, {['Part'] = generatedParts[67], ['CFrame'] = (origin + offset) * CFrame.new(-314.641, 169.500, 361.000, 0.500, 0.000, 0.866, 0.000, -1.000, 0.000, 0.866, 0.000, -0.500), ['Size'] = Vector3.new(11.000, 12.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[67], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[67], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[67], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[67], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[67], ['Name'] = "BottomWedge"})
end
if generatedParts[68] then
    table.insert(resizes, {['Part'] = generatedParts[68], ['CFrame'] = (origin + offset) * CFrame.new(-300.000, 190.900, 375.641, 0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, 0.866), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[68], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[68], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[68], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[68], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[68], ['Name'] = "PlatformPart"})
end
if generatedParts[69] then
    table.insert(resizes, {['Part'] = generatedParts[69], ['CFrame'] = (origin + offset) * CFrame.new(-314.641, 190.900, 361.000, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[69], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[69], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[69], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[69], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[69], ['Name'] = "PlatformPart"})
end
if generatedParts[70] then
    table.insert(resizes, {['Part'] = generatedParts[70], ['CFrame'] = (origin + offset) * CFrame.new(-240.000, 190.900, 341.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[70], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[70], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[70], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[70], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[70], ['Name'] = "PlatformPart"})
end
if generatedParts[71] then
    table.insert(resizes, {['Part'] = generatedParts[71], ['CFrame'] = (origin + offset) * CFrame.new(-260.000, 190.900, 306.359, -0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, -0.866), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[71], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[71], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[71], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[71], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[71], ['Name'] = "PlatformPart"})
end
if generatedParts[72] then
    table.insert(resizes, {['Part'] = generatedParts[72], ['CFrame'] = (origin + offset) * CFrame.new(-320.000, 190.900, 341.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[72], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[72], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[72], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[72], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[72], ['Name'] = "PlatformPart"})
end
if generatedParts[73] then
    table.insert(resizes, {['Part'] = generatedParts[73], ['CFrame'] = (origin + offset) * CFrame.new(-245.359, 190.900, 321.000, -0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, -0.500), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[73], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[73], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[73], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[73], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[73], ['Name'] = "PlatformPart"})
end
if generatedParts[74] then
    table.insert(resizes, {['Part'] = generatedParts[74], ['CFrame'] = (origin + offset) * CFrame.new(-314.641, 190.900, 321.000, -0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, -0.500), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[74], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[74], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[74], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[74], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[74], ['Name'] = "PlatformPart"})
end
if generatedParts[75] then
    table.insert(resizes, {['Part'] = generatedParts[75], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 190.900, 301.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[75], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[75], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[75], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[75], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[75], ['Name'] = "PlatformPart"})
end
if generatedParts[76] then
    table.insert(resizes, {['Part'] = generatedParts[76], ['CFrame'] = (origin + offset) * CFrame.new(-260.000, 190.900, 375.641, 0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, 0.866), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[76], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[76], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[76], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[76], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[76], ['Name'] = "PlatformPart"})
end
if generatedParts[77] then
    table.insert(resizes, {['Part'] = generatedParts[77], ['CFrame'] = (origin + offset) * CFrame.new(-300.000, 190.900, 306.359, -0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, -0.866), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[77], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[77], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[77], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[77], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[77], ['Name'] = "PlatformPart"})
end
if generatedParts[78] then
    table.insert(resizes, {['Part'] = generatedParts[78], ['CFrame'] = (origin + offset) * CFrame.new(-245.359, 190.900, 361.000, 0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, 0.500), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[78], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[78], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[78], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[78], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[78], ['Name'] = "PlatformPart"})
end
if generatedParts[79] then
    table.insert(resizes, {['Part'] = generatedParts[79], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 190.900, 381.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[79], ['Color'] = Color3.new(0.388, 0.373, 0.384), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[79], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[79], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[79], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[79], ['Name'] = "PlatformPart"})
end
if generatedParts[80] then
    table.insert(resizes, {['Part'] = generatedParts[80], ['CFrame'] = (origin + offset) * CFrame.new(-288.229, 179.000, 329.674, -0.809, 0.000, -0.588, 0.000, 1.000, 0.000, 0.588, 0.000, -0.809), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[80], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[80], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[80], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[80], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[80], ['Name'] = "StepPart"})
end
if generatedParts[81] then
    table.insert(resizes, {['Part'] = generatedParts[81], ['CFrame'] = (origin + offset) * CFrame.new(-285.694, 189.000, 353.790, 0.914, 0.000, -0.407, 0.000, 1.000, 0.000, 0.407, 0.000, 0.914), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[81], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[81], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[81], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[81], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[81], ['Name'] = "StepPart"})
end
if generatedParts[82] then
    table.insert(resizes, {['Part'] = generatedParts[82], ['CFrame'] = (origin + offset) * CFrame.new(-290.404, 187.000, 350.368, 0.669, 0.000, -0.743, 0.000, 1.000, 0.000, 0.743, 0.000, 0.669), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[82], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[82], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[82], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[82], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[82], ['Name'] = "StepPart"})
end
if generatedParts[83] then
    table.insert(resizes, {['Part'] = generatedParts[83], ['CFrame'] = (origin + offset) * CFrame.new(-273.500, 191.000, 355.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(17.000, 0.800, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[83], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[83], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[83], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[83], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[83], ['Name'] = "StepPart"})
end
if generatedParts[84] then
    table.insert(resizes, {['Part'] = generatedParts[84], ['CFrame'] = (origin + offset) * CFrame.new(-293.315, 182.000, 336.674, -0.309, 0.000, -0.951, 0.000, 1.000, 0.000, 0.951, 0.000, -0.309), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[84], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[84], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[84], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[84], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[84], ['Name'] = "StepPart"})
end
if generatedParts[85] then
    table.insert(resizes, {['Part'] = generatedParts[85], ['CFrame'] = (origin + offset) * CFrame.new(-292.124, 186.000, 348.000, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[85], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[85], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[85], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[85], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[85], ['Name'] = "StepPart"})
end
if generatedParts[86] then
    table.insert(resizes, {['Part'] = generatedParts[86], ['CFrame'] = (origin + offset) * CFrame.new(-282.911, 177.000, 327.306, -0.978, 0.000, -0.208, 0.000, 1.000, 0.000, 0.208, 0.000, -0.978), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[86], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[86], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[86], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[86], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[86], ['Name'] = "StepPart"})
end
if generatedParts[87] then
    table.insert(resizes, {['Part'] = generatedParts[87], ['CFrame'] = (origin + offset) * CFrame.new(-292.124, 181.000, 334.000, -0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, -0.500), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[87], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[87], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[87], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[87], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[87], ['Name'] = "StepPart"})
end
if generatedParts[88] then
    table.insert(resizes, {['Part'] = generatedParts[88], ['CFrame'] = (origin + offset) * CFrame.new(-285.694, 178.000, 328.210, -0.914, 0.000, -0.407, 0.000, 1.000, 0.000, 0.407, 0.000, -0.914), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[88], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[88], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[88], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[88], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[88], ['Name'] = "StepPart"})
end
if generatedParts[89] then
    table.insert(resizes, {['Part'] = generatedParts[89], ['CFrame'] = (origin + offset) * CFrame.new(-290.404, 180.000, 331.632, -0.669, 0.000, -0.743, 0.000, 1.000, 0.000, 0.743, 0.000, -0.669), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[89], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[89], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[89], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[89], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[89], ['Name'] = "StepPart"})
end
if generatedParts[90] then
    table.insert(resizes, {['Part'] = generatedParts[90], ['CFrame'] = (origin + offset) * CFrame.new(-282.911, 190.000, 354.694, 0.978, 0.000, -0.208, 0.000, 1.000, 0.000, 0.208, 0.000, 0.978), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[90], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[90], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[90], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[90], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[90], ['Name'] = "StepPart"})
end
if generatedParts[91] then
    table.insert(resizes, {['Part'] = generatedParts[91], ['CFrame'] = (origin + offset) * CFrame.new(-288.229, 188.000, 352.326, 0.809, 0.000, -0.588, 0.000, 1.000, 0.000, 0.588, 0.000, 0.809), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[91], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[91], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[91], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[91], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[91], ['Name'] = "StepPart"})
end
if generatedParts[92] then
    table.insert(resizes, {['Part'] = generatedParts[92], ['CFrame'] = (origin + offset) * CFrame.new(-293.923, 183.000, 339.537, -0.105, 0.000, -0.995, 0.000, 1.000, 0.000, 0.995, 0.000, -0.105), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[92], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[92], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[92], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[92], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[92], ['Name'] = "StepPart"})
end
if generatedParts[93] then
    table.insert(resizes, {['Part'] = generatedParts[93], ['CFrame'] = (origin + offset) * CFrame.new(-293.315, 185.000, 345.326, 0.309, 0.000, -0.951, 0.000, 1.000, 0.000, 0.951, 0.000, 0.309), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[93], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[93], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[93], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[93], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[93], ['Name'] = "StepPart"})
end
if generatedParts[94] then
    table.insert(resizes, {['Part'] = generatedParts[94], ['CFrame'] = (origin + offset) * CFrame.new(-293.923, 184.000, 342.463, 0.105, 0.000, -0.995, 0.000, 1.000, 0.000, 0.995, 0.000, 0.105), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[94], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[94], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[94], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[94], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[94], ['Name'] = "StepPart"})
end
if generatedParts[95] then
    table.insert(resizes, {['Part'] = generatedParts[95], ['CFrame'] = (origin + offset) * CFrame.new(-260.000, 176.000, 306.359, -0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, -0.866), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[95], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[95], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[95], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[95], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[95], ['Name'] = "PlatformPart"})
end
if generatedParts[96] then
    table.insert(resizes, {['Part'] = generatedParts[96], ['CFrame'] = (origin + offset) * CFrame.new(-314.641, 176.000, 321.000, -0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, -0.500), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[96], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[96], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[96], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[96], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[96], ['Name'] = "PlatformPart"})
end
if generatedParts[97] then
    table.insert(resizes, {['Part'] = generatedParts[97], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 176.000, 381.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[97], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[97], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[97], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[97], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[97], ['Name'] = "PlatformPart"})
end
if generatedParts[98] then
    table.insert(resizes, {['Part'] = generatedParts[98], ['CFrame'] = (origin + offset) * CFrame.new(-260.000, 176.000, 375.641, 0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, 0.866), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[98], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[98], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[98], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[98], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[98], ['Name'] = "PlatformPart"})
end
if generatedParts[99] then
    table.insert(resizes, {['Part'] = generatedParts[99], ['CFrame'] = (origin + offset) * CFrame.new(-245.359, 176.000, 361.000, 0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, 0.500), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[99], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[99], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[99], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[99], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[99], ['Name'] = "PlatformPart"})
end
if generatedParts[100] then
    table.insert(resizes, {['Part'] = generatedParts[100], ['CFrame'] = (origin + offset) * CFrame.new(-320.000, 176.000, 341.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[100], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[100], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[100], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[100], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[100], ['Name'] = "PlatformPart"})
end
if generatedParts[101] then
    table.insert(resizes, {['Part'] = generatedParts[101], ['CFrame'] = (origin + offset) * CFrame.new(-314.641, 176.000, 361.000, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[101], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[101], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[101], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[101], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[101], ['Name'] = "PlatformPart"})
end
if generatedParts[102] then
    table.insert(resizes, {['Part'] = generatedParts[102], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 176.000, 301.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[102], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[102], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[102], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[102], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[102], ['Name'] = "PlatformPart"})
end
if generatedParts[103] then
    table.insert(resizes, {['Part'] = generatedParts[103], ['CFrame'] = (origin + offset) * CFrame.new(-300.000, 176.000, 375.641, 0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, 0.866), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[103], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[103], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[103], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[103], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[103], ['Name'] = "PlatformPart"})
end
if generatedParts[104] then
    table.insert(resizes, {['Part'] = generatedParts[104], ['CFrame'] = (origin + offset) * CFrame.new(-245.359, 176.000, 321.000, -0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, -0.500), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[104], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[104], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[104], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[104], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[104], ['Name'] = "PlatformPart"})
end
if generatedParts[105] then
    table.insert(resizes, {['Part'] = generatedParts[105], ['CFrame'] = (origin + offset) * CFrame.new(-240.000, 176.000, 341.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[105], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[105], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[105], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[105], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[105], ['Name'] = "PlatformPart"})
end
if generatedParts[106] then
    table.insert(resizes, {['Part'] = generatedParts[106], ['CFrame'] = (origin + offset) * CFrame.new(-300.000, 176.000, 306.359, -0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, -0.866), ['Size'] = Vector3.new(22.000, 1.000, 44.000)})
    table.insert(colors, {['Part'] = generatedParts[106], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[106], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[106], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[106], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[106], ['Name'] = "PlatformPart"})
end
if generatedParts[107] then
    table.insert(resizes, {['Part'] = generatedParts[107], ['CFrame'] = (origin + offset) * CFrame.new(-263.824, 183.500, 280.630, -0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, -0.966), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[107], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[107], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[107], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[107], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[107], ['Name'] = "Window"})
end
if generatedParts[108] then
    table.insert(resizes, {['Part'] = generatedParts[108], ['CFrame'] = (origin + offset) * CFrame.new(-333.520, 183.500, 371.900, 0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, 0.500), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[108], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[108], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[108], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[108], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[108], ['Name'] = "Window"})
end
if generatedParts[109] then
    table.insert(resizes, {['Part'] = generatedParts[109], ['CFrame'] = (origin + offset) * CFrame.new(-296.176, 183.500, 280.630, -0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, -0.966), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[109], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[109], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[109], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[109], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[109], ['Name'] = "Window"})
end
if generatedParts[110] then
    table.insert(resizes, {['Part'] = generatedParts[110], ['CFrame'] = (origin + offset) * CFrame.new(-324.194, 183.500, 296.806, -0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, -0.707), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[110], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[110], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[110], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[110], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[110], ['Name'] = "Window"})
end
if generatedParts[111] then
    table.insert(resizes, {['Part'] = generatedParts[111], ['CFrame'] = (origin + offset) * CFrame.new(-341.800, 183.500, 341.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[111], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[111], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[111], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[111], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[111], ['Name'] = "Window"})
end
if generatedParts[112] then
    table.insert(resizes, {['Part'] = generatedParts[112], ['CFrame'] = (origin + offset) * CFrame.new(-340.370, 183.500, 357.176, 0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, 0.259), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[112], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[112], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[112], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[112], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[112], ['Name'] = "Window"})
end
if generatedParts[113] then
    table.insert(resizes, {['Part'] = generatedParts[113], ['CFrame'] = (origin + offset) * CFrame.new(-235.806, 183.500, 296.806, -0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, -0.707), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[113], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[113], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[113], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[113], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[113], ['Name'] = "Window"})
end
if generatedParts[114] then
    table.insert(resizes, {['Part'] = generatedParts[114], ['CFrame'] = (origin + offset) * CFrame.new(-340.370, 183.500, 324.824, -0.259, 0.000, -0.966, 0.000, 1.000, 0.000, 0.966, 0.000, -0.259), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[114], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[114], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[114], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[114], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[114], ['Name'] = "Window"})
end
if generatedParts[115] then
    table.insert(resizes, {['Part'] = generatedParts[115], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 183.500, 402.800, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[115], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[115], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[115], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[115], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[115], ['Name'] = "Window"})
end
if generatedParts[116] then
    table.insert(resizes, {['Part'] = generatedParts[116], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 183.500, 279.200, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[116], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[116], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[116], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[116], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[116], ['Name'] = "Window"})
end
if generatedParts[117] then
    table.insert(resizes, {['Part'] = generatedParts[117], ['CFrame'] = (origin + offset) * CFrame.new(-219.630, 183.500, 357.176, 0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, 0.259), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[117], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[117], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[117], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[117], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[117], ['Name'] = "Window"})
end
if generatedParts[118] then
    table.insert(resizes, {['Part'] = generatedParts[118], ['CFrame'] = (origin + offset) * CFrame.new(-249.100, 183.500, 287.480, -0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, -0.866), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[118], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[118], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[118], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[118], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[118], ['Name'] = "Window"})
end
if generatedParts[119] then
    table.insert(resizes, {['Part'] = generatedParts[119], ['CFrame'] = (origin + offset) * CFrame.new(-219.630, 183.500, 324.824, -0.259, 0.000, 0.966, 0.000, 1.000, 0.000, -0.966, 0.000, -0.259), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[119], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[119], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[119], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[119], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[119], ['Name'] = "Window"})
end
if generatedParts[120] then
    table.insert(resizes, {['Part'] = generatedParts[120], ['CFrame'] = (origin + offset) * CFrame.new(-310.900, 183.500, 394.520, 0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, 0.866), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[120], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[120], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[120], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[120], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[120], ['Name'] = "Window"})
end
if generatedParts[121] then
    table.insert(resizes, {['Part'] = generatedParts[121], ['CFrame'] = (origin + offset) * CFrame.new(-226.480, 183.500, 310.100, -0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, -0.500), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[121], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[121], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[121], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[121], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[121], ['Name'] = "Window"})
end
if generatedParts[122] then
    table.insert(resizes, {['Part'] = generatedParts[122], ['CFrame'] = (origin + offset) * CFrame.new(-310.900, 183.500, 287.480, -0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, -0.866), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[122], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[122], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[122], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[122], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[122], ['Name'] = "Window"})
end
if generatedParts[123] then
    table.insert(resizes, {['Part'] = generatedParts[123], ['CFrame'] = (origin + offset) * CFrame.new(-333.520, 183.500, 310.100, -0.500, 0.000, -0.866, 0.000, 1.000, 0.000, 0.866, 0.000, -0.500), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[123], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[123], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[123], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[123], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[123], ['Name'] = "Window"})
end
if generatedParts[124] then
    table.insert(resizes, {['Part'] = generatedParts[124], ['CFrame'] = (origin + offset) * CFrame.new(-226.480, 183.500, 371.900, 0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, 0.500), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[124], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[124], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[124], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[124], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[124], ['Name'] = "Window"})
end
if generatedParts[125] then
    table.insert(resizes, {['Part'] = generatedParts[125], ['CFrame'] = (origin + offset) * CFrame.new(-218.200, 183.500, 341.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[125], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[125], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[125], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[125], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[125], ['Name'] = "Window"})
end
if generatedParts[126] then
    table.insert(resizes, {['Part'] = generatedParts[126], ['CFrame'] = (origin + offset) * CFrame.new(-296.176, 183.500, 401.370, 0.966, 0.000, -0.259, 0.000, 1.000, 0.000, 0.259, 0.000, 0.966), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[126], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[126], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[126], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[126], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[126], ['Name'] = "Window"})
end
if generatedParts[127] then
    table.insert(resizes, {['Part'] = generatedParts[127], ['CFrame'] = (origin + offset) * CFrame.new(-263.824, 183.500, 401.370, 0.966, 0.000, 0.259, 0.000, 1.000, 0.000, -0.259, 0.000, 0.966), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[127], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[127], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[127], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[127], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[127], ['Name'] = "Window"})
end
if generatedParts[128] then
    table.insert(resizes, {['Part'] = generatedParts[128], ['CFrame'] = (origin + offset) * CFrame.new(-235.806, 183.500, 385.194, 0.707, 0.000, 0.707, 0.000, 1.000, 0.000, -0.707, 0.000, 0.707), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[128], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[128], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[128], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[128], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[128], ['Name'] = "Window"})
end
if generatedParts[129] then
    table.insert(resizes, {['Part'] = generatedParts[129], ['CFrame'] = (origin + offset) * CFrame.new(-249.100, 183.500, 394.520, 0.866, 0.000, 0.500, 0.000, 1.000, 0.000, -0.500, 0.000, 0.866), ['Size'] = Vector3.new(22.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[129], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[129], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[129], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[129], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[129], ['Name'] = "Window"})
end
if generatedParts[130] then
    table.insert(resizes, {['Part'] = generatedParts[130], ['CFrame'] = (origin + offset) * CFrame.new(-324.194, 183.500, 385.194, 0.707, 0.000, -0.707, 0.000, 1.000, 0.000, 0.707, 0.000, 0.707), ['Size'] = Vector3.new(11.000, 15.000, 0.500)})
    table.insert(colors, {['Part'] = generatedParts[130], ['Color'] = Color3.new(0.973, 0.973, 0.973), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[130], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.750, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[130], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[130], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[130], ['Name'] = "Window"})
end
if generatedParts[131] then
    table.insert(resizes, {['Part'] = generatedParts[131], ['CFrame'] = (origin + offset) * CFrame.new(-269.596, 187.000, 331.632, -0.669, 0.000, 0.743, 0.000, 1.000, 0.000, -0.743, 0.000, -0.669), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[131], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[131], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[131], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[131], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[131], ['Name'] = "StepPart"})
end
if generatedParts[132] then
    table.insert(resizes, {['Part'] = generatedParts[132], ['CFrame'] = (origin + offset) * CFrame.new(-274.306, 178.000, 353.790, 0.914, 0.000, 0.407, 0.000, 1.000, 0.000, -0.407, 0.000, 0.914), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[132], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[132], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[132], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[132], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[132], ['Name'] = "StepPart"})
end
if generatedParts[133] then
    table.insert(resizes, {['Part'] = generatedParts[133], ['CFrame'] = (origin + offset) * CFrame.new(-271.771, 188.000, 329.674, -0.809, 0.000, 0.588, 0.000, 1.000, 0.000, -0.588, 0.000, -0.809), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[133], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[133], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[133], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[133], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[133], ['Name'] = "StepPart"})
end
if generatedParts[134] then
    table.insert(resizes, {['Part'] = generatedParts[134], ['CFrame'] = (origin + offset) * CFrame.new(-267.876, 186.000, 334.000, -0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, -0.500), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[134], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[134], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[134], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[134], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[134], ['Name'] = "StepPart"})
end
if generatedParts[135] then
    table.insert(resizes, {['Part'] = generatedParts[135], ['CFrame'] = (origin + offset) * CFrame.new(-266.685, 185.000, 336.674, -0.309, 0.000, 0.951, 0.000, 1.000, 0.000, -0.951, 0.000, -0.309), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[135], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[135], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[135], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[135], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[135], ['Name'] = "StepPart"})
end
if generatedParts[136] then
    table.insert(resizes, {['Part'] = generatedParts[136], ['CFrame'] = (origin + offset) * CFrame.new(-286.500, 191.000, 327.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(17.000, 0.800, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[136], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[136], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[136], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[136], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[136], ['Name'] = "StepPart"})
end
if generatedParts[137] then
    table.insert(resizes, {['Part'] = generatedParts[137], ['CFrame'] = (origin + offset) * CFrame.new(-266.077, 184.000, 339.537, -0.105, 0.000, 0.995, 0.000, 1.000, 0.000, -0.995, 0.000, -0.105), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[137], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[137], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[137], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[137], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[137], ['Name'] = "StepPart"})
end
if generatedParts[138] then
    table.insert(resizes, {['Part'] = generatedParts[138], ['CFrame'] = (origin + offset) * CFrame.new(-274.306, 189.000, 328.210, -0.914, 0.000, 0.407, 0.000, 1.000, 0.000, -0.407, 0.000, -0.914), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[138], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[138], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[138], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[138], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[138], ['Name'] = "StepPart"})
end
if generatedParts[139] then
    table.insert(resizes, {['Part'] = generatedParts[139], ['CFrame'] = (origin + offset) * CFrame.new(-266.077, 183.000, 342.463, 0.105, 0.000, 0.995, 0.000, 1.000, 0.000, -0.995, 0.000, 0.105), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[139], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[139], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[139], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[139], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[139], ['Name'] = "StepPart"})
end
if generatedParts[140] then
    table.insert(resizes, {['Part'] = generatedParts[140], ['CFrame'] = (origin + offset) * CFrame.new(-277.089, 190.000, 327.306, -0.978, 0.000, 0.208, 0.000, 1.000, 0.000, -0.208, 0.000, -0.978), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[140], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[140], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[140], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[140], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[140], ['Name'] = "StepPart"})
end
if generatedParts[141] then
    table.insert(resizes, {['Part'] = generatedParts[141], ['CFrame'] = (origin + offset) * CFrame.new(-271.771, 179.000, 352.326, 0.809, 0.000, 0.588, 0.000, 1.000, 0.000, -0.588, 0.000, 0.809), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[141], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[141], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[141], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[141], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[141], ['Name'] = "StepPart"})
end
if generatedParts[142] then
    table.insert(resizes, {['Part'] = generatedParts[142], ['CFrame'] = (origin + offset) * CFrame.new(-269.596, 180.000, 350.368, 0.669, 0.000, 0.743, 0.000, 1.000, 0.000, -0.743, 0.000, 0.669), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[142], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[142], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[142], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[142], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[142], ['Name'] = "StepPart"})
end
if generatedParts[143] then
    table.insert(resizes, {['Part'] = generatedParts[143], ['CFrame'] = (origin + offset) * CFrame.new(-267.876, 181.000, 348.000, 0.500, 0.000, 0.866, 0.000, 1.000, 0.000, -0.866, 0.000, 0.500), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[143], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[143], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[143], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[143], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[143], ['Name'] = "StepPart"})
end
if generatedParts[144] then
    table.insert(resizes, {['Part'] = generatedParts[144], ['CFrame'] = (origin + offset) * CFrame.new(-266.685, 182.000, 345.326, 0.309, 0.000, 0.951, 0.000, 1.000, 0.000, -0.951, 0.000, 0.309), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[144], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[144], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[144], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[144], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[144], ['Name'] = "StepPart"})
end
if generatedParts[145] then
    table.insert(resizes, {['Part'] = generatedParts[145], ['CFrame'] = (origin + offset) * CFrame.new(-277.089, 177.000, 354.694, 0.978, 0.000, 0.208, 0.000, 1.000, 0.000, -0.208, 0.000, 0.978), ['Size'] = Vector3.new(4.000, 1.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[145], ['Color'] = Color3.new(0.016, 0.686, 0.925), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[145], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[145], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[145], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[145], ['Name'] = "StepPart"})
end
if generatedParts[146] then
    table.insert(resizes, {['Part'] = generatedParts[146], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 168.100, 341.000, 0.000, 0.000, -1.000, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000), ['Size'] = Vector3.new(17.200, 6.000, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[146], ['Color'] = Color3.new(0.455, 0.525, 0.616), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[146], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[146], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[146], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[146], ['Name'] = "SecretElevator"})
end
if generatedParts[147] then
    table.insert(resizes, {['Part'] = generatedParts[147], ['CFrame'] = (origin + offset) * CFrame.new(-280.000, 82.000, 341.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(163.000, 20.000, 20.000)})
    table.insert(colors, {['Part'] = generatedParts[147], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[147], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[147], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[147], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[147], ['Name'] = "TowerPart"})
end
if generatedParts[148] then
    table.insert(resizes, {['Part'] = generatedParts[148], ['CFrame'] = (origin + offset) * CFrame.new(-111.500, 44.200, 29.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(51.000, 0.400, 16.000)})
    table.insert(colors, {['Part'] = generatedParts[148], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[148], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[148], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[148], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[148], ['Name'] = "Grass"})
end
if generatedParts[149] then
    table.insert(resizes, {['Part'] = generatedParts[149], ['CFrame'] = (origin + offset) * CFrame.new(-51.500, 27.500, -113.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[149], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[149], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[149], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[149], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[149], ['Name'] = "LowerRocks"})
end
if generatedParts[150] then
    table.insert(resizes, {['Part'] = generatedParts[150], ['CFrame'] = (origin + offset) * CFrame.new(-109.000, 44.200, 44.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(46.000, 0.400, 14.000)})
    table.insert(colors, {['Part'] = generatedParts[150], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[150], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[150], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[150], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[150], ['Name'] = "Grass"})
end
if generatedParts[151] then
    table.insert(resizes, {['Part'] = generatedParts[151], ['CFrame'] = (origin + offset) * CFrame.new(-11.500, 44.200, 99.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(48.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[151], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[151], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[151], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[151], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[151], ['Name'] = "Grass"})
end
if generatedParts[152] then
    table.insert(resizes, {['Part'] = generatedParts[152], ['CFrame'] = (origin + offset) * CFrame.new(-31.500, 16.500, 130.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[152], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[152], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[152], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[152], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[152], ['Name'] = "LowerRocks"})
end
if generatedParts[153] then
    table.insert(resizes, {['Part'] = generatedParts[153], ['CFrame'] = (origin + offset) * CFrame.new(62.000, 44.200, -100.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.000, 0.400, 16.000)})
    table.insert(colors, {['Part'] = generatedParts[153], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[153], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[153], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[153], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[153], ['Name'] = "Grass"})
end
if generatedParts[154] then
    table.insert(resizes, {['Part'] = generatedParts[154], ['CFrame'] = (origin + offset) * CFrame.new(-94.500, 44.200, 83.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(17.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[154], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[154], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[154], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[154], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[154], ['Name'] = "Grass"})
end
if generatedParts[155] then
    table.insert(resizes, {['Part'] = generatedParts[155], ['CFrame'] = (origin + offset) * CFrame.new(66.500, 38.500, -59.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(98.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[155], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[155], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[155], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[155], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[155], ['Name'] = "Part"})
end
if generatedParts[156] then
    table.insert(resizes, {['Part'] = generatedParts[156], ['CFrame'] = (origin + offset) * CFrame.new(-94.000, 44.200, 72.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(16.000, 0.400, 5.000)})
    table.insert(colors, {['Part'] = generatedParts[156], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[156], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[156], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[156], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[156], ['Name'] = "Grass"})
end
if generatedParts[157] then
    table.insert(resizes, {['Part'] = generatedParts[157], ['CFrame'] = (origin + offset) * CFrame.new(-101.500, 44.200, -51.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 0.400, 31.000)})
    table.insert(colors, {['Part'] = generatedParts[157], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[157], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[157], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[157], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[157], ['Name'] = "Grass"})
end
if generatedParts[158] then
    table.insert(resizes, {['Part'] = generatedParts[158], ['CFrame'] = (origin + offset) * CFrame.new(24.500, 38.500, 54.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(129.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[158], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[158], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[158], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[158], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[158], ['Name'] = "Part"})
end
if generatedParts[159] then
    table.insert(resizes, {['Part'] = generatedParts[159], ['CFrame'] = (origin + offset) * CFrame.new(102.500, 38.500, -2.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(37.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[159], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[159], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[159], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[159], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[159], ['Name'] = "Part"})
end
if generatedParts[160] then
    table.insert(resizes, {['Part'] = generatedParts[160], ['CFrame'] = (origin + offset) * CFrame.new(-1.500, 16.500, 134.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[160], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[160], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[160], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[160], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[160], ['Name'] = "LowerRocks"})
end
if generatedParts[161] then
    table.insert(resizes, {['Part'] = generatedParts[161], ['CFrame'] = (origin + offset) * CFrame.new(-6.500, 27.500, -126.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[161], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[161], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[161], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[161], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[161], ['Name'] = "LowerRocks"})
end
if generatedParts[162] then
    table.insert(resizes, {['Part'] = generatedParts[162], ['CFrame'] = (origin + offset) * CFrame.new(-153.500, 16.500, 20.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[162], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[162], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[162], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[162], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[162], ['Name'] = "LowerRocks"})
end
if generatedParts[163] then
    table.insert(resizes, {['Part'] = generatedParts[163], ['CFrame'] = (origin + offset) * CFrame.new(43.500, 16.500, 121.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[163], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[163], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[163], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[163], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[163], ['Name'] = "LowerRocks"})
end
if generatedParts[164] then
    table.insert(resizes, {['Part'] = generatedParts[164], ['CFrame'] = (origin + offset) * CFrame.new(-98.000, 27.500, 94.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 18.000)})
    table.insert(colors, {['Part'] = generatedParts[164], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[164], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[164], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[164], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[164], ['Name'] = "LowerRocks"})
end
if generatedParts[165] then
    table.insert(resizes, {['Part'] = generatedParts[165], ['CFrame'] = (origin + offset) * CFrame.new(130.500, 16.500, 3.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[165], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[165], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[165], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[165], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[165], ['Name'] = "LowerRocks"})
end
if generatedParts[166] then
    table.insert(resizes, {['Part'] = generatedParts[166], ['CFrame'] = (origin + offset) * CFrame.new(-98.500, 38.500, 90.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[166], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[166], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[166], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[166], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[166], ['Name'] = "Part"})
end
if generatedParts[167] then
    table.insert(resizes, {['Part'] = generatedParts[167], ['CFrame'] = (origin + offset) * CFrame.new(109.500, 16.500, -71.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[167], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[167], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[167], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[167], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[167], ['Name'] = "LowerRocks"})
end
if generatedParts[168] then
    table.insert(resizes, {['Part'] = generatedParts[168], ['CFrame'] = (origin + offset) * CFrame.new(-112.500, 44.200, -8.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(53.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[168], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[168], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[168], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[168], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[168], ['Name'] = "Grass"})
end
if generatedParts[169] then
    table.insert(resizes, {['Part'] = generatedParts[169], ['CFrame'] = (origin + offset) * CFrame.new(-111.500, 16.500, -78.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 17.000)})
    table.insert(colors, {['Part'] = generatedParts[169], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[169], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[169], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[169], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[169], ['Name'] = "LowerRocks"})
end
if generatedParts[170] then
    table.insert(resizes, {['Part'] = generatedParts[170], ['CFrame'] = (origin + offset) * CFrame.new(-149.500, 27.500, 16.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[170], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[170], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[170], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[170], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[170], ['Name'] = "LowerRocks"})
end
if generatedParts[171] then
    table.insert(resizes, {['Part'] = generatedParts[171], ['CFrame'] = (origin + offset) * CFrame.new(51.500, 38.500, -63.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(106.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[171], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[171], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[171], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[171], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[171], ['Name'] = "Part"})
end
if generatedParts[172] then
    table.insert(resizes, {['Part'] = generatedParts[172], ['CFrame'] = (origin + offset) * CFrame.new(-100.500, 27.500, -77.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(23.000, 11.000, 13.000)})
    table.insert(colors, {['Part'] = generatedParts[172], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[172], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[172], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[172], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[172], ['Name'] = "LowerRocks"})
end
if generatedParts[173] then
    table.insert(resizes, {['Part'] = generatedParts[173], ['CFrame'] = (origin + offset) * CFrame.new(4.500, 44.200, 98.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(46.000, 0.400, 17.000)})
    table.insert(colors, {['Part'] = generatedParts[173], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[173], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[173], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[173], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[173], ['Name'] = "Grass"})
end
if generatedParts[174] then
    table.insert(resizes, {['Part'] = generatedParts[174], ['CFrame'] = (origin + offset) * CFrame.new(-53.500, 38.500, 101.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(32.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[174], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[174], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[174], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[174], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[174], ['Name'] = "Part"})
end
if generatedParts[175] then
    table.insert(resizes, {['Part'] = generatedParts[175], ['CFrame'] = (origin + offset) * CFrame.new(51.000, 44.200, 90.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(30.000, 0.400, 14.000)})
    table.insert(colors, {['Part'] = generatedParts[175], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[175], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[175], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[175], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[175], ['Name'] = "Grass"})
end
if generatedParts[176] then
    table.insert(resizes, {['Part'] = generatedParts[176], ['CFrame'] = (origin + offset) * CFrame.new(-106.500, 44.200, 75.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 0.400, 9.000)})
    table.insert(colors, {['Part'] = generatedParts[176], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[176], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[176], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[176], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[176], ['Name'] = "Grass"})
end
if generatedParts[177] then
    table.insert(resizes, {['Part'] = generatedParts[177], ['CFrame'] = (origin + offset) * CFrame.new(69.500, 27.500, -107.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(20.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[177], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[177], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[177], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[177], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[177], ['Name'] = "LowerRocks"})
end
if generatedParts[178] then
    table.insert(resizes, {['Part'] = generatedParts[178], ['CFrame'] = (origin + offset) * CFrame.new(46.500, 27.500, 112.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[178], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[178], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[178], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[178], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[178], ['Name'] = "LowerRocks"})
end
if generatedParts[179] then
    table.insert(resizes, {['Part'] = generatedParts[179], ['CFrame'] = (origin + offset) * CFrame.new(124.500, 27.500, 0.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[179], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[179], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[179], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[179], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[179], ['Name'] = "LowerRocks"})
end
if generatedParts[180] then
    table.insert(resizes, {['Part'] = generatedParts[180], ['CFrame'] = (origin + offset) * CFrame.new(-141.500, 27.500, -13.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(19.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[180], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[180], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[180], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[180], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[180], ['Name'] = "LowerRocks"})
end
if generatedParts[181] then
    table.insert(resizes, {['Part'] = generatedParts[181], ['CFrame'] = (origin + offset) * CFrame.new(-61.500, 16.500, 123.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[181], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[181], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[181], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[181], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[181], ['Name'] = "LowerRocks"})
end
if generatedParts[182] then
    table.insert(resizes, {['Part'] = generatedParts[182], ['CFrame'] = (origin + offset) * CFrame.new(-77.500, 38.500, 70.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(8.000, 11.000, 93.000)})
    table.insert(colors, {['Part'] = generatedParts[182], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[182], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[182], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[182], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[182], ['Name'] = "Part"})
end
if generatedParts[183] then
    table.insert(resizes, {['Part'] = generatedParts[183], ['CFrame'] = (origin + offset) * CFrame.new(-53.500, 38.500, -96.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(27.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[183], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[183], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[183], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[183], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[183], ['Name'] = "Part"})
end
if generatedParts[184] then
    table.insert(resizes, {['Part'] = generatedParts[184], ['CFrame'] = (origin + offset) * CFrame.new(-70.000, 38.500, -66.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 78.000)})
    table.insert(colors, {['Part'] = generatedParts[184], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[184], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[184], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[184], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[184], ['Name'] = "Part"})
end
if generatedParts[185] then
    table.insert(resizes, {['Part'] = generatedParts[185], ['CFrame'] = (origin + offset) * CFrame.new(-122.500, 16.500, -67.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[185], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[185], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[185], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[185], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[185], ['Name'] = "LowerRocks"})
end
if generatedParts[186] then
    table.insert(resizes, {['Part'] = generatedParts[186], ['CFrame'] = (origin + offset) * CFrame.new(96.000, 44.200, 12.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(46.000, 0.400, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[186], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[186], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[186], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[186], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[186], ['Name'] = "Grass"})
end
if generatedParts[187] then
    table.insert(resizes, {['Part'] = generatedParts[187], ['CFrame'] = (origin + offset) * CFrame.new(-144.500, 27.500, 31.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[187], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[187], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[187], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[187], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[187], ['Name'] = "LowerRocks"})
end
if generatedParts[188] then
    table.insert(resizes, {['Part'] = generatedParts[188], ['CFrame'] = (origin + offset) * CFrame.new(-149.500, 16.500, 35.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[188], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[188], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[188], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[188], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[188], ['Name'] = "LowerRocks"})
end
if generatedParts[189] then
    table.insert(resizes, {['Part'] = generatedParts[189], ['CFrame'] = (origin + offset) * CFrame.new(28.500, 16.500, 125.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[189], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[189], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[189], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[189], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[189], ['Name'] = "LowerRocks"})
end
if generatedParts[190] then
    table.insert(resizes, {['Part'] = generatedParts[190], ['CFrame'] = (origin + offset) * CFrame.new(-6.500, 44.200, -7.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(164.000, 0.400, 159.000)})
    table.insert(colors, {['Part'] = generatedParts[190], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[190], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[190], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[190], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[190], ['Name'] = "Grass"})
end
if generatedParts[191] then
    table.insert(resizes, {['Part'] = generatedParts[191], ['CFrame'] = (origin + offset) * CFrame.new(-133.500, 16.500, -56.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[191], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[191], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[191], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[191], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[191], ['Name'] = "LowerRocks"})
end
if generatedParts[192] then
    table.insert(resizes, {['Part'] = generatedParts[192], ['CFrame'] = (origin + offset) * CFrame.new(93.500, 44.200, -13.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(41.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[192], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[192], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[192], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[192], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[192], ['Name'] = "Grass"})
end
if generatedParts[193] then
    table.insert(resizes, {['Part'] = generatedParts[193], ['CFrame'] = (origin + offset) * CFrame.new(74.500, 27.500, 94.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[193], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[193], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[193], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[193], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[193], ['Name'] = "LowerRocks"})
end
if generatedParts[194] then
    table.insert(resizes, {['Part'] = generatedParts[194], ['CFrame'] = (origin + offset) * CFrame.new(-12.500, 16.500, -131.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[194], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[194], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[194], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[194], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[194], ['Name'] = "LowerRocks"})
end
if generatedParts[195] then
    table.insert(resizes, {['Part'] = generatedParts[195], ['CFrame'] = (origin + offset) * CFrame.new(92.000, 44.200, -28.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(38.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[195], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[195], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[195], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[195], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[195], ['Name'] = "Grass"})
end
if generatedParts[196] then
    table.insert(resizes, {['Part'] = generatedParts[196], ['CFrame'] = (origin + offset) * CFrame.new(-42.500, 16.500, -123.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[196], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[196], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[196], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[196], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[196], ['Name'] = "LowerRocks"})
end
if generatedParts[197] then
    table.insert(resizes, {['Part'] = generatedParts[197], ['CFrame'] = (origin + offset) * CFrame.new(-36.500, 27.500, -118.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[197], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[197], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[197], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[197], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[197], ['Name'] = "LowerRocks"})
end
if generatedParts[198] then
    table.insert(resizes, {['Part'] = generatedParts[198], ['CFrame'] = (origin + offset) * CFrame.new(120.500, 16.500, -41.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[198], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[198], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[198], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[198], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[198], ['Name'] = "LowerRocks"})
end
if generatedParts[199] then
    table.insert(resizes, {['Part'] = generatedParts[199], ['CFrame'] = (origin + offset) * CFrame.new(116.500, 16.500, 48.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(15.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[199], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[199], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[199], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[199], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[199], ['Name'] = "LowerRocks"})
end
if generatedParts[200] then
    table.insert(resizes, {['Part'] = generatedParts[200], ['CFrame'] = (origin + offset) * CFrame.new(-8.500, 38.500, -67.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(114.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[200], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[200], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[200], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[200], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[200], ['Name'] = "Part"})
end
if generatedParts[201] then
    table.insert(resizes, {['Part'] = generatedParts[201], ['CFrame'] = (origin + offset) * CFrame.new(17.500, 16.500, -133.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[201], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[201], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[201], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[201], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[201], ['Name'] = "LowerRocks"})
end
if generatedParts[202] then
    table.insert(resizes, {['Part'] = generatedParts[202], ['CFrame'] = (origin + offset) * CFrame.new(-125.500, 16.500, 78.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[202], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[202], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[202], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[202], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[202], ['Name'] = "LowerRocks"})
end
if generatedParts[203] then
    table.insert(resizes, {['Part'] = generatedParts[203], ['CFrame'] = (origin + offset) * CFrame.new(6.500, 38.500, -69.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(118.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[203], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[203], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[203], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[203], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[203], ['Name'] = "Part"})
end
if generatedParts[204] then
    table.insert(resizes, {['Part'] = generatedParts[204], ['CFrame'] = (origin + offset) * CFrame.new(64.000, 44.200, 84.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(19.000, 0.400, 12.000)})
    table.insert(colors, {['Part'] = generatedParts[204], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[204], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[204], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[204], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[204], ['Name'] = "Grass"})
end
if generatedParts[205] then
    table.insert(resizes, {['Part'] = generatedParts[205], ['CFrame'] = (origin + offset) * CFrame.new(81.500, 16.500, -114.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[205], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[205], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[205], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[205], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[205], ['Name'] = "LowerRocks"})
end
if generatedParts[206] then
    table.insert(resizes, {['Part'] = generatedParts[206], ['CFrame'] = (origin + offset) * CFrame.new(90.000, 44.200, -43.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(34.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[206], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[206], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[206], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[206], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[206], ['Name'] = "Grass"})
end
if generatedParts[207] then
    table.insert(resizes, {['Part'] = generatedParts[207], ['CFrame'] = (origin + offset) * CFrame.new(-23.500, 38.500, -64.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(109.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[207], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[207], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[207], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[207], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[207], ['Name'] = "Part"})
end
if generatedParts[208] then
    table.insert(resizes, {['Part'] = generatedParts[208], ['CFrame'] = (origin + offset) * CFrame.new(91.500, 16.500, -101.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[208], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[208], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[208], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[208], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[208], ['Name'] = "LowerRocks"})
end
if generatedParts[209] then
    table.insert(resizes, {['Part'] = generatedParts[209], ['CFrame'] = (origin + offset) * CFrame.new(-58.500, 27.500, 116.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(16.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[209], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[209], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[209], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[209], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[209], ['Name'] = "LowerRocks"})
end
if generatedParts[210] then
    table.insert(resizes, {['Part'] = generatedParts[210], ['CFrame'] = (origin + offset) * CFrame.new(-102.500, 16.500, 100.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[210], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[210], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[210], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[210], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[210], ['Name'] = "LowerRocks"})
end
if generatedParts[211] then
    table.insert(resizes, {['Part'] = generatedParts[211], ['CFrame'] = (origin + offset) * CFrame.new(96.500, 38.500, 42.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(25.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[211], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[211], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[211], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[211], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[211], ['Name'] = "Part"})
end
if generatedParts[212] then
    table.insert(resizes, {['Part'] = generatedParts[212], ['CFrame'] = (origin + offset) * CFrame.new(99.000, 27.500, -74.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(12.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[212], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[212], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[212], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[212], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[212], ['Name'] = "LowerRocks"})
end
if generatedParts[213] then
    table.insert(resizes, {['Part'] = generatedParts[213], ['CFrame'] = (origin + offset) * CFrame.new(79.500, 38.500, -92.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[213], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[213], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[213], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[213], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[213], ['Name'] = "Part"})
end
if generatedParts[214] then
    table.insert(resizes, {['Part'] = generatedParts[214], ['CFrame'] = (origin + offset) * CFrame.new(-148.500, 27.500, 1.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(17.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[214], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[214], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[214], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[214], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[214], ['Name'] = "LowerRocks"})
end
if generatedParts[215] then
    table.insert(resizes, {['Part'] = generatedParts[215], ['CFrame'] = (origin + offset) * CFrame.new(1.500, 27.500, 127.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[215], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[215], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[215], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[215], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[215], ['Name'] = "LowerRocks"})
end
if generatedParts[216] then
    table.insert(resizes, {['Part'] = generatedParts[216], ['CFrame'] = (origin + offset) * CFrame.new(-68.500, 38.500, 97.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(25.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[216], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[216], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[216], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[216], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[216], ['Name'] = "Part"})
end
if generatedParts[217] then
    table.insert(resizes, {['Part'] = generatedParts[217], ['CFrame'] = (origin + offset) * CFrame.new(-154.500, 16.500, -9.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[217], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[217], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[217], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[217], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[217], ['Name'] = "LowerRocks"})
end
if generatedParts[218] then
    table.insert(resizes, {['Part'] = generatedParts[218], ['CFrame'] = (origin + offset) * CFrame.new(109.500, 16.500, 63.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(17.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[218], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[218], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[218], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[218], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[218], ['Name'] = "LowerRocks"})
end
if generatedParts[219] then
    table.insert(resizes, {['Part'] = generatedParts[219], ['CFrame'] = (origin + offset) * CFrame.new(89.500, 38.500, 72.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[219], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[219], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[219], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[219], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[219], ['Name'] = "Part"})
end
if generatedParts[220] then
    table.insert(resizes, {['Part'] = generatedParts[220], ['CFrame'] = (origin + offset) * CFrame.new(78.500, 38.500, 40.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 100.000)})
    table.insert(colors, {['Part'] = generatedParts[220], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[220], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[220], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[220], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[220], ['Name'] = "Part"})
end
if generatedParts[221] then
    table.insert(resizes, {['Part'] = generatedParts[221], ['CFrame'] = (origin + offset) * CFrame.new(104.500, 16.500, 78.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[221], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[221], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[221], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[221], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[221], ['Name'] = "LowerRocks"})
end
if generatedParts[222] then
    table.insert(resizes, {['Part'] = generatedParts[222], ['CFrame'] = (origin + offset) * CFrame.new(39.500, 38.500, 52.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(124.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[222], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[222], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[222], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[222], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[222], ['Name'] = "Part"})
end
if generatedParts[223] then
    table.insert(resizes, {['Part'] = generatedParts[223], ['CFrame'] = (origin + offset) * CFrame.new(-90.500, 38.500, 2.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(119.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[223], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[223], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[223], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[223], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[223], ['Name'] = "Part"})
end
if generatedParts[224] then
    table.insert(resizes, {['Part'] = generatedParts[224], ['CFrame'] = (origin + offset) * CFrame.new(-46.500, 16.500, 126.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[224], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[224], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[224], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[224], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[224], ['Name'] = "LowerRocks"})
end
if generatedParts[225] then
    table.insert(resizes, {['Part'] = generatedParts[225], ['CFrame'] = (origin + offset) * CFrame.new(90.000, 27.500, -89.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(12.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[225], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[225], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[225], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[225], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[225], ['Name'] = "LowerRocks"})
end
if generatedParts[226] then
    table.insert(resizes, {['Part'] = generatedParts[226], ['CFrame'] = (origin + offset) * CFrame.new(108.000, 27.500, 45.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(16.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[226], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[226], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[226], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[226], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[226], ['Name'] = "LowerRocks"})
end
if generatedParts[227] then
    table.insert(resizes, {['Part'] = generatedParts[227], ['CFrame'] = (origin + offset) * CFrame.new(-43.500, 27.500, 122.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(14.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[227], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[227], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[227], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[227], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[227], ['Name'] = "LowerRocks"})
end
if generatedParts[228] then
    table.insert(resizes, {['Part'] = generatedParts[228], ['CFrame'] = (origin + offset) * CFrame.new(115.500, 27.500, -29.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[228], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[228], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[228], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[228], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[228], ['Name'] = "LowerRocks"})
end
if generatedParts[229] then
    table.insert(resizes, {['Part'] = generatedParts[229], ['CFrame'] = (origin + offset) * CFrame.new(-79.500, 44.200, 88.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(26.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[229], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[229], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[229], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[229], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[229], ['Name'] = "Grass"})
end
if generatedParts[230] then
    table.insert(resizes, {['Part'] = generatedParts[230], ['CFrame'] = (origin + offset) * CFrame.new(-144.500, 16.500, 50.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[230], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[230], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[230], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[230], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[230], ['Name'] = "LowerRocks"})
end
if generatedParts[231] then
    table.insert(resizes, {['Part'] = generatedParts[231], ['CFrame'] = (origin + offset) * CFrame.new(31.500, 27.500, 117.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[231], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[231], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[231], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[231], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[231], ['Name'] = "LowerRocks"})
end
if generatedParts[232] then
    table.insert(resizes, {['Part'] = generatedParts[232], ['CFrame'] = (origin + offset) * CFrame.new(119.500, 27.500, -14.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[232], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[232], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[232], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[232], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[232], ['Name'] = "LowerRocks"})
end
if generatedParts[233] then
    table.insert(resizes, {['Part'] = generatedParts[233], ['CFrame'] = (origin + offset) * CFrame.new(66.500, 16.500, -121.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[233], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[233], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[233], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[233], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[233], ['Name'] = "LowerRocks"})
end
if generatedParts[234] then
    table.insert(resizes, {['Part'] = generatedParts[234], ['CFrame'] = (origin + offset) * CFrame.new(14.000, 44.200, -110.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(27.000, 0.400, 20.000)})
    table.insert(colors, {['Part'] = generatedParts[234], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[234], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[234], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[234], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[234], ['Name'] = "Grass"})
end
if generatedParts[235] then
    table.insert(resizes, {['Part'] = generatedParts[235], ['CFrame'] = (origin + offset) * CFrame.new(36.500, 38.500, -66.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(112.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[235], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[235], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[235], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[235], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[235], ['Name'] = "Part"})
end
if generatedParts[236] then
    table.insert(resizes, {['Part'] = generatedParts[236], ['CFrame'] = (origin + offset) * CFrame.new(96.500, 27.500, 75.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[236], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[236], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[236], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[236], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[236], ['Name'] = "LowerRocks"})
end
if generatedParts[237] then
    table.insert(resizes, {['Part'] = generatedParts[237], ['CFrame'] = (origin + offset) * CFrame.new(-67.000, 38.500, -77.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 72.000)})
    table.insert(colors, {['Part'] = generatedParts[237], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[237], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[237], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[237], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[237], ['Name'] = "Part"})
end
if generatedParts[238] then
    table.insert(resizes, {['Part'] = generatedParts[238], ['CFrame'] = (origin + offset) * CFrame.new(127.500, 16.500, -11.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[238], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[238], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[238], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[238], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[238], ['Name'] = "LowerRocks"})
end
if generatedParts[239] then
    table.insert(resizes, {['Part'] = generatedParts[239], ['CFrame'] = (origin + offset) * CFrame.new(-135.500, 27.500, -28.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(17.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[239], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[239], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[239], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[239], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[239], ['Name'] = "LowerRocks"})
end
if generatedParts[240] then
    table.insert(resizes, {['Part'] = generatedParts[240], ['CFrame'] = (origin + offset) * CFrame.new(-32.000, 44.200, -104.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(14.000, 0.400, 18.000)})
    table.insert(colors, {['Part'] = generatedParts[240], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[240], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[240], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[240], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[240], ['Name'] = "Grass"})
end
if generatedParts[241] then
    table.insert(resizes, {['Part'] = generatedParts[241], ['CFrame'] = (origin + offset) * CFrame.new(-48.500, 44.200, -101.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(9.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[241], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[241], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[241], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[241], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[241], ['Name'] = "Grass"})
end
if generatedParts[242] then
    table.insert(resizes, {['Part'] = generatedParts[242], ['CFrame'] = (origin + offset) * CFrame.new(-126.500, 27.500, -43.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(21.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[242], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[242], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[242], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[242], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[242], ['Name'] = "LowerRocks"})
end
if generatedParts[243] then
    table.insert(resizes, {['Part'] = generatedParts[243], ['CFrame'] = (origin + offset) * CFrame.new(-68.500, 38.500, -92.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(19.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[243], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[243], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[243], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[243], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[243], ['Name'] = "Part"})
end
if generatedParts[244] then
    table.insert(resizes, {['Part'] = generatedParts[244], ['CFrame'] = (origin + offset) * CFrame.new(-140.500, 27.500, 46.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[244], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[244], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[244], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[244], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[244], ['Name'] = "LowerRocks"})
end
if generatedParts[245] then
    table.insert(resizes, {['Part'] = generatedParts[245], ['CFrame'] = (origin + offset) * CFrame.new(92.000, 38.500, -47.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(36.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[245], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[245], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[245], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[245], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[245], ['Name'] = "Part"})
end
if generatedParts[246] then
    table.insert(resizes, {['Part'] = generatedParts[246], ['CFrame'] = (origin + offset) * CFrame.new(-115.000, 27.500, -66.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(16.000, 11.000, 9.000)})
    table.insert(colors, {['Part'] = generatedParts[246], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[246], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[246], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[246], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[246], ['Name'] = "LowerRocks"})
end
if generatedParts[247] then
    table.insert(resizes, {['Part'] = generatedParts[247], ['CFrame'] = (origin + offset) * CFrame.new(-38.500, 38.500, 105.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(40.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[247], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[247], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[247], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[247], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[247], ['Name'] = "Part"})
end
if generatedParts[248] then
    table.insert(resizes, {['Part'] = generatedParts[248], ['CFrame'] = (origin + offset) * CFrame.new(54.500, 38.500, 103.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[248], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[248], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[248], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[248], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[248], ['Name'] = "Part"})
end
if generatedParts[249] then
    table.insert(resizes, {['Part'] = generatedParts[249], ['CFrame'] = (origin + offset) * CFrame.new(-91.500, 16.500, 111.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[249], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[249], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[249], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[249], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[249], ['Name'] = "LowerRocks"})
end
if generatedParts[250] then
    table.insert(resizes, {['Part'] = generatedParts[250], ['CFrame'] = (origin + offset) * CFrame.new(-49.500, 44.200, 94.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(38.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[250], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[250], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[250], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[250], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[250], ['Name'] = "Grass"})
end
if generatedParts[251] then
    table.insert(resizes, {['Part'] = generatedParts[251], ['CFrame'] = (origin + offset) * CFrame.new(-101.500, 44.200, -61.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(9.000, 0.400, 7.000)})
    table.insert(colors, {['Part'] = generatedParts[251], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[251], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[251], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[251], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[251], ['Name'] = "Grass"})
end
if generatedParts[252] then
    table.insert(resizes, {['Part'] = generatedParts[252], ['CFrame'] = (origin + offset) * CFrame.new(36.000, 44.200, 93.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(36.000, 0.400, 16.000)})
    table.insert(colors, {['Part'] = generatedParts[252], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[252], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[252], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[252], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[252], ['Name'] = "Grass"})
end
if generatedParts[253] then
    table.insert(resizes, {['Part'] = generatedParts[253], ['CFrame'] = (origin + offset) * CFrame.new(24.000, 27.500, -127.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 11.000, 16.000)})
    table.insert(colors, {['Part'] = generatedParts[253], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[253], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[253], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[253], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[253], ['Name'] = "LowerRocks"})
end
if generatedParts[254] then
    table.insert(resizes, {['Part'] = generatedParts[254], ['CFrame'] = (origin + offset) * CFrame.new(-92.000, 44.200, -67.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(20.000, 0.400, 12.000)})
    table.insert(colors, {['Part'] = generatedParts[254], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[254], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[254], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[254], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[254], ['Name'] = "Grass"})
end
if generatedParts[255] then
    table.insert(resizes, {['Part'] = generatedParts[255], ['CFrame'] = (origin + offset) * CFrame.new(-109.000, 44.200, -23.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(46.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[255], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[255], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[255], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[255], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[255], ['Name'] = "Grass"})
end
if generatedParts[256] then
    table.insert(resizes, {['Part'] = generatedParts[256], ['CFrame'] = (origin + offset) * CFrame.new(-112.500, 27.500, 83.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[256], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[256], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[256], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[256], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[256], ['Name'] = "LowerRocks"})
end
if generatedParts[257] then
    table.insert(resizes, {['Part'] = generatedParts[257], ['CFrame'] = (origin + offset) * CFrame.new(-38.500, 38.500, -99.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(32.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[257], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[257], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[257], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[257], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[257], ['Name'] = "Part"})
end
if generatedParts[258] then
    table.insert(resizes, {['Part'] = generatedParts[258], ['CFrame'] = (origin + offset) * CFrame.new(-134.500, 27.500, 61.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[258], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[258], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[258], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[258], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[258], ['Name'] = "LowerRocks"})
end
if generatedParts[259] then
    table.insert(resizes, {['Part'] = generatedParts[259], ['CFrame'] = (origin + offset) * CFrame.new(-34.500, 44.200, 98.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(46.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[259], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[259], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[259], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[259], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[259], ['Name'] = "Grass"})
end
if generatedParts[260] then
    table.insert(resizes, {['Part'] = generatedParts[260], ['CFrame'] = (origin + offset) * CFrame.new(54.500, 27.500, -114.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(18.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[260], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[260], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[260], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[260], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[260], ['Name'] = "LowerRocks"})
end
if generatedParts[261] then
    table.insert(resizes, {['Part'] = generatedParts[261], ['CFrame'] = (origin + offset) * CFrame.new(88.000, 38.500, -62.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(28.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[261], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[261], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[261], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[261], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[261], ['Name'] = "Part"})
end
if generatedParts[262] then
    table.insert(resizes, {['Part'] = generatedParts[262], ['CFrame'] = (origin + offset) * CFrame.new(96.000, 38.500, -17.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(44.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[262], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[262], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[262], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[262], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[262], ['Name'] = "Part"})
end
if generatedParts[263] then
    table.insert(resizes, {['Part'] = generatedParts[263], ['CFrame'] = (origin + offset) * CFrame.new(-83.500, 38.500, 94.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(19.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[263], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[263], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[263], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[263], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[263], ['Name'] = "Part"})
end
if generatedParts[264] then
    table.insert(resizes, {['Part'] = generatedParts[264], ['CFrame'] = (origin + offset) * CFrame.new(115.500, 27.500, 30.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(15.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[264], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[264], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[264], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[264], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[264], ['Name'] = "LowerRocks"})
end
if generatedParts[265] then
    table.insert(resizes, {['Part'] = generatedParts[265], ['CFrame'] = (origin + offset) * CFrame.new(-21.500, 27.500, -122.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[265], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[265], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[265], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[265], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[265], ['Name'] = "LowerRocks"})
end
if generatedParts[266] then
    table.insert(resizes, {['Part'] = generatedParts[266], ['CFrame'] = (origin + offset) * CFrame.new(75.000, 44.200, 80.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(10.000, 0.400, 11.000)})
    table.insert(colors, {['Part'] = generatedParts[266], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[266], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[266], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[266], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[266], ['Name'] = "Grass"})
end
if generatedParts[267] then
    table.insert(resizes, {['Part'] = generatedParts[267], ['CFrame'] = (origin + offset) * CFrame.new(126.500, 16.500, 18.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[267], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[267], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[267], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[267], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[267], ['Name'] = "LowerRocks"})
end
if generatedParts[268] then
    table.insert(resizes, {['Part'] = generatedParts[268], ['CFrame'] = (origin + offset) * CFrame.new(111.500, 27.500, -44.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[268], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[268], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[268], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[268], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[268], ['Name'] = "LowerRocks"})
end
if generatedParts[269] then
    table.insert(resizes, {['Part'] = generatedParts[269], ['CFrame'] = (origin + offset) * CFrame.new(-83.500, 38.500, -27.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(105.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[269], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[269], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[269], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[269], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[269], ['Name'] = "Part"})
end
if generatedParts[270] then
    table.insert(resizes, {['Part'] = generatedParts[270], ['CFrame'] = (origin + offset) * CFrame.new(93.500, 44.200, 23.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(41.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[270], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[270], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[270], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[270], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[270], ['Name'] = "Grass"})
end
if generatedParts[271] then
    table.insert(resizes, {['Part'] = generatedParts[271], ['CFrame'] = (origin + offset) * CFrame.new(-72.500, 16.500, -110.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[271], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[271], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[271], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[271], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[271], ['Name'] = "LowerRocks"})
end
if generatedParts[272] then
    table.insert(resizes, {['Part'] = generatedParts[272], ['CFrame'] = (origin + offset) * CFrame.new(82.000, 44.200, 68.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(18.000, 0.400, 14.000)})
    table.insert(colors, {['Part'] = generatedParts[272], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[272], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[272], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[272], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[272], ['Name'] = "Grass"})
end
if generatedParts[273] then
    table.insert(resizes, {['Part'] = generatedParts[273], ['CFrame'] = (origin + offset) * CFrame.new(-23.500, 38.500, 59.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(139.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[273], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[273], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[273], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[273], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[273], ['Name'] = "Part"})
end
if generatedParts[274] then
    table.insert(resizes, {['Part'] = generatedParts[274], ['CFrame'] = (origin + offset) * CFrame.new(8.000, 38.500, 57.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(135.000, 11.000, 18.000)})
    table.insert(colors, {['Part'] = generatedParts[274], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[274], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[274], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[274], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[274], ['Name'] = "Part"})
end
if generatedParts[275] then
    table.insert(resizes, {['Part'] = generatedParts[275], ['CFrame'] = (origin + offset) * CFrame.new(-87.500, 16.500, -101.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[275], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[275], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[275], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[275], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[275], ['Name'] = "LowerRocks"})
end
if generatedParts[276] then
    table.insert(resizes, {['Part'] = generatedParts[276], ['CFrame'] = (origin + offset) * CFrame.new(89.000, 44.200, 38.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(32.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[276], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[276], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[276], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[276], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[276], ['Name'] = "Grass"})
end
if generatedParts[277] then
    table.insert(resizes, {['Part'] = generatedParts[277], ['CFrame'] = (origin + offset) * CFrame.new(121.000, 16.500, 33.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(14.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[277], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[277], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[277], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[277], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[277], ['Name'] = "LowerRocks"})
end
if generatedParts[278] then
    table.insert(resizes, {['Part'] = generatedParts[278], ['CFrame'] = (origin + offset) * CFrame.new(-16.500, 16.500, 133.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[278], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[278], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[278], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[278], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[278], ['Name'] = "LowerRocks"})
end
if generatedParts[279] then
    table.insert(resizes, {['Part'] = generatedParts[279], ['CFrame'] = (origin + offset) * CFrame.new(-73.500, 27.500, 110.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(15.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[279], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[279], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[279], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[279], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[279], ['Name'] = "LowerRocks"})
end
if generatedParts[280] then
    table.insert(resizes, {['Part'] = generatedParts[280], ['CFrame'] = (origin + offset) * CFrame.new(-138.000, 16.500, -40.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(16.000, 11.000, 17.000)})
    table.insert(colors, {['Part'] = generatedParts[280], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[280], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[280], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[280], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[280], ['Name'] = "LowerRocks"})
end
if generatedParts[281] then
    table.insert(resizes, {['Part'] = generatedParts[281], ['CFrame'] = (origin + offset) * CFrame.new(124.500, 16.500, -26.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[281], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[281], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[281], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[281], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[281], ['Name'] = "LowerRocks"})
end
if generatedParts[282] then
    table.insert(resizes, {['Part'] = generatedParts[282], ['CFrame'] = (origin + offset) * CFrame.new(100.500, 38.500, 27.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(33.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[282], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[282], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[282], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[282], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[282], ['Name'] = "Part"})
end
if generatedParts[283] then
    table.insert(resizes, {['Part'] = generatedParts[283], ['CFrame'] = (origin + offset) * CFrame.new(58.500, 16.500, 116.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[283], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[283], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[283], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[283], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[283], ['Name'] = "LowerRocks"})
end
if generatedParts[284] then
    table.insert(resizes, {['Part'] = generatedParts[284], ['CFrame'] = (origin + offset) * CFrame.new(-13.500, 27.500, 130.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[284], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[284], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[284], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[284], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[284], ['Name'] = "LowerRocks"})
end
if generatedParts[285] then
    table.insert(resizes, {['Part'] = generatedParts[285], ['CFrame'] = (origin + offset) * CFrame.new(86.000, 44.200, -59.000, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(26.000, 0.400, 16.000)})
    table.insert(colors, {['Part'] = generatedParts[285], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[285], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[285], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[285], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[285], ['Name'] = "Grass"})
end
if generatedParts[286] then
    table.insert(resizes, {['Part'] = generatedParts[286], ['CFrame'] = (origin + offset) * CFrame.new(82.500, 16.500, 97.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[286], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[286], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[286], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[286], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[286], ['Name'] = "LowerRocks"})
end
if generatedParts[287] then
    table.insert(resizes, {['Part'] = generatedParts[287], ['CFrame'] = (origin + offset) * CFrame.new(13.500, 16.500, 130.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[287], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[287], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[287], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[287], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[287], ['Name'] = "LowerRocks"})
end
if generatedParts[288] then
    table.insert(resizes, {['Part'] = generatedParts[288], ['CFrame'] = (origin + offset) * CFrame.new(16.500, 27.500, 122.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[288], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[288], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[288], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[288], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[288], ['Name'] = "LowerRocks"})
end
if generatedParts[289] then
    table.insert(resizes, {['Part'] = generatedParts[289], ['CFrame'] = (origin + offset) * CFrame.new(82.000, 44.200, -74.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(18.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[289], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[289], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[289], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[289], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[289], ['Name'] = "Grass"})
end
if generatedParts[290] then
    table.insert(resizes, {['Part'] = generatedParts[290], ['CFrame'] = (origin + offset) * CFrame.new(71.500, 16.500, 105.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[290], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[290], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[290], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[290], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[290], ['Name'] = "LowerRocks"})
end
if generatedParts[291] then
    table.insert(resizes, {['Part'] = generatedParts[291], ['CFrame'] = (origin + offset) * CFrame.new(-88.500, 38.500, 17.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(115.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[291], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[291], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[291], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[291], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[291], ['Name'] = "Part"})
end
if generatedParts[292] then
    table.insert(resizes, {['Part'] = generatedParts[292], ['CFrame'] = (origin + offset) * CFrame.new(-23.000, 44.200, 100.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(50.000, 0.400, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[292], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[292], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[292], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[292], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[292], ['Name'] = "Grass"})
end
if generatedParts[293] then
    table.insert(resizes, {['Part'] = generatedParts[293], ['CFrame'] = (origin + offset) * CFrame.new(32.500, 16.500, -129.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[293], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[293], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[293], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[293], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[293], ['Name'] = "LowerRocks"})
end
if generatedParts[294] then
    table.insert(resizes, {['Part'] = generatedParts[294], ['CFrame'] = (origin + offset) * CFrame.new(61.500, 27.500, 104.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(16.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[294], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[294], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[294], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[294], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[294], ['Name'] = "LowerRocks"})
end
if generatedParts[295] then
    table.insert(resizes, {['Part'] = generatedParts[295], ['CFrame'] = (origin + offset) * CFrame.new(-135.000, 16.500, 65.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(16.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[295], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[295], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[295], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[295], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[295], ['Name'] = "LowerRocks"})
end
if generatedParts[296] then
    table.insert(resizes, {['Part'] = generatedParts[296], ['CFrame'] = (origin + offset) * CFrame.new(-27.500, 16.500, -127.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[296], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[296], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[296], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[296], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[296], ['Name'] = "LowerRocks"})
end
if generatedParts[297] then
    table.insert(resizes, {['Part'] = generatedParts[297], ['CFrame'] = (origin + offset) * CFrame.new(2.500, 16.500, -135.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[297], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[297], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[297], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[297], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[297], ['Name'] = "LowerRocks"})
end
if generatedParts[298] then
    table.insert(resizes, {['Part'] = generatedParts[298], ['CFrame'] = (origin + offset) * CFrame.new(46.500, 44.200, -104.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(15.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[298], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[298], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[298], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[298], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[298], ['Name'] = "Grass"})
end
if generatedParts[299] then
    table.insert(resizes, {['Part'] = generatedParts[299], ['CFrame'] = (origin + offset) * CFrame.new(-57.500, 16.500, -117.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[299], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[299], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[299], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[299], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[299], ['Name'] = "LowerRocks"})
end
if generatedParts[300] then
    table.insert(resizes, {['Part'] = generatedParts[300], ['CFrame'] = (origin + offset) * CFrame.new(-3.500, 44.200, -108.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(23.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[300], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[300], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[300], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[300], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[300], ['Name'] = "Grass"})
end
if generatedParts[301] then
    table.insert(resizes, {['Part'] = generatedParts[301], ['CFrame'] = (origin + offset) * CFrame.new(101.500, 27.500, 60.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(17.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[301], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[301], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[301], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[301], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[301], ['Name'] = "LowerRocks"})
end
if generatedParts[302] then
    table.insert(resizes, {['Part'] = generatedParts[302], ['CFrame'] = (origin + offset) * CFrame.new(-95.500, 27.500, -90.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(13.000, 11.000, 13.000)})
    table.insert(colors, {['Part'] = generatedParts[302], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[302], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[302], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[302], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[302], ['Name'] = "LowerRocks"})
end
if generatedParts[303] then
    table.insert(resizes, {['Part'] = generatedParts[303], ['CFrame'] = (origin + offset) * CFrame.new(-66.500, 27.500, -107.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(13.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[303], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[303], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[303], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[303], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[303], ['Name'] = "LowerRocks"})
end
if generatedParts[304] then
    table.insert(resizes, {['Part'] = generatedParts[304], ['CFrame'] = (origin + offset) * CFrame.new(8.500, 27.500, -129.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[304], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[304], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[304], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[304], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[304], ['Name'] = "LowerRocks"})
end
if generatedParts[305] then
    table.insert(resizes, {['Part'] = generatedParts[305], ['CFrame'] = (origin + offset) * CFrame.new(-64.500, 44.200, 90.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(31.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[305], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[305], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[305], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[305], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[305], ['Name'] = "Grass"})
end
if generatedParts[306] then
    table.insert(resizes, {['Part'] = generatedParts[306], ['CFrame'] = (origin + offset) * CFrame.new(-81.500, 27.500, -99.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[306], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[306], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[306], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[306], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[306], ['Name'] = "LowerRocks"})
end
if generatedParts[307] then
    table.insert(resizes, {['Part'] = generatedParts[307], ['CFrame'] = (origin + offset) * CFrame.new(-114.500, 16.500, 89.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 17.000)})
    table.insert(colors, {['Part'] = generatedParts[307], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[307], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[307], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[307], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[307], ['Name'] = "LowerRocks"})
end
if generatedParts[308] then
    table.insert(resizes, {['Part'] = generatedParts[308], ['CFrame'] = (origin + offset) * CFrame.new(49.500, 16.500, -125.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 19.000)})
    table.insert(colors, {['Part'] = generatedParts[308], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[308], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[308], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[308], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[308], ['Name'] = "LowerRocks"})
end
if generatedParts[309] then
    table.insert(resizes, {['Part'] = generatedParts[309], ['CFrame'] = (origin + offset) * CFrame.new(1.000, 44.200, -93.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(8.000, 0.400, 144.000)})
    table.insert(colors, {['Part'] = generatedParts[309], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[309], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[309], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[309], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[309], ['Name'] = "Grass"})
end
if generatedParts[310] then
    table.insert(resizes, {['Part'] = generatedParts[310], ['CFrame'] = (origin + offset) * CFrame.new(21.500, 38.500, -70.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(120.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[310], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[310], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[310], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[310], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[310], ['Name'] = "Part"})
end
if generatedParts[311] then
    table.insert(resizes, {['Part'] = generatedParts[311], ['CFrame'] = (origin + offset) * CFrame.new(-105.500, 44.200, -38.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(39.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[311], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[311], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[311], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[311], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[311], ['Name'] = "Grass"})
end
if generatedParts[312] then
    table.insert(resizes, {['Part'] = generatedParts[312], ['CFrame'] = (origin + offset) * CFrame.new(-119.500, 27.500, -56.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 27.000)})
    table.insert(colors, {['Part'] = generatedParts[312], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[312], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[312], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[312], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[312], ['Name'] = "LowerRocks"})
end
if generatedParts[313] then
    table.insert(resizes, {['Part'] = generatedParts[313], ['CFrame'] = (origin + offset) * CFrame.new(-76.500, 16.500, 116.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(13.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[313], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[313], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[313], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[313], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[313], ['Name'] = "LowerRocks"})
end
if generatedParts[314] then
    table.insert(resizes, {['Part'] = generatedParts[314], ['CFrame'] = (origin + offset) * CFrame.new(-83.500, 38.500, 47.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(105.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[314], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[314], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[314], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[314], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[314], ['Name'] = "Part"})
end
if generatedParts[315] then
    table.insert(resizes, {['Part'] = generatedParts[315], ['CFrame'] = (origin + offset) * CFrame.new(60.000, 38.500, 44.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(108.000, 11.000, 26.000)})
    table.insert(colors, {['Part'] = generatedParts[315], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[315], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[315], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[315], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[315], ['Name'] = "Part"})
end
if generatedParts[316] then
    table.insert(resizes, {['Part'] = generatedParts[316], ['CFrame'] = (origin + offset) * CFrame.new(-116.000, 44.200, 2.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(60.000, 0.400, 7.000)})
    table.insert(colors, {['Part'] = generatedParts[316], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[316], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[316], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[316], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[316], ['Name'] = "Grass"})
end
if generatedParts[317] then
    table.insert(resizes, {['Part'] = generatedParts[317], ['CFrame'] = (origin + offset) * CFrame.new(84.000, 38.500, -77.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(20.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[317], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[317], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[317], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[317], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[317], ['Name'] = "Part"})
end
if generatedParts[318] then
    table.insert(resizes, {['Part'] = generatedParts[318], ['CFrame'] = (origin + offset) * CFrame.new(94.000, 38.500, -32.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(40.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[318], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[318], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[318], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[318], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[318], ['Name'] = "Part"})
end
if generatedParts[319] then
    table.insert(resizes, {['Part'] = generatedParts[319], ['CFrame'] = (origin + offset) * CFrame.new(121.500, 27.500, 15.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[319], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[319], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[319], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[319], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[319], ['Name'] = "LowerRocks"})
end
if generatedParts[320] then
    table.insert(resizes, {['Part'] = generatedParts[320], ['CFrame'] = (origin + offset) * CFrame.new(39.500, 27.500, -121.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(13.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[320], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[320], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[320], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[320], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[320], ['Name'] = "LowerRocks"})
end
if generatedParts[321] then
    table.insert(resizes, {['Part'] = generatedParts[321], ['CFrame'] = (origin + offset) * CFrame.new(-114.000, 44.200, 13.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(56.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[321], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[321], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[321], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[321], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[321], ['Name'] = "Grass"})
end
if generatedParts[322] then
    table.insert(resizes, {['Part'] = generatedParts[322], ['CFrame'] = (origin + offset) * CFrame.new(-121.500, 27.500, 71.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(14.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[322], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[322], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[322], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[322], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[322], ['Name'] = "LowerRocks"})
end
if generatedParts[323] then
    table.insert(resizes, {['Part'] = generatedParts[323], ['CFrame'] = (origin + offset) * CFrame.new(82.500, 27.500, -104.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[323], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[323], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[323], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[323], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[323], ['Name'] = "LowerRocks"})
end
if generatedParts[324] then
    table.insert(resizes, {['Part'] = generatedParts[324], ['CFrame'] = (origin + offset) * CFrame.new(-17.000, 44.200, -106.000, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(18.000, 0.400, 12.000)})
    table.insert(colors, {['Part'] = generatedParts[324], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[324], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[324], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[324], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[324], ['Name'] = "Grass"})
end
if generatedParts[325] then
    table.insert(resizes, {['Part'] = generatedParts[325], ['CFrame'] = (origin + offset) * CFrame.new(-107.500, 44.200, 57.000, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(12.000, 0.400, 43.000)})
    table.insert(colors, {['Part'] = generatedParts[325], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[325], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[325], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[325], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[325], ['Name'] = "Grass"})
end
if generatedParts[326] then
    table.insert(resizes, {['Part'] = generatedParts[326], ['CFrame'] = (origin + offset) * CFrame.new(-8.500, 38.500, 58.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(137.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[326], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[326], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[326], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[326], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[326], ['Name'] = "Part"})
end
if generatedParts[327] then
    table.insert(resizes, {['Part'] = generatedParts[327], ['CFrame'] = (origin + offset) * CFrame.new(116.500, 16.500, -56.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[327], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[327], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[327], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[327], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[327], ['Name'] = "LowerRocks"})
end
if generatedParts[328] then
    table.insert(resizes, {['Part'] = generatedParts[328], ['CFrame'] = (origin + offset) * CFrame.new(-88.500, 27.500, 105.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[328], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[328], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[328], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[328], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[328], ['Name'] = "LowerRocks"})
end
if generatedParts[329] then
    table.insert(resizes, {['Part'] = generatedParts[329], ['CFrame'] = (origin + offset) * CFrame.new(85.500, 27.500, 84.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[329], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[329], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[329], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[329], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[329], ['Name'] = "LowerRocks"})
end
if generatedParts[330] then
    table.insert(resizes, {['Part'] = generatedParts[330], ['CFrame'] = (origin + offset) * CFrame.new(93.000, 38.500, 57.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(18.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[330], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[330], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[330], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[330], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[330], ['Name'] = "Part"})
end
if generatedParts[331] then
    table.insert(resizes, {['Part'] = generatedParts[331], ['CFrame'] = (origin + offset) * CFrame.new(-147.500, 16.500, -24.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[331], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[331], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[331], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[331], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[331], ['Name'] = "LowerRocks"})
end
if generatedParts[332] then
    table.insert(resizes, {['Part'] = generatedParts[332], ['CFrame'] = (origin + offset) * CFrame.new(31.500, 44.200, -107.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(21.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[332], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[332], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[332], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[332], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[332], ['Name'] = "Grass"})
end
if generatedParts[333] then
    table.insert(resizes, {['Part'] = generatedParts[333], ['CFrame'] = (origin + offset) * CFrame.new(-80.000, 38.500, -42.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(98.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[333], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[333], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[333], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[333], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[333], ['Name'] = "Part"})
end
if generatedParts[334] then
    table.insert(resizes, {['Part'] = generatedParts[334], ['CFrame'] = (origin + offset) * CFrame.new(20.500, 44.200, 95.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(41.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[334], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[334], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[334], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[334], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[334], ['Name'] = "Grass"})
end
if generatedParts[335] then
    table.insert(resizes, {['Part'] = generatedParts[335], ['CFrame'] = (origin + offset) * CFrame.new(-87.000, 38.500, -12.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(112.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[335], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[335], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[335], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[335], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[335], ['Name'] = "Part"})
end
if generatedParts[336] then
    table.insert(resizes, {['Part'] = generatedParts[336], ['CFrame'] = (origin + offset) * CFrame.new(-73.500, 38.500, 79.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 85.000)})
    table.insert(colors, {['Part'] = generatedParts[336], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[336], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[336], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[336], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[336], ['Name'] = "Part"})
end
if generatedParts[337] then
    table.insert(resizes, {['Part'] = generatedParts[337], ['CFrame'] = (origin + offset) * CFrame.new(-28.500, 27.500, 128.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[337], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[337], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[337], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[337], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[337], ['Name'] = "LowerRocks"})
end
if generatedParts[338] then
    table.insert(resizes, {['Part'] = generatedParts[338], ['CFrame'] = (origin + offset) * CFrame.new(85.500, 44.200, 53.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(25.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[338], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[338], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[338], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[338], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[338], ['Name'] = "Grass"})
end
if generatedParts[339] then
    table.insert(resizes, {['Part'] = generatedParts[339], ['CFrame'] = (origin + offset) * CFrame.new(-82.000, 38.500, 60.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 102.000)})
    table.insert(colors, {['Part'] = generatedParts[339], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[339], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[339], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[339], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[339], ['Name'] = "Part"})
end
if generatedParts[340] then
    table.insert(resizes, {['Part'] = generatedParts[340], ['CFrame'] = (origin + offset) * CFrame.new(-103.000, 44.200, 66.500, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(7.000, 0.400, 34.000)})
    table.insert(colors, {['Part'] = generatedParts[340], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[340], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[340], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[340], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[340], ['Name'] = "Grass"})
end
if generatedParts[341] then
    table.insert(resizes, {['Part'] = generatedParts[341], ['CFrame'] = (origin + offset) * CFrame.new(95.000, 44.200, 1.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(44.000, 0.400, 14.000)})
    table.insert(colors, {['Part'] = generatedParts[341], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[341], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[341], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[341], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[341], ['Name'] = "Grass"})
end
if generatedParts[342] then
    table.insert(resizes, {['Part'] = generatedParts[342], ['CFrame'] = (origin + offset) * CFrame.new(93.500, 16.500, 87.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[342], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[342], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[342], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[342], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[342], ['Name'] = "LowerRocks"})
end
if generatedParts[343] then
    table.insert(resizes, {['Part'] = generatedParts[343], ['CFrame'] = (origin + offset) * CFrame.new(103.500, 38.500, 12.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(39.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[343], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[343], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[343], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[343], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[343], ['Name'] = "Part"})
end
if generatedParts[344] then
    table.insert(resizes, {['Part'] = generatedParts[344], ['CFrame'] = (origin + offset) * CFrame.new(100.500, 16.500, -86.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(13.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[344], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[344], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[344], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[344], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[344], ['Name'] = "LowerRocks"})
end
if generatedParts[345] then
    table.insert(resizes, {['Part'] = generatedParts[345], ['CFrame'] = (origin + offset) * CFrame.new(77.000, 44.200, -89.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(8.000, 0.400, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[345], ['Color'] = Color3.new(0.157, 0.498, 0.278), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[345], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[345], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[345], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[345], ['Name'] = "Grass"})
end
if generatedParts[346] then
    table.insert(resizes, {['Part'] = generatedParts[346], ['CFrame'] = (origin + offset) * CFrame.new(-76.000, 38.500, -55.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 90.000)})
    table.insert(colors, {['Part'] = generatedParts[346], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[346], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[346], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[346], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[346], ['Name'] = "Part"})
end
if generatedParts[347] then
    table.insert(resizes, {['Part'] = generatedParts[347], ['CFrame'] = (origin + offset) * CFrame.new(106.500, 27.500, -59.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[347], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[347], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[347], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[347], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[347], ['Name'] = "LowerRocks"})
end
if generatedParts[348] then
    table.insert(resizes, {['Part'] = generatedParts[348], ['CFrame'] = (origin + offset) * CFrame.new(-159.500, 16.500, 5.500, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[348], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[348], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[348], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[348], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[348], ['Name'] = "LowerRocks"})
end
if generatedParts[349] then
    table.insert(resizes, {['Part'] = generatedParts[349], ['CFrame'] = (origin + offset) * CFrame.new(-83.500, 38.500, -88.500, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[349], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[349], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[349], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[349], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[349], ['Name'] = "Part"})
end
if generatedParts[350] then
    table.insert(resizes, {['Part'] = generatedParts[350], ['CFrame'] = (origin + offset) * CFrame.new(-100.500, 16.500, -91.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(11.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[350], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[350], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[350], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[350], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[350], ['Name'] = "LowerRocks"})
end
if generatedParts[351] then
    table.insert(resizes, {['Part'] = generatedParts[351], ['CFrame'] = (origin + offset) * CFrame.new(-86.000, 38.500, 32.500, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(110.000, 11.000, 15.000)})
    table.insert(colors, {['Part'] = generatedParts[351], ['Color'] = Color3.new(0.412, 0.251, 0.157), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[351], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[351], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[351], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[351], ['Name'] = "Part"})
end
if generatedParts[352] then
    table.insert(resizes, {['Part'] = generatedParts[352], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 200.548, 339.681, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(4.500, 4.500, 4.500)})
    table.insert(colors, {['Part'] = generatedParts[352], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[352], ['Material'] = Enum.Material.Marble, ['Transparency'] = 0.500, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[352], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[352], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[352], ['Name'] = "Globe"})
end
if generatedParts[353] then
    table.insert(resizes, {['Part'] = generatedParts[353], ['CFrame'] = (origin + offset) * CFrame.new(-333.324, 191.700, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.600, 3.600, 3.600)})
    table.insert(colors, {['Part'] = generatedParts[353], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[353], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[353], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[353], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[353], ['Name'] = "Part"})
end
if generatedParts[354] then
    table.insert(resizes, {['Part'] = generatedParts[354], ['CFrame'] = (origin + offset) * CFrame.new(-336.603, 196.349, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.100, 1.200, 1.200)})
    table.insert(colors, {['Part'] = generatedParts[354], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[354], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[354], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[354], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[354], ['Name'] = "Part"})
end
if generatedParts[355] then
    table.insert(resizes, {['Part'] = generatedParts[355], ['CFrame'] = (origin + offset) * CFrame.new(-333.324, 196.349, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.100, 1.200, 1.200)})
    table.insert(colors, {['Part'] = generatedParts[355], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[355], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[355], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[355], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[355], ['Name'] = "Part"})
end
if generatedParts[356] then
    table.insert(resizes, {['Part'] = generatedParts[356], ['CFrame'] = (origin + offset) * CFrame.new(-334.964, 191.701, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.600, 3.300, 3.600)})
    table.insert(colors, {['Part'] = generatedParts[356], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[356], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[356], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[356], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[356], ['Name'] = "Part"})
end
if generatedParts[357] then
    table.insert(resizes, {['Part'] = generatedParts[357], ['CFrame'] = (origin + offset) * CFrame.new(-334.964, 195.599, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.600, 3.300, 3.600)})
    table.insert(colors, {['Part'] = generatedParts[357], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[357], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[357], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[357], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[357], ['Name'] = "Part"})
end
if generatedParts[358] then
    table.insert(resizes, {['Part'] = generatedParts[358], ['CFrame'] = (origin + offset) * CFrame.new(-333.324, 193.650, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(3.300, 3.000, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[358], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[358], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[358], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[358], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[358], ['Name'] = "Part"})
end
if generatedParts[359] then
    table.insert(resizes, {['Part'] = generatedParts[359], ['CFrame'] = (origin + offset) * CFrame.new(-333.324, 195.599, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.600, 3.600, 3.600)})
    table.insert(colors, {['Part'] = generatedParts[359], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[359], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[359], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[359], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[359], ['Name'] = "Part"})
end
if generatedParts[360] then
    table.insert(resizes, {['Part'] = generatedParts[360], ['CFrame'] = (origin + offset) * CFrame.new(-333.324, 195.899, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(3.000, 3.000, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[360], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[360], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[360], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[360], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[360], ['Name'] = "Part"})
end
if generatedParts[361] then
    table.insert(resizes, {['Part'] = generatedParts[361], ['CFrame'] = (origin + offset) * CFrame.new(-336.603, 195.899, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(3.000, 3.000, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[361], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[361], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[361], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[361], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[361], ['Name'] = "Part"})
end
if generatedParts[362] then
    table.insert(resizes, {['Part'] = generatedParts[362], ['CFrame'] = (origin + offset) * CFrame.new(-336.603, 191.700, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.600, 3.600, 3.600)})
    table.insert(colors, {['Part'] = generatedParts[362], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[362], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[362], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[362], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[362], ['Name'] = "Part"})
end
if generatedParts[363] then
    table.insert(resizes, {['Part'] = generatedParts[363], ['CFrame'] = (origin + offset) * CFrame.new(-336.603, 195.599, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.600, 3.600, 3.600)})
    table.insert(colors, {['Part'] = generatedParts[363], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[363], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[363], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[363], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[363], ['Name'] = "Part"})
end
if generatedParts[364] then
    table.insert(resizes, {['Part'] = generatedParts[364], ['CFrame'] = (origin + offset) * CFrame.new(-336.603, 193.650, 346.832, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(3.300, 3.000, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[364], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[364], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[364], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[364], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[364], ['Name'] = "Part"})
end
if generatedParts[365] then
    table.insert(resizes, {['Part'] = generatedParts[365], ['CFrame'] = (origin + offset) * CFrame.new(-339.434, 196.799, 343.405, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.800, 1.500, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[365], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[365], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[365], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[365], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[365], ['Name'] = "Part"})
end
if generatedParts[366] then
    table.insert(resizes, {['Part'] = generatedParts[366], ['CFrame'] = (origin + offset) * CFrame.new(-338.689, 194.400, 343.405, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.500, 1.500, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[366], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[366], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[366], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[366], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[366], ['Name'] = "Part"})
end
if generatedParts[367] then
    table.insert(resizes, {['Part'] = generatedParts[367], ['CFrame'] = (origin + offset) * CFrame.new(-339.434, 194.400, 343.405, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.500, 1.500, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[367], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[367], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[367], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[367], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[367], ['Name'] = "Part"})
end
if generatedParts[368] then
    table.insert(resizes, {['Part'] = generatedParts[368], ['CFrame'] = (origin + offset) * CFrame.new(-339.435, 195.899, 340.425, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.500, 1.500, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[368], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[368], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[368], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[368], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[368], ['Name'] = "Part"})
end
if generatedParts[369] then
    table.insert(resizes, {['Part'] = generatedParts[369], ['CFrame'] = (origin + offset) * CFrame.new(-338.689, 195.899, 340.425, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(1.500, 1.500, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[369], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[369], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[369], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[369], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[369], ['Name'] = "Part"})
end
if generatedParts[370] then
    table.insert(resizes, {['Part'] = generatedParts[370], ['CFrame'] = (origin + offset) * CFrame.new(-339.435, 198.299, 340.425, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(4.800, 1.500, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[370], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[370], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[370], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[370], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[370], ['Name'] = "Part"})
end
if generatedParts[371] then
    table.insert(resizes, {['Part'] = generatedParts[371], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 194.400, 332.877, -0.865, -0.002, -0.502, -0.435, 0.501, 0.748, 0.250, 0.865, -0.435), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[371], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[371], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[371], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[371], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[371], ['Name'] = "Part"})
end
if generatedParts[372] then
    table.insert(resizes, {['Part'] = generatedParts[372], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 194.400, 335.457, -0.865, 0.002, -0.502, 0.435, 0.501, -0.748, 0.250, -0.865, -0.435), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[372], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[372], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[372], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[372], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[372], ['Name'] = "Part"})
end
if generatedParts[373] then
    table.insert(resizes, {['Part'] = generatedParts[373], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 195.899, 335.457, 0.865, 0.002, -0.502, -0.435, 0.501, -0.748, 0.250, 0.865, 0.435), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[373], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[373], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[373], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[373], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[373], ['Name'] = "Part"})
end
if generatedParts[374] then
    table.insert(resizes, {['Part'] = generatedParts[374], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 196.448, 333.421, 0.866, -0.002, -0.501, 0.252, 0.867, 0.431, 0.433, -0.499, 0.751), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[374], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[374], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[374], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[374], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[374], ['Name'] = "Part"})
end
if generatedParts[375] then
    table.insert(resizes, {['Part'] = generatedParts[375], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 195.150, 335.657, -0.865, -0.000, -0.502, 0.502, -0.000, -0.865, -0.000, -1.000, 0.000), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[375], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[375], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[375], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[375], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[375], ['Name'] = "Part"})
end
if generatedParts[376] then
    table.insert(resizes, {['Part'] = generatedParts[376], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 193.650, 334.166, -0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, -0.866), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[376], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[376], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[376], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[376], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[376], ['Name'] = "Part"})
end
if generatedParts[377] then
    table.insert(resizes, {['Part'] = generatedParts[377], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 196.448, 334.911, 0.866, 0.002, -0.501, -0.252, 0.867, -0.431, 0.433, 0.499, 0.751), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[377], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[377], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[377], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[377], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[377], ['Name'] = "Part"})
end
if generatedParts[378] then
    table.insert(resizes, {['Part'] = generatedParts[378], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 193.851, 334.911, -0.866, 0.002, -0.501, 0.252, 0.867, -0.431, 0.433, -0.499, -0.751), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[378], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[378], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[378], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[378], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[378], ['Name'] = "Part"})
end
if generatedParts[379] then
    table.insert(resizes, {['Part'] = generatedParts[379], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 195.150, 332.677, 0.865, -0.000, -0.502, 0.502, 0.000, 0.865, 0.000, -1.000, 0.000), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[379], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[379], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[379], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[379], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[379], ['Name'] = "Part"})
end
if generatedParts[380] then
    table.insert(resizes, {['Part'] = generatedParts[380], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 196.649, 334.166, 0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, 0.866), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[380], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[380], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[380], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[380], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[380], ['Name'] = "Part"})
end
if generatedParts[381] then
    table.insert(resizes, {['Part'] = generatedParts[381], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 195.899, 332.877, 0.865, -0.002, -0.502, 0.435, 0.501, 0.748, 0.250, -0.865, 0.435), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[381], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[381], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[381], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[381], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[381], ['Name'] = "Part"})
end
if generatedParts[382] then
    table.insert(resizes, {['Part'] = generatedParts[382], ['CFrame'] = (origin + offset) * CFrame.new(-333.175, 193.851, 333.421, -0.866, -0.002, -0.501, -0.252, 0.867, 0.431, 0.433, 0.499, -0.751), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[382], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[382], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[382], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[382], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[382], ['Name'] = "Part"})
end
if generatedParts[383] then
    table.insert(resizes, {['Part'] = generatedParts[383], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 193.650, 334.166, -0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, -0.866), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[383], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[383], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[383], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[383], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[383], ['Name'] = "Part"})
end
if generatedParts[384] then
    table.insert(resizes, {['Part'] = generatedParts[384], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 196.649, 334.166, 0.866, 0.000, -0.500, 0.000, 1.000, 0.000, 0.500, 0.000, 0.866), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[384], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[384], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[384], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[384], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[384], ['Name'] = "Part"})
end
if generatedParts[385] then
    table.insert(resizes, {['Part'] = generatedParts[385], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 196.448, 334.911, 0.866, 0.002, -0.501, -0.252, 0.867, -0.431, 0.433, 0.499, 0.751), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[385], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[385], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[385], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[385], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[385], ['Name'] = "Part"})
end
if generatedParts[386] then
    table.insert(resizes, {['Part'] = generatedParts[386], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 195.899, 335.458, 0.865, 0.002, -0.502, -0.435, 0.501, -0.748, 0.250, 0.865, 0.435), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[386], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[386], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[386], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[386], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[386], ['Name'] = "Part"})
end
if generatedParts[387] then
    table.insert(resizes, {['Part'] = generatedParts[387], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 195.150, 332.677, 0.865, -0.000, -0.502, 0.502, 0.000, 0.865, 0.000, -1.000, 0.000), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[387], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[387], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[387], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[387], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[387], ['Name'] = "Part"})
end
if generatedParts[388] then
    table.insert(resizes, {['Part'] = generatedParts[388], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 194.400, 332.877, -0.865, -0.002, -0.502, -0.435, 0.501, 0.748, 0.250, 0.865, -0.435), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[388], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[388], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[388], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[388], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[388], ['Name'] = "Part"})
end
if generatedParts[389] then
    table.insert(resizes, {['Part'] = generatedParts[389], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 195.150, 335.657, -0.865, -0.000, -0.502, 0.502, -0.000, -0.865, -0.000, -1.000, 0.000), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[389], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[389], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[389], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[389], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[389], ['Name'] = "Part"})
end
if generatedParts[390] then
    table.insert(resizes, {['Part'] = generatedParts[390], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 194.400, 335.458, -0.865, 0.002, -0.502, 0.435, 0.501, -0.748, 0.250, -0.865, -0.435), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[390], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[390], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[390], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[390], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[390], ['Name'] = "Part"})
end
if generatedParts[391] then
    table.insert(resizes, {['Part'] = generatedParts[391], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 195.899, 332.877, 0.865, -0.002, -0.502, 0.435, 0.501, 0.748, 0.250, -0.865, 0.435), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[391], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[391], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[391], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[391], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[391], ['Name'] = "Part"})
end
if generatedParts[392] then
    table.insert(resizes, {['Part'] = generatedParts[392], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 193.851, 334.911, -0.866, 0.002, -0.501, 0.252, 0.867, -0.431, 0.433, -0.499, -0.751), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[392], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[392], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[392], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[392], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[392], ['Name'] = "Part"})
end
if generatedParts[393] then
    table.insert(resizes, {['Part'] = generatedParts[393], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 193.851, 333.421, -0.866, -0.002, -0.501, -0.252, 0.867, 0.431, 0.433, 0.499, -0.751), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[393], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[393], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[393], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[393], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[393], ['Name'] = "Part"})
end
if generatedParts[394] then
    table.insert(resizes, {['Part'] = generatedParts[394], ['CFrame'] = (origin + offset) * CFrame.new(-337.347, 196.448, 333.421, 0.866, -0.002, -0.501, 0.252, 0.867, 0.431, 0.433, -0.499, 0.751), ['Size'] = Vector3.new(1.500, 3.300, 0.300)})
    table.insert(colors, {['Part'] = generatedParts[394], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[394], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[394], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[394], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[394], ['Name'] = "Part"})
end
if generatedParts[395] then
    table.insert(resizes, {['Part'] = generatedParts[395], ['CFrame'] = (origin + offset) * CFrame.new(-335.262, 195.150, 334.166, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000, 0.000, -1.000, 0.000), ['Size'] = Vector3.new(6.300, 0.900, 0.900)})
    table.insert(colors, {['Part'] = generatedParts[395], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[395], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[395], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[395], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[395], ['Name'] = "Part"})
end
if generatedParts[396] then
    table.insert(resizes, {['Part'] = generatedParts[396], ['CFrame'] = (origin + offset) * CFrame.new(-335.262, 195.150, 334.166, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000, 0.000, -1.000, 0.000), ['Size'] = Vector3.new(5.700, 1.500, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[396], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[396], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[396], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[396], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[396], ['Name'] = "Part"})
end
if generatedParts[397] then
    table.insert(resizes, {['Part'] = generatedParts[397], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 191.851, 335.210, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.600, 0.900, 1.800)})
    table.insert(colors, {['Part'] = generatedParts[397], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[397], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[397], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[397], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[397], ['Name'] = "Wedge"})
end
if generatedParts[398] then
    table.insert(resizes, {['Part'] = generatedParts[398], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 198.149, 336.701, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(5.400, 0.900, 2.400)})
    table.insert(colors, {['Part'] = generatedParts[398], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[398], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[398], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[398], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[398], ['Name'] = "Wedge"})
end
if generatedParts[399] then
    table.insert(resizes, {['Part'] = generatedParts[399], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 192.150, 341.171, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(9.000, 1.500, 6.600)})
    table.insert(colors, {['Part'] = generatedParts[399], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[399], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[399], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[399], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[399], ['Name'] = "Part"})
end
if generatedParts[400] then
    table.insert(resizes, {['Part'] = generatedParts[400], ['CFrame'] = (origin + offset) * CFrame.new(-333.324, 197.099, 344.598, 0.000, 0.000, -1.000, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000), ['Size'] = Vector3.new(1.500, 1.500, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[400], ['Color'] = Color3.new(0.706, 0.824, 0.894), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[400], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.300, ['Reflectance'] = 0.300})
    table.insert(anchors, {['Part'] = generatedParts[400], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[400], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[400], ['Name'] = "Tube2"})
end
if generatedParts[401] then
    table.insert(resizes, {['Part'] = generatedParts[401], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 194.850, 341.171, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(3.900, 6.000, 8.400)})
    table.insert(colors, {['Part'] = generatedParts[401], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[401], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[401], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[401], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[401], ['Name'] = "MainPart"})
end
if generatedParts[402] then
    table.insert(resizes, {['Part'] = generatedParts[402], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 195.150, 334.166, 1.000, 0.000, 0.000, 0.000, 0.000, 1.000, 0.000, -1.000, 0.000), ['Size'] = Vector3.new(3.400, 6.300, 6.300)})
    table.insert(colors, {['Part'] = generatedParts[402], ['Color'] = Color3.new(0.106, 0.165, 0.208), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[402], ['Material'] = Enum.Material.Neon, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[402], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[402], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[402], ['Name'] = "EngineColor"})
end
if generatedParts[403] then
    table.insert(resizes, {['Part'] = generatedParts[403], ['CFrame'] = (origin + offset) * CFrame.new(-333.323, 196.949, 342.511, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.100, 1.200, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[403], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[403], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[403], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[403], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[403], ['Name'] = "Part"})
end
if generatedParts[404] then
    table.insert(resizes, {['Part'] = generatedParts[404], ['CFrame'] = (origin + offset) * CFrame.new(-336.603, 197.099, 344.598, 0.000, 0.000, -1.000, 1.000, 0.000, 0.000, 0.000, -1.000, 0.000), ['Size'] = Vector3.new(1.500, 1.500, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[404], ['Color'] = Color3.new(0.706, 0.824, 0.894), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[404], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 0.300, ['Reflectance'] = 0.300})
    table.insert(anchors, {['Part'] = generatedParts[404], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[404], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[404], ['Name'] = "Tube1"})
end
if generatedParts[405] then
    table.insert(resizes, {['Part'] = generatedParts[405], ['CFrame'] = (origin + offset) * CFrame.new(-336.603, 196.949, 342.511, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.100, 1.200, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[405], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[405], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[405], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[405], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[405], ['Name'] = "Part"})
end
if generatedParts[406] then
    table.insert(resizes, {['Part'] = generatedParts[406], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 197.249, 344.916, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 0.900, 0.900)})
    table.insert(colors, {['Part'] = generatedParts[406], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[406], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[406], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[406], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[406], ['Name'] = "Wedge"})
end
if generatedParts[407] then
    table.insert(resizes, {['Part'] = generatedParts[407], ['CFrame'] = (origin + offset) * CFrame.new(-330.501, 195.543, 341.171, 0.000, -0.779, 0.627, 0.000, 0.627, 0.779, -1.000, -0.000, 0.000), ['Size'] = Vector3.new(6.200, 3.800, 0.600)})
    table.insert(colors, {['Part'] = generatedParts[407], ['Color'] = Color3.new(0.898, 0.894, 0.875), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[407], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[407], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[407], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[407], ['Name'] = "Button"})
end
if generatedParts[408] then
    table.insert(resizes, {['Part'] = generatedParts[408], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 192.450, 335.508, -1.000, 0.000, -0.000, 0.000, 0.000, -1.000, 0.000, -1.000, -0.000), ['Size'] = Vector3.new(6.000, 3.000, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[408], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[408], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[408], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[408], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[408], ['Name'] = "Wedge"})
end
if generatedParts[409] then
    table.insert(resizes, {['Part'] = generatedParts[409], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 197.999, 336.253, -1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(6.000, 0.600, 1.500)})
    table.insert(colors, {['Part'] = generatedParts[409], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[409], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[409], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[409], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[409], ['Name'] = "Wedge"})
end
if generatedParts[410] then
    table.insert(resizes, {['Part'] = generatedParts[410], ['CFrame'] = (origin + offset) * CFrame.new(-330.642, 195.400, 341.171, 0.000, 0.000, -1.000, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.000, 2.400, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[410], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[410], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[410], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[410], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[410], ['Name'] = "Wedge"})
end
if generatedParts[411] then
    table.insert(resizes, {['Part'] = generatedParts[411], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 192.150, 335.806, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(6.600, 1.500, 1.800)})
    table.insert(colors, {['Part'] = generatedParts[411], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[411], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[411], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[411], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[411], ['Name'] = "Wedge"})
end
if generatedParts[412] then
    table.insert(resizes, {['Part'] = generatedParts[412], ['CFrame'] = (origin + offset) * CFrame.new(-330.572, 195.535, 341.171, 0.779, 0.627, 0.000, -0.627, 0.779, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(3.300, 0.300, 5.400)})
    table.insert(colors, {['Part'] = generatedParts[412], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[412], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[412], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[412], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[412], ['Name'] = "Screen"})
end
if generatedParts[413] then
    table.insert(resizes, {['Part'] = generatedParts[413], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 197.249, 340.475, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.900, 6.000, 8.000)})
    table.insert(colors, {['Part'] = generatedParts[413], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[413], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[413], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[413], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[413], ['Name'] = "Part"})
end
if generatedParts[414] then
    table.insert(resizes, {['Part'] = generatedParts[414], ['CFrame'] = (origin + offset) * CFrame.new(-330.642, 192.900, 341.171, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(2.600, 3.000, 6.000)})
    table.insert(colors, {['Part'] = generatedParts[414], ['Color'] = Color3.new(0.992, 0.918, 0.553), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[414], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[414], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[414], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[414], ['Name'] = "Part"})
end
if generatedParts[415] then
    table.insert(resizes, {['Part'] = generatedParts[415], ['CFrame'] = (origin + offset) * CFrame.new(-330.344, 192.150, 341.171, 0.000, 0.000, 1.000, 0.000, 1.000, 0.000, -1.000, 0.000, 0.000), ['Size'] = Vector3.new(6.600, 1.500, 3.000)})
    table.insert(colors, {['Part'] = generatedParts[415], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[415], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[415], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[415], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[415], ['Name'] = "Part"})
end
if generatedParts[416] then
    table.insert(resizes, {['Part'] = generatedParts[416], ['CFrame'] = (origin + offset) * CFrame.new(-335.113, 197.849, 339.681, 0.000, 1.000, 0.000, 1.000, 0.000, 0.000, 0.000, 0.000, -1.000), ['Size'] = Vector3.new(0.300, 3.600, 3.600)})
    table.insert(colors, {['Part'] = generatedParts[416], ['Color'] = Color3.new(0.996, 0.953, 0.733), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[416], ['Material'] = Enum.Material.Metal, ['Transparency'] = 0.000, ['Reflectance'] = 0.200})
    table.insert(anchors, {['Part'] = generatedParts[416], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[416], ['CanCollide'] = true})
    table.insert(names, {['Part'] = generatedParts[416], ['Name'] = "Part"})
end
if generatedParts[417] then
    table.insert(resizes, {['Part'] = generatedParts[417], ['CFrame'] = (origin + offset) * CFrame.new(0.000, 5.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(11.000, 10.000, 11.000)})
    table.insert(colors, {['Part'] = generatedParts[417], ['Color'] = Color3.new(0.639, 0.635, 0.647), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[417], ['Material'] = Enum.Material.Plastic, ['Transparency'] = 1.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[417], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[417], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[417], ['Name'] = "WeatherDome"})
end
if generatedParts[418] then
    table.insert(resizes, {['Part'] = generatedParts[418], ['CFrame'] = (origin + offset) * CFrame.new(-2.120, 15.483, -1.461, 1.000, 0.000, 0.000, 0.000, 1.000, 0.000, 0.000, 0.000, 1.000), ['Size'] = Vector3.new(10.000, 1.000, 10.000)})
    table.insert(colors, {['Part'] = generatedParts[418], ['Color'] = Color3.new(0.051, 0.412, 0.675), ['UnionColoring'] = false})
    table.insert(materials, {['Part'] = generatedParts[418], ['Material'] = Enum.Material.Foil, ['Transparency'] = 0.000, ['Reflectance'] = 0.000})
    table.insert(anchors, {['Part'] = generatedParts[418], ['Anchored'] = true})
    table.insert(collisions, {['Part'] = generatedParts[418], ['CanCollide'] = false})
    table.insert(names, {['Part'] = generatedParts[418], ['Name'] = "WaterLevel"})
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
if generatedParts[5] then
    pcall(function() SpawnDecal(generatedParts[5], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[5], "143630310", Enum.NormalId.Front) end)
end
if generatedParts[28] then
    pcall(function() SpawnDecal(generatedParts[28], Enum.NormalId.Front) end)
    task.wait(0.15)
    pcall(function() AddDecal(generatedParts[28], "184773920", Enum.NormalId.Front) end)
end
if generatedParts[400] then
    pcall(function() AddMesh(generatedParts[400]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[400], "3270017") end)
    pcall(function() MeshResize(generatedParts[400], Vector3.new(4.575, 4.575, 4.575)) end)
    pcall(function() vect(generatedParts[400], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[404] then
    pcall(function() AddMesh(generatedParts[404]) end)
    task.wait(0.15)
    pcall(function() SetMesh(generatedParts[404], "3270017") end)
    pcall(function() MeshResize(generatedParts[404], Vector3.new(4.575, 4.575, 4.575)) end)
    pcall(function() vect(generatedParts[404], Vector3.new(0.000, 0.000, 0.000)) end)
end
if generatedParts[417] then
    pcall(function() AddMesh(generatedParts[417]) end)
    task.wait(0.15)
    pcall(function() SetMeshtype(generatedParts[417], Enum.MeshType.Head) end)
    pcall(function() MeshResize(generatedParts[417], Vector3.new(-600.000, -600.000, -600.000)) end)
    pcall(function() vect(generatedParts[417], Vector3.new(0.000, 0.000, 0.000)) end)
end
if root then root.Anchored = false end