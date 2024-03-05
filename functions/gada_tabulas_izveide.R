gada_tabulas_izveide <- function(z) {

  k_year <- data.frame(N = z$N,
                       G1 = z$value,
                       G2 = rep("", length(nrow(z))),
                       G3 = rep("", length(nrow(z))),
                       G4 = rep("", length(nrow(z))),
                       AVG_YEAR = z$value,
                       PctChg_Q1vsQ2 = rep("", length(nrow(z))),
                       PctChg_Q2vsQ3 = rep("", length(nrow(z))),
                       PctChg_Q3vsQ4 = rep("", length(nrow(z))))
  
  rm(z)
  
  order_vec <- readRDS(paste0(path, "templates_and_vectors//order_N2", N_komplekts, ".rds"))
  if (!sum(k_year$N == order_vec) == nrow(k_year)) {
    if (!sum(k_year$N %in% order_vec) == nrow(k_year)) {
      k_year <- k_year[match(order_vec, k_year), ]
    } else {
      stop("Gada tabulā rindas neatbilst N komplektam:", N_komplekts)
    }
  }
  
  mape <- paste0(path, "intermediate_tables//tab_", tabula, "//", year, "//gada")
  if (!file.exists(mape)) {dir.create(mape)}
  
  setwd(mape)
  t_name <- paste0("k", kopsNr, "t", tabula, "_", year, "_N2", N_komplekts)
  assign(t_name, k_year)
  save(list = t_name, file = paste0(t_name, ".RData"))
    
  return(k_year)
  rm(list = t_name, k_year, t_name, order_vec, mape)
}
