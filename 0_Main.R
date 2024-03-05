path <- "..//t207//"
source(paste0(path, "functions//kopsavilkumi_noSVTK.R"))
source(paste0(path, "functions//nace_burti.R"))
source(paste0(path, "functions//nace_TOTAL.R"))
source(paste0(path, "functions//nace_BE.R"))
source(paste0(path, "functions//quaterlyPrintout.R"))
source(paste0(path, "functions//gada_tabulas_izveide.R"))
source(paste0(path, "functions//gada_tabulas_aprekini.R"))
source(paste0(path, "functions//yearlyPrintout.R"))
source(paste0(path, "functions//nace_2z.R"))
source(paste0(path, "functions//kopsavilkumi_noISK.R"))

tabula <- readline(prompt = "Ievadīt tabulu, par kuru kopsavilkumi tiks rēķināti: ")
year <- readline(prompt = paste0("Ievadīt gadu, par kuru veidot ", tabula, ". tabulu: "))
Q <- readline(prompt = paste0("Ievadīt ceturksni, par kuru veidot ", tabula, ". tabulu: "))

# Paņem kopsavilkuma sarakstu
kops <- readRDS("..//templates_and_vectors//kopsavilkumu_vec.rds")

for(n in 1:length(kops)) {
  kopsNr <- substr(kops[n], 3, 4) 

for (Q in 1:3) {
  source(paste0(path, "1_ceturksnis.R"))  
  source("2_gada_t207.R")
}  
}

nace_komplekts <- "LB"
source("..//functions//izstrade//LatvijasBankai.R")
LatvijasBankai()
rm(LatvijasBankai)


rm(nace_komplekts, rinda, tabula, kops, kopsNr, n, path, Q, year)
rm(gada_tabulas_izveide, kopsavilkumi_noSVTK, nace_BE, nace_burti, nace_TOTAL, quaterlyPrintout, gada_tabulas_aprekini, yearlyPrintout, kopsavilkumi_noISK, nace_2z)

   
