local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BOT_TRAVEXA_GUI"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 600, 0, 200)
MainFrame.Position = UDim2.new(0.5, -300, 0, 10)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderColor3 = Color3.fromRGB(0, 140, 255)
MainFrame.BorderSizePixel = 2
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "BOT_TRAVEXA"
Title.TextColor3 = Color3.fromRGB(0, 150, 255)
Title.Font = Enum.Font.SciFi
Title.TextSize = 28
Title.TextStrokeTransparency = 0
Title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Title.Parent = MainFrame

local InputLabel = Instance.new("TextLabel")
InputLabel.Size = UDim2.new(0, 120, 0, 30)
InputLabel.Position = UDim2.new(0.03, 0, 0.35, 0)
InputLabel.BackgroundTransparency = 1
InputLabel.Text = "اول 3 احرف"
InputLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
InputLabel.Font = Enum.Font.Gotham
InputLabel.TextSize = 14
InputLabel.Parent = MainFrame

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(0, 100, 0, 35)
Input.Position = UDim2.new(0.22, 0, 0.32, 0)
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input.BorderColor3 = Color3.fromRGB(0, 140, 255)
Input.BorderSizePixel = 2
Input.Text = ""
Input.PlaceholderText = "مثال: abc"
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.Font = Enum.Font.Gotham
Input.TextSize = 16
Input.Parent = MainFrame

local StartButton = Instance.new("TextButton")
StartButton.Size = UDim2.new(0, 80, 0, 35)
StartButton.Position = UDim2.new(0.42, 0, 0.32, 0)
StartButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
StartButton.BorderColor3 = Color3.fromRGB(0, 80, 180)
StartButton.BorderSizePixel = 2
StartButton.Text = "ابداء"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 16
StartButton.Parent = MainFrame

local InfoFrame = Instance.new("Frame")
InfoFrame.Size = UDim2.new(1, -20, 0, 100)
InfoFrame.Position = UDim2.new(0, 10, 0, 90)
InfoFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
InfoFrame.BorderColor3 = Color3.fromRGB(0, 140, 255)
InfoFrame.BorderSizePixel = 1
InfoFrame.Parent = MainFrame

local Avatar = Instance.new("ImageLabel")
Avatar.Size = UDim2.new(0, 60, 0, 60)
Avatar.Position = UDim2.new(0.02, 0, 0.2, 0)
Avatar.BackgroundTransparency = 1
Avatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
Avatar.Parent = InfoFrame

local NameLabel = Instance.new("TextLabel")
NameLabel.Size = UDim2.new(0, 150, 0, 30)
NameLabel.Position = UDim2.new(0.12, 0, 0.1, 0)
NameLabel.BackgroundTransparency = 1
NameLabel.Text = "الاسم: "
NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
NameLabel.Font = Enum.Font.GothamBold
NameLabel.TextSize = 16
NameLabel.Parent = InfoFrame

local StatsFrame = Instance.new("Frame")
StatsFrame.Size = UDim2.new(0.45, 0, 0.8, 0)
StatsFrame.Position = UDim2.new(0.55, 0, 0.1, 0)
StatsFrame.BackgroundTransparency = 1
StatsFrame.Parent = InfoFrame

local ExitLabel = Instance.new("TextLabel")
ExitLabel.Size = UDim2.new(0.3, 0, 1, 0)
ExitLabel.Position = UDim2.new(0, 0, 0, 0)
ExitLabel.BackgroundTransparency = 1
ExitLabel.Text = "خروج: 0"
ExitLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
ExitLabel.Font = Enum.Font.GothamBold
ExitLabel.TextSize = 14
ExitLabel.TextXAlignment = Enum.TextXAlignment.Left
ExitLabel.Parent = StatsFrame

