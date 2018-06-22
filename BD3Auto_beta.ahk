;$r::send, r
;na frente da tecla não deixa ela executar recursivamente.

#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

Global telaAtiva, telaAtiva := 0 ; 0 nenhuma, 1 InfoAvancadas, 2 configuracao
Global InfoAvancadasAtivo, InfoAvancadasAtivo := -1
Global InfoAvancadasMetros ; 0 - apenas metros; 1 - mais informações
Global configAvancadas ; 0 - sem temporizador; 1 - com temporizador
Global testeForaDiablo ; 1 - para testar em ambiente fora do diablo

global atalhoParagonDano
global atalhoParagonVida
global atalhoTrocaKadala
global atalhoReciclaUM
global atalhoReciclaLinha
global atalhoTransformaRaroLendarioHorizontal
global atalhoTransformaRaroLendarioVertical
global atalhoHabilidadeAutomatica1
global atalhoHabilidadeAutomatica2
global atalhoHabilidadeAutomatica3
global atalhoHabilidadeAutomatica4
global atalhoPerfilAutomatico1
global atalhoPerfilAutomatico2
global atalhoPerfilAutomatico3
global atalhoPerfilAutomatico4
global atalhoPerfilAutomatico5
global atalhoPerfilAutomatico6
global atalhoPerfilAutomatico7
global atalhoPerfilAutomatico8
global atalhoTeleporte
global atalhoMostraDistanciaDiablo
global atalhoMostraInfoAvancadas
global atalhoSequenciadorAutomatico1
global atalhoSequenciadorAutomatico2
global atalhoSequenciadorAutomatico3
global atalhoSequenciadorAutomatico4

global atalhoParagonDanoPadrao, atalhoParagonDanoPadrao := "F8"
global atalhoParagonVidaPadrao, atalhoParagonVidaPadrao := "F7"
global atalhoTrocaKadalaPadrao, atalhoTrocaKadalaPadrao := "F5"
global atalhoReciclaUMPadrao, atalhoReciclaUMPadrao := "F6"
global atalhoReciclaLinhaPadrao, atalhoReciclaLinhaPadrao := "^+F6"
global atalhoTransformaRaroLendarioHorizontalPadrao, atalhoTransformaRaroLendarioHorizontalPadrao := "F11"
global atalhoTransformaRaroLendarioVerticalPadrao, atalhoTransformaRaroLendarioVerticalPadrao := "^F11"
global atalhoHabilidadeAutomatica1Padrao, atalhoHabilidadeAutomatica1Padrao := "F1"
global atalhoHabilidadeAutomatica2Padrao, atalhoHabilidadeAutomatica2Padrao := "F2"
global atalhoHabilidadeAutomatica3Padrao, atalhoHabilidadeAutomatica3Padrao := "F3"
global atalhoHabilidadeAutomatica4Padrao, atalhoHabilidadeAutomatica4Padrao := "F4"
global atalhoPerfilAutomatico1Padrao, atalhoPerfilAutomatico1Padrao := "^F1"
global atalhoPerfilAutomatico2Padrao, atalhoPerfilAutomatico2Padrao := "^F2"
global atalhoPerfilAutomatico3Padrao, atalhoPerfilAutomatico3Padrao := "^F3"
global atalhoPerfilAutomatico4Padrao, atalhoPerfilAutomatico4Padrao := "^F4"
global atalhoPerfilAutomatico5Padrao, atalhoPerfilAutomatico5Padrao := "^+F1"
global atalhoPerfilAutomatico6Padrao, atalhoPerfilAutomatico6Padrao := "^+F2"
global atalhoPerfilAutomatico7Padrao, atalhoPerfilAutomatico7Padrao := "^+F3"
global atalhoPerfilAutomatico8Padrao, atalhoPerfilAutomatico8Padrao := "^+F4"
global atalhoTeleportePadrao, atalhoTeleportePadrao := "^t"
global atalhoMostraDistanciaDiabloPadrao, atalhoMostraDistanciaDiabloPadrao := "^+d"
global atalhoMostraInfoAvancadasPadrao, atalhoMostraInfoAvancadasPadrao := "^+m"
global atalhoSequenciadorAutomatico1Padrao, atalhoSequenciadorAutomatico1Padrao := "^F5"
global atalhoSequenciadorAutomatico2Padrao, atalhoSequenciadorAutomatico2Padrao := "^F6"
global atalhoSequenciadorAutomatico3Padrao, atalhoSequenciadorAutomatico3Padrao := "^F7"
global atalhoSequenciadorAutomatico4Padrao, atalhoSequenciadorAutomatico4Padrao := "^F8"

global screenSizeX
global screenSizeY

global latency1
global latency2
global atalhoDiabloParagon
global quantTrocaKadala
global screenSizeRegX
global screenSizeRegY

global stat1
global vit1
global speed1
global resource1
global stat2
global vit2
global speed2
global resource2

Global habilitadeAutomatica1Estado, habilitadeAutomatica1Estado := -1
Global habilitadeAutomatica2Estado, habilitadeAutomatica2Estado := -1
Global habilitadeAutomatica3Estado, habilitadeAutomatica3Estado := -1
Global habilitadeAutomatica4Estado, habilitadeAutomatica4Estado := -1

Global habilidadeAutomaticaTipo ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico

Global perfilAutomaticoEstado, perfilAutomaticoEstado := 0 ; 0 = está desligado; 1 = está ligado
Global perfilAutomaticoCarregado

Global nomePerfil1
Global habilidade1TempoPerfil1
Global habilidade2TempoPerfil1
Global habilidade3TempoPerfil1
Global habilidade4TempoPerfil1
Global nomePerfil2
Global habilidade1TempoPerfil2
Global habilidade2TempoPerfil2
Global habilidade3TempoPerfil2
Global habilidade4TempoPerfil2
Global nomePerfil3
Global habilidade1TempoPerfil3
Global habilidade2TempoPerfil3
Global habilidade3TempoPerfil3
Global habilidade4TempoPerfil3
Global nomePerfil4
Global habilidade1TempoPerfil4
Global habilidade2TempoPerfil4
Global habilidade3TempoPerfil4
Global habilidade4TempoPerfil4
Global nomePerfil5
Global habilidade1TempoPerfil5
Global habilidade2TempoPerfil5
Global habilidade3TempoPerfil5
Global habilidade4TempoPerfil5
Global nomePerfil6
Global habilidade1TempoPerfil6
Global habilidade2TempoPerfil6
Global habilidade3TempoPerfil6
Global habilidade4TempoPerfil6
Global nomePerfil7
Global habilidade1TempoPerfil7
Global habilidade2TempoPerfil7
Global habilidade3TempoPerfil7
Global habilidade4TempoPerfil7
Global nomePerfil8
Global habilidade1TempoPerfil8
Global habilidade2TempoPerfil8
Global habilidade3TempoPerfil8
Global habilidade4TempoPerfil8

Global sequenciadorAutomaticoEstado, sequenciadorAutomaticoEstado := 0
Global sequenciadorAutomaticoCarregado, sequenciadorAutomaticoCarregado := 1
Global sequenciadorAutomaticoTeclaAcionada
Global sequenciadorAutomatico1AtalhoAntes
Global sequenciadorAutomatico2AtalhoAntes
Global sequenciadorAutomatico3AtalhoAntes
Global sequenciadorAutomatico4AtalhoAntes

Global sequenciadorAutomatico1Atalho
Global sequenciadorAutomatico1Tecla1
Global sequenciadorAutomatico1Tecla1Tempo
Global sequenciadorAutomatico1Tecla2
Global sequenciadorAutomatico1Tecla2Tempo
Global sequenciadorAutomatico1Tecla3
Global sequenciadorAutomatico1Tecla3Tempo
Global sequenciadorAutomatico1Tecla4
Global sequenciadorAutomatico1Tecla4Tempo
Global sequenciadorAutomatico2Atalho
Global sequenciadorAutomatico2Tecla1
Global sequenciadorAutomatico2Tecla1Tempo
Global sequenciadorAutomatico2Tecla2
Global sequenciadorAutomatico2Tecla2Tempo
Global sequenciadorAutomatico2Tecla3
Global sequenciadorAutomatico2Tecla3Tempo
Global sequenciadorAutomatico2Tecla4
Global sequenciadorAutomatico2Tecla4Tempo
Global sequenciadorAutomatico3Atalho
Global sequenciadorAutomatico3Tecla1
Global sequenciadorAutomatico3Tecla1Tempo
Global sequenciadorAutomatico3Tecla2
Global sequenciadorAutomatico3Tecla2Tempo
Global sequenciadorAutomatico3Tecla3
Global sequenciadorAutomatico3Tecla3Tempo
Global sequenciadorAutomatico3Tecla4
Global sequenciadorAutomatico3Tecla4Tempo
Global sequenciadorAutomatico4Atalho
Global sequenciadorAutomatico4Tecla1
Global sequenciadorAutomatico4Tecla1Tempo
Global sequenciadorAutomatico4Tecla2
Global sequenciadorAutomatico4Tecla2Tempo
Global sequenciadorAutomatico4Tecla3
Global sequenciadorAutomatico4Tecla3Tempo
Global sequenciadorAutomatico4Tecla4
Global sequenciadorAutomatico4Tecla4Tempo

Global forcarMovimentoEstado, forcarMovimentoEstado := -1

Global trocaWheelUpDownNecroEstado, trocaWheelUpDownNecroEstado := -1

global menuAtributoX
global menuAtributoY
global resetButtonX
global resetButtonY
global acceptX
global acceptY
global mainStatX
global mainStatY
global vitX
global vitY
global speedX
global speedY
global resourceX
global resourceY
global reciclaOKX
global reciclaOKY
Global limiteBagMinX 
Global limiteBagMinY 
Global preencherBotaoX 
Global preencherBotaoY 
Global transmutarBotaoX
Global transmutarBotaoY
Global limiteDiferencaX
Global limiteDiferencaY
Global menuJogoOpcoesX
Global menuJogoOpcoesY
Global menuJogoConfTeclasX
Global menuJogoConfTeclasY
Global menuJogoBarraRolagemArrastoX1
Global menuJogoBarraRolagemArrastoY1
Global menuJogoBarraRolagemArrastoX2
Global menuJogoBarraRolagemArrastoY2
Global menuJogoHabilidade4Tecla1X
Global menuJogoHabilidade4Tecla1Y
Global menuJogoHabilidade4Tecla2X
Global menuJogoHabilidade4Tecla2Y
Global menuJogoForcarMovimentoTecla1X
Global menuJogoForcarMovimentoTecla1Y
Global menuJogoForcarMovimentoTecla2X
Global menuJogoForcarMovimentoTecla2Y
Global menuJogoAceitarX
Global menuJogoAceitarY

