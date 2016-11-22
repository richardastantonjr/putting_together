

mammal_sizes<-read.csv("./data/MOMv3.3.txt", stringsAsFactors = FALSE, na.strings = "-999",sep = "\t",header = FALSE)

colnames(mammal_sizes) <- c("continent", "status", "order", 
                            "family", "genus", "species", "log_mass", "combined_mass", 
                            "reference")

