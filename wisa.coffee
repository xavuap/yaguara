
	module.exports = (g)-> g.c([]) (claudia)->
		toma: g.c(
			todas: (efe)-> (tetas)-> 
				for clau in claudia
					clau?.send? efe tetas
				tetas
		) ({todas})->
			json: todas(JSON.stringify)
		camarero: (server)->(fina)->
			new (require('ws').Server)(
				server: server
				autoAcceptConnections: false
			).on "connection", (ws)->  g.c(
				(claudia.push ws) - 1
			) (pos)->
				# toma (m)-> ws.send JSON.stringify m
				ws
					.on "close", ->
						console.log "cerro ws"
						delete claudia[pos]
					.on "error", (erro)->
						console.erro erro
					.on "message", (m)->
						fina 
							dame: g.c() -> 
								try
									JSON.parse m
								catch e
									g.m e
									g.m m
									m
							re: 
								json: (m)->
									ws.send JSON.stringify m
								tetas: (m)->
									ws.send m
		comensal: (g)-> (fina)-> g.c([],{}) (claudia,dame,wisa) ->
			fina
				toma: 
					json: (m)->
						g.m {m}
						if wisa?.conectad?()
							wisa.send JSON.stringify m
						else
							claudia.push JSON.stringify m
				dame: (jeto)->
					dame = jeto
				dame: 
					json: (fina)->
						dame.json = fina 
			g.c() g.r (cn)-> ->
				wisa = new WebSocket({
					"http:": "ws://"
					"https:": "wss://"
				}[window.location.protocol] + window.location.host)
				wisa.onclose = (event)->
					console.log("close")
					cn null
					#//console.dir(event)
				wisa.onerror = (event)->
					console.log("error")
				wisa.onopen = (evnt)->
					g.c() g.r (ere)-> ->
						g.m {claudia}
						if wisa.conectad() and claudia.length
							wisa.send claudia.shift()
							ere()
					wisa.onmessage = (ev)->
						# g.m typeof ev.data
						# g.m ev.data
						try 
							dame?.json? JSON.parse ev.data
						catch e
							g.m e
							try
								dame?.fina? eval ev.data
							catch e
								g.m e
								(dame?.teta ? g.m) ev.data
					console.log "alberto"
					# fina wisa
				wisa.conectad = ->
					wisa.readyState is WebSocket.OPEN