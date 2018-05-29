#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

global screenSizeX
global screenSizeY

global latency1
global latency2
global activateKeyParagon
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

Global habilitadeAutomatica1Estado, habilitadeAutomatica1Estado := 1
Global habilitadeAutomatica2Estado, habilitadeAutomatica2Estado := 1
Global habilitadeAutomatica3Estado, habilitadeAutomatica3Estado := 1
Global habilitadeAutomatica4Estado, habilitadeAutomatica4Estado := 1

Global NomePerfil, NomePerfil := Array("","","","","","","","") 
Global Habilidade1TempoPerfil, Habilidade1TempoPerfil := Array(0,0,0,0,0,0,0,0)
Global Habilidade2TempoPerfil, Habilidade2TempoPerfil := Array(0,0,0,0,0,0,0,0)
Global Habilidade3TempoPerfil, Habilidade3TempoPerfil := Array(0,0,0,0,0,0,0,0)
Global Habilidade4TempoPerfil, Habilidade4TempoPerfil := Array(0,0,0,0,0,0,0,0)

Global NomePerfil1
Global Habilidade1TempoPerfil1
Global Habilidade2TempoPerfil1
Global Habilidade3TempoPerfil1
Global Habilidade4TempoPerfil1
Global NomePerfil2
Global Habilidade1TempoPerfil2
Global Habilidade2TempoPerfil2
Global Habilidade3TempoPerfil2
Global Habilidade4TempoPerfil2
Global NomePerfil3
Global Habilidade1TempoPerfil3
Global Habilidade2TempoPerfil3
Global Habilidade3TempoPerfil3
Global Habilidade4TempoPerfil3
Global NomePerfil4
Global Habilidade1TempoPerfil4
Global Habilidade2TempoPerfil4
Global Habilidade3TempoPerfil4
Global Habilidade4TempoPerfil4
Global NomePerfil5
Global Habilidade1TempoPerfil5
Global Habilidade2TempoPerfil5
Global Habilidade3TempoPerfil5
Global Habilidade4TempoPerfil5
Global NomePerfil6
Global Habilidade1TempoPerfil6
Global Habilidade2TempoPerfil6
Global Habilidade3TempoPerfil6
Global Habilidade4TempoPerfil6
Global NomePerfil7
Global Habilidade1TempoPerfil7
Global Habilidade2TempoPerfil7
Global Habilidade3TempoPerfil7
Global Habilidade4TempoPerfil7
Global NomePerfil8
Global Habilidade1TempoPerfil8
Global Habilidade2TempoPerfil8
Global Habilidade3TempoPerfil8
Global Habilidade4TempoPerfil8

Global perfilAutomaticoEstado, perfilAutomaticoEstado := 1
Global perfilAutomaticoCarregado, perfilAutomaticoCarregado := 1

Global forcarMovimentoEstado, forcarMovimentoEstado := 1

Global trocaWheelUpDownNecroEstado, trocaWheelUpDownNecroEstado := 1

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

Global novaPosicaoX
Global novaPosicaoY

Global transformaRaroLendarioPosicao ; 0 = horizontal; 1 = vertical
Global transformaRaroLendarioSituacao, transformaRaroLendarioSituacao := 1 ; 1 = liga, -1 = desliga

CoordMode, Mouse, Window

Thread, NoTimers

carregaConfiguracao()

criaJanelaConfiguracao()

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

Hotkey, IfWinActive, Diablo III
Hotkey, F8, trocaParagonDamage ; starts damage script
Hotkey, F7, trocaParagonHealth ; starts health script1
Hotkey, F5, kadala
Hotkey, F6, reciclaUM
Hotkey, ^F6, reciclaLinha
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
;Hotkey, #F12, forcarMovimento
Hotkey, F12, posicao
Hotkey, ^F12, validaCor
Hotkey, +F12, trocaWheelUpDownNecro
Hotkey, ^+F12, verificaDistancia
Hotkey, ^t, teleporte

recarregar()
{
    Reload
    Return
}

