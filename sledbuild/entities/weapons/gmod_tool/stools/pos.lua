TOOL.AddToMenu = false
TOOL.Category = "Construction"
TOOL.Name = "Позиция"
TOOL.Command = nil
TOOL.ConfigName = ""

if(CLIENT) then
	language.Add("tool.getpos.name","Позиция")
	language.Add("tool.getpos.desc","")
	language.Add("tool.getpos.0","ЛКМ - Позиция прицела. ПКМ - получение позиции игрока.")
	function TOOL.BuildCPanel(pnl)
		pnl:AddControl("Header",{Text = "Позиция", Description = [[ЛКМ - Позиция прицела. ПКМ - получение позиции игрока.]]})
	end
end

function TOOL:LeftClick( trace )
	self:GetOwner():ChatPrint("Vector("..trace.HitPos.x..", "..trace.HitPos.y..", "..trace.HitPos.z..")")
	return true
end
 
function TOOL:RightClick( trace )
	self:GetOwner():ChatPrint("Vector("..self:GetOwner():GetPos().x..", "..self:GetOwner():GetPos().y..", "..self:GetOwner():GetPos().z..")")
	return false
end

function TOOL:Reload( trace )
end