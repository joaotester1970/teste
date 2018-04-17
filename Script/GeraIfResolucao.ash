arquivoEntradaResolucao = Resolucoes.txt
arquivoEntradaAtributo = Atributos.txt
arquivoSaida = IFResolucao.txt

screenXReferencia = 1920
screenYReferencia = 1080

FileDelete %arquivoSaida%

Loop, read, %arquivoEntradaResolucao%
{
	campos := StrSplit(A_LoopReadLine, ",")
	
	screenX := campos[1]
	screenY := campos[2]
	
	screenXRazao := screenX / screenXReferencia 
	screenYRazao := screenY / screenYReferencia
	
	FileAppend, if (screenSizeX = %screenX% && screenSizeY = %screenY%)`n, %arquivoSaida%
	FileAppend, {`n, %arquivoSaida%
	
	Loop, read, atributos.txt
	{
		campos := StrSplit(A_LoopReadLine, ",")

		atributo := campos[1]
		valorX := campos[2] * screenXRazao
		valorX := format("{:u}", valorX)
		valorY := campos[3] * screenYRazao
		valorY := format("{:u}", valorY)
		FileAppend, %A_Tab%%atributo%X := %valorX%`n, %arquivoSaida%
		FileAppend, %A_Tab%%atributo%Y := %valorY%`n, %arquivoSaida%

	}	
	
	FileAppend, }`nelse%A_Space%, %arquivoSaida%
}
