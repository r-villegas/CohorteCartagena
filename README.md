# Cohorte Cartagena

Repositorio con scripts en R para la importación y análisis preliminar de los datos de la Cohorte Cartagena.

Ejemplos:

1. **CartagenaCohortStudy_R_2022-08-09_0211.R**: Lectura del archivo de datos .csv creado a partir de REDCap y creación del objeto (dataframe) "CartagenaCohortStudy_R_2022-08-09_0211.Rda".
2. **PrepararData.R**: permite elegir algunas variables de los instrumentos, recodificar missing con NA, convertir variables "string" a "numéricas" (ej. peso y talla) y convertir notación decimal usando punto en vez de comas.
3. **DescriptiveAnalysis.R**: permite la creación de tablas usando la librería "crosstable" y de gráficos usando "ggplot2". Otras librerías en uso son "flextable" y "ggridges".
