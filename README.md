# PColCiencias
Scripts R

Algunos scripts de R para la importación y análisis de los datos del proyecto.

* **CartagenaCohortStudy_R_2022-08-09_0211.R**: Lectura del archivo de datos .csv creado a partir de REDCap y creación del objeto (dataframe) "CartagenaCohortStudy_R_2022-08-09_0211.Rda".
* **PrepararData.R**: permite elegir algunas variables de los instrumentos, recodificar missing con NA, convertir variables "string" a "numéricas" (ej. peso y talla) y convertir notación decimal usando punto en vez de comas.
* **DescriptiveAnalysis.R**: permite la creación de tablas usando la librería "crosstable" y de gráficos usando "ggplot2". Otras librerías en uso son "flextable" y "ggridges".
