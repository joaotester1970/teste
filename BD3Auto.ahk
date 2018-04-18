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

Hotkey, %activateKeyDamage%, trocaParagonDamage ; starts damage script
Hotkey, %activateKeyHealth%, trocaParagonHealth ; starts health script1
Hotkey, %activateKeyTrocaKadala%, kadala
Hotkey, %activateKeyReciclaLendarioUM%, reciclaUM
Hotkey, %activateKeyTransformaRaroLendario%, transformaRaroLendario
Hotkey, %activateKeyTransformaRaroLendarioVertical%, transformaRaroLendarioVertical
Hotkey, F1, habilidadeAutomatica1
Hotkey, F2, habilidadeAutomatica2
Hotkey, F3, habilidadeAutomatica3
Hotkey, F4, habilidadeAutomatica4
;Hotkey, #F12, forcarMovimento
Hotkey, F12, posicao

trocaParagonDamage() ; script to change paragon for dealing damage
{

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
        Sleep, 2000
        novaPosicaoX := NovaPosicaoX - limiteDiferencaX
    
    } until novaPosicaoX <= limiteBagMinX

;1602x609 perto limite - calcular diferença 51
;1551x608 perto limite - calcular diferença
;1578x609 meio do item 
;1409x607 limite do bag (esquerdo)
;1426x857 perto limite - calcular diferença 48
;1426x809 perto limite - calcular diferença
;1426x833 meio do item 
;1426x565 limite do bag (superior)
;714x838  preencher esquerdo
;item direito
;235x828  transmutar esquerdo
    return
}

