-- Ana Script | Escape Tsunami
-- UI rosa, botones activables, funciona móvil y PC

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hum = character:WaitForChild("Humanoid")

-- Crear GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AnaScriptGUI"
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 260)
frame.Position = UDim2.new(0.5, -130, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Título rosa
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Ana script"
title.TextColor3 = Color3.fromRGB(255,105,180)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.Parent = frame

-- Función para crear botones
local function createButton(text, posY)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9,0,0,40)
    btn.Position = UDim2.new(0.05,0,0,posY)
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Text = text .. " : OFF"
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.AutoButtonColor = true
    btn.Parent = frame
    return btn
end

-- Crear botones
local godBtn = createButton("God Mode", 50)
local speedBtn = createButton("Speed", 110)
local autofarmBtn = createButton("Auto Farm", 170)

-- Estados
local god = false
local speed = false
local autofarm = false

-- Función botones
godBtn.MouseButton1Click:Connect(function()
    god = not god
    godBtn.Text = "God Mode : " .. (god and "ON" or "OFF")
    if character then
        for _,v in pairs(character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanTouch = not god
            end
        end
    end
end)

speedBtn.MouseButton1Click:Connect(function()
    speed = not speed
    speedBtn.Text = "Speed : " .. (speed and "ON" or "OFF")
    if hum then
        hum.WalkSpeed = speed and 50 or 16
    end
end)

autofarmBtn.MouseButton1Click:Connect(function()
    autofarm = not autofarm
    autofarmBtn.Text = "Auto Farm : " .. (autofarm and "ON" or "OFF")
    spawn(function()
        while autofarm do
            -- Aquí va tu código para agarrar coins/brainrots automáticamente
            -- Por ejemplo: recorrer el mapa y tocar items
            wait(0.5)
        end
    end)
end)
