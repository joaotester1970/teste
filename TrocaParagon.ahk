; =========================== START INFO ===========================

; You will need to edit 3 vaules
; 1.) Paragon points (depends on your level)
; 2.) Activation Key (the hotkey that starts the scripts)
; 3.) Latency (depends on where you live / connection speed)

; INFO - Paragon "guideline"
; int1 = [paragon lvl] - [650] (first 2 digits rounded up)
;    EXAMPLE - of player paragon lvl 2765
;     EXAMPLE - 2765 - 650 = 2115
;     EXAMPLE - with 2115 as result try int1 = 22
; vit1 more then likely just leave at zero
; int2 = keep under 10 (it allow extra reistance from int in health mode)
; vit2 = [paragon lvl] - [650] - [int2 x 100]
;    EXAMPLE - of player paragon lvl 2765 with int2 set to 4
;    EXAMPLE - 2765 - 650 - 400 = 1715
;    EXAMPLE - with 1715 as result try vit2 = 18

; INFO - latency settings
; if you are getting werid results and not all points are being
; distributed properly you may have to adjust latency vaules.
; if laggy try latency1 = 10 (default 0)
; if laggy try latency2 = 26 (default 19)
; if laggy try latency3 = 15 (default 5)
; changing these vaules will speed up and slow down the script so you
; can play around with these numbers for whatever works best for you

; INFO - setting activation key
; ! = alt key
; + = shift key
; ^ = crtl key
; # = windows key
; EXAMPLE - ^!f would activate macro by pressing crtl + alt + f at the same time
; EXAMPLE - q would actiavte macro by just pressing the q key

; ============================ END INFO ============================

; ====================== START THINGS TO EDIT ======================

int1 := 8             ; DAMAGE MODE 1 point = 100 paragon(ish)
vit1 := 0              ; DAMAGE MODE 1 point = 100 paragon(ish)

int2 := 0              ; HEALTH MODE 1 point = 100 paragon(ish)
vit2 := 8             ; HEALTH MODE 1 point = 100 paragon(ish)

activateKeyDamage = F11        ; CHOOSE DAMAGE MODE ACTIVATION KEY
activateKeyHealth = F12        ; CHOOSE HEALTH MODE ACTIVATION KEY

latency1 := 150            ; LAG SETTINGS - menu paragon
latency2 := 1            ; LAG SETTINGS - demais clicks
latency3 := 10            ; LAG SETTINGS (controls int in health mode)

; ======================= END THINGS TO EDIT =======================

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
Screen Size = %screenSize%
Damage Hotkey = %activateKeyDamage%
Health Hotkey = %activateKeyHealth%
Lagtency 1 = %latency1%
Lagtency 2 = %latency2%
Lagtency 3 = %latency3%
Não se esqueça de verificar se você selecionou a guia principal antes de iniciar o rift. gg
)

SetDefaultMouseSpeed, 0 ; mouse moves faster

Hotkey, %activateKeyDamage%, Damage ; starts damage script
Hotkey, %activateKeyHealth%, Health ; starts health script

Damage() ; script to change paragon for dealing damage
{
    global int1
    global vit1
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
    Sendinput p
    MouseClick, Left, resetButtonX, resetButtonY
    sendinput, {Ctrl Down}
    
    SetMouseDelay, %latency2%
;    Loop, 4
;    {
        MouseClick, Left, resourceX, resourceY
;    }

    SetMouseDelay, %latency2%
    Loop, %int1%
    {
        MouseClick, Left, mainStatX, mainStatY
    }

    sendinput, {Ctrl Up}
    MouseClick, Left, acceptx, acceptY

    MouseMove, mouseX, mouseY

    return

}

Health() ; script to change paragon for staying alive
{
    global int2
    global vit2
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
    Sendinput p
    MouseClick, Left, resetButtonX, resetButtonY
    sendinput, {Ctrl Down}

    SetMouseDelay, %latency2%
    Loop, 4
    {
        MouseClick, Left, speedX, speedY
    }

    ;SetMouseDelay, %latency3%
    ;Loop, %int2%
    ;{
    ;    MouseClick, Left, mainStatX, mainStatY
    ;}

    SetMouseDelay, %latency2%
    Loop, %vit2%
    {
        MouseClick, Left, vitX, vitY
    }

    sendinput, {Ctrl Up}
    MouseClick, Left, acceptx, acceptY
    
    MouseMove, mouseX, mouseY

    return
}