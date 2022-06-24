
	module.exports = (g)-> # seconda
			allowed: on
			lev: 20
			max: 0.65 # 0.66 # 0.665 # 0.67 # 0.68 # !
			difa: .0005
			pips: 4
			sl: -24
			nimi: "haka"
			extendere: (t)->
				g.r() g.s(
					g.r(t.m.sma["5m"]["20"][t.contrario]) g.s(t.relevante)
						buy: (m)-> t.current < m
						sell: (m)-> t.current > m
				)
					true: -> {
						(	if g.pan()(
								-> .5 < t.monto
								->  t.monto + 1 < t.tp # techo + 1 < t.tp
							)
								tp: Math.ceil t.monto
						)...
						(	if g.pan()(
								-> t.monto > 1
								-> t.sl  < t.monto - 1 # t.sl  < piso - 1
							)
								sl: Math.floor t.monto
						)...
					}
			cerrar: (v)->
					g.pan()(
						# -> v.monto > 0
						-> v.monto > .5
						# -> v.contra v.medias("sma")("20")["1h"]
						-> v.contra v.medias("sma")("20")["5m"]
					)
			open: (l)-> l.art.meta(-1.2) l