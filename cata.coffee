
	require("./gen") (gen)-> gen (g)->
		console.log g
		g.m "hola"
		g.m g.tetas "hola"
		# g.mt "hola"
		g.c(
			r: (fina)-> 
				((rr)-> rr rr) (rr)-> (abc...)-> fina(rr rr) abc...
		) ({r})-> g.c(
			qx: (efe)->
				r (questa)-> (a,bc...)->
					efe a, (n)->
						if bc.length 
							questa bc...
						else n
			t: ->
				g.c(argos...) r (questa)-> (a,bc...)->
			q: (abc...)-> (efe)-> 

				g.r(abc...) (a,bc...,questa)->
					# g.mt {z,questa}
					efe a, (n)->
						if bc.length 
							questa bc...
						else n
		) ({qx})-> g.c(
			# g.q : = qx
			c: (jeto)->(efe)-> q(Object.entries(jeto)...) (a,f)-> {
				(g.n(a[0]) efe a[1])...
				f({})...
			}
			cxy: (jeto)->(efe)-> g.r(
				fina: (a,f)-> {
					(g.n(a[0]) efe a[1])...
					f({})...
				}
			) ({fina})-> qx(fina) Object.entries(jeto)...
			cx: (jeto)-> (efe)->
				g.c(Object.entries(jeto)...) qx (a,f)-> {
					(g.n(a[0]) efe a[1])...
					f({})...
				}
			"<": qx (a,f) -> a < f Infinity
			"+": qx (a,f) -> a + f 0
			capsulas: qx (a,f)-> [
					["(",")"].join(g.tetas a)
					f("")
				].join ""
		) (f)->
			# g.mt cadax: f.cx({tetas: "ricas", nalgas: "bellas"}) (cada)->
			# 	cada.split("").reverse().join("")
			# g.mt f["+"] [1..5]...
			g.mt g.capsulas(				
				(b)-> a
				{"b"}
				[1..3]
			)
			g.mt g
			g.mt gen