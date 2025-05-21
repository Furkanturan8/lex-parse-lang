/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     SAYI_TIP = 258,
     ONDALIK_TIP = 259,
     METIN_TIP = 260,
     BASLAT = 261,
     BITIR = 262,
     EGER = 263,
     ISE = 264,
     DEGILSE = 265,
     TEKRARLA = 266,
     SUREKLI = 267,
     DEN = 268,
     A = 269,
     FONKSIYON = 270,
     DONDUR = 271,
     VE = 272,
     VEYA = 273,
     DEGIL = 274,
     CIZGI = 275,
     DAIRE = 276,
     DIKDORTGEN = 277,
     UCGEN = 278,
     RENK = 279,
     KALINLIK = 280,
     TUS_BEKLE = 281,
     YAZ = 282,
     YON_SAG = 283,
     YON_SOL = 284,
     YON_YUKARI = 285,
     YON_ASAGI = 286,
     ENTER = 287,
     BOSLUK_TUS = 288,
     ESC = 289,
     ATAMA = 290,
     ESITTIR = 291,
     ESIT_DEGILDIR = 292,
     KUCUK_ESIT = 293,
     BUYUK_ESIT = 294,
     KUCUKTUR = 295,
     BUYUKTUR = 296,
     ARTI = 297,
     EKSI = 298,
     CARPI = 299,
     BOLU = 300,
     MOD = 301,
     US = 302,
     ACPARANTEZ = 303,
     KAPPARANTEZ = 304,
     VIRGUL = 305,
     TAMSAYI = 306,
     ONDALIKLI = 307,
     TANIMLAYICI = 308,
     METIN = 309
   };
#endif
/* Tokens.  */
#define SAYI_TIP 258
#define ONDALIK_TIP 259
#define METIN_TIP 260
#define BASLAT 261
#define BITIR 262
#define EGER 263
#define ISE 264
#define DEGILSE 265
#define TEKRARLA 266
#define SUREKLI 267
#define DEN 268
#define A 269
#define FONKSIYON 270
#define DONDUR 271
#define VE 272
#define VEYA 273
#define DEGIL 274
#define CIZGI 275
#define DAIRE 276
#define DIKDORTGEN 277
#define UCGEN 278
#define RENK 279
#define KALINLIK 280
#define TUS_BEKLE 281
#define YAZ 282
#define YON_SAG 283
#define YON_SOL 284
#define YON_YUKARI 285
#define YON_ASAGI 286
#define ENTER 287
#define BOSLUK_TUS 288
#define ESC 289
#define ATAMA 290
#define ESITTIR 291
#define ESIT_DEGILDIR 292
#define KUCUK_ESIT 293
#define BUYUK_ESIT 294
#define KUCUKTUR 295
#define BUYUKTUR 296
#define ARTI 297
#define EKSI 298
#define CARPI 299
#define BOLU 300
#define MOD 301
#define US 302
#define ACPARANTEZ 303
#define KAPPARANTEZ 304
#define VIRGUL 305
#define TAMSAYI 306
#define ONDALIKLI 307
#define TANIMLAYICI 308
#define METIN 309




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 11 "src/parser.y"
{
    int sayi;
    double ondalik;
    char* metin;
}
/* Line 1529 of yacc.c.  */
#line 163 "parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

