-- If u need minutes then 1 min = 60, 2 min = 60 * 2 or 120
-- Time before the war
bcran = false

warwill = "the war will begin in "
warend = "war ends in "
start = 60*30
ends = 60*20


timer.Create( "before", start , 0, function()
	bcran = true
    timer.Stop( "before" )
	timer.Create( "after", ends , 0, function()
	bcran = false
	timer.Stop("before")
	timer.Start( "before" )
	end)
end )

surface.CreateFont( "timerfont", {
 font = "Laconic-Regular",
 size = 20,
 weight = 500,
 blursize = 0,
 scanlines = 0,
 antialias = true
})

hook.Add( "HUDPaint", "starTimer", function()

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.SetMaterial(Material("starhud/derma/button/tab_n.png"))
	surface.DrawTexturedRect(ScrW()/2 - 300,55,250,60)

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.SetMaterial(Material("starhud/derma/button/tab_n.png"))
	surface.DrawTexturedRect(ScrW()/2 + 40,55,250,60)

	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.SetMaterial(Material("starhud/derma/label_holder.png"))
	surface.DrawTexturedRect(ScrW()/2 - 150,50,273,67)
    if bcran == false then
	draw.DrawText( string.upper(warwill)..string.ToMinutesSeconds(math.ceil(timer.TimeLeft( "before" ))), "timerfont", ScrW()/2 - 15,73, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
    else
    draw.DrawText( string.upper(warend)..string.ToMinutesSeconds(math.ceil(timer.TimeLeft( "after" ))), "timerfont", ScrW()/2 - 90,73, Color( 255, 255, 255, 255 ) )
    end
	draw.DrawText( "Rebublic", "timerfont", ScrW()/2 - 245,75, Color( 255, 255, 255, 255 ) )
	draw.DrawText( "CIS", "timerfont", ScrW()/2 + 230,75, Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT )

end )
