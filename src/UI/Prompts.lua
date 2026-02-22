local CoreGui = game:GetService("CoreGui")
local themeLoader = require("./Themes/Loader")
local theme_Sponge = require("./Themes/SpongeSuite")
local theme_Sponge_Tok = require("./Themes/SpongeSuiteTokens")

local Prompts = {}

local templates = {}
local prompters = {}

local cancel = Instance.new("BindableEvent")

local function prompterEntry(name, ui, event)
	prompters[name] = {
		UI = ui,
		Event = event
	}
end

local function createPrompter(id, ui)
	if CoreGui:FindFirstChild(ui.Name) ~= nil then
		CoreGui[ui.Name]:Destroy()
	end
	
	local event  = Instance.new("BindableEvent")
	ui.Archivable = false
	
	prompterEntry(id, ui, event)
end

local function NewUIElem(id, elemScript, stylesheet)
	templates[id] = require(elemScript)
	
	local link = Instance.new("StyleLink")
	link.Parent = templates[id]
	link.StyleSheet = stylesheet
end

local function StyleInit()
	local spongeStyle = themeLoader.ReconstructSheet( theme_Sponge )
	spongeStyle.Archivable = false
	
	if CoreGui:FindFirstChild(spongeStyle.Name) ~= nil then
		CoreGui[spongeStyle.Name]:Destroy()
	end
	
	spongeStyle.Parent = CoreGui
	
	local derive = Instance.new("StyleDerive")
	derive.Parent = spongeStyle
	
	local spongeStyleTok = themeLoader.ReconstructSheet( theme_Sponge_Tok )
	spongeStyleTok.Archivable = false
	
	if CoreGui:FindFirstChild(spongeStyleTok.Name) ~= nil then
		CoreGui[spongeStyleTok.Name]:Destroy()
	end
	
	spongeStyleTok.Parent = CoreGui
	derive.StyleSheet = spongeStyleTok
	
	NewUIElem("String", script.Parent.UIElems.TextInput, spongeStyle)
end

function Prompts.Init()
	StyleInit()
	createPrompter("String", templates.String)
	
	local strUI = prompters.String.UI
	local entryBox   = strUI:FindFirstChild("EntryBox", true)
	local confirmBtn = strUI:FindFirstChild("ConfirmButton", true)
	local cancelBtn  = strUI:FindFirstChild("CancelButton", true)
	
	confirmBtn.MouseButton1Click:Connect(function()
		prompters.String.Event:Fire(true, entryBox.Text)
	end)
	
	cancelBtn.MouseButton1Click:Connect(function()
		prompters.String.Event:Fire(false, nil)
	end)
	
	cancel.Event:Connect(function()
		prompters.String.Event:Fire(false, nil)
	end)
end

function Prompts.CancelAll()
	cancel:Fire()
end

function Prompts.String(entering, default)
	local ui = prompters.String.UI
	while ui.Parent ~= nil do
		ui.AncestryChanged:Wait()
	end
	
	local heading = ui:FindFirstChild("Heading", true)
	local defaultHeading = heading.Text
	heading.Text = string.gsub(defaultHeading, "{}", entering)
	
	local enterBox = ui:FindFirstChild("EntryBox", true)
	enterBox.PlaceholderText = default
	enterBox.Text = ""
	
	ui.Parent = CoreGui
	
	local succeeded, entered = prompters.String.Event.Event:Wait()
	
	heading.Text = defaultHeading
	ui.Parent = nil
	
	return succeeded, entered
end

return Prompts