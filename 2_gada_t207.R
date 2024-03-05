N_komplekts <- "full"

setwd(paste0(path, "intermediate_tables//tab_", tabula, "//", year, "//ceturksni"))
file_name <- paste0("k", kopsNr, "t", tabula, "_", year, "Q", Q, "_N2", N_komplekts)
load(paste0(file_name, ".RData"))
z <- get(file_name)
rm(list = file_name, file_name)

if (Q == 1) {
  k_year <- gada_tabulas_izveide(z)
} else if (Q == 2 || Q == 3 || Q == 4) {
  N_komplekts <- "full"
  k_year <- gada_tabulas_aprekini(z)
} else {
  stop("Neatpazīts ceturksnis")
}
    
  # Noformē un izprintē .csv full komplekts ir obligātais.   
    yearlyPrintout(k_year, "full")
    rm(k_year, z)
