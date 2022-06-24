
	module.exports = (g) -> # seconda # x20
			allowed: on
			lev: 20
			# max: 0.69 # 0.695 # 0.7 # 0.71 # 0.72
			difa: .0001
			pips: 4
			sl: -24
			nimi: "audi"
			pairid: "5"
			cerrar: (v)->
					g.pan()(
						-> v.monto > 1 # .5 # monto > 1
						-> v.contra v.medias("sma")("20")["5m"]
					)
			extender: (t)->
				# if 1 > t.monto > .5 and t.tp > 2 # and t.monto > 0 # and pares[t.sign].tp.lon <= t.monto < pares[t.sign].tp.tawa
				if g.pan()(
					-> 1 > t.monto > .5
					-> t.tp > 2 # and t.monto > 0 # and pares[t.sign].tp.lon <= t.monto < pares[t.sign].tp.tawa
					g.r(t.m.sma["5m"]["20"][t.contrario]) (m)-> g.s(t.relevante)
						buy: -> 
							# t.log.push audusd: x: "#{t.current} < #{m["5m"]}" #sell
							t.current < m #sell
						sell: -> 
							# t.log.push audusd: x: "#{t.current} > #{m["5m"]}" #sell
							t.current > m # .buy
				) then tp: 1 # pares[t.sign].tp.tawa)
			open: (l)-> l.art.meta(-1.2) l