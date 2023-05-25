local neptune = {}

function neptune.newNotification(args)
	local title = args.title
	local pos = args.position
	local message = args.message
	
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local Neptune = Instance.new("ScreenGui")
	local Notification = Instance.new("Frame")
	local Topbar = Instance.new("Frame")
	local Label = Instance.new("TextLabel")
	local Messagebar = Instance.new("Frame")
	local MessageLabel = Instance.new("TextLabel")

	--Properties:

	Neptune.Name = "Neptune"
	Neptune.Parent = game.CoreGui
	Neptune.DisplayOrder = 999999999
	Neptune.ResetOnSpawn = false

	Notification.Name = "Notification"
	Notification.Parent = Neptune
	Notification.BackgroundColor3 = Color3.fromRGB(19, 18, 25)
	Notification.BorderSizePixel = 0
	--Notification.Position = UDim2.new(0.388779521, 0, 0.282419771, 0)
	Notification.Position = pos
	Notification.Size = UDim2.new(0, 332, 0, 163)

	Topbar.Name = "Topbar"
	Topbar.Parent = Notification
	Topbar.BackgroundColor3 = Color3.fromRGB(21, 20, 27)
	Topbar.BorderSizePixel = 0
	Topbar.Size = UDim2.new(0, 331, 0, 16)
	Topbar.ZIndex = 2

	Label.Name = "Label"
	Label.Parent = Topbar
	Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Label.BackgroundTransparency = 1.000
	Label.Position = UDim2.new(0, 0, -0.0018753052, 0)
	Label.Size = UDim2.new(0.999999881, 0, 1.00187385, 0)
	Label.ZIndex = 2
	Label.Font = Enum.Font.GothamMedium
	Label.Text = title
	Label.TextColor3 = Color3.fromRGB(142, 140, 159)
	Label.TextSize = 14.000

	Messagebar.Name = "Messagebar"
	Messagebar.Parent = Notification
	Messagebar.BackgroundColor3 = Color3.fromRGB(21, 20, 27)
	Messagebar.BorderSizePixel = 0
	Messagebar.Position = UDim2.new(0.0180722885, 0, 0.165644169, 0)
	Messagebar.Size = UDim2.new(0, 320, 0, 123)
	Messagebar.ZIndex = 2

	MessageLabel.Name = "MessageLabel"
	MessageLabel.Parent = Messagebar
	MessageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MessageLabel.BackgroundTransparency = 1.000
	MessageLabel.Position = UDim2.new(0, 0, -0.0018753052, 0)
	MessageLabel.Size = UDim2.new(0.999999881, 0, 1.00187385, 0)
	MessageLabel.ZIndex = 2
	MessageLabel.Font = Enum.Font.GothamMedium
	MessageLabel.Text = message
	MessageLabel.TextColor3 = Color3.fromRGB(142, 140, 159)
	MessageLabel.TextSize = 14.000
	MessageLabel.TextWrapped = true
	MessageLabel.TextYAlignment = Enum.TextYAlignment.Top

	-- Module Scripts:

	local fake_module_scripts = {}

	do -- Notification.TweenLibrary
		local script = Instance.new('ModuleScript', Notification)
		script.Name = "TweenLibrary"
		local function module_script()
			

			local TL = {}

			local TS = game:GetService("TweenService")

		--[[
		// Test Function
		TL.Clicked = function(plr,other)
			print("Clicked | "..other.Name.."")
		end
		--]]




			TL.TweenColor = function(plr,other,col,t)
				local ti = TweenInfo.new(t)
				local tween = TS:Create(other, ti, {BackgroundColor3 = col})
				tween:Play()
			end



			TL.TweenTextColor = function(plr,other,col,t)
				local ti = TweenInfo.new(t)
				local tween = TS:Create(other, ti, {TextColor3 = col})
				tween:Play()
			end



			TL.TweenImageColor = function(plr,other,col,t)
				local ti = TweenInfo.new(t)
				local tween = TS:Create(other, ti, {ImageColor3 = col})
				tween:Play()
			end



			return TL

		end
		fake_module_scripts[script] = module_script
	end


	-- Scripts:

	local function CHPN_fake_script() -- Label.Hover 
		local script = Instance.new('LocalScript', Label)
		local req = require
		local require = function(obj)
			local fake = fake_module_scripts[obj]
			if fake then
				return fake()
			end
			return req(obj)
		end

		local button = script.Parent
		local tweenlib = require(script.Parent.Parent.Parent.TweenLibrary)

		button.MouseEnter:Connect(function()
			tweenlib:TweenTextColor(button,Color3.fromRGB(95, 68, 161),1 - 0.5)
		end)

		button.MouseLeave:Connect(function()
			tweenlib:TweenTextColor(button,Color3.fromRGB(142, 140, 159),1 - 0.5)
		end)
	end
	coroutine.wrap(CHPN_fake_script)()
	local function SABWQ_fake_script() -- MessageLabel.Hover 
		local script = Instance.new('LocalScript', MessageLabel)
		local req = require
		local require = function(obj)
			local fake = fake_module_scripts[obj]
			if fake then
				return fake()
			end
			return req(obj)
		end

		local button = script.Parent
		local tweenlib = require(script.Parent.Parent.Parent.TweenLibrary)

		button.MouseEnter:Connect(function()
			tweenlib:TweenTextColor(button,Color3.fromRGB(95, 68, 161),1 - 0.5)
		end)

		button.MouseLeave:Connect(function()
			tweenlib:TweenTextColor(button,Color3.fromRGB(142, 140, 159),1 - 0.5)
		end)
	end
	coroutine.wrap(SABWQ_fake_script)()

end

return neptune
