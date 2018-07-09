#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

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
Para configurar pressione Control+Shift+C
),3
;;;;;AutoCast para tecla de forçar movimento (0 no diablo) = Tecla Windows+F12 (em análise)
}

SetDefaultMouseSpeed, 0 ; mouse moves faster

Hotkey, ^+r, recarregar
Hotkey, ^+c, abreJanelaConfiguracao
Hotkey, F12, posicao

Hotkey, IfWinActive, Diablo III

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

    arquivoSaida = pontos.txt

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

    loop, 4
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

    loop, 4
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

    return
}

criaJanelaConfiguracao()
{

    Gui Add, Tab3, x10 y10 w350 h280, Ajuda||Configurações|Paragon|Perfil Auto 1|Perfil Auto 2|Perfil Auto 3|Perfil Auto 4

    Gui, Tab, 1
    Gui, Add, Text, x30 y90, Control+Shift+C (Configuração)  /  Control+Shift+R (Reload)
    Gui, Add, Text,, F5 (Troca Itens Kadala)  
    Gui, Add, Text,, F7 (paragon Vida)  / F8 (paragon Dano)
    Gui, Add, Text,, F1, F2, F3, F4 (Auto cast habilidades)
    Gui, Add, Text,, Control+F1 a Control+F4 (Perfil Auto 1 a 4) 

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

    loop, 4
    {
        ntab := 3 + A_Index
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

    Gui, Add, Button, x315 y300 default, Salvar ; The label ButtonOK (if it exists) will be run when the button is pressed.
    
    return

    GuiClose:
    GuiEscape:
    ButtonSalvar:
    {

        Gui, Submit  ; Save each control's contents to its associated variable.
        gravaConfiguracao()
        
        Gui, Destroy
            
        return
    }

}

abreJanelaConfiguracao()
{

    Gui, Destroy

    criaJanelaConfiguracao()
    
    Gui, Show,, Configurações
    
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