Global posicaoCentralX
Global posicaoCentralY
Global screenXRazao
Global screenYRazao

Global MyText
Global angulo
Global distanciaMetros
Global distanciaPixel

Global novaPosicaoX
Global novaPosicaoY

Global transformaRaroLendarioPosicao ; 0 = horizontal; 1 = vertical
Global transformaRaroLendarioSituacao, transformaRaroLendarioSituacao := -1 ; 1 = está ligado, -1 = está desligado

CoordMode, Mouse, Window

Thread, NoTimers

carregaConfiguracao()

validaResolucao()

IfWinActive, Diablo III
{
    ;WinActivate, Diablo III

    SendInput, {Enter} ;menu do jogo
    SendInput, r ;menu do jogo
    SendInput, {Enter} ;menu do jogo
}
else 
{

    MsgBox, 0,,
(
Tamanho da tela = %screenSizeX% x %screenSizeY%
Para configurar pressione Control+Shift+C
),3
;;;;;AutoCast para tecla de forçar movimento (0 no diablo) = Tecla Windows+F12 (em análise)
}

SetDefaultMouseSpeed, 0 ; mouse moves faster

Hotkey, ^+r, recarregar
Hotkey, ^+c, abreJanelaConfiguracao
Hotkey, F12, posicao
;Hotkey, #F12, forcarMovimento
;Hotkey, ^F12, validaCor

if testeForaDiablo <> 1
{
    Hotkey, IfWinActive, Diablo III
}

Hotkey, %atalhoParagonDano%, trocaParagonDano ; starts damage script
Hotkey, %atalhoParagonVida%, trocaParagonVida ; starts health script1
Hotkey, F5, trocaKadala
Hotkey, F6, reciclaUM
Hotkey, +^F6, reciclaLinha
Hotkey, F11, transformaRaroLendarioHorizontal
Hotkey, ^F11, transformaRaroLendarioVertical
Hotkey, F1, habilidadeAutomatica1
Hotkey, F2, habilidadeAutomatica2
Hotkey, F3, habilidadeAutomatica3
Hotkey, F4, habilidadeAutomatica4
Hotkey, ^F1, perfilAutomatico1
Hotkey, ^F2, perfilAutomatico2
Hotkey, ^F3, perfilAutomatico3
Hotkey, ^F4, perfilAutomatico4
Hotkey, +^F1, perfilAutomatico5
Hotkey, +^F2, perfilAutomatico6
Hotkey, +^F3, perfilAutomatico7
Hotkey, +^F4, perfilAutomatico8
Hotkey, +F12, trocaWheelUpDownNecro
Hotkey, ^t, teleporte
Hotkey, ^+d, mostraDistanciaDiablo
Hotkey, ^+m, mostraInfoAvancadas

Hotkey, ^F5, sequenciadorAutomatico1
Hotkey, ^F6, sequenciadorAutomatico2
Hotkey, ^F7, sequenciadorAutomatico3
Hotkey, ^F8, sequenciadorAutomatico4

if sequenciadorAutomatico1Atalho <> ""
{
    Hotkey, $%sequenciadorAutomatico1Atalho%, sequenciadorAutomaticoTeclaPressionada1
}
if sequenciadorAutomatico2Atalho <> ""
{
    Hotkey, $%sequenciadorAutomatico2Atalho%, sequenciadorAutomaticoTeclaPressionada2
}
if sequenciadorAutomatico3Atalho <> ""
{
    Hotkey, $%sequenciadorAutomatico3Atalho%, sequenciadorAutomaticoTeclaPressionada3
}
if sequenciadorAutomatico4Atalho <> ""
{
    Hotkey, $%sequenciadorAutomatico4Atalho%, sequenciadorAutomaticoTeclaPressionada4
}

return

recarregar()
{
    Reload
    Return
}

perfilAutomatico1()
{
    habilidadeAutomaticaTipo := 0 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    perfilAutomatico(1)
    Return
}
perfilAutomatico2()
{
    habilidadeAutomaticaTipo := 0 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    perfilAutomatico(2)
    Return
}
perfilAutomatico3()
{
    habilidadeAutomaticaTipo := 0 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    perfilAutomatico(3)
    Return
}
perfilAutomatico4()
{
    habilidadeAutomaticaTipo := 0 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    perfilAutomatico(4)
    Return
}
perfilAutomatico5()
{
    habilidadeAutomaticaTipo := 0 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    perfilAutomatico(5)
    Return
}
perfilAutomatico6()
{
    habilidadeAutomaticaTipo := 0 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    perfilAutomatico(6)
    Return
}
perfilAutomatico7()
{
    habilidadeAutomaticaTipo := 0 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    perfilAutomatico(7)
    Return
}
perfilAutomatico8()
{
    habilidadeAutomaticaTipo := 0 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    perfilAutomatico(8)
    Return
}

sequenciadorAutomatico1()
{
    habilidadeAutomaticaTipo := 1 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    sequenciadorAutomatico(1)
    Return
}
sequenciadorAutomatico2()
{
    habilidadeAutomaticaTipo := 1 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    sequenciadorAutomatico(2)
    Return
}
sequenciadorAutomatico3()
{
    habilidadeAutomaticaTipo := 1 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    sequenciadorAutomatico(3)
    Return
}
sequenciadorAutomatico4()
{
    habilidadeAutomaticaTipo := 1 ; 0 = perfilAutomatico; 1 = sequenciadorAutomatico
    sequenciadorAutomatico(4)
    Return
}

sequenciadorAutomaticoTeclaPressionada1()
{
    sequenciadorAutomaticoTeclaAcionada := 1
    sequenciadorAutomaticoTeclaPressionada()
    Return
}
sequenciadorAutomaticoTeclaPressionada2()
{
    sequenciadorAutomaticoTeclaAcionada := 2
    sequenciadorAutomaticoTeclaPressionada()
    Return
}
sequenciadorAutomaticoTeclaPressionada3()
{
    sequenciadorAutomaticoTeclaAcionada := 3
    sequenciadorAutomaticoTeclaPressionada()
    Return
}
sequenciadorAutomaticoTeclaPressionada4()
{
    sequenciadorAutomaticoTeclaAcionada := 4
    sequenciadorAutomaticoTeclaPressionada()
    Return
}

trocaParagonDano() ; script to change paragon for dealing damage
{
    Critical

    validaResolucao()
    
    MouseGetPos, mouseX, mouseY

    SendInput %atalhoDiabloParagon%

    SetMouseDelay, %latency1%
    MouseClick, Left, menuAtributoX, menuAtributoY

    SetMouseDelay, %latency1%
    MouseClick, Left, resetButtonX, resetButtonY

    SendInput, {Ctrl Down}
    
    SetMouseDelay, %latency2%
    Loop, %resource1%
    {
        MouseClick, Left, resourceX, resourceY
    }

    SetMouseDelay, %latency2%
    Loop, %speed1%
    {
        MouseClick, Left, speedX, speedY
    }

    SetMouseDelay, %latency2%
    Loop, %vit1%
    {
        MouseClick, Left, vitX, vitY
    }

    SetMouseDelay, %latency2%
    Loop, %stat1%
    {
        MouseClick, Left, mainStatX, mainStatY
    }

    SendInput, {Ctrl Up}

    SetMouseDelay, %latency2%
    MouseClick, Left, acceptx, acceptY

    MouseMove, mouseX, mouseY

    return

}

trocaParagonVida() ; script to change paragon for staying alive
{
    Critical
    
    validaResolucao()
    
    MouseGetPos, mouseX, mouseY

    SendInput %atalhoDiabloParagon%

    SetMouseDelay, %latency1%
    MouseClick, Left, menuAtributoX, menuAtributoY

    SetMouseDelay, %latency1%
    MouseClick, Left, resetButtonX, resetButtonY

    SendInput, {Ctrl Down}
    
    SetMouseDelay, %latency2%
    Loop, %resource2%
    {
        MouseClick, Left, resourceX, resourceY
    }

    SetMouseDelay, %latency2%
    Loop, %speed2%
    {
        MouseClick, Left, speedX, speedY
    }

    SetMouseDelay, %latency2%
    Loop, %vit2%
    {
        MouseClick, Left, vitX, vitY
    }

    SetMouseDelay, %latency2%
    Loop, %stat2%
    {
        MouseClick, Left, mainStatX, mainStatY
    }

    SendInput, {Ctrl Up}

    SetMouseDelay, %latency2%
    MouseClick, Left, acceptx, acceptY

    MouseMove, mouseX, mouseY

    return
}

trocaKadala()  
{
    Critical

    validaResolucao()
    
    MouseGetPos, mouseX, mouseY
    SetMouseDelay, 0
    Loop, %quantTrocaKadala%
    {

    	MouseClick, Right, mouseX, mouseY
    }

    return
}

reciclaUM()
{
    Critical

    validaResolucao()

    MouseGetPos, mouseX, mouseY
    SetMouseDelay, 0
    MouseClick, Left, mouseX, mouseY
    SetMouseDelay, 0
    MouseClick, Left, reciclaOKX, reciclaOKY

    SetMouseDelay, 0
    MouseMove, mouseX, mouseY
    return

}

reciclaLinha()
{
    Critical
    
    validaResolucao()

    MouseGetPos, mouseX, mouseY

    novaPosicaoX := mouseX
    novaPosicaoY := mouseY

    loop
    {
        SetMouseDelay, 0
        MouseClick, Left, novaPosicaoX, novaPosicaoY
        SetMouseDelay, 0
        MouseClick, Left, reciclaOKX, reciclaOKY
        novaPosicaoX := NovaPosicaoX - limiteDiferencaX
    
    } until novaPosicaoX <= limiteBagMinX

    SetMouseDelay, 0
    MouseMove, mouseX, mouseY

    return

}

habilidadeAutomatica1()
{
	
    if habilitadeAutomatica1Estado = -1
    {
    	SendInput, {1 Down}
    }
    else
    {
    	SendInput, {1 Up}
    }
    habilitadeAutomatica1Estado := habilitadeAutomatica1Estado * -1

    return

}

habilidadeAutomatica2()
{
	
    if habilitadeAutomatica2Estado = -1
    {
    	SendInput, {2 Down}
    }
    else
    {
    	SendInput, {2 Up}
    }
    habilitadeAutomatica2Estado := habilitadeAutomatica2Estado * -1

    return
}

habilidadeAutomatica3()
{
	
    if habilitadeAutomatica3Estado = -1
    {
    	SendInput, {3 Down}
    }
    else
    {
    	SendInput, {3 Up}
    }
    habilitadeAutomatica3Estado := habilitadeAutomatica3Estado * -1

    return
}

