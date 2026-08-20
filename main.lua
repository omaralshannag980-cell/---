local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BOT_TRAVEXA_GUI"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
MainFrame.BorderColor3 = Color3.fromRGB(0,140,255)
MainFrame.BorderSizePixel = 2
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,0,40)
Title.Position = UDim2.new(0,0,0,5)
Title.BackgroundTransparency = 1
Title.Text = "BOT_TRAVEXA"
Title.TextColor3 = Color3.fromRGB(0,150,255)
Title.Font = Enum.Font.SciFi
Title.TextSize = 22
Title.Parent = MainFrame

local InputLabel = Instance.new("TextLabel")
InputLabel.Size = UDim2.new(0,100,0,30)
InputLabel.Position = UDim2.new(0.05,0,0.13,0)
InputLabel.BackgroundTransparency = 1
InputLabel.Text = "اول 3 احرف"
InputLabel.TextColor3 = Color3.fromRGB(200,200,200)
InputLabel.Font = Enum.Font.Gotham
InputLabel.TextSize = 13
InputLabel.Parent = MainFrame

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(0,90,0,32)
Input.Position = UDim2.new(0.32,0,0.12,0)
Input.BackgroundColor3 = Color3.fromRGB(30,30,30)
Input.BorderColor3 = Color3.fromRGB(0,140,255)
Input.BorderSizePixel = 2
Input.Text = ""
Input.PlaceholderText = "abc"
Input.TextColor3 = Color3.fromRGB(255,255,255)
Input.Font = Enum.Font.Gotham
Input.TextSize = 15
Input.Parent = MainFrame

