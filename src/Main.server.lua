local HttpService = game:GetService("HttpService")

local githubAPI = require("./GithubAPI")
githubAPI.Config.HttpGet = function(url)
	return HttpService:GetAsync(url)
end

githubAPI.Config.Json2Table = function(json)
	return HttpService:JSONDecode(json)
end

local prompter = require("./UI/Prompts")
prompter.Init()

local toolbar = plugin:CreateToolbar("PluginBuilder")

local buildBtn = toolbar:CreateButton(
	"SpongeSuite_PluginBuilder_BuildRemotePlugin",
	"Build a plugin located in a github repository",
	"rbxassetid://131891286031534",
	"Build Remote Plugin"
)

local function githubAPIToDataModel(repoRoot, repoDirPath, dataModelParent)
	local repoDir = repoRoot:GetFolder(repoDirPath)
	local folderContents = repoDir:GetContentsInfo()
	
	for _, entry in ipairs(folderContents) do
		if entry.type == "file" then
			local isModule = (string.match(entry.name, "%.server%.lua$") == nil)
			local inst = (isModule and Instance.new("ModuleScript")) or Instance.new("Script")
			local name = string.gsub(entry.name, "%.lua$", ""):gsub("%.server$", "")
			inst.Name = name
			inst.Parent = dataModelParent
			inst:AddTag(`Remote_{repoRoot.Name}`)
			
			print(`PluginBuilder : Retrieving file {name}...`)
			local success, source = repoDir:GetFile(entry.name)
			
			if not success then
				warn(`PluginBuilder : Failed to retrieve file {name} : ` .. source)
				inst.Source = `error("Failed to retrieve file from remote repository!")`
			else
				inst.Source = source
			end
		elseif entry.type == "dir" then
			local f = Instance.new("Folder")
			f.Name = entry.name
			f.Parent = dataModelParent
			f:AddTag(`Remote_{repoRoot.Name}`)
			
			githubAPIToDataModel(repoRoot, entry.path, f)
		else
			warn(`PluginBuilder : Encountered remote file of unknown type "{entry.type}"! File will be ignored`)
		end
	end
	
end

local function buildPlugin()
	local cont, url = prompter.String("Repo URL", "https://github.com/Author/Repo")
	if not cont then return end
	
	url = url:gsub("/+$", "")
	
	local cont, path = prompter.String("Plugin Path", "Plugins/src/CoolPlugin")
	if not cont then return end
	
	path = path:gsub("^/+", ""):gsub("/+$", "")
	
	local cont, outName = prompter.String("Plugin Name", "CoolPlugin")
	if not cont then return end
	
	local repo = githubAPI.Repo.FromURL(url)
	local outFolder = Instance.new("Folder")
	outFolder.Name = outName
	
	githubAPIToDataModel(repo, path, outFolder)
	
	local attribution = Instance.new("ModuleScript")
	attribution.Name = "@__PluginBuilderAttribution__@"
	attribution.Source = "-- This plugin was automatically built with Sprixitite's \"SpongeSuite-PluginBuilder\"" .. '\n' ..
						 "-- The plugin may be found at the following link: " .. "https://www.github.com/Sprixitite/SpongeSuite-PluginBuilder" .. "\n\n" ..
						 "-- ATTENTION: Removal of this attribution notice for redistribution violates the plugin's terms of use" .. '\n' .. 
						 "error('Attempt to require SpongeSuite-PluginBuilder attribution notice!')"
	attribution.Parent = outFolder
	
	outFolder.Parent = game.ReplicatedStorage
	game.Selection:Set({outFolder})
end

local doingSomething = false
local function btn_pressed()
	if doingSomething then
		doingSomething = false
		prompter.CancelAll()
		return
	end
	doingSomething = true
	buildPlugin()
	doingSomething = false
end

buildBtn.Click:Connect(btn_pressed)