

	module.exports = (g)->

			allowed: true
			lev: 20
			min: 3.94 # 3.9 # 3.7
			max: 3.94 # 3.8 # 3.75
			difa: .002
			equidad: -0.5 # -0.35
			pips: 4
			sl: -20
			nimi: "polón"
			pairid: "40"
			# efe: (medias)->
			# 	console.log {medias}
			# 	true
			extender: (t)->
				if 1 > t.monto > .5 and t.tp > 2 # and t.monto > 0 # and pares[t.sign].tp.lon <= t.monto < pares[t.sign].tp.tawa
					tp: 1 # pares[t.sign].tp.tawa)
			cerrar: (v)-> v.monto > 1 # .5 # monto > 1