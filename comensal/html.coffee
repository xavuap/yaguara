
	module.exports = (g)-> g.c(
		(atr)->(content)->(tablas="")->
			###
				content
					undefined
						«!DOCTYPE html»
					null
						«link rel="icon" /»
					""
						«span»«/span»
					[]
						«div»
						«/div»
					"hola"
						«span»"hola"«/span»
					["lista",html(ul:null)]
						«li»
							lista
							«ul»
						«/li»
			###
			props = []
			for prop of atr
				props.push(
					if atr[prop]?
						"#{prop}=\"#{atr[prop]}\""
					else
						prop
				)
			cierre = "</#{props[0]}>" 
			# cierre if content? # and not content?.length # typeof content
			[
				'\xa0' unless props.length
				"<#{props.join(' ')}#{ (" /" if content is null) ? "" }>#{ {string:content+cierre}[typeof content] ? "" }" if props.length
				( (("\t" if props.length) ? "\t" ) + tablas + (conteudo?(tablas+"\t") ? "\t"+conteudo) for conteudo in content).join("\n") if content? and content.length and typeof content isnt "string"
				tablas+cierre if props.length and Array.isArray(content)
				'\xa0' unless props.length
			].filter(Boolean).join("\n")
	) (html)-> ({lang,title,icon,css,ecma})->
		[
			html(
				"!DOCTYPE":null
				html: null
			)()()
			html(
				html: null
				lang: lang ? "es"
			)([
				html(
					head: null
				)	[
						html(
							meta: null
							charset: "utf-8"
							name: "viewport"
							content: "user-scalable=no"
						) null
						html(
							title: null
						) title ? process.env["HEROKU_APP_NAME"]
					].concat(
						html(
							link: null
							rel: "icon"
							type: icon?.type ? "" # l?.icono?.type ? "svg+xml" # "image/jpeg"
							href: icon?.href ? "" # g.s(l?.icono?.href?)
						) null
					).concat(
						for hoja in css ? [] then g.c(
							if hoja.href?
								["",{href: hoja.href}]
							else
								[[hoja],{}]
						) ([hoja,href])->
							html({
								link: null
								type: "text/css"
								hoja...
								rel: "stylesheet"
							}) hoja
					).concat(
						for script in ecma ? [] then g.c(
							if script.src?
								["",{src: script.src}]
							else
								[[script],{}]
						) ([script,src])-> 
							html({
								script: null
								type: "text/javascript"
								charset: "utf-8"
								src...
							}) script
					)
			])()
		].join "\n"