
		
	module.exports = (g)->({gen,dozo,wisa})-> (chiave)->(fina)->
		dozo.leer("vendor/jquery-3.5.1.min.js").utf (jquery)-> 
			fina require("./arepa")(require "./html")
				nimi: "yaguara"
				toki: "es"
				icono: (html)-> html(
					link: null
					rel: "icon"
					type: "" # l?.icono?.type ? "svg+xml" # "image/jpeg"
					href: "" # g.s(l?.icono?.href?)
				) null
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