transformaRaroLendarioVertical()
{

    
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

    arquivoSaida = c:\temp\pontos.txt

    MouseGetPos, mouseX, mouseY

	FileAppend, %mouseX%x%mouseY%`n, %arquivoSaida%

    return

}

validaResolucao()
{
    if (screenSizeX = 0 || screenSizeY = 0 || screenSizeX = "" || screenSizeY = "")
    {
        SysGet, screenSizeX, 78
        SysGet, screenSizeY, 79
    }

    if (screenSizeX = 1920 && screenSizeY = 1080)
    {
        menuAtributoX := 617
        menuAtributoY := 110
        resetButtonX := 971
        resetButtonY := 727
        acceptX := 816
        acceptY := 821
        mainStatX := 1277
        mainStatY := 335
        vitX := 1277
        vitY := 425
        speedX := 1277
        speedY := 516
        resourceX := 1277
        resourceY := 612
        reciclaOKX := 847
        reciclaOKY := 377
        limiteBagMinX := 1409
        limiteBagMinY := 565
        preencherBotaoX := 714
        preencherBotaoY := 838
        transmutarBotaoX := 235
        transmutarBotaoY := 828
        limiteDiferencaX := 51
        limiteDiferencaY := 48
    }
    else if (screenSizeX = 2560 && screenSizeY = 1440)
    {
        menuAtributoX := 822
        menuAtributoY := 146
        resetButtonX := 1294
        resetButtonY := 969
        acceptX := 1088
        acceptY := 1094
        mainStatX := 1702
        mainStatY := 446
        vitX := 1702
        vitY := 566
        speedX := 1702
        speedY := 688
        resourceX := 1702
        resourceY := 816
        reciclaOKX := 1129
        reciclaOKY := 502
        limiteBagMinX := 1878
        limiteBagMinY := 753
        preencherBotaoX := 952
        preencherBotaoY := 1117
        transmutarBotaoX := 313
        transmutarBotaoY := 1104
        limiteDiferencaX := 68
        limiteDiferencaY := 64
    }
    else if (screenSizeX = 1600 && screenSizeY = 900)
    {
        menuAtributoX := 514
        menuAtributoY := 91
        resetButtonX := 809
        resetButtonY := 605
        acceptX := 680
        acceptY := 684
        mainStatX := 1064
        mainStatY := 279
        vitX := 1064
        vitY := 354
        speedX := 1064
        speedY := 430
        resourceX := 1064
        resourceY := 510
        reciclaOKX := 705
        reciclaOKY := 314
        limiteBagMinX := 1174
        limiteBagMinY := 470
        preencherBotaoX := 595
        preencherBotaoY := 698
        transmutarBotaoX := 195
        transmutarBotaoY := 690
        limiteDiferencaX := 42
        limiteDiferencaY := 40
    }
    else if (screenSizeX = 1360 && screenSizeY = 768)
    {
        menuAtributoX := 437
        menuAtributoY := 78
        resetButtonX := 687
        resetButtonY := 516
        acceptX := 578
        acceptY := 583
        mainStatX := 904
        mainStatY := 238
        vitX := 904
        vitY := 302
        speedX := 904
        speedY := 366
        resourceX := 904
        resourceY := 435
        reciclaOKX := 599
        reciclaOKY := 268
        limiteBagMinX := 998
        limiteBagMinY := 401
        preencherBotaoX := 505
        preencherBotaoY := 595
        transmutarBotaoX := 166
        transmutarBotaoY := 588
        limiteDiferencaX := 36
        limiteDiferencaY := 34
    }
    else if (screenSizeX = 1024 && screenSizeY = 768)
    {
        menuAtributoX := 329
        menuAtributoY := 78
        resetButtonX := 517
        resetButtonY := 516
        acceptX := 435
        acceptY := 583
        mainStatX := 681
        mainStatY := 238
        vitX := 681
        vitY := 302
        speedX := 681
        speedY := 366
        resourceX := 681
        resourceY := 435
        reciclaOKX := 451
        reciclaOKY := 268
        limiteBagMinX := 751
        limiteBagMinY := 401
        preencherBotaoX := 380
        preencherBotaoY := 595
        transmutarBotaoX := 125
        transmutarBotaoY := 588
        limiteDiferencaX := 27
        limiteDiferencaY := 34
    }
    else if (screenSizeX = 1280 && screenSizeY = 800)
    {
        menuAtributoX := 411
        menuAtributoY := 81
        resetButtonX := 647
        resetButtonY := 538
        acceptX := 544
        acceptY := 608
        mainStatX := 851
        mainStatY := 248
        vitX := 851
        vitY := 314
        speedX := 851
        speedY := 382
        resourceX := 851
        resourceY := 453
        reciclaOKX := 564
        reciclaOKY := 279
        limiteBagMinX := 939
        limiteBagMinY := 418
        preencherBotaoX := 476
        preencherBotaoY := 620
        transmutarBotaoX := 156
        transmutarBotaoY := 613
        limiteDiferencaX := 34
        limiteDiferencaY := 35
    }
    else if (screenSizeX = 1280 && screenSizeY = 1024)
    {
        menuAtributoX := 411
        menuAtributoY := 104
        resetButtonX := 647
        resetButtonY := 689
        acceptX := 544
        acceptY := 778
        mainStatX := 851
        mainStatY := 317
        vitX := 851
        vitY := 402
        speedX := 851
        speedY := 489
        resourceX := 851
        resourceY := 580
        reciclaOKX := 564
        reciclaOKY := 357
        limiteBagMinX := 939
        limiteBagMinY := 535
        preencherBotaoX := 476
        preencherBotaoY := 794
        transmutarBotaoX := 156
        transmutarBotaoY := 785
        limiteDiferencaX := 34
        limiteDiferencaY := 45
    }
    else if (screenSizeX = 1920 && screenSizeY = 1440)
    {
        menuAtributoX := 617
        menuAtributoY := 146
        resetButtonX := 971
        resetButtonY := 969
        acceptX := 816
        acceptY := 1094
        mainStatX := 1277
        mainStatY := 446
        vitX := 1277
        vitY := 566
        speedX := 1277
        speedY := 688
        resourceX := 1277
        resourceY := 816
        reciclaOKX := 847
        reciclaOKY := 502
        limiteBagMinX := 1409
        limiteBagMinY := 753
        preencherBotaoX := 714
        preencherBotaoY := 1117
        transmutarBotaoX := 235
        transmutarBotaoY := 1104
        limiteDiferencaX := 51
        limiteDiferencaY := 64
    }
    else 
    {
        MsgBox, %screenSizeX% x %screenSizeY% - Resolução não suportada
        exit
    }
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
    RegRead, screenSizeX, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 05_screenSizeX
    RegRead, screenSizeY, HKEY_CURRENT_USER\Software\DiabloAuto\02_Config, 06_screenSiveY

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
