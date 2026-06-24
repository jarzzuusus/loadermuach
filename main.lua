-- --- loader.lua (upload ini ke GitHub, raw URL masuk ke RAW_LOADER env) ---
local HttpService = game:GetService("HttpService")

local token = _G.J4RZZ_TOKEN or ""
if token == "" then
    warn("[J4rzz] Token kosong — jalanin file .lua dari Discord dulu.")
    return
end

local RAILWAY_URL = "https://balabalala-production.up.railway.app/hub"
local url    = RAILWAY_URL .. "?t=" .. token

-- encKey derived dari token, sama persis logika server
local function sha256hmacSlice(input)
    -- Roblox gak punya native HMAC, jadi encKey di-pass via _G dari getscript
    -- Server derive encKey dari token, kita terima via _G.J4RZZ_ENCKEY
    return _G.J4RZZ_ENCKEY or ""
end

local encKey = _G.J4RZZ_ENCKEY or ""
if encKey == "" then
    warn("[J4rzz] encKey kosong.")
    return
end

local ok, res = pcall(function()
    return HttpService:RequestAsync({ Url = url, Method = "GET" })
end)
if not ok then warn("[J4rzz] Request error: " .. tostring(res)) return end
if not res.Success then warn("[J4rzz] HTTP " .. res.StatusCode .. ": " .. tostring(res.Body)) return end

local function xorByte(a, b)
    local result, bit = 0, 128
    while bit > 0 do
        local ab = a >= bit and 1 or 0
        local bb = b >= bit and 1 or 0
        if ab ~= bb then result = result + bit end
        if ab == 1 then a = a - bit end
        if bb == 1 then b = b - bit end
        bit = math.floor(bit / 2)
    end
    return result
end

local function b64decode(s)
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local lkup  = {}
    for i = 1, #chars do lkup[chars:sub(i,i)] = i - 1 end
    local result, bits, val = {}, 0, 0
    for i = 1, #s do
        local c = s:sub(i,i)
        if c == "=" then break end
        val  = val * 64 + (lkup[c] or 0)
        bits = bits + 6
        if bits >= 8 then
            bits = bits - 8
            local pow = 2 ^ bits
            local byte = math.floor(val / pow) % 256
            val = val % pow
            result[#result+1] = string.char(byte)
        end
    end
    return table.concat(result)
end

local function xorDecrypt(data, key)
    local out = {}
    for i = 1, #data do
        out[i] = string.char(xorByte(data:byte(i), key:byte(((i-1) % #key) + 1)))
    end
    return table.concat(out)
end

local ok2, decrypted = pcall(function()
    return xorDecrypt(b64decode(res.Body), encKey)
end)
if not ok2 then warn("[J4rzz] Decrypt error: " .. tostring(decrypted)) return end

local fn, err = loadstring(decrypted)
if not fn then warn("[J4rzz] Loadstring error: " .. tostring(err)) return end

local ok3, err3 = pcall(fn)
if not ok3 then warn("[J4rzz] Script error: " .. tostring(err3)) end
