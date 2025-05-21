// Bu program fonksiyon örneklerini gösterir

baslat
    // Toplama fonksiyonu
    fonksiyon topla(a, b)
    baslat
        dondur a + b
    bitir

    // Faktöriyel hesaplama fonksiyonu
    fonksiyon faktoriyel(n)
    baslat
        eger n <= 1 ise
        baslat
            dondur 1
        bitir
        degilse
        baslat
            dondur n * faktoriyel(n - 1)
        bitir
    bitir

    // Daire alanı hesaplama fonksiyonu
    fonksiyon daire_alani(yaricap)
    baslat
        ondalik pi <- 3.14159
        dondur pi * yaricap * yaricap
    bitir

    // Fonksiyonları kullanma
    sayi x <- 5
    sayi y <- 3
    sayi toplam <- topla(x, y)
    yaz("Toplam: ")
    yaz(toplam)

    sayi fakt5 <- faktoriyel(5)
    yaz("5 faktöriyel: ")
    yaz(fakt5)

    ondalik alan <- daire_alani(4)
    yaz("Yarıçapı 4 olan dairenin alanı: ")
    yaz(alan)
bitir 