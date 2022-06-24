
	module.exports = (g)-> # seconda
			allowed: on
			lev: 10
			max: 14.5 # 10x
			difa: .005
			equidad: false
			pips: 4
			sl: -24
			nimi: "afro"
			extender: (t)->
				if (
					g.r(t.m.sma["5m"]["20"][t.contrario]) g.s(t.relevante)
						buy: (m)-> t.current < m
						sell: (m)-> t.current > m
				)
					{
						(	if g.pan()(
								-> .5 < t.monto
								->  t.tp > t.monto + 1 # techo + 1 < t.tp
							)
								tp: Math.ceil t.monto
						)...
						(	if g.pan()(
								-> t.monto > 1
								-> t.sl < t.monto - 1 # piso -1
							)
								sl: Math.floor t.monto
						)...
					}
			cerrar: (v)->
					# v.log.push v.medias
					v.log.push c: g.mariel(v.monto) 
						q: v.quotes
						"5m": v.medias("sma")("20")["5m"] # .join " > "
					# console.log c: [v.monto, v.quotes[v.contrario], v.medias[v.contrario]["5m"]]
					g.pan()(
						-> v.monto > 0
						g.r(
							v.medias("sma")("20")
							v.quotes
						) (m,q)-> g.s(v.relevante)
							buy: ->
								g.may()(
									-> q < m["1h"] # .sell # q < m["1h"] # q < m["5m"] < m["1h"] # m["5m"] > m["1h"] # > m["1d"]
									-> g.pan()(
										-> q < m["5m"] # .sell
										-> v.tp < 12
										-> v.monto > 0.5
									)
								)
							sell: ->
								g.may()(
									-> q > m["1h"] # .buy # q < m["1h"] # q < m["5m"] < m["1h"] # m["5m"] > m["1h"] # > m["1d"]
									-> g.pan()(
										-> q > m["5m"] # .buy
										-> v.tp < 12
										-> v.monto > 0.5
									)
								)
					)
			open: ({media,camino,quotes,montos,art})-> 
				art.matters({media,quotes,camino}) ({m,relevante,pequeno})->
					cred: ->
						g.pan()(
							-> art.pote(relevante)(
								g.chak(m) (t)-> t[relevante]
							) ({m,lista})->
								lista m["1l"], quotes[relevante], m["5m"], m["1h"], m["1d"]
							-> 
								art.spazio(montos?[relevante]) g.s(relevante)
									buy: -1.2
									sell: -2.25
						)
					pequeno: pequeno
					relevante: relevante