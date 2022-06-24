
	module.exports = (g)->
	
			allowed: true
			lev: 20
			min: 1.375 # 1.39
			max: 1.375 # 1.365 # 1.36
			difa: .0003
			pips: 4
			sl: -20
			equidad: false
			nimi: "saigón"
			pairid: "42"
			cerrar: (v)-> g.s(v.relevante) buy:  v.monto > 1