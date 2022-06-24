
	module.exports = (g)->(h)->(w)-> g.c(
		# tortuga: -> g.m location.hash = g.c() ->
		# 	g.c("yin","daily") g.q (a,f) -> [
		# 			(
		# 				g.c(sessionStorage.getItem a) (item)->
		# 					if item? then [item] else []
		# 			)...
		# 			f([])...
		# 		]
		# 	.join "."
		yin: ""
		daily: ""
	) (tortugas)-> g.c(
		puede: no
		marco: h.marco("div").css backgroundColor: "teal"
		queta: (nimi)->
		linha: (clases...)->(t)->
			h.tag "div"
				.addClass ["linha",clases...].join " "
				.css
					display: "flex"
					flexWrap: "nowrap"
					justifyContent: "space-evenly"
					alignItems: "center"
				.append g.c() ->
					for campo of t # if campo not in ["yin"]
						h.tag "span"
							.addClass campo
							.text t[campo]
							.css h.pared
		pared: (campos)->
			for campo of campos
				h.tag "span"
					.addClass campo
					.text campos[campo]
					.css h.pared
		genios: g.c(h.tag "div") (genios)->
			h.body.prepend genios
				.addClass "genios"
				.css
					display: "flex"
					flexWrap: "wrap"
					justifyContent: "space-evenly"
					alignItems: "center"
			genios
		luces: g.c(h.tag "div") (luces)->
			h.body.append luces
				.addClass "luces"
				.css
					display: "flex"
					flexWrap: "wrap"
					justifyContent: "space-evenly"
					alignItems: "center"
			luces
		tortuga: ()->
		yin: (genios)->
			for {nimi,balance} in genios
				unless $(".yin.#{nimi}").length
					$(".genios").append g.c() ->
						h.tag "a"
							.addClass "yin #{nimi}"
							.text ".#{nimi}"
							.css h.pared
							.css h.enlace
							.attr href: "#.#{nimi}"
							# .click g.juana ->
							# .click g.c(
							# 	nimi: ".#{nimi}"
							# 	# juana: g.juana()
							# ) ({nimi})-> -> 
							# 	# juana ->
							# 	# g.m location.hash = nimi
							# 	# sessionStorage.setItem("yin",nimi)
							# 	# tortuga()
				sessionStorage.setItem(nimi,balance)
		# daily: (yin)->(tempo)->
		# 	unless $(".#{yin}.karelia.#{tempo}").length
		# 		$(".luces").append g.c() ->
		# 			h.tag "a"
		# 				.addClass [yin,"karelia",tempo].join " "
		# 				.text ".#{tempo}"
		# 				.css h.pared
		# 				.css h.enlace
		# 				.attr href: "#.#{yin}.#{tempo}"
		# 				# .click g.c({tempo}) ({tempo})-> -> 
		# 				# 	# location.hash
		# 				# 	# sessionStorage.setItem("daily",tempo)
		# 				# 	# tortuga()
		# 	tempo
		karelia: (l)->(yin)->(tempo)-> g.c(
			l.marco.children(".karelia.#{yin}")
		) (linha)-> g.c(
			unless linha.length
				g.c(
					l.linha("karelia",yin)
						monto: 0
						ene: 0
						quanta: 0
				) (linha)->
					linha
						.css
							backgroundColor: "lightblue"
							position: "sticky"
							# top: "0"
						.attr {yin}
					l.marco.append linha
					linha
			else
				linha
		) (linha)->
			unless linha.hasClass tempo
				linha
					.addClass tempo
					.append g.c() ->
						h.tag "a"
							.addClass [yin,"karelia",tempo].join " "
							.text ".#{tempo}"
							.css h.pared
							.css h.enlace
							.attr href: "#.#{yin}.#{tempo}"
							.hide()
			tempo
		vida: ()->
		tempo: (tempo)-> g.c(new Date tempo) (tempo)-> g.c(
			tempo.setUTCHours tempo.getUTCHours() - 4
		) -> g.c(
			feira: g.s(tempo.getUTCDay()) ["☼","☽","♂","☿","♃","♀","♄"]
			hora: tempo.getUTCHours()
			minuti: tempo.getUTCMinutes()
		) ({feira,hora,minuti})->
			[feira," ",hora,"°"," ",minuti,"'"].join ""
		# daily: (daily)->
		# 	g.tempo(
		# 		hora: -4
		# 		feira: - daily
		# 	) ({raw})->
	) (l)-> g.c(
		trocadera: g.c(
			camino: ({animalia,pala,monte,apre,fino})->
				((fino/apre - 1)*monte*pala * g.s(animalia)
					sell: -1
					buy: 1
				).toFixed(2)
			daily: (tempo)->
				if tempo? then g.tempo({tempo,hora:-4}) ({daily,hora})-> g.c(
					(daily + if hora < 15 then -1 else 0)
				) (daily)-> [
					"prima"
					"seconda"
					"terza"
					"quarta"
					"quinta"
					"sábado"
				][daily] ? console.warn {daily}
			# marsupia: g.marsupias() # {}
			contras: ({medias,animalia})-> g.c(
				meia: (meia...)->
					meia[0] >= meia[1] >= meia[2] >= meia[3]
			) ({meia})-> g.c(
				q1: medias["1q"]
				m5: medias["5m"]
				h1: medias["1h"]
				d1: medias["1d"]
			) g.s(animalia)
				buy: ({q1,m5,h1,d1})->
					if meia q1,m5,h1,d1
						"grulla"
					else if meia m5,q1,h1,d1
						"contra"
					else if meia m5,h1,q1,d1
						"antihora"
					else if h1 >= m5
						"encontro"
					else
						"desdichada"
				sell: ({d1,h1,m5,q1})->
					if meia d1,h1,m5,q1
						"panda"
					else if meia d1,h1,q1,m5
						"contra"
					else if meia d1,q1,h1,m5
						"antihora"
					else if m5 >= h1
						"encontro"
					else
						"desdichada"
		) ({camino,daily,contras})-> (juana)-> ({trocas,medias})->  g.c(
			# montos: g.montos {}
			montos: g.c({}) (claudia)-> (ki)->
				unless claudia[ki]? then claudia[ki] = {}
				(adornos) -> # g.mostra claudia
					for adorno of adornos
						unless claudia[ki][adorno]?
							claudia[ki][adorno] = adornos[adorno]
						else
							claudia[ki][adorno] += adornos[adorno]
					# claudia[ki] += adornos
					claudia[ki]
			# monto: g.camila(0) (c,q)-> c + q
			roja: g.juana()
			trocas: g.juanas()
			lasta: g.valeria() # $(".linha.parce:visible").last()
			yin: g.ki()
			juana: juana
		) (juana)->
			# g.m "trocadera #{fruta}"
			$(".linha").siblings(".karelia,.toto").remove()
			for t in trocas ? [] 
				# if fruta is "cacao" then 
				juana.trocas(t.par) (par)->
					if t.fino? then g.m t
					g.m "borrar #{par}"
					$(".linha.troca.#{par}").remove() # .vivo
				# if geniales[t.yin]() or fruta is "mango"
				#	geniales[t.yin] on
				if juana.juana(t)()
					g.c(
						daily(t.fino?.tempo)
					) (daily)-> (
						(ciruelas...)->
							if t.fino? then g.c(
								$(".linha.parce[fina=#{t.fina}][multi=#{t.multi}][tempo=#{t.tempo}]")
							) (parce)->
								if parce.length # and not ciruelas[1]?.hasClass "parce"
									if ciruelas[1]?.hasClass "parce"
										parce.last().after ciruelas
									else
										parce.filter(".#{daily}").before ciruelas
										# parce.last().before ciruelas
								else # if ciruelas[1]?.hasClass "parce"
									l.marco.prepend ciruelas
							else
								l.marco.append ciruelas
								# se puede hacer con una marsupia, creo
								# bjuana.yin(t.yin)() ciruelas
				)(
						l.linha("troca",t.par,(
							# unless t.cebo?
							if t.fino? then "fino" else "vivo"
							#else # if not t.fino?
							#	"cebo"
						),daily, if t.cebo? then "cebo") # ({
							par: t.par
							animalia: t.animalia
							# monto
							camino: camino
								animalia: t.animalia
								pala: t.lev
								monte: t.monto
								apre: t.sente.media["1q"]
								fino: t.fino?.media["1q"] ? medias[t.par]?["1q"] ? t.sente.media["1q"]
							apre: l.tempo t.sente.tempo
							fino: l.tempo(t.fino.tempo) if t.fino?
							contras: unless t.fino? then contras 
								medias: medias[t.par]
								animalia:t.animalia
						.attr
							karelia: daily
							fina: t.fina
							multi: t.multi
							tempo: t.tempo
						if t.fino? and not $(".linha.#{daily}.parce[fina=#{t.fina}][multi=#{t.multi}][tempo=#{t.tempo}]").length
							g.m {daily}
							# montos("z") g.n(t.yin) 1
							juana.montos(t.yin) bottom: 1
							# juana.lasta 
							l.linha(daily,"parce")
								daily: daily
								monto: 0
								ene: 0
								quanta: 0
							.attr
								fina: t.fina
								multi: t.multi
								tempo: t.tempo
							.css h.borde
							.css
								backgroundColor: "coral"
								position: "sticky"
								# top: "#{3.5*(montos("z") g.n(t.yin) 1)[t.yin]}vmin"
								opacity: 0.84
								# bottom: "#{3.5*z++}vmin"
				)
				# else
				# 	g.m [t.par,t.yin,geniales[t.yin]()]
			l.marco.children()
					.hide()
					.filter(location.hash[1..]).show()
					#.children(":visible")
					.css backgroundColor: "initial"
					.each (i,l) -> g.c($(l)) (ele)->
						g.c(ele.attr("yin")) (yin)->
							if ele.hasClass "parce"
								ele.css backgroundColor: "coral"
								if (juana.montos(yin) bottom: 0).bottom # z[ele.attr("yin")]
									ele.css 
										top: "#{3.6*((juana.montos(yin) top: 1).top)}vmin"
										bottom: "#{3.6*((juana.montos(yin) bottom: -1).bottom+1)}vmin"
						if ele.hasClass("vivo") and not ele.hasClass("cebo")
							# g.m "vivo cebo"
							juana.montos("vivo") monto: ele.children("span.camino").text()*1
							juana.montos("vivo") ene: 1
							juana.montos("vivo") quanta: 25 + ele.children("span.camino").text()*1
						if ele.hasClass("fino") and not ele.hasClass("cebo")
							g.c( ele.attr "karelia" ) (karelia)->
								# g.m "fino cebo"
								ele.siblings(".parce.#{karelia}:visible").children("span")
									.siblings(".monto").text (
										juana.montos(karelia) monto: ele.children("span.camino").text()*1
									).monto.toFixed 2
									.siblings(".ene").text (
										juana.montos(karelia) ene: 1
									).ene
									.siblings(".quanta").text (
										juana.montos(karelia) quanta: 25 + ele.children("span.camino").text()*1
									).quanta.toFixed 2
						# if ele.children("span.camino").length
						if ele.hasClass "troca"
							if ele.hasClass "cebo"
								ele.css backgroundColor: "khaki"
							else
								juana.montos("tota") monto: ele.children("span.camino").text()*1
								juana.montos("tota") ene: 1
						if ele.hasClass "troca"
							juana.roja ->
								ele.css backgroundColor: "red"
						# ene++
					.filter(".troca").last().css backgroundColor: "blue"
				.parent()
					.prepend g.c() ->
						l.linha("toto")
							tota: juana.montos("tota")(monto:0).monto.toFixed 2
							ene: juana.montos("tota")(ene:0).ene
							quanta: (juana.montos("tota")().ene*25 + juana.montos("tota")().monto).toFixed 2
						.css
							backgroundColor: "pink"
							position: "sticky"
							top: "0"
					.append g.c() ->
						l.linha("karelia")
							monto: juana.montos("vivo")(monto:0).monto.toFixed 2
							ene: juana.montos("vivo")(ene:0).ene
							quanta: juana.montos("vivo")(quanta:0).quanta.toFixed 2
						.css
							backgroundColor: "lightblue"
							position: "sticky"
							bottom: "0"
					.trigger "caracol"
		juana: g.c({}) (claudia)-> ({fina,tempo,multi})-> (valeria)->
			unless claudia[fina]?
				claudia[fina] = {}
			unless claudia[fina][tempo]?
				claudia[fina][tempo] = {}
			unless claudia[fina][tempo][multi]?
				claudia[fina][tempo][multi] = no
			if valeria?
				claudia[fina][tempo][multi] = valeria
			claudia[fina][tempo][multi]
	) ({trocadera,juana}) -> 
		h.body
			.css backgroundColor: "gray"
			.append l.marco
		# h.toca("mango:yin") (genios)-> g.c(
		# 	g.c(genios...) g.q (a,f)-> { (g.n(a.nimi) g.camila((c,q)-> c or q)(no))... ,f({})...}
		# ) (geniales)-> g.c(
		# 	f.trocadera geniales
		# ) (trocadera)->
		# 	# for genio in genios
		# 	# 	geniales[genio.nimi] = no
		# 	l.yin genios
		# 	h.hash (hash)-> g.c(
		# 		hash.split "."
		# 	) (hash)->
		h.hash (hash)-> g.c(
			# eval ["{","}"].join hash
			g.c(
				(for semilla in hash.split("[")
					unless semilla is ""
						g.c(semilla[..-2].split("=")) ([nimi,valeria])->
							g.n(nimi) valeria
					else
						{}
				)...
			) g.q (a,f)-> {a...,f({})...}
		) (cacao)->
				# g.m {cacao}
				unless juana(cacao)()
					w.toma.json cacao
					juana(cacao)(on)
				else
					$(".linha").hide().filter(hash).show()
				# for clase in hash
				# 	if clase of geniales
				# 		g.c(trocadera "mango") switch geniales[clase]()
				# 			when no
				# 				g.m mango:clase
				# 				h.toca("mango:yin:#{clase}")
				# 			when on
				# 				g.m hash: clase
				# 				g.c({})
		# w.dame.json (m)->
		# 		for teta of m
		# 			g.m teta
		# 			g.c(m[teta],teta) switch teta
		# 				when "yin"
		# 					({nimi,balance})->
		# 						sessionStorage.setItem nimi, balance
		# 				else
		w.dame.json trocadera(juana)
		# ({trocas,medias})-> 
		# 	g.c({trocas,medias}) trocadera # "cacao"
		# 	# 					# g.m {geniales,par}
		# 	# 					# if geniales[par.yin]()
		# 	# 					# $(".linha.troca.#{par}.vivo").remove()
			
