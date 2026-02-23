# SpongeSuite-PluginBuilder
PluginBuilder is a plugin which allows one to automatically build Roblox Studio plugins given:
1) A URL to a valid (public!) Github Repo
2) The path to the root of the plugin's source folder
3) The plugin name

Built plugins are output to ReplicatedStorage, titled using the name provided by the user

## Interface
The plugin asks for the above three inputs via variants of the following interface:  
![Preview Of Plugin's Interface](./img/ui_preview.png)

## Terms Of Use
- Plugins built via this plugin's use may not be redistributed without explicit mention of this plugin's use to build them
- Plugins built via this plugin's use must retain the embedded `@__PluginBuilderAttribution__@` file
- The SpongeSuite-PluginBuilder plugin may not be modified to prevent or otherwise circumvent creation of the attribution file

## Trivia
This plugin can build itself, yes, I checked