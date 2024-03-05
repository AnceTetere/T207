N_2z <- function(y) {

#1 Tabulās, kuras rēķinās gan no KSVT, gan ISK kodiem vērtības uz N 2 zīmēs rēķinās identiski
if(kopsNr == "01" || kopsNr == "23" || kopsNr == "24"|| kopsNr == "50" || kopsNr == "85") {
  u_B2z <- unique(y$B2z)
  
#2 Izveido tukšu datu tabulu ar N burtiem 2 zīmēs
z <- data.frame(setNames(list(sort(u_B2z), rep("", length(u_B2z))),
                           c("N", rinda)), stringsAsFactors = FALSE)
  
#3 Sarēķini rindas vērtības
for (i in 1:length(u_B2z)) {
  z[z$N == u_B2z[i], rinda] <- sum(y[y$B2z == u_B2z[i], rinda])
  }
rm(y, u_B2z, i)
}

#4 Citreiz, KSVT vai ISK kodi iztrūkst un burti paliek tukši, tāpēc šeit uzspiežu viņam pilnu N2z standartu.
standard_N2z <- readRDS(paste0(path, "templates_and_vectors//standard_N2z.rds"))
xs <- data.frame(N = standard_N2z)

X_n2z <- merge(xs, z, by = "N", all.x = TRUE)
rm(xs, z, standard_N2z)

X_n2z[is.na(X_n2z[ , rinda]), rinda] <- 0

return(X_n2z)
}
