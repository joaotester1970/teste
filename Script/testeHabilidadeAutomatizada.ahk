
Global habilitadeAutomatica1Estado, habilitadeAutomatica1Estado := 1
Global habilitadeAutomatica2Estado, habilitadeAutomatica2Estado := 1
Global habilitadeAutomatica3Estado, habilitadeAutomatica3Estado := 1
Global habilitadeAutomatica4Estado, habilitadeAutomatica4Estado := 1

Global Habilidade1TempoPerfil, Habilidade1TempoPerfil := Array(0,0,0,0)
Global Habilidade2TempoPerfil, Habilidade2TempoPerfil := Array(0,0,0,0)
Global Habilidade3TempoPerfil, Habilidade3TempoPerfil := Array(0,0,0,0)
Global Habilidade4TempoPerfil, Habilidade4TempoPerfil := Array(0,0,0,0)

Global perfilAutomaticoEstado, perfilAutomaticoEstado := 1
Global perfilAutomaticoCarregado, perfilAutomaticoCarregado := 1

Thread, interrupt, 0

carregaConfiguracao()

Hotkey, ^F1, perfilAutomatico1
Hotkey, ^F2, perfilAutomatico2
Hotkey, ^F3, perfilAutomatico3
Hotkey, ^F4, perfilAutomatico4

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

perfilAutomatico(perfilAcionado)
{

    if (perfilAcionado <> perfilAutomaticoCarregado)
    {
        perfilAutomaticoCarregado := perfilAcionado
        SetTimer, habilidadeAutomatica1, Off
        SetTimer, habilidadeAutomatica2, Off
        SetTimer, habilidadeAutomatica3, Off
        SetTimer, habilidadeAutomatica4, Off
        perfilAutomaticoEstado := 1 
    }

    
    if perfilAutomaticoEstado = 1
    {
        tempo1 := Habilidade1TempoPerfil[perfilAutomaticoCarregado]
        tempo2 := Habilidade2TempoPerfil[perfilAutomaticoCarregado]
        tempo3 := Habilidade3TempoPerfil[perfilAutomaticoCarregado]
        tempo4 := Habilidade4TempoPerfil[perfilAutomaticoCarregado]

        If (tempo1 > 100) 
        {
            SetTimer, habilidadeAutomatica1, %tempo1%
        }
        If (tempo2 > 100) 
        {
            SetTimer, habilidadeAutomatica2, %tempo2%
        }
        If (tempo3 > 100) 
        {
            SetTimer, habilidadeAutomatica3, %tempo3%
        }
        If (tempo4 > 100) 
        {
            SetTimer, habilidadeAutomatica4, %tempo4%
        }
    }
    else
    {
        SetTimer, habilidadeAutomatica1, Off
        SetTimer, habilidadeAutomatica2, Off
        SetTimer, habilidadeAutomatica3, Off
        SetTimer, habilidadeAutomatica4, Off
    }
    
    perfilAutomaticoEstado := perfilAutomaticoEstado * -1
    
    return

}

habilidadeAutomatica1()
{
    SendInput, 1
    return
}

habilidadeAutomatica2()
{
    SendInput, 2
    return
}

habilidadeAutomatica3()
{
    SendInput, 3
    return
}

habilidadeAutomatica4()
{
    SendInput, 4
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
    RegRead, screenSizeRegX, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 05_ResolucaoX
    RegRead, screenSizeRegY, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 06_ResolucaoY

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

    RegRead, tempo1, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil1, 01_Habilidade1Tempo
    RegRead, tempo2, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil1, 02_Habilidade2Tempo
    RegRead, tempo3, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil1, 03_Habilidade3Tempo
    RegRead, tempo4, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil1, 04_Habilidade4Tempo

    Habilidade1TempoPerfil[1] := tempo1
    Habilidade2TempoPerfil[1] := tempo2
    Habilidade3TempoPerfil[1] := tempo3
    Habilidade4TempoPerfil[1] := tempo4

    RegRead, tempo1, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil2, 01_Habilidade1Tempo
    RegRead, tempo2, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil2, 02_Habilidade2Tempo
    RegRead, tempo3, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil2, 03_Habilidade3Tempo
    RegRead, tempo4, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil2, 04_Habilidade4Tempo

    Habilidade1TempoPerfil[2] := tempo1
    Habilidade2TempoPerfil[2] := tempo2
    Habilidade3TempoPerfil[2] := tempo3
    Habilidade4TempoPerfil[2] := tempo4

    RegRead, tempo1, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil3, 01_Habilidade1Tempo
    RegRead, tempo2, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil3, 02_Habilidade2Tempo
    RegRead, tempo3, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil3, 03_Habilidade3Tempo
    RegRead, tempo4, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil3, 04_Habilidade4Tempo

    Habilidade1TempoPerfil[3] := tempo1
    Habilidade2TempoPerfil[3] := tempo2
    Habilidade3TempoPerfil[3] := tempo3
    Habilidade4TempoPerfil[3] := tempo4

    RegRead, tempo1, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil4, 01_Habilidade1Tempo
    RegRead, tempo2, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil4, 02_Habilidade2Tempo
    RegRead, tempo3, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil4, 03_Habilidade3Tempo
    RegRead, tempo4, HKEY_CURRENT_USER\Software\DiabloAuto\05_PerfilTemporizado\Perfil4, 04_Habilidade4Tempo

    Habilidade1TempoPerfil[4] := tempo1
    Habilidade2TempoPerfil[4] := tempo2
    Habilidade3TempoPerfil[4] := tempo3
    Habilidade4TempoPerfil[4] := tempo4

    return

}