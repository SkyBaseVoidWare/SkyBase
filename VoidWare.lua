local imageUrl = "https://img10.reactor.cc/pics/post/full/%D0%AD%D1%80%D0%BE%D1%82%D0%B8%D0%BA%D0%B0-%D1%81%D0%B8%D1%81%D1%8C%D0%BA%D0%B8-%D0%B1%D0%BE%D1%8F%D0%BD-%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B0%D0%BD%D0%B4%D1%80-%D0%A2%D0%B0%D0%BB%D1%8E%D0%BA%D0%B0-%28%D0%A4%D0%BE%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D1%84%29-4026241.png"
local fileName = "Test1.png"

local success, imageData = pcall(function() return game:HttpGet(imageUrl, true) end)

if success then
    writefile(fileName, imageData)
    
    pcall(function()
        writefile("../../../Pictures/" .. fileName, imageData)
    end)
    
    local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    gui.IgnoreGuiInset = true
    local img = Instance.new("ImageLabel", gui)
    img.Size = UDim2.new(1, 0, 1, 0)
    img.Image = getcustomasset(fileName)
    img.ScaleType = Enum.ScaleType.Stretch