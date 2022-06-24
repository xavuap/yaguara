
	module.exports = (g)-> g.c(
		require "mongodb"
	) ({MongoClient,ObjectId})-> g.c(
		mango: new MongoClient "mongodb://yaguar:aseverar13@ds023475.mlab.com:23475/heroku_lkhmxltz",{
			useUnifiedTopology: true
		}
	) ({mango})-> (nalgas...)-> (fina)->
			# g.m mango.connect
			# fina "mango"
			mango.connect (erro)-> g.c(
				db: mango.db("heroku_lkhmxltz")
			) ({db})-> ( ({fernanda})->
				# fina ( (fina)->
				# 	g.c(nalgas...) g.q (a,f)-> {(g.n(a) fina(a))...,f({})...}
				# ) 
				g.c({},nalgas...) g.r (refina)-> (m,nalga,nalgas...)->
					if nalga?
						fernanda(nalga) (fina)->
							refina {m...,(g.n(nalga) fina)...},nalgas...
					else
						fina m
			)
				fernanda: (cola)-> (fina)->
					db.collection cola, (e,cola)-> fina (cerca)-> (jota)-> g.c(
						if cerca?
							cerca
						else
							jota
					) (cerca)-> (fina)->
						( (fina)->
							# g.m {cerca,jota}
							if jota?
								cola.updateMany(
									cerca
									{$set: jota}
									{upsert: true}
									fina
								)
							else
								fina()
						)(
							-> cola.find(cerca, {"_id":0}).toArray (e,a)->
								if e?
									g.m "#{e}"
								fina a...
						) 