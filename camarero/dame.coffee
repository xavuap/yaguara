
	module.exports = (g)-> g.c(require("request")) (dame)->
		g.c((url)->(tipa)->(fina)->
			(dame url, (error,response,body)->
				fina g.c() ->
					if error
						console.log erro: error
						null
					else
						switch tipa
							when "toca" then body
							when "json"
								try
									JSON.parse body
								catch e
									g.m "#{e}"
									g.m {body}
									null
			)
		) (dame) -> 
			(url) ->
				toca: dame(url)("toca")
				json: dame(url)("json")
