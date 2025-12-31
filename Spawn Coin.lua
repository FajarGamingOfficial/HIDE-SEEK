local _0x5A2B = game:GetService("\104\116\116\112\115\058\047\047")
local l__Players = game:GetService("\80\108\97\121\101\114\115")
local l__RunService = game:GetService("\82\117\110\83\101\114\118\105\99\101")
local l__UIS = game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\93\101")
local l__SG = game:GetService("\83\116\97\114\116\101\114\71\117\105")
local l__LP = l__Players.LocalPlayer

l__SG:SetCore("\83\101\110\100\78\111\116\105\102\105\99\97\116\105\111\110", {
    Title = "\60\32" .. l__LP.Name .. " \32\62",
    Text = "\83\99\114\105\112\116\32\65\99\116\105\118\97\116\101\100\33",
    Icon = "rbxassetid://123456789",
    Duration = 5
})

_G.CM_Enabled = false
_G.T_Col = Color3.fromRGB(0, 255, 150)

if game.CoreGui:FindFirstChild("\67\77\95\83\109\111\111\116\104") then 
    game.CoreGui["\67\77\95\83\109\111\111\116\104"]:Destroy() 
end

local _0xUI = Instance.new("ScreenGui", game.CoreGui)
_0xUI.Name = "\67\77\95\83\109\111\111\116\104"

local _0xM = Instance.new("Frame", _0xUI)
_0xM.Size = UDim2.new(0, 160, 0, 100)
_0xM.Position = UDim2.new(0.5, -80, 0.2, 0)
_0xM.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
_0xM.Active = true
_0xM.BorderSizePixel = 0
local _0xS = Instance.new("UIStroke", _0xM)
_0xS.Color = _G.T_Col
_0xS.Thickness = 2
Instance.new("UICorner", _0xM).CornerRadius = UDim.new(0, 10)

local d, di, ds, sp
_0xM.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        d = true ds = i.Position sp = _0xM.Position
        i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then d = false end end)
    end
end)
_0xM.InputChanged:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then di = i end end)
l__UIS.InputChanged:Connect(function(i)
    if i == di and d then
        local delta = i.Position - ds
        _0xM.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y)
    end
end)

local _0xT1 = Instance.new("TextLabel", _0xM)
_0xT1.Size = UDim2.new(1, 0, 0, 35)
_0xT1.Text = "\83\80\65\87\78\32\67\79\73\78"
_0xT1.TextColor3 = _G.T_Col
_0xT1.Font = Enum.Font.GothamBold
_0xT1.TextSize = 11
_0xT1.BackgroundTransparency = 1

local _0xST = Instance.new("TextLabel", _0xM)
_0xST.Size = UDim2.new(1, 0, 0, 20)
_0xST.Position = UDim2.new(0, 0, 0, 35)
_0xST.Text = "\83\84\65\84\85\83\58\32\79\70\70"
_0xST.TextColor3 = Color3.new(1, 1, 1)
_0xST.Font = Enum.Font.Gotham
_0xST.TextSize = 10
_0xST.BackgroundTransparency = 1

local _0xBTN = Instance.new("TextButton", _0xM)
_0xBTN.Size = UDim2.new(0.85, 0, 0, 30)
_0xBTN.Position = UDim2.new(0.075, 0, 0.6, 0)
_0xBTN.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
_0xBTN.Text = "\65\67\84\73\86\65\84\69"
_0xBTN.TextColor3 = Color3.new(1, 1, 1)
_0xBTN.Font = Enum.Font.GothamBold
_0xBTN.TextSize = 10
Instance.new("UICorner", _0xBTN)

l__RunService.Stepped:Connect(function()
    if _G.CM_Enabled then
        local c = l__LP.Character
        local r = c and c:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
        if r then
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "\67\114\101\100\105\116" and v:IsA("\66\97\115\101\80\97\114\116") then
                    v.CFrame = r.CFrame
                    if v:FindFirstChildOfClass("\84\111\117\99\104\84\114\97\110\115\109\105\116\116\101\114") then
                        firetouchinterest(r, v, 0)
                        firetouchinterest(r, v, 1)
                    end
                end
            end
        end
    end
end)

_0xBTN.MouseButton1Click:Connect(function()
    _G.CM_Enabled = not _G.CM_Enabled
    _0xST.Text = "\83\84\65\84\85\83\58\32" .. (_G.CM_Enabled and "\65\67\84\73\86\69" or "\79\70\70")
    _0xBTN.Text = _G.CM_Enabled and "\83\84\79\80" or "\65\67\84\73\86\65\84\69"
    _0xBTN.BackgroundColor3 = _G.CM_Enabled and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(30, 30, 30)
end)
