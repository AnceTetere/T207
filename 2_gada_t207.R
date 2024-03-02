n_komplekts <- "full"

setwd(paste0(path, "intermediate_tables//", year, "//ceturksni"))
file_name <- paste0("k", kopsNr, "t207_", year, "Q", Q, "_n2", n_komplekts)
load(paste0(file_name, ".RData"))
z <- get(file_name)
rm(list = file_name, file_name)


if (Q == 1) {
  k_year <- gada_t_izveide(z)
} else if (Q == 2 || Q == 3 || Q == 4) {
  n_komplekts <- "full"
  gada_t_aprekini(z)
} else {
  stop("Neatpazīts ceturksnis")
}
    
  # Noformē un izprintē .csv  
    yearlyPrintout(k_year)
    
    rm(k_year, t207_name)