perfilAutomatico1()
{
    perfilAutomatico(1)
}
perfilAutomatico2()
{
    perfilAutomatico(2)
}
perfilAutomatico3()
{
    perfilAutomatico(3)
}
perfilAutomatico4()
{
    perfilAutomatico(4)
}
perfilAutomatico5()
{
    perfilAutomatico(5)
}
perfilAutomatico6()
{
    perfilAutomatico(6)
}
perfilAutomatico7()
{
    perfilAutomatico(7)
}
perfilAutomatico8()
{
    perfilAutomatico(8)
}

trocaParagonDamage() ; script to change paragon for dealing damage
{

    Critical

    validaResolucao()
    
    MouseGetPos, mouseX, mouseY

    SendInput %activateKeyParagon%

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

trocaParagonHealth() ; script to change paragon for staying alive
{
    Critical
    
    validaResolucao()
    
    MouseGetPos, mouseX, mouseY

    SendInput %activateKeyParagon%

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


kadala() ; 
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
	
    if habilitadeAutomatica1Estado = 1
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
	
    if habilitadeAutomatica2Estado = 1
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
	
    if habilitadeAutomatica3Estado = 1
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
	
    if habilitadeAutomatica4Estado = 1
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
	
    if forcarMovimentoEstado = 1
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

    if transformaRaroLendarioSituacao = 1
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
        transformaRaroLendarioSituacao := 1
    }
    else
    {
        MouseMove, novaPosicaoX, novaPosicaoY
    }

    return
}

