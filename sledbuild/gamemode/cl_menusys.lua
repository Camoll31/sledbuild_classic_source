HIGHLIGHT = Color( 255, 255, 255, 255 )
BGCOLOR = Color( 22, 150, 242, 255 )
CELLALPHA = 200

function SetDrawColor( colort, alphaoverwrite )
	alphaoverwrite = alphaoverwrite or colort.a
	surface.SetDrawColor( colort.r, colort.g, colort.b, alphaoverwrite )
end

function SetTextColor( colort, alphaoverwrite )
	alphaoverwrite = alphaoverwrite or colort.a
	surface.SetTextColor( colort.r, colort.g, colort.b, alphaoverwrite )
end

function DrawLogoBox( x, y, w, h )
	local xCenter = math.floor( x + ( w / 2 ) )
	local yCenter = math.floor( y + ( h / 2 ) )
	

	
	surface.SetFont( "ScoreboardHead" )
	surface.SetTextColor( 0, 0, 0, 200 )
	surface.SetTextPos( xCenter - 151, yCenter - -230 )
	surface.DrawText( "SledBuild Classic" )
	surface.SetTextColor( 255, 255, 255, 255 )
	surface.SetTextPos( xCenter - 150, yCenter - -230 )
	surface.DrawText( "SledBuild Classic" )
	
	surface.SetFont( "ScoreboardText" )
	surface.SetTextColor( 0, 0, 0, 255 )
	surface.SetTextPos( xCenter + -85, yCenter + 270 )
	surface.DrawText( "Gamemode version: 6.3.0" )
	surface.SetTextColor( 255, 255, 255, 255 )
	surface.SetTextPos( xCenter + -85, yCenter + 270 )
	surface.DrawText( "Gamemode version: 6.3.0" )

end

TAB_SCORES = 1
TAB_HELP = 2
TAB_ADMIN = 3

include( 'cl_scoreboard.lua' )
include( 'cl_helpscreen.lua' )
include( 'cl_mbuttons.lua' )

CurrentTab = TAB_SCORES

function GM:ScoreboardShow()
	GAMEMODE.ShowMenu = true
	gui.EnableScreenClicker( true )
end

function GM:ScoreboardHide()
	GAMEMODE.ShowMenu = false
	gui.EnableScreenClicker( false )
end

function GM:HUDDrawScoreBoard()
	if ( GAMEMODE.ShowMenu ) then
		local bWidth = math.floor( math.Clamp( ScrW() - ( ScrW()/5 ), 600, 900 ) )
		local startX = math.floor( ( ScrW() - bWidth ) / 2 )
		local startY = 32
		DrawLogoBox( startX, startY, bWidth, 130 )
		startY = startY + 365
		
		Buttons_Render( startX, startY, bWidth, 32 )
		startY = startY +35
		
		if CurrentTab == TAB_SCORES then
			HUDDrawScoreBoard( startX, startY, bWidth )
		elseif CurrentTab == TAB_HELP then
			HUDDrawHelpScreen( startX, startY, bWidth )
		elseif CurrentTab == TAB_ADMIN then
			HUDDrawAdminScreen( startX, startY, bWidth )
		end
	end
end
