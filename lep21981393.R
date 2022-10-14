library(readr)
library(tidyverse)
library(httr)
library(janitor)
library(stringr)

# IMPORTAR DATASET --------------------------------------------------------


dataset <- read_csv("coches-de-segunda-mano-sample.csv")
View(dataset)

janitor::clean_names(dataset) %>%  glimpse()
locale()
dataset  %>%  clean_names()  %>% type_convert(locale= locale(decimal_mark= ",")) %>%  glimpse()
dataset  %>%  clean_names()  %>% type_convert(locale= locale(grouping_mark = ".")) %>%  glimpse()


# CREAR LA COLUMNA --------------------------------------------------------
df <- dataset   %>%  mutate(europeo=! make %in% c("FORD", "LAND ROVER", "HONDA", "NISSAN", "MITSUBISHI", "CHEVROLET"))
df  %>% select(make, province, price)  %>% drop_na()   %>% group_by(province, make)  %>% summarise(mean(price))  %>% view()


