# TurkDraw Dil Tasarımı ve Çalışma Mantığı

## 1. Genel Bakış

TurkDraw, iki ana bileşenden oluşur:
- Lexer (`lexer.l`): Kaynak kodu token'lara ayırır
- Parser (`parser.y`): Token'ları kullanarak sözdizimsel analiz yapar

## 2. Lexer (lexer.l)

### 2.1 Lexer'ın Çalışma Prensibi

Lexer, kaynak kodu karakter karakter okuyarak anlamlı token'lara dönüştürür. Bu işlem şu adımlarla gerçekleşir:

1. **Karakter Okuma**: Kaynak kod dosyasından karakterler okunur
2. **Pattern Eşleştirme**: Okunan karakterler, tanımlı kalıplarla (pattern) eşleştirilir
3. **Token Üretme**: Eşleşen kalıplar için uygun token'lar üretilir

### 2.2 Lexer Bileşenleri

```c
/* Tanımlamalar Bölümü */
%{
#include "parser.tab.h"  // Parser ile iletişim için gerekli
%}

/* Kural Tanımlamaları */
SAYI    [0-9]+
ONDALIK [0-9]+\.[0-9]+
METIN   \"[^\"]*\"

%%
/* Token Kuralları */
"baslat"    { return BASLAT; }
"bitir"     { return BITIR; }
{SAYI}      { yylval.sayi = atoi(yytext); return SAYI; }
{ONDALIK}   { yylval.ondalik = atof(yytext); return ONDALIK; }
%%
```

## 3. Parser (parser.y)

### 3.1 Parser'ın Çalışma Prensibi

Parser, lexer'dan gelen token'ları kullanarak sözdizimsel analiz yapar ve Abstract Syntax Tree (AST) oluşturur. İşlem adımları:

1. **Token Alımı**: Lexer'dan token'lar alınır
2. **Gramer Kuralları Uygulanması**: Token'lar gramer kurallarıyla eşleştirilir

Eşleşen kurala göre analiz edilip hata var mı yok mu kontrol edilir.
### 3.2 Parser Bileşenleri

```c
/* Tanımlamalar */
%{
#include <stdio.h>
%}

/* Token Tanımlamaları */
%token BASLAT BITIR
%token <sayi> SAYI
%token <ondalik> ONDALIK

/* Tip Tanımlamaları */
%union {
    int sayi;
    double ondalik;
    char* metin;
}

/* Gramer Kuralları */
%%
program: BASLAT komutlar BITIR
       ;

komutlar: komut
        | komutlar komut
        ;

komut: cizim_komutu
     | kontrol_yapisi
     | atama
     ;
%%
```

## 4. Dil İşleyiş Akışı

1. **Kaynak Kod** → **Lexer**
   - Örnek: `baslat daire(50) bitir`
   - Lexer bu kodu token'lara ayırır: `BASLAT`, `DAIRE`, `SAYI(50)`, `BITIR`

2. **Lexer** → **Parser**
   - Parser token'ları alır ve gramer kurallarına göre analiz eder
   - AST oluşturulur:
   ```
   program
     ├── BASLAT
     ├── komut
     │   └── cizim_komutu
     │       ├── DAIRE
     │       └── SAYI(50)
     └── BITIR
   ```

3. **Parser** → **Çalıştırma**
   - AST yorumlanır ve çizim komutları işlenir
   - Grafik kütüphanesi kullanılarak çizimler yapılır

## 5. Önemli Dil Özellikleri

### 5.1 Sözdizimi Özellikleri
- Blok yapısı: `baslat` ve `bitir` anahtar kelimeleri ile
- Türkçe anahtar kelimeler
- Basit ve anlaşılır sözdizimi

### 5.2 Veri Tipleri ve İşlemler
- Sayısal: `sayi`, `ondalik`
- Metin: `metin`
- Çizim komutları: `daire`, `cizgi`, `dikdortgen`, `ucgen`
- Kontrol yapıları: `eger`, `degilse`, `dongu`

### 5.3 Hata Yönetimi
- Sözdizimi hataları parser tarafından yakalanır
- Çalışma zamanı hataları için özel hata mesajları
- Türkçe hata bildirimleri

## 6. Örnek Program Analizi

```
baslat
    not x <- 88
    eger x > 50 ise
        baslat
            yaz("Tebrikler, çok dersi geçtiniz!!")
        bitir
    degilse
        baslat
            yaz("Üzgünüm, dersten kaldınız!")
        bitir
bitir
```

Bu programın işlenme adımları:
1. Lexer token'ları üretir
2. Parser sözdizimsel analiz yapar
3. Değişken `x` oluşturulur ve değer atanır
4. Komutlar sırasıyla işlenir.
5. Koşul ifadesi değerlendirilir ve uygun ifade "yaz" ile print edilir.

---
