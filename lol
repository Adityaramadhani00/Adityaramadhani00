```ERROR? Benerin Sendiri```
```Config = {
Tree_ID = 8773,
TakeSeed_X = 86,
TakeSeed_Y = 1,
}

function log(x) SendVariantList({[0] = "OnTextOverlay", [1] = "`w[ `cSCRIPT xMrLucky `w] : " .. x}) LogToConsole("`w[ `cSCRIPT xMrLucky `w] : " .. x) end
function pos() return math.floor(GetLocal().pos.x / 32), math.floor(GetLocal().pos.y / 32) end
function packet(t, v, x, y) SendPacketRaw(false, {type = t, value = v, px = x, py = y, x = GetLocal().pos.x, y = GetLocal().pos.y}) end
function findItem(id) for _, v in pairs(GetObjectList()) do if v.id == id then return v end end return nil end


local function pnp(x, y , id)
pkt = {}
pkt.type = 3
pkt.value = id
pkt.x = GetLocal().pos.x
pkt.y = GetLocal().pos.y
pkt.px = GetLocal().pos.x//32
pkt.py = GetLocal().pos.y//32
SendPacketRaw(false , pkt)
end

function takeSeed()
while GetItemCount(Config.Tree_ID) == 0 do
for y = 1,54,1 do
for x = 0,99,1 do
if GetItemCount(Config.Tree_ID) > 2 then break end
local tile = GetTile(x, y)
log("Taking Seeds to Coordinate")
Sleep(200)
FindPath(Config.TakeSeed_X,Config.TakeSeed_Y,500)
Sleep(1000)
log("Go Planting Seeds")
end
plant()
end
end
end

function plant()
for y = 1,54,1 do
for x = 0,99,1 do
local tile = GetTile(x,y)
if tile.fg == 0  then
FindPath(x,y,500)
Sleep(200)
pnp(x,y,Config.Tree_ID)
Sleep(200)
takeSeed()
end
end
end
end


log("Go Planting Seeds")
while true do
takeSeed()
plant()
end
```