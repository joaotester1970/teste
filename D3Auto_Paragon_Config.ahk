#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

global arqConfig := "config.ini"

global screenSizeX
global screenSizeY

global latency1
global latency2
global atalhoDiabloParagon

Global atalhoParagonVida, atalhoParagonVida := "F7"
Global atalhoParagonDano, atalhoParagonDano := "F8"

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

Global habilitadeAutomatica1Estado, habilitadeAutomatica1Estado := 1
Global habilitadeAutomatica2Estado, habilitadeAutomatica2Estado := 1
Global habilitadeAutomatica3Estado, habilitadeAutomatica3Estado := 1
Global habilitadeAutomatica4Estado, habilitadeAutomatica4Estado := 1

Global perfilAutomaticoEstado, perfilAutomaticoEstado := 0 ; 0 = está desligado; 1 = está ligado
Global perfilAutomaticoCarregado, perfilAutomaticoCarregado := 1

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

Global novaPosicaoX
Global novaPosicaoY

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
),3
;;;;;AutoCast para tecla de forçar movimento (0 no diablo) = Tecla Windows+F12 (em análise)
}

SetDefaultMouseSpeed, 0 ; mouse moves faster

Hotkey, ^+r, recarregar
Hotkey, F12, posicao

;Hotkey, IfWinActive, Diablo III

Hotkey, %atalhoParagonDano%, trocaParagonDano 
Hotkey, %atalhoParagonVida%, trocaParagonVida 
Hotkey, F5, kadala
Hotkey, F1, habilidadeAutomatica1
Hotkey, F2, habilidadeAutomatica2
Hotkey, F3, habilidadeAutomatica3
Hotkey, F4, habilidadeAutomatica4
Hotkey, ^F1, perfilAutomatico1
Hotkey, ^F2, perfilAutomatico2
Hotkey, ^F3, perfilAutomatico3
Hotkey, ^F4, perfilAutomatico4

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

