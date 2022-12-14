ENT.Base 			= 'base_ai'

ENT.Type 			= 'ai'

ENT.PrintName		= 'USC'

ENT.Author 			= 'Camoll'

ENT.Contact	 		= ''

ENT.Category 		= 'Разное'

ENT.Spawnable 		= false

ENT.AdminSpawnable 	= true



if SERVER then



AddCSLuaFile()



function ENT:Initialize()



	self:SetModel("models/Humans/Group02/male_06.mdl")

	self:SetHullType(HULL_HUMAN)

	self:SetHullSizeNormal()

	self:SetNPCState(NPC_STATE_SCRIPT)

	self:SetSolid(SOLID_BBOX)

	self:SetUseType(SIMPLE_USE)

	self:SetBloodColor(BLOOD_COLOR_RED)

	self:CapabilitiesAdd(bit.bor(CAP_ANIMATEDFACE, CAP_TURN_HEAD))



end



util.AddNetworkString 'okraina.travel'



function ENT:AcceptInput(name, ply, caller)



	if not ply:IsValid() or not ply:IsPlayer() then return end



	net.Start('okraina.travel')

	net.Send(ply)



end



elseif CLIENT then



surface.CreateFont('octoshop.npc', {

	size = 64,

	weight = 350,

	antialias = true,

	extended = true,

	font = "Roboto"

})



function ENT:Draw()



	self:DrawModel()



	local pos = self:GetPos()

	if EyePos():DistToSqr(pos) < 40000 then

		local ang = self:GetAngles()

		ang:RotateAroundAxis(ang:Up(), 90)

		ang:RotateAroundAxis(ang:Forward(), 90)

		ang:RotateAroundAxis(ang:Right(), 0)



		cam.Start3D2D(pos, ang, 0.1)

			draw.SimpleText('Переехать', 'octoshop.npc', 0, -800, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)

		cam.End3D2D()

	end



end


local servers = {
    [ "109.171.53.136:27075" ] = "[►] UnliRP ✦ Downtown ✦ Alpha",
    [ "109.171.53.136:27065" ] = "[►] THE HUNT - БУДНИ СОПРТИВЛЕНИЯ",
}

net.Receive('okraina.travel', function(len)

	local frame = vgui.Create( "DFrame" )
    frame:MakePopup( )
    frame:SetTitle( "Переехать" )
    frame:SetSize( 300, 300 )

    local _childs = frame:ChildCount( )

    local label = vgui.Create( "DLabel", frame )
    label:SetTall( 30 )
    label:SetFont( "Trebuchet24" )
    label:SetText( "Выберите сервер:" )
    label:Dock( TOP )
    label:SetTextColor( Color( 255, 255, 255 ) )
    label:SetContentAlignment( 5 )

    local currentIP = game.GetIPAddress( )
    for ip, name in SortedPairsByValue( servers ) do
        if ip == currentIP then continue end
        
        local btn = vgui.Create( "DButton", frame )
        btn:Dock( TOP )
        btn:SetText( name )
        btn:SetContentAlignment( 5 )
        btn:SetTall( 30 )
        btn.DoClick = function( )
			frame:Remove( )
            LocalPlayer( ):ConCommand( "connect " .. ip )
        end
    end
    
    frame:SetTall( (frame:ChildCount( ) - _childs) * 30 + 36 )
    frame:Center( )
end)
end