posicao()  
{

    arquivoSaida = pontos.txt

    MouseGetPos, mouseX, mouseY
    
    PixelGetColor cor, %mouseX%, %mouseY%, RGB

	FileAppend, %mouseX%;%mouseY%;%cor%`n, %arquivoSaida%

    return

}

perfilAutomatico(perfilAcionado)
{
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
        tempo1 := Habilidade1TempoPerfil[perfilAutomaticoCarregado]
        tempo2 := Habilidade2TempoPerfil[perfilAutomaticoCarregado]
        tempo3 := Habilidade3TempoPerfil[perfilAutomaticoCarregado]
        tempo4 := Habilidade4TempoPerfil[perfilAutomaticoCarregado]

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
    
    perfilAutomaticoEstado := perfilAutomaticoEstado * -1
    
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
}

verificaDistancia()
{
    MouseGetPos, mouseX, mouseY

    lateral1 := posicaoCentralX - mouseX
    lateral2 := posicaoCentralY - mouseY

    if lateral1 < 0 and lateral2 >= 0 ; quadrante A
    {
        relacaoPixelMetro := 11.08108
    }
    else if lateral1 < 0 and lateral2 < 0 ; quadrante B
    {
        relacaoPixelMetro := 15.72972
    }
    else if lateral1 >= 0 and lateral2 < 0 ; quadrante C
    {
        relacaoPixelMetro := 15.72972
    }
    else  ; quadrante D
    {
        relacaoPixelMetro := 11.08108
    }

    if lateral1 < 0 
        lateral1 := lateral1 * -1

    if lateral2 < 0 
        lateral2 := lateral2 * -1

    distancia := Sqrt((lateral1**2)+(lateral2**2))
    
    distancia := Round((distancia / relacaoPixelMetro), 2)

    SendInput, {Enter} ;menu do jogo
    SendInput, %distancia% ;menu do jogo
    SendInput, {Enter} ;menu do jogo


    ;MouseMove, posicaoCentralX, posicaoCentralY
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

    if trocaWheelUpDownNecroEstado = 1
    {
        SetMouseDelay, 10
        MouseClick, Left, menuJogoHabilidade4Tecla1X, menuJogoHabilidade4Tecla1Y ; habilidade 3 - tecla 1
        SendInput, {WheelUp} ;menu do jogo

        SetMouseDelay, 10
        MouseClick, Left, menuJogoHabilidade4Tecla2X, menuJogoHabilidade4Tecla2Y ; habilidade 3 - tecla 2
        SendInput, {WheelDown} ;menu do jogo
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
    arquivoSaida = pontos.txt

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

    screenXReferencia = 1920
    screenYReferencia = 1080

    screenXRazao := screenSizeX / screenXReferencia 
    screenYRazao := screenSizeY / screenYReferencia
    
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
    RegRead, latency1, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaPainelParagon
    if latency1 is not integer
    {
        latency1 = 100
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaPainelParagon, %latency1%
    }
    
    RegRead, latency2, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaClick
    if latency2 is not integer
    {
        latency2 = 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaClick, %latency2%
    }
    
    RegRead, activateKeyParagon, HKEY_CURRENT_USER\Software\BD3Auto\Config, AtalhoDiabloParagon
    if activateKeyParagon is space
    {
        activateKeyParagon := "p"
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, AtalhoDiabloParagon, %activateKeyParagon%
    }

    RegRead, quantTrocaKadala, HKEY_CURRENT_USER\Software\BD3Auto\Config, QuantTrocaKadala
    if quantTrocaKadala is not integer
    {
        quantTrocaKadala = 30
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, QuantTrocaKadala, %quantTrocaKadala%
    }

    RegRead, screenSizeRegX, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoX
    if screenSizeRegX is not integer
    {
        screenSizeRegX = 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoX, %screenSizeRegX%
    }

    RegRead, screenSizeRegY, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoY
        if screenSizeRegY is not integer
    {
        screenSizeRegY = 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoY, %screenSizeRegY%
    }

;-----------------------------
    ;Parametros de Paragon Dano
    RegRead, stat1, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoAtributo
    if stat1 is not integer
    {
        stat1 = 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoAtributo, %stat1%
    }
    
    RegRead, vit1, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVitalidade
    if vit1 is not integer
    {
        vit1 = 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVitalidade, %vit1%
    }
    
    RegRead, speed1, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVelocidade
    if speed1 is not integer
    {
        speed1 = 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoVelocidade, %speed1%
    }
    
    RegRead, resource1, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoRecurso
    if resource1 is not integer
    {
        resource1 = 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonDano, ParagonDanoRecurso, %resource1%
    }

;-----------------------------
    ;Parametros de Paragon Vida
    
    RegRead, stat2, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaAtributo
    if stat2 is not integer
    {
        stat2 = 0
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaAtributo, %stat2%
    }
    
    RegRead, vit2, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVitalidade
    if vit2 is not integer
    {
        vit2 = 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVitalidade, %vit2%
    }
    
    RegRead, speed2, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVelocidade
    if speed2 is not integer
    {
        speed2 = 1
        RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaVelocidade, %speed2%
    }
    
    RegRead, resource2, HKEY_CURRENT_USER\Software\BD3Auto\ParagonVida, ParagonVidaRecurso
    if resource2 is not integer
    {
        resource2 = 1
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
            nome = "XXXXX"
            RegWrite, REG_SZ, %chaveRegistry%, Nome, %nome%
        }

        RegRead, tempo1, %chaveRegistry%, Habilidade1Tempo
        if tempo1 is not integer
        {
            tempo1 = 0
            RegWrite, REG_SZ, %chaveRegistry%, Habilidade1Tempo, %tempo1%
        }
        
        RegRead, tempo2, %chaveRegistry%, Habilidade2Tempo
        if tempo2 is not integer
        {
            tempo2 = 0
            RegWrite, REG_SZ, %chaveRegistry%, Habilidade2Tempo, %tempo2%
        }
        
        RegRead, tempo3, %chaveRegistry%, Habilidade3Tempo
        if tempo3 is not integer
        {
            tempo3 = 0
            RegWrite, REG_SZ, %chaveRegistry%, Habilidade3Tempo, %tempo3%
        }
        
        RegRead, tempo4, %chaveRegistry%, Habilidade4Tempo
        if tempo4 is not integer
        {
            tempo4 = 0
            RegWrite, REG_SZ, %chaveRegistry%, Habilidade4Tempo, %tempo4%
        }
        
        NomePerfil[A_Index] := nome
        Habilidade1TempoPerfil[A_Index] := tempo1
        Habilidade2TempoPerfil[A_Index] := tempo2
        Habilidade3TempoPerfil[A_Index] := tempo3
        Habilidade4TempoPerfil[A_Index] := tempo4
        
    }

    return

}

gravaConfiguracao()
{

    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaPainelParagon, %latency1%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaClick, %latency2%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, AtalhoDiabloParagon, %activateKeyParagon%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, QuantTrocaKadala, %quantTrocaKadala%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoX, %screenSizeRegX%
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, ResolucaoY, %screenSizeRegY%

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
        nome := NomePerfil[A_Index]
        tempo1 := Habilidade1TempoPerfil[A_Index]
        tempo2 := Habilidade2TempoPerfil[A_Index]
        tempo3 := Habilidade3TempoPerfil[A_Index]
        tempo4 := Habilidade4TempoPerfil[A_Index]

        RegWrite, REG_SZ, %chaveRegistry2%, Nome, %nome%
        RegWrite, REG_SZ, %chaveRegistry2%, Habilidade1Tempo, %tempo1%
        RegWrite, REG_SZ, %chaveRegistry2%, Habilidade2Tempo, %tempo2%
        RegWrite, REG_SZ, %chaveRegistry2%, Habilidade3Tempo, %tempo3%
        RegWrite, REG_SZ, %chaveRegistry2%, Habilidade4Tempo, %tempo4%
    }

    return

}

migraConfigVelha()
{

    RegRead, latency1, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 01_LatenciaPainelParagon
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaPainelParagon, %latency1%
    
    RegRead, latency2, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 02_LatenciaClick
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, LatenciaClick, %latency2%

    RegRead, activateKeyParagon, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 03_AtalhoDiabloParagon
    RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\BD3Auto\Config, AtalhoDiabloParagon, %activateKeyParagon%

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

criaJanelaConfiguracao()
{

    Gui Add, Tab3, x10 y10 w350 h250, Ajuda|Configurações||Paragon|Perfil Auto 1|Perfil Auto 2|Perfil Auto 3|Perfil Auto 4|Perfil Auto 5|Perfil Auto 6|Perfil Auto 7|Perfil Auto 8

    Gui, Tab, 1
    Gui, Add, Text, x50 y90, Control+Shift+R (Reload)  /  Control+Shift+C (Configuração)
    Gui, Add, Text, x50 y110, F7 (Modo Vida)  /  F8 (Modo Dano) 
    Gui, Add, Text, x50 y130, F5 (Troca Itens Kadala)  /  F6 (Recicla Item)
    Gui, Add, Text, x50 y150, F11 (Transforma Raro Lendário (direta para esquerda)) 
    Gui, Add, Text, x50 y170, Control+F11 (Transforma Raro Lendário (baixo para cima))
    Gui, Add, Text, x50 y190, F1, F2, F3, F4 (Auto cast habilidades)
    Gui, Add, Text, x50 y210, Control+F1 a Control+F4 (Perfil Auto 1 a 4) 
    Gui, Add, Text, x50 y230, Control+Shift+F1 a Control+Shift+F4 (Perfil Auto 5 a 6) 

    Gui, Tab, 2
    Gui, Add, Text, x50 y90, Latência Paragon:
    Gui, Add, Text,, Latência:
    Gui, Add, Text,, Atalho Paragon:
    Gui, Add, Text,, Troca Kadala (Quantidade):
    Gui, Add, Text,, ResoluçãoX:
    Gui, Add, Text,, ResoluçãoY:
    Gui, Add, Edit, x200 y90 w60 h21 vlatency1, %latency1%  ; The ym option starts a new column of controls.
    Gui, Add, Edit, w60 h21 vlatency2, %latency2%
    Gui, Add, Edit, w60 h21 vactivateKeyParagon, %activateKeyParagon% ; The ym option starts a new column of controls.
    Gui, Add, Edit, w60 h21 vquantTrocaKadala, %quantTrocaKadala%
    Gui, Add, Edit, w60 h21 vscreenSizeRegX, %screenSizeRegX% ; The ym option starts a new column of controls.
    Gui, Add, Edit, w60 h21 vscreenSizeRegY, %screenSizeRegY%

    Gui, Tab, 3
    Gui, Add, Text, x80 y90, Vida (F7)
    Gui, Add, Text, x50 y120, Atributo:
    Gui, Add, Text,, Vitalidade:
    Gui, Add, Text,, Velocidade:
    Gui, Add, Text,, Recurso:
    Gui, Add, Edit, x110 y120 w40 h21 vstat2, %stat2%  ; The ym option starts a new column of controls.
    Gui, Add, Edit, w40 h21 vvit2, %vit2%
    Gui, Add, Edit, w40 h21 vspeed2, %speed2% ; The ym option starts a new column of controls.
    Gui, Add, Edit, w40 h21 vresource2, %resource2%
    Gui, Add, Text, x210 y90, Dano (F8)
    Gui, Add, Text, x180 y120, Atributo:
    Gui, Add, Text,, Vitalidade:
    Gui, Add, Text,, Velocidade:
    Gui, Add, Text,, Recurso:
    Gui, Add, Edit, x250 y120 w40 h21 vstat1, %stat1%  ; The ym option starts a new column of controls.
    Gui, Add, Edit, w40 h21 vvit1, %vit1%
    Gui, Add, Edit, w40 h21 vspeed1, %speed1% ; The ym option starts a new column of controls.
    Gui, Add, Edit, w40 h21 vresource1, %resource1%

    loop, 8
    {
        ntab := 3 + A_Index
        nome := NomePerfil[A_Index]
        habilidade1 := Habilidade1TempoPerfil[A_Index]
        habilidade2 := Habilidade2TempoPerfil[A_Index]
        habilidade3 := Habilidade3TempoPerfil[A_Index]
        habilidade4 := Habilidade4TempoPerfil[A_Index]
        
        Gui, Tab, %ntab%
        Gui, Add, Text, x50 y90, Nome:
        Gui, Add, Text,, Tempo Habilidade 1:
        Gui, Add, Text,, Tempo Habilidade 2:
        Gui, Add, Text,, Tempo Habilidade 3:
        Gui, Add, Text,, Tempo Habilidade 4:
        Gui, Add, Edit, x170 y90 w150 h21 vNomePerfil%A_Index%, %nome%
        Gui, Add, Edit, w50 h21 vHabilidade1TempoPerfil%A_Index%, %habilidade1%
        Gui, Add, Edit, w50 h21 vHabilidade2TempoPerfil%A_Index%, %habilidade2%
        Gui, Add, Edit, w50 h21 vHabilidade3TempoPerfil%A_Index%, %habilidade3% 
        Gui, Add, Edit, w50 h21 vHabilidade4TempoPerfil%A_Index%, %habilidade4%
    }

    Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.

    Gui, Add, Button, x315 y270 default, Fechar  ; The label ButtonOK (if it exists) will be run when the button is pressed.

    return
}

abreJanelaConfiguracao()
{
    Gui, Show,, Configurações
    return

ButtonFechar:
GuiClose:
GuiEscape:
    {
        Gui, Submit  ; Save each control's contents to its associated variable.
        
        loop, 8
        {
            NomePerfil[A_Index] := NomePerfil%A_Index%
            Habilidade1TempoPerfil[A_Index] := Habilidade1TempoPerfil%A_Index%
            Habilidade2TempoPerfil[A_Index] := Habilidade2TempoPerfil%A_Index%
            Habilidade3TempoPerfil[A_Index] := Habilidade3TempoPerfil%A_Index%
            Habilidade4TempoPerfil[A_Index] := Habilidade4TempoPerfil%A_Index%
        }

        gravaConfiguracao()
        
        return
    }
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