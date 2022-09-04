--[[
Info.lua
EvalFocus.lrplugin
Author:@jenoki48
]]

return {

	LrSdkVersion = 3.0,

	LrToolkitIdentifier = 'nu.mine.ruffles.clearattr',
	LrPluginName = 'Clear Attribute',
	LrPluginInfoUrl='https://twitter.com/remov_b4_flight',
	LrLibraryMenuItems = { 
		{title = 'Clear Attribute',
		file = 'ClearAttr.lua',
		enabledWhen = 'photosAvailable',},
	},
	VERSION = { major=0, minor=0, revision=1, build=0, },

}
