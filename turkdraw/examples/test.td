// Bu program fonksiyon ile çizim örneğini gösterir

baslat
    // Oyuncu çizdirme fonksiyonu
    fonksiyon oyuncu_cizdir(x, y)
    baslat
        renk(255, 0, 0)  // Kırmızı renk
        daire(x, y, 5)   // Oyuncuyu temsil eden daire
    bitir

    // Fonksiyonu çağırarak oyuncuyu çiz
    oyuncu_cizdir(10, 10)
bitir
