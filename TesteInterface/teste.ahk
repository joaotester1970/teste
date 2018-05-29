; Example: Tab control:


global activateKeyParagon
global quantTrocaKadala
global latency1
global latency2, latency2 := 1
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

carregaConfiguracao()

criaJanelaConfiguracao()

Hotkey, ^+c, abreJanelaConfiguracao

criaJanelaConfiguracao()
{

    Gui Add, Tab3, x10 y10 w350 h250, Configurações||Paragon|Tecla Auto|Perfil Auto 1|Perfil Auto 2|Perfil Auto 3|Perfil Auto 4|Perfil Auto 5|Perfil Auto 6|Perfil Auto 7|Perfil Auto 8

    Gui, Tab, 1
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

    Gui, Tab, 2
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

carregaConfiguracao()
{

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

