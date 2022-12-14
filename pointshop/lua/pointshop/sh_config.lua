PS.Config = {}
PS.Config.CommunityName = "Внутриигровой Магазин"
PS.Config.DataProvider = 'pdata'
PS.Config.Branch = 'https://raw.github.com/adamdburton/pointshop/master/' -- Master is most stable, used for version checking.
PS.Config.CheckVersion = true -- Do you want to be notified when a new version of Pointshop is avaliable?
PS.Config.ShopKey = 'F2' -- Any Uppercase key or blank to disable
PS.Config.ShopCommand = 'ps_shop' -- Console command to open the shop, set to blank to disable
PS.Config.ShopChatCommand = '!shop' -- Chat command to open the shop, set to blank to disable
PS.Config.NotifyOnJoin = false -- Should players be notified about opening the shop when they spawn?
PS.Config.PointsOverTime = true -- Should players be given points over time?
PS.Config.PointsOverTimeDelay = 1 -- If so, how many minutes apart?
PS.Config.PointsOverTimeAmount = 10 -- And if so, how many points to give after the time?
PS.Config.AdminCanAccessAdminTab = true -- Can Admins access the Admin tab?
PS.Config.SuperAdminCanAccessAdminTab = true -- Can SuperAdmins access the Admin tab?
PS.Config.CanPlayersGivePoints = true -- Can players give points away to other players?
PS.Config.DisplayPreviewInMenu = true -- Can players see the preview of their items in the menu?
PS.Config.PointsName = 'Поинта(ов)' -- What are the points called?
PS.Config.SortItemsBy = '' -- How are items sorted? Set to 'Price' to sort by price.

PS.Config.CalculateBuyPrice = function(ply, item)	
	return item.Price
end

PS.Config.CalculateSellPrice = function(ply, item)
	return math.Round(item.Price * 0.75) -- 75% or 3/4 (rounded) of the original item price
end