kadala()  
{
    Critical
    
    MouseGetPos, mouseX, mouseY
    SetMouseDelay, 0
    Loop, %quantTrocaKadala%
    {

    	MouseClick, Right, mouseX, mouseY
    }

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

posicao()  
{

    arquivoSaida = "pontos.txt"

    MouseGetPos, mouseX, mouseY
    
    ;PixelGetColor cor, %mouseX%, %mouseY%, RGB

	FileAppend, %mouseX%%A_Tab%%mouseY%`n, %arquivoSaida%

    return

}

perfilAutomatico(perfilAcionado)
{
    
    if perfilAutomaticoEstado = 0 
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
}

carregaConfiguracao()
{

;IniWrite, this is a new value, arqConfig, section2, key
;IniRead, OutputVar, arqConfig, section2, key

    IniRead, controle, %arqConfig%, Config, teste

    IniRead, latency1, %arqConfig%, Config, LatenciaPainelParagon
    if (latency1 = controle)
    {
        latency1 := 100
        IniWrite, %latency1%, %arqConfig%, Config, LatenciaPainelParagon
    }

    IniRead, latency2, %arqConfig%, Config, LatenciaClick
    if (latency2 = controle)
    {
        latency2 := 1
        IniWrite, %latency2%, %arqConfig%, Config, LatenciaClick
    }
    
    IniRead, atalhoDiabloParagon, %arqConfig%, Config, AtalhoDiabloParagon
    if (atalhoDiabloParagon = controle)
    {
        atalhoDiabloParagon := "p"
        IniWrite, %atalhoDiabloParagon%, %arqConfig%, Config, AtalhoDiabloParagon
    }

    IniRead, quantTrocaKadala, %arqConfig%, Config, QuantTrocaKadala
    if (quantTrocaKadala = controle)
    {
        quantTrocaKadala := 30
        IniWrite, %quantTrocaKadala%, %arqConfig%, Config, QuantTrocaKadala
    }

    IniRead, screenSizeRegX, %arqConfig%, Config, ResolucaoX
    if (screenSizeRegX = controle)
    {
        screenSizeRegX := 0
        IniWrite, %screenSizeRegX%, %arqConfig%, Config, ResolucaoX
    }

    IniRead, screenSizeRegY, %arqConfig%, Config, ResolucaoY
        if (screenSizeRegY = controle)
    {
        screenSizeRegY := 0
        IniWrite, %screenSizeRegY%, %arqConfig%, Config, ResolucaoY
    }

;-----------------------------
    ;Parametros de Paragon Dano

    IniRead, stat1, %arqConfig%, ParagonDano, ParagonDanoAtributo
    if (stat1 = controle)
    {
        stat1 := 1
        IniWrite, %stat1%, %arqConfig%, ParagonDano, ParagonDanoAtributo
    }
    
    IniRead, vit1, %arqConfig%, ParagonDano, ParagonDanoVitalidade
    if (vit1 = controle)
    {
        vit1 := 0
        IniWrite, %vit1%, %arqConfig%, ParagonDano, ParagonDanoVitalidade
    }
    
    IniRead, speed1, %arqConfig%, ParagonDano, ParagonDanoVelocidade
    if (speed1 = controle)
    {
        speed1 := 1
        IniWrite, %speed1%, %arqConfig%, ParagonDano, ParagonDanoVelocidade
    }
    
    IniRead, resource1, %arqConfig%, ParagonDano, ParagonDanoRecurso
    if (resource1 = controle)
    {
        resource1 := 1
        IniWrite, %resource1%, %arqConfig%, ParagonDano, ParagonDanoRecurso
    }

;-----------------------------
    ;Parametros de Paragon Vida

    IniRead, stat2, %arqConfig%, ParagonVida, ParagonVidaAtributo
    if (stat2 = controle)
    {
        stat2 := 0
        IniWrite, %stat2%, %arqConfig%, ParagonVida, ParagonVidaAtributo
    }
    
    IniRead, vit2, %arqConfig%, ParagonVida, ParagonVidaVitalidade
    if (vit2 = controle)
    {
        vit2 := 1
        IniWrite, %vit2%, %arqConfig%, ParagonVida, ParagonVidaVitalidade
    }
    
    IniRead, speed2, %arqConfig%, ParagonVida, ParagonVidaVelocidade
    if (speed2 = controle)
    {
        speed2 := 1
        IniWrite, %speed2%, %arqConfig%, ParagonVida, ParagonVidaVelocidade
    }
    
    IniRead, resource2, %arqConfig%, ParagonVida, ParagonVidaRecurso
    if (resource2 = controle)
    {
        resource2 := 1
        IniWrite, %resource2%, %arqConfig%, ParagonVida, ParagonVidaRecurso
    }
    
;-----------------
    ;Perfil temporizado

    loop, 4
    {
        chaveRegistry := "PerfilTemporizado_Perfil" . A_Index
        IniRead, nome, %arqConfig%, %chaveRegistry%, Nome
        if (nome = controle)
        {
            nome := "XXXXX"
            IniWrite, %nome%, %arqConfig%, %chaveRegistry%, Nome
        }

        IniRead, tempo1, %arqConfig%, %chaveRegistry%, Habilidade1Tempo
        if (tempo1 = controle)
        {
            tempo1 := 0
            IniWrite, %tempo1%, %arqConfig%, %chaveRegistry%, Habilidade1Tempo
        }
        
        IniRead, tempo2, %arqConfig%, %chaveRegistry%, Habilidade2Tempo
        if (tempo2 = controle)
        {
            tempo2 := 0
            IniWrite, %tempo2%, %arqConfig%, %chaveRegistry%, Habilidade2Tempo
        }
        
        IniRead, tempo3, %arqConfig%, %chaveRegistry%, Habilidade3Tempo
        if (tempo3 = controle)
        {
            tempo3 := 0
            IniWrite, %tempo3%, %arqConfig%, %chaveRegistry%, Habilidade3Tempo
        }
        
        IniRead, tempo4, %arqConfig%, %chaveRegistry%, Habilidade4Tempo
        if (tempo4 = controle)
        {
            tempo4 := 0
            IniWrite, %tempo4%, %arqConfig%, %chaveRegistry%, Habilidade4Tempo
        }
        
        nomePerfil%A_Index% := nome
        habilidade1TempoPerfil%A_Index% := tempo1
        habilidade2TempoPerfil%A_Index% := tempo2
        habilidade3TempoPerfil%A_Index% := tempo3
        habilidade4TempoPerfil%A_Index% := tempo4
        
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
