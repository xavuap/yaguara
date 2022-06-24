

	module.exports = (g)-> (h)->(pares)->(mostra)->(curva)->(periodicos)->
		# await ((v)-> (f)-> await f v)(
		# 	c: (v)-> (f)-> await f v
		# ) (g)-> 
		await g.c(
			url:
				sma: "https://www.investing.com/technical/moving-averages"
				ema: "https://www.investing.com/technical/moving-averages-exponential"
			salida: {}
			# is: (tempa)->	
			josefa: (booleana)-> 
		) (m)->
				# # for par of config.pares
				# for ma of url # config.pares[par].tempo
				# console.log 
				# g.l medias: "going"
				mostra going: curva
				await h.a m.url[curva] # [ma]
				# g.l medias: "ready"
				# console.log going: m.url.sma
				for per in periodicos # ["1h","1l","1d","5m"] # config.pares[par].tempo[ma]
					await g.c(
						tempa: g.s(per)
							"1l": "month"
							"1w": "week"
							"1d": "86400"
							"5h": "18000" # 300
							"1h": "3600" # 60
							"30m": "1800" # 30
							"15m": "900" # 15
							"5m": "300"
							"1m": "60"
					) ({tempa})->
						# console.log {per}
						until await h.e(
								tempa
								(tempo)->
									$('select#period.selectBox option[selected=selected]').val() is tempo
							)
								await h.e -> $("select#period option").removeAttr("selected")
								await h.e tempa, (tempa)-> $("select#period option[value=#{tempa}]").attr({selected:'selected'})
								await h.e('document.toolTable.submit();')
								await h.w waitUntil: 'networkidle2'
						# mostra going: per
						# await page.waitForNavigation({ waitUntil: 'networkidle2' })
						# console.log {tempa}
						# if await m.is(tempa)
						for PAR of pares
							await g.c(
								par: [
									PAR
										.slice 0,3
										.toLowerCase()
									PAR
										.slice 3
										.toLowerCase()
								].join("-")
							) ({par})-> g.c(
								medias: (await h.e par, (par) ->
									$("#curr_table td.first a[href='/currencies/#{par}']").parents('tr').find('td').not(':first').text()
								).split('\t').join('').split('\n').join('').split('Sell').join(' ').split('Buy').join(' ').trim().split(' ')
							) ({medias}) ->
								# console.log medias
								# g.m {medias}
								if medias.length > 1
									m.salida[PAR] = {} unless m.salida[PAR]
									m.salida[PAR][per] =
										"5":
											sell: (medias[0]*1) # .toFixed(pares[PAR].pips)
											buy: (medias[0]*1+pares[PAR].difa) # .toFixed(pares[PAR].pips)
										"10":
											sell: (medias[1]*1) # .toFixed(pares[PAR].pips)
											buy: (medias[1]*1+pares[PAR].difa) # .toFixed(pares[PAR].pips)
										"20":
											sell: (medias[2]*1) # .toFixed(pares[PAR].pips)
											buy: (medias[2]*1+pares[PAR].difa) # .toFixed(pares[PAR].pips)
										"50":
											sell: (medias[3]*1) # .toFixed(pares[PAR].pips)
											buy: (medias[3]*1+pares[PAR].difa) # .toFixed(pares[PAR].pips)
										"100":
											sell: (medias[4]*1) #.toFixed(pares[PAR].pips)
											buy: (medias[4]*1+pares[PAR].difa) # .toFixed(pares[PAR].pips)
										"200":
											sell: (medias[5]*1) #.toFixed(pares[PAR].pips)
											buy: (medias[5]*1+pares[PAR].difa) # .toFixed(pares[PAR].pips)
									# config.pares[PAR].pivot(medias[PAR])
				g.s("salida") salida: m.salida