local EntryLabel = Instance.new("TextLabel")
EntryLabel.Size = UDim2.new(0.3, 0, 1, 0)
EntryLabel.Position = UDim2.new(0.3, 0, 0, 0)
EntryLabel.BackgroundTransparency = 1
EntryLabel.Text = "دخول: 0"
EntryLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
EntryLabel.Font = Enum.Font.GothamBold
EntryLabel.TextSize = 14
EntryLabel.TextXAlignment = Enum.TextXAlignment.Left
EntryLabel.Parent = StatsFrame

local TimerLabel = Instance.new("TextLabel")
TimerLabel.Size = UDim2.new(0.4, 0, 1, 0)
TimerLabel.Position = UDim2.new(0.6, 0, 0, 0)
TimerLabel.BackgroundTransparency = 1
TimerLabel.Text = "وقت: 00:00:00"
TimerLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
TimerLabel.Font = Enum.Font.GothamBold
TimerLabel.TextSize = 14
TimerLabel.TextXAlignment = Enum.TextXAlignment.Left
TimerLabel.Parent = StatsFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(1, -60, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderSizePixel = 1
ToggleButton.Text = "T"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 24
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1, 0)
Corner.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

local targetPlayer = nil
local exitCount = 0
local entryCount = 0
local totalTime = 0
local isInside = false
local lastTick = 0
local charAddedConn = nil
local charRemovingConn = nil
local timerLoop = nil

local function formatTime(seconds)
	local hours = math.floor(seconds / 3600)
	local mins = math.floor((seconds % 3600) / 60)
	local secs = math.floor(seconds % 60)
	return string.format("%02d:%02d:%02d", hours, mins, secs)
end

local function updateUI()
	NameLabel.Text = "الاسم: " .. (targetPlayer and targetPlayer.Name or "")
	ExitLabel.Text = "خروج: " .. exitCount
	EntryLabel.Text = "دخول: " .. entryCount
	TimerLabel.Text = "وقت: " .. formatTime(totalTime)
end

local function startTimer()
	if timerLoop then return end
	timerLoop = game:GetService("RunService").Heartbeat:Connect(function()
		if isInside and lastTick > 0 then
			local now = tick()
			totalTime = totalTime + (now - lastTick)
			lastTick = now
			TimerLabel.Text = "وقت: " .. formatTime(totalTime)
		end
	end)
end

local function stopTimer()
	if timerLoop then
		timerLoop:Disconnect()
		timerLoop = nil
	end
end

local function handleCharacterAdded(character)
	entryCount = entryCount + 1
	isInside = true
	lastTick = tick()
	updateUI()
end

local function handleCharacterRemoving(character)
	if isInside then
		totalTime = totalTime + (tick() - lastTick)
		isInside = false
		lastTick = 0
	end
	exitCount = exitCount + 1
	updateUI()
end

local function clearTracking()
	stopTimer()
	if charAddedConn then charAddedConn:Disconnect(); charAddedConn = nil end
	if charRemovingConn then charRemovingConn:Disconnect(); charRemovingConn = nil end
	targetPlayer = nil
	exitCount = 0
	entryCount = 0
	totalTime = 0
	isInside = false
	lastTick = 0
	updateUI()
end

StartButton.MouseButton1Click:Connect(function()
	local partial = Input.Text:lower()
	if #partial < 1 then return end

	clearTracking()

	for _, p in ipairs(Players:GetPlayers()) do
		if p.Name:lower():sub(1, #partial) == partial then
			targetPlayer = p
			break
		end
	end

	if not targetPlayer then
		NameLabel.Text = "غير موجود"
		return
	end

	local ok, thumbnail = pcall(function()
		return Players:GetUserThumbnailAsync(targetPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
	end)
	if ok and thumbnail then
		Avatar.Image = thumbnail
	end

	charAddedConn = targetPlayer.CharacterAdded:Connect(handleCharacterAdded)
	charRemovingConn = targetPlayer.CharacterRemoving:Connect(handleCharacterRemoving)

	if targetPlayer.Character then
		handleCharacterAdded(targetPlayer.Character)
	end

	startTimer()
end)
