# TurkDraw Programlama Dili

TurkDraw, temel çizim işlemlerini gerçekleştirebilen, Türkçe anahtar kelimeler kullanan özel bir programlama dilidir 

## Dil Tasarımı

### 1. Program Yapısı
Her TurkDraw programı bir ana blok içinde olmalıdır:
```
// Program örneği
baslat
    // kodlar buraya
bitir
```

### 2. Yorum Satırları
```
// Bu bir yorum satırı
```

### 3. Değişken Tanımlama ve Türler
```
baslat
    sayi x <- 5        // tamsayı türü
    ondalik y <- 3.14  // ondalıklı sayı türü
    metin ad <- "test" // metin türü
bitir
```

### 4. Atama İşlemi
```
baslat
    x <- 10           // sayısal değer atama
    mesaj <- "Merhaba" // metin değeri atama
bitir
```

### 5. Operatörler

#### Aritmetik Operatörler
```
+    // toplama
-    // çıkarma
*    // çarpma
/    // bölme
%    // mod
^    // üs alma
```

#### Karşılaştırma Operatörleri
```
==   // eşittir
!=   // eşit değildir
<    // küçüktür
>    // büyüktür
<=   // küçük eşittir
>=   // büyük eşittir
```

#### Mantıksal Operatörler
```
ve   // AND
veya // OR
degil // NOT
```

### 6. Kontrol Yapıları

#### If-Else Yapısı
```
baslat
    eger x > 0 ise
    baslat
        // kodlar
    bitir
    degilse
    baslat
        // kodlar
    bitir
bitir
```

#### Döngüler
```
baslat
    // For döngüsü
    tekrarla (i <- 1'den 10'a)
    baslat
        // kodlar
    bitir

    // While döngüsü
    surekli x > 0 ise
    baslat
        // kodlar
    bitir
bitir
```

### 7. Fonksiyonlar
```
baslat
    // Fonksiyon tanımlama
    fonksiyon topla(a, b)
    baslat
        dondur a + b
    bitir

    // Fonksiyon çağrısı
    sonuc <- topla(5, 3)
bitir
```

### 8. Çizim Komutları
```
baslat
    cizgi(x1, y1, x2, y2)         // iki nokta arasına çizgi çizer
    daire(x, y, yaricap)          // merkezi (x,y) olan daire çizer
    dikdortgen(x, y, gen, yuk)    // sol üst köşesi (x,y) olan dikdörtgen çizer
    ucgen(x1, y1, x2, y2, x3, y3) // verilen üç nokta ile üçgen çizer
    renk(r, g, b)                 // çizim rengini belirler (RGB)
    kalinlik(n)                   // çizgi kalınlığını belirler
bitir
```

### 9. Giriş/Çıkış İşlemleri
```
baslat
    // Klavye girişi
    tus <- tus_bekle()
    eger tus == YON_SAG ise
    baslat
        // sağa hareket
    bitir

    // Ekrana yazı
    yaz("Merhaba Dünya")
bitir
```

## Özel Tuş Sabitleri
```
YON_SAG   // Sağ ok tuşu
YON_SOL   // Sol ok tuşu
YON_YUKARI // Yukarı ok tuşu
YON_ASAGI  // Aşağı ok tuşu
ENTER      // Enter tuşu
BOSLUK     // Boşluk tuşu
ESC        // Escape tuşu
```

## Örnek Program
```
// Hareket eden daire örneği
baslat
    sayi x <- 400
    sayi y <- 300
    
    surekli degil tus_bekle() == ESC ise
    baslat
        daire(x, y, 20)
        tus <- tus_bekle()
        
        eger tus == YON_SAG ise
        baslat
            x <- x + 5
        bitir
    bitir
bitir
``` 