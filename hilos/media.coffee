
	module.exports = (g)->(human)->(par) -> await human (h)-> await g.c(
		par: [par.slice(0,3),par.slice(3)].join("-")
		troca: (troca) ->
			await h.e troca, (troca)->
				$("li[data-period=#{troca}]").click() # [pairid=#{pairid}]
			await h.w 1000
			await h.e ->
				$ "table#curr_table.genTbl.closedTbl.movingAvgsTbl.float_lang_base_2 tr:nth-child(3) td:nth-child(2)"
					.text().trim().split("\n")[0]*1
	) ({par,troca})->
		g.m going: par
		await h.a "https://www.investing.com/currencies/#{par}-technical"
		"1q": await h.e -> $("#last_last").text()*1
		"5m": await troca "300"
		"1h": await troca "3600"
		"1d": await troca "86400"