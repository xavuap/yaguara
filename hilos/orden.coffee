#!/usr/local/bin/coffee
	module.exports = require("../gen") (gen)-> gen (g)-> g.c(
		medias: {}
		dame: require("../camarero/dame") g
	) ({medias,dame})-> g.c(
		animalia: (m)->
			switch
				when m["1q"] < m["5m"] < m["1h"] < m["1d"] # (g.c(medias...) g.q (a,f)-> a < f(Infinity))
					"sell"
				when m["1q"] > m["5m"] > m["1h"] > m["1d"] # m["1d"] < m["1h"] < m["5m"] < m["1q"] # (g.c(medias...) g.q (a,f)-> a > f(0))
					"buy"
				else null
		arroz: [
			["usd","mxn"]
			["usd","try"]
			["usd","cnh"]
			["usd","sgd"]
			["usd","zar","jpy"]
			["eur","usd","pln"]
			["eur","usd","nok","sek"]
			["eur","gbp","usd","chf","huf"]
			# ["eur","gbp","aud","nzd","usd","chf","jpy"]
			["eur","gbp","aud","nzd","usd","cad","chf","jpy"]
		]
		media: (par)-> (fina)->
			# g.m dame: par
			dame("https://yaguara.herokuapp.com/mango:medias:#{par}").json (json)->
				medias[par] = json # .animalia
				fina()
	) ({animalia,arroz,media})-> dame("https://yaguara.herokuapp.com/mango:medias").json (medias)->
		# for diva in ["usd","zar","jpy"]
		# 	for amada in ["usd","zar","jpy"]
		# g.c(divas...) g.r (ordenando)-> (amada,diva,divas...,fina)->
		###
		ordenando = (amada,diva,divas...,fina)->
			# g.c() (par)->
			media([amada,diva].join("")) ->
				if divas.length
					ordenando amada, divas..., ->
						ordenando diva,divas..., fina
				else
					fina()
					# ordenando diva, divas...
		###
		# 	# unless amada is diva
		# 	for diva in divas
		# 		switch animalia media[[amada,diva].join("")]
		# 				when "buy"
		# 					menores.push diva
		# 				when "sell"
		# 					mayores.push diva
		# 	ordenando diva, divas...
		# 	ordenando amada, divas...
		for par of medias
			medias[par].animalia = animalia medias[par]
		g.c(arroz...) g.r (otra)-> (arroz,arroces...)->
				# ordenando arroz..., ->
				# g.m (Object.keys medias).length
				try
					g.m arroz.sort (amada,diva)->
						switch medias[[amada,diva].join("")].animalia
							when "buy"
								-1
							when "sell"
								1
							else
								throw {amada,diva}
					g.c(arroz...) (amada,arroz...,diva)-> g.c(
						"#{amada}#{diva}"
					) (par)-> g.c(
						if par of medias
							par
						else
							"#{diva}#{amada}"
					) (par)->
						g.m medias[par].animalia+ " "+par
				catch {amada,diva}
					if amada? and diva?
						g.m "incomparable #{amada} #{diva}"
						g.m medias["#{amada}#{diva}"] # .medias
				finally
					if arroces.length then otra arroces...