

	
		module.exports = (g)->
			allowed: yes
			lev: 20
			max: 5.7 # 5.73 # 5.85 # 6 # 5.5 # 6
			sl: -20
			difa: 0.0025 # /trading/fees dice 0.005
			equidad: -0.5 # -0.45
			pips: 4
			nimi: "turca"
			open: ({media,camino,quotes,montos,art})-> g.r(
				g.chak(media.ema) (t) -> t["50"].buy
			) (m)-> [
				pequeno: camino(m["1w"])(quotes.buy)
				relevante: "buy"
				cred: -> g.pan()(
					-> art.pote("buy")(m) ({m,lista})->
						lista 7, quotes.buy, m["15m"], m["1h"], m["1d"], m["1w"]
					-> art.spazio(montos?.buy) -2.25 # (-1.2)
				)
			]
			cerrar: (t)->
				# t.cristina lev: t.lev
				g.s(t.relevante)
					buy: g.pan()(
						-> t.monto > 0
						# g.s(t.lev)
						# 	"20": -> t.cristina t.monto > 1
						# 	"10": -> t.cristina t.monto > 0.5
						->
							# t.cristina 
							[t.quotes,t.medias("ema")("50")["15m"]]
							# t.cristina 
							t.quotes < t.medias("ema")("50")["15m"]
					)
					sell: t.monto > 0
			sxt:
				difa: 6 # 4
				indietro: 3 # 2
				amplio: 11
				avanza: 1