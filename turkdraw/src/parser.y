%{
#include <stdio.h>
#include <stdlib.h>

extern int satir_no;
extern char* yytext;
void yyerror(const char* s);
int yylex(void);
%}

/* tip tanımlamaları */
%union {
    int sayi;
    double ondalik;
    char* metin;
}

/* Token tanımlamaları */
%token SAYI_TIP ONDALIK_TIP METIN_TIP
%token BASLAT BITIR
%token EGER ISE DEGILSE
%token TEKRARLA SUREKLI DEN A
%token FONKSIYON DONDUR
%token VE VEYA DEGIL
%token CIZGI DAIRE DIKDORTGEN UCGEN RENK KALINLIK
%token TUS_BEKLE YAZ
%token YON_SAG YON_SOL YON_YUKARI YON_ASAGI ENTER BOSLUK_TUS ESC
%token ATAMA ESITTIR ESIT_DEGILDIR KUCUK_ESIT BUYUK_ESIT KUCUKTUR BUYUKTUR
%token ARTI EKSI CARPI BOLU MOD US
%token ACPARANTEZ KAPPARANTEZ VIRGUL
%token <sayi> TAMSAYI
%token <ondalik> ONDALIKLI
%token <metin> TANIMLAYICI METIN

/* Öncelik ve birleşme yönü tanımlamaları */
%left VE VEYA
%left ESITTIR ESIT_DEGILDIR
%left KUCUKTUR BUYUKTUR KUCUK_ESIT BUYUK_ESIT
%left ARTI EKSI
%left CARPI BOLU MOD
%right US
%right DEGIL

/* Başlangıç sembolü */
%start program

%%

program     : BASLAT komutlar BITIR
            ;

komutlar    : /* boş */
            | komutlar komut
            ;

komut       : degisken_tanimi
            | atama
            | kontrol_yapisi
            | dongu
            | fonksiyon_tanimi
            | fonksiyon_cagrisi
            | cizim_komutu
            | giris_cikis
            | dondur_ifadesi
            | blok
            ;

blok        : BASLAT komutlar BITIR
            ;

degisken_tanimi : SAYI_TIP TANIMLAYICI ATAMA ifade
                | ONDALIK_TIP TANIMLAYICI ATAMA ifade
                | METIN_TIP TANIMLAYICI ATAMA METIN
                ;

atama       : TANIMLAYICI ATAMA ifade
            | TANIMLAYICI ATAMA METIN
            ;

kontrol_yapisi : EGER kosul ISE blok
               | EGER kosul ISE blok DEGILSE blok
               ;

dongu       : TEKRARLA ACPARANTEZ TANIMLAYICI ATAMA ifade DEN ifade A KAPPARANTEZ blok
            | SUREKLI kosul ISE blok
            ;

fonksiyon_tanimi : FONKSIYON TANIMLAYICI ACPARANTEZ parametreler KAPPARANTEZ blok
                 ;

dondur_ifadesi : DONDUR ifade
               ;

parametreler : /* boş */
             | TANIMLAYICI
             | parametreler VIRGUL TANIMLAYICI
             ;

fonksiyon_cagrisi : TANIMLAYICI ACPARANTEZ argumanlar KAPPARANTEZ
                  | TUS_BEKLE ACPARANTEZ KAPPARANTEZ
                  ;

argumanlar  : /* boş */
            | ifade
            | argumanlar VIRGUL ifade
            ;

cizim_komutu : CIZGI ACPARANTEZ ifade VIRGUL ifade VIRGUL ifade VIRGUL ifade KAPPARANTEZ
             | DAIRE ACPARANTEZ ifade VIRGUL ifade VIRGUL ifade KAPPARANTEZ
             | DIKDORTGEN ACPARANTEZ ifade VIRGUL ifade VIRGUL ifade VIRGUL ifade KAPPARANTEZ
             | UCGEN ACPARANTEZ ifade VIRGUL ifade VIRGUL ifade VIRGUL ifade VIRGUL ifade VIRGUL ifade KAPPARANTEZ
             | RENK ACPARANTEZ ifade VIRGUL ifade VIRGUL ifade KAPPARANTEZ
             | KALINLIK ACPARANTEZ ifade KAPPARANTEZ
             ;

giris_cikis : YAZ ACPARANTEZ METIN KAPPARANTEZ
            | YAZ ACPARANTEZ ifade KAPPARANTEZ
            ;

kosul       : ifade ESITTIR ifade
            | ifade ESIT_DEGILDIR ifade
            | ifade KUCUKTUR ifade
            | ifade BUYUKTUR ifade
            | ifade KUCUK_ESIT ifade
            | ifade BUYUK_ESIT ifade
            | DEGIL kosul
            | kosul VE kosul
            | kosul VEYA kosul
            | ACPARANTEZ kosul KAPPARANTEZ
            ;

ifade       : TAMSAYI
            | ONDALIKLI
            | TANIMLAYICI
            | YON_SAG
            | YON_SOL
            | YON_YUKARI
            | YON_ASAGI
            | ENTER
            | BOSLUK_TUS
            | ESC
            | ifade ARTI ifade
            | ifade EKSI ifade
            | ifade CARPI ifade
            | ifade BOLU ifade
            | ifade MOD ifade
            | ifade US ifade
            | ACPARANTEZ ifade KAPPARANTEZ
            | fonksiyon_cagrisi
            ;

%%

void yyerror(const char* s) {
    fprintf(stderr, "Hata: %s (Satır: %d, Token: '%s')\n", s, satir_no, yytext);
} 