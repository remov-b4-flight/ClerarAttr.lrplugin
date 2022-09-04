--[[
ClearAttr.lua
EvalFocus.lrplugin
Author:@jenoki48
]]

local PluginTitle = 'ClearAttr'
local LrApplication = import 'LrApplication'
local LrTasks = import 'LrTasks'
local LrProgress = import 'LrProgressScope'
local LrLogger = import 'LrLogger'
local Logger = LrLogger(PluginTitle)
Logger:enable('logfile')


local CurrentCatalog = LrApplication.activeCatalog()
local TagCommand = 'cmd.exe /C attrib -A "'

--Main part of this plugin.
LrTasks.startAsyncTask( function ()
	local ProgressBar = LrProgress(
		{title = 'Clearing Attributes.'}
	)

	local SelectedPhotos = CurrentCatalog:getTargetPhotos()
	local countPhotos = #SelectedPhotos
	--loops photos in selected
	CurrentCatalog:withWriteAccessDo('Clearing archive flag',function()
		for i,PhotoIt in ipairs(SelectedPhotos) do

			local FilePath = PhotoIt:getRawMetadata('path')
			local CommandLine = TagCommand .. FilePath .. '"'
			Logger:debug(CommandLine)
			LrTasks.execute(CommandLine)
			ProgressBar:setPortionComplete(i,countPhotos)
		end --end of for photos loop
	end ) --end of withWriteAccessDo
ProgressBar:done()
end ) --end of startAsyncTask function()
return
