#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

global quantTrocaKadala, quantTrocaKadala := 30


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

    Gui Add, Tab3, x10 y10 w350 h280, Ajuda||Perfil Auto 1|Perfil Auto 2|Perfil Auto 3|Perfil Auto 4

    Gui, Tab, 1
    Gui, Add, Text, x30 y90, Control+Shift+C (Configuração)  /  Control+Shift+R (Reload)
    Gui, Add, Text,, F5 (Troca Itens Kadala)  
    Gui, Add, Text,, F1, F2, F3, F4 (Auto cast habilidades)
    Gui, Add, Text,, Control+F1 a Control+F4 (Perfil Auto 1 a 4) 
    
    loop, 4
    {
        ntab := 1 + A_Index
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