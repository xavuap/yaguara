	

module.exports = (g)-> (fina)-> 
	await g.c(
		browser: await require("puppeteer").launch
			args: ['--no-sandbox', '--disable-setuid-sandbox'] # ,'--user-data-dir=cata']
			headless: on # userDataDir: "cata"
	) ({browser})-> 
		fina
			browser: browser
			page: (res)-> (fina)-> await g.c(
				await browser.newPage()
			) (page)->
				await page.setViewport res
				# g.mt {fina}
				fina
					w: (argo)-> ({fina,erro})->
						page[{
							text: "waitForElement"
							function: "waitForFunction"
							number: "waitFor"
							object: "waitForNavigation"
						}[typeof argo]](argo,{polling: "mutation"}) #.then [fina,erro]...
					e: (che...)-> ({fina,erro})->
						page.evaluate(che[che.length-1], che[..-2]...).then [fina,erro]...
					a: (uri)-> ({fina,erro})->
						page.goto(uri).then [fina,erro]...
					c: ({fina,erro})->
						page.screenshot().then [fina,erro]...
			cheese: (res)-> (uri)-> ({fina,erro})-> await g.c(
				await browser.newPage()
			) (page)->
				await page.setViewport res
				page.goto(uri).then ->
					page.screenshot().then(
						(buffer)->
							fina buffer
							browser.close()
						(error)->
							g.m "#{error}"
							erro error
							browser.close()
					)
		# (res)-> 
		# 	await g.c(
		# 		await browser.newPage()
		# 		await page.setViewport res
		# 		page
		# 	) (page)-> 
		#catch e
		#	g.m "#{e}"
		#finally
		#	await browser.close()
		# g.m lo for lo in log 
		###
			lucía:
				programación en función de lo que se ve

					medias:
						sma:
							1h: en caliente
		###