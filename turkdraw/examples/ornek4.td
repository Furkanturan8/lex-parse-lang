// Bu program klavye ile kontrol edilebilen bir daire çizer

baslat
    // Daire pozisyonu
    sayi x <- 400
    sayi y <- 300
    sayi yaricap <- 20
    sayi hiz <- 5

    // Renk ayarları
    renk(255, 0, 0)  // Kırmızı renk
    kalinlik(2)      // Çizgi kalınlığı

    // Ana döngü
    surekli degil tus_bekle() == ESC ise
    baslat
        // Ekranı temizle
        renk(255, 255, 255)  // Beyaz
        dikdortgen(0, 0, 800, 600)
        
        // Daireyi çiz
        renk(255, 0, 0)  // Kırmızı
        daire(x, y, yaricap)
        
        // Tuş kontrolü
        sayi tus <- tus_bekle()
        
        eger tus == YON_SAG ise
        baslat
            x <- x + hiz
        bitir
        
        eger tus == YON_SOL ise
        baslat
            x <- x - hiz
        bitir
        
        eger tus == YON_YUKARI ise
        baslat
            y <- y - hiz
        bitir
        
        eger tus == YON_ASAGI ise
        baslat
            y <- y + hiz
        bitir
        
        // Ekran sınırlarını kontrol et
        eger x < yaricap ise
        baslat
            x <- yaricap
        bitir
        
        eger x > 800 - yaricap ise
        baslat
            x <- 800 - yaricap
        bitir
        
        eger y < yaricap ise
        baslat
            y <- yaricap
        bitir
        
        eger y > 600 - yaricap ise
        baslat
            y <- 600 - yaricap
        bitir
    bitir
bitir 