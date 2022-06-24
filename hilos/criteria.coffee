
	module.exports = (g)-> g.c( # (animalia)->
		tempo: g.c(
			jour: (sente,fino)-> g.tempo(-4) (tempo)-> 
				tempo.feira not in ["sábado"] and (
					sente <= tempo.hora or tempo.hora < fino
				) and (
					tempo.feira isnt "domingo" or tempo.hora >= sente
				) and (
					tempo.feira isnt "viernes" or tempo.hora < fino
				)
		) ({jour})->
			#bisemanal: g.tempo(-4) (tempo)-> g.c(
			#	tempo.hora > 19 and tempo.feira in ["domingo","miércoles"]
			#	tempo.feira in ["lunes","jueves"]
			#	tempo.feira in ["martes","viernes"] and tempo.hora < 15
			# ) g.q (a,f)-> a or f no
			# pro ouvrir
			# una vez por semana
			#semanal: g.tempo(-4) (tempo)-> g.c(
			#	tempo.hora > 19 and tempo.feira in ["domingo"]
			#	tempo.feira in ["lunes","martes","miércoles","jueves"]
			#	tempo.feira in ["viernes"] and tempo.hora < 15
			#) g.q (a,f)-> a or f no
			# cualquiera: on
			diario: jour 21,11
			#madruga: jour 21, 3
			# madrugonazo: jour 21, 4
			# nueve: jour 21,9
			# diez: jour 22,10
			# perla: jour 20, 3
			# perlario: jour 20, 11
			perlmezzo: jour 20, 12
			completa: jour 19, 15
			plena: jour 19, 13
			# otan: g.tempo(-4) (tempo)-> 
			# 	tempo.feira not in ["sábado","domingo"] and 8 <= tempo.hora < 12
	) ({tempo})-> ({animalia,medias,camino,m,config,par})->
		tempo: tempo
		multi: g.c(
			puede: (y)-> g.c(
					# multi[v.multi] trocas...
					tempo[y.tempo]
					animalia?
					y.balance >= y.monto
				) g.q (a,f)-> a and f(on)
		) ({puede})-> g.c(
			cebar: (y)->
				if puede(y) then m.troca()( # "_id" # autoañadido
					animalia: animalia
					monto: y.monto
					lev: config.pares[par].lev
					fina: y.fina
					tempo: y.tempo
					multi: y.multi
					par: par
					sente: 
						media: medias
						tempo: Date.now() # (new Date()).getTime()
					cebo: on
				) (troca)->
					g.m cebado: g.n(par) y
		) ({cebar})-> g.c(
			ei: (máx,spazio,quanta)->({y,trocas})-> g.c(
				cebo: no
				salida: no
			) ({cebo,salida})-> # quanta: incluyendo cebo
				for troca in trocas
					if -spazio <= camino(troca) <= spazio and not troca.cebo?
						return no
					# if trocas.length is quanta
					# 	return no
					# else
					# 	salida = on
					if troca.cebo?
						cebo = on
						if camino(troca) > máx # 0.5
							salida = on
				# no hay abiertos
				if not cebo
					cebar(y) # devuelve cebo
				salida # and cebo
			sideral: (amplitud)-> ({trocas})-> 
				# if not trocas.length
				# 	true
				# else
				for troca in trocas
					if -amplitud <= camino(troca) <= amplitud
						return no
				on 
			ninfa: (fina)-> ({y,trocas})->
				unless par in ["usdtry","usdzar","usdcnh","usdmxn","usdjpy","usdchf"]
					fina {y,trocas,par}
				else no
			soltanto: ({trocas})->
				for troca in trocas # r.yin[yin].troca.sente[par]
					return no
				on
				# sente {par,criterio} "precargados en ram"
				# r.troca.sente[par]?
		) ({ei,sideral,ninfa,soltanto})->
			soltanto: soltanto
			# varios: ->(trocas...)->
			# 	for troca in trocas # r.yin[yin].troca.sente[par]
			# 		if -2.25 < g.m camino troca
			# 			return no
			# 	on
			spazio: sideral(1)
			spanini: sideral 0.3
			spazini: sideral 0.5
			spazepte: sideral 0.7
			# cedando: ei 0.1, Infinity
			# cevando: ei 0.2, Infinity
			cetrando: ei 0.3, Infinity
			# cequando: ei 0.4, Infinity
			# cemando: ei 0.5, Infinity
			# cebando: ei 1, Infinity
			# semini: ei 0.5, 0.5
			# cetrini: ei 0.3, 0.5
			cetrinri: ei 0.3, 0.3
			# cevini: ei 0.2, 0.5
			# cedini: ei 0.1, 0.5
			# cedipte: ei 0.1, 0.7
			# cevipte: ei 0.2, 0.7
			# cetrepte: ei 0.3, 0.7
			# cequapte: ei 0.4, 0.7
			# semi: ei 0.5,1 
			# cequa: ei 0.4,1
			# cetri: ei 0.3,1
			# cevi: ei 0.2,1
			# cedi: ei 0.1,1
			ninfa: ninfa soltanto
			cebo: ({y,trocas})-> g.c(no) (cebo)->
				for troca in trocas
					if -1 <= camino(troca) <= 1
						return no
					if troca.cebo?
						cebo = on
				# no hay abiertos
				if not cebo
					cebar(y) # devuelve cebo
				cebo
		# balance: (yin)-> # ¿ yin = criterio ? #
		# 	mango(yin).balance > 25
		fina: (animalia)->
			# bisemanal: not bisemanal
			# semanal: not semanal
			# no: no
			encontro: switch animalia
				when "buy" then medias["5m"] < medias["1h"]
				when "sell" then medias["5m"] > medias["1h"]
				else no
			# antihora: switch animalia
			# 	when "buy" then medias["1q"] < medias["1h"]
			# 	when "sell" then medias["1q"] > medias["1h"]
			# 	else no
			# contra: switch animalia
			# 	when "buy" then medias["1q"] < medias["5m"]
			# 	when "sell" then medias["1q"] > medias["5m"]
			# 	else no