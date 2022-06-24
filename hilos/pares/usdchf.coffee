
	module.exports = (g)->
		
			allowed: true # prima
			lev: 30
			min: 0.99
			max: 1
			difa: .0003
			pips: 4
			sl: -24
			nimi: "suizo" # chofis
			# extender: (t)->
			# 	if 1 > t.monto > .5 and t.tp > 2
			# 		tp: 1 
			open: (l)-> l.art.meta(-1.2) l
			openado: ({media,camino,quotes,montos,art})-> 
				art.matters({media,quotes,camino}) ({m,relevante,pequeno})->
					cred: ->
						g.pan()(
							-> art.pote(relevante)(
								g.chak(m) (t)-> t[relevante]
							) ({m,lista})->
								lista 1, quotes[relevante], m["5m"], m["1h"] # , m["1d"]
							-> 
								art.spazio(montos?[relevante]) g.r( (relevante)-> [
									1
									quotes[relevante]
									m["5m"][relevante]
									m["1h"][relevante]
									m["1d"][relevante]
								]) (ele) ->
									if g.may(
										g.shrinking ele "buy"
										g.crescendo ele "sell"
									)
										g.m -1.2
									else
										g.m -2.25
						)
					pequeno: pequeno
					relevante: relevante
			cerrar: (v)->
				v.monto > 1 and v.contra v.medias("sma")("20")["5m"]