

	module.exports = (g)->

			allowed: on
			lev: 20
			min: 9.75 # 9.55 # 9.65 # 9.5 # 9.38 # 3.375 # 9.35 # 9.25 # ~
			max: 9.7
			difa: .002
			equidad: false
			pips: 4
			sl: -20
			pairid: "41"
			nimi: "vikingo" # séquito
			extender: (t)->
				# if 1 > t.monto > .5 and t.tp > 2 # and t.monto > 0 # and pares[t.sign].tp.lon <= t.monto < pares[t.sign].tp.tawa
				if g.pan()(
					-> 1 > t.monto > .5
					-> t.tp > 2 # and t.monto > 0 # and pares[t.sign].tp.lon <= t.monto < pares[t.sign].tp.tawa
					g.r(t.m.sma["5m"]["20"][t.contrario]) (m)-> g.s(t.relevante)
						buy: -> t.current < m
						sell: -> t.current > m
				) then {} # tp: 1 # pares[t.sign].tp.tawa)
			cerrar: (v)->
					v.monto > 0.5 and g.may()(
						# -> v.monto > 1 # .5 # monto > 1
						-> v.contra v.medias("sma")("20")["5m"]
					)
			open: ({media,camino,quotes,montos,art})-> g.r(
					g.chak(media.sma) (tempo)->
						tempo["20"]
				) (media) -> g.r(
					buy: 10
					sell: media["1l"].sell
				) (pivot)-> g.r(
					buy: camino(pivot.buy)(quotes.buy) # (pivot.buy/q.buy - 1)*lev*mnt # pequeno
					sell: camino(quotes.sell)(pivot.sell) # (q.sell/pivot.sell - 1)*lev*mnt
				) (pequeno) ->
					for relevante,pequeno of (
						switch
							when pivot.buy > media["1h"].buy > media["1d"].buy
								buy: pequeno.buy
							when pivot.sell < media["1h"].sell < media["1d"].sell 
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
										buy: lista 10, quotes[relevante], m["5m"], m["1h"], m["1d"]
								-> art.spazio(montos?[relevante])(-2.25)
							)