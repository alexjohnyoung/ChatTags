--Chat Tags by Tyguy


local Tags = 
{
--Group    --Tag     --Color
{"admin", "[Admin] ", Color(0, 0, 255, 255) },
{"superadmin", "[Superadmin] ", Color(255, 0, 0, 255) },
{"owner", "[Owner] ", Color(0, 255, 0, 255) }
}

hook.Add("OnPlayerChat", "Tags", function(ply, strText, bTeamOnly)
	if IsValid(ply) and ply:IsPlayer() then
		for k,v in pairs(Tags) do
			if ply:IsUserGroup(v[1]) then
			local rank_str = v[2]
			local rank_col = v[3]
			local bracket_col = v[3]
			local nickteam = team.GetColor(ply:Team())
				if !bTeamOnly then
				chat.AddText(rank_col, rank_str, nickteam, ply:Nick(), color_white, ": ", strText)
				else
				chat.AddText(rank_col, rank_str, color_white, "(TEAM) ", nickteam, ply:Nick(), color_white, ": ", strText)
				end
			end
		end
	end
	if !IsValid(ply) and !ply:IsPlayer() then
	local ConsoleColor = Color(0, 255, 0) --Change this to change Console name color
	chat.AddText(ConsoleColor, "Console", color_white, ": ", strText)
	end
return true
end )