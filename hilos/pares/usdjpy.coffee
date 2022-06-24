 
	module.exports = (g)->

			allowed: on # prima
			lev: 30
			min: 110
			max: 107.5 # 108 # 109 # 106
			difa: .02
			pips: 2
			sl: -24
			nimi: "ninja" # "samurai"
			# cerrar: (v)-> 
			# 	v.monto > 0 and v.contra v.medias("sma")("20")["1h"]
			cerrar: (v)->
				v.monto > 1 and v.contra v.medias("sma")("20")["5m"]
			open: (l)-> l.art.meta(-1.2) l
			x: (t)->
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