habilidadeAutomatica4()
{
	
    if habilitadeAutomatica4Estado = -1
    {
    	SendInput, {4 Down}
    }
    else
    {
    	SendInput, {4 Up}
    }
    habilitadeAutomatica4Estado := habilitadeAutomatica4Estado * -1

    return
}

forcarMovimento()
{
	
    if forcarMovimentoEstado = -1
    {
;    	SetKeyDelay, 1
		Send, {0 Down}
    }
    else
    {
    	Send, {0 Up}
    }
    forcarMovimentoEstado := forcarMovimentoEstado * -1

    return
}

transformaRaroLendarioHorizontal()  ; esquerda para direita (eixo X)
{

    transformaRaroLendarioPosicao := 0
    transformaRaroLendario()
    return

}

transformaRaroLendarioVertical()
{

    transformaRaroLendarioPosicao := 1
    transformaRaroLendario()
    return

}

transformaRaroLendario()
{

    if transformaRaroLendarioSituacao = -1
    {
        validaResolucao()

        MouseGetPos, mouseX, mouseY

        novaPosicaoX := mouseX
        novaPosicaoY := mouseY

        SetTimer, transformaRaroLendarioTimer, 1000
    }
    else
    {
        SetTimer, transformaRaroLendarioTimer, Off
    }

    transformaRaroLendarioSituacao := transformaRaroLendarioSituacao * -1   

    return

}

transformaRaroLendarioTimer()
{

    Critical 
    
    SetMouseDelay, 10
    MouseClick, Right, novaPosicaoX, novaPosicaoY
    SetMouseDelay, 10
    MouseClick, Left, preencherBotaoX, preencherBotaoY
    SetMouseDelay, 10
    MouseClick, Left, transmutarBotaoX, transmutarBotaoY ; transmutar
    Sleep, 3000
    SetMouseDelay, 10
    MouseClick, Left, transmutarBotaoX, transmutarBotaoY ; aceitar
    
    if transformaRaroLendarioPosicao = 0 ; 0 = horizontal , 1 = vertical
    {
        novaPosicaoX := NovaPosicaoX - limiteDiferencaX
    }
    else
    {
        novaPosicaoY := NovaPosicaoY - limiteDiferencaY
    }
    
    if (novaPosicaoX <= limiteBagMinX) or (novaPosicaoY <= limiteBagMinY)
    {
        SetTimer, transformaRaroLendarioTimer, Off
        transformaRaroLendarioSituacao := -1
    }
    else
    {
        MouseMove, novaPosicaoX, novaPosicaoY
    }

    return
}

