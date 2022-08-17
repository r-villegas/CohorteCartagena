# 
# CohorteCartagena
# Análisis descriptivo:
# Cálculo de medidas resumen y creación de tablas y gráficos
#

# Clear existing data and graphics
rm(list=ls())
#graphics.off()

# Working directory
setwd("~/TestDescargaDatos/R")

# Load gmodels library
library(crosstable)
library(flextable)
library(ggplot2)
library(ggridges) # add median as vertical line

# Load data.frame "data"
data <- readRDS(file="Sample_CartagenaCohortStudy_R_2022-08-09_0211.Rda")
head(data)

# Remove subject with missing gender
data <-  subset(data, !is.na(gender))

### TABLAS 

# Table by gender
crosstable(data, c(gender), showNA = "no", 
           total = "both")  %>%
  as_flextable(keep_id=TRUE)

# Summary table of age
crosstable(data, c(age), showNA = "no", 
           total = "both")  %>%
  as_flextable(keep_id=TRUE)

# Summary gender and age
crosstable(data, c(gender, age), showNA = "no", 
           total = "both")  %>%
  as_flextable(keep_id=TRUE)

# Summary table of age by gender
crosstable(data, c(age), showNA = "no",
           total = "both", by=gender) %>%
  as_flextable(keep_id=TRUE)
# Summary table of age by gender with Wilcoxon rank sum test
crosstable(data, c(age), showNA = "no", test = TRUE,
           total = "both", by=gender) %>%
  as_flextable(keep_id=TRUE)
# Summary table of age by gender with Wilcoxon rank sum test
crosstable(data, c(age), showNA = "no", funs=mean, test = TRUE,
           by=gender) %>%
  as_flextable(keep_id=TRUE)


### GRAFICOS

# Histogram of age by gender
ggplot(data, aes(x = age)) +
  geom_histogram(aes(color = gender, fill = gender),
                 position = "identity", bins = 30, alpha = 0.4) +
  ggtitle("Distribución de la edad \n según género") +
  xlab("Edad (años)") + ylab("Frecuencia") + labs(fill = "género") +
  guides(color="none") + #remueve doble leyenda
  theme(plot.title=element_text(hjust=0.5)) #Centrar título

# Histogram of age by gender include density
ggplot(data, aes(x = age)) +
  geom_histogram(aes( y = ..density..,color = gender, 
                 fill = gender),
                 position = "identity", bins = 30, alpha = 0.4) +
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  geom_density()

# Density of age by gender using ridges (show median)
ggplot(data, 
       aes(x = age, y = gender, fill = gender)) +
  stat_density_ridges(quantile_lines = TRUE, alpha = 0.4, quantiles = 2) +
  geom_density_ridges(alpha = 0.1)

  
