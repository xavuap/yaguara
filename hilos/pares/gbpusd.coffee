
	module.exports = (g)->

			allowed: true
			lev: 30
			# max: 1.225 # 1.25 # 1.265 # 1.27 # 1.275 # 1.28 # 1.3 # 1.31
			difa: .0004
			pips: 4
			sl: -24
			nimi: "libra"
			cerrar: (v)->
					v.monto > 0 and v.contra v.medias("sma")("20")["5m"]