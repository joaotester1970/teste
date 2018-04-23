global screenSizeX
global screenSizeY

global activateKeyParagon
global activateKeyDamage
global activateKeyHealth
global activateKeyTrocaKadala
global activateKeyReciclaLendarioUM
global activateKeyTransformaRaroLendario
global activateKeyTransformaRaroLendarioVertical

global quantTrocaKadala
global latency1
global latency2
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

Global forcarMovimentoEstado, forcarMovimentoEstado := 1

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

CoordMode, Mouse, Window

carregaConfiguracao()

validaResolucao()

MsgBox,
(
Settings:
Tamanho da tela = %screenSizeX% x %screenSizeY%
Latencia 1 = %latency1%
Latencia 2 = %latency2%

Atalho Modo Dano = %activateKeyDamage%
Atalho Modo Vida = %activateKeyHealth%
Atalho Paragon = %activateKeyParagon%
Atalho Troca Kadala = %activateKeyTrocaKadala%
Atalho ReciclaUM = %activateKeyReciclaLendarioUM%
Atalho Transforma Raro Lendário (direta para esquerda)= %activateKeyTransformaRaroLendario%
Atalho Transforma Raro Lendário (baixo para cima)= %activateKeyTransformaRaroLendarioVertical%

Troca Kadala quantidade = %quantTrocaKadala%

AutoCast Habilidade 1 = F1
AutoCast Habilidade 2 = F2
AutoCast Habilidade 3 = F3
AutoCast Habilidade 4 = F4
)
;;;;;AutoCast para tecla de forçar movimento (0 no diablo) = Tecla Windows+F12 (em análise)

SetDefaultMouseSpeed, 0 ; mouse moves faster

Hotkey, IfWinActive, Diablo III
Hotkey, %activateKeyDamage%, trocaParagonDamage ; starts damage script
Hotkey, %activateKeyHealth%, trocaParagonHealth ; starts health script1
Hotkey, %activateKeyTrocaKadala%, kadala
Hotkey, %activateKeyReciclaLendarioUM%, reciclaUM
Hotkey, ^%activateKeyReciclaLendarioUM%, reciclaLinha
Hotkey, %activateKeyTransformaRaroLendario%, transformaRaroLendario
Hotkey, %activateKeyTransformaRaroLendarioVertical%, transformaRaroLendarioVertical
Hotkey, F1, habilidadeAutomatica1
Hotkey, F2, habilidadeAutomatica2
Hotkey, F3, habilidadeAutomatica3
Hotkey, F4, habilidadeAutomatica4
;Hotkey, #F12, forcarMovimento
Hotkey, F12, posicao
Hotkey, ^F12, validaCor
Hotkey, ^t, teleporte

trocaParagonDamage() ; script to change paragon for dealing damage
{

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
    Loop, %stat1%
    {
        MouseClick, Left, mainStatX, mainStatY
    }

    SetMouseDelay, %latency2%
    Loop, %vit1%
    {
        MouseClick, Left, vitX, vitY
    }

    SendInput, {Ctrl Up}

    SetMouseDelay, %latency2%
    MouseClick, Left, acceptx, acceptY

    MouseMove, mouseX, mouseY

    return

}

trocaParagonHealth() ; script to change paragon for staying alive
{

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

transformaRaroLendario()  ; esquerda para direita (eixo X)
{

    validaResolucao()
    MouseGetPos, mouseX, mouseY

    novaPosicaoX := mouseX
    novaPosicaoY := mouseY

    loop
    {
        SetMouseDelay, 10
        MouseClick, Right, novaPosicaoX, novaPosicaoY
        SetMouseDelay, 10
        MouseClick, Left, preencherBotaoX, preencherBotaoY
        SetMouseDelay, 10
        MouseClick, Left, transmutarBotaoX, transmutarBotaoY ; transmutar
        Sleep, 3000
        SetMouseDelay, 10
        MouseClick, Left, transmutarBotaoX, transmutarBotaoY ; aceitar
        Sleep, 1000
        novaPosicaoX := NovaPosicaoX - limiteDiferencaX
    
    } until novaPosicaoX <= limiteBagMinX

    return
}

transformaRaroLendarioVertical()
{

    validaResolucao()
    MouseGetPos, mouseX, mouseY

    novaPosicaoX := mouseX
    novaPosicaoY := mouseY

    loop
    {
        SetMouseDelay, 10
        MouseClick, Right, novaPosicaoX, novaPosicaoY
        SetMouseDelay, 10
        MouseClick, Left, preencherBotaoX, preencherBotaoY
        SetMouseDelay, 10
        MouseClick, Left, transmutarBotaoX, transmutarBotaoY ; transmutar
        Sleep, 3000
        SetMouseDelay, 10
        MouseClick, Left, transmutarBotaoX, transmutarBotaoY ; aceitar
        Sleep, 1000
        novaPosicaoY := NovaPosicaoY - limiteDiferencaY
    
    } until novaPosicaoY <= limiteBagMinY

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

    return
}

carregaConfiguracao()
{
    ;Parametros de atalho
    RegRead, activateKeyDamage, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 01_AtalhoParagonDano
    RegRead, activateKeyHealth, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 02_AtalhoParagonVida
    RegRead, activateKeyTrocaKadala, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 03_AtalhoKadala
    RegRead, activateKeyReciclaLendarioUM, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 04_AtalhoReciclaLendarioUM
    RegRead, activateKeyTransformaRaroLendario, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 05_AtalhoTransformaRaroLendario
    RegRead, activateKeyTransformaRaroLendarioVertical, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 06_AtalhoTransformaRaroLendarioVertical

    ;Parametros de configuração
    RegRead, latency1, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 01_LatenciaPainelParagon
    RegRead, latency2, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 02_LatenciaClick
    RegRead, activateKeyParagon, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 03_AtalhoDiabloParagon
    RegRead, quantTrocaKadala, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 04_QuantTrocaKadala
    RegRead, screenSizeRegX, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 05_screenSizeX
    RegRead, screenSizeRegY, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 06_screenSizeY


    ;Parametros de Paragon Dano
    RegRead, stat1, HKEY_CURRENT_USER\Software\DiabloAuto\03_ParagonDano, 01_ParagonDanoAtributo
    RegRead, vit1, HKEY_CURRENT_USER\Software\DiabloAuto\03_ParagonDano, 02_ParagonDanoVitalidade
    RegRead, speed1, HKEY_CURRENT_USER\Software\DiabloAuto\03_ParagonDano, 03_ParagonDanoVelocidade
    RegRead, resource1, HKEY_CURRENT_USER\Software\DiabloAuto\03_ParagonDano, 04_ParagonDanoRecurso

    ;Parametros de Paragon Vida
    RegRead, stat2, HKEY_CURRENT_USER\Software\DiabloAuto\04_ParagonVida, 01_ParagonVidaAtributo
    RegRead, vit2, HKEY_CURRENT_USER\Software\DiabloAuto\04_ParagonVida, 02_ParagonVidaVitalidade
    RegRead, speed2, HKEY_CURRENT_USER\Software\DiabloAuto\04_ParagonVida, 03_ParagonVidaVelocidade
    RegRead, resource2, HKEY_CURRENT_USER\Software\DiabloAuto\04_ParagonVida, 04_ParagonVidaRecurso
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

teleporte()
{
    Send, t{Enter}
}