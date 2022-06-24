
	module.exports = (g)->
			allowed: on # prima
			lev: 30
			max: 1.11 # 1.12 # 1.135 # 1.14 # 1.15
			difa: .0003
			pips: 4
			sl: -24
			nimi: "euro"
			open: (l)-> l.art.meta(-1.2) l
			extender: (t)->
				## if 1 > t.monto > .5 and t.tp > 2 # and t.monto > 0 # and pares[t.sign].tp.lon <= t.monto < pares[t.sign].tp.tawa
				## 	# console.log "extendiendo eur\\usd #{t.monto}"
				## 	# tp: 1 # pares[t.sign].tp.tawa)
			cerrar: (v)-> # v.monto > 1
				g.pan()(
					-> v.monto >= 1 # 0.5 # monto > 1
					-> v.contra v.medias("sma")("20")["5m"]
				)