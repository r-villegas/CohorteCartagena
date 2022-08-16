#Clear existing data and graphics
rm(list=ls())
graphics.off()

# Working directory
setwd("~/VGL/Gustavo/ProyectoCOLCIENCIAS/Cuestionarios/TestDescargaDatos/R")

# Load gmodels library
library(gmodels)
library(crosstable)
library(flextable)
library(ggplot2)
library(ggridges)

# Load data.frame "data"
data <- readRDS(file="CartagenaCohortStudy_R_2022-08-09_0211.Rda")

# Remove subject with missing gender
data <-  subset(data, !is.na(gender.factor))

# Table by gender
crosstable(data, c(gender.factor), showNA = "no", 
           total = "both")  %>%
  as_flextable(keep_id=TRUE)
# Summary table of age
crosstable(data, c(age), showNA = "no", 
           total = "both")  %>%
  as_flextable(keep_id=TRUE)
# Summary gender and age
crosstable(data, c(gender.factor, age), showNA = "no", 
           total = "both")  %>%
  as_flextable(keep_id=TRUE)
# Summary table of age by gender
crosstable(data, c(age), showNA = "no",
           total = "both", by=gender.factor) %>%
  as_flextable(keep_id=TRUE)
# Summary table of age by gender with Wilcoxon rank sum test
crosstable(data, c(age), showNA = "no", test = TRUE,
           total = "both", by=gender.factor) %>%
  as_flextable(keep_id=TRUE)
# Summary table of age by gender with Wilcoxon rank sum test
crosstable(data, c(age), showNA = "no", funs=mean, test = TRUE,
           by=gender.factor) %>%
  as_flextable(keep_id=TRUE)

# Histogram of age by gender
ggplot(data, aes(x = age)) +
  geom_histogram(aes(color = gender.factor, 
                      fill = gender.factor),
                 position = "identity", bins = 30, alpha = 0.4) +
  scale_color_manual(values = c("#00AFBB", "#E7B800"))

# Histogram of age by gender include density
ggplot(data, aes(x = age)) +
  geom_histogram(aes( y = ..density..,color = gender.factor, 
                 fill = gender.factor),
                 position = "identity", bins = 30, alpha = 0.4) +
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  geom_density()

# Density of age by gender using ridges (show median)
ggplot(data, 
       aes(x = age, y = gender.factor, fill = gender.factor)) +
  stat_density_ridges(quantile_lines = TRUE, alpha = 0.4, quantiles = 2)
  #geom_density_ridges(alpha = 0.5)

  