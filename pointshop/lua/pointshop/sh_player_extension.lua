local Player = FindMetaTable('Player')
function Player:PS_GetUsergroup()
	if ( self.EV_GetRank ) then return self:EV_GetRank() end
	if ( serverguard ) then return serverguard.player:GetRank(self) end
	return self:GetNWString('UserGroup')
end