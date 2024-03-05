kopsavilkumi_noISK <- function(x) {

ISK_vec = switch(   
  as.character(kopsNr),   
  "50" = isk_komplekts50,
  "51"= isk_komplekts51,   
  "58"= isk_komplekts58,
  "83" = isk_komplekts83,
  "85" = isk_komplekts85,
  "86" = isk_komplekts86,
  default = {print("Kopsavilkuma numurs nav atpazīts."); character()}   
)

#1 No x izveido apakštabulu tikai ar nepieciešamajām ailēm.
  x <- x[x$ISK != "", c("B2z", rinda, "ISK")]
  
  BIND_vec <- character(0)
  
  for (i in 1:length(ISK_vec)) {
    if (sum(x$ISK == ISK_vec[i]) == 0) {
      print(paste0("Datnē nav ", ISK_vec[i]))
    } else if (sum(x$ISK == ISK_vec[i]) > 0) {
      tab_name <- paste0("x", i)
      BIND_vec <- c(BIND_vec, list(tab_name))
      assign(tab_name, x[x$ISK == ISK_vec[i], c("B2z", rinda, "ISK")])
        rm(tab_name)
      } else {
        stop("Kaut kas ar ISK kodiem nav kārtībā.")
      }
    }
  
#2 ISK apakštabulas savieno
  y <- x[0,]
  
  for (i in BIND_vec) {
    y <- rbind(y, get(i))
    rm(list = i)
  }      
  
  rownames(y) <- NULL
  rm(BIND_vec, i, ISK_vec)

  return(nace_2z(y))
  rm(y)
}
