local imageUrl = "https://img10.reactor.cc/pics/post/full/%D0%AD%D1%80%D0%BE%D1%82%D0%B8%D0%BA%D0%B0-%D1%81%D0%B8%D1%81%D1%8C%D0%BA%D0%B8-%D0%B1%D0%BE%D1%8F%D0%BD-%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B0%D0%BD%D0%B4%D1%80-%D0%A2%D0%B0%D0%BB%D1%8E%D0%BA%D0%B0-%28%D0%A4%D0%BE%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D1%84%29-4026241.png"
local fileName = "downloaded_locked_image.png"

local requestFunc = syn and syn.request or http and http.request or request
local getAssetFunc = getcustomasset or getsynasset

if not requestFunc or not getAssetFunc then
    error("Executor not supported")
end

local function downloadImage()
    local response = requestFunc({
        Url = imageUrl,
        Method = "GET"
    })
    
    if response.Success then
        writefile(fileName, response.Body)
    else
        error("Download failed")
    end
end

downloadImage()

local CoreGui = game:GetService("CoreGui")
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")

if CoreGui:FindFirstChild("TotalLockFullScreenGui") then
    CoreGui.TotalLockFullScreenGui:Destroy()
    ContextActionService:UnbindAction("FreezePlayerAction")
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TotalLockFullScreenGui"
screenGui.IgnoreGuiInset = true 
screenGui.DisplayOrder = 9999999 
screenGui.Parent = CoreGui

local inputBlocker = Instance.new("TextButton")
inputBlocker.Size = UDim2.new(1, 0, 1, 0)
inputBlocker.Position = UDim2.new(0, 0, 0, 0)
inputBlocker.BackgroundTransparency = 1 
inputBlocker.Text = ""
inputBlocker.Active = true 
inputBlocker.Parent = screenGui

local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.Position = UDim2.new(0, 0, 0, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.ScaleType = Enum.ScaleType.Stretch 
imageLabel.Image = getAssetFunc(fileName)
imageLabel.ZIndex = 2 
imageLabel.Parent = screenGui

local function freezeControls()
    return Enum.ContextActionResult.Sink 
end

ContextActionService:BindActionAtPriority(
    "FreezePlayerAction", 
    freezeControls, 
    false, 
    Enum.ContextActionPriority.High.Value, 
    unpack(Enum.KeyCode:GetEnumItems()) 
)

UserInputService.MouseBehavior = Enum.MouseBehavior.Default
