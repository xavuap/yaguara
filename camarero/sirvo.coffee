
# llamado por origen
# café origen sirvo
	module.exports = (g)->(fina) -> g.c(
		server: require("http").createServer fina.options, (req,res) ->
			g.mostra "entrego valor"
			# console.log options: fina.options
			# console.log process.env
			# console.log "arepa"
			# console.log "#{por}" for por of req
			# console.log proto: req.headers['x-forwarded-proto']
			g.mostra
				# ra: req.connection?.remoteAddress
				ip: req.headers["x-forwarded-for"]
				ua: req.headers["user-agent"]
				# rf: req.headers["referer"]
			# console.log req.headers
			# for h in req.headers
			# 	console.log h: h
			if req.headers['x-forwarded-proto'] is 'http' and process.env.PORT? and process.env.PORT isnt 5000 
				#res.redirect 'https://' + req.hostname + req.url
				res.statusCode = 301
				res.setHeader("Location", "https://#{req.headers.host}#{req.url}")
				# res.writeHead(301, Location: url = 'https://' + req.headers.host + req.url)
				# console.log {url}
				# res.end 301, Location: 'https://' + req.headers.host + req.url
				res.end()
			else
				# g.mostra proto: req.headers['x-forwarded-proto']
				# console.log url: req.url
				fina.arepa s = g.c(decodeURIComponent req.url) (url)->
					# tren: req.url.split("?").shift().split("/") #.slice(1) # .slice 2
					location:
						pathname: url
						origin: "#{req.headers["x-forwarded-proto"]}://#{req.headers.host}"
					url: url # s.location?.pathname
					res: res
					req: req
					client: 
						ip: req.headers["x-forwarded-for"]
						ua: req.headers["user-agent"]
					bin: (ct)->(parolas)->
						# console.log "sirvio #{req.url}"
						res.setHeader("Access-Control-Allow-Origin", "*")
						res.setHeader('Content-Type', ct)
						res.end(parolas,"binary")
					utf: (ct)->(parolas)->
						# @.sirvo(ct+';charset=utf-8') letras
						# console.log "sirvia #{req.url}"
						res.setHeader("Access-Control-Allow-Origin", "*")
						res.setHeader('Content-Type', ct+';charset=utf-8')
						res.end(parolas)
					adjunto: (nome)->(dozo)->
						res.setHeader(
							'content-disposition'
							"attachment; filename=#{nome}"
						)
						res.end(jeto)
					html: (quetas)->
						s.utf("text/html")("#{quetas}\n")
					parla: (parolas)->
						s.utf("text/plain")(parolas)
						# s.parole(parolas)
					tetas: (tetas)->
						s.parla g.tetas tetas
					parole: (parolas)->
						s.parla(parolas+"\n")
					parlo: (tetas)->
						s.parla "#{g.tetas(tetas)}\n"
					ecma: (code)->
						s.utf("application/ecmascript") g.tetas code
					coffee: (code)->
						s.utf("application/coffeescript")(code)
					pdf: (pdf)-> s.utf("application/pdf")(pdf)
					###
					café: (coffee)->
						# console.log coffee: coffee
						fina.guanare(coffee) (ecma) => # "(#{coffee.toString()})"
							# console.log ecma: ecma
							s.ecma ecma
					# guanare: (semilla)->(fernanda)->()
					# 	fina.guanare(semilla)(fernanda) (tetas)->
					# 		s[](tetas)
					fichier: (fichas) ->
						s.café fichas # require("../#{fichas}")
					fichero: (fichas) ->
						# console.log fina.dozo.toString()
						fina.dozo.leer.utf("#{fichas}") (parole) =>
							unless parole
								sirvo.scusa "non essiste il ficero"
							else
								s.ecma parole
					capsula: (tripulante)->
						s.ecma "(#{tripulante.toString()})"
					###
					image: (tulip) -> (ima) ->
						fina.dozo.leer.bin("#{ima}") (imagen) ->
							unless imagen
								s.scusa "discreto"
							else
								s.bin(tulip)(imagen)
					imaga: 
						png: (fiore) -> s.image("image/png")(fiore)
					#cápsula: (tripulante)->
					#	s.ecma "(#{tripulante.toString()}())"
					# tren: (tren)-> # tetas
					# 	s.café ("(#{wagen})" for wagen in tren).join("")
					css: (stili)->
						s.utf("text/css")(stili)
					png: (image)-> # es{imague}
						s.bin("image/png")(image)
					jpg: (image)->
						s.bin("image/jpeg")(image)
					webp: (image)->
						s.bin("image/webp") image
					svg: (victor) ->
						s.utf("image/svg+xml")(victor)
					jpeg: (image)-> s.jpg(image)
					mp4: (anime)->
						s.bin("video/mp4")(anime)
					scusa: (scusa)->
						# 404
						res.statusCode = 404
						# console.error g.tetas {erro}
						s.parlo scusa
					js: (code)->
						s.ecma code
					txt: (parolas)->
						s.parlo parolas
					json: (jeto)->
						s.utf("application/json") JSON.stringify jeto,null,3
						jeto
					# scusa: (scusa)->
					# 	s.parlo("cuatro cero cuatro\n#{scusa}\n")
					# 	# res.write("cuatro cero cuatro\n")
					# 	# res.end(scusa+"\n")
					nada: (algo)->
						res.statusCode = 204
						s.parlo("dos cero cuatro\n#{algo}\n")
					trancao: (tranca)->
						res.statusCode = 500
						s.parlo("cinco cero cero\n#{tranca}\n")
				# res.end("con café al aire" + req.url)
	) ({server}) -> g.c(process.env.PORT ? fina.portal ? 80) (porto)->
		server.listen porto, ->
			# fina.wisa? server
			(fina.siendo? {server,porto}) ? g.m "estamos al aire con café nel #{porto}"
			# fina.parla?(porto) 
