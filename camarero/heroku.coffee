

	module.exports = (my)-> # (fina)->
		Heroku = require("heroku-client") #reqos.heroku
		heroku = new Heroku(token: my.token)
		refresco: (v)-> # (fina)->(erro)->
			try
				await heroku.delete("/apps/#{my.name}/dynos/").then (x) =>
					console.log("neat")
					# console.log(x)
					v.fina(x) # sirvo.parlo("gracias")
			catch e
				console.log "check token"
				v.erro(e)
				# sirvo.scusa erro
		scale: ->