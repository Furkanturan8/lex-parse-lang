#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE* yyin;
extern int yyparse(void);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Kullanım: %s <dosya_adi>\n", argv[0]);
        return 1;
    }

    FILE *dosya = fopen(argv[1], "r");
    if (!dosya) {
        fprintf(stderr, "Hata: '%s' dosyası açılamadı\n", argv[1]);
        return 1;
    }

    printf("'%s' dosyası ayrıştırılıyor...\n", argv[1]);

    // Dosyayı lexer'a yönlendir
    yyin = dosya;

    // Ayrıştırmayı başlatır
    int sonuc = yyparse();

    fclose(dosya);

    if (sonuc == 0) {
        printf("[Başarılı] Kod gramer kurallarına uygundur.\n");
        return 0;
    } else {
        printf("[Başarısız] Kod gramer kurallarına uygun değildir.\n");
        return 1;
    }
} 