
library(tidyverse)

mammal_sizes<-read.csv("./data/MOMv3.3.txt", stringsAsFactors = FALSE, na.strings = "-999",sep = "\t",header = FALSE)

colnames(mammal_sizes) <- c("continent", "status", "order", 
                            "family", "genus", "species", "log_mass", "combined_mass", 
                            "reference")
mammal_sizes$continent<-toupper(mammal_sizes$continent)

## 2. Calculate the mean mass of the extinct species and the mean mass of the extant species. 
select(mammal_sizes,status,log_mass) %>% 
group_by(status) %>% 
  summarise(mean(log_mass, na.rm=TRUE))

## 3. Repeat the analysis but this time compare the mean masses within each of the different continents
## Export your results to a csv file where the first entry on each line is the continent, the second entry 
## is the average mass of the extant species on that continent, and the third entry is the average mass of 
## the extinct species on that continent

continent_mass_differences<-select(mammal_sizes,status,continent,log_mass) %>% 
  group_by(continent,status) %>% 
  summarise(mean_mass=mean(log_mass, na.rm=TRUE))
continent_mass_differences<-spread(continent_mass_differences,continent,mean_mass)
write.csv(continent_mass_differences,file = "./continent_mass_differences.csv")

group_by()
hist(mammal_sizes$log_mass)
