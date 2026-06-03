-- Создаем основу для интерфейса в защищенной зоне Roblox
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FullScreenImageGui"
-- Привязываем к CoreGui, чтобы обычные скрипты игры не могли его удалить
screenGui.Parent = game:GetService("CoreGui") 
screenGui.IgnoreGuiInset = true -- Игнорируем безопасную зону (полосу сверху)

-- Создаем саму картинку
local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "MainImage"
imageLabel.Parent = screenGui

-- Растягиваем на 100% ширины и высоты экрана
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.Position = UDim2.new(0, 0, 0, 0)

-- Убираем задний фон и рамки
imageLabel.BackgroundTransparency = 1
imageLabel.BorderSizePixel = 0

-- Ссылка на саму картинку (Замени ID на свой, если нужно)
-- Сейчас стоит стандартная заглушка
imageLabel.Image = "rbxassetid://12345678" 

-- Метод растягивания: 
-- Enum.ScaleType.Stretch - грубо растянуть (картинка может исказиться)
-- Enum.ScaleType.Crop - заполнить экран с сохранением пропорций (обрежет края)
imageLabel.ScaleType = Enum.ScaleType.Stretch

print("Картинка успешно выведена на весь экран!")
