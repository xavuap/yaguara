
		
	module.exports = (g)->({gen,dozo,wisa})-> (chiave)->(fina)->
		dozo.leer("vendor/jquery-3.5.1.min.js").utf (jquery)-> 
			fina (require "./html")(g)
				title: "yaguara"
				lang: "es"
				icon:
					type: "" 
					href: "" 
				ecma: [
					jquery
					g.capsulas(
						gen: gen
						nimi: require("./nimi")
						wisa: wisa.comensal
						chiave: chiave # require "./yaguara"
					) ({gen,nimi,wisa,chiave})->
						# alert "amor"
						gen (nimi wisa) chiave
				]