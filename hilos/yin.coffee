
	# cada yin tiene
	#	un saldo
	# 	una lista de pares
	#	cada par un criterio
	#		de apertura
	#		de cierre
	###
		# balance 1125
		#	una troca por par #
		#	se comienza al menos con uno de cada uno # 
		#	45 pares #
		#	25 cada par
		# abre
		#	a las 19
		#		domingos
		#		miércoles
		#	con lista alineada
		# cierra
		# 	a las 11
		# 		martes
		# 		viernes
		# criterio:
		# 	paridad: soltanto | multi
		# 	balance: 1125 # inicial
		#	mínimo: 25 # monto en que se abren
	###
	module.exports = (g)->({mango,config,criteria,wisa,mostra})-> (medias)-> (par)-> (yin)-> g.c(
		m: mango
		camino: (troca)-> g.c(
			animalia: troca.animalia
			pala: troca.lev
			monte: troca.monto
			apre: troca.sente.media["1q"]
			fino: medias["1q"]
		) ({animalia,pala,monte,apre,fino})->
			((fino/apre - 1)*monte*pala).toFixed(2)* g.s(animalia)
				sell: -1
				buy: 1
		animalia: g.m g.c(medias) (m)->
			switch
				when m["1q"] < m["5m"] < m["1h"] < m["1d"] # (g.c(medias...) g.q (a,f)-> a < f(Infinity))
					"sell"
				when m["1d"] < m["1h"] < m["5m"] < m["1q"] # (g.c(medias...) g.q (a,f)-> a > f(0))
					"buy"
				else null
	) ({m,camino,animalia})-> g.c(
		# abre más de uno del mismo tipo
		# balance
		criteria({animalia,medias,camino,m,config,par})
	) ({tempo,multi,fina})-> g.c( # pro ouvrir
		trocare: (y)->(siguiente)->
			m.troca(
				fina: y.fina
				tempo: y.tempo
				multi: y.multi
				par: par
				fino: $exists: no
			)() g.r (finando)-> (troca,trocas...)-> 
				if troca?  and (
					fina(troca.animalia)[y.fina] or not tempo[y.tempo]
				)
					m.troca(troca)(
						fino:
							media: medias
							tempo: Date.now()
					) g.r (trocaranda)-> (trocada,trocadas...)->
						g.m profina: troca
						g.m finando: trocada
						g.m cebo: trocada.cebo?
						unless trocada.cebo?
							m.yin(
								fina: y.fina
								tempo: y.tempo
								multi: y.multi
							)(
								balance: y.balance + trocada.monto + camino(trocada)
								# animalia: trocada.animalia
								# pala: config.pares[par].lev
								# monte: trocada.monto
								# apre: trocada.sente.media["1q"]
								# fino: g.m medias["1q"]
								# ya modificado
							) (genio)-> m.yin(
								fina: y.fina
								tempo: y.tempo
								multi: y.multi
							)(
								cumulo: genio.cumulo-25
							) (genio)->
								# g.m {genio}
								wisa.toma.json yin: genio
								yin.balance = genio.balance
								# delete r.yin[yin].troca.sente[par][troca["_id"]]
								# g.m finado: Object.entries r.yin[yin].troca.sente[par]
								if trocadas.length
									trocaranda trocadas...
								else
									finando trocas...
						else
							# wisa.toma.json yin: genio
							if trocadas.length
									trocaranda trocadas...
							else
								finando trocas...
				else
					# fina()
					m.troca(
						fina: y.fina
						tempo: y.tempo
						multi: y.multi
						par: par
						fino: $exists: no
					)() (trocas...)->
						# if trocas.length then g.m apertas: trocas
						g.c() g.s( g.c(
								multi[y.multi] {y,trocas}
								tempo[y.tempo]
								animalia?
								y.balance >= y.monto
							) g.q (a,f)-> a and f(on)
						)
							true: (fina)->
								# mostra sente: [par,y]
								m.troca()( # "_id" # autoañadido
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
								) (troca)-> # el mismo objeto insertado
									m.yin(
										fina: y.fina
										tempo: y.tempo
										multi: y.multi
									)(
										balance: y.balance - troca.monto
									) (genio)-> # nuevo
										m.yin(
											fina: y.fina
											tempo: y.tempo
											multi: y.multi
										)({
											cumulo: genio.cumulo+25
											(
												if genio.cumulo+25 > genio.max
													max: genio.max+25
												else {}
											)...
										}) (genio)->
											g.m {genio}
										# g.m genio
										g.m troca
										wisa.toma.json yin: genio
										yin.balance = genio.balance
										# r.yin[yin].troca.sente[par][troca["_id"]] = troca
										# g.m sentado: Object.entries r.yin[yin].troca.sente[par]
										siguiente()
							false: -> siguiente() # (fina)-> fina()
		# trocare: -> (siguiente)-> siguiente()
	) ({trocare})-> g.c(
		yinando: ({tempo,multi,fina,balance,monto})-> (siguiente)->
			m.yin({tempo,multi,fina})() (genio)->
				# g.m {genio}
				unless genio?
					m.yin({tempo,multi,fina})(
						monto: monto
						balance: balance
						cumulo: 0
						max: 0
					) (genio) -> 
						# g.m genio
						trocare(genio) siguiente
				else
					trocare(genio) siguiente
	) ({yinando}) -> g.c([]) (genios)->
		# g.c(Object.entries(genios)...) g.r (criterios)-> ([nimi,mater],genios...)->
		# g.c(Object.entries(genios)...) g.r (criterios)-> (genio,genios...)->
		# g.m {tempo,multi,fina:fina()}
		###
		g.c( 
			(g.c(
				(for ltempo of tempo
					for lfina of fina()
						for lmulti of multi
							{
								tempo: ltempo
								fina: lfina
								multi: lmulti
								monto: 25
								balance: 10000
							}
				)...
			) g.r (aplanar)-> (cubito,cubo...)->
				if cubito? # .length
					# g.m cubito
					if Array.isArray cubito?
						[aplanar(cubito...)...,aplanar(cubo...)...]
					else
						[cubito...,aplanar(cubo...)...]
				else
					[]
			)...
		###
		for ltempo of tempo
			for lfina of fina()
				for lmulti of multi
					genios.push {
						tempo: ltempo
						fina: lfina
						multi: lmulti
						monto: 25
						balance: 10000
					}
		g.c(genios...) g.r (criterios)-> (genio,genios...)->
			# finare(nimi)(mater) ->
			# g.m {genio}
			yinando(genio) ->
				g.m g.c(genio) ({multi,tempo})-> "#{multi} #{tempo}"
				if genios.length
					criterios genios...
				else
					# g.tempo(-4) ({daily})-> 
					g.tempo(
						hora: -4
						feira: -1 # - daily - 1
					) ({raw})->
						m.troca(
							par: par
							$or: [
								{fino: $exists: no}
								{
									fino: $exists: on
									"fino.tempo": $gt: raw
								}
							]
						)() (trocas...)-> g.c(g.n(par) medias) (medias)->
							wisa.toma.json {trocas,medias}
							g.m "fin"
							yin()
		###
    	"coffeescript": "^2.5.1"
    	tempos nella settimana
    	wisa arepa
    	current pair
		###