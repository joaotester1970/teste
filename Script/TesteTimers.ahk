
Global habilitadeAutomatica1Estado, habilitadeAutomatica1Estado := 1

Hotkey, F2, habilidadeAutomatica1

habilidadeAutomatica1()
{

    if habilitadeAutomatica1Estado = 1
    {
        SetTimer, habilidade1, 1000
        SetTimer, habilidade2, 2000

    }
    else
    {
        SetTimer, habilidade1, Off
        SetTimer, habilidade2, Off
    }
    habilitadeAutomatica1Estado := habilitadeAutomatica1Estado * -1
    

}

habilidade1()
{
    SendInput, Tempo1`n
}

habilidade2()
{
    SendInput, Tempo2`n
}