local AddButton = Instance.new("TextButton")
AddButton.Size = UDim2.new(0,70,0,32)
AddButton.Position = UDim2.new(0.58,0,0.12,0)
AddButton.BackgroundColor3 = Color3.fromRGB(0,120,255)
AddButton.BorderColor3 = Color3.fromRGB(0,80,180)
AddButton.BorderSizePixel = 2
AddButton.Text = "ابداء"
AddButton.TextColor3 = Color3.fromRGB(255,255,255)
AddButton.Font = Enum.Font.GothamBold
AddButton.TextSize = 14
AddButton.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0,100,0,20)
StatusLabel.Position = UDim2.new(0.75,0,0.15,0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255,100,100)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.Parent = MainFrame

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1,-20,1,-90)
ScrollFrame.Position = UDim2.new(0,10,0,80)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
ScrollFrame.BorderColor3 = Color3.fromRGB(0,140,255)
ScrollFrame.BorderSizePixel = 1
ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollFrame.CanvasSize = UDim2.new(0,0,0,0)
ScrollFrame.ScrollBarThickness = 8
ScrollFrame.ClipsDescendants = true
ScrollFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0,5)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0,50,0,50)
ToggleButton.Position = UDim2.new(1,-65,0,10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
ToggleButton.BorderColor3 = Color3.fromRGB(255,255,255)
ToggleButton.BorderSizePixel = 1
ToggleButton.Text = "T"
ToggleButton.TextColor3 = Color3.fromRGB(255,255,255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 24
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1,0)
Corner.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local trackedEntries = {}

local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local mins = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    return string.format("%02d:%02d:%02d", hours, mins, secs)
end

local function updateEntryUI(entry)
    entry.NameLabel.Text = entry.Player.Name
    entry.ExitLabel.Text = "خروج: " .. entry.ExitCount
    entry.EntryLabel.Text = "دخول: " .. entry.EntryCount
    entry.TimerLabel.Text = "وقت: " .. formatTime(entry.TotalTime)
end

local function updateCanvasSize()
    local totalHeight = 0
    for _, _ in ipairs(trackedEntries) do
        totalHeight = totalHeight + 75 + 5 -- ارتفاع العنصر + المسافة
    end
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

local function removeEntry(entry)
    if entry.CharAddedConn then entry.CharAddedConn:Disconnect() end
    if entry.CharRemovingConn then entry.CharRemovingConn:Disconnect() end
    if entry.GuiFrame then entry.GuiFrame:Destroy() end
    for i,e in ipairs(trackedEntries) do
        if e == entry then
            table.remove(trackedEntries, i)
            break
        end
    end
    updateCanvasSize()
end

local function createEntry(player)
    for _, existing in ipairs(trackedEntries) do
        if existing.Player == player then return end
    end

    local entry = {
        Player = player,
        ExitCount = 0,
        EntryCount = 0,
        TotalTime = 0,
        IsInside = false,
        LastTick = 0,
        CharAddedConn = nil,
        CharRemovingConn = nil,
        GuiFrame = nil,
        NameLabel = nil,
        ExitLabel = nil,
        EntryLabel = nil,
        TimerLabel = nil,
        Avatar = nil
    }

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1,-10,0,75)
    frame.LayoutOrder = #trackedEntries + 1
    frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    frame.BorderColor3 = Color3.fromRGB(0,140,255)
    frame.BorderSizePixel = 1
    frame.Parent = ScrollFrame

    local avatar = Instance.new("ImageLabel")
    avatar.Size = UDim2.new(0,50,0,50)
    avatar.Position = UDim2.new(0.02,0,0.15,0)
    avatar.BackgroundTransparency = 1
    avatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    avatar.Parent = frame

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(0,90,0,20)
    nameLabel.Position = UDim2.new(0.18,0,0.05,0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.fromRGB(255,255,255)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 14
    nameLabel.Parent = frame

    local exitLabel = Instance.new("TextLabel")
    exitLabel.Size = UDim2.new(0,70,0,20)
    exitLabel.Position = UDim2.new(0.18,0,0.4,0)
    exitLabel.BackgroundTransparency = 1
    exitLabel.Text = "خروج: 0"
    exitLabel.TextColor3 = Color3.fromRGB(255,100,100)
    exitLabel.Font = Enum.Font.GothamBold
    exitLabel.TextSize = 13
    exitLabel.Parent = frame

    local entryLabel = Instance.new("TextLabel")
    entryLabel.Size = UDim2.new(0,70,0,20)
    entryLabel.Position = UDim2.new(0.42,0,0.4,0)
    entryLabel.BackgroundTransparency = 1
    entryLabel.Text = "دخول: 0"
    entryLabel.TextColor3 = Color3.fromRGB(100,255,100)
    entryLabel.Font = Enum.Font.GothamBold
    entryLabel.TextSize = 13
    entryLabel.Parent = frame

    local timerLabel = Instance.new("TextLabel")
    timerLabel.Size = UDim2.new(0,120,0,20)
    timerLabel.Position = UDim2.new(0.62,0,0.4,0)
    timerLabel.BackgroundTransparency = 1
    timerLabel.Text = "وقت: 00:00:00"
    timerLabel.TextColor3 = Color3.fromRGB(0,150,255)
    timerLabel.Font = Enum.Font.GothamBold
    timerLabel.TextSize = 13
    timerLabel.Parent = frame

    entry.GuiFrame = frame
    entry.NameLabel = nameLabel
    entry.ExitLabel = exitLabel
    entry.EntryLabel = entryLabel
    entry.TimerLabel = timerLabel
    entry.Avatar = avatar

    local ok, thumbnail = pcall(function()
        return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
    end)
    if ok and thumbnail then avatar.Image = thumbnail end

    entry.CharAddedConn = player.CharacterAdded:Connect(function(character)
        entry.EntryCount = entry.EntryCount + 1
        entry.IsInside = true
        entry.LastTick = tick()
        updateEntryUI(entry)
    end)

    entry.CharRemovingConn = player.CharacterRemoving:Connect(function(character)
        if entry.IsInside then
            entry.TotalTime = entry.TotalTime + (tick() - entry.LastTick)
            entry.IsInside = false
            entry.LastTick = 0
        end
        entry.ExitCount = entry.ExitCount + 1
        updateEntryUI(entry)
    end)

    if player.Character then
        entry.EntryCount = 1
        entry.IsInside = true
        entry.LastTick = tick()
        updateEntryUI(entry)
    end

    table.insert(trackedEntries, entry)
    updateCanvasSize()
end

Players.PlayerRemoving:Connect(function(player)
    for _, entry in ipairs(trackedEntries) do
        if entry.Player == player then
            removeEntry(entry)
            break
        end
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    for _, entry in ipairs(trackedEntries) do
        if entry.IsInside and entry.LastTick > 0 then
            local now = tick()
            entry.TotalTime = entry.TotalTime + (now - entry.LastTick)
            entry.LastTick = now
            entry.TimerLabel.Text = "وقت: " .. formatTime(entry.TotalTime)
        end
    end
end)

AddButton.MouseButton1Click:Connect(function()
    local input = Input.Text:lower():gsub("%s+", "")
    if input == "" then
        StatusLabel.Text = "ادخل نص"
        return
    end

    local added = 0
    for _, p in ipairs(Players:GetPlayers()) do
        local name = p.Name:lower()
        if name:sub(1, #input) == input then
            createEntry(p)
            added = added + 1
        end
    end

    if added == 0 then
        StatusLabel.Text = "غير موجود"
    else
        StatusLabel.Text = "تم: " .. added
    end
    Input.Text = ""
end)
