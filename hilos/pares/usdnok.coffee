

	module.exports = (g)->

			allowed: true
			lev: 20
			min: 8.9 # 8.8 # 8.6 # 8.5
			max: 8.8 # 8.7 # 8.6 # 8.7
			difa: .002
			equidad: -0.5 # false
			pips: 4
			sl: -20
			pairid: "59"
			nimi: "norteño" # gnochi
			# extender: (t)->
			# 	if 1 > t.monto > .5 and t.tp > 2 # and t.monto > 0 # and pares[t.sign].tp.lon <= t.monto < pares[t.sign].tp.tawa
			# 		{} # tp: 1 # pares[t.sign].tp.tawa)
			cerrar: (v)-> v.monto > 0 and v.contra v.medias("sma")("20")["5m"]
			open: ({media,camino,quotes,montos,art})-> g.r(
				g.chak(media.sma) (t) -> t["20"].buy
			) (m)-> [
				pequeno: camino(m["1l"])(quotes.buy)
				relevante: "buy"
				cred: -> g.pan()(
					-> art.pote("buy")(m) ({m,lista})->
						# lista 7, quotes.buy, m["15m"], m["1h"], m["1d"], m["1w"]
						lista m["1l"], quotes.buy, m["5m"], m["1h"], m["1d"]
					-> art.spazio(montos?.buy) -2.25 # (-1.2)
				)
			]