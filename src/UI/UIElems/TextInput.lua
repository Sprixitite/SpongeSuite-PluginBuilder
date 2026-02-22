--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 8 | Scripts: 0 | Modules: 0 | Tags: 6
local CollectionService = game:GetService("CollectionService");
local G2L = {};

-- Workspace.SpongeSuite-PluginArchitect.UI.TextInput
G2L["1"] = Instance.new("ScreenGui");
G2L["1"]["Name"] = [[TextInput]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- Workspace.SpongeSuite-PluginArchitect.UI.TextInput.BG
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Size"] = UDim2.new(0.5, 0, 0.25, 0);
G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[BG]];
G2L["2"]["BackgroundTransparency"] = 0.25;

-- Tags
CollectionService:AddTag(G2L["2"], [[Solid]]);

-- Workspace.SpongeSuite-PluginArchitect.UI.TextInput.BG.ConfirmButton
G2L["3"] = Instance.new("TextButton", G2L["2"]);
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 14;
G2L["3"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["3"]["Size"] = UDim2.new(0.5, -8, 0.33, -8);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[Confirm]];
G2L["3"]["Name"] = [[ConfirmButton]];
G2L["3"]["Position"] = UDim2.new(0, 4, 1, -4);

-- Tags
CollectionService:AddTag(G2L["3"], [[Pos]]);
CollectionService:AddTag(G2L["3"], [[H2]]);

-- Workspace.SpongeSuite-PluginArchitect.UI.TextInput.BG.CancelButton
G2L["4"] = Instance.new("TextButton", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextSize"] = 14;
G2L["4"]["AnchorPoint"] = Vector2.new(1, 1);
G2L["4"]["Size"] = UDim2.new(0.5, -8, 0.33, -8);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[Cancel]];
G2L["4"]["Name"] = [[CancelButton]];
G2L["4"]["Position"] = UDim2.new(1, -4, 1, -4);

-- Tags
CollectionService:AddTag(G2L["4"], [[Neg]]);
CollectionService:AddTag(G2L["4"], [[H2]]);

-- Workspace.SpongeSuite-PluginArchitect.UI.TextInput.BG.Heading
G2L["5"] = Instance.new("TextLabel", G2L["2"]);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["Size"] = UDim2.new(1, 0, 0.33, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[Enter {}:]];
G2L["5"]["Name"] = [[Heading]];

-- Tags
CollectionService:AddTag(G2L["5"], [[H1]]);

-- Workspace.SpongeSuite-PluginArchitect.UI.TextInput.BG.EntryBox
G2L["6"] = Instance.new("TextBox", G2L["2"]);
G2L["6"]["Name"] = [[EntryBox]];
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["TextSize"] = 14;
G2L["6"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["6"]["PlaceholderText"] = [[Placeholder Text]];
G2L["6"]["Size"] = UDim2.new(1, -8, 0.33, 0);
G2L["6"]["Position"] = UDim2.new(0.5, 0, 0.33, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Text"] = [[]];


-- Workspace.SpongeSuite-PluginArchitect.UI.TextInput.BG.EntryBox.Frame
G2L["7"] = Instance.new("Frame", G2L["6"]);
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

return G2L["1"]