local Players = game:GetService("Players")
local player = Players.LocalPlayer

local tools = {}

local function findAndClickNewestTool()
    local character = player.Character
    if character then
        local characterTools = character:GetChildren()

        for _, tool in pairs(characterTools) do
            if tool:IsA("Tool") and not tools[tool] then
                tools[tool] = true
            end
        end

        local newestTool = nil

        for tool, _ in pairs(tools) do
            if not newestTool or tool:IsDescendantOf(character) then
                newestTool = tool
            end
        end

        if newestTool then
            local clickEvent = newestTool:FindFirstChild("ClickEvent")

            if clickEvent then
                clickEvent:FireServer()
            end
        end
    end
end

local interval = 0.1 

while true do
    findAndClickNewestTool()
    wait(interval)
end
