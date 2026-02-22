local GithubAPI = {}

local function InvalidConfig(badField)
	error("GithubAPI : Config Invalid : " .. badField .. " was left unset!")
end

GithubAPI.Config = {
	HttpGet = function(url)
		InvalidConfig("HttpGet")
	end,
	Json2Table = function(json)
		InvalidConfig("Json2Table")
	end,
}

GithubAPI.Repo = {}
GithubAPI.RepoDir = {}

local function newObjectFactory(
	typeName,
	fields,
	vtable,
	meta
)
	vtable = vtable or {}
	meta = meta or {}
	local validObjects = setmetatable( {}, { __mode = 'k' } )
	local fieldN = #fields
	
	local constructor = function(...)
		local vararg = { ... }
		local newObj = setmetatable( {}, meta )
		
		for i=1, fieldN do
			newObj[ fields[i] ] = vararg[i]
		end
		
		for fname, f in pairs(vtable) do
			newObj[fname] = f
		end
		
		validObjects[newObj] = true
		
		return newObj
	end
	
	local validator = function(obj)
		if validObjects[obj] ~= true then
			error("Provided " .. typeName .. " " .. tostring(obj) .. " is invalid!")
		end
	end
	
	return constructor, validator
end

function GithubAPI.Repo.ToString(repo)
	return "[ Github Repo \"" .. repo.Name .. "\" by \"" .. repo.Owner .. "\" ]"
end

function GithubAPI.Repo.GetFolder(repo, path)
	return GithubAPI.RepoDir.FromElements(repo.Owner, repo.Name, repo.Branch, path)
end

GithubAPI.Repo.FromElements, GithubAPI.Repo.Validate = newObjectFactory(
	"Repo",
	{ "Owner", "Name", "Branch" },
	{
		GetFolder = GithubAPI.Repo.GetFolder
	},
	{
		__tostring = GithubAPI.Repo.ToString
	}
)

function GithubAPI.Repo.FromURL(url)
	local owner, repoName = string.match(url, "github.com/([^/]+)/([^/]+)")
	local branch = string.match(url, "github.com/([^/]+)/([^/]+)/tree/([^/]+)")
	
	if branch == nil then branch = "main" end
	
	if owner == nil or repoName == nil then
		error("Given github repo URL \"" .. url .. "\" is invalid!")
	end
	
	return GithubAPI.Repo.FromElements(owner, repoName, branch)
end

function GithubAPI.RepoDir.ToString(repoDir)
	return "[ Github Repo Dir \"" .. repoDir.Path .. "\" in repo \"" .. repoDir.Name .. "\" by \"" .. repoDir.Owner .. "\" ]"
end

function GithubAPI.RepoDir.ToContentUrl(repoDir)
	return "https://api.github.com/repos/" .. repoDir.Owner .. '/' .. repoDir.Name .. "/contents/" .. repoDir.Path .. "?ref=" .. repoDir.Branch
end

function GithubAPI.RepoDir.GetContentsInfo(repoDir)
	if repoDir.CachedContents ~= nil then
		return repoDir.CachedContents
	end
	
	local success, json = pcall(
		GithubAPI.Config.HttpGet,
		repoDir:ToContentUrl()
	)
	
	if not success then
		error("GithubAPI : Failed to retrieve contents of \"" .. tostring(repoDir) .. "\"! Inner error was as follows: " .. json)
	end
	
	local success, contents = pcall(
		GithubAPI.Config.Json2Table,
		json
	)
	
	if not success then
		error("GithubAPI : Failed to convert JSON to table! Inner error was as follows: " .. contents)
	end
	
	repoDir.CachedContents = contents
	return contents
end

function GithubAPI.RepoDir.GetFile(repoDir, filename)
	return pcall(
		GithubAPI.Config.HttpGet,
		"https://raw.githubusercontent.com/" .. repoDir.Owner .. '/' .. repoDir.Name .. '/' .. repoDir.Branch .. '/' .. repoDir.Path .. '/' .. filename
	)
end

GithubAPI.RepoDir.FromElements, GithubAPI.RepoDir.Validate = newObjectFactory(
	"RepoDir",
	{ "Owner", "Name", "Branch", "Path" },
	{
		GetFile = GithubAPI.RepoDir.GetFile,
		ToContentUrl = GithubAPI.RepoDir.ToContentUrl,
		GetContentsInfo = GithubAPI.RepoDir.GetContentsInfo
	},
	{
		__tostring = GithubAPI.RepoDir.ToString
	}
)

function GithubAPI.RepoDir.FromURLAndPath(url, path)
	return GithubAPI.Repo.FromURL(url):GetFolder(path)
end

return GithubAPI