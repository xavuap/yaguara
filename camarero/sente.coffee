
	require("../gen") (gen)-> gen (g)->
		require("./mango")(g)("genios","yin","troca","media") (mango)-> g.c(
			dame: require("./dame") g
			dozo: require("./dozo") g
			human: require("./human")(g) # añadir un si se puede #
			wisa: require("../wisa") g
			me: require("./io") g
		) ({dame,dozo,human,wisa,me})-> g.c(
			config: require("../hilos/karelys")(g) #  (config)-> # personalidad del servicio #
			media: require("../hilos/media")(g) human
			arepa: require("../comensal/arepa")(g) {gen,dozo,wisa}
			heroku: require("./heroku")(me)
			criteria: require("../hilos/criteria") g
		) ({config,media,arepa,heroku,criteria})-> g.c(
			mostra: g.mt
			# geniales: {}
			marsupia: g.marsupias()
			puede: (aure)-> g.c( switch typeof aure# (booleana)->(fina)->
				# g.c(on) (claudia)->(booleana)->
				# if booleana?
				# 	claudia = booleana
				# claudia
				when "boolean"
					troca: puede: aure
					# fina: (pudo)-> g.m {pudo}
				when "function"
					fina: aure
			) ({troca,fina})->
				mango.genios(currente: "par")(troca) (genio)->
					# if booleana? then puede: booleana
					fina? genio.puede
		) ({mostra,marsupia,puede})-> g.c(
			cuerpo: null # require("../hilos/cuerpo") {g,config,human,mostra}
			yin: require("../hilos/yin")(g)({mango,config,wisa,mostra,criteria})
		) ({yin})-> 
			require("./sirvo")(g)
				arepa: (sirvo) -> g.c(sirvo.url[1..].split ":") (tren)->
					switch tren[0]
						when "", "arepa"
							marsupia("yaguara")(arepa require "../comensal/yaguara") (arepa)->
								sirvo.html arepa
							# juanas("yaguara") arepa require "../comensal/yaguara"
						when "media"
							# g.m g.n(tren[0]) tren[1]
							# media(tren[1]) (media)->
							try
								g.c(await media tren[1]) (media)->
									g.c(media) g.s( g.s(typeof media)
										object: "json"
										string: "tetas"
									) sirvo
									if typeof media is "object"
										mango.media({par:tren[1]})(media) (medias) -> g.m medias
							catch e
								g.m "#{e}"
								sirvo.json null
						when "mango"
							switch tren[1]
								when "yin"
									mango.yin()() (genios...)->
										# sirvo.json genios
										unless tren[2] in Object.values g.chak(genios) (cada)-> cada.nimi
											sirvo.json genios
										else
											g.tempo(-4) ({daily})-> g.tempo(
												hora: -4
												feira: - daily - 1
											) ({raw})->
												mango.media()() (medias...) -> g.c(
													medias: g.c(medias...) g.q (a,f)-> {(g.n(a.par) a)...,f({})...}
												) ({medias})-> mango.troca(
													yin: tren[2]
													$or: [
														{fino: $exists: no}
														{
															fino: $exists: on
															"fino.tempo": $gt: raw
														}
													]
												)() (trocas...)->
													sirvo.json {trocas,medias}
									g.m "yin": tren[2]
								when "medias"
									if tren[2]?
										mango.media(par: tren[2] )() (medias) -> g.c(
											animalia: g.c(medias) (m)->
												unless m? then undefined
												else switch
													when m["1q"] < m["5m"] < m["1h"] < m["1d"] # (g.c(medias...) g.q (a,f)-> a < f(Infinity))
														"sell"
													when m["1d"] < m["1h"] < m["5m"] < m["1q"] # (g.c(medias...) g.q (a,f)-> a > f(0))
														"buy"
													else null
										) ({animalia})->
											sirvo.json ({medias,animalia})
									else # sirvo.scusa "totas"
										mango.media()() (medias...) ->
											sirvo.json g.c(medias...) g.q (a,f)-> {(g.n(a.par) a)...,f({})...}
											# sirvo.json medias
								else
									sirvo.scusa "mambo"
						when "yin"
							dame("https://yaguara.herokuapp.com/media:#{tren[1]}").json (medias)->
								if medias?
									yin(medias)(tren[1]) ->
										mango.genios(currente: "par")(par:tren[1]) (currente)->
											sirvo.json g.m {medias,currente}
						when "puede"
							try
								# if tren[1] in Object.keys puede
								# 	puede[tren[1]] = JSON.parse tren[2]
								puede( JSON.parse tren[1]) # (pudo)->
								# g.m {erre,pudo}
								sirvo.json tren[1]
									# dame("#{me.url()}/genios").toca (erre)-> 
								# sirvo.json puede
							catch e
								sirvo.scusa "#{e}"
						when "wisa"
							sirvo.tetas wisa.toma tren[1]
						when "genios" then puede (ando)->
							unless ando
								sirvo.parlo "genios"
								g.c(Object.keys config.pares) (pares)-> mango.genios(
									currente: "par"
								)() (currente)-> 
									# puede.haciendo = on
									puede(on) # -> # (ando)->
									g.m "pude haciendo"
									g.c(pares[(pares.indexOf currente?.par)..]...) g.r (genios)-> (par,paridos...)->
										g.tempo(-4) (tempo)-> puede (ando)->
											if g.c(
												tempo.feira in ["domingo"] and tempo.hora < 18
												tempo.feira in ["sábado"]
												tempo.hora > 13 and tempo.feira in ["viernes"]
												not par?
												not ando
											) g.q (a,f) -> not a and f(on)
												# ) g.q (a,f)-> a and f(on)
												g.m "yin": par
												# g.m geniales
												# g.c(await media par) (medias) ->
												dame("https://yaguara.herokuapp.com/media:#{par}").json (medias)->
													if medias? #(typeof g.m medias) is "object"
														# mango.media({par})(medias) (medias) -> g.m medias
														yin(g.m medias)(par) ->
															mango.genios(currente: "par")({par}) (currente)->
																g.m {currente}
																if paridos.length
																	genios paridos...
																else
																	g.m "finió"
																	genios pares...
													else
														g.m "no medias"
														g.m {medias}
														heroku.refresco
															fina: (x)-> 
																g.m "refrescando"
																puede no
															erro: (erro)-> g.m erro: "#{erro}"
														# g.m medias
														# genios par, paridos...
											else
												g.m "parió"
												# puede.haciendo = no
												puede(no) # -> # (ando)->
							else
								sirvo.parla [
									"se está haciendo ya"
									"o no se va a hacer"
									"no estamos iniciando"
									""
								].join "\n"
						else
							g.mt sirvo.url
							sirvo.tetas sirvo.url
				portal: 1380
				siendo: ({porto,server})-> # sente
					g.m "ci siamo nel porto #{porto}"
					me.url porto
					# dame("#{me.url()}/puede:false").json (puede)->
					# 	g.m puede
					# 	unless puede
					# 		g.m "tocando genios"
					dame("#{me.url()}/genios").toca (tetas)-> g.m tetas
					wisa.camarero(server) ({dame,re})->
						g.m {dame}
						if typeof dame is "object" then g.tempo(-4) ({daily})-> g.tempo(
							hora: -4
							feira: - daily - 1
						) ({raw})->
							mango.media()() (medias...) -> g.c(
								medias: g.c(medias...) g.q (a,f)-> {(g.n(a.par) a)...,f({})...}
							) ({medias})-> mango.troca({
								dame...
								$or: [
									{fino: $exists: no}
									{
										fino: $exists: on
										"fino.tempo": $gt: raw
									}
								]
							})() (trocas...)-> re.json {medias,trocas}
							#g.m dame #.tetas
					# if r.puede.yin
					# dame("https://yaguara.herokuapp.com/genios").toca ->
					# if no then loop
					# for par of config.pares
					# if no then