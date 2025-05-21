// Bu program kontrol yapıları örneklerini gösterir

baslat
    // If-Else yapısı örneği
    sayi not <- 75

    eger not >= 50 ise
    baslat
        yaz("Dersten geçtiniz!")
        eger not >= 85 ise
        baslat
            yaz("Tebrikler, çok başarılı!")
        bitir
    bitir
    degilse
    baslat
        yaz("Dersten kaldınız.")
    bitir
    
    // For döngüsü örneği
    tekrarla (i <- 1'den 5'a)
    baslat
        sayi kare <- i * i
        yaz("Sayı: ")
        yaz(i)
        yaz(" Karesi: ")
        yaz(kare)
    bitir

    // While döngüsü örneği
    sayi sayac <- 10
    surekli sayac > 0 ise
    baslat
        yaz("Geri sayım: ")
        yaz(sayac)
        sayac <- sayac - 1
    bitir

    // İç içe döngü örneği
    tekrarla (x <- 1'den 3'a)
    baslat
        tekrarla (y <- 1'den 3'a)
        baslat
            yaz("x: ")
            yaz(x)
            yaz(" y: ")
            yaz(y)
        bitir
    bitir
bitir 