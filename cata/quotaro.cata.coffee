
	require("../gen") (gen)-> gen (g)-> g.c(
		human: require("../camarero/human") g
	) ({human})-> g.c(
		# a: g.mt {human}
		investing: (símbolos...)->(fina)->
			g.m símbolos
			human ({browser,page})-> page(
				width: 480
				height: 678
			) ({w,e,a,c})->
				g.m "a"
				a(
					"https://www.widgets.investing.com/single-currency-crosses?theme=darkTheme&hideTitle=true&cols=last,time&currency=12"
				) fina: ->
					# for symbol in símbolos
					g.c(símbolos) g.r (meme)-> (símbolos)->
						g.m símbolos[0]
						if símbolos.length
							e(
								símbolos[0]
								(symbol)->
									$("article div:first-child").has("a:contains(USD/#{symbol})").attr("main-value")
							) fina: (val)-> 
								fina g.n(símbolos[0]) val
								meme símbolos[1..]
						else
							browser.close()
	) ({investing})->
		investing("CHF","DOP","BTC") (val)->
			g.m val

