; =========================== START INFO ===========================

; Você precisa editar 3 valores
; 1.) Paragon points (depende do seu nível)
; 2.) Activation Key (Teclas de atalho)
; 3.) Latency (depende de sua conexão com internet)

; INFO - Paragon "guideline"
; stat1 = [paragon lvl] - [650] (first 2 digits rounded up)
;    EXAMPLE - of player paragon lvl 2765
;     EXAMPLE - 2765 - 650 = 2115
;     EXAMPLE - with 2115 as result try stat1 = 22
; vit1 more then likely just leave at zero
; int2 = keep under 10 (it allow extra reistance from int in health mode)
; vit2 = [paragon lvl] - [650] - [stat2 x 100]
;    EXAMPLE - of player paragon lvl 2765 with stat2 set to 4
;    EXAMPLE - 2765 - 650 - 400 = 1715
;    EXAMPLE - with 1715 as result try vit2 = 18

; INFO - latency settings
; if you are getting werid results and not all points are being
; distributed properly you may have to adjust latency vaules.
; if laggy try latency1 = 10 (default 5)
; if laggy try latency2 = 30 (default 20)
; changing these vaules will speed up and slow down the script so you
; can play around with these numbers for whatever works best for you

; INFO - setting activation key
; ! = alt key
; + = shift key
; ^ = crtl key
; # = windows key
; EXAMPLE - ^!f would activate macro by pressing crtl + alt + f at the same time
; EXAMPLE - q would actiavte macro by just pressing the q key


;************************************************************************
; ********** Editar somente os valores deste trecho do código ***********
;************************************************************************

stat1 := 7             ; atributo principal para modo dano - cada ponto equivale a 100 paragons
vit1 := 0              ; vitalidade para modo dano - cada ponto equivale a 100 paragons
Speed1 := 0            ; velocidade para modo dano - cada ponto equivale a 100 paragons
Resource1 := 1         ; recurso para modo dano - cada ponto equivale a 100 paragons

stat2 := 0             ; atributo principal para modo vida - cada ponto equivale a 100 paragons
vit2 := 7              ; vitalidade para modo vida - cada ponto equivale a 100 paragons
speed2 := 1            ; velocidade para modo vida - cada ponto equivale a 100 paragons
resource2 := 0         ; recurso para modo vida - cada ponto equivale a 100 paragons

activateKeyDamage = F10        ; Escolha a tecla de atalho para dano (observar informações de combinação de teclas acima)
activateKeyHealth = F9         ; Escolha a tecla de atalho para vida (observar informações de combinação de teclas acima)

activateKeyParagon = p		; Configure com a tecla de atalho que está definida para a abertura da tela de Paragon

latency1 := 5            ; lag para abertura e fechamento da tela de paragon
latency2 := 20            ; lag para atribuição dos pontos de paragon

;************************************************************************
;************************************************************************
;************************************************************************

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
Não se esqueça:::::Certifique-se que a aba principal do paragon esteja selecionada antes do início da fenda::::::
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




