

	module.exports = (g)->

			allowed: on
			lev: 20
			min: 300 # 295 # 292.5 # 287 # 288 # 290
			max: 300 # 287 # 284 # 280
			difa: .2
			equidad: -0.55 # -0.6 # -0.5 # -0.35
			pips: 2
			sl: -20
			nimi: "magyar" # "húngaro"
			pairid: "91"
			open: ({media,camino,quotes,montos,art})-> g.r(
					g.chak(media.sma) (tempo)->
						tempo["20"]
				) (media) -> g.r(
					buy: 300
					sell: media["1l"].sell
				) (pivot)-> g.r(
					buy: camino(pivot.buy)(quotes.buy) # (pivot.buy/q.buy - 1)*lev*mnt # pequeno
					sell: camino(quotes.sell)(pivot.sell) # (q.sell/pivot.sell - 1)*lev*mnt
				) (pequeno) ->
					for relevante,pequeno of (
						switch
							when media["1h"].buy > media["1d"].buy # when pivot.buy > 
								buy: pequeno.buy
							when media["1h"].sell < media["1d"].sell # when pivot.sell < 
								sell: pequeno.sell
							else
								# Math.min (Object.values pequeno)...
								if pequeno.buy > pequeno.sell
									sell: pequeno.sell
								else
									buy: pequeno.buy
					)
						relevante: relevante
						pequeno: pequeno
						cred: ->
							g.pan()(
								-> art.pote(relevante)(
									g.chak(media) (t)-> t[relevante]
								) ({m,lista})->
									g.s(relevante)
										sell: lista m["1l"], quotes[relevante], m["5m"], m["1h"], m["1d"]
										buy: lista 300, quotes[relevante], m["5m"], m["1h"], m["1d"]
								-> art.spazio(montos?[relevante])(-2.25)
							)
			cerrar: (v)->
				g.pan()(
					-> v.monto > 0 # 0.5 # monto > 1
					-> v.contra v.medias("sma")("20")["5m"]
				)