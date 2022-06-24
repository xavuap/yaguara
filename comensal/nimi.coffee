
	module.exports = (wisa)-> (fina)->(g)->
		# this is a framework and I dont like frameworks
		# sami seme gen co me no meme gen
		# I prefer libraries
		# me meme bien nimi
		$(document).ready ->
			# alert "hola"
			wisa(g) fina(g) g.j(
				cero:
					padding: "0"
					margin: "0"
					border: "none"
					left: "0"
					top: "0"
				font:
					fontFamily: "mono"
					fontSize: "3vmin"
					color: "#333333"
					textShadow: "0.1vmin 0.1vmin #DDDDDD" # #BBBBBB"
				pared:
					userSelect: "none"
					cursor: "default"
				borde:
					borderWidth: "0.01vmin"
					borderStyle: "solid"
					borderColor: "black"
					boxSizing: "border-box"
				enlace:
					cursor: "pointer"
					textDecoration: "underline"
				hoja:
					backgroundColor: "#FFFFCC"
					color: "#110044"
					textShadow: "0.1vmin 0.1vmin #DDDDDD"
					fontFamily: "mono"
					lineHeight: "1.5"
				ventana: (fina)-> 
					$(window).resize -> g.c(
						ancha: window.innerWidth
						alta: window.innerHeight
					) ({ancha,alta})-> g.c(
						menor: Math.min(ancha,alta)
						radia: ancha/alta
					) ({menor,radia})-> g.c(
						tipa: menor*0.03
						lina: menor*0.001
					) ({tipa,lina})->
						fina {ancha,alta,menor,radia,tipa,lina}
					$(window).resize()
			) (h)-> g.j(
				body: $(document.body).css {h.cero...,h.font...}
				marco: (nimi)-> g.c(
					marco: $ document.createElement nimi
				) ({marco})-> g.c(
					scroll: ->
						g.m "caracol"
						marco.scrollTop marco[0].scrollHeight
				) ({scroll})->
					marco
						.addClass "marco"
						.css
							position: "fixed"
							boxSizing: "border-box"
							overflow: "hidden"
					h.ventana ({ancha,alta,menor,tipa})-> g.c(
						height: alta-menor*0.2
					) ({height})->
						marco
							.off "mousemove"
							.css
								width: menor*0.9
								left: -> (ancha - marco.outerWidth())/2
								height: height
								top: -> (alta - marco.outerHeight())/2 # menor*0.1
								minHeight: height
							.mousemove (e)-> g.c(
								caracol: marco[0].scrollHeight
								ratón: e.pageY
								margen: marco.offset().top + tipa
								ventana: marco.height() - 2*tipa
							) ({caracol,ratón,margen,ventana,vemin})->
								marco.scrollTop caracol*(ratón - margen)/(ventana)
							.mouseenter g.c() -> ->
								g.m "enter"
								marco.off "caracol", scroll
							.mouseleave g.c() -> ->
								g.m "leave"
								marco.on "caracol", scroll
					marco
				tag: (queta)->
					$ document.createElement queta
						.css {
							h.cero...
							h.font...
							boxSizing: "border-box"
						} 
				toca: (url)->(fina)->
						# $.get (g.m [location.origin,url].join("/")), (data)->
						# 	fina data
						$.get (g.m [location.origin,url].join("/")), fina
				# toca: (url)-> g.c(
				# 	(efe)->(fina)->
				# 		$.get (g.m [location.origin,url].join("/")), (data)->
				# 			fina efe data
				# 	) (get)->
				# 		json: get(JSON.parse)
				hash: (fina)->
					$(window)
						.on "hashchange", ->
							fina g.c(decodeURIComponent location.hash) (hash)->
								if hash[0] is "#"
									hash[1..] 
								else hash
						.trigger "hashchange"
			) (h)->
				lienzo: ->
					h.tag "div"
						.css
							display: "flex"
							position: "absolute"
							alignItems: "center"
							justifyContent: "center"
							alignContent: "center"
							width: "100vw"
							height: "100vh"
				textarea: (nimi)->
					h.tag "textarea"
						.addClass nimi
						.attr
							autocomplete: "off"
							autocorrect: "off"
							autocapitalize: "off"
							spellcheck: "false"
						# .prop
						# 	wrap: "off"
						# 	# autofocus: true
						# 	# readonly: true
						.css h.hoja
						.css
							fontSize: "2.75vmin"
							resize: "none"
							lineHeight: "1.5"
							tabSize: "2"
							overflow: "hidden"
							whiteSpace: "pre"
							boxSizing: "border-box"
							padding: "1em"
							borderColor: "#BBBBBB"
							borderWidth: "0.1vmin"
							borderStyle: "solid"
				tabla: (a)->
					h.tag "table"
						.css
							borderCollapse: "collapse"
						.append g.r() ->
							for aa in a 
								h.tag "tr"
									.append g.r() ->
										for aaa in aa
											h.tag "td"
												.css
													padding: "1em"
													verticalAlign: "center"
													textAlign: "center"
												.append aaa
			g.m "nimi"
			$(window)
				.resize()
				# .trigger "hashchange"
		###
							tetas: (m)->
								h.tag "span"
									.addClass "tetas" # #{par}"
									.text m
									.on "mostra", ->
										$(@).siblings().hide()
										$(@).show()
						pares: g.r() ->
							h.tag "table"
								.addClass "pares"
								.css
									display: "flex"
									justifyContent: "space-evenly"
									alignContent: "space-evenly"
									flexDirection: "column"
		###