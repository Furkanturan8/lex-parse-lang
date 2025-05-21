// Klavyeden basılan tuşlara göre daireyi hareket ettiren program

baslat
    sayi oyuncu_x <- 400
    sayi oyuncu_y <- 300

    eger tus_bekle() == YON_YUKARI ise
    baslat
        oyuncu_y <- oyuncu_y - 5
    bitir

    eger tus_bekle() == YON_ASAGI ise
    baslat
        oyuncu_y <- oyuncu_y + 5
    bitir

    eger tus_bekle() == YON_SOL ise
    baslat
        oyuncu_x <- oyuncu_x - 5
    bitir

    eger tus_bekle() == YON_SAG ise
    baslat
        oyuncu_x <- oyuncu_x + 5
    bitir

    daire(oyuncu_x, oyuncu_y, 5)
bitir