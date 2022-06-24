
	module.exports = (g)->
		# v1266 # 2019☉ 11☽ 24♁ 23°02'28" # Buenos Aires de Herrera, Santo Domingo
		#	# v1276 # 2019☉ 11☽ 26♁ 20°57'06" # open fixed
		# v1279 created by user xavuap@gmail.com # 2019☉ 11☽ 27♁ 01°48'09" # alpes
		# 2019-11-27T05:44:33.365108+00:00 app[api]: Deploy 8c2d269c
		# Deploy 74ead1ce by user xavuap@gmail.com
		# 2019-12-05T23:07:34.882456+00:00 app[api]: Release v1285 created by user xavuap@gmail.com
		###
		username: "kalanchoe"
		password: "verdeCe0440"
		url:
			manualTrades: "https://www.etoro.com/portfolio/manual-trades"
			login: "https://www.etoro.com/login"
			# lista: "https://www.etoro.com/watchlists/4ad64d5f-5118-4125-bc6a-3722340f8dde"
			listas: "https://www.etoro.com/watchlists/16e1cefc-5a8f-410d-a1ac-17898e46c021"
		mode: "real"
		dir: "./hilos/#{
			unless local
				"remoto"
			else
				"local"
			}"
		###
		navidad: navidad = ( (navidad)-> 
			if navidad
				100
			else
				0
		) no
		tempo:
			desde: desde =
				feira: "Domingo"
				hora: 1705 + navidad
			hasta: hasta =
				feira: "Viernes"
				hora: 1630 + navidad
			siempre: siempre = no # local or 
			puede: (tempo)->
				not g.pan()(
					-> g.may()(
						-> g.pan()(
							-> tempo.feira is hasta.feira
							-> tempo.hora >= hasta.hora
						)
						-> tempo.feira is "Sábado"
						-> g.pan()(
							-> tempo.feira is desde.feira
							-> tempo.hora <= desde.hora
						)
					)
					-> not siempre
				)
		listas: 25
		log:
			debug: debug = no
			verbo: no
			quiet: no
		cata: cata = siempre or no
		mostra: mostra = no
		pote: 
			medias: medias = not mostra and not debug and on
			open: medias and not cata and on
			cerrar: medias and not cata and on
			extender: medias and not cata
		mnt: 25
		min:
			open: 25
			digna: 1
		xt:
			difa: difa = 5 # 5 # 6 # 4
			indietro: 2
			amplio: difa + 3 # 8 # 9 # 7
			avanza: 1
		pares: ( (pares)-> (g.q (a,f)-> {a...,f({})...}) Object.values(pares)...) # ((pares)-> {Object.values(pares)} )
			piú: require("./pares")
			usa: g.c(
				"usdmxn"
				"usdtry"
				"usdhuf"
				"usdsek"
				"usdzar"
				"usdjpy"
				"usdcnh"
				"nzdusd"
				"eurusd"
				"audusd"
				"usdnok"
				"usdpln"
				"gbpusd"
				"usdchf"
				"usdcad"
				"usdsgd"
			) (pares...)-> g.c(pares,{}) g.r (r)-> (p,j)->
				if p[0]? then r(
					p[1..]
					{ j..., (g.n(p[0]) require("./pares/#{p[0]}") g)... }
				) else j
			###
			g.r(
				g.chak(pares) (par)->
					"#{par}": require "./pares/#{par}"
				{}
			) (a,j,r)->
				if a[0]?
					r a[1..], {j...,a[0]}, r
				else
					j
			g.merge for par in pares
				enfilar [par,require("./pares/#{par}")]
			###
