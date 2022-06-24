
	module.exports = ({g,config,human,mostra})-> (fina)->
		g.m "cuerpo"
		# g.mt cuerpo: fina
		# g.mt config
		await human (h)-> await fina
			medias: await g.c(
				media: (par)->
					await require("./media")(g)
						h: h
						par: [par.slice(0,3),par.slice(3)].join("-").toLowerCase()
						config: config.pares[par]
						mostra: mostra
				medias: await g.c(
					medias: require("./medias")(g)(h)(config.pares) mostra
				) ({medias})->
					sma: g.s("sma") sma: await medias("sma")(["1h","5m","1d","1l"])
					ema: g.s("ema") ema: await medias("ema")(["1h","15m","1d","1w"])
			) ({media,medias})->
				for par of config.pares
					unless medias.sma[par]?
						medias.sma[par] = await media(par)
				# for par of config.pares
				# 	config.pares[par].pivot(medias,par)
				medias
		#) ({medias})->
