gada_tabulas_aprekini <- function(z) {

Xq <- z
rm(z)

setwd(paste0(path, "intermediate_tables//tab_", tabula, "//", year, "//gada"))
tabN  <- paste0("k", kopsNr, "t", tabula, "_", year, "_N2", N_komplekts)
load(paste0(tabN, ".RData"))
Xy <- get(tabN)
rm(list = tabN, tabN)

order_vec <- readRDS(paste0(path, "templates_and_vectors//order_N2", N_komplekts, ".rds"))

#Pārnesam datus uz gala tabulu
mergeDF <- merge(Xy, Xq, by = "N", all.x = TRUE)
mergeDF[ , paste0("G", Q)] <- mergeDF$value
mergeDF$AVG_YEAR <- ""
k_year <- mergeDF[match(order_vec, mergeDF$N), colnames(Xy)]
rownames(k_year) <- NULL
rm(Xy, Xq, mergeDF)

if (!sum(k_year$N == order_vec) == nrow(k_year)) {
  if (!sum(k_year$N %in% order_vec) == nrow(k_year)) {
    k_year <- k_year[match(order_vec, k_year), ]
  } else {
    stop("Gada tabulā rindas neatbilst N komplektam:", N_komplekts)
  }
}

cat(paste0(kopsNr, "."), "kopsavilkums", paste0(Q, "."), "ceturkšņa dati", paste0(tabula, "."), "tabulai pārnesti uz gada tabulu. \n
      Tagad aprēķina gada vidējo un ceturkšņa izmaiņas.\n")

#Aprēķina vidējo gadā, pieņemot, ka tabula pildās katru ceturksni

s <- 0
for (i in Q:1) { 
  s <- s + as.double(k_year[, paste0("G", i)])
}

k_year[, paste0("AVG_YEAR")] <- s / as.numeric(Q)
rm(s, i)

#Aprēķina procentuālās atšķirības pret iepriekšējo ceturksni
sk <- k_year[as.numeric(k_year[[paste0("G", Q)]]) != 0, ]
sk1 <- k_year[k_year[[paste0("G", Q)]] == 0, ]

for(i in Q:2) {
  sk[ , paste0("PctChg_Q", i - 1, "vsQ", i)] <- ifelse(as.double(sk[, paste0("G", i - 1)]) == 0,  "", (as.double(sk[, paste0("G", i)]) / as.double(sk[, paste0("G", i - 1)])) * 100 - 100)   
}
sk <- rbind(sk, sk1)  
rm(sk1, i)

k_year <- sk[match(order_vec, sk$N), ]                                                                                                                                             
rm(sk)

#Saglabā starptabulu pilnu
setwd(paste0(path, "intermediate_tables//tab_", tabula, "//", year, "//gada"))
t_name <- paste0("k", kopsNr, "t", tabula, "_", year, "_N2", N_komplekts)
assign(t_name, k_year)
save(list = t_name, file = paste0(t_name, ".RData"))

cat("Aprēķini gada tabulai ar", paste0(kopsNr, "."), "kopsavilkumu", paste0(tabula, "."), "pabeigti. \n
      Fails ar nosaukumu", paste0(t_name, ".RData"), "atrodams:", paste0(path, "intermediate_tables//tab_", tabula, "//", year, "//gada. \n"))

rm(list = t_name, t_name, order_vec)

return(k_year)
}
