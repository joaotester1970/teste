;Parametros de atalho
RegRead, activateKeyDamage, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 01_AtalhoParagonDano
RegRead, activateKeyHealth, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 02_AtalhoParagonVida
RegRead, activateKeyKadala, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 03_AtalhoKadala
RegRead, activateKeyReciclaLendarioUM, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 04_AtalhoReciclaLendarioUM
RegRead, activateKeyTransformaRaroLendario, HKEY_CURRENT_USER\Software\DiabloAuto\01_Atalhos, 05_AtalhoTransformaRaroLendario

;Parametros de configuração
RegRead, latency1, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 01_LatenciaPainelParagon
RegRead, latency2, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 02_LatenciaClick
RegRead, activateKeyParagon, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 03_AtalhoDiabloParagon

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

; START AUTO SCREEN SIZE - save variables for cooridiates based on your sreen size
    SysGet, screenSize, 79
    SysGet, oddBall, 78
    if (screenSize = 1440) ; 2560 x 1440
    {
        resetButtonX     := 1282
        resetButtonY     := 978

        acceptX     := 1110
        acceptY     := 1090

        mainStatX     := 1704
        mainStatY     := 447

        vitX         := 1699
        vitY         := 568

        speedX         := 1699
        speedY         := 690

        resourceX     := 1701
        resourceY     := 815
    }
    if (screenSize = 1080) ; 1920 x 1080
    {
        resetButtonX     := 971
        resetButtonY     := 727

        acceptX     := 816
        acceptY     := 821

        mainStatX    := 1277
        mainStatY    := 335

        vitX         := 1277
        vitY         := 425

        speedX         := 1273
        speedY         := 516

        resourceX     := 1272
        resourceY     := 612
    }
    if (screenSize = 900) ; 1600 x 900
    {
        resetButtonX     := 804
        resetButtonY     := 610

        acceptX     := 695
        acceptY     := 686

        mainStatX    := 1067
        mainStatY    := 275

        vitX         := 1067
        vitY         := 356

        speedX         := 1063
        speedY         := 433

        resourceX     := 1063
        resourceY     := 511
    }
    if (screenSize = 768) ; 1024 x 768
    {
        resetButtonX     := 500
        resetButtonY     := 520

        acceptX     := 415
        acceptY     := 582

        mainStatX    := 731
        mainStatY    := 234

        vitX         := 731
        vitY         := 304

        speedX         := 736
        speedY         := 370

        resourceX     := 735
        resourceY     := 436
    }
    if (screenSize = 800) ; 1280 x 800
    {
        resetButtonX     := 640
        resetButtonY     := 546

        acceptX     := 546
        acceptY     := 605

        mainStatX    := 873
        mainStatY    := 246

        vitX         := 871
        vitY         := 318

        speedX         := 875
        speedY         := 387

        resourceX     := 872
        resourceY     := 455
    }
    if (screenSize = 1024) ; 1280 x 1024
    {
        resetButtonX     := 646
        resetButtonY     := 699

        acceptX     := 520
        acceptY     := 771

        mainStatX    := 936
        mainStatY    := 317

        vitX         := 940
        vitY         := 402

        speedX         := 936
        speedY         := 492

        resourceX     := 940
        resourceY     := 582
    }
    if (screenSize = 1440 && oddBall = 1920) ; 1920 x 1440
    {
        resetButtonX     := 963
        resetButtonY     := 979

        acceptX     := 784
        acceptY     := 1093

        mainStatX    := 1378
        mainStatY    := 446

        vitX         := 1379
        vitY         := 566

        speedX         := 1370
        speedY         := 695

        resourceX     := 1383
        resourceY     := 816
    }

; END AUTO SCREEN SIZE

MsgBox,
(
Settings:
Tamanho da tela = %screenSize%
Modo Dano Hotkey = %activateKeyDamage%
Modo Vida Hotkey = %activateKeyHealth%
Latencia 1 = %latency1%
Latencia 2 = %latency2%
Paragon Hotkey = %activateKeyParagon%

)

SetDefaultMouseSpeed, 0 ; mouse moves faster

Hotkey, %activateKeyDamage%, Damage ; starts damage script
Hotkey, %activateKeyHealth%, Health ; starts health script

Damage() ; script to change paragon for dealing damage
{
    global stat1
    global vit1
    global speed1
    global resource1
    global activateKeyParagon
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
    global latency1
    global latency2
    global latency3

    MouseGetPos, mouseX, mouseY

    SetMouseDelay, %latency1%
    SendInput %activateKeyParagon%
    MouseClick, Left, resetButtonX, resetButtonY

    SendInput, {Ctrl Down}
    
    SetMouseDelay, %latency2%

    Loop, %resource1%
    {
        MouseClick, Left, resourceX, resourceY
    }

    Loop, %speed1%
    {
        MouseClick, Left, speedX, speedY
    }

    Loop, %stat1%
    {
        MouseClick, Left, mainStatX, mainStatY
    }

    Loop, %vit1%
    {
        MouseClick, Left, vitX, vitY
    }

    SetMouseDelay, %latency1%

    SendInput, {Ctrl Up}
    MouseClick, Left, acceptx, acceptY

    MouseMove, mouseX, mouseY

    return

}

Health() ; script to change paragon for staying alive
{
    global stat2
    global vit2
    global speed2
    global resource2
    global activateKeyParagon
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
    global latency1
    global latency2
    global latency3

    MouseGetPos, mouseX, mouseY

    SetMouseDelay, %latency1%
    SendInput %activateKeyParagon%
    MouseClick, Left, resetButtonX, resetButtonY

    SendInput, {Ctrl Down}
    
    SetMouseDelay, %latency2%

    Loop, %resource2%
    {
        MouseClick, Left, resourceX, resourceY
    }

    Loop, %speed2%
    {
        MouseClick, Left, speedX, speedY
    }

    Loop, %vit2%
    {
        MouseClick, Left, vitX, vitY
    }

    Loop, %stat2%
    {
        MouseClick, Left, mainStatX, mainStatY
    }

    SetMouseDelay, %latency1%

    SendInput, {Ctrl Up}
    MouseClick, Left, acceptx, acceptY

    MouseMove, mouseX, mouseY

    return
}




