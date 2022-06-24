
	module.exports = (g)-> g.c(require "fs") (fs)-> # require("fs")
		leer: (ruta)-> g.c(
			(gen)->(fina)->
				# console.log ruta
				fs.readFile("#{ruta}",gen,(erro,letras)-> # revisar que no manda el error
					fina (g.s(erro) null: letras) ? null
				)
			) (leer) ->
				bin: leer null
				utf: leer "utf8"
		ecri: (dozo)->(tetas)->(fina)->
			fs.mkdir (["."]).concat(dozo.split("/").slice(0,-1)).join("/") , recursive: true , (erro) ->
				if erro
					console.log erro
					#throw erro;
				else
					# console.log ecri: "#{dozo}": tetas
					# console.log ecri: "#{dozo}"
					fs.writeFile(dozo,tetas,"utf8",fina)
		hai: (dozo)->
			fs.existsSync(dozo)
		chorro:
			leer: fs.createReadString
			ecri: fs.createWriteString