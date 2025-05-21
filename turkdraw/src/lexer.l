%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"

int satir_no = 1;
%}

/* Tanımlamalar */
SAYI        [0-9]+
ONDALIK     [0-9]+\.[0-9]+
HARF        [a-zA-Z_ğüşıöçĞÜŞİÖÇ]
KELIME      {HARF}({HARF}|[0-9])*
BOSLUK      [ \t\r]+
YORUM       "//".*


/* Token kuralları */
%%

{BOSLUK}    { /* Boşlukları atla */ }
\n          { satir_no++; }
{YORUM}     { /* Yorumları atla */ }

"sayi"      { return SAYI_TIP; }
"ondalik"   { return ONDALIK_TIP; }
"metin"     { return METIN_TIP; }

"baslat"    { return BASLAT; }
"bitir"     { return BITIR; }

"eger"      { return EGER; }
"ise"       { return ISE; }
"degilse"   { return DEGILSE; }

"tekrarla"  { return TEKRARLA; }
"surekli"   { return SUREKLI; }
"'den"      { return DEN; }
"'a"        { return A; }

"fonksiyon" { return FONKSIYON; }
"dondur"    { return DONDUR; }

"ve"        { return VE; }
"veya"      { return VEYA; }
"degil"     { return DEGIL; }

"cizgi"     { return CIZGI; }
"daire"     { return DAIRE; }
"dikdortgen" { return DIKDORTGEN; }
"ucgen"     { return UCGEN; }
"renk"      { return RENK; }
"kalinlik"  { return KALINLIK; }

"tus_bekle" { return TUS_BEKLE; }
"yaz"       { return YAZ; }

"YON_SAG"   { return YON_SAG; }
"YON_SOL"   { return YON_SOL; }
"YON_YUKARI" { return YON_YUKARI; }
"YON_ASAGI" { return YON_ASAGI; }
"ENTER"     { return ENTER; }
"BOSLUK"    { return BOSLUK_TUS; }
"ESC"       { return ESC; }

"<-"        { return ATAMA; }
"=="        { return ESITTIR; }
"!="        { return ESIT_DEGILDIR; }
"<="        { return KUCUK_ESIT; }
">="        { return BUYUK_ESIT; }
"<"         { return KUCUKTUR; }
">"         { return BUYUKTUR; }

"+"         { return ARTI; }
"-"         { return EKSI; }
"*"         { return CARPI; }
"/"         { return BOLU; }
"%"         { return MOD; }
"^"         { return US; }

"("         { return ACPARANTEZ; }
")"         { return KAPPARANTEZ; }
","         { return VIRGUL; }

{SAYI}      { yylval.sayi = atoi(yytext); return TAMSAYI; }
{ONDALIK}   { yylval.ondalik = atof(yytext); return ONDALIKLI; }
{KELIME}    { yylval.metin = strdup(yytext); return TANIMLAYICI; }
\"[^\"]*\"  { yylval.metin = strdup(yytext); return METIN; }

.           { printf("Hata: Tanımlanamayan karakter '%s' (Satır: %d)\n", yytext, satir_no); }

%%

int yywrap() {
    return 1;
} 