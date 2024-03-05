yearlyPrintout <- function(k_year, N_komplekts) {
  #1 Noapaļo gada vidējo līdz pilniem skaitļiem
  k_year$AVG_YEAR <- as.integer(round(k_year$AVG_YEAR, 0))
  
  #2 Noapaļo procentuālās izmaiņas
  for(i in Q:2) { 
    k_year[ , paste0("PctChg_Q", i - 1, "vsQ", i)] <- as.numeric(round(as.numeric(k_year[ , paste0("PctChg_Q", i - 1, "vsQ", i)]), 1))
    k_year[is.na(k_year[ , paste0("PctChg_Q", i - 1, "vsQ", i)]), paste0("PctChg_Q", i - 1, "vsQ", i)] <- ""
  }
  
  # pārvārdo ailes gadam atbilstoši
  colnames(k_year)[colnames(k_year) == "G1"] <- paste0(year, "Q1")
  colnames(k_year)[colnames(k_year) == "G2"] <- paste0(year, "Q2")
  colnames(k_year)[colnames(k_year) == "G3"] <- paste0(year, "Q3")
  colnames(k_year)[colnames(k_year) == "G4"] <- paste0(year, "Q4")
  colnames(k_year)[colnames(k_year) == "AVG_YEAR"] <- paste0("AVG_inY", year)
  
  setwd(paste0(path, "intermediate_tables//tab_", tabula, "//", year, "//gada"))
  t_name <- paste0("gada_k", kopsNr, "t", tabula, "_", year, "_N2_", N_komplekts)
  
  write.table(k_year, file = paste0(t_name, ".csv"), sep = ";", 
              col.names = TRUE, qmethod = "double", row.names = FALSE)
  
  cat("Tika noformēta un izprintēta gada tabula", tabula, paste0("kopsavilkumam ", kopsNr), "ar nosaukumu:", paste0(t_name, ".csv"), "\n
    Tā atrodas mapē:", paste0(path, "intermediate_tables//tab_", tabula, "//", year, "//gada"))
  rm(i, t_name)
}
