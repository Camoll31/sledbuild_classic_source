DeriveGamemode("sandbox")

GM.Name 	= "SledBuild Classic 6.3.0"
GM.Author 	= "GeXeH (by Camoll)"
GM.Email 	= ""
GM.Website 	= ""

//Team enumerations
TEAM_BUILDING = 2
TEAM_RACING   = 1

function setTeams()
	team.SetUp(TEAM_BUILDING,"Building",Color(80,80,255,255))
	team.SetUp(TEAM_RACING,"Racing",Color(255,80,80,255))
end

setTeams()