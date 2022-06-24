
	module.exports = (g)-> # (porto)-> g.c() (claudia)->
		name: process.env.HEROKU_APP_NAME
		token: "a00b0637-fae6-42e0-8829-2a3604d315fa"
		version: process.env.HEROKU_RELEASE_VERSION
		url: g.c() (claudia)-> (porto)-> g.c(
			# g.m ingresa: porto
			g.c() ->
				if porto?
					claudia = porto
				claudia
		) (porto)->
			# devuelve: porto
			if process.env.localia?
				"http://localhost:#{porto}"
			else
				"https://#{process.env.HEROKU_APP_NAME}.herokuapp.com"