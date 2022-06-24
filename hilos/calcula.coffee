#!/usr/local/bin/coffee
	require("../gen") (gen)-> gen (g)->
		require("../camarero/mango")(g)("genios","yin","troca","media") (mango)-> g.c(
			criteria: require("./criteria")(g)()
			camino: (troca)-> (media)->g.c(
				animalia: troca.animalia
				pala: troca.lev
				monte: troca.monto
				apre: troca.sente.media["1q"]
				fino: troca.fino?.media["1q"] ? media["1q"] ? troca.sente.media["1q"]
			) ({animalia,pala,monte,apre,fino})->
				(fino/apre - 1)*monte*pala * g.s(animalia)
					sell: -1
					buy: 1
		) ({criteria,camino})-> g.tempo(-4) ({daily})-> g.tempo(
			hora: -4 #-6 # -9 # -10
			feira: - daily - 1 # -1 #
		) ({raw})-> g.c(raw) (desde)-> g.tempo(
			hora: -4 #-6
			# feira: -1
		) ({raw})-> g.c(raw) (hasta)-> mango.media()() (medias...) -> g.c(
			medias: g.c(medias...) g.q (a,f)-> {(g.n(a.par) a)...,f({})...}
			cubo: []
			salida: g.c(
				posi: []
				nega: []
			) (claudia) -> (valeria)->
				if valeria?
					(quanta)-> g.c(
						#valeria: Math.abs (((valeria*100).toFixed(0)*1)) # /quanta.max*1000).toFixed(0)*1
						valeria: Math.abs (((valeria*100).toFixed(0)*1)/quanta.max*1000).toFixed(0)*1
						signa: claudia[
							if valeria < 0
								"nega"
							else
								"posi"
						]
					) ({valeria,signa})-> g.c(valeria) g.r (asigna)-> (valeria)->
						# g.m {signa,valeria}
						unless signa[valeria]?
							signa[valeria] = quanta
						else
							asigna valeria+1
				else
					g.c(
						if process.argv[2]?
							nega: claudia.posi
							posi: claudia.nega
						else
							claudia
					) ({nega,posi})->
						nega.reverse().concat posi
			q: 1
		) ({medias,cubo,salida,q})->  # no, diario, [spazini, cevi] : cevini
			if no then for multi in [
				"soltanto"
				"spazio"
				"spazini"
				"spazepte"
				"cedando"
				"cevando"
				"cetrando"
				"cequando"
				"cemando"
				"cebando"
				"cebo"
				"semi"
				"cetri"
				"cevi"
				"cedi"
				"semini"
				"cetrini"
				"cevini"
				"cedini"
				"cequa"
				"cedipte"
				"cevipte"
				"cetrepte"
				"cequapte"
			] then for fina in [
				#"no"
				"encontro"
				#"antihora"
				#"contra"
			] then for tempo in [
				#"perla"
				"perlario"
				#"madruga"
				#"madrugonazo"
				#"otan"
				"diario"
				"nueve"
				"diez"
				"completa"
				"plena"
				#"bisemanal"
				#"semanal"
				#"cualquiera"
			] then  no
			# for criterio of criteria
			# 	g.m criterio
			for multi of criteria.multi
				for fina of criteria.fina()
					for tempo of criteria.tempo
						cubo.push {multi,fina,tempo}
			g.c(cubo...) g.r (culote)-> (genio,genios...)->
				# g.c({multi,fina,tempo}) (genio)-> 
				if genio?
					process.stdout.write ["\r",q++,"/",cubo.length].join ""
					mango.yin(genio)() ({max})-> mango.troca({
						genio...
						cebo: $exists: no
						$or: [
							{fino: $exists: no}
							{
								fino: $exists: on
								"fino.tempo":
									$gt: desde
									$lt: hasta
							}
						]
					})() (a...)-> g.c(
						valeria: (g.c(a...) g.q (a,f)-> (if a? then camino(a)(medias[a.par])*1 else 0) + f(0)).toFixed(2)*1
					) ({valeria})->
						salida(valeria) {
							#genio...
							tempo: genio.tempo
							multi: genio.multi
							max: max
							rata: (valeria/max)
							valeria
							# valeria: g.c(a...) g.q (a,f)-> (f(0) + camino(a)(medias[a.par])*1).toFixed(2)*1
						}
						culote genios...
				else
					for a in salida()
						g.m a if a?
					g.m "fino"

