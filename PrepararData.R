#
# CohorteCartagena
# - Elegir algunas variables del dataset
# - Recodificar missing con NA
# - Convertir variables "string" a "numericas" (ej: peso y talla)
# - Convertir decimales con comas a punto

# Clear existing data and graphics
rm(list=ls())
graphics.off()

# Working directory
setwd("~/VGL/Gustavo/ProyectoCOLCIENCIAS/Cuestionarios/TestDescargaDatos/R")

# Librerías en uso
library(data.table) # funcion setkey y setDT

# Load data.frame "data"
Cohorte_Car <- readRDS(file="CartagenaCohortStudy_R_2022-08-09_0211.Rda")

# Seleccion de algunas variables
sample_Car <- Cohorte_Car[c("study_id","redcap_repeat_instrument",
                            "age","gender.factor","escolaridad.factor",
                            "hta_p.factor","ecv_p.factor",
                            "dm2_p.factor","con_alc_op.factor",  
                            "asma_v2.factor","af_int_libre.factor",
                            "peso","talla","placas_atero.factor")]

# Asignar código NA al código missing de la columna "instrument"
sample_Car$redcap_repeat_instrument[sample_Car$redcap_repeat_instrument==""] <- NA
head(sample_Car)

# Convertir variable "string" a "numérica"
# Convertir decimales con coma a punto
sample_Car$pesoKg <- as.numeric(sub(',', '.', sample_Car$peso, fixed = TRUE))
sample_Car$tallaCm <- as.numeric(sub(',', '.', sample_Car$talla, fixed = TRUE))

# Creacion numero paciente como numero correlativo
sample_Car$paciente <- as.factor(sample_Car$study_id)
levels(sample_Car$paciente) <- 1:length(levels(sample_Car$paciente))

# Colapsar base de datos para dejar 1 registro por paciente
setkey(setDT(sample_Car), paciente)
sample_Car2 <- setDT(sample_Car)[,
                                 .(age           = mean(as.numeric(age), na.rm=TRUE),
                                   gender        = first(gender.factor),
                                   escolaridad   = first(escolaridad.factor),
                                   hta_p         = first(hta_p.factor),
                                   ecv_p         = first(ecv_p.factor),
                                   dm2_p         = first(dm2_p.factor),
                                   con_alc_op    = first(con_alc_op.factor),
                                   asma_v2       = first(asma_v2.factor),
                                   af_int_libre  = first(af_int_libre.factor),
                                   pesoKg        = mean(pesoKg, na.rm=TRUE),
                                   tallaCm       = mean(tallaCm, na.rm=TRUE),
                                   placas_atero  = first(placas_atero.factor)),
                                 by = paciente]
# Contar numero variables missing
sample_Car2$missing_col <- rowSums(is.na(sample_Car2))
table(sample_Car2$missing_col)

# Remover pacientes que tienen mas de 10 columnas con dato missing
sample_Car3 <- sample_Car2[!rowSums(is.na(sample_Car2)) > 10, ]

# Guardar data "sample_Car3" como objeto R
saveRDS(sample_Car3, file="Sample_CartagenaCohortStudy_R_2022-08-09_0211.Rda")
