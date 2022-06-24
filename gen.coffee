
	module.exports = (fina)-> fina (sente) -> sente ( (fina)-> fina
		j: (j)-> (fina)-> {j...,fina(j)...}
		claudia: (argos...)-> (fina)-> fina argos...
		r: (fina)-> 
			((rr)-> rr rr) (rr)-> (abc...)-> fina(rr rr) abc... 
		stitch: (argo)-> (jeto)-> jeto[argo]
		nimi: (nimi)-> (tetas)-> "#{nimi}": tetas
		mostra: (tetas)->
			console.log tetas
			tetas
	) (g)-> g.j( g.j(g) (g)->
		quanta: (efe)-> 
			g.r (questa) -> (a,bc...)->
				efe a, (n)->
					if bc.length 
						try
							questa bc...
						catch 
							n
					else n
		#g.r (questa)-> (abc...)->
		#quanta: (efe)->
		#	(n)->
		#		if bc.length
		#			try 
		#				questa bc...
		#			catch
		#				n
		#		else n
		tetas: g.r (tetas)-> (jeto)-> 
			switch typeof jeto
				when "string" then "\"#{jeto}\""
				when "function" then jeto.toString()
				when "object"
					if jeto?
						if Array.isArray jeto
							"[]".split("").join (tetas sign for sign in jeto).join(",")
						else
							"{}".split("").join (
								for sign of jeto
									[sign, tetas jeto[sign]].join ": "
							).join(",")
					else jeto
				else jeto
		tempo: (local) -> g.claudia(
			if local.tempo?
				new Date(local.tempo)
			else
				new Date
		) (tempo)-> g.claudia(
			switch typeof local
				when "number"
					hora: local
				when "string"
					hora: local*1
				when "object"
					local
				when undefined
					hora: 0
		) (local)-> 
			for tempa of local
				switch tempa
					when "hora"
						tempo.setUTCHours(tempo.getUTCHours() + local[tempa])
					when "feira"
						tempo.setUTCDate(tempo.getUTCDate() + local.feira)
					# when "daily"
					# 	tempo.setUTCDay()
			(fina)-> fina
				tempo: tempo
				daily: tempo.getUTCDay()
				raw: tempo.getTime()
				hora: tempo.getUTCHours()
				feira: g.stitch(tempo.getUTCDay()) g.claudia(
					"domingo"
					"lunes"
					"martes"
					"miércoles"
					"jueves"
					"viernes"
					"sábado"
				) (feira...) -> feira
		viste: g.r (viste)-> (jeto)->(braccia)->
			# g.m viste: jeto
			for braccio of braccia
				if jeto[braccio]?
					viste(jeto[braccio]) braccia[braccio]
				else
					jeto[braccio] = braccia
			jeto
	) (g)-> # g.j(g) (g)->
		chak: (jeto)-> (efe)->
			g.claudia(Object.entries(jeto)...) g.quanta (a,f)-> {
				(g.nimi(a[0]) efe a[1])...
				f({})...
			}
		capsulas: (tetas...)-> (fina)->
			g.claudia(fina,tetas...) g.quanta (a,f)-> [
				"()".split("").join g.tetas a
				f("")
			].join ""
		capsula: g.quanta (a,f)-> [
				"()".split("").join g.tetas a
				f("")
			].join ""

		# marsupia()(ki)(g.c()) ()-> siempre
		marsupias: -> g.claudia({}) (claudia)-> (argo)-> (juana)->(fina)->
			g.claudia() g.stitch(claudia[argo]?)
				true: -> g.claudia(claudia[argo]) fina
				false: -> juana (tetas) ->
					g.claudia(claudia[argo] = tetas) fina
		# cumulo: (fina) -> (claudia)-> (quanta)-> #
		# 		unless quanta?
		# 			claudia
		# 		else
		# 			claudia = fina(claudia,quanta)
		camila: (fina) -> (camila)-> (quanta)-> #
				unless quanta?
					camila
				else
					camila = fina(camila,quanta)
			# unless claudia?
			# 	claudia = quanta
			# else
			# 	
		montos: (claudia)-> g.claudia(claudia) (claudia)-> (ki)->
			unless claudia[ki]? then claudia[ki] = {}
			(adornos) -> # g.mostra claudia
				for adorno of adornos
					unless claudia[ki][adorno]?
						claudia[ki][adorno] = adornos[adorno]
					else
						claudia[ki][adorno] += adornos[adorno]
				# claudia[ki] += adornos
				claudia[ki]
		# juana: (argos...)-> g.claudia(on) (booleana)-> (juana)-> # juana de argos
		# 	if booleana
		# 		booleana = no 
		# 		juana argos...
		# 		return true
		# 	else
		# 		return false
		# juana: (argos...)-> g.claudia(on,null) (booleana,valeria)-> (juana)-> # juana de argos
		# 	if booleana
		# 		booleana = no
		# 		valeria = juana argos...
		# 	valeria
		valeria: (claudia)-> (valeria)->
			unless valeria?
				claudia
			else
				claudia = valeria
		ki: -> g.claudia({}) (claudia)->(ki)-> (valeria)->
			unless claudia[ki]?
				claudia[ki] = valeria
			claudia[ki]
		# ki: -> g.c() (claudia)-> (valeria)->
		# 	unless claudia?
		# 		claudia = valeria
		# 	valeria
		# juana: ->
		# 	unless claudia?
		# 		claudia = valeria			
		juana: (argos...)-> g.claudia() (valeria)-> (juana)-> # juana de argos
			unless valeria?
				valeria = juana argos...
			valeria
		# juanas g.n(t.par) (par) ->
		# 	algo par
		# [t.par]
		# juanas()(ki) (ki)-> soltantuna
		juanas: -> g.claudia({}) (claudia) -> (ki)-> 
			(fina)->
				unless claudia[ki]?
					claudia[ki] = fina ki
				claudia[ki]
		# juanas: (argos...)-> g.claudia(on) (booleana)-> ({juana,siempre})-> # juana de argos
		# 	if booleana
		# 		booleana = no
		# 		juana argos...
		# 	else
		# 		siempre argos
		mt: (tetas)->
			g.mostra g.tetas tetas
		mn: (nimi)->(tetas)->
			g.mostra g.nimi(nimi) tetas
		t: g.tetas
		c: g.claudia
		m: g.mostra
		n: g.nimi
		s: g.stitch
		q: g.quanta
		v: g.viste
		pan: (argos...)->
			g.quanta (a,f)-> 
				a(argos...) and f(on)
		may: (argos...)->
			g.quanta (a,f)-> 
				a(argos...) or f(no)
		mezclar: g.quanta (a,f)-> {a...,f({})...}