#--------------- T207: N2z

#1 Ielādē ADV ceturksni Q - šis solis sakrīt visiem t
source(paste0("..//ADV_inputDF//Faila_ielade.R"))

#2 No ADV datnes izveido N_zīmju aili ar nosaukumu B2z
x$N2z[nchar(x$N2z) == 1] <- paste0("0", as.character(x$N2z[nchar(x$N2z) == 1]))
x$B2z <- paste0(x$burts, x$N2z)

## TE IET CASE SELECT
# UZRAKSTI PAREIZI, BET DOMA IR TĀDA, JA KOPS 23 <- TAD ŠAJĀ VIETĀ IZMANTO 23 SCRIPTU, JA 01, TAD 01 utt

if(kopNr == "01" || kopNr == "23"|| kopNr == "24") {
  X_n2z <-kops_noKSVT(x)

  } else if (kopNr == "50" || kopNr == "85") {
  source(paste0(base_path, "r-kods//kops50_85.R"))
}

# Sarēķina x1141 vērtības burtos
X_NBurti <- N_burti(X_n2z)
X_TOTAL <- N_TOTAL(X_NBurti) #X_n2z - tabula X ar N 2. zīmēs. Apstrādātā izejas tabula x pārtop par tX, kur apstrāde notikusi uz N 2-ās zīmēs
X_nBE <- N_BE(X_NBurti)      #X_nBE - tabula X, kas nes N sarēķinātos BE

# Ceturksnis t207, kas tālāk pēc vajadzības piemērojams attiecīgiem komplektiem
X <- rbind(X_TOTAL, X_nBE, X_NBurti, X_n2z)
rm(X_TOTAL, X_nBE, X_NBurti, X_n2z)


# Sākotnēji saglabājam tikai divus izejas formātus, no kuriem pārējie var tik pielāgoti
#Saglabā pilno N koplektu, ka sevī apvieno TOTAL, B-E, N burtus un N 2-vās zīmēs

# sekojošais ir uzlikts kā default funkcijai quaterlyPrintout un vajadzētu darboties bez
# order_N2full <- readRDS(paste0(path, "templates_and_vectors//order_N2full.rds")) 
N_komplekts <- "full"
quaterlyPrintout(X, N_komplekts)
rm(N_komplekts)

#Saglabā kops t207 burtos, kas sevī apvieno TOTAL un N burtos.
N_komplekts <- "burti"
quaterlyPrintout(X, N_komplekts)
rm(N_komplekts)