posicao()  
{

    arquivoSaida := pontos.txt

    MouseGetPos, mouseX, mouseY
    
    ;PixelGetColor cor, %mouseX%, %mouseY%, RGB

	FileAppend, %mouseX%%A_Tab%%mouseY%`n, %arquivoSaida%

    return

}

sequenciadorAutomatico(perfilAcionado)
{
    if perfilAutomaticoEstado = 1
    {
        perfilAutomaticoEstado := 0
        perfilAutomatico(perfilAutomaticoCarregado)
    }
    
    if ((sequenciadorAutomaticoEstado = 0) and (habilidadeAutomaticaTipo = 1)) ; sequenciador desligado e pressionado atalhos de sequenciador
    {
        sequenciadorAutomaticoEstado := 1
    }
    else
    {
        sequenciadorAutomaticoEstado := 0
    }
 
    MouseGetPos, mouseX, mouseY
    SetMouseDelay, 0
    MouseClick, Left, mouseX, mouseY
    
    if (perfilAcionado <> sequenciadorAutomaticoCarregado)
    {
        sequenciadorAutomaticoCarregado := perfilAcionado
        sequenciadorAutomaticoEstado := 1 
    }
    
    return
}

sequenciadorAutomaticoTeclaPressionada()
{

    atalhoPressionado := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Atalho
    tecla1 := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla1
    tecla1Tempo := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla1Tempo
    tecla2 := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla2
    tecla2Tempo := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla2Tempo
    tecla3 := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla3
    tecla3Tempo := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla3Tempo
    tecla4 := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla4
    tecla4Tempo := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla4Tempo
    
    if (tecla1 = "" and tecla2 = "" and tecla3 = "" and tecla4 = "")
    {
        sequenciadorAutomaticoEstado := 0
    }
    
    if (sequenciadorAutomaticoEstado = 1) and (sequenciadorAutomaticoTeclaAcionada = sequenciadorAutomaticoCarregado)
    {
        if tecla1 <> "" 
        {
            setTimer, tecla1Timer, %tecla1Tempo%
        }    
        if tecla2 <> ""
        {
            setTimer, tecla2Timer, %tecla2Tempo%
        }
        if tecla3 <> ""
        {
            setTimer, tecla3Timer, %tecla3Tempo%
        }
        if tecla4 <> ""
        {
            setTimer, tecla4Timer, %tecla4Tempo%
        }
    }
    else
    {
        Sendinput, %atalhoPressionado%
    }
    
    return
}

tecla1Timer()
{
    tecla := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla1
    Sendinput, %tecla%
    setTimer, tecla1Timer, off
    return
}

tecla2Timer()
{
    tecla := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla2
    Sendinput, %tecla%
    setTimer, tecla2Timer, off
    return
}

tecla3Timer()
{
    tecla := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla3
    Sendinput, %tecla%
    setTimer, tecla3Timer, off
    return
}

tecla4Timer()
{
    tecla := sequenciadorAutomatico%sequenciadorAutomaticoTeclaAcionada%Tecla4
    Sendinput, %tecla%
    setTimer, tecla4Timer, off
    return

}

perfilAutomatico(perfilAcionado)
{
    
    if sequenciadorAutomaticoEstado = 1
    {
        sequenciadorAutomaticoEstado := 0
        sequenciadorAutomatico(sequenciadorAutomaticoCarregado)
    }
    
    if ((perfilAutomaticoEstado = 0) and (habilidadeAutomaticaTipo = 0))
    {
        perfilAutomaticoEstado := 1
    }
    else
    {
        perfilAutomaticoEstado := 0
    }
    
    MouseGetPos, mouseX, mouseY
    SetMouseDelay, 0
    MouseClick, Left, mouseX, mouseY
    
    if (perfilAcionado <> perfilAutomaticoCarregado)
    {
        perfilAutomaticoCarregado := perfilAcionado
        SetTimer, habilidade1, Off
        SetTimer, habilidade2, Off
        SetTimer, habilidade3, Off
        SetTimer, habilidade4, Off
        perfilAutomaticoEstado := 1 
    }

    
    if perfilAutomaticoEstado = 1
    {
        tempo1 := habilidade1TempoPerfil%perfilAutomaticoCarregado%
        tempo2 := habilidade2TempoPerfil%perfilAutomaticoCarregado%
        tempo3 := habilidade3TempoPerfil%perfilAutomaticoCarregado%
        tempo4 := habilidade4TempoPerfil%perfilAutomaticoCarregado%

        If (tempo1 >= 70) 
        {
            habilidade1()
            SetTimer, habilidade1, %tempo1%
        }
        If (tempo2 >= 70) 
        {
            habilidade2()
            SetTimer, habilidade2, %tempo2%
        }
        If (tempo3 >= 70) 
        {
            habilidade3()
            SetTimer, habilidade3, %tempo3%
        }
        If (tempo4 >= 70) 
        {
            habilidade4()
            SetTimer, habilidade4, %tempo4%
        }
    }
    else
    {
        SetTimer, habilidade1, Off
        SetTimer, habilidade2, Off
        SetTimer, habilidade3, Off
        SetTimer, habilidade4, Off
    }

    return

}

habilidade1()
{
    SendInput, 1
    return
}

habilidade2()
{
    SendInput, 2
    return
}

habilidade3()
{
    SendInput, 3
    return
}

habilidade4()
{
    SendInput, 4
    return
}

teleporte()
{
    Send, t{Enter}
    return
}

mostraDistanciaDiablo()
{

    MouseGetPos, mouseX, mouseY
    ;texto := calculaDistanciaAnt(mouseX, mouseY)
    texto := calculaDistancia(mouseX, mouseY)

    SendInput, {Enter}
    SendInput, %texto%        
    SendInput, {Enter}

    return

}

atualizaInfoAvancadas()
{

    Gui, InfoAvancadas:Default

    MouseGetPos, mouseX, mouseY
    ;texto := calculaDistanciaAnt(mouseX, mouseY)
    texto := calculaDistancia(mouseX, mouseY)

    GuiControl,, MyText, %texto%

    return

}

calculaDistancia(mouseX, mouseY)
{

    ; quadrantes a (-,+) b (-,-) c (+,-) d(+,+)
    algulo := 0
    
    ;verificar influência dos angulos retos, 90,180,270 e 360
    
    catetoXPixel := posicaoCentralX - mouseX
    catetoYPixel := posicaoCentralY - mouseY
    
    if catetoXPixel = 0
        catetoXPixel := 1
    
    if catetoYPixel = 0
        catetoYPixel := 1

    if (catetoXPixel < 0 and catetoYPixel > 0) ; quadrante A
    {
        catetoXPixel := catetoXPixel * -1
        angulo := (atan(catetoXPixel/catetoYPixel))*(180/3.1415)
    }
    else if (catetoXPixel < 0 and catetoYPixel < 0) ; quadrante B
    {
        catetoXPixel := catetoXPixel * -1
        catetoYPixel := catetoYPixel * -1
        angulo := (atan(catetoXPixel/catetoYPixel))*(180/3.1415)
        angulo := (90 - angulo) + 90

    }
    else if (catetoXPixel > 0 and catetoYPixel < 0) ; quadrante C
    {
        catetoYPixel := catetoYPixel * -1
        angulo := (atan(catetoXPixel/catetoYPixel))*(180/3.1415)
        angulo := 180 + angulo
        
    }
    else  ; quadrante D
    {
        angulo := (atan(catetoXPixel/catetoYPixel))*(180/3.1415)
        angulo := (90 - angulo) + 270
    }
    
    angulo := Round(angulo, 2)

    
    if (mouseY >= posicaoCentralY) ; Y inferior
    {
        catetoYMetros := ((0.08807938*(0.99938944**(catetoYPixel-1)))*catetoYPixel) 
    }
    else ; Y superior
    {
        catetoYMetros := ((0.080479528*(1.00086283**(catetoYPixel-1)))*catetoYPixel) 
    }

    catetoXMetros := (0.063533792*(0.999838803**(catetoXPixel-1)))*catetoXPixel ; Relação em metro de X na posição central
    
    catetoXMetros := catetoXMetros * (1.362668238*(0.999388636**(mouseY-1))) 

    hipotenusaMetros := Round((Sqrt((catetoXMetros**2)+(catetoYMetros**2))),0)

    ;textoRetorno := angulo . "o - " . Round(hipotenusaMetros,1) . "(h) " . Round(catetoXMetros,1) . "(x)" . Round(catetoYMetros,1) . "(y) " . "posicao:" . mouseX . "x" . mouseY . "(" . posicaoCentralX . "x" . posicaoCentralY . ")"
    ;textoRetorno := angulo . "o - " . Round(hipotenusaMetros,1) . "(h) " . Round(catetoYMetros,1) . "(y) " . Round(catetoXMetros,1) . "(x)" . "posicao:" . mouseX . "x" . mouseY
    ;textoRetorno := Round(hipotenusaPixel,1) . "(h) " . Round(catetoYPixel,1) . "(y) " . Round(catetoXPixel,1) . "(x)" . "posicao:" . mouseX . "x" . mouseY . "(" . posicaoCentralX . "x" . posicaoCentralY . ")"
    ;textoRetorno := Round(catetoYMetros,1) . "(y) " . Round(catetoYPixel,1) . "(yP)" . " posicao:" . mouseX . "x" . mouseY

    if InfoAvancadasMetros = 0
    {
        textoRetorno := Round(hipotenusaMetros,0) . "m"
    }
    else
    {
        textoRetorno := angulo . "o - " . Round(hipotenusaMetros,1) . "(h) " . Round(catetoXMetros,1) . "(x)" . Round(catetoYMetros,1) . "(y) " . "posicao:" . mouseX . "x" . mouseY . "(" . posicaoCentralX . "x" . posicaoCentralY . ")"
    }

    return textoRetorno

}

trocaWheelUpDownNecro()
{
    Critical
    
    MouseGetPos, mouseX, mouseY

    SendInput, {Esc} ;menu do jogo

    SetMouseDelay, 50
    MouseClick, Left, menuJogoOpcoesX, menuJogoOpcoesY ; menu opções

    SetMouseDelay, 10
    MouseClick, Left, menuJogoConfTeclasX, menuJogoConfTeclasY ; opção config teclas

    MouseClickDrag, left, menuJogoBarraRolagemArrastoX1, menuJogoBarraRolagemArrastoY1, menuJogoBarraRolagemArrastoX2, menuJogoBarraRolagemArrastoY2

    if trocaWheelUpDownNecroEstado = -1
    {
        SetMouseDelay, 10
        MouseClick, Left, menuJogoHabilidade4Tecla1X, menuJogoHabilidade4Tecla1Y ; habilidade 3 - tecla 1
        SendInput, {WheelUp} ;menu do jogo

        SetMouseDelay, 10
        MouseClick, Left, menuJogoHabilidade4Tecla2X, menuJogoHabilidade4Tecla2Y ; habilidade 3 - tecla 2
        SendInput, 4 ;menu do jogo
    }
    else
    {
        SetMouseDelay, 10
        MouseClick, Left, menuJogoHabilidade4Tecla1X, menuJogoHabilidade4Tecla1Y ; habilidade 3 - tecla 1
        SendInput, {d} ;menu do jogo

        SetMouseDelay, 10
        MouseClick, Left, menuJogoHabilidade4Tecla2X, menuJogoHabilidade4Tecla2Y ; habilidade 3 - tecla 2
        SendInput, 4 ;menu do jogo

        SetMouseDelay, 10
        MouseClick, Left, menuJogoForcarMovimentoTecla1X, menuJogoForcarMovimentoTecla1Y ; forçar movimento - tecla 1
        SendInput, {WheelUp} ;menu do jogo

        SetMouseDelay, 10
        MouseClick, Left, menuJogoForcarMovimentoTecla2X, menuJogoForcarMovimentoTecla2Y ; forçar movimento - tecla 2
        SendInput, {WheelDown} ;menu do jogo
    }

    SetMouseDelay, 10
    MouseClick, Left, menuJogoAceitarX, menuJogoAceitarY ; aceitar

    SendInput, {Esc} ;sair menu do jogo

    MouseMove, mouseX, mouseY

    trocaWheelUpDownNecroEstado := trocaWheelUpDownNecroEstado * -1

    return

}

validaCor()  
{
    arquivoSaida := pontos.txt

    MouseGetPos, mouseX, mouseY

    PixelSearch, saidaX, saidaY, mouseX-10, mouseY-10, mouseX+10, mouseY+10, 0x0C3845, 3, Fast

    if ErrorLevel
    {
        FileAppend, %mouseX%;%mouseY%;%saidaX%;%saidaY%;não identificou`n, %arquivoSaida%
    }
    else
    {
        FileAppend, %mouseX%;%mouseY%;%saidaX%;%saidaY%;amarelo`n, %arquivoSaida%
    }

    return
}

validaResolucao()
{

    if (screenSizeRegX <> 0 && screenSizeRegY <> 0)
    {
        novascreenSizeX := screenSizeRegX
        novascreenSizeY := screenSizeRegY
    }
    else
    {
        SysGet, novascreenSizeX, 78
        SysGet, novascreenSizeY, 79

    }

    if (screenSizeX <> novascreenSizeX || screenSizeY <> novascreenSizeY)
    {
        screenSizeX := novascreenSizeX
        screenSizeY := novascreenSizeY
        ajustaResolucao()
    }

    return   
}

ajustaResolucao()
{

    screenXReferencia := 1920
    screenYReferencia := 1080
    screenXRazao := screenSizeX / screenXReferencia 
    screenYRazao := screenSizeY / screenYReferencia

    if (screenSizeX <= 1920)
    {
        
        menuAtributoX := format("{:u}", (617 * screenXRazao))
        menuAtributoY := format("{:u}", (110 * screenYRazao))
        resetButtonX := format("{:u}", (971 * screenXRazao))
        resetButtonY := format("{:u}", (727 * screenYRazao))
        acceptX := format("{:u}", (816 * screenXRazao))
        acceptY := format("{:u}", (821 * screenYRazao))
        mainStatX := format("{:u}", (1277 * screenXRazao))
        mainStatY := format("{:u}", (335 * screenYRazao))
        vitX := format("{:u}", (1277 * screenXRazao))
        vitY := format("{:u}", (425 * screenYRazao))
        speedX := format("{:u}", (1277 * screenXRazao))
        speedY := format("{:u}", (516 * screenYRazao))
        resourceX := format("{:u}", (1277 * screenXRazao))
        resourceY := format("{:u}", (612 * screenYRazao))

        reciclaOKX := format("{:u}", (847 * screenXRazao))
        reciclaOKY := format("{:u}", (377 * screenYRazao))

        limiteBagMinX := format("{:u}", (1409 * screenXRazao))
        limiteBagMinY := format("{:u}", (565 * screenYRazao))

        preencherBotaoX := format("{:u}", (714 * screenXRazao))
        preencherBotaoY := format("{:u}", (838 * screenYRazao))
        transmutarBotaoX := format("{:u}", (235 * screenXRazao))
        transmutarBotaoY := format("{:u}", (828 * screenYRazao))
        limiteDiferencaX := format("{:u}", (51 * screenXRazao))
        limiteDiferencaY := format("{:u}", (48 * screenYRazao))
        
        menuJogoOpcoesX := format("{:u}", (228 * screenXRazao))
        menuJogoOpcoesY := format("{:u}", (317 * screenYRazao))
        menuJogoConfTeclasX := format("{:u}", (509 * screenXRazao))
        menuJogoConfTeclasY := format("{:u}", (579 * screenYRazao))
        menuJogoBarraRolagemArrastoX1 := format("{:u}", (1536 * screenXRazao))
        menuJogoBarraRolagemArrastoY1 := format("{:u}", (360 * screenYRazao))
        menuJogoBarraRolagemArrastoX2 := format("{:u}", (1536 * screenXRazao))
        menuJogoBarraRolagemArrastoY2 := format("{:u}", (423 * screenYRazao))
        menuJogoHabilidade4Tecla1X := format("{:u}", (1142 * screenXRazao))
        menuJogoHabilidade4Tecla1Y := format("{:u}", (525 * screenYRazao))
        menuJogoHabilidade4Tecla2X := format("{:u}", (1389 * screenXRazao))
        menuJogoHabilidade4Tecla2Y := format("{:u}", (525 * screenYRazao))
        menuJogoForcarMovimentoTecla1X := format("{:u}", (1142 * screenXRazao))
        menuJogoForcarMovimentoTecla1Y := format("{:u}", (673 * screenYRazao))
        menuJogoForcarMovimentoTecla2X := format("{:u}", (1392 * screenXRazao))
        menuJogoForcarMovimentoTecla2Y := format("{:u}", (673 * screenYRazao))
        menuJogoAceitarX := format("{:u}", (1239 * screenXRazao))
        menuJogoAceitarY := format("{:u}", (867 * screenYRazao))

        posicaoCentralX := format("{:u}", (960 * screenXRazao))
        posicaoCentralY := format("{:u}", (507 * screenYRazao))
    }
    else
    {
        posicaoCentralXReferencia := 1920 / 2
        
        posicaoCentralX := screenSizeX / 2
        posicaoCentralY := format("{:u}", (507 * screenYRazao))

        screenYRazao := screenSizeY / screenYReferencia
        
        menuAtributoX := posicaoCentralX - (posicaoCentralXReferencia - 617)
        menuAtributoY := format("{:u}", (110 * screenYRazao))
        resetButtonX := posicaoCentralX - (posicaoCentralXReferencia - 971)
        resetButtonY := format("{:u}", (727 * screenYRazao))
        acceptX := posicaoCentralX - (posicaoCentralXReferencia - 816)
        acceptY := format("{:u}", (821 * screenYRazao))
        mainStatX := posicaoCentralX - (posicaoCentralXReferencia - 1277)
        mainStatY := format("{:u}", (335 * screenYRazao))
        vitX := posicaoCentralX - (posicaoCentralXReferencia - 1277)
        vitY := format("{:u}", (425 * screenYRazao))
        speedX := posicaoCentralX - (posicaoCentralXReferencia - 1277)
        speedY := format("{:u}", (516 * screenYRazao))
        resourceX := posicaoCentralX - (posicaoCentralXReferencia - 1277)
        resourceY := format("{:u}", (612 * screenYRazao))

        reciclaOKX := posicaoCentralX - (posicaoCentralXReferencia - 847)
        reciclaOKY := format("{:u}", (377 * screenYRazao))

        limiteBagMinX := screenSizeX - (screenXReferencia - 1409)
        limiteBagMinY := format("{:u}", (565 * screenYRazao))

        preencherBotaoX := 714
        preencherBotaoY := format("{:u}", (838 * screenYRazao))
        transmutarBotaoX := 235
        transmutarBotaoY := format("{:u}", (828 * screenYRazao))
        limiteDiferencaX := 51
        limiteDiferencaY := format("{:u}", (48 * screenYRazao))
        
        menuJogoOpcoesX := posicaoCentralX - (posicaoCentralXReferencia - 228)
        menuJogoOpcoesY := format("{:u}", (317 * screenYRazao))
        menuJogoConfTeclasX := posicaoCentralX - (posicaoCentralXReferencia - 509)
        menuJogoConfTeclasY := format("{:u}", (579 * screenYRazao))
        menuJogoBarraRolagemArrastoX1 := posicaoCentralX - (posicaoCentralXReferencia - 1536)
        menuJogoBarraRolagemArrastoY1 := format("{:u}", (360 * screenYRazao))
        menuJogoBarraRolagemArrastoX2 := posicaoCentralX - (posicaoCentralXReferencia - 1536)
        menuJogoBarraRolagemArrastoY2 := format("{:u}", (423 * screenYRazao))
        menuJogoHabilidade4Tecla1X := posicaoCentralX - (posicaoCentralXReferencia - 1142)
        menuJogoHabilidade4Tecla1Y := format("{:u}", (525 * screenYRazao))
        menuJogoHabilidade4Tecla2X := posicaoCentralX - (posicaoCentralXReferencia - 1389)
        menuJogoHabilidade4Tecla2Y := format("{:u}", (525 * screenYRazao))
        menuJogoForcarMovimentoTecla1X := posicaoCentralX - (posicaoCentralXReferencia - 1142)
        menuJogoForcarMovimentoTecla1Y := format("{:u}", (673 * screenYRazao))
        menuJogoForcarMovimentoTecla2X := posicaoCentralX - (posicaoCentralXReferencia - 1392)
        menuJogoForcarMovimentoTecla2Y := format("{:u}", (673 * screenYRazao))
        menuJogoAceitarX := posicaoCentralX - (posicaoCentralXReferencia - 1239)
        menuJogoAceitarY := format("{:u}", (867 * screenYRazao))
    }

    return
}

carregaConfiguracao()
{
    ;Parametros de configuração


    RegRead, latency1, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 01_LatenciaPainelParagon
    if latency1 is integer
    {
        migraConfigVelha()
    }

    ;Parametros de configuração
    RegRead, InfoAvancadasMetros, HKEY_CURRENT_USER\Software\BD3Auto\Config, InfoAvancadasMetros
    if InfoAvancadasMetros is not integer
    {
        InfoAvancadasMetros := 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, InfoAvancadasMetros, %InfoAvancadasMetros%
    }

    RegRead, testeForaDiablo, HKEY_CURRENT_USER\Software\BD3Auto\Config, TesteForaDiablo
    if testeForaDiablo is not integer
    {
        testeForaDiablo := 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, TesteForaDiablo, %testeForaDiablo%
    }

    RegRead, configAvancadas, HKEY_CURRENT_USER\Software\BD3Auto\Config, ConfigAvancadas
    if configAvancadas is not integer
    {
        configAvancadas := 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ConfigAvancadas, %configAvancadas%
    }

    RegRead, latency1, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaPainelParagon
    if latency1 is not integer
    {
        latency1 := 100
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaPainelParagon, %latency1%
    }

    RegRead, latency2, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaClick
    if latency2 is not integer
    {
        latency2 := 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaClick, %latency2%
    }
    
    RegRead, atalhoDiabloParagon, HKEY_CURRENT_USER\Software\BD3Auto\Config, AtalhoDiabloParagon
    if atalhoDiabloParagon is space
    {
        atalhoDiabloParagon := "p"
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, AtalhoDiabloParagon, %atalhoDiabloParagon%
    }

    RegRead, quantTrocaKadala, HKEY_CURRENT_USER\Software\BD3Auto\Config, QuantTrocaKadala
    if quantTrocaKadala is not integer
    {
        quantTrocaKadala := 30
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, QuantTrocaKadala, %quantTrocaKadala%
    }

    RegRead, screenSizeRegX, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoX
    if screenSizeRegX is not integer
    {
        screenSizeRegX := 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoX, %screenSizeRegX%
    }

    RegRead, screenSizeRegY, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoY
        if screenSizeRegY is not integer
    {
        screenSizeRegY := 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoY, %screenSizeRegY%
    }

;----------------------------------
;configurações avançadas - atalhos

    RegRead, atalhoParagonDano, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, atalhoParagonDano
    if atalhoParagonDano is space
    {
        atalhoParagonDano := atalhoParagonDanoPadrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, atalhoParagonDano, %atalhoParagonDano%
    }

    RegRead, atalhoParagonVida, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, AtalhoParagonVida
    if atalhoParagonVida is space
    {
        atalhoParagonVida := atalhoParagonVidaPadrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, AtalhoParagonVida, %AtalhoParagonVida%
    }

    RegRead, atalhoTrocaKadala, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTrocaKadala
    if atalhoTrocaKadala is space
    {
        atalhoTrocaKadala := atalhoTrocaKadalaPadrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTrocaKadala, %atalhoTrocaKadala%
    }

    RegRead, atalhoReciclaUM, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoReciclaUM
    if atalhoReciclaUM is space
    {
        atalhoReciclaUM := atalhoReciclaUMPadrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoReciclaUM, %atalhoReciclaUM%
    }

    RegRead, atalhoReciclaLinha, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoReciclaLinha
    if atalhoReciclaLinha is space
    {
        atalhoReciclaLinha := atalhoReciclaLinhaPadrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoReciclaLinha, %atalhoReciclaLinha%
    }

    RegRead, atalhoTransformaRaroLendarioHorizontal, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTransformaRaroLendarioHorizontal
    if atalhoTransformaRaroLendarioHorizontal is space
    {
        atalhoTransformaRaroLendarioHorizontal := atalhoTransformaRaroLendarioHorizontalPadrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTransformaRaroLendarioHorizontal, %atalhoTransformaRaroLendarioHorizontal%
    }

    RegRead, atalhoTransformaRaroLendarioVertical, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTransformaRaroLendarioVertical
    if atalhoTransformaRaroLendarioVertical is space
    {
        atalhoTransformaRaroLendarioVertical := atalhoTransformaRaroLendarioVerticalPadrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTransformaRaroLendarioVertical, %atalhoTransformaRaroLendarioVertical%
    }

    RegRead, atalhoHabilidadeAutomatica1, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoHabilidadeAutomatica1
    if atalhoHabilidadeAutomatica1 is space
    {
        atalhoHabilidadeAutomatica1 := atalhoHabilidadeAutomatica1Padrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoHabilidadeAutomatica1, %atalhoHabilidadeAutomatica1%
    }

    RegRead, atalhoTeleporte, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTeleporte
    if atalhoTeleporte is space
    {
        atalhoTeleporte := atalhoTeleportePadrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTeleporte, %atalhoTeleporte%
    }

    RegRead, atalhoMostraDistanciaDiablo, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoMostraDistanciaDiablo
    if atalhoMostraDistanciaDiablo is space
    {
        atalhoMostraDistanciaDiablo := atalhoMostraDistanciaDiabloPadrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoMostraDistanciaDiablo, %atalhoMostraDistanciaDiablo%
    }

    RegRead, atalhoMostraInfoAvancadas, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoMostraInfoAvancadas
    if atalhoMostraInfoAvancadas is space
    {
        atalhoMostraInfoAvancadas := atalhoMostraInfoAvancadasPadrao
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoMostraInfoAvancadas, %atalhoMostraInfoAvancadas%
    }

    loop, 4
    {
        RegRead, atalhoHabilidadeAutomatica%A_Index%, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoHabilidadeAutomatica%A_Index%
        if atalhoHabilidadeAutomatica%A_Index% is space
        {
            atalhoHabilidadeAutomatica%A_Index% := atalhoHabilidadeAutomatica%A_Index%Padrao
            valor := atalhoHabilidadeAutomatica%A_Index%
            RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoHabilidadeAutomatica%A_Index%, %valor%
        }
    }

    loop, 8
    {
        RegRead, atalhoPerfilAutomatico%A_Index%, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoPerfilAutomatico%A_Index%
        if atalhoPerfilAutomatico%A_Index% is space
        {
            atalhoPerfilAutomatico%A_Index% := atalhoPerfilAutomatico%A_Index%Padrao
            valor := atalhoPerfilAutomatico%A_Index%
            RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoPerfilAutomatico%A_Index%, %valor%
        }
    }

    loop, 4
    {
        RegRead, atalhoSequenciadorAutomatico%A_Index%, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoSequenciadorAutomatico%A_Index%
        if atalhoSequenciadorAutomatico%A_Index% is space
        {
            atalhoSequenciadorAutomatico%A_Index% := atalhoSequenciadorAutomatico%A_Index%Padrao
            valor := atalhoSequenciadorAutomatico%A_Index%
            RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoSequenciadorAutomatico%A_Index%, %valor%
        }
    }

;-----------------------------
    ;Parametros de Paragon Dano

    RegRead, stat1, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoAtributo
    if stat1 is not integer
    {
        stat1 := 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoAtributo, %stat1%
    }
    
    RegRead, vit1, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVitalidade
    if vit1 is not integer
    {
        vit1 := 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVitalidade, %vit1%
    }
    
    RegRead, speed1, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVelocidade
    if speed1 is not integer
    {
        speed1 := 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVelocidade, %speed1%
    }
    
    RegRead, resource1, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoRecurso
    if resource1 is not integer
    {
        resource1 := 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoRecurso, %resource1%
    }

;-----------------------------
    ;Parametros de Paragon Vida

    RegRead, stat2, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaAtributo
    if stat2 is not integer
    {
        stat2 := 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaAtributo, %stat2%
    }
    
    RegRead, vit2, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVitalidade
    if vit2 is not integer
    {
        vit2 := 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVitalidade, %vit2%
    }
    
    RegRead, speed2, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVelocidade
    if speed2 is not integer
    {
        speed2 := 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVelocidade, %speed2%
    }
    
    RegRead, resource2, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaRecurso
    if resource2 is not integer
    {
        resource2 := 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaRecurso, %resource2%
    }

;-----------------
    ;Perfil temporizado

    loop, 8
    {
        chaveRegistry := "HKEY_CURRENT_USER\Software\BD3Auto\PerfilTemporizado\Perfil" . A_Index
        RegRead, nome, %chaveRegistry%, Nome
        if nome is space
        {
            nome := "XXXXX"
            RegWrite, REG_SZ, %chaveRegistry%, Nome, %nome%
        }

        RegRead, tempo1, %chaveRegistry%, Habilidade1Tempo
        if tempo1 is not integer
        {
            tempo1 := 0
            RegWrite, REG_SZ, %chaveRegistry%, Habilidade1Tempo, %tempo1%
        }
        
        RegRead, tempo2, %chaveRegistry%, Habilidade2Tempo
        if tempo2 is not integer
        {
            tempo2 := 0
            RegWrite, REG_SZ, %chaveRegistry%, Habilidade2Tempo, %tempo2%
        }
        
        RegRead, tempo3, %chaveRegistry%, Habilidade3Tempo
        if tempo3 is not integer
        {
            tempo3 := 0
            RegWrite, REG_SZ, %chaveRegistry%, Habilidade3Tempo, %tempo3%
        }
        
        RegRead, tempo4, %chaveRegistry%, Habilidade4Tempo
        if tempo4 is not integer
        {
            tempo4 := 0
            RegWrite, REG_SZ, %chaveRegistry%, Habilidade4Tempo, %tempo4%
        }
        
        nomePerfil%A_Index% := nome
        habilidade1TempoPerfil%A_Index% := tempo1
        habilidade2TempoPerfil%A_Index% := tempo2
        habilidade3TempoPerfil%A_Index% := tempo3
        habilidade4TempoPerfil%A_Index% := tempo4
        
    }

;-----------------
    ;Perfil temporizado

    loop, 4
    {
        chaveRegistry := "HKEY_CURRENT_USER\Software\BD3Auto\SequenciadorAutomatico\Perfil" . A_Index
        RegRead, atalho, %chaveRegistry%, Atalho
        if atalho is space
        {
            atalho := ""
            RegWrite, REG_SZ, %chaveRegistry%, Atalho, %atalho%
        }

        RegRead, tecla1, %chaveRegistry%, Tecla1
        if tecla1 is space
        {
            tecla1 := ""
            RegWrite, REG_SZ, %chaveRegistry%, Tecla1, %tecla1%
        }

        RegRead, tecla1Tempo, %chaveRegistry%, Tecla1Tempo
        if tecla1Tempo is not integer
        {
            tecla1Tempo := 0
            RegWrite, REG_SZ, %chaveRegistry%, Tecla1Tempo, %tecla1Tempo%
        }

        RegRead, tecla2, %chaveRegistry%, Tecla2
        if tecla2 is space
        {
            tecla2 := ""
            RegWrite, REG_SZ, %chaveRegistry%, Tecla2, %tecla2%
        }

        RegRead, tecla2Tempo, %chaveRegistry%, Tecla2Tempo
        if tecla2Tempo is not integer
        {
            tecla2Tempo := 0
            RegWrite, REG_SZ, %chaveRegistry%, Tecla2Tempo, %tecla2Tempo%
        }
        
        RegRead, tecla3, %chaveRegistry%, Tecla3
        if tecla3 is space
        {
            tecla3 := ""
            RegWrite, REG_SZ, %chaveRegistry%, Tecla3, %tecla3%
        }

        RegRead, tecla3Tempo, %chaveRegistry%, Tecla3Tempo
        if tecla3Tempo is not integer
        {
            tecla3Tempo := 0
            RegWrite, REG_SZ, %chaveRegistry%, Tecla3Tempo, %tecla3Tempo%
        }

        RegRead, tecla4, %chaveRegistry%, Tecla4
        if tecla4 is space
        {
            tecla4 := ""
            RegWrite, REG_SZ, %chaveRegistry%, Tecla4, %tecla4%
        }

        RegRead, tecla4Tempo, %chaveRegistry%, Tecla4Tempo
        if tecla4Tempo is not integer
        {
            tecla4Tempo := 0
            RegWrite, REG_SZ, %chaveRegistry%, Tecla4Tempo, %tecla4Tempo%
        }

        sequenciadorAutomatico%A_Index%Atalho := atalho
        sequenciadorAutomatico%A_Index%Tecla1 := tecla1
        sequenciadorAutomatico%A_Index%Tecla1Tempo := tecla1Tempo
        sequenciadorAutomatico%A_Index%Tecla2 := tecla2
        sequenciadorAutomatico%A_Index%Tecla2Tempo := tecla2Tempo
        sequenciadorAutomatico%A_Index%Tecla3 := tecla3
        sequenciadorAutomatico%A_Index%Tecla3Tempo := tecla3Tempo
        sequenciadorAutomatico%A_Index%Tecla4 := tecla4
        sequenciadorAutomatico%A_Index%Tecla4Tempo := tecla4Tempo
    }

    return

}

gravaConfiguracao()
{

    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaPainelParagon, %latency1%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaClick, %latency2%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, AtalhoDiabloParagon, %atalhoDiabloParagon%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, QuantTrocaKadala, %quantTrocaKadala%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoX, %screenSizeRegX%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoY, %screenSizeRegY%

;----------------------------------
;configurações avançadas - atalhos

    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, atalhoParagonDano, %atalhoParagonDano%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, AtalhoParagonVida, %AtalhoParagonVida%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTrocaKadala, %atalhoTrocaKadala%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoReciclaUM, %atalhoReciclaUM%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoReciclaLinha, %atalhoReciclaLinha%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTransformaRaroLendarioHorizontal, %atalhoTransformaRaroLendarioHorizontal%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTransformaRaroLendarioVertical, %atalhoTransformaRaroLendarioVertical%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoHabilidadeAutomatica1, %atalhoHabilidadeAutomatica1%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoTeleporte, %atalhoTeleporte%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoMostraDistanciaDiablo, %atalhoMostraDistanciaDiablo%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoMostraInfoAvancadas, %atalhoMostraInfoAvancadas%
    
    loop, 4
    {
        valor := atalhoHabilidadeAutomatica%A_Index%
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoHabilidadeAutomatica%A_Index%, %valor%
    }

    loop, 8
    {
        valor := atalhoPerfilAutomatico%A_Index%
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoPerfilAutomatico%A_Index%, %valor%
    }

    loop, 4
    {
        valor := atalhoSequenciadorAutomatico%A_Index%
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Atalhos, AtalhoSequenciadorAutomatico%A_Index%, %valor%
    }

;-----------------------------
    ;Parametros de Paragon Dano
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoAtributo, %stat1%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVitalidade, %vit1%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVelocidade, %speed1%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoRecurso, %resource1%
    
;-----------------------------
    ;Parametros de Paragon Vida

    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaAtributo, %stat2%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVitalidade, %vit2%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVelocidade, %speed2%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaRecurso, %resource2%

;-----------------
    ;Perfil temporizado

    loop, 8
    {
        chaveRegistry2 := "HKEY_CURRENT_USER\Software\BD3Auto\PerfilTemporizado\Perfil" . A_Index
        nome := nomePerfil%A_Index%
        tempo1 := habilidade1TempoPerfil%A_Index%
        tempo2 := habilidade2TempoPerfil%A_Index%
        tempo3 := habilidade3TempoPerfil%A_Index%
        tempo4 := habilidade4TempoPerfil%A_Index%

        RegWrite, REG_SZ, %chaveRegistry2%, Nome, %nome%
        RegWrite, REG_SZ, %chaveRegistry2%, habilidade1Tempo, %tempo1%
        RegWrite, REG_SZ, %chaveRegistry2%, habilidade2Tempo, %tempo2%
        RegWrite, REG_SZ, %chaveRegistry2%, habilidade3Tempo, %tempo3%
        RegWrite, REG_SZ, %chaveRegistry2%, habilidade4Tempo, %tempo4%
    }

    loop, 4
    {
        chaveRegistry := "HKEY_CURRENT_USER\Software\BD3Auto\SequenciadorAutomatico\Perfil" . A_Index


        if (configAvancadas = 0)
        {
            sequenciadorAutomatico%A_Index%Atalho := SubStr(sequenciadorAutomatico%A_Index%Tecla1, 1, 1)
            sequenciadorAutomatico%A_Index%Tecla1 := SubStr(sequenciadorAutomatico%A_Index%Tecla1, 1, 1)
            sequenciadorAutomatico%A_Index%Tecla2 := SubStr(sequenciadorAutomatico%A_Index%Tecla2, 1, 1)
            sequenciadorAutomatico%A_Index%Tecla3 := SubStr(sequenciadorAutomatico%A_Index%Tecla3, 1, 1)
            sequenciadorAutomatico%A_Index%Tecla4 := SubStr(sequenciadorAutomatico%A_Index%Tecla4, 1, 1)
        }

        atalho := sequenciadorAutomatico%A_Index%Atalho

        tecla1 := sequenciadorAutomatico%A_Index%Tecla1
        tecla2 := sequenciadorAutomatico%A_Index%Tecla2
        tecla3 := sequenciadorAutomatico%A_Index%Tecla3
        tecla4 := sequenciadorAutomatico%A_Index%Tecla4

        if sequenciadorAutomatico%A_Index%Tecla1Tempo is not integer
        {
            sequenciadorAutomatico%A_Index%Tecla1Tempo := 0
        }
        tecla1Tempo := sequenciadorAutomatico%A_Index%Tecla1Tempo
        

        if sequenciadorAutomatico%A_Index%Tecla2Tempo is not integer
        {
            sequenciadorAutomatico%A_Index%Tecla2Tempo := 0
        }
        tecla2Tempo := sequenciadorAutomatico%A_Index%Tecla2Tempo
        

        if sequenciadorAutomatico%A_Index%Tecla3Tempo is not integer
        {
            sequenciadorAutomatico%A_Index%Tecla3Tempo := 0
        }
        tecla3Tempo := sequenciadorAutomatico%A_Index%Tecla3Tempo
        

        if sequenciadorAutomatico%A_Index%Tecla4Tempo is not integer
        {
            sequenciadorAutomatico%A_Index%Tecla4Tempo := 0
        }
        tecla4Tempo := sequenciadorAutomatico%A_Index%Tecla4Tempo

        RegWrite, REG_SZ, %chaveRegistry%, Atalho, %atalho%
        RegWrite, REG_SZ, %chaveRegistry%, Tecla1, %tecla1%
        RegWrite, REG_SZ, %chaveRegistry%, Tecla1Tempo, %tecla1Tempo%
        RegWrite, REG_SZ, %chaveRegistry%, Tecla2, %tecla2%
        RegWrite, REG_SZ, %chaveRegistry%, Tecla2Tempo, %tecla2Tempo%
        RegWrite, REG_SZ, %chaveRegistry%, Tecla3, %tecla3%
        RegWrite, REG_SZ, %chaveRegistry%, Tecla3Tempo, %tecla3Tempo%
        RegWrite, REG_SZ, %chaveRegistry%, Tecla4, %tecla4%
        RegWrite, REG_SZ, %chaveRegistry%, Tecla4Tempo, %tecla4Tempo%
    }

    if (sequenciadorAutomatico1AtalhoAntes <> sequenciadorAutomatico1Atalho or sequenciadorAutomatico2AtalhoAntes <> sequenciadorAutomatico2Atalho or sequenciadorAutomatico3AtalhoAntes <> sequenciadorAutomatico3Atalho or sequenciadorAutomatico4AtalhoAntes <> sequenciadorAutomatico4Atalho)
    {
        recarregar()
    }

    return
}

migraConfigVelha()
{

    RegRead, latency1, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 01_LatenciaPainelParagon
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaPainelParagon, %latency1%
    
    RegRead, latency2, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 02_LatenciaClick
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaClick, %latency2%

    RegRead, atalhoDiabloParagon, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 03_AtalhoDiabloParagon
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, AtalhoDiabloParagon, %atalhoDiabloParagon%

    RegRead, quantTrocaKadala, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 04_QuantTrocaKadala
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, QuantTrocaKadala, %quantTrocaKadala%

    RegRead, screenSizeRegX, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 05_ResolucaoX
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoX, %screenSizeRegX%

    RegRead, screenSizeRegY, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 06_ResolucaoY
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoY, %screenSizeRegY%

;-----------------------------
    ;Parametros de Paragon Dano
    RegRead, stat1, HKEY_CURRENT_USER\Software\DiabloAuto\03_ParagonDano, 01_ParagonDanoAtributo
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoAtributo, %stat1%
    
    RegRead, vit1, HKEY_CURRENT_USER\Software\DiabloAuto\03_ParagonDano, 02_ParagonDanoVitalidade
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVitalidade, %vit1%

    RegRead, speed1, HKEY_CURRENT_USER\Software\DiabloAuto\03_ParagonDano, 03_ParagonDanoVelocidade
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVelocidade, %speed1%
    
    RegRead, resource1, HKEY_CURRENT_USER\Software\DiabloAuto\03_ParagonDano, 04_ParagonDanoRecurso
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoRecurso, %resource1%
    
;-----------------------------
    ;Parametros de Paragon Vida
    
    RegRead, stat2, HKEY_CURRENT_USER\Software\DiabloAuto\04_ParagonVida, 01_ParagonVidaAtributo
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaAtributo, %stat2%
    
    RegRead, vit2, HKEY_CURRENT_USER\Software\DiabloAuto\04_ParagonVida, 02_ParagonVidaVitalidade
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVitalidade, %vit2%

    RegRead, speed2, HKEY_CURRENT_USER\Software\DiabloAuto\04_ParagonVida, 03_ParagonVidaVelocidade
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVelocidade, %speed2%
    
    RegRead, resource2, HKEY_CURRENT_USER\Software\DiabloAuto\04_ParagonVida, 04_ParagonVidaRecurso
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaRecurso, %resource2%

;-----------------
    ;Perfil temporizado

    loop, 8
    {
        chaveRegistry1 := "HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil" . A_Index
        chaveRegistry2 := "HKEY_CURRENT_USER\Software\BD3Auto\PerfilTemporizado\Perfil" . A_Index
        RegRead, nome, %chaveRegistry1%, 00_Nome
        RegWrite, REG_SZ, %chaveRegistry2%, Nome, %nome%

        RegRead, tempo1, %chaveRegistry1%, 01_Habilidade1Tempo
        RegWrite, REG_SZ, %chaveRegistry2%, Habilidade1Tempo, %tempo1%
        
        RegRead, tempo2, %chaveRegistry1%, 02_Habilidade2Tempo
        RegWrite, REG_SZ, %chaveRegistry2%, Habilidade2Tempo, %tempo2%
        
        RegRead, tempo3, %chaveRegistry1%, 03_Habilidade3Tempo
        RegWrite, REG_SZ, %chaveRegistry2%, Habilidade3Tempo, %tempo3%
        
        RegRead, tempo4, %chaveRegistry1%, 04_Habilidade4Tempo
        RegWrite, REG_SZ, %chaveRegistry2%, Habilidade4Tempo, %tempo4%
    }

    run reg delete HKCU\Software\DiabloAuto /f

    return

}

criaJanelaConfiguracaoAvancada()
{
    Gui, ConfiguracoesAvancada: New,, Configurações Avançadas
    Gui, ConfiguracoesAvancada: Default
        
    ;Gui Add, Tab3, x10 y10 w500 h380, Advertências||Teclas de Atalho|Atalho Auto Avançado|Configurações do desenvolvedor
    Gui Add, Tab3, x10 y10 w500 h350, Advertências|Teclas de Atalho||Atalho Auto Avançado|Configurações do desenvolvedor

    Gui, Tab, 1
    Gui, Font, s13
    Gui, Add, Text, x30 y120, *** Mexa com cuidado nestas configurações ***
    Gui, Add, Text, x30 y180, *** Após alterações de atalho, recarregue o script ***
    Gui, Font

    linha := 50
    coluna := 30
    incrementoLinha := 21

    Gui, Tab, 2
    Gui, Add, Text, x%coluna% y%linha%, Paragon Vida:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Paragon Dano:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Troca Kadala:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Recicla Um:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Recicla Linha:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Teleporte:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Mostra Distancia:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Inf. Avancadas:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Transf. Lendario (H):
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Transf. Lendario (V):
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Auto Cast 1:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Auto Cast 2:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Auto Cast 3:
    linha := linha + incrementoLinha
    Gui, Add, Text, x%coluna% y%linha%, Auto Cast 4:
    linha := linha + incrementoLinha

    ;Gui, Add, Edit, x210 y105 w60 h21 vlatency1, %latency1%  ; The ym option starts a new column of controls.
    ;Gui, Add, Edit, w60 h21 vlatency2, %latency2%
    ;Gui, Add, Edit, w60 h21 vatalhoDiabloParagon, %atalhoDiabloParagon% ; The ym option starts a new column of controls.
    ;Gui, Add, Edit, w60 h21 vquantTrocaKadala, %quantTrocaKadala%
    ;Gui, Add, Edit, w60 h21 vscreenSizeRegX, %screenSizeRegX% ; The ym option starts a new column of controls.
    ;Gui, Add, Edit, w60 h21 vscreenSizeRegY, %screenSizeRegY%
;    Gui, Add, Text, x245 y150, (*) para configurar:
;    Gui, Add, Text, x245 y170, ^ = Control
;    Gui, Add, Text, x245 y185, + = Shift
;    Gui, Add, Text, x245 y200, ^+v = control+shift+v
;    Gui, Add, Text, x245 y215, Necessário reload

;global atalhoPerfilAutomatico1
;global atalhoPerfilAutomatico2
;global atalhoPerfilAutomatico3
;global atalhoPerfilAutomatico4
;global atalhoPerfilAutomatico5
;global atalhoPerfilAutomatico6
;global atalhoPerfilAutomatico7
;global atalhoPerfilAutomatico8
;global atalhoSequenciadorAutomatico1
;global atalhoSequenciadorAutomatico2
;global atalhoSequenciadorAutomatico3
;global atalhoSequenciadorAutomatico4


    Gui, Tab, 3
    Gui, Add, Text, x20 y80, Atalho
    Gui, Add, Text, x80 y80, Tecla1
    Gui, Add, Text, x145 y80, Tecla2
    Gui, Add, Text, x210 y80, Tecla3
    Gui, Add, Text, x275 y80, Tecla4
    linha := 100
    
    loop, 4
    {
        atalho := sequenciadorAutomatico%A_Index%Atalho
        tecla1 := sequenciadorAutomatico%A_Index%Tecla1
        tecla1Tempo := sequenciadorAutomatico%A_Index%Tecla1Tempo
        tecla2 := sequenciadorAutomatico%A_Index%Tecla2
        tecla2Tempo := sequenciadorAutomatico%A_Index%Tecla2Tempo
        tecla3 := sequenciadorAutomatico%A_Index%Tecla3
        tecla3Tempo := sequenciadorAutomatico%A_Index%Tecla3Tempo
        tecla4 := sequenciadorAutomatico%A_Index%Tecla4
        tecla4Tempo := sequenciadorAutomatico%A_Index%Tecla4Tempo
        

        Gui, Add, Edit, x20 y%linha% w50 h21 vsequenciadorAutomatico%A_Index%Atalho, %atalho%
        Gui, Add, Edit, x80 y%linha% w60 h21 vsequenciadorAutomatico%A_Index%Tecla1, %tecla1%
        Gui, Add, Edit, x145 y%linha% w60 h21 vsequenciadorAutomatico%A_Index%Tecla2, %tecla2%
        Gui, Add, Edit, x210 y%linha% w60 h21 vsequenciadorAutomatico%A_Index%Tecla3, %tecla3%
        Gui, Add, Edit, x275 y%linha% w60 h21 vsequenciadorAutomatico%A_Index%Tecla4, %tecla4%
        
        linha := linha + 21
        Gui, Add, Edit, x80 y%linha% w60 h21 vsequenciadorAutomatico%A_Index%Tecla1Tempo, %tecla1Tempo%
        Gui, Add, Edit, x145 y%linha% w60 h21 vsequenciadorAutomatico%A_Index%Tecla2Tempo, %tecla2Tempo%
        Gui, Add, Edit, x210 y%linha% w60 h21 vsequenciadorAutomatico%A_Index%Tecla3Tempo, %tecla3Tempo%
        Gui, Add, Edit, x275 y%linha% w60 h21 vsequenciadorAutomatico%A_Index%Tecla4Tempo, %tecla4Tempo%
        linha := linha + 25

    }
    
    Gui, Tab, 4
    Gui, Add, Text, x40 y100, Atalho
    Gui, Add, Text, x110 y100, Tecla1
    Gui, Add, Text, x170 y100, Tecla2
    Gui, Add, Text, x230 y100, Tecla3
    Gui, Add, Text, x290 y100, Tecla4

    Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.

    Gui, Add, Button, x467 y370 default gbotaoSalvarConfigAvancada, Salvar ; The label ButtonOK (if it exists) will be run when the button is pressed.
    
    return
    
}

botaoSalvarConfigAvancada()
{
    Gui, Submit
    return
}

criaJanelaConfiguracao()
{
    Gui, Configuracoes: New,, Configurações
    Gui, Configuracoes: Default
        
    Gui Add, Tab3, x10 y10 w350 h280, Ajuda||Configurações|Paragon|Atalho Auto|Perfil Auto 1|Perfil Auto 2|Perfil Auto 3|Perfil Auto 4|Perfil Auto 5|Perfil Auto 6|Perfil Auto 7|Perfil Auto 8

    Gui, Tab, 1
    Gui, Add, Text, x30 y90, Control+Shift+C (Configuração)  /  Control+Shift+R (Reload)
    Gui, Add, Text, x30 y110, F5 (Troca Itens Kadala)  /  F6 (Recicla Item)
    Gui, Add, Text, x30 y130, F11 (Transforma Raro Lendário (direta para esquerda)) 
    Gui, Add, Text, x30 y150, Control+F11 (Transforma Raro Lendário (baixo para cima))
    Gui, Add, Text, x30 y170, F1, F2, F3, F4 (Auto cast habilidades)
    Gui, Add, Text, x30 y190, Control+F1 a Control+F4 (Perfil Auto 1 a 4) 
    Gui, Add, Text, x30 y210, Control+Shift+F1 a Control+Shift+F4 (Perfil Auto 5 a 8) 
    Gui, Add, Text, x30 y230, Control+F5 a Control+F8 (Atalho Automatizado 1 a 4) 
    Gui, Add, Text, x30 y250, Control+Shift+D - Distância em Metros

    Gui, Tab, 2
    Gui, Add, Text, x60 y105, Latência Paragon:
    Gui, Add, Text,, Latência:
    Gui, Add, Text,, Atalho Paragon:
    Gui, Add, Text,, Troca Kadala (Quantidade):
    Gui, Add, Text,, ResoluçãoX:
    Gui, Add, Text,, ResoluçãoY:
    Gui, Add, Edit, x210 y105 w60 h21 vlatency1, %latency1%  
    Gui, Add, Edit, w60 h21 vlatency2, %latency2%
    Gui, Add, Edit, w60 h21 vatalhoDiabloParagon, %atalhoDiabloParagon% 
    Gui, Add, Edit, w60 h21 vquantTrocaKadala, %quantTrocaKadala%
    Gui, Add, Edit, w60 h21 vscreenSizeRegX, %screenSizeRegX% 
    Gui, Add, Edit, w60 h21 vscreenSizeRegY, %screenSizeRegY%

    Gui, Tab, 3
    Gui, Add, Text, x70 y100, Vida
    Gui, Add, Text, x40 y130, Atalho:
    Gui, Add, Text,, Atributo:
    Gui, Add, Text,, Vitalidade:
    Gui, Add, Text,, Velocidade:
    Gui, Add, Text,, Recurso:
    Gui, Add, Text, x100 y130 w40 h21, %atalhoParagonVida%  
    Gui, Add, Edit, w40 h21 vstat2, %stat2%  
    Gui, Add, Edit, w40 h21 vvit2, %vit2%
    Gui, Add, Edit, w40 h21 vspeed2, %speed2% 
    Gui, Add, Edit, w40 h21 vresource2, %resource2%
    Gui, Add, Text, x220 y100, Dano
    Gui, Add, Text, x190 y130, Atalho:
    Gui, Add, Text,, Atributo:
    Gui, Add, Text,, Vitalidade:
    Gui, Add, Text,, Velocidade:
    Gui, Add, Text,, Recurso:
    Gui, Add, Text, x250 y130 w40 h21, %atalhoParagonDano%  
    Gui, Add, Edit, w40 h21 vstat1, %stat1%  
    Gui, Add, Edit, w40 h21 vvit1, %vit1%
    Gui, Add, Edit, w40 h21 vspeed1, %speed1%
    Gui, Add, Edit, w40 h21 vresource1, %resource1%

    Gui, Tab, 4
    
    if (configAvancadas = 0)
    {
        Gui, Add, Text, x40 y100, Atalho
        Gui, Add, Text, x110 y100, Tecla1
        Gui, Add, Text, x170 y100, Tecla2
        Gui, Add, Text, x230 y100, Tecla3
        Gui, Add, Text, x290 y100, Tecla4
        linha := 130

        loop, 4
        {
            atalho := sequenciadorAutomatico%A_Index%Atalho
            tecla1 := sequenciadorAutomatico%A_Index%Tecla1
            tecla2 := sequenciadorAutomatico%A_Index%Tecla2
            tecla3 := sequenciadorAutomatico%A_Index%Tecla3
            tecla4 := sequenciadorAutomatico%A_Index%Tecla4
            
            Gui, Add, Edit, x40 y%linha% w40 h21 vsequenciadorAutomatico%A_Index%Atalho, %atalho%
            Gui, Add, Edit, x110 y%linha% w40 h21 vsequenciadorAutomatico%A_Index%Tecla1, %tecla1%
            Gui, Add, Edit, x170 y%linha% w40 h21 vsequenciadorAutomatico%A_Index%Tecla2, %tecla2%
            Gui, Add, Edit, x230 y%linha% w40 h21 vsequenciadorAutomatico%A_Index%Tecla3, %tecla3%
            Gui, Add, Edit, x290 y%linha% w40 h21 vsequenciadorAutomatico%A_Index%Tecla4, %tecla4%
            linha := linha + 30
        }
    }
    else
    {
        Gui, Font, s13
        Gui, Add, Text, x30 y100, *** Configure nas opções avançadas ***
        Gui, Font
    }
    
    loop, 8
    {
        ntab := 4 + A_Index
        nome := nomePerfil%A_Index%
        habilidade1 := habilidade1TempoPerfil%A_Index%
        habilidade2 := habilidade2TempoPerfil%A_Index%
        habilidade3 := habilidade3TempoPerfil%A_Index%
        habilidade4 := habilidade4TempoPerfil%A_Index%
        
        Gui, Tab, %ntab%
        Gui, Add, Text, x50 y110, Nome:
        Gui, Add, Text,, Tempo Habilidade 1:
        Gui, Add, Text,, Tempo Habilidade 2:
        Gui, Add, Text,, Tempo Habilidade 3:
        Gui, Add, Text,, Tempo Habilidade 4:
        Gui, Add, Edit, x170 y110 w150 h21 vnomePerfil%A_Index%, %nome%
        Gui, Add, Edit, w50 h21 vhabilidade1TempoPerfil%A_Index%, %habilidade1%
        Gui, Add, Edit, w50 h21 vhabilidade2TempoPerfil%A_Index%, %habilidade2%
        Gui, Add, Edit, w50 h21 vhabilidade3TempoPerfil%A_Index%, %habilidade3% 
        Gui, Add, Edit, w50 h21 vhabilidade4TempoPerfil%A_Index%, %habilidade4%
    }

    Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.

    Gui, Add, Button, x317 y300 default gbotaoSalvarConfig, Salvar ; The label ButtonOK (if it exists) will be run when the button is pressed.

    if (configAvancadas = 1)
    {
        Gui, Add, Button, x10 y300 gbotaoAbreConfigAvancada, ConfigAvancada ; The label ButtonOK (if it exists) will be run when the button is pressed.
    }
    
    return
}

botaoSalvarConfig()
{

    if telaAtiva = 2
    {

        Gui, Configuracoes: Submit  ; Save each control's contents to its associated variable.
        gravaConfiguracao()
        
        Gui, ConfiguracoesAvancada:Destroy
        Gui, Configuracoes:Destroy
        
        if InfoAvancadasAtivo = 1
        {
            criaInfoAvancadas()
            SetTimer, atualizaInfoAvancadas, 500
            Gui, Show, x0 y50 NoActivate  ; NoActivate avoids deactivating the currently active window.
            telaAtiva := 1
        }
        else
        {
            telaAtiva := 0
        }
        
    }
    return
}

botaoAbreConfigAvancada()
{
    abreJanelaConfiguracaoAvancada()
    return
}

abreJanelaConfiguracao()
{
    
    if InfoAvancadasAtivo = 1
    {
        ;Gui, InfoAvancadas:Default
        SetTimer, atualizaInfoAvancadas, off
        Gui, InfoAvancadas:Destroy
    }

    sequenciadorAutomatico1AtalhoAntes := sequenciadorAutomatico1Atalho
    sequenciadorAutomatico2AtalhoAntes := sequenciadorAutomatico2Atalho
    sequenciadorAutomatico3AtalhoAntes := sequenciadorAutomatico3Atalho
    sequenciadorAutomatico4AtalhoAntes := sequenciadorAutomatico4Atalho

    criaJanelaConfiguracao()

    telaAtiva := 2

    Gui, Show,, Configurações
    
    return
    
}

abreJanelaConfiguracaoAvancada()
{
    criaJanelaConfiguracaoAvancada()
    Gui, ConfiguracoesAvancada: Show
    return
}

mostraInfoAvancadas()
{
    Gui, InfoAvancadas:Destroy

    if InfoAvancadasAtivo = -1
    {
        telaAtiva := 1
        criaInfoAvancadas()
        SetTimer, atualizaInfoAvancadas, 500
        Gui, Show, x0 y50 NoActivate  ; NoActivate avoids deactivating the currently active window.
    }
    else
    {
        telaAtiva := 0
        SetTimer, atualizaInfoAvancadas, off
    }
    InfoAvancadasAtivo := InfoAvancadasAtivo * -1
    
    return
    
}

criaInfoAvancadas()
{
    Gui, InfoAvancadas: New
    CustomColor := EEAA99  ; Can be any RGB color (it will be made transparent below).
    Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
    Gui, Color, %CustomColor%
    Gui, Font, s32  ; Set a large font size (32-point).
    Gui, Add, Text, vMyText cLime, xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  ; XX & YY serve to auto-size the window.
    ; Make all pixels of this color transparent and make the text itself translucent (150):
    WinSet, TransColor, %CustomColor% 150

    return
}

retornaInfoTela()
{

    WinGet, active_id, ID, A
    WinMaximize, ahk_id %active_id%
    MsgBox, The active window's ID is "%active_id%".

    ; Example #2: This will visit all windows on the entire system and display info about each of them:
    WinGet, id, list,,, Program Manager
    Loop, %id%
    {
        this_id := id%A_Index%
        WinActivate, ahk_id %this_id%
        WinGetClass, this_class, ahk_id %this_id%
        WinGetTitle, this_title, ahk_id %this_id%
        MsgBox, 4, , Visiting All Windows`n%A_Index% of %id%`nahk_id %this_id%`nahk_class %this_class%`n%this_title%`n`nContinue?
        IfMsgBox, NO, break
    }

    ; Example #3: Extract the individual control names from a ControlList:
    WinGet, ActiveControlList, ControlList, A
    Loop, Parse, ActiveControlList, `n
    {
        MsgBox, 4,, Control #%A_Index% is "%A_LoopField%". Continue?
        IfMsgBox, No
            break
    }

    ; Example #4: Display in real time the active window's control list:
    #Persistent
    SetTimer, WatchActiveWindow, 200
    return
    WatchActiveWindow:
    WinGet, ControlList, ControlList, A
    ToolTip, %ControlList%
    return    
}