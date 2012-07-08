/*
THIS CONTENT WAS MADE BY BLACKOPS7799

IF THIS CONTENT IS IN ANY OTHER PACK THAT IS NOT RELEASED BY ME IT IS STOLEN

PLEASE DONT USE MY STUFF FOR YOUR MODS.
*/

include('shared.lua')

local num_one 	= Material( "models/weapons/v_ma5b/numbers_plate7" )
local num_two 	= Material( "models/weapons/v_ma5b/numbers_plate1" )

local numtexture_one = GetRenderTarget( "HaloAmmoOne", 64, 64 )
local numtexture_two = GetRenderTarget( "HaloAmmoTwo", 64, 64 )

--[[function SWEP:DrawHUD()
	surface.SetTexture( surface.GetTextureID("VGUI/halohud/h1/h1SMG" ))
	surface.SetDrawColor( 30, 80, 130, 255 )
	surface.DrawTexturedRect( ScrW()/2 - 64, ScrH()/2 - 64, 128, 128 )
end]]--

function SWEP:ViewModelDrawn()

	local Number = LocalPlayer():GetActiveWeapon():Clip1()
	local Table = getNumberTable( Number )

	--local texture_one = surface.GetTextureID( "VGUI/ma5bhud/numbers_plate"..Table[1] )
	--local texture_two = surface.GetTextureID( "VGUI/ma5bhud/numbers_plate"..Table[2] )
	local texture_one = texture_one
	local texture_two = texture_two

	if (Table[2]) == nil then
		texture_one = surface.GetTextureID( "VGUI/ma5bhud/numbers_plate0" )
		texture_two = surface.GetTextureID( "VGUI/ma5bhud/numbers_plate"..Table[1] )
	else
		texture_one = surface.GetTextureID( "VGUI/ma5bhud/numbers_plate"..Table[1] )
		texture_two = surface.GetTextureID( "VGUI/ma5bhud/numbers_plate"..Table[2] )
	end

	num_one:SetMaterialTexture( "$basetexture", numtexture_one )	

	render.SetRenderTarget( numtexture_one ) 
	render.SetViewPort( 0, 0, 64, 64 ) 
	cam.Start2D()

	surface.SetDrawColor( 255, 255, 255, 255 ) 
	surface.SetTexture( texture_one )
	surface.DrawTexturedRect( 0, 0, 64, 64 ) 

	cam.End2D() 

	num_two:SetMaterialTexture( "$basetexture", numtexture_two )

	render.SetRenderTarget( numtexture_two )
	render.SetViewPort( 0, 0, 64, 64 )
	cam.Start2D()

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.SetTexture( texture_two )
	surface.DrawTexturedRect( 0, 0, 64, 64 )

 	cam.End2D()

end

function getNumberTable( Number )
	local String = tostring( Number )
	local Table = {}
 
	for I = 1, string.len( String ) do
		local Character = string.sub( String, I, I)
		Table[#Table + 1] = tonumber( Character )
	end
	return Table
end