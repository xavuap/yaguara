

	module.exports = (g)->

			# seconda
			allowed: on
			lev: 20
			max: 19.5
			difa: .002
			equidad: false
			pips: 4
			sl: -20
			nimi: "charro"
			open: ({media,camino,quotes,montos,art})-> g.r(
					g.chak(media.sma) (tempo)->
						tempo["20"]
				) (media) -> g.r(
					buy: 20
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
										buy: lista 20, quotes[relevante], m["5m"], m["1h"], m["1d"]
										sell: lista m["1l"], quotes[relevante], m["5m"], m["1h"], m["1d"]
								-> art.spazio(montos?[relevante])(-2.25)
							)