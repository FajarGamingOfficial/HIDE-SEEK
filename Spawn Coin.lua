local _1l1ll1l1l = game:GetService("Players")
local _l1l1l1l1l = game:GetService("RunService")
local _ll1l1l1ll = game:GetService("UserInputService")
local _lll111l1l = game:GetService("StarterGui")
local _111l1l1l1 = _1l1ll1l1l.LocalPlayer

_lll111l1l:SetCore("SendNotification", {
    Title = "Hello, " .. _111l1l1l1.Name .. "!",
    Text = "Script Successfully Executed!",
    Duration = 5
})

_G.MagnetEnabled = false
_G.ThemeColor = Color3.fromRGB(0, 255, 150)

if game.CoreGui:FindFirstChild("CreditMagnetSmooth") then 
    game.CoreGui.CreditMagnetSmooth:Destroy() 
end

local _gui = Instance.new("ScreenGui", game.CoreGui)
_gui.Name = "CreditMagnetSmooth"

local _frame = Instance.new("Frame", _gui)
_frame.Size = UDim2.new(0, 160, 0, 100)
_frame.Position = UDim2.new(0.5, -80, 0.2, 0)
_frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_frame.Active = true
_frame.BorderSizePixel = 0
local _stroke = Instance.new("UIStroke", _frame)
_stroke.Color = _G.ThemeColor
_stroke.Thickness = 2
Instance.new("UICorner", _frame).CornerRadius = UDim.new(0, 10)

local _d, _di, _ds, _sp
_frame.InputBegan:Connect(function(_i)
    if _i.UserInputType == Enum.UserInputType.MouseButton1 or _i.UserInputType == Enum.UserInputType.Touch then
        _d = true; _ds = _i.Position; _sp = _frame.Position
        _i.Changed:Connect(function() if _i.UserInputState == Enum.UserInputState.End then _d = false end end)
    end
end)
_frame.InputChanged:Connect(function(_i) if _i.UserInputType == Enum.UserInputType.MouseMovement or _i.UserInputType == Enum.UserInputType.Touch then _di = _i end end)
_ll1l1l1ll.InputChanged:Connect(function(_i)
    if _i == _di and _d then
        local _delta = _i.Position - _ds
        _frame.Position = UDim2.new(_sp.X.Scale, _sp.X.Offset + _delta.X, _sp.Y.Scale, _sp.Y.Offset + _delta.Y)
    end
end)

local _title = Instance.new("TextLabel", _frame)
_title.Size = UDim2.new(1, 0, 0, 35)
_title.Text = "SPAWN COIN"
_title.TextColor3 = _G.ThemeColor
_title.Font = Enum.Font.GothamBold
_title.TextSize = 11
_title.BackgroundTransparency = 1

local _status = Instance.new("TextLabel", _frame)
_status.Size = UDim2.new(1, 0, 0, 20)
_status.Position = UDim2.new(0, 0, 0, 35)
_status.Text = "STATUS: OFF"
_status.TextColor3 = Color3.new(1, 1, 1)
_status.Font = Enum.Font.Gotham
_status.TextSize = 10
_status.BackgroundTransparency = 1

local _btn = Instance.new("TextButton", _frame)
_btn.Size = UDim2.new(0.85, 0, 0, 30)
_btn.Position = UDim2.new(0.075, 0, 0.6, 0)
_btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_btn.Text = "ACTIVATE"
_btn.TextColor3 = Color3.new(1, 1, 1)
_btn.Font = Enum.Font.GothamBold
_btn.TextSize = 10
Instance.new("UICorner", _btn)

_l1l1l1l1l.Stepped:Connect(function()
    if _G.MagnetEnabled then
        local _char = _111l1l1l1.Character
        local _root = _char and _char:FindFirstChild("HumanoidRootPart")
        if _root then
            for _, _v in pairs(workspace:GetDescendants()) do
                if _v.Name == "Credit" and _v:IsA("BasePart") then
                    _v.CFrame = _root.CFrame
                    if _v:FindFirstChildOfClass("TouchTransmitter") then
                        firetouchinterest(_root, _v, 0)
                        firetouchinterest(_root, _v, 1)
                    end
                end
            end
        end
    end
end)

_btn.MouseButton1Click:Connect(function()
    _G.MagnetEnabled = not _G.MagnetEnabled
    _status.Text = "STATUS: " .. (_G.MagnetEnabled and "ACTIVE" or "OFF")
    _btn.Text = _G.MagnetEnabled and "STOP" or "ACTIVATE"
    _btn.BackgroundColor3 = _G.MagnetEnabled and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(30, 30, 30)
end)
