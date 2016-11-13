local quickAction = require( "plugin.quickAction" )
local json = require "json"


local loadIcons = {
	{type = "com.CoolButton", title ="Cool Tile", subtitle= "Cool subtitle", icon = "Message"},
	{type = "com.CoolButton2", title ="Cool Tile2", subtitle= "Cool subtitle2", icon = "iCon1.png"},
}


local myTitle = display.newText( "title blank", display.contentCenterX, display.contentCenterY, native.systemFontBold, 15 )
local myType = display.newText( "type blank", display.contentCenterX, display.contentCenterY+50, native.systemFontBold, 15 )
local getIcons = display.newText( "Get Icons", display.contentCenterX, display.contentCenterY-50, native.systemFontBold, 15 )
local setIcons = display.newText( "Set Icons", display.contentCenterX, display.contentCenterY-100, native.systemFontBold, 15 )


local function lis( e )
	myTitle.text = e.localizedTitle
	myType.text = e.type
end
Runtime:addEventListener("quickAction", lis)

getIcons:addEventListener("tap", function (  )
	print(json.prettify( quickAction.getShortcuts()))
end)

setIcons:addEventListener("tap", function (  )
	quickAction.loadShortcuts(loadIcons)
end)
