local({r <- getOption("repos")
       r["CRAN"] <- "http://cran.r-project.org" 
       options(repos=r)
})
install.packages("mclust", requirements=TRUE)
install.packages("dplyr", requirements=TRUE)
install.packages("tidycensus", requirements=TRUE)
install.packages("data.table", requirements=TRUE)
install.packages("clinfun", requirements=TRUE)
install.packages("sf", requirements=TRUE)
install.packages("jsonlite", requirements=TRUE)
