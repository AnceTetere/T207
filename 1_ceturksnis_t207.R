    #--------------- Tabula 207: N 2-zīmēs

#1 Ielādē ADV ceturksni Q - šis solis sakrīt ar t911
source(paste0("..//ADV_inputDF//Faila_ielade.R"))

#2 No ADV datnes izveido N zīmju aili ar nosaukumu B2z (kā Burts un 2 zīmes)
x$N2z[nchar(x$N2z) == 1] <- paste0("0", as.character(x$N2z[nchar(x$N2z) == 1]))
x$B2z <- paste0(x$burts, x$N2z)

#3 Izejot no tabulas numura, definē datu rindu.

rinda <- switch (tabula,
  "207" = "X1441",
  "208" = "X1442",
  "911" = "X401"
)

if(kopsNr == "01" || kopsNr == "23"|| kopsNr == "24") {
  X_n2z <- kopsavilkumi_noSVTK(x)
  } else if (kopsNr == "50" || kopsNr == "85") {
    X_n2z <- kopsavilkumi_noISK(x)
    } else {
      stop("Neatpazīts kopsavilkuma numurs.")
      }

# Sarēķinām vērtības burtos
X_NBurti <- N_burti(X_n2z)
X_TOTAL <- N_TOTAL(X_NBurti) #X_n2z - tabula X ar N 2. zīmēs. Apstrādātā izejas tabula x pārtop par tabulu X, kur apstrāde notikusi uz N 2-ās zīmēs
X_nBE <- N_BE(X_NBurti)      #X_nBE - tabula X, kas nes N sarēķinātos BE

# Ceturksnis tabulai, kas tālāk pēc vajadzības piemērojams attiecīgiem komplektiem
X <- rbind(X_TOTAL, X_nBE, X_NBurti, X_n2z)
rm(X_TOTAL, X_nBE, X_NBurti, X_n2z)


# Sākotnēji saglabājam tikai divus izejas formātus, no kuriem pārējie var tik pielāgoti
#Saglabā pilno N koplektu, ka sevī apvieno TOTAL, B-E, N burtus un N 2-vās zīmēs

# sekojošais ir uzlikts kā default funkcijai quaterlyPrintout un vajadzētu darboties bez
# order_N2full <- readRDS(paste0(path, "templates_and_vectors//order_N2full.rds")) 
N_komplekts <- "full"
quaterlyPrintout(X, N_komplekts)
rm(N_komplekts)

#Saglabā kopsavilkuma tabulu 207 burtos, kas sevī apvieno TOTAL un N burtos.
N_komplekts <- "burti"
quaterlyPrintout(X, N_komplekts)
rm(N_komplekts, x, X)
