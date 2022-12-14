ITEM.Name = 'Cyborg'
ITEM.Price = 2000
ITEM.Model = 'models/xqm/rails/trackball_1.mdl'
ITEM.Attachment = 'eyes'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	local Size = Vector(0.62999999523163,0.5,0.51999998092651)
	local mat = Matrix()
	mat:Scale(Size)
	model:EnableMatrix('RenderMultiply', mat)

	model:SetMaterial('models/magnusson_device/magnusson_device_basecolor')

	local MAngle = Angle(0,0,0)
	local MPos = Vector(-2.6099998950958,0,0)

	pos = pos + (ang:Forward() * MPos.x) + (ang:Up() * MPos.z) + (ang:Right() * MPos.y)
	ang:RotateAroundAxis(ang:Forward(), MAngle.p)
	ang:RotateAroundAxis(ang:Up(), MAngle.y)
	ang:RotateAroundAxis(ang:Right(), MAngle.r)

	model.ModelDrawingAngle = model.ModelDrawingAngle or Angle(0,0,0)
	model.ModelDrawingAngle.p = (CurTime() * 1.2200000286102 *90)
	model.ModelDrawingAngle.y = (CurTime() * 0.8299999833107 *90)
	model.ModelDrawingAngle.r = (CurTime() * 0.69999998807907 *90)

	ang:RotateAroundAxis(ang:Forward(), (model.ModelDrawingAngle.p))
	ang:RotateAroundAxis(ang:Up(), (model.ModelDrawingAngle.y))
	ang:RotateAroundAxis(ang:Right(), (model.ModelDrawingAngle.r))

	halo.Add( {model},
	Color(2,4,12),
	6.7,
	6.7,
	1)


	return model, pos, ang
end
