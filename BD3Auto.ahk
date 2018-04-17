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


;************************************************************************
;************************************************************************
;************************************************************************

habilitadeAutomatica1Estado := 1
habilitadeAutomatica2Estado := 1
habilitadeAutomatica3Estado := 1
habilitadeAutomatica4Estado := 1
forcarMovimentoEstado := 1

; START AUTO SCREEN SIZE - save variables for cooridiates based on your sreen size
    SysGet, screenSize, 79
    SysGet, oddBall, 78
    if (screenSize = 1440) ; 2560 x 1440
    {
	menuAtributoX:=  814
	menuAtributoY:=  148

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

	reciclaOKX	:= 1118
	reciclaOKY	:= 507
    }
    if (screenSize = 1080) ; 1920 x 1080
    {
	menuAtributoX:=  617
	menuAtributoY:=  110

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

	reciclaOKX	:= 847
	reciclaOKY	:= 377

    }
    if (screenSize = 900) ; 1600 x 900
    {
	menuAtributoX:=  511
	menuAtributoY:=  92

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

	reciclaOKX	:= 701
	reciclaOKY	:= 316
    }
    if (screenSize = 768) ; 1024 x 768
    {
	menuAtributoX:=  318
	menuAtributoY:=  78

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

	reciclaOKX	:= 436
	reciclaOKY	:= 270
    }
    if (screenSize = 800) ; 1280 x 800
    {
	menuAtributoX:=  406
	menuAtributoY:=  82

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

	reciclaOKX	:= 558
	reciclaOKY	:= 362
    }
    if (screenSize = 1024) ; 1280 x 1024
    {
	menuAtributoX:=  410
	menuAtributoY:=  106

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

	reciclaOKX	:= 563
	reciclaOKY	:= 362
    }
    if (screenSize = 1440 && oddBall = 1920) ; 1920 x 1440
    {
	menuAtributoX:=  611
	menuAtributoY:=  148

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

	reciclaOKX	:= 840
	reciclaOKY	:= 508
    }

; END AUTO SCREEN SIZE

MsgBox,
(
Settings:
Tamanho da tela = %screenSize%
Latencia 1 = %latency1%
Latencia 2 = %latency2%

Atalho Modo Dano = %activateKeyDamage%
Atalho Modo Vida Hotkey = %activateKeyHealth%
Atalho Paragon = %activateKeyParagon%
Atalho Troca Kadala = %activateKeyTrocaKadala%
Atalho Recicla = %activateKeyReciclaLendarioUM%
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

Hotkey, %activateKeyDamage%, Damage ; starts damage script
Hotkey, %activateKeyHealth%, Health ; starts health script1
Hotkey, %activateKeyTrocaKadala%, kadala
Hotkey, %activateKeyReciclaLendarioUM%, recicla
Hotkey, %activateKeyTransformaRaroLendario%, transformaRaroLendario
Hotkey, F1, habilidadeAutomatica1
Hotkey, F2, habilidadeAutomatica2
Hotkey, F3, habilidadeAutomatica3
Hotkey, F4, habilidadeAutomatica4
;Hotkey, #F12, forcarMovimento
Hotkey, F12, posicao

Damage() ; script to change paragon for dealing damage
{

    global menuAtributoX
    global menuAtributoY
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

Health() ; script to change paragon for staying alive
{
    global menuAtributoX
    global menuAtributoY
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

    global quantTrocaKadala

    MouseGetPos, mouseX, mouseY
    SetMouseDelay, 0
    Loop, %quantTrocaKadala%
    {

    	MouseClick, Right, mouseX, mouseY
    }

    return
}

recicla()
{
    global reciclaOKX
    global reciclaOKY

    MouseGetPos, mouseX, mouseY
    SetMouseDelay, 0
    MouseClick, Left, mouseX, mouseY
    SetMouseDelay, 0
    MouseClick, Left, reciclaOKX, reciclaOKY

    SetMouseDelay, 0
    MouseMove, mouseX, mouseY
    return

}

habilidadeAutomatica1()
{
	Global habilitadeAutomatica1Estado
	
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
	Global habilitadeAutomatica2Estado
	
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
	Global habilitadeAutomatica3Estado
	
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
	Global habilitadeAutomatica4Estado
	
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
	Global forcarMovimentoEstado
	
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

transformaRaroLendario()  
{

    Global bagLimiteX
    Global bagLimiteY
    
    MouseGetPos, mouseX, mouseY

;    MsgBox,
;    (
;	x: %mouseX%
;	y: %mouseY%
;   )
    return

}

posicao()  
{

    MouseGetPos, mouseX, mouseY

    MsgBox,
    (
	x: %mouseX%
	y: %mouseY%
    )
    return

}