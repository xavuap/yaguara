
	module.exports = (g)->
			allowed: on
			lev: 10 # 0.001
			min: 7 # 6.81 # 6.7
			difa: .001
			equidad: false
			pips: 4
			sl: -24
			nimi: "chino"
			pairid: "961728"
			extender: (t)->
				if 1 > t.monto > .5 and t.tp > 2 # and t.monto > 0 # and pares[t.sign].tp.lon <= t.monto < pares[t.sign].tp.tawa
					tp: 1 # pares[t.sign].tp.tawa)
			cerrar: (v)-> v.monto > 1
			# open: (l)-> l.art.meta(-1.2) l