#
# Cohorte Cartagena
# 
# Lectura del archivo de datos .csv creado a partir de REDCap
# y creación del objeto (dataframe) "CartagenaCohortStudy_R_2022-08-09_0211.Rda"
#


#Clear existing data and graphics
rm(list=ls())
graphics.off()

#Load Hmisc library
library(Hmisc)

#Read Data
data=read.csv('CartagenaCohortStudy_DATA_2022-08-09_0211.csv')

#Setting Labels
label(data$study_id)="ID"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$informacion_general_timestamp)="Survey Timestamp"
label(data$date_enrolled)="Fecha de firma de Consentimiento informado"
label(data$patient_document)="Cargar archivo de Consentimiento informado"
label(data$tipo_id)="Tipo de Identificación"
label(data$id)=""
label(data$ti_otro)=""
label(data$barrio_otro)="¿cuál?"
label(data$localidad)="Localidad"
label(data$age)="Edad (años)"
label(data$gender)="Sexo"
label(data$lugar_nac_op)="Lugar_nac"
label(data$lugar_pro_op)="Lugar_proc"
label(data$lugar_nac_otro)="Lugar_nac_otro"
label(data$lugar_pro_otro)="Lugar_proc_otro"
label(data$escolaridad)="Escolaridad"
label(data$grupo_san)="Grupo sanguíneo RH"
label(data$ocupacion)="Ocupación:"
label(data$ocupacion_otra1)="ocupacion_otra"
label(data$ocupacion_op)="¿Cuál describe mejor su actividad principal en la actualidad?"
label(data$ingresos)="¿Cuantos son sus ingresos mensuales en promedio?"
label(data$ocupacion_otra)="¿cuál?"
label(data$hijos)="¿tiene hijos?"
label(data$num_hijos)="Número de Hijos"
label(data$informacion_general_complete)="Complete?"
label(data$antecedentes_personales_timestamp)="Survey Timestamp"
label(data$cesaria)="¿Usted nació por cesárea?"
label(data$ant_p_enf)="¿sufre de alguna enfermedad o toma algún medicamento?"
label(data$dis_p)="Dislipidemia"
label(data$dis_p_act)="Dislipidemia"
label(data$hta_p)="Hipertensión"
label(data$ecv_p)="Enfermedad cardiovascular"
label(data$cancer_p)="Cancer"
label(data$dm2_p)="Dibetes Mellitus Tipo 2"
label(data$ptiro_p)="P. Tiroidea"
label(data$parep_p)="P. Apar. Reproductor"
label(data$otra_p)="Otra"
label(data$otra_p_otra)="Otra patología"
label(data$otra_p_cancer___1)="cancer_tipo (choice=Mama)"
label(data$otra_p_cancer___2)="cancer_tipo (choice=Ovario)"
label(data$otra_p_cancer___3)="cancer_tipo (choice=Útero)"
label(data$otra_p_cancer___4)="cancer_tipo (choice=Próstata)"
label(data$otra_p_cancer___5)="cancer_tipo (choice=Estómago)"
label(data$otra_p_cancer___6)="cancer_tipo (choice=Pulmón)"
label(data$otra_p_cancer___7)="cancer_tipo (choice=Hueso)"
label(data$otra_p_cancer___8)="cancer_tipo (choice=Leucemia)"
label(data$otra_p_cancer___9)="cancer_tipo (choice=Linfoma)"
label(data$otra_p_cancer___10)="cancer_tipo (choice=Páncreas)"
label(data$otra_p_cancer___11)="cancer_tipo (choice=Otro {cual_otra_p_cancer})"
label(data$cual_otra_p_cancer)=""
label(data$tto_dis_p___1)="Tratamiento dislipidemia (choice=Ninguno)"
label(data$tto_dis_p___2)="Tratamiento dislipidemia (choice=No Especifica)"
label(data$tto_dis_p___3)="Tratamiento dislipidemia (choice=Estatinas {cual_estatinas})"
label(data$tto_dis_p___4)="Tratamiento dislipidemia (choice=Fibratos {cual_fibratos})"
label(data$tto_dis_p___5)="Tratamiento dislipidemia (choice=Resinas {cual_resinas})"
label(data$tto_dis_p___6)="Tratamiento dislipidemia (choice=Otro {tto_dis_p_otro})"
label(data$cual_estatinas___1)="cual_estatinas (choice=Lovastatina)"
label(data$cual_estatinas___2)="cual_estatinas (choice=Atorvastatina)"
label(data$cual_estatinas___3)="cual_estatinas (choice=Rosuvastatina)"
label(data$cual_fibratos___1)="cual_fibratos (choice=Genfibrozilo)"
label(data$cual_fibratos___2)="cual_fibratos (choice=Bezafibrato)"
label(data$cual_fibratos___3)="cual_fibratos (choice=Fenofibrato)"
label(data$cual_resinas___1)="cual_resinas (choice=Colestiramina)"
label(data$cual_resinas___2)="cual_resinas (choice=Colestipol)"
label(data$cual_resinas___3)="cual_resinas (choice=Colesevelam)"
label(data$tto_dis_p_otro)="tto_dis_p_otro"
label(data$tto_hta_p___1)="Tratamiento Hipertensión (choice=Ninguno)"
label(data$tto_hta_p___2)="Tratamiento Hipertensión (choice=No especifica)"
label(data$tto_hta_p___3)="Tratamiento Hipertensión (choice=ARAII {cual_araii})"
label(data$tto_hta_p___4)="Tratamiento Hipertensión (choice=Cálcio-antagonistas {cual_ca})"
label(data$tto_hta_p___5)="Tratamiento Hipertensión (choice=Betabloqueadores {cual_bb})"
label(data$tto_hta_p___6)="Tratamiento Hipertensión (choice=IECA {cual_ieca})"
label(data$tto_hta_p___7)="Tratamiento Hipertensión (choice=Diuréticos {cual_diu})"
label(data$tto_hta_p___8)="Tratamiento Hipertensión (choice=Digitálicos {cual_digi})"
label(data$tto_hta_p___9)="Tratamiento Hipertensión (choice=Otro {tto_hta_p_otro})"
label(data$cual_araii___1)="cual_ARAII (choice=Losartán)"
label(data$cual_araii___2)="cual_ARAII (choice=Valsartán)"
label(data$cual_araii___3)="cual_ARAII (choice=Irbesartán)"
label(data$cual_araii___4)="cual_ARAII (choice=Olmesartán)"
label(data$cual_ca___1)="cual_ca (choice=Nifedipino)"
label(data$cual_ca___2)="cual_ca (choice=Amlodipino)"
label(data$cual_ca___3)="cual_ca (choice=Nimidipino)"
label(data$cual_ca___4)="cual_ca (choice=Nicardipina)"
label(data$cual_ca___5)="cual_ca (choice=Felodopina)"
label(data$cual_ca___6)="cual_ca (choice=Isradipina)"
label(data$cual_ca___7)="cual_ca (choice=Nitrandipina)"
label(data$cual_ca___8)="cual_ca (choice=Verapamilo)"
label(data$cual_ca___9)="cual_ca (choice=Diltiazem)"
label(data$cual_bb___1)="cual_bb (choice=Propanolol (NS))"
label(data$cual_bb___2)="cual_bb (choice=Nadolol (NS))"
label(data$cual_bb___3)="cual_bb (choice=Timolol (NS))"
label(data$cual_bb___4)="cual_bb (choice=Atenolol (S))"
label(data$cual_bb___5)="cual_bb (choice=Metoprolol (S))"
label(data$cual_bb___6)="cual_bb (choice=Esmolol (S))"
label(data$cual_bb___7)="cual_bb (choice=Acebutolol (S))"
label(data$cual_bb___8)="cual_bb (choice=Labetalol (AB))"
label(data$cual_bb___9)="cual_bb (choice=Carvedidol (AB))"
label(data$cual_bb___10)="cual_bb (choice=Buncidolol (AB))"
label(data$cual_ieca___1)="cual_IECA (choice=Captopril)"
label(data$cual_ieca___2)="cual_IECA (choice=Enalapril)"
label(data$cual_ieca___3)="cual_IECA (choice=Ramipril)"
label(data$cual_ieca___4)="cual_IECA (choice=Lisinopril)"
label(data$cual_ieca___5)="cual_IECA (choice=Trandolapril)"
label(data$cual_diu___1)="cual_diu (choice=Furosemida (A))"
label(data$cual_diu___2)="cual_diu (choice=Torasemida (A))"
label(data$cual_diu___3)="cual_diu (choice=Hidroclorotiazida (TZ))"
label(data$cual_diu___4)="cual_diu (choice=Espinorolactona (AK))"
label(data$cual_digi___1)="cual_digitalicos (choice=Digoxina)"
label(data$cual_digi___2)="cual_digitalicos (choice=Metildigoxina)"
label(data$tto_hta_p_otro)="tto_hta_p_otro"
label(data$tto_dm2_p___1)="Tratamiento DM2 (choice=Ninguno)"
label(data$tto_dm2_p___2)="Tratamiento DM2 (choice=No Especifica)"
label(data$tto_dm2_p___3)="Tratamiento DM2 (choice=Insulina {cual_ins})"
label(data$tto_dm2_p___4)="Tratamiento DM2 (choice=Biguadinas {cual_bigu})"
label(data$tto_dm2_p___5)="Tratamiento DM2 (choice=Sulfonilureas {cual_sulfo})"
label(data$tto_dm2_p___6)="Tratamiento DM2 (choice=Inhibidores de alfa-glucosidasa {cual_i_alfa_g})"
label(data$tto_dm2_p___7)="Tratamiento DM2 (choice=Meglitinidas {cual_megli})"
label(data$tto_dm2_p___8)="Tratamiento DM2 (choice=Tiazolidindionas {cual_tiazo})"
label(data$tto_dm2_p___9)="Tratamiento DM2 (choice=Inhibidores DPP-4 {cual_i_dpp4})"
label(data$tto_dm2_p___11)="Tratamiento DM2 (choice=Agonistas GLP1 {cual_ago_glp1})"
label(data$tto_dm2_p___12)="Tratamiento DM2 (choice=ISGLT2 {cual_isglt2})"
label(data$tto_dm2_p___13)="Tratamiento DM2 (choice=Otro {tto_dm2_p_otro})"
label(data$cual_ins___1)="cual_insulina (choice=Aspart (UR))"
label(data$cual_ins___2)="cual_insulina (choice=Lispro (UR))"
label(data$cual_ins___3)="cual_insulina (choice=Glusilina (UR))"
label(data$cual_ins___4)="cual_insulina (choice=Cristalina (R))"
label(data$cual_ins___5)="cual_insulina (choice=NPH (I))"
label(data$cual_ins___6)="cual_insulina (choice=Glargina (P))"
label(data$cual_ins___7)="cual_insulina (choice=Detemir (P))"
label(data$cual_bigu___1)="cual_biguadina (choice=Metformina)"
label(data$cual_sulfo___1)="cual_sulfonilureas (choice=Glibenclamida)"
label(data$cual_sulfo___2)="cual_sulfonilureas (choice=Glipizda)"
label(data$cual_sulfo___3)="cual_sulfonilureas (choice=Glimepiride)"
label(data$cual_sulfo___4)="cual_sulfonilureas (choice=Gliburida)"
label(data$cual_sulfo___5)="cual_sulfonilureas (choice=Glicadiza)"
label(data$cual_sulfo___6)="cual_sulfonilureas (choice=Tolbutamida)"
label(data$cual_i_alfa_g___1)="cual_I_alfa_glucosidasa (choice=Acarbosa)"
label(data$cual_i_alfa_g___2)="cual_I_alfa_glucosidasa (choice=Miglitol)"
label(data$cual_megli___1)="cual_meglitidinas (choice=Nateglinida)"
label(data$cual_megli___3)="cual_meglitidinas (choice=Repaglinida)"
label(data$cual_tiazo___1)="cual_tiazoniledionas (choice=Rosiglitazona)"
label(data$cual_tiazo___2)="cual_tiazoniledionas (choice=Pioglitazona)"
label(data$cual_i_dpp4___1)="cual_I_DPP4 (choice=Sitagliptina)"
label(data$cual_i_dpp4___2)="cual_I_DPP4 (choice=Saxagliptina)"
label(data$cual_i_dpp4___3)="cual_I_DPP4 (choice=Vidagliptina)"
label(data$cual_ago_glp1___1)="cual_ago_glp1 (choice=Liraglutide)"
label(data$cual_ago_glp1___2)="cual_ago_glp1 (choice=Albiglutide)"
label(data$cual_isglt2___1)="cual_isglt2 (choice=Canaglizofina)"
label(data$cual_isglt2___2)="cual_isglt2 (choice=Daglizofina)"
label(data$tto_dm2_p_otro)="tto_dm2_p_otro"
label(data$tto_ecv_p___6)="Tratamiento ECV (choice=Ninguno)"
label(data$tto_ecv_p___7)="Tratamiento ECV (choice=No especifica)"
label(data$tto_ecv_p___0)="Tratamiento ECV (choice=ARAII)"
label(data$tto_ecv_p___1)="Tratamiento ECV (choice=Antagonistas del Cálcio)"
label(data$tto_ecv_p___2)="Tratamiento ECV (choice=Betabloqueadores)"
label(data$tto_ecv_p___3)="Tratamiento ECV (choice=IECA)"
label(data$tto_ecv_p___4)="Tratamiento ECV (choice=Diuréticos)"
label(data$tto_ecv_p___5)="Tratamiento ECV (choice=Otro {tto_ecv_p_otro})"
label(data$tto_ecv_p_otro)="tto_ecv_p_otro"
label(data$tto_cancer_p)="Tratamiento Cáncer"
label(data$tto_ptiro_p)="Tratamiento P. Tiroidea"
label(data$tto_parep_p)="Tratamiento P. Apara. Reproductor"
label(data$tto_otra_p)="Tratamiento Otra"
label(data$hta_p_otro)="hta_otro"
label(data$ant_p_qx_op)="¿lo han operado alguna vez?"
label(data$ape_p_qx)="Apendicectomía"
label(data$sal_p_qx)="Salpingectomía"
label(data$his_p_qx)="Histerectomía"
label(data$oof_p_qx)="Ooforectomía"
label(data$ces_p_qx)="Cesárea"
label(data$her_p_qx)="Herniorráfia"
label(data$col_p_qx)="Colecistectomía"
label(data$fra_p_qx)="Fractura"
label(data$otra_p_qx)="Otra"
label(data$ob_ape_p_qx)="Ob Ape"
label(data$ob_sal_p_qx)="Ob Sal"
label(data$ob_his_p_qx)="Ob His"
label(data$ob_oof_p_qx)="Ob Oof"
label(data$ob_ces_p_qx)="Ob Ces"
label(data$ob_her_p_qx)="Ob Her"
label(data$ob_col_p_qx)="Ob Col"
label(data$ob_fra_p_qx)="Ob Fra"
label(data$ob_otra_p_qx)="Ob otra"
label(data$ob_ape_p_qx_otro)="-"
label(data$ob_sal_p_qx_otro)="-"
label(data$ob_his_p_qx_otro)="-"
label(data$ob_oof_p_qx_otro)="-"
label(data$ob_ces_p_qx_otro)="-"
label(data$ob_her_p_qx_otro)="-"
label(data$ob_col_p_qx_otro)="-"
label(data$ob_fra_p_qx_otro)="-"
label(data$ob_otra_p_qx_otro)="-"
label(data$con_alc_op)="Consumo de Alcohol"
label(data$can_cer_330)="can_cer_330"
label(data$can_cer_269)="can_cer_269"
label(data$can_cer_175)="can_cer_175"
label(data$can_cer_vino)="can_vino"
label(data$can_aguar)="can_aguar"
label(data$can_ron)="can_ron"
label(data$can_whis)="can_whis"
label(data$can_otro)="can_otro"
label(data$fre_cer_330)="frecuencia_con_alc"
label(data$fre_cer_269)="frecuencia_con_alc"
label(data$fre_cer_175)="frecuencia_con_alc"
label(data$fre_vino)="frecuencia_con_alc"
label(data$fre_aguar)="frecuencia_con_alc"
label(data$fre_ron)="frecuencia_con_alc"
label(data$fre_whis)="frecuencia_con_alc"
label(data$fre_otro)="frecuencia_con_alc"
label(data$con_tab_op)="¿Fuma o ha fumado alguna vez?"
label(data$con_tab_act_op)="¿Fuma actualmente?"
label(data$expo_tab_otro)="¿se expone al humo de cigarrillo de otras personas?"
label(data$expo_tab_otro_hora)="¿cuantas horas al día?"
label(data$dejo_fumar)="¿Hace cuanto dejó de fumar?"
label(data$ind_tab)="Indice tabáquico"
label(data$tab_trag)="¿Traga o se tragaba el humo?"
label(data$tab_tiem1)="¿por cuanto tiempo ha fumado? (años)"
label(data$tab_tiem2)="¿por cuanto tiempo ha fumado? (años)"
label(data$tab_tiem3)="¿por cuanto tiempo ha fumado? (años)"
label(data$tab_cant1)="¿cuántos cigarrillos fumaba al día?"
label(data$tab_cant2)="¿cuántos cigarrillos fumaba al día?"
label(data$tab_cant3)="¿cuántos cigarrillos fumaba al día?"
label(data$antecedentes_personales_complete)="Complete?"
label(data$antecedentes_familiares_timestamp)="Survey Timestamp"
label(data$dis_p_fam)="Dislipidemia"
label(data$hta_p_fam)="Hipertensión"
label(data$ecv_p_fam)="Enfermedad cardiovascular"
label(data$dm2_p_fam)="Dibetes Mellitus Tipo 2"
label(data$cancer_p_fam)="Cancer"
label(data$alzh_p_fam)="Alzheimer"
label(data$park_p_fam)="Parkinson"
label(data$asma_p_fam)="Asma"
label(data$bronquitis_p_fam)="Bronquitis"
label(data$acv_p_fam)="ACV"
label(data$otra_p_fam)="Otra"
label(data$otro_pat_fam)="otro pat fam"
label(data$otra_p_cancer_fam_1___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_1___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_1___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_1___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_1___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_1___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_1___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_1___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_1___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_1___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_1___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_1___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_1})"
label(data$otra_p_cancer_fam_2___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_2___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_2___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_2___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_2___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_2___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_2___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_2___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_2___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_2___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_2___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_2___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_2})"
label(data$otra_p_cancer_fam_3___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_3___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_3___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_3___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_3___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_3___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_3___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_3___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_3___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_3___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_3___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_3___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_3})"
label(data$otra_p_cancer_fam_4___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_4___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_4___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_4___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_4___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_4___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_4___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_4___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_4___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_4___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_4___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_4___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_4})"
label(data$otra_p_cancer_fam_5___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_5___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_5___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_5___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_5___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_5___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_5___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_5___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_5___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_5___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_5___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_5___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_5})"
label(data$otra_p_cancer_fam_6___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_6___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_6___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_6___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_6___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_6___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_6___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_6___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_6___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_6___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_6___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_6___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_6})"
label(data$otra_p_cancer_fam_7___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_7___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_7___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_7___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_7___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_7___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_7___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_7___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_7___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_7___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_7___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_7___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_7})"
label(data$otra_p_cancer_fam_8___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_8___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_8___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_8___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_8___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_8___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_8___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_8___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_8___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_8___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_8___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_8___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_8})"
label(data$otra_p_cancer_fam_9___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_9___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_9___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_9___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_9___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_9___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_9___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_9___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_9___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_9___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_9___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_9___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_9})"
label(data$otra_p_cancer_fam_10___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_10___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_10___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_10___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_10___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_10___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_10___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_10___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_10___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_10___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_10___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_10___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_10})"
label(data$otra_p_cancer_fam_11___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_11___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_11___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_11___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_11___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_11___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_11___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_11___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_11___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_11___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_11___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_11___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_11})"
label(data$otra_p_cancer_fam_12___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_12___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_12___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_12___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_12___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_12___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_12___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_12___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_12___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_12___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_12___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_12___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_12})"
label(data$otra_p_cancer_fam_13___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_13___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_13___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_13___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_13___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_13___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_13___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_13___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_13___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_13___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_13___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_13___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_13})"
label(data$otra_p_cancer_fam_14___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_14___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_14___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_14___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_14___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_14___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_14___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_14___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_14___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_14___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_14___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_14___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_14})"
label(data$otra_p_cancer_fam_15___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_15___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_15___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_15___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_15___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_15___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_15___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_15___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_15___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_15___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_15___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_15___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_15})"
label(data$otra_p_cancer_fam_16___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_16___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_16___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_16___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_16___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_16___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_16___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_16___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_16___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_16___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_16___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_16___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_16})"
label(data$otra_p_cancer_fam_18___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_18___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_18___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_18___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_18___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_18___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_18___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_18___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_18___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_18___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_18___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_18___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_18})"
label(data$otra_p_cancer_fam_20___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_20___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_20___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_20___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_20___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_20___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_20___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_20___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_20___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_20___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_20___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_20___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_20})"
label(data$otra_p_cancer_fam_23___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_23___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_23___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_23___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_23___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_23___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_23___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_23___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_23___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_23___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_23___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_23___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_23})"
label(data$otra_p_cancer_fam_24___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_24___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_24___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_24___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_24___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_24___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_24___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_24___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_24___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_24___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_24___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_24___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_24})"
label(data$otra_p_cancer_fam_25___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_25___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_25___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_25___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_25___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_25___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_25___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_25___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_25___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_25___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_25___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_25___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_25})"
label(data$otra_p_cancer_fam_26___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_26___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_26___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_26___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_26___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_26___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_26___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_26___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_26___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_26___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_26___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_26___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_26})"
label(data$otra_p_cancer_fam_27___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_27___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_27___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_27___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_27___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_27___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_27___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_27___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_27___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_27___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_27___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_27___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_27})"
label(data$otra_p_cancer_fam_22___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_22___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_22___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_22___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_22___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_22___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_22___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_22___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_22___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_22___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_22___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_22___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_22})"
label(data$otra_p_cancer_fam_21___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_21___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_21___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_21___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_21___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_21___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_21___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_21___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_21___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_21___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_21___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_21___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_21})"
label(data$otra_p_cancer_fam_19___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_19___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_19___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_19___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_19___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_19___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_19___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_19___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_19___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_19___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_19___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_19___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_19})"
label(data$otra_p_cancer_fam_17___1)="cancer_cual (choice=Mama)"
label(data$otra_p_cancer_fam_17___2)="cancer_cual (choice=Ovario)"
label(data$otra_p_cancer_fam_17___3)="cancer_cual (choice=Útero)"
label(data$otra_p_cancer_fam_17___4)="cancer_cual (choice=Próstata)"
label(data$otra_p_cancer_fam_17___5)="cancer_cual (choice=Estómago)"
label(data$otra_p_cancer_fam_17___6)="cancer_cual (choice=Pulmón)"
label(data$otra_p_cancer_fam_17___7)="cancer_cual (choice=Hueso)"
label(data$otra_p_cancer_fam_17___8)="cancer_cual (choice=Leucemia)"
label(data$otra_p_cancer_fam_17___9)="cancer_cual (choice=Linfoma)"
label(data$otra_p_cancer_fam_17___10)="cancer_cual (choice=Páncreas)"
label(data$otra_p_cancer_fam_17___11)="cancer_cual (choice=Tiroides)"
label(data$otra_p_cancer_fam_17___12)="cancer_cual (choice=Otro {otro_cual_cancer_fam_17})"
label(data$otro_cual_cancer_fam_1)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_2)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_3)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_4)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_5)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_6)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_7)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_8)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_9)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_10)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_11)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_12)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_13)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_14)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_15)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_16)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_17)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_18)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_19)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_20)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_21)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_22)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_23)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_24)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_25)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_26)="otro_cual_cancer_fam"
label(data$otro_cual_cancer_fam_27)="otro_cual_cancer_fam"
label(data$ptco_dis_fam___1)="Parentesco dis fam (choice=Madre)"
label(data$ptco_dis_fam___2)="Parentesco dis fam (choice=Padre)"
label(data$ptco_dis_fam___3)="Parentesco dis fam (choice=Hermanos)"
label(data$ptco_dis_fam___16)="Parentesco dis fam (choice=Hermano)"
label(data$ptco_dis_fam___17)="Parentesco dis fam (choice=Hermana)"
label(data$ptco_dis_fam___4)="Parentesco dis fam (choice=Hijos)"
label(data$ptco_dis_fam___18)="Parentesco dis fam (choice=Hijo)"
label(data$ptco_dis_fam___19)="Parentesco dis fam (choice=Hija)"
label(data$ptco_dis_fam___5)="Parentesco dis fam (choice=Abuelo m)"
label(data$ptco_dis_fam___6)="Parentesco dis fam (choice=Abuela m)"
label(data$ptco_dis_fam___7)="Parentesco dis fam (choice=Abuelo p)"
label(data$ptco_dis_fam___8)="Parentesco dis fam (choice=Abuela p)"
label(data$ptco_dis_fam___9)="Parentesco dis fam (choice=Tios m)"
label(data$ptco_dis_fam___20)="Parentesco dis fam (choice=Tio m)"
label(data$ptco_dis_fam___21)="Parentesco dis fam (choice=Tia m)"
label(data$ptco_dis_fam___10)="Parentesco dis fam (choice=Tios p)"
label(data$ptco_dis_fam___22)="Parentesco dis fam (choice=Tio p)"
label(data$ptco_dis_fam___23)="Parentesco dis fam (choice=Tia p)"
label(data$ptco_dis_fam___11)="Parentesco dis fam (choice=Primos m)"
label(data$ptco_dis_fam___24)="Parentesco dis fam (choice=Primo m)"
label(data$ptco_dis_fam___25)="Parentesco dis fam (choice=Prima m)"
label(data$ptco_dis_fam___12)="Parentesco dis fam (choice=Primos p)"
label(data$ptco_dis_fam___26)="Parentesco dis fam (choice=Primo p)"
label(data$ptco_dis_fam___27)="Parentesco dis fam (choice=Prima p)"
label(data$ptco_dis_fam___13)="Parentesco dis fam (choice=Familia m)"
label(data$ptco_dis_fam___14)="Parentesco dis fam (choice=Familia p)"
label(data$ptco_dis_fam___15)="Parentesco dis fam (choice=Otro {dis_p_otro_fam})"
label(data$ptco_hta_fam___1)="Parentésco hta fam (choice=Madre)"
label(data$ptco_hta_fam___2)="Parentésco hta fam (choice=Padre)"
label(data$ptco_hta_fam___3)="Parentésco hta fam (choice=Hermanos)"
label(data$ptco_hta_fam___16)="Parentésco hta fam (choice=Hermano)"
label(data$ptco_hta_fam___17)="Parentésco hta fam (choice=Hermana)"
label(data$ptco_hta_fam___4)="Parentésco hta fam (choice=Hijos)"
label(data$ptco_hta_fam___18)="Parentésco hta fam (choice=Hijo)"
label(data$ptco_hta_fam___19)="Parentésco hta fam (choice=Hija)"
label(data$ptco_hta_fam___5)="Parentésco hta fam (choice=Abuelo m)"
label(data$ptco_hta_fam___6)="Parentésco hta fam (choice=Abuela m)"
label(data$ptco_hta_fam___7)="Parentésco hta fam (choice=Abuelo p)"
label(data$ptco_hta_fam___8)="Parentésco hta fam (choice=Abuela p)"
label(data$ptco_hta_fam___9)="Parentésco hta fam (choice=Tios m)"
label(data$ptco_hta_fam___20)="Parentésco hta fam (choice=Tio m)"
label(data$ptco_hta_fam___21)="Parentésco hta fam (choice=Tia m)"
label(data$ptco_hta_fam___10)="Parentésco hta fam (choice=Tios p)"
label(data$ptco_hta_fam___22)="Parentésco hta fam (choice=Tio p)"
label(data$ptco_hta_fam___23)="Parentésco hta fam (choice=Tia p)"
label(data$ptco_hta_fam___11)="Parentésco hta fam (choice=Primos m)"
label(data$ptco_hta_fam___24)="Parentésco hta fam (choice=Primo m)"
label(data$ptco_hta_fam___25)="Parentésco hta fam (choice=Prima m)"
label(data$ptco_hta_fam___12)="Parentésco hta fam (choice=Primos p)"
label(data$ptco_hta_fam___26)="Parentésco hta fam (choice=Primo p)"
label(data$ptco_hta_fam___27)="Parentésco hta fam (choice=Prima p)"
label(data$ptco_hta_fam___13)="Parentésco hta fam (choice=Familia m)"
label(data$ptco_hta_fam___14)="Parentésco hta fam (choice=Familia p)"
label(data$ptco_hta_fam___15)="Parentésco hta fam (choice=Otro {hta_p_otro_fam})"
label(data$ptco_ecv_fam___1)="Parentésco ecv fam (choice=Madre)"
label(data$ptco_ecv_fam___2)="Parentésco ecv fam (choice=Padre)"
label(data$ptco_ecv_fam___3)="Parentésco ecv fam (choice=Hermanos)"
label(data$ptco_ecv_fam___16)="Parentésco ecv fam (choice=Hermano)"
label(data$ptco_ecv_fam___17)="Parentésco ecv fam (choice=Hermana)"
label(data$ptco_ecv_fam___4)="Parentésco ecv fam (choice=Hijos)"
label(data$ptco_ecv_fam___18)="Parentésco ecv fam (choice=Hijo)"
label(data$ptco_ecv_fam___19)="Parentésco ecv fam (choice=Hija)"
label(data$ptco_ecv_fam___5)="Parentésco ecv fam (choice=Abuelo m)"
label(data$ptco_ecv_fam___6)="Parentésco ecv fam (choice=Abuela m)"
label(data$ptco_ecv_fam___7)="Parentésco ecv fam (choice=Abuelo p)"
label(data$ptco_ecv_fam___8)="Parentésco ecv fam (choice=Abuela p)"
label(data$ptco_ecv_fam___9)="Parentésco ecv fam (choice=Tios m)"
label(data$ptco_ecv_fam___20)="Parentésco ecv fam (choice=Tio m)"
label(data$ptco_ecv_fam___21)="Parentésco ecv fam (choice=Tia m)"
label(data$ptco_ecv_fam___10)="Parentésco ecv fam (choice=Tios p)"
label(data$ptco_ecv_fam___22)="Parentésco ecv fam (choice=Tio p)"
label(data$ptco_ecv_fam___23)="Parentésco ecv fam (choice=Tia p)"
label(data$ptco_ecv_fam___11)="Parentésco ecv fam (choice=Primos m)"
label(data$ptco_ecv_fam___24)="Parentésco ecv fam (choice=Primo m)"
label(data$ptco_ecv_fam___25)="Parentésco ecv fam (choice=Prima m)"
label(data$ptco_ecv_fam___12)="Parentésco ecv fam (choice=Primos p)"
label(data$ptco_ecv_fam___26)="Parentésco ecv fam (choice=Primo p)"
label(data$ptco_ecv_fam___27)="Parentésco ecv fam (choice=Prima p)"
label(data$ptco_ecv_fam___13)="Parentésco ecv fam (choice=Familia m)"
label(data$ptco_ecv_fam___14)="Parentésco ecv fam (choice=Familia p)"
label(data$ptco_ecv_fam___15)="Parentésco ecv fam (choice=Otro {ecv_p_otro_fam})"
label(data$ptco_dm2_fam___1)="Parentésco dm2 fam (choice=Madre)"
label(data$ptco_dm2_fam___2)="Parentésco dm2 fam (choice=Padre)"
label(data$ptco_dm2_fam___3)="Parentésco dm2 fam (choice=Hermanos)"
label(data$ptco_dm2_fam___16)="Parentésco dm2 fam (choice=Hermano)"
label(data$ptco_dm2_fam___17)="Parentésco dm2 fam (choice=Hermana)"
label(data$ptco_dm2_fam___4)="Parentésco dm2 fam (choice=Hijos)"
label(data$ptco_dm2_fam___18)="Parentésco dm2 fam (choice=Hijo)"
label(data$ptco_dm2_fam___19)="Parentésco dm2 fam (choice=Hija)"
label(data$ptco_dm2_fam___5)="Parentésco dm2 fam (choice=Abuelo m)"
label(data$ptco_dm2_fam___6)="Parentésco dm2 fam (choice=Abuela m)"
label(data$ptco_dm2_fam___7)="Parentésco dm2 fam (choice=Abuelo p)"
label(data$ptco_dm2_fam___8)="Parentésco dm2 fam (choice=Abuela p)"
label(data$ptco_dm2_fam___9)="Parentésco dm2 fam (choice=Tios m)"
label(data$ptco_dm2_fam___20)="Parentésco dm2 fam (choice=Tio m)"
label(data$ptco_dm2_fam___21)="Parentésco dm2 fam (choice=Tia m)"
label(data$ptco_dm2_fam___10)="Parentésco dm2 fam (choice=Tios p)"
label(data$ptco_dm2_fam___22)="Parentésco dm2 fam (choice=Tio p)"
label(data$ptco_dm2_fam___23)="Parentésco dm2 fam (choice=Tia p)"
label(data$ptco_dm2_fam___11)="Parentésco dm2 fam (choice=Primos m)"
label(data$ptco_dm2_fam___24)="Parentésco dm2 fam (choice=Primo m)"
label(data$ptco_dm2_fam___25)="Parentésco dm2 fam (choice=Prima m)"
label(data$ptco_dm2_fam___12)="Parentésco dm2 fam (choice=Primos p)"
label(data$ptco_dm2_fam___26)="Parentésco dm2 fam (choice=Primo p)"
label(data$ptco_dm2_fam___27)="Parentésco dm2 fam (choice=Prima p)"
label(data$ptco_dm2_fam___13)="Parentésco dm2 fam (choice=Familia m)"
label(data$ptco_dm2_fam___14)="Parentésco dm2 fam (choice=Familia p)"
label(data$ptco_dm2_fam___15)="Parentésco dm2 fam (choice=Otro {dm2_p_otro_fam})"
label(data$ptco_cancer_fam___1)="Parentésco cancer fam (choice=Madre {otra_p_cancer_fam_1})"
label(data$ptco_cancer_fam___2)="Parentésco cancer fam (choice=Padre {otra_p_cancer_fam_2})"
label(data$ptco_cancer_fam___3)="Parentésco cancer fam (choice=Hermanos {otra_p_cancer_fam_3})"
label(data$ptco_cancer_fam___16)="Parentésco cancer fam (choice=Hermano {otra_p_cancer_fam_16})"
label(data$ptco_cancer_fam___17)="Parentésco cancer fam (choice=Hermana {otra_p_cancer_fam_17})"
label(data$ptco_cancer_fam___4)="Parentésco cancer fam (choice=Hijos {otra_p_cancer_fam_4})"
label(data$ptco_cancer_fam___18)="Parentésco cancer fam (choice=Hijo {otra_p_cancer_fam_18})"
label(data$ptco_cancer_fam___19)="Parentésco cancer fam (choice=Hija {otra_p_cancer_fam_19})"
label(data$ptco_cancer_fam___5)="Parentésco cancer fam (choice=Abuelo m {otra_p_cancer_fam_5})"
label(data$ptco_cancer_fam___6)="Parentésco cancer fam (choice=Abuela m {otra_p_cancer_fam_6})"
label(data$ptco_cancer_fam___7)="Parentésco cancer fam (choice=Abuelo p {otra_p_cancer_fam_7})"
label(data$ptco_cancer_fam___8)="Parentésco cancer fam (choice=Abuela p {otra_p_cancer_fam_8})"
label(data$ptco_cancer_fam___9)="Parentésco cancer fam (choice=Tios m {otra_p_cancer_fam_9})"
label(data$ptco_cancer_fam___20)="Parentésco cancer fam (choice=Tio m {otra_p_cancer_fam_20})"
label(data$ptco_cancer_fam___21)="Parentésco cancer fam (choice=Tia m {otra_p_cancer_fam_21})"
label(data$ptco_cancer_fam___10)="Parentésco cancer fam (choice=Tios p {otra_p_cancer_fam_10})"
label(data$ptco_cancer_fam___22)="Parentésco cancer fam (choice=Tio p {otra_p_cancer_fam_22})"
label(data$ptco_cancer_fam___23)="Parentésco cancer fam (choice=Tia p {otra_p_cancer_fam_23})"
label(data$ptco_cancer_fam___11)="Parentésco cancer fam (choice=Primos m {otra_p_cancer_fam_11})"
label(data$ptco_cancer_fam___24)="Parentésco cancer fam (choice=Primo m {otra_p_cancer_fam_24})"
label(data$ptco_cancer_fam___25)="Parentésco cancer fam (choice=Prima m {otra_p_cancer_fam_25})"
label(data$ptco_cancer_fam___12)="Parentésco cancer fam (choice=Primos p {otra_p_cancer_fam_12})"
label(data$ptco_cancer_fam___26)="Parentésco cancer fam (choice=Primo p {otra_p_cancer_fam_26})"
label(data$ptco_cancer_fam___27)="Parentésco cancer fam (choice=Prima p {otra_p_cancer_fam_27})"
label(data$ptco_cancer_fam___13)="Parentésco cancer fam (choice=Familia m {otra_p_cancer_fam_13})"
label(data$ptco_cancer_fam___14)="Parentésco cancer fam (choice=Familia p {otra_p_cancer_fam_14})"
label(data$ptco_cancer_fam___15)="Parentésco cancer fam (choice=Otro {cancer_p_otro_fam} {otra_p_cancer_fam_15})"
label(data$ptco_alzh_fam___1)="Parentésco alzheimer fam (choice=Madre)"
label(data$ptco_alzh_fam___2)="Parentésco alzheimer fam (choice=Padre)"
label(data$ptco_alzh_fam___3)="Parentésco alzheimer fam (choice=Hermanos)"
label(data$ptco_alzh_fam___16)="Parentésco alzheimer fam (choice=Hermano)"
label(data$ptco_alzh_fam___17)="Parentésco alzheimer fam (choice=Hermana)"
label(data$ptco_alzh_fam___4)="Parentésco alzheimer fam (choice=Hijos)"
label(data$ptco_alzh_fam___18)="Parentésco alzheimer fam (choice=Hijo)"
label(data$ptco_alzh_fam___19)="Parentésco alzheimer fam (choice=Hija)"
label(data$ptco_alzh_fam___5)="Parentésco alzheimer fam (choice=Abuelo m)"
label(data$ptco_alzh_fam___6)="Parentésco alzheimer fam (choice=Abuela m)"
label(data$ptco_alzh_fam___7)="Parentésco alzheimer fam (choice=Abuelo p)"
label(data$ptco_alzh_fam___8)="Parentésco alzheimer fam (choice=Abuela p)"
label(data$ptco_alzh_fam___9)="Parentésco alzheimer fam (choice=Tios m)"
label(data$ptco_alzh_fam___20)="Parentésco alzheimer fam (choice=Tio m)"
label(data$ptco_alzh_fam___21)="Parentésco alzheimer fam (choice=Tia m)"
label(data$ptco_alzh_fam___10)="Parentésco alzheimer fam (choice=Tios p)"
label(data$ptco_alzh_fam___22)="Parentésco alzheimer fam (choice=Tio p)"
label(data$ptco_alzh_fam___23)="Parentésco alzheimer fam (choice=Tia p)"
label(data$ptco_alzh_fam___11)="Parentésco alzheimer fam (choice=Primos m)"
label(data$ptco_alzh_fam___24)="Parentésco alzheimer fam (choice=Primo m)"
label(data$ptco_alzh_fam___25)="Parentésco alzheimer fam (choice=Prima m)"
label(data$ptco_alzh_fam___12)="Parentésco alzheimer fam (choice=Primos p)"
label(data$ptco_alzh_fam___26)="Parentésco alzheimer fam (choice=Primo p)"
label(data$ptco_alzh_fam___27)="Parentésco alzheimer fam (choice=Prima p)"
label(data$ptco_alzh_fam___13)="Parentésco alzheimer fam (choice=Familia m)"
label(data$ptco_alzh_fam___14)="Parentésco alzheimer fam (choice=Familia p)"
label(data$ptco_alzh_fam___15)="Parentésco alzheimer fam (choice=Otro {alzh_p_otro_fam})"
label(data$ptco_park_fam___1)="Parentésco parkinson fam (choice=Madre)"
label(data$ptco_park_fam___2)="Parentésco parkinson fam (choice=Padre)"
label(data$ptco_park_fam___3)="Parentésco parkinson fam (choice=Hermanos)"
label(data$ptco_park_fam___16)="Parentésco parkinson fam (choice=Hermano)"
label(data$ptco_park_fam___17)="Parentésco parkinson fam (choice=Hermana)"
label(data$ptco_park_fam___4)="Parentésco parkinson fam (choice=Hijos)"
label(data$ptco_park_fam___18)="Parentésco parkinson fam (choice=Hijo)"
label(data$ptco_park_fam___19)="Parentésco parkinson fam (choice=Hija)"
label(data$ptco_park_fam___5)="Parentésco parkinson fam (choice=Abuelo m)"
label(data$ptco_park_fam___6)="Parentésco parkinson fam (choice=Abuela m)"
label(data$ptco_park_fam___7)="Parentésco parkinson fam (choice=Abuelo p)"
label(data$ptco_park_fam___8)="Parentésco parkinson fam (choice=Abuela p)"
label(data$ptco_park_fam___9)="Parentésco parkinson fam (choice=Tios m)"
label(data$ptco_park_fam___20)="Parentésco parkinson fam (choice=Tio m)"
label(data$ptco_park_fam___21)="Parentésco parkinson fam (choice=Tia m)"
label(data$ptco_park_fam___10)="Parentésco parkinson fam (choice=Tios p)"
label(data$ptco_park_fam___22)="Parentésco parkinson fam (choice=Tio p)"
label(data$ptco_park_fam___23)="Parentésco parkinson fam (choice=Tia p)"
label(data$ptco_park_fam___11)="Parentésco parkinson fam (choice=Primos m)"
label(data$ptco_park_fam___24)="Parentésco parkinson fam (choice=Primo m)"
label(data$ptco_park_fam___25)="Parentésco parkinson fam (choice=Prima m)"
label(data$ptco_park_fam___12)="Parentésco parkinson fam (choice=Primos p)"
label(data$ptco_park_fam___26)="Parentésco parkinson fam (choice=Primo p)"
label(data$ptco_park_fam___27)="Parentésco parkinson fam (choice=Prima p)"
label(data$ptco_park_fam___13)="Parentésco parkinson fam (choice=Familia m)"
label(data$ptco_park_fam___14)="Parentésco parkinson fam (choice=Familia p)"
label(data$ptco_park_fam___15)="Parentésco parkinson fam (choice=Otro {park_p_otro_fam})"
label(data$ptco_asma_fam___1)="Parentésco asma fam (choice=Madre)"
label(data$ptco_asma_fam___2)="Parentésco asma fam (choice=Padre)"
label(data$ptco_asma_fam___3)="Parentésco asma fam (choice=Hermanos)"
label(data$ptco_asma_fam___16)="Parentésco asma fam (choice=Hermano)"
label(data$ptco_asma_fam___17)="Parentésco asma fam (choice=Hermana)"
label(data$ptco_asma_fam___4)="Parentésco asma fam (choice=Hijos)"
label(data$ptco_asma_fam___18)="Parentésco asma fam (choice=Hijo)"
label(data$ptco_asma_fam___19)="Parentésco asma fam (choice=Hija)"
label(data$ptco_asma_fam___5)="Parentésco asma fam (choice=Abuelo m)"
label(data$ptco_asma_fam___6)="Parentésco asma fam (choice=Abuela m)"
label(data$ptco_asma_fam___7)="Parentésco asma fam (choice=Abuelo p)"
label(data$ptco_asma_fam___8)="Parentésco asma fam (choice=Abuela p)"
label(data$ptco_asma_fam___9)="Parentésco asma fam (choice=Tios m)"
label(data$ptco_asma_fam___20)="Parentésco asma fam (choice=Tio m)"
label(data$ptco_asma_fam___21)="Parentésco asma fam (choice=Tia m)"
label(data$ptco_asma_fam___10)="Parentésco asma fam (choice=Tios p)"
label(data$ptco_asma_fam___22)="Parentésco asma fam (choice=Tio p)"
label(data$ptco_asma_fam___23)="Parentésco asma fam (choice=Tia p)"
label(data$ptco_asma_fam___11)="Parentésco asma fam (choice=Primos m)"
label(data$ptco_asma_fam___24)="Parentésco asma fam (choice=Primo m)"
label(data$ptco_asma_fam___25)="Parentésco asma fam (choice=Prima m)"
label(data$ptco_asma_fam___12)="Parentésco asma fam (choice=Primos p)"
label(data$ptco_asma_fam___26)="Parentésco asma fam (choice=Primo p)"
label(data$ptco_asma_fam___27)="Parentésco asma fam (choice=Prima p)"
label(data$ptco_asma_fam___13)="Parentésco asma fam (choice=Familia m)"
label(data$ptco_asma_fam___14)="Parentésco asma fam (choice=Familia p)"
label(data$ptco_asma_fam___15)="Parentésco asma fam (choice=Otro {asma_p_otro_fam})"
label(data$ptco_bronquitis_fam___1)="Parentésco bronquitis fam (choice=Madre)"
label(data$ptco_bronquitis_fam___2)="Parentésco bronquitis fam (choice=Padre)"
label(data$ptco_bronquitis_fam___3)="Parentésco bronquitis fam (choice=Hermanos)"
label(data$ptco_bronquitis_fam___16)="Parentésco bronquitis fam (choice=Hermano)"
label(data$ptco_bronquitis_fam___17)="Parentésco bronquitis fam (choice=Hermana)"
label(data$ptco_bronquitis_fam___4)="Parentésco bronquitis fam (choice=Hijos)"
label(data$ptco_bronquitis_fam___18)="Parentésco bronquitis fam (choice=Hijo)"
label(data$ptco_bronquitis_fam___19)="Parentésco bronquitis fam (choice=Hija)"
label(data$ptco_bronquitis_fam___5)="Parentésco bronquitis fam (choice=Abuelo m)"
label(data$ptco_bronquitis_fam___6)="Parentésco bronquitis fam (choice=Abuela m)"
label(data$ptco_bronquitis_fam___7)="Parentésco bronquitis fam (choice=Abuelo p)"
label(data$ptco_bronquitis_fam___8)="Parentésco bronquitis fam (choice=Abuela p)"
label(data$ptco_bronquitis_fam___9)="Parentésco bronquitis fam (choice=Tios m)"
label(data$ptco_bronquitis_fam___20)="Parentésco bronquitis fam (choice=Tio m)"
label(data$ptco_bronquitis_fam___21)="Parentésco bronquitis fam (choice=Tia m)"
label(data$ptco_bronquitis_fam___10)="Parentésco bronquitis fam (choice=Tios p)"
label(data$ptco_bronquitis_fam___22)="Parentésco bronquitis fam (choice=Tio p)"
label(data$ptco_bronquitis_fam___23)="Parentésco bronquitis fam (choice=Tia p)"
label(data$ptco_bronquitis_fam___11)="Parentésco bronquitis fam (choice=Primos m)"
label(data$ptco_bronquitis_fam___24)="Parentésco bronquitis fam (choice=Primo m)"
label(data$ptco_bronquitis_fam___25)="Parentésco bronquitis fam (choice=Prima m)"
label(data$ptco_bronquitis_fam___12)="Parentésco bronquitis fam (choice=Primos p)"
label(data$ptco_bronquitis_fam___26)="Parentésco bronquitis fam (choice=Primo p)"
label(data$ptco_bronquitis_fam___27)="Parentésco bronquitis fam (choice=Prima p)"
label(data$ptco_bronquitis_fam___13)="Parentésco bronquitis fam (choice=Familia m)"
label(data$ptco_bronquitis_fam___14)="Parentésco bronquitis fam (choice=Familia p)"
label(data$ptco_bronquitis_fam___15)="Parentésco bronquitis fam (choice=Otro {bronquitis_p_otro_fam})"
label(data$ptco_acv_fam___1)="Parentésco acv fam (choice=Madre)"
label(data$ptco_acv_fam___2)="Parentésco acv fam (choice=Padre)"
label(data$ptco_acv_fam___3)="Parentésco acv fam (choice=Hermanos)"
label(data$ptco_acv_fam___16)="Parentésco acv fam (choice=Hermano)"
label(data$ptco_acv_fam___17)="Parentésco acv fam (choice=Hermana)"
label(data$ptco_acv_fam___4)="Parentésco acv fam (choice=Hijos)"
label(data$ptco_acv_fam___18)="Parentésco acv fam (choice=Hijo)"
label(data$ptco_acv_fam___19)="Parentésco acv fam (choice=Hija)"
label(data$ptco_acv_fam___5)="Parentésco acv fam (choice=Abuelo m)"
label(data$ptco_acv_fam___6)="Parentésco acv fam (choice=Abuela m)"
label(data$ptco_acv_fam___7)="Parentésco acv fam (choice=Abuelo p)"
label(data$ptco_acv_fam___8)="Parentésco acv fam (choice=Abuela p)"
label(data$ptco_acv_fam___9)="Parentésco acv fam (choice=Tios m)"
label(data$ptco_acv_fam___20)="Parentésco acv fam (choice=Tio m)"
label(data$ptco_acv_fam___21)="Parentésco acv fam (choice=Tia m)"
label(data$ptco_acv_fam___10)="Parentésco acv fam (choice=Tios p)"
label(data$ptco_acv_fam___22)="Parentésco acv fam (choice=Tio p)"
label(data$ptco_acv_fam___23)="Parentésco acv fam (choice=Tia p)"
label(data$ptco_acv_fam___11)="Parentésco acv fam (choice=Primos m)"
label(data$ptco_acv_fam___24)="Parentésco acv fam (choice=Primo m)"
label(data$ptco_acv_fam___25)="Parentésco acv fam (choice=Prima m)"
label(data$ptco_acv_fam___12)="Parentésco acv fam (choice=Primos p)"
label(data$ptco_acv_fam___26)="Parentésco acv fam (choice=Primo p)"
label(data$ptco_acv_fam___27)="Parentésco acv fam (choice=Prima p)"
label(data$ptco_acv_fam___13)="Parentésco acv fam (choice=Familia m)"
label(data$ptco_acv_fam___14)="Parentésco acv fam (choice=Familia p)"
label(data$ptco_acv_fam___15)="Parentésco acv fam (choice=Otro {acv_p_otro_fam})"
label(data$ptco_otro_fam___1)="Parentésco otro fam (choice=Madre)"
label(data$ptco_otro_fam___2)="Parentésco otro fam (choice=Padre)"
label(data$ptco_otro_fam___3)="Parentésco otro fam (choice=Hermanos)"
label(data$ptco_otro_fam___16)="Parentésco otro fam (choice=Hermano)"
label(data$ptco_otro_fam___17)="Parentésco otro fam (choice=Hermana)"
label(data$ptco_otro_fam___4)="Parentésco otro fam (choice=Hijos)"
label(data$ptco_otro_fam___18)="Parentésco otro fam (choice=Hijo)"
label(data$ptco_otro_fam___19)="Parentésco otro fam (choice=Hija)"
label(data$ptco_otro_fam___5)="Parentésco otro fam (choice=Abuelo m)"
label(data$ptco_otro_fam___6)="Parentésco otro fam (choice=Abuela m)"
label(data$ptco_otro_fam___7)="Parentésco otro fam (choice=Abuelo p)"
label(data$ptco_otro_fam___8)="Parentésco otro fam (choice=Abuela p)"
label(data$ptco_otro_fam___9)="Parentésco otro fam (choice=Tios m)"
label(data$ptco_otro_fam___20)="Parentésco otro fam (choice=Tio m)"
label(data$ptco_otro_fam___21)="Parentésco otro fam (choice=Tia m)"
label(data$ptco_otro_fam___10)="Parentésco otro fam (choice=Tios p)"
label(data$ptco_otro_fam___22)="Parentésco otro fam (choice=Tio p)"
label(data$ptco_otro_fam___23)="Parentésco otro fam (choice=Tia p)"
label(data$ptco_otro_fam___11)="Parentésco otro fam (choice=Primos m)"
label(data$ptco_otro_fam___24)="Parentésco otro fam (choice=Primo m)"
label(data$ptco_otro_fam___25)="Parentésco otro fam (choice=Prima m)"
label(data$ptco_otro_fam___12)="Parentésco otro fam (choice=Primos p)"
label(data$ptco_otro_fam___26)="Parentésco otro fam (choice=Primo p)"
label(data$ptco_otro_fam___27)="Parentésco otro fam (choice=Prima p)"
label(data$ptco_otro_fam___13)="Parentésco otro fam (choice=Familia m)"
label(data$ptco_otro_fam___14)="Parentésco otro fam (choice=Familia p)"
label(data$ptco_otro_fam___15)="Parentésco otro fam (choice=Otro {otro_p_otro_fam})"
label(data$dis_p_otro_fam)="dis_otro"
label(data$hta_p_otro_fam)="hta_otro"
label(data$ecv_p_otro_fam)="ecv_otro"
label(data$dm2_p_otro_fam)="dm2_otro"
label(data$cancer_p_otro_fam)="cancer_otro"
label(data$alzh_p_otro_fam)="alzheimer_otro"
label(data$park_p_otro_fam)="parkinson_otro"
label(data$asma_p_otro_fam)="asma_otro"
label(data$bronquitis_p_otro_fam)="bronquitis_otro"
label(data$acv_p_otro_fam)="acv_otro"
label(data$otro_p_otro_fam)="otro_otro"
label(data$madre_viva)="¿su madre biológica está viva aún?"
label(data$anos_madre_muerta)="¿cuántos años tenia su madre cuando falleció?"
label(data$anos_madre_viva)="¿cuántos años tiene su madre ahora?"
label(data$padre_vivo)="¿su padre biológico está vivo aún?"
label(data$anos_padre_vivo)="¿cuántos años tiene su padre ahora?"
label(data$anos_padre_muerto)="¿cuántos años tenia su padre cuando falleció?"
label(data$escolaridad_madre)="Escolaridad de la Madre"
label(data$escolaridad_padre)="Escolaridad del Padre"
label(data$asma_madre)="asma_madre"
label(data$bronq_cro_madre)="bronq_cro_madre"
label(data$ecv_madre)="ecv_madre"
label(data$hta_madre)="hta_madre"
label(data$acv_madre)="acv_madre"
label(data$dm_madre)="dm_madre"
label(data$asma_padre)="asma_padre"
label(data$bronq_cro_padre)="bronq_cro_padre"
label(data$ecv_padre)="ecv_padre"
label(data$hta_padre)="hta_padre"
label(data$acv_padre)="acv_padre"
label(data$dm_padre)="dm_padre"
label(data$ano_nac_h1)="ano_nac_h"
label(data$ano_nac_h2)="ano_nac_h"
label(data$ano_nac_h3)="ano_nac_h"
label(data$ano_nac_h4)="ano_nac_h"
label(data$ano_nac_h5)="ano_nac_h"
label(data$ano_nac_h6)="ano_nac_h"
label(data$ano_nac_h7)="ano_nac_h"
label(data$ano_nac_h8)="ano_nac_h"
label(data$ano_nac_h9)="ano_nac_h"
label(data$ano_nac_h10)="ano_nac_h"
label(data$ano_nac_h11)="ano_nac_h"
label(data$ano_nac_h12)="ano_nac_h"
label(data$ano_nac_h13)="ano_nac_h"
label(data$ano_nac_h14)="ano_nac_h"
label(data$ano_nac_h15)="ano_nac_h"
label(data$sexo_h1)="sexo_h"
label(data$sexo_h2)="sexo_h"
label(data$sexo_h3)="sexo_h"
label(data$sexo_h4)="sexo_h"
label(data$sexo_h5)="sexo_h"
label(data$sexo_h6)="sexo_h"
label(data$sexo_h7)="sexo_h"
label(data$sexo_h8)="sexo_h"
label(data$sexo_h9)="sexo_h"
label(data$sexo_h10)="sexo_h"
label(data$sexo_h11)="sexo_h"
label(data$sexo_h12)="sexo_h"
label(data$sexo_h13)="sexo_h"
label(data$sexo_h14)="sexo_h"
label(data$sexo_h15)="sexo_h"
label(data$asma_ant_10_h1)="asma_ant_10_h"
label(data$asma_ant_10_h2)="asma_ant_10_h"
label(data$asma_ant_10_h3)="asma_ant_10_h"
label(data$asma_ant_10_h4)="asma_ant_10_h"
label(data$asma_ant_10_h5)="asma_ant_10_h"
label(data$asma_ant_10_h6)="asma_ant_10_h"
label(data$asma_ant_10_h7)="asma_ant_10_h"
label(data$asma_ant_10_h8)="asma_ant_10_h"
label(data$asma_ant_10_h9)="asma_ant_10_h"
label(data$asma_ant_10_h10)="asma_ant_10_h"
label(data$asma_ant_10_h11)="asma_ant_10_h"
label(data$asma_ant_10_h12)="asma_ant_10_h"
label(data$asma_ant_10_h13)="asma_ant_10_h"
label(data$asma_ant_10_h14)="asma_ant_10_h"
label(data$asma_ant_10_h15)="asma_ant_10_h"
label(data$asma_des_10_h1)="asma_des_10_h"
label(data$asma_des_10_h2)="asma_des_10_h"
label(data$asma_des_10_h3)="asma_des_10_h"
label(data$asma_des_10_h4)="asma_des_10_h"
label(data$asma_des_10_h5)="asma_des_10_h"
label(data$asma_des_10_h6)="asma_des_10_h"
label(data$asma_des_10_h7)="asma_des_10_h"
label(data$asma_des_10_h8)="asma_des_10_h"
label(data$asma_des_10_h9)="asma_des_10_h"
label(data$asma_des_10_h10)="asma_des_10_h"
label(data$asma_des_10_h11)="asma_des_10_h"
label(data$asma_des_10_h12)="asma_des_10_h"
label(data$asma_des_10_h13)="asma_des_10_h"
label(data$asma_des_10_h14)="asma_des_10_h"
label(data$asma_des_10_h15)="asma_des_10_h"
label(data$rinitis_h1)="rinitis_h"
label(data$rinitis_h2)="rinitis_h"
label(data$rinitis_h3)="rinitis_h"
label(data$rinitis_h4)="rinitis_h"
label(data$rinitis_h5)="rinitis_h"
label(data$rinitis_h6)="rinitis_h"
label(data$rinitis_h7)="rinitis_h"
label(data$rinitis_h8)="rinitis_h"
label(data$rinitis_h9)="rinitis_h"
label(data$rinitis_h10)="rinitis_h"
label(data$rinitis_h11)="rinitis_h"
label(data$rinitis_h12)="rinitis_h"
label(data$rinitis_h13)="rinitis_h"
label(data$rinitis_h14)="rinitis_h"
label(data$rinitis_h15)="rinitis_h"
label(data$eczema_h1)="eczema_h"
label(data$eczema_h2)="eczema_h"
label(data$eczema_h3)="eczema_h"
label(data$eczema_h4)="eczema_h"
label(data$eczema_h5)="eczema_h"
label(data$eczema_h6)="eczema_h"
label(data$eczema_h7)="eczema_h"
label(data$eczema_h8)="eczema_h"
label(data$eczema_h9)="eczema_h"
label(data$eczema_h10)="eczema_h"
label(data$eczema_h11)="eczema_h"
label(data$eczema_h12)="eczema_h"
label(data$eczema_h13)="eczema_h"
label(data$eczema_h14)="eczema_h"
label(data$eczema_h15)="eczema_h"
label(data$antecedentes_familiares_complete)="Complete?"
label(data$cuestionario_respiratorio_2_timestamp)="Survey Timestamp"
label(data$sil_pit_v2)="1 ¿Ha tenido silbidos o pitidos en el pecho alguna vez en LOS ÚLTIMOS 12 MESES?"
label(data$sil_pit_1_1_v2)="1.1 ¿Ha presentado falta de aire cuando estaban presentes los silbidos o pitos?"
label(data$sil_pit_1_2_v2)="1.2 ¿Ha tenido estos silbidos o pitidos cuando NO estaba resfriado?"
label(data$sil_pit_1_3_v2)="1.3 ¿Qué edad tenía cuando tuvo por primera vez estos silbidos o pitidos en el pecho?"
label(data$sil_pit_1_4_v2)="1.4 ¿Con qué frecuencia tuvo silbidos o pitidos en LOS ÚLTIMOS 12 MESES?"
label(data$tirantez_v2)="2 ¿Se ha despertado con una sensación de opresión o tirantez en el pecho alguna vez en LOS ÚLTIMOS 12 MESES?"
label(data$falt_aire_v2)="3¿Ha tenido algún ataque de falta de aire durante el día en reposo alguna vez en LOS ÚLTIMOS 12 MESES?"
label(data$falt_aire_3_1_v2)="3.1 ¿Qué edad tenía cuando tuvo por primera vez un ataque de falta de aire que le vino durante el día estando en reposo? (años)"
label(data$falt_aire_ejer_v2)="4¿Ha tenido algún ataque de falta de aire DESPUÉS de hacer ejercicio físico en LOS ÚLTIMOS 12 MESES?"
label(data$falt_aire_noche_v2)="5 ¿Se ha despertado por la noche a causa de un ataque de falta de aire alguna vez en ÚLTIMOS 12 MESES?"
label(data$ata_tos_v2)="6 ¿Se ha despertado por un ataque de tos alguna vez en LOS ÚLTIMOS 12 MESES?"
label(data$ata_tos_1_1_v2)="6.1 ¿Cuántas veces?"
label(data$ata_tos_3_v2)="7¿Tose HABITUALMENTE al levantarse por la mañana durante épocas de lluvia?"
label(data$ata_tos_4_v2)="8¿Tose HABITUALMENTE de día o de noche durante épocas de lluvia?"
label(data$ata_tos_4_1_v2)="8.1 ¿Ha tenido esta tos la mayoría de los días al menos 3 MESES cada año?"
label(data$ata_tos_4_2_v2)="8.2 ¿Cuántos años hace que tiene este problema (tos, la mayoría de los días al menos 3 MESES cada año)?"
label(data$esputos_v2)="9¿ACOSTUMBRA a expulsar esputos al levantarse por la mañana durante épocas de lluvia?"
label(data$esputos_2_v2)="10 ¿ACOSTUMBRA a expulsar esputos durante el día o la noche en épocas de lluvia?"
label(data$esputos_2_1_v2)="10.1 ¿Expulsa o expectora así la mayoría de los días al menos 3 MESES en el año?"
label(data$esputos_2_2_v2)="10.2 ¿Cuántos años hace que tiene este problema (expulsar o expectorar la mayoría de los días al menos 3 MESES en el año)?"
label(data$sin_res_peor_v2)="11 En LOS ÚLTIMOS 12 MESES, ¿ha habido algún episodio/vez cuando sus síntomas (tos, expectoración, falta de aire) fueran mucho peor de lo normal?"
label(data$sin_res_peor_1_1_v2)="11.1 ¿Cuántas veces han ocurrido estos episodios?"
label(data$sin_res_peor_1_2_v2)="11.2 ¿Cuántas veces le han forzado estos episodios a consultar con su médico?"
label(data$sin_res_peor_1_3_v2)="11.3 ¿Cuántas veces le han cambiado el tratamiento después de esos episodios?"
label(data$sin_res_peor_1_4_v2)="11.4 ¿Cuántas veces ha ido a urgencias hospitalarias o ha pasado la noche en el hospital tras estos episodios?"
label(data$resp_v2)="12 ¿Tiene problemas con su respiración?"
label(data$dif_cam_v2)="13 ¿Tiene usted dificultad para caminar por una causa DIFERENTE a una enfermedad cardíaca o pulmonar?"
label(data$dif_cam_2_v2)="¿cuál?"
label(data$falt_aire_cam_v2)="14 ¿Se cansa por falta de aire cuando camina rápido en terreno llano o sube una pendiente suave?"
label(data$falt_aire_cam_2_v2)="15 ¿Le falta el aire al andar en terreno llano con gente de su misma edad?"
label(data$falt_aire_cam_3_v2)="16 ¿Tiene que parar a respirar cuando camina a su propio paso en terreno llano?"
label(data$falt_aire_cam_5_v2)="16.1 ¿Alguna vez ha tenido que pararse a recuperar el aliento tras CAMINAR 100 METROS (o pocos minutos) en un terreno llano?"
label(data$falt_aire_cam_6_v2)="17 ¿Hasta qué punto se encuentra sin aliento en estos momentos? (poco=1; mucho=10)"
label(data$asma_v2)="18 ¿Tiene o ha tenido alguna vez asma?"
label(data$asma_1_1_v2)="18.1 ¿Ha sido confirmado por un médico?"
label(data$asma_1_2_v2)="18.2 ¿Qué edad tenía cuando un médico le confirmó que tenía asma?"
label(data$asma_1_3_v2)="18.3 ¿Qué edad tenía cuando tuvo su primer ataque de asma?"
label(data$asma_1_4_v2)="18.4 ¿Qué edad tenía cuando tuvo su último ataque de asma?"
label(data$asma_1_5_v2___1)="18.5 ¿En qué meses del año suele tener ataques de asma? (choice=Enero/Febrero)"
label(data$asma_1_5_v2___2)="18.5 ¿En qué meses del año suele tener ataques de asma? (choice=Marzo/Abril)"
label(data$asma_1_5_v2___3)="18.5 ¿En qué meses del año suele tener ataques de asma? (choice=Mayo/Junio)"
label(data$asma_1_5_v2___4)="18.5 ¿En qué meses del año suele tener ataques de asma? (choice=Julio/Agosto)"
label(data$asma_1_5_v2___5)="18.5 ¿En qué meses del año suele tener ataques de asma? (choice=Septiembre/Octubre)"
label(data$asma_1_5_v2___6)="18.5 ¿En qué meses del año suele tener ataques de asma? (choice=Noviembre/Diciembre)"
label(data$asma_1_5_v2___7)="18.5 ¿En qué meses del año suele tener ataques de asma? (choice=Ningún mes en particular)"
label(data$asma_1_6_v2)="18.6 ¿Ha tenido algún ataque de asma en LOS ÚLTIMOS 12 MESES?"
label(data$asma_1_7_v2)="18.7 ¿Cuántos en LOS ÚLTIMOS 12 MESES?"
label(data$asma_1_8_v2)="14.8 ¿Cuántos en los últimos 3 MESES?"
label(data$asma_1_9_v2)="18.9 ¿Cuántas veces se ha despertado por culpa de un ataque de asma durante los últimos 3 MESES?"
label(data$asma_1_10_v2)="18.10 ¿Cuántas veces ha tenido problemas de respiración a causa del asma, durante los últimos 3 MESES?"
label(data$asma_1_11_v2)="18.11 ¿Toma actualmente alguna medicación (incluyendo inhaladores, aerosoles o pastillas) para el asma?"
label(data$asma_1_12_v2)="18.12 ¿Le ha dado su médico instrucciones por escrito sobre qué hacer respecto a su asma, en caso de ponerse peor o tener un ataque?"
label(data$bronq_cro_v2)="19 ¿Le ha dicho un médico alguna vez que tiene bronquitis crónica?"
label(data$bronq_cro_1_1_v2)="19.1 ¿Qué edad tenía cuando le diagnosticaron, por primera vez, la bronquitis crónica?"
label(data$epoc_v2)="20 ¿Le ha dicho un médico alguna vez que tiene Enfermedad Pulmonar Obstructiva Crónica (EPOC)?"
label(data$epoc_1_1_v2)="20.1 ¿Qué edad tenía cuando le diagnosticaron, por primera vez, la Enfermedad Pulmonar Obstructiva Crónica (EPOC)?"
label(data$enfisema_v2)="21 ¿Le ha dicho un médico alguna vez que tiene Enfisema?"
label(data$enfisema_1_1_v2)="21.1 ¿Qué edad tenía cuando le diagnosticaron, por primera vez, Enfisema)?"
label(data$otra_enf_pulm_v2)="22 ¿Se le diagnosticó alguna vez de otra enfermedad pulmonar (excluyendo asma, bronquitis crónica, EPOC y enfisema)?"
label(data$otra_enf_pulm_op_v2___1)="22.1 ¿Cuál es esta enfermedad pulmonar? (choice=Fibrosis quística)"
label(data$otra_enf_pulm_op_v2___2)="22.1 ¿Cuál es esta enfermedad pulmonar? (choice=Sarcoidosis)"
label(data$otra_enf_pulm_op_v2___3)="22.1 ¿Cuál es esta enfermedad pulmonar? (choice=Hipertensión pulmonar)"
label(data$otra_enf_pulm_op_v2___4)="22.1 ¿Cuál es esta enfermedad pulmonar? (choice=Aspergilosis)"
label(data$otra_enf_pulm_op_v2___5)="22.1 ¿Cuál es esta enfermedad pulmonar? (choice=Bronquiectasia)"
label(data$otra_enf_pulm_op_v2___6)="22.1 ¿Cuál es esta enfermedad pulmonar? (choice=Tuberculosis)"
label(data$otra_enf_pulm_op_v2___7)="22.1 ¿Cuál es esta enfermedad pulmonar? (choice=Otra {otra_enf_pulm_1_v2})"
label(data$otra_enf_pulm_1_v2)="¿cuál?"
label(data$rinitis_v2)="23 ¿Tiene usted alguna alergia nasal, incluyendo rinitis?"
label(data$rinitis_1_1_v2)="23.1 ¿Qué edad tenía cuando empezó a tener alergias nasales o rinitis?"
label(data$estornudos_v2)="24 ¿ALGUNA VEZ ha notado que tenía problemas de estornudos, moqueo o nariz tapada cuando no estaba resfriado o con gripe?"
label(data$estornudos_1_1_v2)="24.1 ¿DURANTE LOS ÚLTIMOS 12 MESES?"
label(data$estornudos_1_2_v2)="24.1.1 ¿Este problema de nariz ha estado acompañado por picor en los ojos o lagrimeo?"
label(data$estornudos_1_3_v2___1)="24.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Enero/Febrero)"
label(data$estornudos_1_3_v2___2)="24.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Marzo/Abril)"
label(data$estornudos_1_3_v2___3)="24.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Mayo/Junio)"
label(data$estornudos_1_3_v2___4)="24.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Julio/Agosto)"
label(data$estornudos_1_3_v2___5)="24.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Septiembre/Octubre)"
label(data$estornudos_1_3_v2___6)="24.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Noviembre/Diciembre)"
label(data$estornudos_1_3_v2___7)="24.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Ningún mes en particular)"
label(data$estornudos_1_4_v2)="24.1.3 ¿Ha tenido este problema durante MÁS DE 4 DÍAS EN UNA SEMANA en LOS ÚLTIMOS 12 MESES?"
label(data$estornudos_1_5_v2)="24.1.3.1 ¿Le ha pasado durante MÁS DE 4 SEMANAS CONSECUTIVAS?"
label(data$moq_nariz_v2)="Moqueo de la nariz"
label(data$nariz_tapada_v2)="Nariz tapada"
label(data$picor_nariz_v2)="Picor en la nariz"
label(data$estornudos_2_v2)="Estornudos"
label(data$ojos_llorosos_v2)="Picor en los ojos llorosos"
label(data$tras_nas_v2)="25 ¿ha utilizado algún medicamento para tratar los trastornos nasales?"
label(data$tras_nas_1_1_v2)="25.1 ¿Ha utilizado alguna pastillas, comprimidos o tabletas para tratar sus problemas de nariz?"
label(data$tras_nas_1_2_v2)="25.1.1 ¿durante LOS ÚLTIMOS 12 MESES?"
label(data$nar_tap_v2)="26 ¿Ha tenido la nariz tapada DURANTE MÁS DE 3 MESES EN LOS ÚLTIMOS 12 MESES?"
label(data$pre_fre_v2)="27 ¿Ha tenido dolor o presión alrededor de la frente, nariz u ojos POR MÁS DE 3 MESES EN LOS ÚLTIMOS 12 MESES?"
label(data$mucosidad_v2)="28 ¿Ha tenido mucosidad de color anormal en la nariz o garganta POR MÁS DE 3 MESES EN LOS ÚLTIMOS 12 MESES?"
label(data$olfato_v2)="29 ¿Ha perdido olfato total o parcialmente DURANTE MÁS DE 3 MESES EN LOS ÚLTIMOS 12 MESES?"
label(data$sinusitis_v2)="30 ¿Le ha dicho un médico ALGUNA VEZ que tiene sinusitis crónica?"
label(data$sinusitis_1_1_v2)="30.1 ¿Le ha dicho un médico ALGUNA VEZ que tiene pólipos nasales?"
label(data$sinusitis_1_2_v2)="30.2 ¿Qué edad tenía cuando un médico le dijo que tenía sinusitis crónica?"
label(data$sinusitis_1_3_v2)="30.3 ¿Qué edad tenía cuando un médico le dijo que tenía pólipos nasales?"
label(data$eczema_v2)="31 ¿Ha tenido ALGUNA VEZ eczema u otro tipo de alergia en la piel?"
label(data$eczema_1_1_v2)="31.1 ¿Qué edad tenía la primera vez que tuvo eczema o alergia en la piel?"
label(data$eczema_1_2_v2)="31.2 ¿El eczema o la alergia dérmica le afecta o afectaba las manos?"
label(data$eczema_1_3_v2)="31.3 ¿Ha notado que el contacto con algunos materiales, productos químicos o alguna otra cosa EN SU TRABAJO le agrava el eczema?"
label(data$sarpullidos_v2)="32 ¿ALGUNA VEZ ha tenido algún sarpullido o erupción cutánea con picor que apareciera y desapareciera durante AL MENOS 6 MESES?"
label(data$erupcion_v2)="32.1 ¿Ha tenido esta erupción con picor EN LOS ÚLTIMOS 12 MESES?"
label(data$erupcion_1_1_v2)="32.1.1 ¿Esta erupción con picor le ha afectado ALGUNA VEZ en alguno de estos puntos: ¿parte interna de los codos, detrás de las rodillas, parte de delante de los tobillos, debajo de las nalgas o alrededor del cuello, orejas u ojos?"
label(data$erupcion_1_2_v2)="32.1.2 ¿Esta erupción con picor le ha afectado alguna vez en las manos EN LOS ÚLTIMOS 12 MESES?"
label(data$expo_trab2_v2)="33 ¿Ha tenido que dejar de trabajar del todo por asma, silbidos al respirar, falta de aliento u otros problemas respiratorios o pulmonares?"
label(data$expo_trab2_fec_v2)="¿cuándo ocurrió?"
label(data$expo_trab1_v2)="34 ¿En su trabajo actual, está regularmente expuesto a vapores, gas, polvo o humo?"
label(data$expo_trab1_1_v2)="34.1 ¿Nota problemas respiratorios (opresión en el pecho, silbidos, tos) al estar en su trabajo actual?"
label(data$expo_trab1_1_1_v2___1)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=Esfuerzos físicos)"
label(data$expo_trab1_1_1_v2___3)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=Exposición a nieblas, frio o calor)"
label(data$expo_trab1_1_1_v2___4)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=Exposición a vapores, gas, polvo, humo)"
label(data$expo_trab1_1_1_v2___5)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=Humo de cigarrillos de otros)"
label(data$expo_trab1_1_1_v2___6)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=Estrés)"
label(data$expo_trab1_1_1_v2___7)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=No)"
label(data$expo_trab1_1_2_v2)="34.1.2 ¿Estos problemas respiratorios se alivian o desaparecen DURANTE EL FIN DE SEMANA O VACACIONES?"
label(data$humed_trab1_v2)="35 ¿En LOS ÚLTIMOS 12 MESES ha habido puntos húmedos o mojados en superficies en la sala donde trabaja habitualmente (por ejemplo, en las paredes, papel pintado, el techo o las moquetas)?"
label(data$moho_trab1_v2)="36 ¿En LOS ÚLTIMOS 12 MESES ha habido moho en alguna de las superficies de la sala donde suele trabajar?"
label(data$moho_alim_trab1_v2)="37 ¿En algún momento de LOS ÚLTIMOS 12 MESES ha notado olor a moho (no procedente de alimentos) en la sala donde suele trabajar?"
label(data$pro_lim_trab1_v2)="38 ¿En su trabajo actual, ¿utiliza regularmente PRODUCTOS DE LIMPIEZA o DESINFECTANTES?"
label(data$pro_lim_trab1_1_v2)="38.1 En LOS ÚLTIMOS 12 MESES, ¿cuántos días a la semana ha utilizado los siguientes productos en su trabajo?     Frecuencia de uso   Hipoclorito {hipoclorito_1_v2}   Amoníaco {amoniaco_1_v2}   Quitamanchas u otros disvolventes {quitamanchas_1_v2}   Ácidos (vinagre, cal) {acidos_1_v2}   Ceras para el suelo {ceras_suelos_1_v2}   Ceras para muebles {ceras_muebles_1_v2}   Sprays para suelo {sprays_suelos_1_v2}   Sprays para muebles {sprays_muebles_1_v2}   Detergentes (fabuloso, fab) {detergentes_1_v2}   Sprays para cristales {sprays_cristales_1_v2}   Sprays desengrasantes {sprays_desengrasantes_1_v2}   Alcohol {alcohol_1_v2}   Jabones {jabones_1_v2}   Cualquier otro desinfectante químico {otro_desinfectante_1_v2}   "
label(data$hipoclorito_1_v2)="Hipoclorito"
label(data$amoniaco_1_v2)="Amoníaco"
label(data$quitamanchas_1_v2)="Quitamanchas u otros disolventes"
label(data$acidos_1_v2)="Ácidos (vinagre, cal)"
label(data$ceras_suelos_1_v2)="Ceras para suelo"
label(data$ceras_muebles_1_v2)="Ceras para muebles"
label(data$sprays_suelos_1_v2)="Sprays para suelos"
label(data$sprays_muebles_1_v2)="Sprays para muebles"
label(data$detergentes_1_v2)="Detergentes (ej. fabuloso, fab)"
label(data$sprays_cristales_1_v2)="Sprays para limpiar cristales"
label(data$alcohol_1_v2)="Alcohol"
label(data$jabones_1_v2)="Jabones"
label(data$otro_desinfectante_1_v2)="Cualquier otro desinfectante químico"
label(data$sprays_desengrasantes_1_v2)="Sprays desengrasantes"
label(data$expo_v2)="39 ¿Ha sido involucrado alguna vez en un algún incidente en casa, en el trabajo o en cualquier otro lugar que le expusiera a niveles altos de vapores, gases, polvos o humos?"
label(data$expo_2_v2)="¿cuando ocurrió?"
label(data$expo_2_1_v2)="39.2 ¿Puede clasificar este incidente?"
label(data$expo_2_2_v2)="39.3 ¿Dónde tuvo lugar este incidente?"
label(data$expo_2_3_v2)="39.4 ¿Notó síntomas respiratorios después del accidente, dentro de las 24 horas siguientes?"
label(data$expo_2_4_1_v2)="39.4.1 ¿Tuvo que pedir asistencia médica a causa de estos síntomas?"
label(data$constr_casa_v2)="40. ¿Hace cuánto se construyó la casa/piso en la que está viviendo ahora?"
label(data$domicilio_v2)="41 ¿Cuántos años lleva en su domicilio actual?"
label(data$vivienda_v2)="42 El lugar donde vive es:"
label(data$vivienda_otro_v2)="¿cuál?"
label(data$vivienda_hab_v2)="43¿Cuántas habitaciones tiene su casa?(sin contar la cocina, el cuarto de baño, aseo, lavadero)"
label(data$num_indi_vivienda_v2)="44 ¿Cuánta gente vive en su casa, incluyéndole?"
label(data$air_acon_v2)="45 ¿En su casa hay aire acondicionado?"
label(data$combus_cocinar_v2___1)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Combustible sólido (carbón, madera))"
label(data$combus_cocinar_v2___2)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Gas ciudad)"
label(data$combus_cocinar_v2___3)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Electricidad)"
label(data$combus_cocinar_v2___4)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Parafina/queroseno)"
label(data$combus_cocinar_v2___5)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Micro-ondas)"
label(data$combus_cocinar_v2___6)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Gas propano (cilindro))"
label(data$combus_cocinar_v2___7)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Otro {otro_combus_cocinar_v2})"
label(data$otro_combus_cocinar_v2)="¿Cuál?"
label(data$cocina_v2)="47. ¿Usted cocina?"
label(data$cocinar_dia_v2)="47.1 Durante EL ÚLTIMO MES, en promedio, ¿cuánto tiempo AL DÍA ha pasado guisando en su cocina? (minutos)"
label(data$cocinar_ventana_v2)="47.2Durante EL ÚLTIMO MES, ¿ha dejado una puerta o una ventana abierta, que dé al exterior, mientras estaba guisando?"
label(data$extractor_v2)="48 ¿Tiene extractor encima de la cocina?"
label(data$extrator_1_1_v2)="48.1 Al cocinar, ¿usa el extractor?"
label(data$goteras_v2)="49 ¿Ha habido algún problema con el agua en su casa, de cañerías, goteras o inundaciones?"
label(data$goteras_1_v2)="49.1 ¿Ha habido algún problema con el agua en LOS ÚLTIMOS 12 MESES?"
label(data$manchas_v2)="50 DURANTE LOS ÚLTIMOS 12 MESES, ¿han salido manchas o zonas de humedad en el interior de su casa, sin contar las del sótano? (por ejemplo, en las paredes, techos o moquetas)?"
label(data$moho_manchas_casa_v2)="51 ¿Ha habido alguna vez moho en alguna parte dentro de su casa?(excepto alimentos)"
label(data$moho_casa_v2)="51.1 Ha habido moho en alguna parte dentro de la casa en LOS ÚLTIMOS 12 MESES?"
label(data$moho_lugar_v2___1)="51.1.1 ¿A qué lugares afectó? (choice=Baño(s))"
label(data$moho_lugar_v2___2)="51.1.1 ¿A qué lugares afectó? (choice=Dormitorio(s))"
label(data$moho_lugar_v2___3)="51.1.1 ¿A qué lugares afectó? (choice=Sala de estar o comedor)"
label(data$moho_lugar_v2___4)="51.1.1 ¿A qué lugares afectó? (choice=Cocina)"
label(data$moho_lugar_v2___5)="51.1.1 ¿A qué lugares afectó? (choice=Garaje)"
label(data$moho_lugar_v2___6)="51.1.1 ¿A qué lugares afectó? (choice=Otro {moho_lugar_otro_v2})"
label(data$moho_lugar_otro_v2)="¿cuál?"
label(data$moho_casa_2_v2)="52 ¿Ha notado olor de moho (no de alimentos) en su casa en cualquier momento en LOS ÚLTIMOS 12 MESES?"
label(data$colchon_v2)="57¿Cuántos meses o años tiene el colchón donde actualmente duerme?"
label(data$ventanas_2_v2)="58.1 Duerme con las ventanas abiertas:"
label(data$gato_1_v2)="59.1¿Permite a su gato (o gatos) entrar a su casa?"
label(data$gato_2_v2)="59.2 ¿Permite a su gato (o gatos) entrar en su dormitorio?"
label(data$perro_v2)="60 ¿Tiene un perro?"
label(data$perro_1_v2)="60.1 ¿Permite a su perro (o perros) entrar a su casa?"
label(data$perro_2_v2)="60.2 ¿Permite a su perro (o perros) entrar en su dormitorio?"
label(data$pajaro_v2)="61 ¿Tiene pájaro?"
label(data$pajaro_1_v2)="61.1 ¿Permite a su pájaro (pájaros) entrar a su casa?"
label(data$enfer_alime_v2)="66 ¿Ha tenido alguna enfermedad o problema provocado por comer un alimento o alimentos EN PARTICULAR?"
label(data$enfer_alime_siem_v2)="66.1 ¿Ha tenido casi siempre la misma enfermedad o problema después de comer ese tipo de alimento?"
label(data$alime_v2___1)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Leche de vaca)"
label(data$alime_v2___2)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Huevos de gallina)"
label(data$alime_v2___3)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Pescado)"
label(data$alime_v2___4)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Gambas o langostas)"
label(data$alime_v2___5)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Cacahuetes)"
label(data$alime_v2___6)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Avellanas)"
label(data$alime_v2___7)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Nueces)"
label(data$alime_v2___8)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Melocotón)"
label(data$alime_v2___9)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Manzanas)"
label(data$alime_v2___10)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Kiwi)"
label(data$alime_v2___11)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Banano)"
label(data$alime_v2___12)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Melón)"
label(data$alime_v2___13)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Tomate)"
label(data$alime_v2___14)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Ápio)"
label(data$alime_v2___15)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Zanahoria)"
label(data$alime_v2___16)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Soja)"
label(data$alime_v2___17)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Lentejas)"
label(data$alime_v2___18)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Trigo)"
label(data$alime_v2___19)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Maíz)"
label(data$alime_v2___20)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Arroz)"
label(data$alime_v2___21)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Semillas de sésamo)"
label(data$alime_v2___22)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Semillas de mostaza)"
label(data$alime_v2___23)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Semillas de girasol)"
label(data$alime_v2___24)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Semillas de amapola)"
label(data$alime_v2___26)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Otro {alime_otro_v2})"
label(data$alime_v2___27)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Otro {alime_otro_2_v2})"
label(data$alime_v2___28)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Otro {alime_otro_3_v2})"
label(data$alime_otro_v2)="¿cuál es el nombre?"
label(data$alime_otro_2_v2)="¿cuál es el nombre?"
label(data$alime_otro_3_v2)="¿cuál es el nombre?"
label(data$enro_alime_otro_1_v2)="¿enrojecimiento o picor en la piel?"
label(data$vomi_alime_otro_1_v2)="¿diarrea o vómitos?"
label(data$tapa_alime_otro_1_v2)="¿le gotea o se le tapa la nariz?"
label(data$dol_cab_alime_otro_1_v2)="¿dolores de cabeza fuertes?"
label(data$alien_alime_otro_1_v2)="¿pérdida del aliento?"
label(data$picor_alime_otro_1_v2)="¿picor, cosquilleo, inflamación de la boca, labios o garganta?"
label(data$dif_tra_alime_otro_1_v2)="¿dificultad al tragar?"
label(data$desma_alime_otro_1_v2)="¿desmayos o mareos?"
label(data$inye_alime_otro_1_v2)="¿síntomas tan graves que un medico tuvo que ponerle una inyección de emergencia?"
label(data$otro_alime_otro_1_v2)="¿otro?"
label(data$otro_alime_otro_1_1_v2)="¿cuál?"
label(data$tiemp_alime_otro_1_v2)="¿Cuánto tiempo después de tomar ese alimento tuvo los primeros síntomas?"
label(data$edad_alime_otro_1_v2)="¿Qué edad tenía cuanto tuvo ese ataque por primera vez?"
label(data$veces_alime_otro_1_v2)="¿Cuántas veces le ha pasado eso en la vida?"
label(data$enro_alime_otro_2_v2)="¿presentó enrojecimiento o picor en la piel?"
label(data$vomi_alime_otro_2_v2)="¿diarrea o vómitos?"
label(data$picor_alime_otro_2_v2)="¿picor, cosquilleo, inflamación de la boca, labios o garganta?"
label(data$dif_tra_alime_otro_2_v2)="¿dificultad al tragar?"
label(data$desma_alime_otro_2_v2)="¿desmayos o mareos?"
label(data$inye_alime_otro_2_v2)="¿síntomas tan graves que un medico tuvo que ponerle una inyección de emergencia?"
label(data$otro_alime_otro_2_v2)="¿otro?"
label(data$otro_alime_otro_1_2_v2)="¿cuál?"
label(data$tiemp_alime_otro_2_v2)="¿Cuánto tiempo después de tomar ese alimento tuvo los primeros síntomas?"
label(data$edad_alime_otro_2_v2)="¿Qué edad tenía cuanto tuvo ese ataque por primera vez?"
label(data$veces_alime_otro_2_v2)="¿Cuántas veces le ha pasado eso en la vida?"
label(data$enro_alime_otro_3_v2)="¿presentó enrojecimiento o picor en la piel?"
label(data$vomi_alime_otro_3_v2)="¿diarrea o vómitos?"
label(data$picor_alime_otro_3_v2)="¿picor, cosquilleo, inflamación de la boca, labios o garganta?"
label(data$dif_tra_alime_otro_3_v2)="¿dificultad al tragar?"
label(data$desma_alime_otro_3_v2)="¿desmayos o mareos?"
label(data$inye_alime_otro_3_v2)="¿síntomas tan graves que un medico tuvo que ponerle una inyección de emergencia?"
label(data$otro_alime_otro_3_v2)="¿otro?"
label(data$otro_alime_otro_1_3_v2)="¿cuál?"
label(data$tiemp_alime_otro_3_v2)="¿Cuánto tiempo después de tomar ese alimento tuvo los primeros síntomas?"
label(data$edad_alime_otro_3_v2)="¿Qué edad tenía cuanto tuvo ese ataque por primera vez?"
label(data$veces_alime_otro_3_v2)="¿Cuántas veces le ha pasado eso en la vida?"
label(data$tos_anim_v2)="67.1 ¿empieza a toser?"
label(data$tos_anim_op_v2___1)="67.1.1 Cuando está cerca de: (choice=Gatos)"
label(data$tos_anim_op_v2___2)="67.1.1 Cuando está cerca de: (choice=Perros)"
label(data$tos_anim_op_v2___3)="67.1.1 Cuando está cerca de: (choice=Caballos)"
label(data$tos_anim_op_v2___4)="67.1.1 Cuando está cerca de: (choice=Otros)"
label(data$sil_anim_v2)="67.2 ¿empieza a tener silbidos o pitidos?"
label(data$sil_anim_op_v2___1)="67.2.1 Cuando está cerca de: (choice=Gatos)"
label(data$sil_anim_op_v2___2)="67.2.1 Cuando está cerca de: (choice=Perros)"
label(data$sil_anim_op_v2___3)="67.2.1 Cuando está cerca de: (choice=Caballos)"
label(data$sil_anim_op_v2___4)="67.2.1 Cuando está cerca de: (choice=Otros)"
label(data$opre_anim_v2)="67.3 ¿tiene sensación de opresión o tirantez en el pecho?"
label(data$opre_anim_op_v2___1)="67.3.1 Cuando está cerca de: (choice=Gatos)"
label(data$opre_anim_op_v2___2)="67.3.1 Cuando está cerca de: (choice=Perros)"
label(data$opre_anim_op_v2___3)="67.3.1 Cuando está cerca de: (choice=Caballos)"
label(data$opre_anim_op_v2___4)="67.3.1 Cuando está cerca de: (choice=Otros)"
label(data$falt_aire_anim_v2)="67.4 ¿empieza a sentir falta de aire?"
label(data$falta_aire_anim_op_v2___1)="67.4.1 Cuando está cerca de: (choice=Gatos)"
label(data$falta_aire_anim_op_v2___2)="67.4.1 Cuando está cerca de: (choice=Perros)"
label(data$falta_aire_anim_op_v2___3)="67.4.1 Cuando está cerca de: (choice=Caballos)"
label(data$falta_aire_anim_op_v2___4)="67.4.1 Cuando está cerca de: (choice=Otros)"
label(data$nariz_anim_v2)="67.5 ¿le gotea o se le tapa la nariz o empieza a estornudar?"
label(data$nariz_anim_op_v2___1)="67.5.1 Cuando está cerca de: (choice=Gatos)"
label(data$nariz_anim_op_v2___2)="67.5.1 Cuando está cerca de: (choice=Perros)"
label(data$nariz_anim_op_v2___3)="67.5.1 Cuando está cerca de: (choice=Caballos)"
label(data$nariz_anim_op_v2___4)="67.5.1 Cuando está cerca de: (choice=Otros)"
label(data$ojos_anim_v2)="67.6 ¿le pican o le lloran los ojos?"
label(data$ojos_anim_op_v2___1)="67.6.1 Cuando está cerca de: (choice=Gatos)"
label(data$ojos_anim_op_v2___2)="67.6.1 Cuando está cerca de: (choice=Perros)"
label(data$ojos_anim_op_v2___3)="67.6.1 Cuando está cerca de: (choice=Caballos)"
label(data$ojos_anim_op_v2___4)="67.6.1 Cuando está cerca de: (choice=Otros)"
label(data$tos_2_v2)="68.1 ¿empieza a toser?"
label(data$sil_2_v2)="68.2 ¿empieza a tener silbidos o pitidos?"
label(data$opre_2_v2)="68.3 ¿tiene sensación de opresión o tirantez en el pecho?"
label(data$falt_aire_2_v2)="68.4 ¿empieza a sentir falta de aire?"
label(data$nariz_2_v2)="68.5 ¿le gotea o se le tapa la nariz o empieza a estornudar?"
label(data$ojos_2_v2)="68.6 ¿le pican o le lloran los ojos?"
label(data$tos_3_v2)="69.1 ¿empieza a toser?"
label(data$sil_3_v2)="69.2 ¿empieza a tener silbidos o pitidos?"
label(data$opre_3_v2)="69.3 ¿tiene sensación de opresión o tirantez en el pecho?"
label(data$falt_aire_3_v2)="69.4 ¿empieza a sentir falta de aire?"
label(data$nariz_3_v2)="69.5 ¿le gotea o se le tapa la nariz o empieza a estornudar?"
label(data$ojos_3_v2)="69.6 ¿le pican o le lloran los ojos?"
label(data$med_inha_v2)="70 ¿Ha usado en alguna ocasión medicinas INHALADAS para mejorar su respiración alguna vez en los últimos meses?"
label(data$ago_beta2_v2)="70.1 Agonistas-beta-2 (sólo) inhalados de ACCIÓN CORTA."
label(data$ago_beta2_corta_1_v2)="¿cuál?"
label(data$ago_beta2_corta_2_v2)="¿cuál?"
label(data$ago_beta2_corta_3_v2)="¿cuál?"
label(data$ago_beta2_corta_4_v2)="¿cuál?"
label(data$ago_beta2_dosis_1_v2)="¿cuántos puff aplica?"
label(data$ago_beta2_dosis_2_v2)="¿cuántos puff aplica?"
label(data$ago_beta2_dosis_3_v2)="¿cuántos puff aplica?"
label(data$ago_beta2_dosis_4_v2)="¿cuántos puff aplica?"
label(data$ago_beta2_fr_1_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$ago_beta2_fr_2_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$ago_beta2_fr_3_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$ago_beta2_fr_4_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_ago_beta2_corto_1_v2)="Número de inhalaciones al mes"
label(data$mes_ago_beta2_corto_2_v2)="Número de inhalaciones al mes"
label(data$mes_ago_beta2_corto_3_v2)="Número de inhalaciones al mes"
label(data$mes_ago_beta2_corto_4_v2)="Número de inhalaciones al mes"
label(data$dia_ago_beta2_corto_1_v2)="Número de inhalaciones al día"
label(data$dia_ago_beta2_corto_2_v2)="Número de inhalaciones al día"
label(data$dia_ago_beta2_corto_3_v2)="Número de inhalaciones al día"
label(data$dia_ago_beta2_corto_4_v2)="Número de inhalaciones al día"
label(data$ago_beta2_pro_v2)="70.2Agonistas-beta-2 (sólo) inhalados de ACCIÓN PROLONGADA."
label(data$ago_beta2_pro_1_v2)="¿cuál?"
label(data$ago_beta2_pro_2_v2)="¿cuál?"
label(data$ago_beta2_dosis_5_v2)="¿cuántos puff aplica?"
label(data$ago_beta2_dosis_6_v2)="¿cuántos puff aplica?"
label(data$ago_beta2_fr_5_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$ago_beta2_fr_6_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_ago_beta2_pro_1_v2)="Número de inhalaciones al mes"
label(data$mes_ago_beta2_pro_2_v2)="Número de inhalaciones al mes"
label(data$dia_ago_beta2_pro_1_v2)="Número de inhalaciones al día"
label(data$dia_ago_beta2_pro_2_v2)="Número de inhalaciones al día"
label(data$antimus_cort_v2)="70.3 Antimuscarínicos inhalados de ACCIÓN CORTA"
label(data$antimus_corta_1_v2)="¿cuál?"
label(data$antimus_dosis_1_v2)="¿cuántos puff aplica?"
label(data$antimus_fr_1_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_antimus_corta_1_v2)="Número de inhalaciones al mes"
label(data$dia_antimus_corta_1_v2)="Número de inhalaciones al día"
label(data$antimus_pro_v2)="70.4Antimuscarínicos inhalados de ACCIÓN PROLONGADA"
label(data$antimus_pro_1_v2)="¿cuál?"
label(data$antimus_pro_2_v2)="¿cuál?"
label(data$antimus_dosis_2_v2)="¿cuántos puff aplica?"
label(data$antimus_dosis_3_v2)="¿cuántos puff aplica?"
label(data$antimus_fr_2_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$antimus_fr_3_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_antimus_pro_1_v2)="Número de inhalaciones al mes"
label(data$mes_antimus_pro_2_v2)="Número de inhalaciones al mes"
label(data$dia_antimus_pro_1_v2)="Número de inhalaciones al día"
label(data$dia_antimus_pro_2_v2)="Número de inhalaciones al día"
label(data$este_inha_v2)="70.5 esteroides inhalados (SÓLO)"
label(data$este_inha_1_v2)="¿cuál?"
label(data$este_inha_2_v2)="¿cuál?"
label(data$este_inha_3_v2)="¿cuál?"
label(data$este_inha_4_v2)="¿cuál?"
label(data$este_inha_5_v2)="¿cuál?"
label(data$este_inha_6_v2)="¿cuál?"
label(data$este_dosis_1_v2)="¿cuanto aplica?"
label(data$este_dosis_2_v2)="¿cuanto aplica?"
label(data$este_dosis_3_v2)="¿cuanto aplica?"
label(data$este_dosis_4_v2)="¿cuanto aplica?"
label(data$este_dosis_5_v2)="¿cuanto aplica?"
label(data$este_dosis_6_v2)="¿cuanto aplica?"
label(data$este_fr_1_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$este_fr_2_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$este_fr_3_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$este_fr_4_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$este_fr_5_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$este_fr_6_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_este_1_v2)="Número de inhalaciones al mes"
label(data$mes_este_2_v2)="Número de inhalaciones al mes"
label(data$mes_este_3_v2)="Número de inhalaciones al mes"
label(data$mes_este_4_v2)="Número de inhalaciones al mes"
label(data$mes_este_5_v2)="Número de inhalaciones al mes"
label(data$mes_este_6_v2)="Número de inhalaciones al mes"
label(data$dia_este_1_v2)="Número de inhalaciones al día"
label(data$dia_este_2_v2)="Número de inhalaciones al día"
label(data$dia_este_3_v2)="Número de inhalaciones al día"
label(data$dia_este_4_v2)="Número de inhalaciones al día"
label(data$dia_este_5_v2)="Número de inhalaciones al día"
label(data$dia_este_6_v2)="Número de inhalaciones al día"
label(data$combi_inha_v2)="70.6 esteroides inhalados y agonistas beta 2 (TERAPIA COMBINADA)"
label(data$combi_inha_op_v2___7)="¿cuál? (choice=Salbutamol)"
label(data$combi_inha_op_v2___8)="¿cuál? (choice=Salmeterol)"
label(data$combi_inha_op_v2___9)="¿cuál? (choice=Bromuro de Ipatropio)"
label(data$combi_inha_op_v2___10)="¿cuál? (choice=Bromuro de Tiotropio)"
label(data$combi_inha_op_v2___11)="¿cuál? (choice=Glicopirronio)"
label(data$combi_inha_op_v2___1)="¿cuál? (choice=Beclometasona)"
label(data$combi_inha_op_v2___2)="¿cuál? (choice=Budesonida)"
label(data$combi_inha_op_v2___3)="¿cuál? (choice=Ciclesonida)"
label(data$combi_inha_op_v2___4)="¿cuál? (choice=Fluticasona)"
label(data$combi_inha_op_v2___5)="¿cuál? (choice=Furoato de Mometasona)"
label(data$combi_inha_op_v2___6)="¿cuál? (choice=Acetonida de Triamcinolona)"
label(data$combi_inha_1_v2)="¿cuál?"
label(data$combi_inha_2_v2)="¿cuál?"
label(data$combi_inha_3_v2)="¿cuál?"
label(data$combi_inha_4_v2)="¿cuál?"
label(data$combi_inha_5_v2)="¿cuál?"
label(data$combi_inha_6_v2)="¿cuál?"
label(data$combi_inha_7_v2)="¿cuál?"
label(data$combi_inha_8_v2)="¿cuál?"
label(data$combi_inha_9_v2)="¿cuál?"
label(data$combi_inha_10_v2)="¿cuál?"
label(data$combi_inha_11_v2)="¿cuál?"
label(data$combi_dosis_1_v2)="¿cuanto aplica?"
label(data$combi_dosis_2_v2)="¿cuanto aplica?"
label(data$combi_dosis_3_v2)="¿cuanto aplica?"
label(data$combi_dosis_4_v2)="¿cuanto aplica?"
label(data$combi_dosis_5_v2)="¿cuanto aplica?"
label(data$combi_dosis_6_v2)="¿cuanto aplica?"
label(data$combi_dosis_7_v2)="¿cuanto aplica?"
label(data$combi_dosis_8_v2)="¿cuanto aplica?"
label(data$combi_dosis_9_v2)="¿cuanto aplica?"
label(data$combi_dosis_10_v2)="¿cuanto aplica?"
label(data$combi_dosis_11_v2)="¿cuanto aplica?"
label(data$combi_fr_1_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_2_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_3_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_4_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_5_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_6_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_7_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_8_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_9_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_10_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_11_v2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_combi_1_v2)="Número de inhalaciones al mes"
label(data$mes_combi_2_v2)="Número de inhalaciones al mes"
label(data$mes_combi_3_v2)="Número de inhalaciones al mes"
label(data$mes_combi_4_v2)="Número de inhalaciones al mes"
label(data$mes_combi_5_v2)="Número de inhalaciones al mes"
label(data$mes_combi_6_v2)="Número de inhalaciones al mes"
label(data$mes_combi_7_v2)="Número de inhalaciones al mes"
label(data$mes_combi_8_v2)="Número de inhalaciones al mes"
label(data$mes_combi_9_v2)="Número de inhalaciones al mes"
label(data$mes_combi_10_v2)="Número de inhalaciones al mes"
label(data$mes_combi_11_v2)="Número de inhalaciones al mes"
label(data$dia_combi_1_v2)="Número de inhalaciones al día"
label(data$dia_combi_2_v2)="Número de inhalaciones al día"
label(data$dia_combi_3_v2)="Número de inhalaciones al día"
label(data$dia_combi_4_v2)="Número de inhalaciones al día"
label(data$dia_combi_5_v2)="Número de inhalaciones al día"
label(data$dia_combi_6_v2)="Número de inhalaciones al día"
label(data$dia_combi_7_v2)="Número de inhalaciones al día"
label(data$dia_combi_8_v2)="Número de inhalaciones al día"
label(data$dia_combi_9_v2)="Número de inhalaciones al día"
label(data$dia_combi_10_v2)="Número de inhalaciones al día"
label(data$dia_combi_11_v2)="Número de inhalaciones al día"
label(data$edad_este_inha_v2)="70.7 ¿Qué edad tenía cuando empezó a utilizar esteroides inhalados?"
label(data$edad_este_inha_2_v2)="70.8 ¿Qué edad tenía la última vez que usó esteroides por inhalación?"
label(data$antibi_v2)="72 ¿Se ha tratado con antibióticos en LOS ÚLTIMOS 12 MESES para facilitar la respiración?"
label(data$atb_cuales___1)="¿Cuales de los siguientes? (choice=Azitromicina)"
label(data$atb_cuales___2)="¿Cuales de los siguientes? (choice=Eritromicina)"
label(data$atb_cuales___3)="¿Cuales de los siguientes? (choice=Claritromicina)"
label(data$atb_cuales___4)="¿Cuales de los siguientes? (choice=Amoxicilina)"
label(data$atb_cuales___5)="¿Cuales de los siguientes? (choice=Amoxicilina clavulonato)"
label(data$atb_cuales___6)="¿Cuales de los siguientes? (choice=Penicilina G)"
label(data$atb_cuales___7)="¿Cuales de los siguientes? (choice=Penicilina Benzatínica)"
label(data$atb_cuales___8)="¿Cuales de los siguientes? (choice=Amplicilina)"
label(data$atb_cuales___9)="¿Cuales de los siguientes? (choice=Ácido nalidíxico)"
label(data$atb_cuales___10)="¿Cuales de los siguientes? (choice=Ciprofloxacina)"
label(data$atb_cuales___11)="¿Cuales de los siguientes? (choice=Norfloxacina)"
label(data$atb_cuales___12)="¿Cuales de los siguientes? (choice=Cefalexina)"
label(data$atb_cuales___13)="¿Cuales de los siguientes? (choice=Ceftriazona)"
label(data$atb_cuales___14)="¿Cuales de los siguientes? (choice=Otro {atb_otro})"
label(data$antibi_1_v2)="72.1 ¿cuantas veces en el año?"
label(data$antibi_2_v2)="73¿Ha utilizado antibióticos por problemas nasales/de sinusitis en LOS ÚLTIMOS 12 MESES?"
label(data$remedio_v2)="74¿Ha tomado algún otro remedio para mejorar su respiración alguna vez en LOS ÚLTIMOS 12 MESES?"
label(data$remedio_op_v2___1)="74.1 ¿Es alguno de los siguientes? (choice=Hipnoterapia)"
label(data$remedio_op_v2___2)="74.1 ¿Es alguno de los siguientes? (choice=Acupuntura)"
label(data$remedio_op_v2___3)="74.1 ¿Es alguno de los siguientes? (choice=Homeopatía)"
label(data$remedio_op_v2___4)="74.1 ¿Es alguno de los siguientes? (choice=Control de dieta)"
label(data$remedio_op_v2___5)="74.1 ¿Es alguno de los siguientes? (choice=Ejercicios de respiración)"
label(data$remedio_op_v2___6)="74.1 ¿Es alguno de los siguientes? (choice=Natación u otros ejercicios)"
label(data$remedio_op_v2___7)="74.1 ¿Es alguno de los siguientes? (choice=Reflexología)"
label(data$remedio_op_v2___8)="74.1 ¿Es alguno de los siguientes? (choice=Desconocido)"
label(data$remedio_op_v2___9)="74.1 ¿Es alguno de los siguientes? (choice=Otro {remedio_otro_1_v2})"
label(data$remedio_op_v2___10)="74.1 ¿Es alguno de los siguientes? (choice=Otro {remedio_otro_2_v2})"
label(data$remedio_op_v2___11)="74.1 ¿Es alguno de los siguientes? (choice=Otro {remedio_otro_3_v2})"
label(data$remedio_op_v2___12)="74.1 ¿Es alguno de los siguientes? (choice=Otro {remedio_otro_4_v2})"
label(data$remedio_op_v2___13)="74.1 ¿Es alguno de los siguientes? (choice=Otro {remedio_otro_5_v2})"
label(data$remedio_otro_1_v2)="remedio_otro"
label(data$remedio_otro_2_v2)="remedio_otro"
label(data$remedio_otro_3_v2)="remedio_otro"
label(data$remedio_otro_4_v2)="remedio_otro"
label(data$remedio_otro_5_v2)="remedio_otro"
label(data$acetaminofen_v2)="77¿Con qué frecuencia toma acetaminofen?"
label(data$acetaminofen_2_v2___1)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Dolor de cabeza)"
label(data$acetaminofen_2_v2___2)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Dolor de espalda o artritis)"
label(data$acetaminofen_2_v2___3)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Problemas de pecho)"
label(data$acetaminofen_2_v2___4)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Dolor menstrual)"
label(data$acetaminofen_2_v2___6)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Dolor en el cuerpo)"
label(data$acetaminofen_2_v2___5)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Otros {aceta_otro_v2})"
label(data$aceta_otro_v2)=""
label(data$analgesico_v2)="78 ¿Con qué frecuencia toma analgésicos, aparte de acetaminofen?"
label(data$analgesico_3_v2___1)="¿cuál analgésico? (choice=AINES (Ibuprofeno, Naproxeno, Diclofenaco, etc))"
label(data$analgesico_3_v2___2)="¿cuál analgésico? (choice=Opiacios (Codeína))"
label(data$analgesico_3_v2___3)="¿cuál analgésico? (choice=Relajantes musculares (metocarbamol))"
label(data$analgesico_3_v2___4)="¿cuál analgésico? (choice=Otro {analgesico_3_otro_v2})"
label(data$analgesico_3_otro_v2)=""
label(data$analgesico_2_v2___1)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Dolor de cabeza)"
label(data$analgesico_2_v2___2)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Dolor de espalda o artritis)"
label(data$analgesico_2_v2___3)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Problemas de pecho)"
label(data$analgesico_2_v2___4)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Dolor menstrual)"
label(data$analgesico_2_v2___6)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Dolor en el cuerpo)"
label(data$analgesico_2_v2___5)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Otros {analg_otro_v2})"
label(data$analg_otro_v2)=""
label(data$desensibili_v2)="79¿ALGUNA VEZ le han puesto inyecciones o vacunas para tratar la alergia o ha pasado por un tratamiento de desensibilización?"
label(data$tto_desensibili_v2___1)=" (choice=Desensibilización a la hierba)"
label(data$tto_desensibili_v2___2)=" (choice=Desensibilización a los ácaros domésticos)"
label(data$tto_desensibili_v2___3)=" (choice=Desensibilización a algún otro agente)"
label(data$tto_desensibili_v2___4)=" (choice=Inyecciones de esteroides de acción prolongada o depot)"
label(data$tto_desensibili_v2___5)=" (choice=Desconocido)"
label(data$desensibili_1_v2)="79.1 ¿Ha recibido ese tratamiento en LOS ÚLTIMOS 12 MESES?"
label(data$gripe_v2)="80 ¿Normalmente se vacuna contra la gripe?"
label(data$gripe_2_v2)="80.1 ¿Se vacunó contra la gripe el invierno pasado?"
label(data$neumo_v2)="81¿Se ha vacunado contra la neumonía en los últimos 5 años?"
label(data$covid_v2)="82 ¿Ha padecido de SARS-CoV-2 (COVID-19)?"
label(data$covid_exa_v2)="82.1 ¿fue confirmado por exámenes?"
label(data$covid_2_v2)="82.2 ¿Hace cuanto?"
label(data$covid_3_v2___1)="82.3 ¿Cuáles síntomas presentó? (choice=Pérdida del olfato)"
label(data$covid_3_v2___2)="82.3 ¿Cuáles síntomas presentó? (choice=Rinorrea (congestión))"
label(data$covid_3_v2___3)="82.3 ¿Cuáles síntomas presentó? (choice=Tos)"
label(data$covid_3_v2___4)="82.3 ¿Cuáles síntomas presentó? (choice=Apnea)"
label(data$covid_3_v2___5)="82.3 ¿Cuáles síntomas presentó? (choice=Fiebre)"
label(data$covid_3_v2___6)="82.3 ¿Cuáles síntomas presentó? (choice=Altralgias)"
label(data$covid_3_v2___7)="82.3 ¿Cuáles síntomas presentó? (choice=Alteraciones gastrointestinales)"
label(data$covid_3_v2___8)="82.3 ¿Cuáles síntomas presentó? (choice=Otro {covid_sinto_otro_1_v2})"
label(data$covid_sinto_otro_1_v2)="¿cuál?"
label(data$covid_4_v2)="82.4 ¿Requirió hospitalización?"
label(data$covid_5_v2)="82.5 ¿Requirió UCI?"
label(data$covid_6_v2)="82.6 ¿Ha padecido COVID-19 en más de una ocasión?"
label(data$covid_exa_2_v2)="82.7 ¿fue confirmado por exámenes?"
label(data$covid_7_v2___1)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Pérdida del olfato)"
label(data$covid_7_v2___2)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Rinorrea (congestión))"
label(data$covid_7_v2___3)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Tos)"
label(data$covid_7_v2___4)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Apnea)"
label(data$covid_7_v2___5)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Fiebre)"
label(data$covid_7_v2___6)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Altralgias)"
label(data$covid_7_v2___7)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Alteraciones gastrointestinales)"
label(data$covid_7_v2___8)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Otro {covid_sinto_otro_2_v2})"
label(data$covid_sinto_otro_2_v2)="¿cuál?"
label(data$covid_8_v2)="82.9 ¿Requirió hospitalización en la segunda ocasión que padeción COVID-19?"
label(data$covid_9_v2)="82.8 ¿Requirió UCI en la segunda ocasión que padeció COVID-19?"
label(data$covid_10_v2)="82.10 ¿Ha padecido COVID-19 en una tercera ocasión?"
label(data$covid_exa_3_v2)="82.11 ¿fue confirmado por exámenes?"
label(data$covid_11_v2___1)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Pérdida del olfato)"
label(data$covid_11_v2___2)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Rinorrea (congestión))"
label(data$covid_11_v2___3)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Tos)"
label(data$covid_11_v2___4)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Apnea)"
label(data$covid_11_v2___5)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Fiebre)"
label(data$covid_11_v2___6)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Altralgias)"
label(data$covid_11_v2___7)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Alteraciones gastrointestinales)"
label(data$covid_11_v2___8)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Otro {covid_sinto_otro_3_v2})"
label(data$covid_sinto_otro_3_v2)="¿cuál?"
label(data$covid_12_v2)="82.13 ¿Requirió hospitalización en la segunda ocasión que padeción COVID-19?"
label(data$covid_13_v2)="82.14 ¿Requirió UCI en la segunda ocasión que padeció COVID-19?"
label(data$covid_vacu_v2)="83¿Se ha vacunado contra el virus SARS-CoV-2 (COVID-19)?"
label(data$covid_prov_1_v2)="COVID-19 Proveedor"
label(data$covid_prov_2_v2)="COVID-19 Proveedor"
label(data$covid_prov_3_v2)="COVID-19 Proveedor"
label(data$covid_prov_4_v2)="COVID-19 Proveedor"
label(data$covid_prov_5_v2)="COVID-19 Proveedor"
label(data$covid_fecha_1_v2)="COVID-19 Fecha"
label(data$covid_fecha_2_v2)="COVID-19 Fecha"
label(data$covid_fecha_3_v2)="COVID-19 Fecha"
label(data$covid_fecha_4_v2)="COVID-19 Fecha"
label(data$covid_fecha_5_v2)="COVID-19 Fecha"
label(data$vis_med_v2)="85 En LOS ÚLTIMOS 12 MESES, ¿Ha sido visitado por un medico general (por alguna razón, QUE NO FUERAN accidentes y lesiones)?"
label(data$vis_med_2_v2)="85.1 ¿Fue en los ÚLTIMOS 12 MESES?"
label(data$vis_med_3_v2)="85.1.1 ¿Cuantas de esas veces por PROBLEMAS RESPIRATORIOS?"
label(data$vis_esp_v2)="86 En LOS ÚLTIMOS 12 MESES, ¿Ha sido visitado por un especialista (por alguna razón, QUE NO FUERAN accidentes y lesiones)?"
label(data$vis_esp_2_v2)="86.1 ¿Fue en los ÚLTIMOS 12 MESES?"
label(data$vis_esp_3_v2)="86.1.1 ¿Cuantas de esas veces por PROBLEMAS RESPIRATORIOS?"
label(data$cuestionario_respiratorio_2_complete)="Complete?"
label(data$actividad_fsica_timestamp)="Survey Timestamp"
label(data$comp_sed)="Comportamiento sedentario (en horas)"
label(data$af_int_trab)=""
label(data$af_int_trab_dia)=""
label(data$af_int_trab_mins)=""
label(data$af_mod_trab)=""
label(data$af_mod_trab_dia)=""
label(data$af_mod_trab_mins)=""
label(data$af_des)=""
label(data$af_des_dia)=""
label(data$af_des_mins)=""
label(data$af_int_libre)=""
label(data$af_int_libre_dia)=""
label(data$af_int_libre_mins)=""
label(data$af_mod_libre)=""
label(data$af_mod_libre_dia)=""
label(data$af_mod_libre_mins)=""
label(data$actividad_fsica_complete)="Complete?"
label(data$cuestionario_de_frecuencia_de_alimentos_timestamp)="Survey Timestamp"
label(data$cfa_leche)="Leche líquida o en polvo"
label(data$cfa_queso)="Queso, Kumis, Yogurt, Queso crema"
label(data$cfa_huevos)="Huevos"
label(data$cfa_carne)="Carne de res, ternera o cerdo"
label(data$cfa_pollo)="Pollo o Gallina"
label(data$cfa_atun)="Atún o Sardinas"
label(data$cfa_pescados)="Pescados o Mariscos"
label(data$cfa_embutidos)="Embutidos (Salchicha, Salchichón)"
label(data$cfa_visceras_res)="Vísceras de res (Hígado, Pajarilla)"
label(data$cfa_visceras_pollo)="Vísceras de pollo"
label(data$cfa_granos_secos)="Granos secos (Fríjol, Lenteja, Garbanzos)"
label(data$cfa_arroz)="Arroz o Pastas"
label(data$cfa_pan)="Pan, Arepa o Galletas"
label(data$cfa_tuberculos)="Tubérculos y Plátanos"
label(data$cfa_verdu_cocidas)="Verduras cocidas"
label(data$cfa_verdu_crudas)="Verduras crudas"
label(data$cfa_fru_jugo)="Frutas en jugo"
label(data$cfa_fru_ente)="Frutas enteras"
label(data$cfa_comida_rap)="Comida rápida"
label(data$cfa_mantequilla)="Mantequilla, Crema de leche"
label(data$cfa_cafe)="Café o Te"
label(data$cfa_panela)="Panela, Azúcar, Miel"
label(data$cfa_gaseosas)="Gaseosas, Refrescos"
label(data$cfa_ali_paq)="Alimentos en paquete (Mecatos)"
label(data$cfa_bienestarina)="Bienestarina"
label(data$cfa_ali_fritos)="Alimentos fritos (pescado frito, fritos)"
label(data$cfa_golosinas)="Golosinas o Dulces"
label(data$cfa_ali_light)="Alimentos light"
label(data$cfa_ali_integrales)="Alimentos integrales (pan, arroz, galletas)"
label(data$cfa_suplementos)="Suplementos"
label(data$cfa_ali_calle)="Alimentos de la calle"
label(data$cuestionario_de_frecuencia_de_alimentos_complete)="Complete?"
label(data$exmen_fsico_timestamp)="Survey Timestamp"
label(data$peso)="peso"
label(data$talla)="talla"
label(data$imc)="imc"
label(data$per_cin)="perímetro cirntura"
label(data$per_cad)="perímetro_caderas"
label(data$i_cin_cad)="indice cintura-caderas"
label(data$pre_art_sis)="tensión arterial sistólica"
label(data$pre_art_dias)="tensión arterial diastólica"
label(data$sat_o2)="Saturación de O2"
label(data$fre_pulso)="Frecuencia de pulso"
label(data$hall_card)=""
label(data$hall_resp)=""
label(data$fre_resp)="Frecuencia respiratoria"
label(data$exmen_fsico_complete)="Complete?"
label(data$toma_de_muestra_anlisis_bioqumicos_timestamp)="Survey Timestamp"
label(data$edta_tm)="edta_tm"
label(data$seco_tm)="seco_tm"
label(data$plasma_tm)="plasma_tm"
label(data$suero_tm)="suero_tm"
label(data$bf_tm)="buffy_coat_tm"
label(data$adn_tm)="ADN_tm"
label(data$arn_tm)="ARN_tm"
label(data$fec_edta_tm)="Fecha EDTA"
label(data$fec_seco_tm)="Fecha Seco"
label(data$fec_plasma_tm)="Fecha Plasma"
label(data$fec_bf_tm)="Fecha Buffy Coat"
label(data$fec_suero_tm)="Fecha Suero"
label(data$fec_adn_tm)="Fecha ADN"
label(data$fec_arn_tm)="Fecha ARN"
label(data$ob_edta_tm)="Observaciones EDTA"
label(data$ob_seco_tm)="Observaciones Seco"
label(data$ob_plasma_tm)="Observaciones Plasma"
label(data$ob_suero_tm)="Observaciones Suero"
label(data$ob_bf_tm)="Observaciones Buffy Coat"
label(data$ob_adn_tm)="Observaciones ADN"
label(data$ob_arn_tm)="Observaciones ARN"
label(data$ctotal)="Colesterol Total (mg/dL)"
label(data$chdl)="Colesterol HDL (mg/dL)"
label(data$tri)="Triglicéridos (mg/dL)"
label(data$gli)="Glicemia en ayunas (mg/dL)"
label(data$hba1c)="HbA1C"
label(data$toma_de_muestra_anlisis_bioqumicos_complete)="Complete?"
label(data$espirometra_timestamp)="Survey Timestamp"
label(data$cvf_prev)="CVF"
label(data$vef1_prev)="VEF1"
label(data$vef1_cvf_prev)="VEF1/CVF"
label(data$pef_prev)="PEF"
label(data$vef1_pre)="VEF1"
label(data$cvf_pre)="CVF"
label(data$vef1_cvf_pre)="VEF1/CVF"
label(data$pef_pre)="PEF"
label(data$vef1_pre_por)="VEF1"
label(data$cvf_pre_por)="CVF"
label(data$vef1_cvf_pre_por)="VEF1/CVF"
label(data$pef_pre_por)="VEF1/CVF"
label(data$vef1_pos)="VEF1"
label(data$cvf_pos)="CVF"
label(data$vef1_cvf_pos)="VEF1/CVF"
label(data$pef_pos)="PEF"
label(data$vef1_pos_por)="VEF1"
label(data$cvf_pos_por)="CVF"
label(data$vef1_cvf_pos_por)="VEF1/CVF"
label(data$pef_pos_por)="PEF"
label(data$lln_cvf)="LLN"
label(data$lln_vef1)="LLN"
label(data$lln_vef1_cvf)="LLN"
label(data$lln_pef)="LLN"
label(data$uln_cvf)="ULN"
label(data$uln_vef1)="ULN"
label(data$uln_vef1_cvf)="ULN"
label(data$uln_pef)="ULN"
label(data$z_cvf)="Z score"
label(data$z_vef1)="Z score"
label(data$z_vef1_cvf)="Z score"
label(data$z_pef)="Z score"
label(data$cam_cvf)="cambio_cvf"
label(data$cam_vef1)="cambio_vef1"
label(data$cam_vef1_cvf)="cambio_vef1_cvf"
label(data$cam_pef)="cambio_pef"
label(data$calidad)=""
label(data$interpretacion)=""
label(data$espirometra_complete)="Complete?"
label(data$eco_dopler_timestamp)="Survey Timestamp"
label(data$intima_m_c_d)="Complejo intimal carotídeo "
label(data$intima_m_c_i)="Complejo intimal carotídeo "
label(data$i_m_carotidea)="Intima Media Carotidea (engrosamiento)"
label(data$placas_atero)="Placas ateromatosas"
label(data$a_vertebral)="Arteria Vertebral (Engrosamiento):"
label(data$insuficiencia_vb)="Insuficiencia vertebrobasilar"
label(data$eco_dopler_complete)="Complete?"
label(data$cuestionario_respiratorio_timestamp)="Survey Timestamp"
label(data$sil_pit)="1 ¿Ha tenido silbidos o pitidos en el pecho alguna vez en LOS ÚLTIMOS 12 MESES?"
label(data$sil_pit_1_1)="1.1 ¿Ha presentado falta de aire cuando estaban presentes los silbidos o pitos?"
label(data$sil_pit_1_2)="1.2 ¿Ha tenido estos silbidos o pitidos cuando NO estaba resfriado?"
label(data$sil_pit_1_3)="1.3 ¿Qué edad tenía cuando tuvo por primera vez estos silbidos o pitidos en el pecho?"
label(data$sil_pit_1_4)="1.4 ¿Con qué frecuencia tuvo silbidos o pitidos en LOS ÚLTIMOS 12 MESES?"
label(data$tirantez)="2 ¿Se ha despertado con una sensación de opresión o tirantez en el pecho alguna vez en LOS ÚLTIMOS 12 MESES?"
label(data$falta_aire)="3 ¿Ha tenido algún ataque de falta de aire en LOS ÚLTIMOS 12 MESES?"
label(data$falt_aire)="3.1 ¿Ha sido durante el día en reposo alguna vez en LOS ÚLTIMOS 12 MESES?"
label(data$falt_aire_3_1)="3.1.1¿Qué edad tenía cuando tuvo por primera vez un ataque de falta de aire que le vino durante el día estando en reposo? (años)"
label(data$falt_aire_ejer)="3.2¿Ha sido DESPUÉS de hacer ejercicio físico en LOS ÚLTIMOS 12 MESES?"
label(data$falt_aire_noche)="4 ¿Se ha despertado por la noche a causa de un ataque de falta de aire alguna vez en ÚLTIMOS 12 MESES?"
label(data$ata_tos)="5 ¿Se ha despertado por un ataque de tos alguna vez en LOS ÚLTIMOS 12 MESES?"
label(data$ata_tos_1_1)="5.1 ¿Cuántas veces?"
label(data$ata_tos_3)="6 ¿Tose HABITUALMENTE al levantarse por la mañana?"
label(data$ata_tos_4)="7 ¿Tose HABITUALMENTE en el transcurso del día?"
label(data$ata_tos_4_1)="7.1 ¿Ha tenido esta tos la mayoría de los días al menos 3 MESES cada año?"
label(data$ata_tos_4_2)="7.2 ¿Cuántos años hace que tiene este problema (tos, la mayoría de los días al menos 3 MESES cada año)?"
label(data$esputos)="8 ¿ACOSTUMBRA a expulsar esputos al levantarse por la mañana?"
label(data$esputos_2)="9 ¿ACOSTUMBRA a expulsar esputos en el transcurso del día?"
label(data$esputos_2_1)="9.1 ¿Expulsa o expectora así la mayoría de los días al menos 3 MESES en el año?"
label(data$esputos_2_2)="9.2 ¿Cuántos años hace que tiene este problema (expulsar o expectorar la mayoría de los días al menos 3 MESES en el año)?"
label(data$sin_res_peor)="10 En LOS ÚLTIMOS 12 MESES, ¿ha habido algún episodio/vez cuando sus síntomas (tos, expectoración, falta de aire) fueran mucho peor de lo normal?"
label(data$sin_res_peor_1_1)="10.1 ¿Cuántas veces han ocurrido estos episodios?"
label(data$sin_res_peor_1_2)="10.2 ¿Cuántas veces le han forzado estos episodios a consultar con su médico?"
label(data$sin_res_peor_1_3)="10.3 ¿Cuántas veces le han cambiado el tratamiento después de esos episodios?"
label(data$sin_res_peor_1_4)="10.4 ¿Cuántas veces ha ido a urgencias hospitalarias o ha pasado la noche en el hospital tras estos episodios?"
label(data$resp)="11 ¿Tiene problemas con su respiración?"
label(data$dif_cam)="12 ¿Tiene usted dificultad para caminar por una causa DIFERENTE a una enfermedad cardíaca o pulmonar?"
label(data$dif_cam_2)="¿cuál?"
label(data$falt_aire_cam)="13¿Se cansa por falta de aire cuando camina rápido en terreno llano o sube una pendiente suave?"
label(data$falt_aire_cam_2)="14¿Le falta el aire al andar en terreno llano con gente de su misma edad?"
label(data$falt_aire_cam_3)="15 ¿Tiene que parar a respirar cuando camina a su propio paso en terreno llano?"
label(data$falt_aire_cam_5)="15.1 ¿Alguna vez ha tenido que pararse a recuperar el aliento tras CAMINAR 100 METROS (o pocos minutos) en un terreno llano?"
label(data$falt_aire_cam_6)="16¿Hasta qué punto se encuentra sin aliento en estos momentos? (poco=1; mucho=10)"
label(data$asma)="17 ¿Tiene o ha tenido alguna vez asma?"
label(data$asma_1_1)="17.1 ¿Ha sido confirmado por un médico?"
label(data$asma_1_2)="17.1.1¿Qué edad tenía cuando un médico le confirmó que tenía asma?"
label(data$asma_1_3)="17.2 ¿Qué edad tenía cuando tuvo su primer ataque de asma?"
label(data$asma_1_4)="17.3 ¿Qué edad tenía cuando tuvo su último ataque de asma?"
label(data$asma_1_5___1)="17.4 ¿En qué meses del año suele tener ataques de asma? (choice=Enero/Febrero)"
label(data$asma_1_5___2)="17.4 ¿En qué meses del año suele tener ataques de asma? (choice=Marzo/Abril)"
label(data$asma_1_5___3)="17.4 ¿En qué meses del año suele tener ataques de asma? (choice=Mayo/Junio)"
label(data$asma_1_5___4)="17.4 ¿En qué meses del año suele tener ataques de asma? (choice=Julio/Agosto)"
label(data$asma_1_5___5)="17.4 ¿En qué meses del año suele tener ataques de asma? (choice=Septiembre/Octubre)"
label(data$asma_1_5___6)="17.4 ¿En qué meses del año suele tener ataques de asma? (choice=Noviembre/Diciembre)"
label(data$asma_1_5___7)="17.4 ¿En qué meses del año suele tener ataques de asma? (choice=Ningún mes en particular)"
label(data$asma_1_6)="17.5 ¿Ha tenido algún ataque de asma en LOS ÚLTIMOS 12 MESES?"
label(data$asma_1_7)="17.6 ¿Cuántos en LOS ÚLTIMOS 12 MESES?"
label(data$asma_1_8)="17.7 ¿Cuántos en los últimos 3 MESES?"
label(data$asma_1_9)="17.8¿Cuántas veces se ha despertado por culpa de un ataque de asma durante los últimos 3 MESES?"
label(data$asma_1_10)="17.9 ¿Cuántas veces ha tenido problemas de respiración a causa del asma, durante los últimos 3 MESES?"
label(data$asma_1_11)="17.10 ¿Toma actualmente alguna medicación (incluyendo inhaladores, aerosoles o pastillas) para el asma?"
label(data$asma_1_12)="17.11 ¿Le ha dado su médico instrucciones por escrito sobre qué hacer respecto a su asma, en caso de ponerse peor o tener un ataque?"
label(data$bronq_cro)="18 ¿Le ha dicho un médico alguna vez que tiene bronquitis crónica?"
label(data$bronq_cro_1_1)="18.1 ¿Qué edad tenía cuando le diagnosticaron, por primera vez, la bronquitis crónica?"
label(data$epoc)="19 ¿Le ha dicho un médico alguna vez que tiene Enfermedad Pulmonar Obstructiva Crónica (EPOC)?"
label(data$epoc_1_1)="19.1 ¿Qué edad tenía cuando le diagnosticaron, por primera vez, la Enfermedad Pulmonar Obstructiva Crónica (EPOC)?"
label(data$enfisema)="20 ¿Le ha dicho un médico alguna vez que tiene Enfisema?"
label(data$enfisema_1_1)="20.1 ¿Qué edad tenía cuando le diagnosticaron, por primera vez, Enfisema)?"
label(data$otra_enf_pulm)="21¿Se le diagnosticó alguna vez de otra enfermedad pulmonar (excluyendo asma, bronquitis crónica, EPOC y enfisema)?"
label(data$otra_enf_pulm_op___1)="21.1 ¿Cuál es esta enfermedad pulmonar? (choice=Fibrosis quística)"
label(data$otra_enf_pulm_op___2)="21.1 ¿Cuál es esta enfermedad pulmonar? (choice=Sarcoidosis)"
label(data$otra_enf_pulm_op___3)="21.1 ¿Cuál es esta enfermedad pulmonar? (choice=Hipertensión pulmonar)"
label(data$otra_enf_pulm_op___4)="21.1 ¿Cuál es esta enfermedad pulmonar? (choice=Aspergilosis)"
label(data$otra_enf_pulm_op___5)="21.1 ¿Cuál es esta enfermedad pulmonar? (choice=Bronquiectasia)"
label(data$otra_enf_pulm_op___6)="21.1 ¿Cuál es esta enfermedad pulmonar? (choice=Tuberculosis)"
label(data$otra_enf_pulm_op___7)="21.1 ¿Cuál es esta enfermedad pulmonar? (choice=Otra {otra_enf_pulm_1})"
label(data$otra_enf_pulm_1)="¿cuál?"
label(data$rinitis)="22 ¿Tiene usted alguna alergia nasal, incluyendo rinitis?"
label(data$rinitis_1_1)="22.1 ¿Qué edad tenía cuando empezó a tener alergias nasales o rinitis?"
label(data$estornudos)="23 ¿ALGUNA VEZ ha notado que tenía problemas de estornudos, moqueo o nariz tapada cuando no estaba resfriado o con gripe?"
label(data$estornudos_1_1)="23.1 ¿DURANTE LOS ÚLTIMOS 12 MESES?"
label(data$estornudos_1_2)="23.1.1 ¿Este problema de nariz ha estado acompañado por picor en los ojos o lagrimeo?"
label(data$estornudos_1_3___1)="23.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Enero/Febrero)"
label(data$estornudos_1_3___2)="23.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Marzo/Abril)"
label(data$estornudos_1_3___3)="23.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Mayo/Junio)"
label(data$estornudos_1_3___4)="23.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Julio/Agosto)"
label(data$estornudos_1_3___5)="23.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Septiembre/Octubre)"
label(data$estornudos_1_3___6)="23.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Noviembre/Diciembre)"
label(data$estornudos_1_3___7)="23.1.2 ¿Durante qué meses del año aparece este problema de nariz? (choice=Ningún mes en particular)"
label(data$estornudos_1_4)="23.1.3 ¿Ha tenido este problema durante MÁS DE 4 DÍAS EN UNA SEMANA en LOS ÚLTIMOS 12 MESES?"
label(data$estornudos_1_5)="23.1.3.1 ¿Le ha pasado durante MÁS DE 4 SEMANAS CONSECUTIVAS?"
label(data$moq_nariz)="Moqueo de la nariz"
label(data$nariz_tapada)="Nariz tapada"
label(data$picor_nariz)="Picor en la nariz"
label(data$estornudos_2)="Estornudos"
label(data$ojos_llorosos)="Picor en los ojos llorosos"
label(data$tras_nas)="25 ¿ha utilizado algún medicamento para tratar los trastornos nasales?"
label(data$tras_nas_1_1)="25.1 ¿Ha utilizado alguna pastillas, comprimidos o tabletas para tratar sus problemas de nariz?"
label(data$tras_nas_1_2)="25.1.1 ¿durante LOS ÚLTIMOS 12 MESES?"
label(data$nar_tap)="26 ¿Ha tenido la nariz tapada DURANTE MÁS DE 3 MESES EN LOS ÚLTIMOS 12 MESES?"
label(data$pre_fre)="27 ¿Ha tenido dolor o presión alrededor de la frente, nariz u ojos POR MÁS DE 3 MESES EN LOS ÚLTIMOS 12 MESES?"
label(data$mucosidad)="28 ¿Ha tenido mucosidad de color anormal en la nariz o garganta POR MÁS DE 3 MESES EN LOS ÚLTIMOS 12 MESES?"
label(data$olfato)="29 ¿Ha perdido olfato total o parcialmente DURANTE MÁS DE 3 MESES EN LOS ÚLTIMOS 12 MESES?"
label(data$sinusitis)="30 ¿Le ha dicho un médico ALGUNA VEZ que tiene sinusitis crónica?"
label(data$sinusitis_1_1)="30.1 ¿Le ha dicho un médico ALGUNA VEZ que tiene pólipos nasales?"
label(data$sinusitis_1_2)="30.2 ¿Qué edad tenía cuando un médico le dijo que tenía sinusitis crónica?"
label(data$sinusitis_1_3)="30.3 ¿Qué edad tenía cuando un médico le dijo que tenía pólipos nasales?"
label(data$eczema)="31 ¿Ha tenido ALGUNA VEZ eczema u otro tipo de alergia en la piel?"
label(data$eczema_1_1)="31.1 ¿Qué edad tenía la primera vez que tuvo eczema o alergia en la piel?"
label(data$eczema_1_2)="31.2 ¿El eczema o la alergia dérmica le afecta o afectaba las manos?"
label(data$eczema_1_3)="31.3 ¿Ha notado que el contacto con algunos materiales, productos químicos o alguna otra cosa EN SU TRABAJO le agrava el eczema?"
label(data$sarpullidos)="32 ¿ALGUNA VEZ ha tenido algún sarpullido o erupción cutánea con picor que apareciera y desapareciera durante AL MENOS 6 MESES?"
label(data$erupcion)="32.1 ¿Ha tenido esta erupción con picor EN LOS ÚLTIMOS 12 MESES?"
label(data$erupcion_1_1)="32.1.1 ¿Esta erupción con picor le ha afectado ALGUNA VEZ en alguno de estos puntos: ¿parte interna de los codos, detrás de las rodillas, parte de delante de los tobillos, debajo de las nalgas o alrededor del cuello, orejas u ojos?"
label(data$erupcion_1_2)="32.1.2 ¿Esta erupción con picor le ha afectado alguna vez en las manos EN LOS ÚLTIMOS 12 MESES?"
label(data$expo_trab2)="33 ¿Ha tenido que dejar de trabajar del todo por asma, silbidos al respirar, falta de aliento u otros problemas respiratorios o pulmonares?"
label(data$expo_trab2_fec)="¿cuándo ocurrió?"
label(data$expo_trab1)="34 ¿En su trabajo actual, está regularmente expuesto a vapores, gas, polvo o humo?"
label(data$expo_trab1_1)="34.1 ¿Nota problemas respiratorios (opresión en el pecho, silbidos, tos) al estar en su trabajo actual?"
label(data$expo_trab1_1_1___1)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=Esfuerzos físicos)"
label(data$expo_trab1_1_1___3)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=Exposición a nieblas, frio o calor)"
label(data$expo_trab1_1_1___4)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=Exposición a vapores, gas, polvo, humo)"
label(data$expo_trab1_1_1___5)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=Humo de cigarrillos de otros)"
label(data$expo_trab1_1_1___6)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=Estrés)"
label(data$expo_trab1_1_1___7)="34.1.1 ¿Sabría decirnos qué le provoca problemas respiratorios en su trabajo actual? (choice=No)"
label(data$expo_trab1_1_2)="34.1.2 ¿Estos problemas respiratorios se alivian o desaparecen DURANTE EL FIN DE SEMANA O VACACIONES?"
label(data$humed_trab1)="35 ¿En LOS ÚLTIMOS 12 MESES ha habido puntos húmedos o mojados en superficies en la sala donde trabaja habitualmente (por ejemplo, en las paredes, papel pintado, el techo o las moquetas)?"
label(data$moho_trab1)="36 ¿En LOS ÚLTIMOS 12 MESES ha habido moho en alguna de las superficies de la sala donde suele trabajar?"
label(data$moho_alim_trab1)="37 ¿En algún momento de LOS ÚLTIMOS 12 MESES ha notado olor a moho (no procedente de alimentos) en la sala donde suele trabajar?"
label(data$pro_lim_trab1)="38 ¿En su trabajo actual, ¿utiliza regularmente PRODUCTOS DE LIMPIEZA o DESINFECTANTES?"
label(data$pro_lim_trab1_1)="38.1 En LOS ÚLTIMOS 12 MESES, ¿cuántos días a la semana ha utilizado los siguientes productos en su trabajo?     Frecuencia de uso   Hipoclorito {hipoclorito_1}   Amoníaco {amoniaco_1}   Quitamanchas u otros disvolventes {quitamanchas_1}   Ácidos (vinagre, cal) {acidos_1}   Ceras para el suelo {ceras_suelos_1}   Ceras para muebles {ceras_muebles_1}   Sprays para suelo {sprays_suelos_1}   Sprays para muebles {sprays_muebles_1}   Detergentes (fabuloso, fab) {detergentes_1}   Sprays para cristales {sprays_cristales_1}   Sprays desengrasantes {sprays_desengrasantes_1}   Alcohol {alcohol_1}   Jabones {jabones_1}   Cualquier otro desinfectante químico {otro_desinfectante_1}   "
label(data$hipoclorito_1)="Hipoclorito"
label(data$amoniaco_1)="Amoníaco"
label(data$quitamanchas_1)="Quitamanchas u otros disolventes"
label(data$acidos_1)="Ácidos (vinagre, cal)"
label(data$ceras_suelos_1)="Ceras para suelo"
label(data$ceras_muebles_1)="Ceras para muebles"
label(data$sprays_suelos_1)="Sprays para suelos"
label(data$sprays_muebles_1)="Sprays para muebles"
label(data$detergentes_1)="Detergentes (ej. fabuloso, fab)"
label(data$sprays_cristales_1)="Sprays para limpiar cristales"
label(data$alcohol_1)="Alcohol"
label(data$jabones_1)="Jabones"
label(data$otro_desinfectante_1)="Cualquier otro desinfectante químico"
label(data$sprays_desengrasantes_1)="Sprays desengrasantes"
label(data$expo)="39 ¿Ha sido involucrado alguna vez en un algún incidente en casa, en el trabajo o en cualquier otro lugar que le expusiera a niveles altos de vapores, gases, polvos o humos?"
label(data$expo_2)="¿cuando ocurrió?"
label(data$expo_2_1)="39.2 ¿Puede clasificar este incidente?"
label(data$expo_2_2)="39.3 ¿Dónde tuvo lugar este incidente?"
label(data$expo_2_3)="39.4 ¿Notó síntomas respiratorios después del accidente, dentro de las 24 horas siguientes?"
label(data$expo_2_4_1)="39.4.1 ¿Tuvo que pedir asistencia médica a causa de estos síntomas?"
label(data$constr_casa)="40. ¿Hace cuánto se construyó la casa/piso en la que está viviendo ahora?"
label(data$domicilio)="41 ¿Cuántos años lleva en su domicilio actual?"
label(data$vivienda)="42 El lugar donde vive es:"
label(data$vivienda_otro)="¿cuál?"
label(data$vivienda_hab)="43¿Cuántas habitaciones tiene su casa?(sin contar la cocina, el cuarto de baño, aseo, lavadero)"
label(data$num_indi_vivienda)="44 ¿Cuánta gente vive en su casa, incluyéndole?"
label(data$air_acon)="45 ¿En su casa hay aire acondicionado?"
label(data$combus_cocinar___1)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Combustible sólido (carbón, madera))"
label(data$combus_cocinar___2)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Gas ciudad)"
label(data$combus_cocinar___3)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Electricidad)"
label(data$combus_cocinar___4)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Parafina/queroseno)"
label(data$combus_cocinar___5)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Micro-ondas)"
label(data$combus_cocinar___6)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Gas propano (cilindro))"
label(data$combus_cocinar___7)="46¿Qué tipo de combustible usa mayoritariamente para cocinar/guisar? (choice=Otro {otro_combus_cocinar})"
label(data$otro_combus_cocinar)="¿Cuál?"
label(data$cocina)="47. ¿Usted cocina?"
label(data$cocinar_dia)="47.1 Durante EL ÚLTIMO MES, en promedio, ¿cuánto tiempo AL DÍA ha pasado guisando en su cocina? (minutos)"
label(data$cocinar_ventana)="47.2Durante EL ÚLTIMO MES, ¿ha dejado una puerta o una ventana abierta, que dé al exterior, mientras estaba guisando?"
label(data$extractor)="48 ¿Tiene extractor encima de la cocina?"
label(data$extrator_1_1)="48.1 Al cocinar, ¿usa el extractor?"
label(data$goteras)="49 ¿Ha habido algún problema con el agua en su casa, de cañerías, goteras o inundaciones?"
label(data$goteras_1)="49.1 ¿Ha habido algún problema con el agua en LOS ÚLTIMOS 12 MESES?"
label(data$manchas)="50 DURANTE LOS ÚLTIMOS 12 MESES, ¿han salido manchas o zonas de humedad en el interior de su casa, sin contar las del sótano? (por ejemplo, en las paredes, techos o moquetas)?"
label(data$moho_manchas_casa)="51 ¿Ha habido alguna vez moho en alguna parte dentro de su casa?(excepto alimentos)"
label(data$moho_casa)="51.1 Ha habido moho en alguna parte dentro de la casa en LOS ÚLTIMOS 12 MESES?"
label(data$moho_lugar___1)="51.1.1 ¿A qué lugares afectó? (choice=Baño(s))"
label(data$moho_lugar___2)="51.1.1 ¿A qué lugares afectó? (choice=Dormitorio(s))"
label(data$moho_lugar___3)="51.1.1 ¿A qué lugares afectó? (choice=Sala de estar o comedor)"
label(data$moho_lugar___4)="51.1.1 ¿A qué lugares afectó? (choice=Cocina)"
label(data$moho_lugar___5)="51.1.1 ¿A qué lugares afectó? (choice=Garaje)"
label(data$moho_lugar___6)="51.1.1 ¿A qué lugares afectó? (choice=Otro {moho_lugar_otro})"
label(data$moho_lugar_otro)="¿cuál?"
label(data$moho_casa_2)="52 ¿Ha notado olor de moho (no de alimentos) en su casa en cualquier momento en LOS ÚLTIMOS 12 MESES?"
label(data$moho_casa_4___1)="53 La habitación de su vivienda en la que usted pasa la mayor parte del día, ¿tiene? (choice=Alfombra en todo el suelo)"
label(data$moho_casa_4___2)="53 La habitación de su vivienda en la que usted pasa la mayor parte del día, ¿tiene? (choice=Alfombra)"
label(data$moho_casa_4___4)="53 La habitación de su vivienda en la que usted pasa la mayor parte del día, ¿tiene? (choice=Manchas con humedad)"
label(data$moho_casa_4___5)="53 La habitación de su vivienda en la que usted pasa la mayor parte del día, ¿tiene? (choice=Ventilación)"
label(data$moho_casa_4___6)="53 La habitación de su vivienda en la que usted pasa la mayor parte del día, ¿tiene? (choice=Ninguna de las anteriores)"
label(data$moho_casa_5)="54 ¿En qué planta está la habitación que más usa durante el día?"
label(data$moho_dormi_1___1)="55¿Su dormitorio tiene? (choice=Alfombra en todo el suelo)"
label(data$moho_dormi_1___2)="55¿Su dormitorio tiene? (choice=Alfombra)"
label(data$moho_dormi_1___4)="55¿Su dormitorio tiene? (choice=Manchas con humedad)"
label(data$moho_dormi_1___5)="55¿Su dormitorio tiene? (choice=Ventilación)"
label(data$moho_dormi_1___6)="55¿Su dormitorio tiene? (choice=Ninguna de las anteriores)"
label(data$hab_uso)="56¿En qué planta está la habitación que más usa durante el día?"
label(data$colchon)="57¿Cuántos meses o años tiene el colchón donde actualmente duerme?"
label(data$ventanas_2)="58.1 Duerme con las ventanas abiertas:"
label(data$gato_1)="59.1¿Permite a su gato (o gatos) entrar a su casa?"
label(data$gato_2)="59.2 ¿Permite a su gato (o gatos) entrar en su dormitorio?"
label(data$perro)="60 ¿Tiene un perro?"
label(data$perro_1)="60.1 ¿Permite a su perro (o perros) entrar a su casa?"
label(data$perro_2)="60.2 ¿Permite a su perro (o perros) entrar en su dormitorio?"
label(data$pajaro)="61 ¿Tiene pájaro?"
label(data$pajaro_1)="61.1 ¿Permite a su pájaro (pájaros) entrar a su casa?"
label(data$limpieza)="62En LOS ÚLTIMOS 12 MESES, ¿cuántas veces ha hecho cualquier tarea de LIMPIEZA en su propia casa?"
label(data$hipoclorito_2)="Hipoclorito"
label(data$amoniaco_2)="Amoniaco"
label(data$quitamanchas_2)="Quitamanchas u otro tipo de disolventes"
label(data$acidos_2)="Ácidos (limpiadores líquidos, cal, vinagre)"
label(data$ceras_suelos_2)="Ceras para suelos"
label(data$ceras_muebles_2)="Ceras para muebles"
label(data$sprays_suelos_2)="Sprays para suelos"
label(data$sprays_muebles_2)="Sprays para muebles"
label(data$sprays_desengrasantes_2)="Sprays desengrasantes"
label(data$detergentes_2)="Detergentes"
label(data$alcohol_2)="Alcohol"
label(data$sprays_cristales_2)="Sprays para cristales"
label(data$jabones_2)="Jabones"
label(data$otro_desinfectante_2)="otro_desinfectante"
label(data$productos_casa_2)="63.1 Perfumes o aromas líquidos o sólidos"
label(data$productos_casa_3)="63.2 Ambientadores ELÉCTRICOS, de los que se enchufan (dispositivos químicos de enchufe)"
label(data$productos_casa_4)="63.3 Sprays ambientadores (atomizadores, aerosoles):"
label(data$insecticidas_1)="65.1 Insecticidas u otros pesticidas en polvo"
label(data$insecticidas_2)="65.2 Insecticidas /pesticidas ELÉCTRICOS o de enchufar (dispositivos químicos de enchufe)"
label(data$insecticidas_3)="65.3Insecticidas u otros pesticidas en spray"
label(data$enfer_alime)="66 ¿Ha tenido alguna enfermedad o problema provocado por comer un alimento o alimentos EN PARTICULAR?"
label(data$enfer_alime_siem)="66.1 ¿Ha tenido casi siempre la misma enfermedad o problema después de comer ese tipo de alimento?"
label(data$alime___1)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Leche de vaca)"
label(data$alime___2)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Huevos de gallina)"
label(data$alime___3)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Pescado)"
label(data$alime___4)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Gambas o langostas)"
label(data$alime___5)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Cacahuetes)"
label(data$alime___6)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Avellanas)"
label(data$alime___7)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Nueces)"
label(data$alime___8)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Melocotón)"
label(data$alime___9)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Manzanas)"
label(data$alime___10)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Kiwi)"
label(data$alime___11)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Banano)"
label(data$alime___12)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Melón)"
label(data$alime___13)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Tomate)"
label(data$alime___14)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Ápio)"
label(data$alime___15)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Zanahoria)"
label(data$alime___16)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Soja)"
label(data$alime___17)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Lentejas)"
label(data$alime___18)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Trigo)"
label(data$alime___19)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Maíz)"
label(data$alime___20)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Arroz)"
label(data$alime___21)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Semillas de sésamo)"
label(data$alime___22)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Semillas de mostaza)"
label(data$alime___23)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Semillas de girasol)"
label(data$alime___24)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Semillas de amapola)"
label(data$alime___26)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Otro {alime_otro})"
label(data$alime___27)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Otro {alime_otro_2})"
label(data$alime___28)="66.2 ¿Este alimento es alguno de los siguientes? (choice=Otro {alime_otro_3})"
label(data$alime_otro)="¿cuál es el nombre?"
label(data$alime_otro_2)="¿cuál es el nombre?"
label(data$alime_otro_3)="¿cuál es el nombre?"
label(data$enro_alime_otro_1)="¿enrojecimiento o picor en la piel?"
label(data$vomi_alime_otro_1)="¿diarrea o vómitos?"
label(data$tapa_alime_otro_1)="¿le gotea o se le tapa la nariz?"
label(data$dol_cab_alime_otro_1)="¿dolores de cabeza fuertes?"
label(data$alien_alime_otro_1)="¿pérdida del aliento?"
label(data$picor_alime_otro_1)="¿picor, cosquilleo, inflamación de la boca, labios o garganta?"
label(data$dif_tra_alime_otro_1)="¿dificultad al tragar?"
label(data$desma_alime_otro_1)="¿desmayos o mareos?"
label(data$inye_alime_otro_1)="¿síntomas tan graves que un medico tuvo que ponerle una inyección de emergencia?"
label(data$otro_alime_otro_1)="¿otro?"
label(data$otro_alime_otro_1_1)="¿cuál?"
label(data$tiemp_alime_otro_1)="¿Cuánto tiempo después de tomar ese alimento tuvo los primeros síntomas?"
label(data$edad_alime_otro_1)="¿Qué edad tenía cuanto tuvo ese ataque por primera vez?"
label(data$veces_alime_otro_1)="¿Cuántas veces le ha pasado eso en la vida?"
label(data$enro_alime_otro_2)="¿presentó enrojecimiento o picor en la piel?"
label(data$vomi_alime_otro_2)="¿diarrea o vómitos?"
label(data$picor_alime_otro_2)="¿picor, cosquilleo, inflamación de la boca, labios o garganta?"
label(data$dif_tra_alime_otro_2)="¿dificultad al tragar?"
label(data$desma_alime_otro_2)="¿desmayos o mareos?"
label(data$inye_alime_otro_2)="¿síntomas tan graves que un medico tuvo que ponerle una inyección de emergencia?"
label(data$otro_alime_otro_2)="¿otro?"
label(data$otro_alime_otro_1_2)="¿cuál?"
label(data$tiemp_alime_otro_2)="¿Cuánto tiempo después de tomar ese alimento tuvo los primeros síntomas?"
label(data$edad_alime_otro_2)="¿Qué edad tenía cuanto tuvo ese ataque por primera vez?"
label(data$veces_alime_otro_2)="¿Cuántas veces le ha pasado eso en la vida?"
label(data$enro_alime_otro_3)="¿presentó enrojecimiento o picor en la piel?"
label(data$vomi_alime_otro_3)="¿diarrea o vómitos?"
label(data$picor_alime_otro_3)="¿picor, cosquilleo, inflamación de la boca, labios o garganta?"
label(data$dif_tra_alime_otro_3)="¿dificultad al tragar?"
label(data$desma_alime_otro_3)="¿desmayos o mareos?"
label(data$inye_alime_otro_3)="¿síntomas tan graves que un medico tuvo que ponerle una inyección de emergencia?"
label(data$otro_alime_otro_3)="¿otro?"
label(data$otro_alime_otro_1_3)="¿cuál?"
label(data$tiemp_alime_otro_3)="¿Cuánto tiempo después de tomar ese alimento tuvo los primeros síntomas?"
label(data$edad_alime_otro_3)="¿Qué edad tenía cuanto tuvo ese ataque por primera vez?"
label(data$veces_alime_otro_3)="¿Cuántas veces le ha pasado eso en la vida?"
label(data$tos_anim)="67.1 ¿empieza a toser?"
label(data$tos_anim_op___1)="67.1.1 Cuando está cerca de: (choice=Gatos)"
label(data$tos_anim_op___2)="67.1.1 Cuando está cerca de: (choice=Perros)"
label(data$tos_anim_op___3)="67.1.1 Cuando está cerca de: (choice=Caballos)"
label(data$tos_anim_op___4)="67.1.1 Cuando está cerca de: (choice=Otros)"
label(data$sil_anim)="67.2 ¿empieza a tener silbidos o pitidos?"
label(data$sil_anim_op___1)="67.2.1 Cuando está cerca de: (choice=Gatos)"
label(data$sil_anim_op___2)="67.2.1 Cuando está cerca de: (choice=Perros)"
label(data$sil_anim_op___3)="67.2.1 Cuando está cerca de: (choice=Caballos)"
label(data$sil_anim_op___4)="67.2.1 Cuando está cerca de: (choice=Otros)"
label(data$opre_anim)="67.3 ¿tiene sensación de opresión o tirantez en el pecho?"
label(data$opre_anim_op___1)="67.3.1 Cuando está cerca de: (choice=Gatos)"
label(data$opre_anim_op___2)="67.3.1 Cuando está cerca de: (choice=Perros)"
label(data$opre_anim_op___3)="67.3.1 Cuando está cerca de: (choice=Caballos)"
label(data$opre_anim_op___4)="67.3.1 Cuando está cerca de: (choice=Otros)"
label(data$falt_aire_anim)="67.4 ¿empieza a sentir falta de aire?"
label(data$falta_aire_anim_op___1)="67.4.1 Cuando está cerca de: (choice=Gatos)"
label(data$falta_aire_anim_op___2)="67.4.1 Cuando está cerca de: (choice=Perros)"
label(data$falta_aire_anim_op___3)="67.4.1 Cuando está cerca de: (choice=Caballos)"
label(data$falta_aire_anim_op___4)="67.4.1 Cuando está cerca de: (choice=Otros)"
label(data$nariz_anim)="67.5 ¿le gotea o se le tapa la nariz o empieza a estornudar?"
label(data$nariz_anim_op___1)="67.5.1 Cuando está cerca de: (choice=Gatos)"
label(data$nariz_anim_op___2)="67.5.1 Cuando está cerca de: (choice=Perros)"
label(data$nariz_anim_op___3)="67.5.1 Cuando está cerca de: (choice=Caballos)"
label(data$nariz_anim_op___4)="67.5.1 Cuando está cerca de: (choice=Otros)"
label(data$ojos_anim)="67.6 ¿le pican o le lloran los ojos?"
label(data$ojos_anim_op___1)="67.6.1 Cuando está cerca de: (choice=Gatos)"
label(data$ojos_anim_op___2)="67.6.1 Cuando está cerca de: (choice=Perros)"
label(data$ojos_anim_op___3)="67.6.1 Cuando está cerca de: (choice=Caballos)"
label(data$ojos_anim_op___4)="67.6.1 Cuando está cerca de: (choice=Otros)"
label(data$tos_2)="68.1 ¿empieza a toser?"
label(data$sil_2)="68.2 ¿empieza a tener silbidos o pitidos?"
label(data$opre_2)="68.3 ¿tiene sensación de opresión o tirantez en el pecho?"
label(data$falt_aire_2)="68.4 ¿empieza a sentir falta de aire?"
label(data$nariz_2)="68.5 ¿le gotea o se le tapa la nariz o empieza a estornudar?"
label(data$ojos_2)="68.6 ¿le pican o le lloran los ojos?"
label(data$tos_3)="69.1 ¿empieza a toser?"
label(data$sil_3)="69.2 ¿empieza a tener silbidos o pitidos?"
label(data$opre_3)="69.3 ¿tiene sensación de opresión o tirantez en el pecho?"
label(data$falt_aire_3)="69.4 ¿empieza a sentir falta de aire?"
label(data$nariz_3)="69.5 ¿le gotea o se le tapa la nariz o empieza a estornudar?"
label(data$ojos_3)="69.6 ¿le pican o le lloran los ojos?"
label(data$med_inha)="70 ¿Ha usado en alguna ocasión medicinas INHALADAS para mejorar su respiración alguna vez en los últimos meses?"
label(data$ago_beta2)="70.1 Agonistas-beta-2 (sólo) inhalados de ACCIÓN CORTA."
label(data$ago_beta2_corta_1)="¿cuál?"
label(data$ago_beta2_corta_2)="¿cuál?"
label(data$ago_beta2_corta_3)="¿cuál?"
label(data$ago_beta2_corta_4)="¿cuál?"
label(data$ago_beta2_dosis_1)="¿cuántos puff aplica?"
label(data$ago_beta2_dosis_2)="¿cuántos puff aplica?"
label(data$ago_beta2_dosis_3)="¿cuántos puff aplica?"
label(data$ago_beta2_dosis_4)="¿cuántos puff aplica?"
label(data$ago_beta2_fr_1)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$ago_beta2_fr_2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$ago_beta2_fr_3)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$ago_beta2_fr_4)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_ago_beta2_corto_1)="Número de inhalaciones al mes"
label(data$mes_ago_beta2_corto_2)="Número de inhalaciones al mes"
label(data$mes_ago_beta2_corto_3)="Número de inhalaciones al mes"
label(data$mes_ago_beta2_corto_4)="Número de inhalaciones al mes"
label(data$dia_ago_beta2_corto_1)="Número de inhalaciones al día"
label(data$dia_ago_beta2_corto_2)="Número de inhalaciones al día"
label(data$dia_ago_beta2_corto_3)="Número de inhalaciones al día"
label(data$dia_ago_beta2_corto_4)="Número de inhalaciones al día"
label(data$ago_beta2_pro)="70.2Agonistas-beta-2 (sólo) inhalados de ACCIÓN PROLONGADA."
label(data$ago_beta2_pro_1)="¿cuál?"
label(data$ago_beta2_pro_2)="¿cuál?"
label(data$ago_beta2_dosis_5)="¿cuántos puff aplica?"
label(data$ago_beta2_dosis_6)="¿cuántos puff aplica?"
label(data$ago_beta2_fr_5)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$ago_beta2_fr_6)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_ago_beta2_pro_1)="Número de inhalaciones al mes"
label(data$mes_ago_beta2_pro_2)="Número de inhalaciones al mes"
label(data$dia_ago_beta2_pro_1)="Número de inhalaciones al día"
label(data$dia_ago_beta2_pro_2)="Número de inhalaciones al día"
label(data$antimus_cort)="70.3 Antimuscarínicos inhalados de ACCIÓN CORTA"
label(data$antimus_corta_1)="¿cuál?"
label(data$antimus_dosis_1)="¿cuántos puff aplica?"
label(data$antimus_fr_1)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_antimus_corta_1)="Número de inhalaciones al mes"
label(data$dia_antimus_corta_1)="Número de inhalaciones al día"
label(data$antimus_pro)="70.4Antimuscarínicos inhalados de ACCIÓN PROLONGADA"
label(data$antimus_pro_1)="¿cuál?"
label(data$antimus_pro_2)="¿cuál?"
label(data$antimus_dosis_2)="¿cuántos puff aplica?"
label(data$antimus_dosis_3)="¿cuántos puff aplica?"
label(data$antimus_fr_2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$antimus_fr_3)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_antimus_pro_1)="Número de inhalaciones al mes"
label(data$mes_antimus_pro_2)="Número de inhalaciones al mes"
label(data$dia_antimus_pro_1)="Número de inhalaciones al día"
label(data$dia_antimus_pro_2)="Número de inhalaciones al día"
label(data$este_inha)="70.5 esteroides inhalados (SÓLO)"
label(data$este_inha_1)="¿cuál?"
label(data$este_inha_2)="¿cuál?"
label(data$este_inha_3)="¿cuál?"
label(data$este_inha_4)="¿cuál?"
label(data$este_inha_5)="¿cuál?"
label(data$este_inha_6)="¿cuál?"
label(data$este_dosis_1)="¿cuanto aplica?"
label(data$este_dosis_2)="¿cuanto aplica?"
label(data$este_dosis_3)="¿cuanto aplica?"
label(data$este_dosis_4)="¿cuanto aplica?"
label(data$este_dosis_5)="¿cuanto aplica?"
label(data$este_dosis_6)="¿cuanto aplica?"
label(data$este_fr_1)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$este_fr_2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$este_fr_3)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$este_fr_4)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$este_fr_5)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$este_fr_6)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_este_1)="Número de inhalaciones al mes"
label(data$mes_este_2)="Número de inhalaciones al mes"
label(data$mes_este_3)="Número de inhalaciones al mes"
label(data$mes_este_4)="Número de inhalaciones al mes"
label(data$mes_este_5)="Número de inhalaciones al mes"
label(data$mes_este_6)="Número de inhalaciones al mes"
label(data$dia_este_1)="Número de inhalaciones al día"
label(data$dia_este_2)="Número de inhalaciones al día"
label(data$dia_este_3)="Número de inhalaciones al día"
label(data$dia_este_4)="Número de inhalaciones al día"
label(data$dia_este_5)="Número de inhalaciones al día"
label(data$dia_este_6)="Número de inhalaciones al día"
label(data$combi_inha)="70.6 esteroides inhalados y agonistas beta 2 (TERAPIA COMBINADA)"
label(data$combi_inha_op___7)="¿cuál? (choice=Salbutamol)"
label(data$combi_inha_op___8)="¿cuál? (choice=Salmeterol)"
label(data$combi_inha_op___9)="¿cuál? (choice=Bromuro de Ipatropio)"
label(data$combi_inha_op___10)="¿cuál? (choice=Bromuro de Tiotropio)"
label(data$combi_inha_op___11)="¿cuál? (choice=Glicopirronio)"
label(data$combi_inha_op___1)="¿cuál? (choice=Beclometasona)"
label(data$combi_inha_op___2)="¿cuál? (choice=Budesonida)"
label(data$combi_inha_op___3)="¿cuál? (choice=Ciclesonida)"
label(data$combi_inha_op___4)="¿cuál? (choice=Fluticasona)"
label(data$combi_inha_op___5)="¿cuál? (choice=Furoato de Mometasona)"
label(data$combi_inha_op___6)="¿cuál? (choice=Acetonida de Triamcinolona)"
label(data$combi_inha_1)="¿cuál?"
label(data$combi_inha_2)="¿cuál?"
label(data$combi_inha_3)="¿cuál?"
label(data$combi_inha_4)="¿cuál?"
label(data$combi_inha_5)="¿cuál?"
label(data$combi_inha_6)="¿cuál?"
label(data$combi_inha_7)="¿cuál?"
label(data$combi_inha_8)="¿cuál?"
label(data$combi_inha_9)="¿cuál?"
label(data$combi_inha_10)="¿cuál?"
label(data$combi_inha_11)="¿cuál?"
label(data$combi_dosis_1)="¿cuanto aplica?"
label(data$combi_dosis_2)="¿cuanto aplica?"
label(data$combi_dosis_3)="¿cuanto aplica?"
label(data$combi_dosis_4)="¿cuanto aplica?"
label(data$combi_dosis_5)="¿cuanto aplica?"
label(data$combi_dosis_6)="¿cuanto aplica?"
label(data$combi_dosis_7)="¿cuanto aplica?"
label(data$combi_dosis_8)="¿cuanto aplica?"
label(data$combi_dosis_9)="¿cuanto aplica?"
label(data$combi_dosis_10)="¿cuanto aplica?"
label(data$combi_dosis_11)="¿cuanto aplica?"
label(data$combi_fr_1)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_2)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_3)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_4)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_5)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_6)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_7)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_8)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_9)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_10)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$combi_fr_11)="Durante los últimos 3 MESES, ¿con qué frecuencia los ha utilizado?"
label(data$mes_combi_1)="Número de inhalaciones al mes"
label(data$mes_combi_2)="Número de inhalaciones al mes"
label(data$mes_combi_3)="Número de inhalaciones al mes"
label(data$mes_combi_4)="Número de inhalaciones al mes"
label(data$mes_combi_5)="Número de inhalaciones al mes"
label(data$mes_combi_6)="Número de inhalaciones al mes"
label(data$mes_combi_7)="Número de inhalaciones al mes"
label(data$mes_combi_8)="Número de inhalaciones al mes"
label(data$mes_combi_9)="Número de inhalaciones al mes"
label(data$mes_combi_10)="Número de inhalaciones al mes"
label(data$mes_combi_11)="Número de inhalaciones al mes"
label(data$dia_combi_1)="Número de inhalaciones al día"
label(data$dia_combi_2)="Número de inhalaciones al día"
label(data$dia_combi_3)="Número de inhalaciones al día"
label(data$dia_combi_4)="Número de inhalaciones al día"
label(data$dia_combi_5)="Número de inhalaciones al día"
label(data$dia_combi_6)="Número de inhalaciones al día"
label(data$dia_combi_7)="Número de inhalaciones al día"
label(data$dia_combi_8)="Número de inhalaciones al día"
label(data$dia_combi_9)="Número de inhalaciones al día"
label(data$dia_combi_10)="Número de inhalaciones al día"
label(data$dia_combi_11)="Número de inhalaciones al día"
label(data$edad_este_inha)="70.7 ¿Qué edad tenía cuando empezó a utilizar esteroides inhalados?"
label(data$edad_este_inha_2)="70.8 ¿Qué edad tenía la última vez que usó esteroides por inhalación?"
label(data$med_oral)="71 ¿Ha tomado en alguna ocasión alguna de las siguientes medicinas (píldoras, cápsulas, pastillas, o jarabes, aparte de las medicinas inhaladas) para mejorar su respiración en LOS ÚLTIMOS 12 MESES?"
label(data$este_oral)="71.1 esteroides orales"
label(data$este_oral_cual_1)="¿cuál?"
label(data$este_oral_cual_2)="¿cuál?"
label(data$este_oral_cual_3)="¿cuál?"
label(data$este_oral_cual_4)="¿cuál?"
label(data$este_oral_cual_5)="¿cuál?"
label(data$este_oral_cual_6)="¿cuál?"
label(data$este_oral_otro_1)="Otro"
label(data$este_oral_otro_2)="Otro"
label(data$este_oral_otro_3)="Otro"
label(data$este_oral_otro_4)="Otro"
label(data$este_oral_otro_5)="Otro"
label(data$este_oral_otro_6)="Otro"
label(data$dosis_1)="¿cuanto?"
label(data$dosis_2)="¿cuanto?"
label(data$dosis_3)="¿cuanto?"
label(data$dosis_4)="¿cuanto?"
label(data$dosis_5)="¿cuanto?"
label(data$dosis_6)="¿cuanto?"
label(data$frecu_1)="Frecuencia"
label(data$frecu_2)="Frecuencia"
label(data$frecu_3)="Frecuencia"
label(data$frecu_4)="Frecuencia"
label(data$frecu_5)="Frecuencia"
label(data$frecu_6)="Frecuencia"
label(data$antibi)="72 ¿Se ha tratado con antibióticos en LOS ÚLTIMOS 12 MESES para facilitar la respiración?"
label(data$antibi_1)="72.1 ¿cuantas veces en el año?"
label(data$antibi_2)="73¿Ha utilizado antibióticos por problemas nasales/de sinusitis en LOS ÚLTIMOS 12 MESES?"
label(data$remedio)="74¿Ha tomado algún otro remedio para mejorar su respiración alguna vez en LOS ÚLTIMOS 12 MESES?"
label(data$remedio_op___1)="74.1 ¿Es alguno de los siguientes? (choice=Hipnoterapia)"
label(data$remedio_op___2)="74.1 ¿Es alguno de los siguientes? (choice=Acupuntura)"
label(data$remedio_op___3)="74.1 ¿Es alguno de los siguientes? (choice=Homeopatía)"
label(data$remedio_op___4)="74.1 ¿Es alguno de los siguientes? (choice=Control de dieta)"
label(data$remedio_op___5)="74.1 ¿Es alguno de los siguientes? (choice=Ejercicios de respiración)"
label(data$remedio_op___6)="74.1 ¿Es alguno de los siguientes? (choice=Natación u otros ejercicios)"
label(data$remedio_op___7)="74.1 ¿Es alguno de los siguientes? (choice=Reflexología)"
label(data$remedio_op___8)="74.1 ¿Es alguno de los siguientes? (choice=Desconocido)"
label(data$remedio_op___9)="74.1 ¿Es alguno de los siguientes? (choice=Otro {remedio_otro_1})"
label(data$remedio_op___10)="74.1 ¿Es alguno de los siguientes? (choice=Otro {remedio_otro_2})"
label(data$remedio_op___11)="74.1 ¿Es alguno de los siguientes? (choice=Otro {remedio_otro_3})"
label(data$remedio_op___12)="74.1 ¿Es alguno de los siguientes? (choice=Otro {remedio_otro_4})"
label(data$remedio_op___13)="74.1 ¿Es alguno de los siguientes? (choice=Otro {remedio_otro_5})"
label(data$remedio_otro_1)="remedio_otro"
label(data$remedio_otro_2)="remedio_otro"
label(data$remedio_otro_3)="remedio_otro"
label(data$remedio_otro_4)="remedio_otro"
label(data$remedio_otro_5)="remedio_otro"
label(data$receta_med)="75 ¿Su médico le ha recetado medicinas (incluyendo inhaladores) para la respiración?"
label(data$receta_med_2)="75.1 Si su médico le receta medicinas para la respiración, ¿usted normalmente toma?  "
label(data$receta_med_3)="75.2 Su médico le receta medicinas para la respiración, ¿usted normalmente toma?  "
label(data$receta_med_4)="75.3 ¿Cree que es perjudicial para usted tomar de forma continua medicinas para su respiración?"
label(data$receta_med_5)="75.4 ¿Cree que debería tomar toda la medicina que necesite para eliminar por completo TODOS los problemas de respiración que tiene?"
label(data$med_otras)="76 ¿Ha utilizado alguna medicina independientemente del motivo de forma habitualdurante MÁS DE 6 MESES DE LOS ÚLTIMOS 12 MESES?"
label(data$med1)=""
label(data$med2)=""
label(data$med3)=""
label(data$med4)=""
label(data$med5)=""
label(data$med6)=""
label(data$med7)=""
label(data$med8)=""
label(data$med9)=""
label(data$med10)=""
label(data$acetaminofen)="77¿Con qué frecuencia toma acetaminofen?"
label(data$acetaminofen_2___1)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Dolor de cabeza)"
label(data$acetaminofen_2___2)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Dolor de espalda o artritis)"
label(data$acetaminofen_2___3)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Problemas de pecho)"
label(data$acetaminofen_2___4)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Dolor menstrual)"
label(data$acetaminofen_2___6)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Dolor en el cuerpo)"
label(data$acetaminofen_2___5)="77.1 Indique, por favor, el motivo principal por el que toma acetaminofen (choice=Otros {aceta_otro})"
label(data$aceta_otro)=""
label(data$analgesico)="78 ¿Con qué frecuencia toma analgésicos, aparte de acetaminofen?"
label(data$analgesico_3___1)="¿cuál analgésico? (choice=AINES (Ibuprofeno, Naproxeno, Diclofenaco, etc))"
label(data$analgesico_3___2)="¿cuál analgésico? (choice=Opiacios (Codeína))"
label(data$analgesico_3___3)="¿cuál analgésico? (choice=Relajantes musculares (metocarbamol))"
label(data$analgesico_3___4)="¿cuál analgésico? (choice=Otro {analgesico_3_otro})"
label(data$analgesico_3_otro)=""
label(data$analgesico_2___1)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Dolor de cabeza)"
label(data$analgesico_2___2)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Dolor de espalda o artritis)"
label(data$analgesico_2___3)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Problemas de pecho)"
label(data$analgesico_2___4)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Dolor menstrual)"
label(data$analgesico_2___6)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Dolor en el cuerpo)"
label(data$analgesico_2___5)="78.1 Indique, por favor, el motivo principal por el que toma estos analégicos (choice=Otros {analg_otro})"
label(data$analg_otro)=""
label(data$desensibili)="79¿ALGUNA VEZ le han puesto inyecciones o vacunas para tratar la alergia o ha pasado por un tratamiento de desensibilización?"
label(data$tto_desensibili___1)=" (choice=Desensibilización a la hierba)"
label(data$tto_desensibili___2)=" (choice=Desensibilización a los ácaros domésticos)"
label(data$tto_desensibili___3)=" (choice=Desensibilización a algún otro agente)"
label(data$tto_desensibili___4)=" (choice=Inyecciones de esteroides de acción prolongada o depot)"
label(data$tto_desensibili___5)=" (choice=Desconocido)"
label(data$desensibili_1)="79.1 ¿Ha recibido ese tratamiento en LOS ÚLTIMOS 12 MESES?"
label(data$gripe)="80 ¿Normalmente se vacuna contra la gripe?"
label(data$gripe_2)="80.1 ¿Se vacunó contra la gripe el invierno pasado?"
label(data$neumo)="81¿Se ha vacunado contra la neumonía en los últimos 5 años?"
label(data$covid)="82 ¿Ha padecido de SARS-CoV-2 (COVID-19)?"
label(data$covid_exa)="82.1 ¿fue confirmado por exámenes?"
label(data$covid_2)="82.2 ¿Hace cuanto?"
label(data$covid_3___1)="82.3 ¿Cuáles síntomas presentó? (choice=Pérdida del olfato)"
label(data$covid_3___2)="82.3 ¿Cuáles síntomas presentó? (choice=Rinorrea (congestión))"
label(data$covid_3___3)="82.3 ¿Cuáles síntomas presentó? (choice=Tos)"
label(data$covid_3___4)="82.3 ¿Cuáles síntomas presentó? (choice=Apnea)"
label(data$covid_3___5)="82.3 ¿Cuáles síntomas presentó? (choice=Fiebre)"
label(data$covid_3___6)="82.3 ¿Cuáles síntomas presentó? (choice=Altralgias)"
label(data$covid_3___7)="82.3 ¿Cuáles síntomas presentó? (choice=Alteraciones gastrointestinales)"
label(data$covid_3___8)="82.3 ¿Cuáles síntomas presentó? (choice=Otro {covid_sinto_otro_1})"
label(data$covid_sinto_otro_1)="¿cuál?"
label(data$covid_4)="82.4 ¿Requirió hospitalización?"
label(data$covid_5)="82.5 ¿Requirió UCI?"
label(data$covid_6)="82.6 ¿Ha padecido COVID-19 en más de una ocasión?"
label(data$covid_exa_2)="82.7 ¿fue confirmado por exámenes?"
label(data$covid_7___1)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Pérdida del olfato)"
label(data$covid_7___2)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Rinorrea (congestión))"
label(data$covid_7___3)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Tos)"
label(data$covid_7___4)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Apnea)"
label(data$covid_7___5)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Fiebre)"
label(data$covid_7___6)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Altralgias)"
label(data$covid_7___7)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Alteraciones gastrointestinales)"
label(data$covid_7___8)="82.8 ¿Cuáles síntomas presentó en la segunda ocasión? (choice=Otro {covid_sinto_otro_2})"
label(data$covid_sinto_otro_2)="¿cuál?"
label(data$covid_8)="82.9 ¿Requirió hospitalización en la segunda ocasión que padeción COVID-19?"
label(data$covid_9)="82.8 ¿Requirió UCI en la segunda ocasión que padeció COVID-19?"
label(data$covid_10)="82.10 ¿Ha padecido COVID-19 en una tercera ocasión?"
label(data$covid_exa_3)="82.11 ¿fue confirmado por exámenes?"
label(data$covid_11___1)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Pérdida del olfato)"
label(data$covid_11___2)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Rinorrea (congestión))"
label(data$covid_11___3)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Tos)"
label(data$covid_11___4)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Apnea)"
label(data$covid_11___5)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Fiebre)"
label(data$covid_11___6)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Altralgias)"
label(data$covid_11___7)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Alteraciones gastrointestinales)"
label(data$covid_11___8)="82.12 ¿Cuáles síntomas presentó en la tercera ocasión? (choice=Otro {covid_sinto_otro_3})"
label(data$covid_sinto_otro_3)="¿cuál?"
label(data$covid_12)="82.13 ¿Requirió hospitalización en la segunda ocasión que padeción COVID-19?"
label(data$covid_13)="82.14 ¿Requirió UCI en la segunda ocasión que padeció COVID-19?"
label(data$covid_vacu)="83¿Se ha vacunado contra el virus SARS-CoV-2 (COVID-19)?"
label(data$covid_prov_1)="COVID-19 Proveedor"
label(data$covid_prov_2)="COVID-19 Proveedor"
label(data$covid_prov_3)="COVID-19 Proveedor"
label(data$covid_prov_4)="COVID-19 Proveedor"
label(data$covid_prov_5)="COVID-19 Proveedor"
label(data$covid_fecha_1)="COVID-19 Fecha"
label(data$covid_fecha_2)="COVID-19 Fecha"
label(data$covid_fecha_3)="COVID-19 Fecha"
label(data$covid_fecha_4)="COVID-19 Fecha"
label(data$covid_fecha_5)="COVID-19 Fecha"
label(data$urgen)="84 ¿ha tenido que ir a urgencias hospitalarias (por cualquier motivo, aparte de accidentes y lesiones)?"
label(data$urgen_2)="84.1 ¿Fue debido a PROBLEMAS RESPIRATORIOS, al menos en una ocasión?"
label(data$urgen_3)="84.2 ¿Fue en los ÚLTIMOS 12 MESES?"
label(data$urgen_4)="84.2.1 ¿Cuantas veces?"
label(data$urgen_5)="84.2.2 ¿Cuantas de esas veces por PROBLEMAS RESPIRATORIOS?"
label(data$vis_med)="85 En LOS ÚLTIMOS 12 MESES, ¿Ha sido visitado por un medico general (por alguna razón, QUE NO FUERAN accidentes y lesiones)?"
label(data$vis_med_2)="85.1 ¿Fue en los ÚLTIMOS 12 MESES?"
label(data$vis_med_3)="85.1.1 ¿Cuantas de esas veces por PROBLEMAS RESPIRATORIOS?"
label(data$vis_esp)="86 En LOS ÚLTIMOS 12 MESES, ¿Ha sido visitado por un especialista (por alguna razón, QUE NO FUERAN accidentes y lesiones)?"
label(data$vis_esp_2)="86.1 ¿Fue en los ÚLTIMOS 12 MESES?"
label(data$vis_esp_3)="86.1.1 ¿Cuantas de esas veces por PROBLEMAS RESPIRATORIOS?"
label(data$vis_reg_med)="87 ¿Le han dado citas regulares para ser visto por un medico (o enfermera) debido a sus problemas respiratorios?"
label(data$vis_reg)="88 Durante LOS ÚLTIMOS 12 MESES, debido a sus PROBLEMAS RESPIRATORIOS, ¿ha sido visitado por alguno de los siguientes,? y si ese es el caso, indique cuantas veces"
label(data$enfer_veces)=""
label(data$fisio_veces)=""
label(data$alter_veces)=""
label(data$prueb_clin)="89 En LOS ÚLTIMOS 12 MESES, ¿Le han hecho pruebas clínicas o de laboratorio, debido a problemas de salud (aparte de los accidentes y lesiones)?"
label(data$prueb_clin_2)="89.1 ¿Se ha debido al menos una vez por problemas respiratorios?"
label(data$prueb_clin_3)="89.1.1 ¿En los últimos 12 MESES?"
label(data$prueb_clin_4___1)="Indique cuales y la veces que se las ha realizado (choice=Pruebas de respiración en laboratorio para medición de la función pulmonar {fun_pul})"
label(data$prueb_clin_4___2)="Indique cuales y la veces que se las ha realizado (choice=Prueba de piel para alergias {piel_aler})"
label(data$prueb_clin_4___3)="Indique cuales y la veces que se las ha realizado (choice=Análisis de sangre para alergias {san_aler})"
label(data$prueb_clin_4___4)="Indique cuales y la veces que se las ha realizado (choice=Rayos x {r_x})"
label(data$prueb_clin_4___5)="Indique cuales y la veces que se las ha realizado (choice=Tomografía computarizada torácica {tct})"
label(data$fun_pul)=""
label(data$piel_aler)=""
label(data$san_aler)=""
label(data$r_x)=""
label(data$tct)=""
label(data$perd_trab)="90 En LOS ÚLTIMOS 12 MESES, ha perdido días de trabajo por problemas de salud (que no fueran accidentes o lesiones)?"
label(data$perd_trab_2)="90.1 ¿Cuántos días le ha ocurrido esto durante LOS ÚLTIMOS 12 MESES?"
label(data$perd_trab_3)="90.2 ¿Cuántos veces por PROBLEMAS RESPIRATORIOS?"
label(data$perd_trab_4)="91 ¿Ha tenido que dejar de trabajar totalmente por problemas de salud (aparte de accidentes y lesiones)?"
label(data$perd_trab_5)="91.1 ¿Hace cuanto?"
label(data$perd_trab_6)="91.2 ¿Por PROBLEMAS RESPIRATORIOS?"
label(data$perd_trab_7)="92 En LOS ÚLTIMOS 12 MESES ¿ha habido algún día en el que haya tenido que renunciar a realizar actividades aparte de trabajo (Ej. cuidar de niños, estudiar) por problemas de salud,(aparte de accidentes y lesiones)?"
label(data$perd_trab_8)="92.1 ¿Cuántos días en promedio al mes?"
label(data$perd_trab_9)="92.2 De ellos, ¿cuántos fueron por PROBLEMAS RESPIRATORIOS?"
label(data$cuestionario_respiratorio_complete)="Complete?"
label(data$ubicacion_archivo_general_timestamp)="Survey Timestamp"
label(data$sue_1_a)="A"
label(data$sue_1_b)="B"
label(data$sue_1_c)="C"
label(data$sue_1_d)="D"
label(data$sue_1_e)="E"
label(data$sue_1_f)="F"
label(data$sue_1_g)="G"
label(data$sue_1_h)="H"
label(data$sue_1_i)="I"
label(data$sue_1_j)="J"
label(data$est_sue)="Estante Suero"
label(data$est_sue_2)="Estante Suero"
label(data$racksa_sue)="Racks A Suero"
label(data$racksb_sue)="Racks B Suero"
label(data$racksc_sue)="Racks C Suero"
label(data$racksd_sue)="Racks D Suero"
label(data$racksa_sue_2)="Racks A Suero"
label(data$racksb_sue_2)="Racks B Suero"
label(data$racksc_sue_2)="Racks C Suero"
label(data$racksd_sue_2)="Racks D Suero"
label(data$caja_sue)="Caja Suero"
label(data$caja_sue_2)="Caja Suero"
label(data$ubicacion_archivo_general_complete)="Complete?"
label(data$ndice_de_materialidad_timestamp)="Survey Timestamp"
label(data$nombre)="Nombre"
label(data$techo)="¿de qué está hecho el techo de su casa?"
label(data$paredes)="¿de qué están hechas las paredes?"
label(data$piso)="¿De qué está hecho el piso?"
label(data$otro_techo)=""
label(data$otro_paredes)=""
label(data$otro_piso)=""
label(data$ndice_de_materialidad_complete)="Complete?"
#Setting Units

units(data$ctotal)="g/dL"
units(data$chdl)="mg/dL"
units(data$tri)="mg/dL"
units(data$gli)="g/kg/d"
units(data$hba1c)="mg/dL"

#Setting Factors(will create new variable for factors)
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("antecedentes_personales","antecedentes_familiares","actividad_fsica","cuestionario_de_frecuencia_de_alimentos","exmen_fsico","toma_de_muestra_anlisis_bioqumicos","cuestionario_respiratorio"))
data$tipo_id.factor = factor(data$tipo_id,levels=c("1","2","3","4"))
data$localidad.factor = factor(data$localidad,levels=c("1","2","3","4"))
data$gender.factor = factor(data$gender,levels=c("0","1"))
data$lugar_nac_op.factor = factor(data$lugar_nac_op,levels=c("1","2"))
data$lugar_pro_op.factor = factor(data$lugar_pro_op,levels=c("1","2"))
data$escolaridad.factor = factor(data$escolaridad,levels=c("1","2","3","4","5","6","7","8","9","10","11","12"))
data$grupo_san.factor = factor(data$grupo_san,levels=c("1","2","3","4","5","6","7","8"))
data$ocupacion.factor = factor(data$ocupacion,levels=c("1","2","3","4","5"))
data$ocupacion_op.factor = factor(data$ocupacion_op,levels=c("1","2","3","4","5","6","7","8"))
data$hijos.factor = factor(data$hijos,levels=c("1","2"))
data$informacion_general_complete.factor = factor(data$informacion_general_complete,levels=c("0","1","2"))
data$cesaria.factor = factor(data$cesaria,levels=c("1","2","3"))
data$ant_p_enf.factor = factor(data$ant_p_enf,levels=c("1","2"))
data$dis_p.factor = factor(data$dis_p,levels=c("1","2"))
data$dis_p_act.factor = factor(data$dis_p_act,levels=c("1","2"))
data$hta_p.factor = factor(data$hta_p,levels=c("1","2"))
data$ecv_p.factor = factor(data$ecv_p,levels=c("1","2"))
data$cancer_p.factor = factor(data$cancer_p,levels=c("1","2"))
data$dm2_p.factor = factor(data$dm2_p,levels=c("1","2"))
data$ptiro_p.factor = factor(data$ptiro_p,levels=c("1","2"))
data$parep_p.factor = factor(data$parep_p,levels=c("1","2"))
data$otra_p.factor = factor(data$otra_p,levels=c("1","2"))
data$otra_p_cancer___1.factor = factor(data$otra_p_cancer___1,levels=c("0","1"))
data$otra_p_cancer___2.factor = factor(data$otra_p_cancer___2,levels=c("0","1"))
data$otra_p_cancer___3.factor = factor(data$otra_p_cancer___3,levels=c("0","1"))
data$otra_p_cancer___4.factor = factor(data$otra_p_cancer___4,levels=c("0","1"))
data$otra_p_cancer___5.factor = factor(data$otra_p_cancer___5,levels=c("0","1"))
data$otra_p_cancer___6.factor = factor(data$otra_p_cancer___6,levels=c("0","1"))
data$otra_p_cancer___7.factor = factor(data$otra_p_cancer___7,levels=c("0","1"))
data$otra_p_cancer___8.factor = factor(data$otra_p_cancer___8,levels=c("0","1"))
data$otra_p_cancer___9.factor = factor(data$otra_p_cancer___9,levels=c("0","1"))
data$otra_p_cancer___10.factor = factor(data$otra_p_cancer___10,levels=c("0","1"))
data$otra_p_cancer___11.factor = factor(data$otra_p_cancer___11,levels=c("0","1"))
data$tto_dis_p___1.factor = factor(data$tto_dis_p___1,levels=c("0","1"))
data$tto_dis_p___2.factor = factor(data$tto_dis_p___2,levels=c("0","1"))
data$tto_dis_p___3.factor = factor(data$tto_dis_p___3,levels=c("0","1"))
data$tto_dis_p___4.factor = factor(data$tto_dis_p___4,levels=c("0","1"))
data$tto_dis_p___5.factor = factor(data$tto_dis_p___5,levels=c("0","1"))
data$tto_dis_p___6.factor = factor(data$tto_dis_p___6,levels=c("0","1"))
data$cual_estatinas___1.factor = factor(data$cual_estatinas___1,levels=c("0","1"))
data$cual_estatinas___2.factor = factor(data$cual_estatinas___2,levels=c("0","1"))
data$cual_estatinas___3.factor = factor(data$cual_estatinas___3,levels=c("0","1"))
data$cual_fibratos___1.factor = factor(data$cual_fibratos___1,levels=c("0","1"))
data$cual_fibratos___2.factor = factor(data$cual_fibratos___2,levels=c("0","1"))
data$cual_fibratos___3.factor = factor(data$cual_fibratos___3,levels=c("0","1"))
data$cual_resinas___1.factor = factor(data$cual_resinas___1,levels=c("0","1"))
data$cual_resinas___2.factor = factor(data$cual_resinas___2,levels=c("0","1"))
data$cual_resinas___3.factor = factor(data$cual_resinas___3,levels=c("0","1"))
data$tto_hta_p___1.factor = factor(data$tto_hta_p___1,levels=c("0","1"))
data$tto_hta_p___2.factor = factor(data$tto_hta_p___2,levels=c("0","1"))
data$tto_hta_p___3.factor = factor(data$tto_hta_p___3,levels=c("0","1"))
data$tto_hta_p___4.factor = factor(data$tto_hta_p___4,levels=c("0","1"))
data$tto_hta_p___5.factor = factor(data$tto_hta_p___5,levels=c("0","1"))
data$tto_hta_p___6.factor = factor(data$tto_hta_p___6,levels=c("0","1"))
data$tto_hta_p___7.factor = factor(data$tto_hta_p___7,levels=c("0","1"))
data$tto_hta_p___8.factor = factor(data$tto_hta_p___8,levels=c("0","1"))
data$tto_hta_p___9.factor = factor(data$tto_hta_p___9,levels=c("0","1"))
data$cual_araii___1.factor = factor(data$cual_araii___1,levels=c("0","1"))
data$cual_araii___2.factor = factor(data$cual_araii___2,levels=c("0","1"))
data$cual_araii___3.factor = factor(data$cual_araii___3,levels=c("0","1"))
data$cual_araii___4.factor = factor(data$cual_araii___4,levels=c("0","1"))
data$cual_ca___1.factor = factor(data$cual_ca___1,levels=c("0","1"))
data$cual_ca___2.factor = factor(data$cual_ca___2,levels=c("0","1"))
data$cual_ca___3.factor = factor(data$cual_ca___3,levels=c("0","1"))
data$cual_ca___4.factor = factor(data$cual_ca___4,levels=c("0","1"))
data$cual_ca___5.factor = factor(data$cual_ca___5,levels=c("0","1"))
data$cual_ca___6.factor = factor(data$cual_ca___6,levels=c("0","1"))
data$cual_ca___7.factor = factor(data$cual_ca___7,levels=c("0","1"))
data$cual_ca___8.factor = factor(data$cual_ca___8,levels=c("0","1"))
data$cual_ca___9.factor = factor(data$cual_ca___9,levels=c("0","1"))
data$cual_bb___1.factor = factor(data$cual_bb___1,levels=c("0","1"))
data$cual_bb___2.factor = factor(data$cual_bb___2,levels=c("0","1"))
data$cual_bb___3.factor = factor(data$cual_bb___3,levels=c("0","1"))
data$cual_bb___4.factor = factor(data$cual_bb___4,levels=c("0","1"))
data$cual_bb___5.factor = factor(data$cual_bb___5,levels=c("0","1"))
data$cual_bb___6.factor = factor(data$cual_bb___6,levels=c("0","1"))
data$cual_bb___7.factor = factor(data$cual_bb___7,levels=c("0","1"))
data$cual_bb___8.factor = factor(data$cual_bb___8,levels=c("0","1"))
data$cual_bb___9.factor = factor(data$cual_bb___9,levels=c("0","1"))
data$cual_bb___10.factor = factor(data$cual_bb___10,levels=c("0","1"))
data$cual_ieca___1.factor = factor(data$cual_ieca___1,levels=c("0","1"))
data$cual_ieca___2.factor = factor(data$cual_ieca___2,levels=c("0","1"))
data$cual_ieca___3.factor = factor(data$cual_ieca___3,levels=c("0","1"))
data$cual_ieca___4.factor = factor(data$cual_ieca___4,levels=c("0","1"))
data$cual_ieca___5.factor = factor(data$cual_ieca___5,levels=c("0","1"))
data$cual_diu___1.factor = factor(data$cual_diu___1,levels=c("0","1"))
data$cual_diu___2.factor = factor(data$cual_diu___2,levels=c("0","1"))
data$cual_diu___3.factor = factor(data$cual_diu___3,levels=c("0","1"))
data$cual_diu___4.factor = factor(data$cual_diu___4,levels=c("0","1"))
data$cual_digi___1.factor = factor(data$cual_digi___1,levels=c("0","1"))
data$cual_digi___2.factor = factor(data$cual_digi___2,levels=c("0","1"))
data$tto_dm2_p___1.factor = factor(data$tto_dm2_p___1,levels=c("0","1"))
data$tto_dm2_p___2.factor = factor(data$tto_dm2_p___2,levels=c("0","1"))
data$tto_dm2_p___3.factor = factor(data$tto_dm2_p___3,levels=c("0","1"))
data$tto_dm2_p___4.factor = factor(data$tto_dm2_p___4,levels=c("0","1"))
data$tto_dm2_p___5.factor = factor(data$tto_dm2_p___5,levels=c("0","1"))
data$tto_dm2_p___6.factor = factor(data$tto_dm2_p___6,levels=c("0","1"))
data$tto_dm2_p___7.factor = factor(data$tto_dm2_p___7,levels=c("0","1"))
data$tto_dm2_p___8.factor = factor(data$tto_dm2_p___8,levels=c("0","1"))
data$tto_dm2_p___9.factor = factor(data$tto_dm2_p___9,levels=c("0","1"))
data$tto_dm2_p___11.factor = factor(data$tto_dm2_p___11,levels=c("0","1"))
data$tto_dm2_p___12.factor = factor(data$tto_dm2_p___12,levels=c("0","1"))
data$tto_dm2_p___13.factor = factor(data$tto_dm2_p___13,levels=c("0","1"))
data$cual_ins___1.factor = factor(data$cual_ins___1,levels=c("0","1"))
data$cual_ins___2.factor = factor(data$cual_ins___2,levels=c("0","1"))
data$cual_ins___3.factor = factor(data$cual_ins___3,levels=c("0","1"))
data$cual_ins___4.factor = factor(data$cual_ins___4,levels=c("0","1"))
data$cual_ins___5.factor = factor(data$cual_ins___5,levels=c("0","1"))
data$cual_ins___6.factor = factor(data$cual_ins___6,levels=c("0","1"))
data$cual_ins___7.factor = factor(data$cual_ins___7,levels=c("0","1"))
data$cual_bigu___1.factor = factor(data$cual_bigu___1,levels=c("0","1"))
data$cual_sulfo___1.factor = factor(data$cual_sulfo___1,levels=c("0","1"))
data$cual_sulfo___2.factor = factor(data$cual_sulfo___2,levels=c("0","1"))
data$cual_sulfo___3.factor = factor(data$cual_sulfo___3,levels=c("0","1"))
data$cual_sulfo___4.factor = factor(data$cual_sulfo___4,levels=c("0","1"))
data$cual_sulfo___5.factor = factor(data$cual_sulfo___5,levels=c("0","1"))
data$cual_sulfo___6.factor = factor(data$cual_sulfo___6,levels=c("0","1"))
data$cual_i_alfa_g___1.factor = factor(data$cual_i_alfa_g___1,levels=c("0","1"))
data$cual_i_alfa_g___2.factor = factor(data$cual_i_alfa_g___2,levels=c("0","1"))
data$cual_megli___1.factor = factor(data$cual_megli___1,levels=c("0","1"))
data$cual_megli___3.factor = factor(data$cual_megli___3,levels=c("0","1"))
data$cual_tiazo___1.factor = factor(data$cual_tiazo___1,levels=c("0","1"))
data$cual_tiazo___2.factor = factor(data$cual_tiazo___2,levels=c("0","1"))
data$cual_i_dpp4___1.factor = factor(data$cual_i_dpp4___1,levels=c("0","1"))
data$cual_i_dpp4___2.factor = factor(data$cual_i_dpp4___2,levels=c("0","1"))
data$cual_i_dpp4___3.factor = factor(data$cual_i_dpp4___3,levels=c("0","1"))
data$cual_ago_glp1___1.factor = factor(data$cual_ago_glp1___1,levels=c("0","1"))
data$cual_ago_glp1___2.factor = factor(data$cual_ago_glp1___2,levels=c("0","1"))
data$cual_isglt2___1.factor = factor(data$cual_isglt2___1,levels=c("0","1"))
data$cual_isglt2___2.factor = factor(data$cual_isglt2___2,levels=c("0","1"))
data$tto_ecv_p___6.factor = factor(data$tto_ecv_p___6,levels=c("0","1"))
data$tto_ecv_p___7.factor = factor(data$tto_ecv_p___7,levels=c("0","1"))
data$tto_ecv_p___0.factor = factor(data$tto_ecv_p___0,levels=c("0","1"))
data$tto_ecv_p___1.factor = factor(data$tto_ecv_p___1,levels=c("0","1"))
data$tto_ecv_p___2.factor = factor(data$tto_ecv_p___2,levels=c("0","1"))
data$tto_ecv_p___3.factor = factor(data$tto_ecv_p___3,levels=c("0","1"))
data$tto_ecv_p___4.factor = factor(data$tto_ecv_p___4,levels=c("0","1"))
data$tto_ecv_p___5.factor = factor(data$tto_ecv_p___5,levels=c("0","1"))
data$ant_p_qx_op.factor = factor(data$ant_p_qx_op,levels=c("1","2"))
data$ape_p_qx.factor = factor(data$ape_p_qx,levels=c("1","2"))
data$sal_p_qx.factor = factor(data$sal_p_qx,levels=c("1","2"))
data$his_p_qx.factor = factor(data$his_p_qx,levels=c("1","2"))
data$oof_p_qx.factor = factor(data$oof_p_qx,levels=c("1","2"))
data$ces_p_qx.factor = factor(data$ces_p_qx,levels=c("1","2"))
data$her_p_qx.factor = factor(data$her_p_qx,levels=c("1","2"))
data$col_p_qx.factor = factor(data$col_p_qx,levels=c("1","2"))
data$fra_p_qx.factor = factor(data$fra_p_qx,levels=c("1","2"))
data$otra_p_qx.factor = factor(data$otra_p_qx,levels=c("1","2"))
data$ob_ape_p_qx.factor = factor(data$ob_ape_p_qx,levels=c("1","2"))
data$ob_sal_p_qx.factor = factor(data$ob_sal_p_qx,levels=c("1","2"))
data$ob_his_p_qx.factor = factor(data$ob_his_p_qx,levels=c("1","2"))
data$ob_oof_p_qx.factor = factor(data$ob_oof_p_qx,levels=c("1","2"))
data$ob_ces_p_qx.factor = factor(data$ob_ces_p_qx,levels=c("1","2"))
data$ob_her_p_qx.factor = factor(data$ob_her_p_qx,levels=c("1","2"))
data$ob_col_p_qx.factor = factor(data$ob_col_p_qx,levels=c("1","2"))
data$ob_fra_p_qx.factor = factor(data$ob_fra_p_qx,levels=c("1","2"))
data$ob_otra_p_qx.factor = factor(data$ob_otra_p_qx,levels=c("1","2"))
data$con_alc_op.factor = factor(data$con_alc_op,levels=c("1","2"))
data$fre_cer_330.factor = factor(data$fre_cer_330,levels=c("1","2","3","4"))
data$fre_cer_269.factor = factor(data$fre_cer_269,levels=c("1","2","3","4"))
data$fre_cer_175.factor = factor(data$fre_cer_175,levels=c("1","2","3","4"))
data$fre_vino.factor = factor(data$fre_vino,levels=c("1","2","3","4"))
data$fre_aguar.factor = factor(data$fre_aguar,levels=c("1","2","3","4"))
data$fre_ron.factor = factor(data$fre_ron,levels=c("1","2","3","4"))
data$fre_whis.factor = factor(data$fre_whis,levels=c("1","2","3","4"))
data$fre_otro.factor = factor(data$fre_otro,levels=c("1","2","3","4"))
data$con_tab_op.factor = factor(data$con_tab_op,levels=c("1","2"))
data$con_tab_act_op.factor = factor(data$con_tab_act_op,levels=c("1","2"))
data$expo_tab_otro.factor = factor(data$expo_tab_otro,levels=c("1","2"))
data$tab_trag.factor = factor(data$tab_trag,levels=c("1","2"))
data$antecedentes_personales_complete.factor = factor(data$antecedentes_personales_complete,levels=c("0","1","2"))
data$dis_p_fam.factor = factor(data$dis_p_fam,levels=c("1","2"))
data$hta_p_fam.factor = factor(data$hta_p_fam,levels=c("1","2"))
data$ecv_p_fam.factor = factor(data$ecv_p_fam,levels=c("1","2"))
data$dm2_p_fam.factor = factor(data$dm2_p_fam,levels=c("1","2"))
data$cancer_p_fam.factor = factor(data$cancer_p_fam,levels=c("1","2"))
data$alzh_p_fam.factor = factor(data$alzh_p_fam,levels=c("1","2"))
data$park_p_fam.factor = factor(data$park_p_fam,levels=c("1","2"))
data$asma_p_fam.factor = factor(data$asma_p_fam,levels=c("1","2"))
data$bronquitis_p_fam.factor = factor(data$bronquitis_p_fam,levels=c("1","2"))
data$acv_p_fam.factor = factor(data$acv_p_fam,levels=c("1","2"))
data$otra_p_fam.factor = factor(data$otra_p_fam,levels=c("1","2"))
data$otra_p_cancer_fam_1___1.factor = factor(data$otra_p_cancer_fam_1___1,levels=c("0","1"))
data$otra_p_cancer_fam_1___2.factor = factor(data$otra_p_cancer_fam_1___2,levels=c("0","1"))
data$otra_p_cancer_fam_1___3.factor = factor(data$otra_p_cancer_fam_1___3,levels=c("0","1"))
data$otra_p_cancer_fam_1___4.factor = factor(data$otra_p_cancer_fam_1___4,levels=c("0","1"))
data$otra_p_cancer_fam_1___5.factor = factor(data$otra_p_cancer_fam_1___5,levels=c("0","1"))
data$otra_p_cancer_fam_1___6.factor = factor(data$otra_p_cancer_fam_1___6,levels=c("0","1"))
data$otra_p_cancer_fam_1___7.factor = factor(data$otra_p_cancer_fam_1___7,levels=c("0","1"))
data$otra_p_cancer_fam_1___8.factor = factor(data$otra_p_cancer_fam_1___8,levels=c("0","1"))
data$otra_p_cancer_fam_1___9.factor = factor(data$otra_p_cancer_fam_1___9,levels=c("0","1"))
data$otra_p_cancer_fam_1___10.factor = factor(data$otra_p_cancer_fam_1___10,levels=c("0","1"))
data$otra_p_cancer_fam_1___11.factor = factor(data$otra_p_cancer_fam_1___11,levels=c("0","1"))
data$otra_p_cancer_fam_1___12.factor = factor(data$otra_p_cancer_fam_1___12,levels=c("0","1"))
data$otra_p_cancer_fam_2___1.factor = factor(data$otra_p_cancer_fam_2___1,levels=c("0","1"))
data$otra_p_cancer_fam_2___2.factor = factor(data$otra_p_cancer_fam_2___2,levels=c("0","1"))
data$otra_p_cancer_fam_2___3.factor = factor(data$otra_p_cancer_fam_2___3,levels=c("0","1"))
data$otra_p_cancer_fam_2___4.factor = factor(data$otra_p_cancer_fam_2___4,levels=c("0","1"))
data$otra_p_cancer_fam_2___5.factor = factor(data$otra_p_cancer_fam_2___5,levels=c("0","1"))
data$otra_p_cancer_fam_2___6.factor = factor(data$otra_p_cancer_fam_2___6,levels=c("0","1"))
data$otra_p_cancer_fam_2___7.factor = factor(data$otra_p_cancer_fam_2___7,levels=c("0","1"))
data$otra_p_cancer_fam_2___8.factor = factor(data$otra_p_cancer_fam_2___8,levels=c("0","1"))
data$otra_p_cancer_fam_2___9.factor = factor(data$otra_p_cancer_fam_2___9,levels=c("0","1"))
data$otra_p_cancer_fam_2___10.factor = factor(data$otra_p_cancer_fam_2___10,levels=c("0","1"))
data$otra_p_cancer_fam_2___11.factor = factor(data$otra_p_cancer_fam_2___11,levels=c("0","1"))
data$otra_p_cancer_fam_2___12.factor = factor(data$otra_p_cancer_fam_2___12,levels=c("0","1"))
data$otra_p_cancer_fam_3___1.factor = factor(data$otra_p_cancer_fam_3___1,levels=c("0","1"))
data$otra_p_cancer_fam_3___2.factor = factor(data$otra_p_cancer_fam_3___2,levels=c("0","1"))
data$otra_p_cancer_fam_3___3.factor = factor(data$otra_p_cancer_fam_3___3,levels=c("0","1"))
data$otra_p_cancer_fam_3___4.factor = factor(data$otra_p_cancer_fam_3___4,levels=c("0","1"))
data$otra_p_cancer_fam_3___5.factor = factor(data$otra_p_cancer_fam_3___5,levels=c("0","1"))
data$otra_p_cancer_fam_3___6.factor = factor(data$otra_p_cancer_fam_3___6,levels=c("0","1"))
data$otra_p_cancer_fam_3___7.factor = factor(data$otra_p_cancer_fam_3___7,levels=c("0","1"))
data$otra_p_cancer_fam_3___8.factor = factor(data$otra_p_cancer_fam_3___8,levels=c("0","1"))
data$otra_p_cancer_fam_3___9.factor = factor(data$otra_p_cancer_fam_3___9,levels=c("0","1"))
data$otra_p_cancer_fam_3___10.factor = factor(data$otra_p_cancer_fam_3___10,levels=c("0","1"))
data$otra_p_cancer_fam_3___11.factor = factor(data$otra_p_cancer_fam_3___11,levels=c("0","1"))
data$otra_p_cancer_fam_3___12.factor = factor(data$otra_p_cancer_fam_3___12,levels=c("0","1"))
data$otra_p_cancer_fam_4___1.factor = factor(data$otra_p_cancer_fam_4___1,levels=c("0","1"))
data$otra_p_cancer_fam_4___2.factor = factor(data$otra_p_cancer_fam_4___2,levels=c("0","1"))
data$otra_p_cancer_fam_4___3.factor = factor(data$otra_p_cancer_fam_4___3,levels=c("0","1"))
data$otra_p_cancer_fam_4___4.factor = factor(data$otra_p_cancer_fam_4___4,levels=c("0","1"))
data$otra_p_cancer_fam_4___5.factor = factor(data$otra_p_cancer_fam_4___5,levels=c("0","1"))
data$otra_p_cancer_fam_4___6.factor = factor(data$otra_p_cancer_fam_4___6,levels=c("0","1"))
data$otra_p_cancer_fam_4___7.factor = factor(data$otra_p_cancer_fam_4___7,levels=c("0","1"))
data$otra_p_cancer_fam_4___8.factor = factor(data$otra_p_cancer_fam_4___8,levels=c("0","1"))
data$otra_p_cancer_fam_4___9.factor = factor(data$otra_p_cancer_fam_4___9,levels=c("0","1"))
data$otra_p_cancer_fam_4___10.factor = factor(data$otra_p_cancer_fam_4___10,levels=c("0","1"))
data$otra_p_cancer_fam_4___11.factor = factor(data$otra_p_cancer_fam_4___11,levels=c("0","1"))
data$otra_p_cancer_fam_4___12.factor = factor(data$otra_p_cancer_fam_4___12,levels=c("0","1"))
data$otra_p_cancer_fam_5___1.factor = factor(data$otra_p_cancer_fam_5___1,levels=c("0","1"))
data$otra_p_cancer_fam_5___2.factor = factor(data$otra_p_cancer_fam_5___2,levels=c("0","1"))
data$otra_p_cancer_fam_5___3.factor = factor(data$otra_p_cancer_fam_5___3,levels=c("0","1"))
data$otra_p_cancer_fam_5___4.factor = factor(data$otra_p_cancer_fam_5___4,levels=c("0","1"))
data$otra_p_cancer_fam_5___5.factor = factor(data$otra_p_cancer_fam_5___5,levels=c("0","1"))
data$otra_p_cancer_fam_5___6.factor = factor(data$otra_p_cancer_fam_5___6,levels=c("0","1"))
data$otra_p_cancer_fam_5___7.factor = factor(data$otra_p_cancer_fam_5___7,levels=c("0","1"))
data$otra_p_cancer_fam_5___8.factor = factor(data$otra_p_cancer_fam_5___8,levels=c("0","1"))
data$otra_p_cancer_fam_5___9.factor = factor(data$otra_p_cancer_fam_5___9,levels=c("0","1"))
data$otra_p_cancer_fam_5___10.factor = factor(data$otra_p_cancer_fam_5___10,levels=c("0","1"))
data$otra_p_cancer_fam_5___11.factor = factor(data$otra_p_cancer_fam_5___11,levels=c("0","1"))
data$otra_p_cancer_fam_5___12.factor = factor(data$otra_p_cancer_fam_5___12,levels=c("0","1"))
data$otra_p_cancer_fam_6___1.factor = factor(data$otra_p_cancer_fam_6___1,levels=c("0","1"))
data$otra_p_cancer_fam_6___2.factor = factor(data$otra_p_cancer_fam_6___2,levels=c("0","1"))
data$otra_p_cancer_fam_6___3.factor = factor(data$otra_p_cancer_fam_6___3,levels=c("0","1"))
data$otra_p_cancer_fam_6___4.factor = factor(data$otra_p_cancer_fam_6___4,levels=c("0","1"))
data$otra_p_cancer_fam_6___5.factor = factor(data$otra_p_cancer_fam_6___5,levels=c("0","1"))
data$otra_p_cancer_fam_6___6.factor = factor(data$otra_p_cancer_fam_6___6,levels=c("0","1"))
data$otra_p_cancer_fam_6___7.factor = factor(data$otra_p_cancer_fam_6___7,levels=c("0","1"))
data$otra_p_cancer_fam_6___8.factor = factor(data$otra_p_cancer_fam_6___8,levels=c("0","1"))
data$otra_p_cancer_fam_6___9.factor = factor(data$otra_p_cancer_fam_6___9,levels=c("0","1"))
data$otra_p_cancer_fam_6___10.factor = factor(data$otra_p_cancer_fam_6___10,levels=c("0","1"))
data$otra_p_cancer_fam_6___11.factor = factor(data$otra_p_cancer_fam_6___11,levels=c("0","1"))
data$otra_p_cancer_fam_6___12.factor = factor(data$otra_p_cancer_fam_6___12,levels=c("0","1"))
data$otra_p_cancer_fam_7___1.factor = factor(data$otra_p_cancer_fam_7___1,levels=c("0","1"))
data$otra_p_cancer_fam_7___2.factor = factor(data$otra_p_cancer_fam_7___2,levels=c("0","1"))
data$otra_p_cancer_fam_7___3.factor = factor(data$otra_p_cancer_fam_7___3,levels=c("0","1"))
data$otra_p_cancer_fam_7___4.factor = factor(data$otra_p_cancer_fam_7___4,levels=c("0","1"))
data$otra_p_cancer_fam_7___5.factor = factor(data$otra_p_cancer_fam_7___5,levels=c("0","1"))
data$otra_p_cancer_fam_7___6.factor = factor(data$otra_p_cancer_fam_7___6,levels=c("0","1"))
data$otra_p_cancer_fam_7___7.factor = factor(data$otra_p_cancer_fam_7___7,levels=c("0","1"))
data$otra_p_cancer_fam_7___8.factor = factor(data$otra_p_cancer_fam_7___8,levels=c("0","1"))
data$otra_p_cancer_fam_7___9.factor = factor(data$otra_p_cancer_fam_7___9,levels=c("0","1"))
data$otra_p_cancer_fam_7___10.factor = factor(data$otra_p_cancer_fam_7___10,levels=c("0","1"))
data$otra_p_cancer_fam_7___11.factor = factor(data$otra_p_cancer_fam_7___11,levels=c("0","1"))
data$otra_p_cancer_fam_7___12.factor = factor(data$otra_p_cancer_fam_7___12,levels=c("0","1"))
data$otra_p_cancer_fam_8___1.factor = factor(data$otra_p_cancer_fam_8___1,levels=c("0","1"))
data$otra_p_cancer_fam_8___2.factor = factor(data$otra_p_cancer_fam_8___2,levels=c("0","1"))
data$otra_p_cancer_fam_8___3.factor = factor(data$otra_p_cancer_fam_8___3,levels=c("0","1"))
data$otra_p_cancer_fam_8___4.factor = factor(data$otra_p_cancer_fam_8___4,levels=c("0","1"))
data$otra_p_cancer_fam_8___5.factor = factor(data$otra_p_cancer_fam_8___5,levels=c("0","1"))
data$otra_p_cancer_fam_8___6.factor = factor(data$otra_p_cancer_fam_8___6,levels=c("0","1"))
data$otra_p_cancer_fam_8___7.factor = factor(data$otra_p_cancer_fam_8___7,levels=c("0","1"))
data$otra_p_cancer_fam_8___8.factor = factor(data$otra_p_cancer_fam_8___8,levels=c("0","1"))
data$otra_p_cancer_fam_8___9.factor = factor(data$otra_p_cancer_fam_8___9,levels=c("0","1"))
data$otra_p_cancer_fam_8___10.factor = factor(data$otra_p_cancer_fam_8___10,levels=c("0","1"))
data$otra_p_cancer_fam_8___11.factor = factor(data$otra_p_cancer_fam_8___11,levels=c("0","1"))
data$otra_p_cancer_fam_8___12.factor = factor(data$otra_p_cancer_fam_8___12,levels=c("0","1"))
data$otra_p_cancer_fam_9___1.factor = factor(data$otra_p_cancer_fam_9___1,levels=c("0","1"))
data$otra_p_cancer_fam_9___2.factor = factor(data$otra_p_cancer_fam_9___2,levels=c("0","1"))
data$otra_p_cancer_fam_9___3.factor = factor(data$otra_p_cancer_fam_9___3,levels=c("0","1"))
data$otra_p_cancer_fam_9___4.factor = factor(data$otra_p_cancer_fam_9___4,levels=c("0","1"))
data$otra_p_cancer_fam_9___5.factor = factor(data$otra_p_cancer_fam_9___5,levels=c("0","1"))
data$otra_p_cancer_fam_9___6.factor = factor(data$otra_p_cancer_fam_9___6,levels=c("0","1"))
data$otra_p_cancer_fam_9___7.factor = factor(data$otra_p_cancer_fam_9___7,levels=c("0","1"))
data$otra_p_cancer_fam_9___8.factor = factor(data$otra_p_cancer_fam_9___8,levels=c("0","1"))
data$otra_p_cancer_fam_9___9.factor = factor(data$otra_p_cancer_fam_9___9,levels=c("0","1"))
data$otra_p_cancer_fam_9___10.factor = factor(data$otra_p_cancer_fam_9___10,levels=c("0","1"))
data$otra_p_cancer_fam_9___11.factor = factor(data$otra_p_cancer_fam_9___11,levels=c("0","1"))
data$otra_p_cancer_fam_9___12.factor = factor(data$otra_p_cancer_fam_9___12,levels=c("0","1"))
data$otra_p_cancer_fam_10___1.factor = factor(data$otra_p_cancer_fam_10___1,levels=c("0","1"))
data$otra_p_cancer_fam_10___2.factor = factor(data$otra_p_cancer_fam_10___2,levels=c("0","1"))
data$otra_p_cancer_fam_10___3.factor = factor(data$otra_p_cancer_fam_10___3,levels=c("0","1"))
data$otra_p_cancer_fam_10___4.factor = factor(data$otra_p_cancer_fam_10___4,levels=c("0","1"))
data$otra_p_cancer_fam_10___5.factor = factor(data$otra_p_cancer_fam_10___5,levels=c("0","1"))
data$otra_p_cancer_fam_10___6.factor = factor(data$otra_p_cancer_fam_10___6,levels=c("0","1"))
data$otra_p_cancer_fam_10___7.factor = factor(data$otra_p_cancer_fam_10___7,levels=c("0","1"))
data$otra_p_cancer_fam_10___8.factor = factor(data$otra_p_cancer_fam_10___8,levels=c("0","1"))
data$otra_p_cancer_fam_10___9.factor = factor(data$otra_p_cancer_fam_10___9,levels=c("0","1"))
data$otra_p_cancer_fam_10___10.factor = factor(data$otra_p_cancer_fam_10___10,levels=c("0","1"))
data$otra_p_cancer_fam_10___11.factor = factor(data$otra_p_cancer_fam_10___11,levels=c("0","1"))
data$otra_p_cancer_fam_10___12.factor = factor(data$otra_p_cancer_fam_10___12,levels=c("0","1"))
data$otra_p_cancer_fam_11___1.factor = factor(data$otra_p_cancer_fam_11___1,levels=c("0","1"))
data$otra_p_cancer_fam_11___2.factor = factor(data$otra_p_cancer_fam_11___2,levels=c("0","1"))
data$otra_p_cancer_fam_11___3.factor = factor(data$otra_p_cancer_fam_11___3,levels=c("0","1"))
data$otra_p_cancer_fam_11___4.factor = factor(data$otra_p_cancer_fam_11___4,levels=c("0","1"))
data$otra_p_cancer_fam_11___5.factor = factor(data$otra_p_cancer_fam_11___5,levels=c("0","1"))
data$otra_p_cancer_fam_11___6.factor = factor(data$otra_p_cancer_fam_11___6,levels=c("0","1"))
data$otra_p_cancer_fam_11___7.factor = factor(data$otra_p_cancer_fam_11___7,levels=c("0","1"))
data$otra_p_cancer_fam_11___8.factor = factor(data$otra_p_cancer_fam_11___8,levels=c("0","1"))
data$otra_p_cancer_fam_11___9.factor = factor(data$otra_p_cancer_fam_11___9,levels=c("0","1"))
data$otra_p_cancer_fam_11___10.factor = factor(data$otra_p_cancer_fam_11___10,levels=c("0","1"))
data$otra_p_cancer_fam_11___11.factor = factor(data$otra_p_cancer_fam_11___11,levels=c("0","1"))
data$otra_p_cancer_fam_11___12.factor = factor(data$otra_p_cancer_fam_11___12,levels=c("0","1"))
data$otra_p_cancer_fam_12___1.factor = factor(data$otra_p_cancer_fam_12___1,levels=c("0","1"))
data$otra_p_cancer_fam_12___2.factor = factor(data$otra_p_cancer_fam_12___2,levels=c("0","1"))
data$otra_p_cancer_fam_12___3.factor = factor(data$otra_p_cancer_fam_12___3,levels=c("0","1"))
data$otra_p_cancer_fam_12___4.factor = factor(data$otra_p_cancer_fam_12___4,levels=c("0","1"))
data$otra_p_cancer_fam_12___5.factor = factor(data$otra_p_cancer_fam_12___5,levels=c("0","1"))
data$otra_p_cancer_fam_12___6.factor = factor(data$otra_p_cancer_fam_12___6,levels=c("0","1"))
data$otra_p_cancer_fam_12___7.factor = factor(data$otra_p_cancer_fam_12___7,levels=c("0","1"))
data$otra_p_cancer_fam_12___8.factor = factor(data$otra_p_cancer_fam_12___8,levels=c("0","1"))
data$otra_p_cancer_fam_12___9.factor = factor(data$otra_p_cancer_fam_12___9,levels=c("0","1"))
data$otra_p_cancer_fam_12___10.factor = factor(data$otra_p_cancer_fam_12___10,levels=c("0","1"))
data$otra_p_cancer_fam_12___11.factor = factor(data$otra_p_cancer_fam_12___11,levels=c("0","1"))
data$otra_p_cancer_fam_12___12.factor = factor(data$otra_p_cancer_fam_12___12,levels=c("0","1"))
data$otra_p_cancer_fam_13___1.factor = factor(data$otra_p_cancer_fam_13___1,levels=c("0","1"))
data$otra_p_cancer_fam_13___2.factor = factor(data$otra_p_cancer_fam_13___2,levels=c("0","1"))
data$otra_p_cancer_fam_13___3.factor = factor(data$otra_p_cancer_fam_13___3,levels=c("0","1"))
data$otra_p_cancer_fam_13___4.factor = factor(data$otra_p_cancer_fam_13___4,levels=c("0","1"))
data$otra_p_cancer_fam_13___5.factor = factor(data$otra_p_cancer_fam_13___5,levels=c("0","1"))
data$otra_p_cancer_fam_13___6.factor = factor(data$otra_p_cancer_fam_13___6,levels=c("0","1"))
data$otra_p_cancer_fam_13___7.factor = factor(data$otra_p_cancer_fam_13___7,levels=c("0","1"))
data$otra_p_cancer_fam_13___8.factor = factor(data$otra_p_cancer_fam_13___8,levels=c("0","1"))
data$otra_p_cancer_fam_13___9.factor = factor(data$otra_p_cancer_fam_13___9,levels=c("0","1"))
data$otra_p_cancer_fam_13___10.factor = factor(data$otra_p_cancer_fam_13___10,levels=c("0","1"))
data$otra_p_cancer_fam_13___11.factor = factor(data$otra_p_cancer_fam_13___11,levels=c("0","1"))
data$otra_p_cancer_fam_13___12.factor = factor(data$otra_p_cancer_fam_13___12,levels=c("0","1"))
data$otra_p_cancer_fam_14___1.factor = factor(data$otra_p_cancer_fam_14___1,levels=c("0","1"))
data$otra_p_cancer_fam_14___2.factor = factor(data$otra_p_cancer_fam_14___2,levels=c("0","1"))
data$otra_p_cancer_fam_14___3.factor = factor(data$otra_p_cancer_fam_14___3,levels=c("0","1"))
data$otra_p_cancer_fam_14___4.factor = factor(data$otra_p_cancer_fam_14___4,levels=c("0","1"))
data$otra_p_cancer_fam_14___5.factor = factor(data$otra_p_cancer_fam_14___5,levels=c("0","1"))
data$otra_p_cancer_fam_14___6.factor = factor(data$otra_p_cancer_fam_14___6,levels=c("0","1"))
data$otra_p_cancer_fam_14___7.factor = factor(data$otra_p_cancer_fam_14___7,levels=c("0","1"))
data$otra_p_cancer_fam_14___8.factor = factor(data$otra_p_cancer_fam_14___8,levels=c("0","1"))
data$otra_p_cancer_fam_14___9.factor = factor(data$otra_p_cancer_fam_14___9,levels=c("0","1"))
data$otra_p_cancer_fam_14___10.factor = factor(data$otra_p_cancer_fam_14___10,levels=c("0","1"))
data$otra_p_cancer_fam_14___11.factor = factor(data$otra_p_cancer_fam_14___11,levels=c("0","1"))
data$otra_p_cancer_fam_14___12.factor = factor(data$otra_p_cancer_fam_14___12,levels=c("0","1"))
data$otra_p_cancer_fam_15___1.factor = factor(data$otra_p_cancer_fam_15___1,levels=c("0","1"))
data$otra_p_cancer_fam_15___2.factor = factor(data$otra_p_cancer_fam_15___2,levels=c("0","1"))
data$otra_p_cancer_fam_15___3.factor = factor(data$otra_p_cancer_fam_15___3,levels=c("0","1"))
data$otra_p_cancer_fam_15___4.factor = factor(data$otra_p_cancer_fam_15___4,levels=c("0","1"))
data$otra_p_cancer_fam_15___5.factor = factor(data$otra_p_cancer_fam_15___5,levels=c("0","1"))
data$otra_p_cancer_fam_15___6.factor = factor(data$otra_p_cancer_fam_15___6,levels=c("0","1"))
data$otra_p_cancer_fam_15___7.factor = factor(data$otra_p_cancer_fam_15___7,levels=c("0","1"))
data$otra_p_cancer_fam_15___8.factor = factor(data$otra_p_cancer_fam_15___8,levels=c("0","1"))
data$otra_p_cancer_fam_15___9.factor = factor(data$otra_p_cancer_fam_15___9,levels=c("0","1"))
data$otra_p_cancer_fam_15___10.factor = factor(data$otra_p_cancer_fam_15___10,levels=c("0","1"))
data$otra_p_cancer_fam_15___11.factor = factor(data$otra_p_cancer_fam_15___11,levels=c("0","1"))
data$otra_p_cancer_fam_15___12.factor = factor(data$otra_p_cancer_fam_15___12,levels=c("0","1"))
data$otra_p_cancer_fam_16___1.factor = factor(data$otra_p_cancer_fam_16___1,levels=c("0","1"))
data$otra_p_cancer_fam_16___2.factor = factor(data$otra_p_cancer_fam_16___2,levels=c("0","1"))
data$otra_p_cancer_fam_16___3.factor = factor(data$otra_p_cancer_fam_16___3,levels=c("0","1"))
data$otra_p_cancer_fam_16___4.factor = factor(data$otra_p_cancer_fam_16___4,levels=c("0","1"))
data$otra_p_cancer_fam_16___5.factor = factor(data$otra_p_cancer_fam_16___5,levels=c("0","1"))
data$otra_p_cancer_fam_16___6.factor = factor(data$otra_p_cancer_fam_16___6,levels=c("0","1"))
data$otra_p_cancer_fam_16___7.factor = factor(data$otra_p_cancer_fam_16___7,levels=c("0","1"))
data$otra_p_cancer_fam_16___8.factor = factor(data$otra_p_cancer_fam_16___8,levels=c("0","1"))
data$otra_p_cancer_fam_16___9.factor = factor(data$otra_p_cancer_fam_16___9,levels=c("0","1"))
data$otra_p_cancer_fam_16___10.factor = factor(data$otra_p_cancer_fam_16___10,levels=c("0","1"))
data$otra_p_cancer_fam_16___11.factor = factor(data$otra_p_cancer_fam_16___11,levels=c("0","1"))
data$otra_p_cancer_fam_16___12.factor = factor(data$otra_p_cancer_fam_16___12,levels=c("0","1"))
data$otra_p_cancer_fam_18___1.factor = factor(data$otra_p_cancer_fam_18___1,levels=c("0","1"))
data$otra_p_cancer_fam_18___2.factor = factor(data$otra_p_cancer_fam_18___2,levels=c("0","1"))
data$otra_p_cancer_fam_18___3.factor = factor(data$otra_p_cancer_fam_18___3,levels=c("0","1"))
data$otra_p_cancer_fam_18___4.factor = factor(data$otra_p_cancer_fam_18___4,levels=c("0","1"))
data$otra_p_cancer_fam_18___5.factor = factor(data$otra_p_cancer_fam_18___5,levels=c("0","1"))
data$otra_p_cancer_fam_18___6.factor = factor(data$otra_p_cancer_fam_18___6,levels=c("0","1"))
data$otra_p_cancer_fam_18___7.factor = factor(data$otra_p_cancer_fam_18___7,levels=c("0","1"))
data$otra_p_cancer_fam_18___8.factor = factor(data$otra_p_cancer_fam_18___8,levels=c("0","1"))
data$otra_p_cancer_fam_18___9.factor = factor(data$otra_p_cancer_fam_18___9,levels=c("0","1"))
data$otra_p_cancer_fam_18___10.factor = factor(data$otra_p_cancer_fam_18___10,levels=c("0","1"))
data$otra_p_cancer_fam_18___11.factor = factor(data$otra_p_cancer_fam_18___11,levels=c("0","1"))
data$otra_p_cancer_fam_18___12.factor = factor(data$otra_p_cancer_fam_18___12,levels=c("0","1"))
data$otra_p_cancer_fam_20___1.factor = factor(data$otra_p_cancer_fam_20___1,levels=c("0","1"))
data$otra_p_cancer_fam_20___2.factor = factor(data$otra_p_cancer_fam_20___2,levels=c("0","1"))
data$otra_p_cancer_fam_20___3.factor = factor(data$otra_p_cancer_fam_20___3,levels=c("0","1"))
data$otra_p_cancer_fam_20___4.factor = factor(data$otra_p_cancer_fam_20___4,levels=c("0","1"))
data$otra_p_cancer_fam_20___5.factor = factor(data$otra_p_cancer_fam_20___5,levels=c("0","1"))
data$otra_p_cancer_fam_20___6.factor = factor(data$otra_p_cancer_fam_20___6,levels=c("0","1"))
data$otra_p_cancer_fam_20___7.factor = factor(data$otra_p_cancer_fam_20___7,levels=c("0","1"))
data$otra_p_cancer_fam_20___8.factor = factor(data$otra_p_cancer_fam_20___8,levels=c("0","1"))
data$otra_p_cancer_fam_20___9.factor = factor(data$otra_p_cancer_fam_20___9,levels=c("0","1"))
data$otra_p_cancer_fam_20___10.factor = factor(data$otra_p_cancer_fam_20___10,levels=c("0","1"))
data$otra_p_cancer_fam_20___11.factor = factor(data$otra_p_cancer_fam_20___11,levels=c("0","1"))
data$otra_p_cancer_fam_20___12.factor = factor(data$otra_p_cancer_fam_20___12,levels=c("0","1"))
data$otra_p_cancer_fam_23___1.factor = factor(data$otra_p_cancer_fam_23___1,levels=c("0","1"))
data$otra_p_cancer_fam_23___2.factor = factor(data$otra_p_cancer_fam_23___2,levels=c("0","1"))
data$otra_p_cancer_fam_23___3.factor = factor(data$otra_p_cancer_fam_23___3,levels=c("0","1"))
data$otra_p_cancer_fam_23___4.factor = factor(data$otra_p_cancer_fam_23___4,levels=c("0","1"))
data$otra_p_cancer_fam_23___5.factor = factor(data$otra_p_cancer_fam_23___5,levels=c("0","1"))
data$otra_p_cancer_fam_23___6.factor = factor(data$otra_p_cancer_fam_23___6,levels=c("0","1"))
data$otra_p_cancer_fam_23___7.factor = factor(data$otra_p_cancer_fam_23___7,levels=c("0","1"))
data$otra_p_cancer_fam_23___8.factor = factor(data$otra_p_cancer_fam_23___8,levels=c("0","1"))
data$otra_p_cancer_fam_23___9.factor = factor(data$otra_p_cancer_fam_23___9,levels=c("0","1"))
data$otra_p_cancer_fam_23___10.factor = factor(data$otra_p_cancer_fam_23___10,levels=c("0","1"))
data$otra_p_cancer_fam_23___11.factor = factor(data$otra_p_cancer_fam_23___11,levels=c("0","1"))
data$otra_p_cancer_fam_23___12.factor = factor(data$otra_p_cancer_fam_23___12,levels=c("0","1"))
data$otra_p_cancer_fam_24___1.factor = factor(data$otra_p_cancer_fam_24___1,levels=c("0","1"))
data$otra_p_cancer_fam_24___2.factor = factor(data$otra_p_cancer_fam_24___2,levels=c("0","1"))
data$otra_p_cancer_fam_24___3.factor = factor(data$otra_p_cancer_fam_24___3,levels=c("0","1"))
data$otra_p_cancer_fam_24___4.factor = factor(data$otra_p_cancer_fam_24___4,levels=c("0","1"))
data$otra_p_cancer_fam_24___5.factor = factor(data$otra_p_cancer_fam_24___5,levels=c("0","1"))
data$otra_p_cancer_fam_24___6.factor = factor(data$otra_p_cancer_fam_24___6,levels=c("0","1"))
data$otra_p_cancer_fam_24___7.factor = factor(data$otra_p_cancer_fam_24___7,levels=c("0","1"))
data$otra_p_cancer_fam_24___8.factor = factor(data$otra_p_cancer_fam_24___8,levels=c("0","1"))
data$otra_p_cancer_fam_24___9.factor = factor(data$otra_p_cancer_fam_24___9,levels=c("0","1"))
data$otra_p_cancer_fam_24___10.factor = factor(data$otra_p_cancer_fam_24___10,levels=c("0","1"))
data$otra_p_cancer_fam_24___11.factor = factor(data$otra_p_cancer_fam_24___11,levels=c("0","1"))
data$otra_p_cancer_fam_24___12.factor = factor(data$otra_p_cancer_fam_24___12,levels=c("0","1"))
data$otra_p_cancer_fam_25___1.factor = factor(data$otra_p_cancer_fam_25___1,levels=c("0","1"))
data$otra_p_cancer_fam_25___2.factor = factor(data$otra_p_cancer_fam_25___2,levels=c("0","1"))
data$otra_p_cancer_fam_25___3.factor = factor(data$otra_p_cancer_fam_25___3,levels=c("0","1"))
data$otra_p_cancer_fam_25___4.factor = factor(data$otra_p_cancer_fam_25___4,levels=c("0","1"))
data$otra_p_cancer_fam_25___5.factor = factor(data$otra_p_cancer_fam_25___5,levels=c("0","1"))
data$otra_p_cancer_fam_25___6.factor = factor(data$otra_p_cancer_fam_25___6,levels=c("0","1"))
data$otra_p_cancer_fam_25___7.factor = factor(data$otra_p_cancer_fam_25___7,levels=c("0","1"))
data$otra_p_cancer_fam_25___8.factor = factor(data$otra_p_cancer_fam_25___8,levels=c("0","1"))
data$otra_p_cancer_fam_25___9.factor = factor(data$otra_p_cancer_fam_25___9,levels=c("0","1"))
data$otra_p_cancer_fam_25___10.factor = factor(data$otra_p_cancer_fam_25___10,levels=c("0","1"))
data$otra_p_cancer_fam_25___11.factor = factor(data$otra_p_cancer_fam_25___11,levels=c("0","1"))
data$otra_p_cancer_fam_25___12.factor = factor(data$otra_p_cancer_fam_25___12,levels=c("0","1"))
data$otra_p_cancer_fam_26___1.factor = factor(data$otra_p_cancer_fam_26___1,levels=c("0","1"))
data$otra_p_cancer_fam_26___2.factor = factor(data$otra_p_cancer_fam_26___2,levels=c("0","1"))
data$otra_p_cancer_fam_26___3.factor = factor(data$otra_p_cancer_fam_26___3,levels=c("0","1"))
data$otra_p_cancer_fam_26___4.factor = factor(data$otra_p_cancer_fam_26___4,levels=c("0","1"))
data$otra_p_cancer_fam_26___5.factor = factor(data$otra_p_cancer_fam_26___5,levels=c("0","1"))
data$otra_p_cancer_fam_26___6.factor = factor(data$otra_p_cancer_fam_26___6,levels=c("0","1"))
data$otra_p_cancer_fam_26___7.factor = factor(data$otra_p_cancer_fam_26___7,levels=c("0","1"))
data$otra_p_cancer_fam_26___8.factor = factor(data$otra_p_cancer_fam_26___8,levels=c("0","1"))
data$otra_p_cancer_fam_26___9.factor = factor(data$otra_p_cancer_fam_26___9,levels=c("0","1"))
data$otra_p_cancer_fam_26___10.factor = factor(data$otra_p_cancer_fam_26___10,levels=c("0","1"))
data$otra_p_cancer_fam_26___11.factor = factor(data$otra_p_cancer_fam_26___11,levels=c("0","1"))
data$otra_p_cancer_fam_26___12.factor = factor(data$otra_p_cancer_fam_26___12,levels=c("0","1"))
data$otra_p_cancer_fam_27___1.factor = factor(data$otra_p_cancer_fam_27___1,levels=c("0","1"))
data$otra_p_cancer_fam_27___2.factor = factor(data$otra_p_cancer_fam_27___2,levels=c("0","1"))
data$otra_p_cancer_fam_27___3.factor = factor(data$otra_p_cancer_fam_27___3,levels=c("0","1"))
data$otra_p_cancer_fam_27___4.factor = factor(data$otra_p_cancer_fam_27___4,levels=c("0","1"))
data$otra_p_cancer_fam_27___5.factor = factor(data$otra_p_cancer_fam_27___5,levels=c("0","1"))
data$otra_p_cancer_fam_27___6.factor = factor(data$otra_p_cancer_fam_27___6,levels=c("0","1"))
data$otra_p_cancer_fam_27___7.factor = factor(data$otra_p_cancer_fam_27___7,levels=c("0","1"))
data$otra_p_cancer_fam_27___8.factor = factor(data$otra_p_cancer_fam_27___8,levels=c("0","1"))
data$otra_p_cancer_fam_27___9.factor = factor(data$otra_p_cancer_fam_27___9,levels=c("0","1"))
data$otra_p_cancer_fam_27___10.factor = factor(data$otra_p_cancer_fam_27___10,levels=c("0","1"))
data$otra_p_cancer_fam_27___11.factor = factor(data$otra_p_cancer_fam_27___11,levels=c("0","1"))
data$otra_p_cancer_fam_27___12.factor = factor(data$otra_p_cancer_fam_27___12,levels=c("0","1"))
data$otra_p_cancer_fam_22___1.factor = factor(data$otra_p_cancer_fam_22___1,levels=c("0","1"))
data$otra_p_cancer_fam_22___2.factor = factor(data$otra_p_cancer_fam_22___2,levels=c("0","1"))
data$otra_p_cancer_fam_22___3.factor = factor(data$otra_p_cancer_fam_22___3,levels=c("0","1"))
data$otra_p_cancer_fam_22___4.factor = factor(data$otra_p_cancer_fam_22___4,levels=c("0","1"))
data$otra_p_cancer_fam_22___5.factor = factor(data$otra_p_cancer_fam_22___5,levels=c("0","1"))
data$otra_p_cancer_fam_22___6.factor = factor(data$otra_p_cancer_fam_22___6,levels=c("0","1"))
data$otra_p_cancer_fam_22___7.factor = factor(data$otra_p_cancer_fam_22___7,levels=c("0","1"))
data$otra_p_cancer_fam_22___8.factor = factor(data$otra_p_cancer_fam_22___8,levels=c("0","1"))
data$otra_p_cancer_fam_22___9.factor = factor(data$otra_p_cancer_fam_22___9,levels=c("0","1"))
data$otra_p_cancer_fam_22___10.factor = factor(data$otra_p_cancer_fam_22___10,levels=c("0","1"))
data$otra_p_cancer_fam_22___11.factor = factor(data$otra_p_cancer_fam_22___11,levels=c("0","1"))
data$otra_p_cancer_fam_22___12.factor = factor(data$otra_p_cancer_fam_22___12,levels=c("0","1"))
data$otra_p_cancer_fam_21___1.factor = factor(data$otra_p_cancer_fam_21___1,levels=c("0","1"))
data$otra_p_cancer_fam_21___2.factor = factor(data$otra_p_cancer_fam_21___2,levels=c("0","1"))
data$otra_p_cancer_fam_21___3.factor = factor(data$otra_p_cancer_fam_21___3,levels=c("0","1"))
data$otra_p_cancer_fam_21___4.factor = factor(data$otra_p_cancer_fam_21___4,levels=c("0","1"))
data$otra_p_cancer_fam_21___5.factor = factor(data$otra_p_cancer_fam_21___5,levels=c("0","1"))
data$otra_p_cancer_fam_21___6.factor = factor(data$otra_p_cancer_fam_21___6,levels=c("0","1"))
data$otra_p_cancer_fam_21___7.factor = factor(data$otra_p_cancer_fam_21___7,levels=c("0","1"))
data$otra_p_cancer_fam_21___8.factor = factor(data$otra_p_cancer_fam_21___8,levels=c("0","1"))
data$otra_p_cancer_fam_21___9.factor = factor(data$otra_p_cancer_fam_21___9,levels=c("0","1"))
data$otra_p_cancer_fam_21___10.factor = factor(data$otra_p_cancer_fam_21___10,levels=c("0","1"))
data$otra_p_cancer_fam_21___11.factor = factor(data$otra_p_cancer_fam_21___11,levels=c("0","1"))
data$otra_p_cancer_fam_21___12.factor = factor(data$otra_p_cancer_fam_21___12,levels=c("0","1"))
data$otra_p_cancer_fam_19___1.factor = factor(data$otra_p_cancer_fam_19___1,levels=c("0","1"))
data$otra_p_cancer_fam_19___2.factor = factor(data$otra_p_cancer_fam_19___2,levels=c("0","1"))
data$otra_p_cancer_fam_19___3.factor = factor(data$otra_p_cancer_fam_19___3,levels=c("0","1"))
data$otra_p_cancer_fam_19___4.factor = factor(data$otra_p_cancer_fam_19___4,levels=c("0","1"))
data$otra_p_cancer_fam_19___5.factor = factor(data$otra_p_cancer_fam_19___5,levels=c("0","1"))
data$otra_p_cancer_fam_19___6.factor = factor(data$otra_p_cancer_fam_19___6,levels=c("0","1"))
data$otra_p_cancer_fam_19___7.factor = factor(data$otra_p_cancer_fam_19___7,levels=c("0","1"))
data$otra_p_cancer_fam_19___8.factor = factor(data$otra_p_cancer_fam_19___8,levels=c("0","1"))
data$otra_p_cancer_fam_19___9.factor = factor(data$otra_p_cancer_fam_19___9,levels=c("0","1"))
data$otra_p_cancer_fam_19___10.factor = factor(data$otra_p_cancer_fam_19___10,levels=c("0","1"))
data$otra_p_cancer_fam_19___11.factor = factor(data$otra_p_cancer_fam_19___11,levels=c("0","1"))
data$otra_p_cancer_fam_19___12.factor = factor(data$otra_p_cancer_fam_19___12,levels=c("0","1"))
data$otra_p_cancer_fam_17___1.factor = factor(data$otra_p_cancer_fam_17___1,levels=c("0","1"))
data$otra_p_cancer_fam_17___2.factor = factor(data$otra_p_cancer_fam_17___2,levels=c("0","1"))
data$otra_p_cancer_fam_17___3.factor = factor(data$otra_p_cancer_fam_17___3,levels=c("0","1"))
data$otra_p_cancer_fam_17___4.factor = factor(data$otra_p_cancer_fam_17___4,levels=c("0","1"))
data$otra_p_cancer_fam_17___5.factor = factor(data$otra_p_cancer_fam_17___5,levels=c("0","1"))
data$otra_p_cancer_fam_17___6.factor = factor(data$otra_p_cancer_fam_17___6,levels=c("0","1"))
data$otra_p_cancer_fam_17___7.factor = factor(data$otra_p_cancer_fam_17___7,levels=c("0","1"))
data$otra_p_cancer_fam_17___8.factor = factor(data$otra_p_cancer_fam_17___8,levels=c("0","1"))
data$otra_p_cancer_fam_17___9.factor = factor(data$otra_p_cancer_fam_17___9,levels=c("0","1"))
data$otra_p_cancer_fam_17___10.factor = factor(data$otra_p_cancer_fam_17___10,levels=c("0","1"))
data$otra_p_cancer_fam_17___11.factor = factor(data$otra_p_cancer_fam_17___11,levels=c("0","1"))
data$otra_p_cancer_fam_17___12.factor = factor(data$otra_p_cancer_fam_17___12,levels=c("0","1"))
data$ptco_dis_fam___1.factor = factor(data$ptco_dis_fam___1,levels=c("0","1"))
data$ptco_dis_fam___2.factor = factor(data$ptco_dis_fam___2,levels=c("0","1"))
data$ptco_dis_fam___3.factor = factor(data$ptco_dis_fam___3,levels=c("0","1"))
data$ptco_dis_fam___16.factor = factor(data$ptco_dis_fam___16,levels=c("0","1"))
data$ptco_dis_fam___17.factor = factor(data$ptco_dis_fam___17,levels=c("0","1"))
data$ptco_dis_fam___4.factor = factor(data$ptco_dis_fam___4,levels=c("0","1"))
data$ptco_dis_fam___18.factor = factor(data$ptco_dis_fam___18,levels=c("0","1"))
data$ptco_dis_fam___19.factor = factor(data$ptco_dis_fam___19,levels=c("0","1"))
data$ptco_dis_fam___5.factor = factor(data$ptco_dis_fam___5,levels=c("0","1"))
data$ptco_dis_fam___6.factor = factor(data$ptco_dis_fam___6,levels=c("0","1"))
data$ptco_dis_fam___7.factor = factor(data$ptco_dis_fam___7,levels=c("0","1"))
data$ptco_dis_fam___8.factor = factor(data$ptco_dis_fam___8,levels=c("0","1"))
data$ptco_dis_fam___9.factor = factor(data$ptco_dis_fam___9,levels=c("0","1"))
data$ptco_dis_fam___20.factor = factor(data$ptco_dis_fam___20,levels=c("0","1"))
data$ptco_dis_fam___21.factor = factor(data$ptco_dis_fam___21,levels=c("0","1"))
data$ptco_dis_fam___10.factor = factor(data$ptco_dis_fam___10,levels=c("0","1"))
data$ptco_dis_fam___22.factor = factor(data$ptco_dis_fam___22,levels=c("0","1"))
data$ptco_dis_fam___23.factor = factor(data$ptco_dis_fam___23,levels=c("0","1"))
data$ptco_dis_fam___11.factor = factor(data$ptco_dis_fam___11,levels=c("0","1"))
data$ptco_dis_fam___24.factor = factor(data$ptco_dis_fam___24,levels=c("0","1"))
data$ptco_dis_fam___25.factor = factor(data$ptco_dis_fam___25,levels=c("0","1"))
data$ptco_dis_fam___12.factor = factor(data$ptco_dis_fam___12,levels=c("0","1"))
data$ptco_dis_fam___26.factor = factor(data$ptco_dis_fam___26,levels=c("0","1"))
data$ptco_dis_fam___27.factor = factor(data$ptco_dis_fam___27,levels=c("0","1"))
data$ptco_dis_fam___13.factor = factor(data$ptco_dis_fam___13,levels=c("0","1"))
data$ptco_dis_fam___14.factor = factor(data$ptco_dis_fam___14,levels=c("0","1"))
data$ptco_dis_fam___15.factor = factor(data$ptco_dis_fam___15,levels=c("0","1"))
data$ptco_hta_fam___1.factor = factor(data$ptco_hta_fam___1,levels=c("0","1"))
data$ptco_hta_fam___2.factor = factor(data$ptco_hta_fam___2,levels=c("0","1"))
data$ptco_hta_fam___3.factor = factor(data$ptco_hta_fam___3,levels=c("0","1"))
data$ptco_hta_fam___16.factor = factor(data$ptco_hta_fam___16,levels=c("0","1"))
data$ptco_hta_fam___17.factor = factor(data$ptco_hta_fam___17,levels=c("0","1"))
data$ptco_hta_fam___4.factor = factor(data$ptco_hta_fam___4,levels=c("0","1"))
data$ptco_hta_fam___18.factor = factor(data$ptco_hta_fam___18,levels=c("0","1"))
data$ptco_hta_fam___19.factor = factor(data$ptco_hta_fam___19,levels=c("0","1"))
data$ptco_hta_fam___5.factor = factor(data$ptco_hta_fam___5,levels=c("0","1"))
data$ptco_hta_fam___6.factor = factor(data$ptco_hta_fam___6,levels=c("0","1"))
data$ptco_hta_fam___7.factor = factor(data$ptco_hta_fam___7,levels=c("0","1"))
data$ptco_hta_fam___8.factor = factor(data$ptco_hta_fam___8,levels=c("0","1"))
data$ptco_hta_fam___9.factor = factor(data$ptco_hta_fam___9,levels=c("0","1"))
data$ptco_hta_fam___20.factor = factor(data$ptco_hta_fam___20,levels=c("0","1"))
data$ptco_hta_fam___21.factor = factor(data$ptco_hta_fam___21,levels=c("0","1"))
data$ptco_hta_fam___10.factor = factor(data$ptco_hta_fam___10,levels=c("0","1"))
data$ptco_hta_fam___22.factor = factor(data$ptco_hta_fam___22,levels=c("0","1"))
data$ptco_hta_fam___23.factor = factor(data$ptco_hta_fam___23,levels=c("0","1"))
data$ptco_hta_fam___11.factor = factor(data$ptco_hta_fam___11,levels=c("0","1"))
data$ptco_hta_fam___24.factor = factor(data$ptco_hta_fam___24,levels=c("0","1"))
data$ptco_hta_fam___25.factor = factor(data$ptco_hta_fam___25,levels=c("0","1"))
data$ptco_hta_fam___12.factor = factor(data$ptco_hta_fam___12,levels=c("0","1"))
data$ptco_hta_fam___26.factor = factor(data$ptco_hta_fam___26,levels=c("0","1"))
data$ptco_hta_fam___27.factor = factor(data$ptco_hta_fam___27,levels=c("0","1"))
data$ptco_hta_fam___13.factor = factor(data$ptco_hta_fam___13,levels=c("0","1"))
data$ptco_hta_fam___14.factor = factor(data$ptco_hta_fam___14,levels=c("0","1"))
data$ptco_hta_fam___15.factor = factor(data$ptco_hta_fam___15,levels=c("0","1"))
data$ptco_ecv_fam___1.factor = factor(data$ptco_ecv_fam___1,levels=c("0","1"))
data$ptco_ecv_fam___2.factor = factor(data$ptco_ecv_fam___2,levels=c("0","1"))
data$ptco_ecv_fam___3.factor = factor(data$ptco_ecv_fam___3,levels=c("0","1"))
data$ptco_ecv_fam___16.factor = factor(data$ptco_ecv_fam___16,levels=c("0","1"))
data$ptco_ecv_fam___17.factor = factor(data$ptco_ecv_fam___17,levels=c("0","1"))
data$ptco_ecv_fam___4.factor = factor(data$ptco_ecv_fam___4,levels=c("0","1"))
data$ptco_ecv_fam___18.factor = factor(data$ptco_ecv_fam___18,levels=c("0","1"))
data$ptco_ecv_fam___19.factor = factor(data$ptco_ecv_fam___19,levels=c("0","1"))
data$ptco_ecv_fam___5.factor = factor(data$ptco_ecv_fam___5,levels=c("0","1"))
data$ptco_ecv_fam___6.factor = factor(data$ptco_ecv_fam___6,levels=c("0","1"))
data$ptco_ecv_fam___7.factor = factor(data$ptco_ecv_fam___7,levels=c("0","1"))
data$ptco_ecv_fam___8.factor = factor(data$ptco_ecv_fam___8,levels=c("0","1"))
data$ptco_ecv_fam___9.factor = factor(data$ptco_ecv_fam___9,levels=c("0","1"))
data$ptco_ecv_fam___20.factor = factor(data$ptco_ecv_fam___20,levels=c("0","1"))
data$ptco_ecv_fam___21.factor = factor(data$ptco_ecv_fam___21,levels=c("0","1"))
data$ptco_ecv_fam___10.factor = factor(data$ptco_ecv_fam___10,levels=c("0","1"))
data$ptco_ecv_fam___22.factor = factor(data$ptco_ecv_fam___22,levels=c("0","1"))
data$ptco_ecv_fam___23.factor = factor(data$ptco_ecv_fam___23,levels=c("0","1"))
data$ptco_ecv_fam___11.factor = factor(data$ptco_ecv_fam___11,levels=c("0","1"))
data$ptco_ecv_fam___24.factor = factor(data$ptco_ecv_fam___24,levels=c("0","1"))
data$ptco_ecv_fam___25.factor = factor(data$ptco_ecv_fam___25,levels=c("0","1"))
data$ptco_ecv_fam___12.factor = factor(data$ptco_ecv_fam___12,levels=c("0","1"))
data$ptco_ecv_fam___26.factor = factor(data$ptco_ecv_fam___26,levels=c("0","1"))
data$ptco_ecv_fam___27.factor = factor(data$ptco_ecv_fam___27,levels=c("0","1"))
data$ptco_ecv_fam___13.factor = factor(data$ptco_ecv_fam___13,levels=c("0","1"))
data$ptco_ecv_fam___14.factor = factor(data$ptco_ecv_fam___14,levels=c("0","1"))
data$ptco_ecv_fam___15.factor = factor(data$ptco_ecv_fam___15,levels=c("0","1"))
data$ptco_dm2_fam___1.factor = factor(data$ptco_dm2_fam___1,levels=c("0","1"))
data$ptco_dm2_fam___2.factor = factor(data$ptco_dm2_fam___2,levels=c("0","1"))
data$ptco_dm2_fam___3.factor = factor(data$ptco_dm2_fam___3,levels=c("0","1"))
data$ptco_dm2_fam___16.factor = factor(data$ptco_dm2_fam___16,levels=c("0","1"))
data$ptco_dm2_fam___17.factor = factor(data$ptco_dm2_fam___17,levels=c("0","1"))
data$ptco_dm2_fam___4.factor = factor(data$ptco_dm2_fam___4,levels=c("0","1"))
data$ptco_dm2_fam___18.factor = factor(data$ptco_dm2_fam___18,levels=c("0","1"))
data$ptco_dm2_fam___19.factor = factor(data$ptco_dm2_fam___19,levels=c("0","1"))
data$ptco_dm2_fam___5.factor = factor(data$ptco_dm2_fam___5,levels=c("0","1"))
data$ptco_dm2_fam___6.factor = factor(data$ptco_dm2_fam___6,levels=c("0","1"))
data$ptco_dm2_fam___7.factor = factor(data$ptco_dm2_fam___7,levels=c("0","1"))
data$ptco_dm2_fam___8.factor = factor(data$ptco_dm2_fam___8,levels=c("0","1"))
data$ptco_dm2_fam___9.factor = factor(data$ptco_dm2_fam___9,levels=c("0","1"))
data$ptco_dm2_fam___20.factor = factor(data$ptco_dm2_fam___20,levels=c("0","1"))
data$ptco_dm2_fam___21.factor = factor(data$ptco_dm2_fam___21,levels=c("0","1"))
data$ptco_dm2_fam___10.factor = factor(data$ptco_dm2_fam___10,levels=c("0","1"))
data$ptco_dm2_fam___22.factor = factor(data$ptco_dm2_fam___22,levels=c("0","1"))
data$ptco_dm2_fam___23.factor = factor(data$ptco_dm2_fam___23,levels=c("0","1"))
data$ptco_dm2_fam___11.factor = factor(data$ptco_dm2_fam___11,levels=c("0","1"))
data$ptco_dm2_fam___24.factor = factor(data$ptco_dm2_fam___24,levels=c("0","1"))
data$ptco_dm2_fam___25.factor = factor(data$ptco_dm2_fam___25,levels=c("0","1"))
data$ptco_dm2_fam___12.factor = factor(data$ptco_dm2_fam___12,levels=c("0","1"))
data$ptco_dm2_fam___26.factor = factor(data$ptco_dm2_fam___26,levels=c("0","1"))
data$ptco_dm2_fam___27.factor = factor(data$ptco_dm2_fam___27,levels=c("0","1"))
data$ptco_dm2_fam___13.factor = factor(data$ptco_dm2_fam___13,levels=c("0","1"))
data$ptco_dm2_fam___14.factor = factor(data$ptco_dm2_fam___14,levels=c("0","1"))
data$ptco_dm2_fam___15.factor = factor(data$ptco_dm2_fam___15,levels=c("0","1"))
data$ptco_cancer_fam___1.factor = factor(data$ptco_cancer_fam___1,levels=c("0","1"))
data$ptco_cancer_fam___2.factor = factor(data$ptco_cancer_fam___2,levels=c("0","1"))
data$ptco_cancer_fam___3.factor = factor(data$ptco_cancer_fam___3,levels=c("0","1"))
data$ptco_cancer_fam___16.factor = factor(data$ptco_cancer_fam___16,levels=c("0","1"))
data$ptco_cancer_fam___17.factor = factor(data$ptco_cancer_fam___17,levels=c("0","1"))
data$ptco_cancer_fam___4.factor = factor(data$ptco_cancer_fam___4,levels=c("0","1"))
data$ptco_cancer_fam___18.factor = factor(data$ptco_cancer_fam___18,levels=c("0","1"))
data$ptco_cancer_fam___19.factor = factor(data$ptco_cancer_fam___19,levels=c("0","1"))
data$ptco_cancer_fam___5.factor = factor(data$ptco_cancer_fam___5,levels=c("0","1"))
data$ptco_cancer_fam___6.factor = factor(data$ptco_cancer_fam___6,levels=c("0","1"))
data$ptco_cancer_fam___7.factor = factor(data$ptco_cancer_fam___7,levels=c("0","1"))
data$ptco_cancer_fam___8.factor = factor(data$ptco_cancer_fam___8,levels=c("0","1"))
data$ptco_cancer_fam___9.factor = factor(data$ptco_cancer_fam___9,levels=c("0","1"))
data$ptco_cancer_fam___20.factor = factor(data$ptco_cancer_fam___20,levels=c("0","1"))
data$ptco_cancer_fam___21.factor = factor(data$ptco_cancer_fam___21,levels=c("0","1"))
data$ptco_cancer_fam___10.factor = factor(data$ptco_cancer_fam___10,levels=c("0","1"))
data$ptco_cancer_fam___22.factor = factor(data$ptco_cancer_fam___22,levels=c("0","1"))
data$ptco_cancer_fam___23.factor = factor(data$ptco_cancer_fam___23,levels=c("0","1"))
data$ptco_cancer_fam___11.factor = factor(data$ptco_cancer_fam___11,levels=c("0","1"))
data$ptco_cancer_fam___24.factor = factor(data$ptco_cancer_fam___24,levels=c("0","1"))
data$ptco_cancer_fam___25.factor = factor(data$ptco_cancer_fam___25,levels=c("0","1"))
data$ptco_cancer_fam___12.factor = factor(data$ptco_cancer_fam___12,levels=c("0","1"))
data$ptco_cancer_fam___26.factor = factor(data$ptco_cancer_fam___26,levels=c("0","1"))
data$ptco_cancer_fam___27.factor = factor(data$ptco_cancer_fam___27,levels=c("0","1"))
data$ptco_cancer_fam___13.factor = factor(data$ptco_cancer_fam___13,levels=c("0","1"))
data$ptco_cancer_fam___14.factor = factor(data$ptco_cancer_fam___14,levels=c("0","1"))
data$ptco_cancer_fam___15.factor = factor(data$ptco_cancer_fam___15,levels=c("0","1"))
data$ptco_alzh_fam___1.factor = factor(data$ptco_alzh_fam___1,levels=c("0","1"))
data$ptco_alzh_fam___2.factor = factor(data$ptco_alzh_fam___2,levels=c("0","1"))
data$ptco_alzh_fam___3.factor = factor(data$ptco_alzh_fam___3,levels=c("0","1"))
data$ptco_alzh_fam___16.factor = factor(data$ptco_alzh_fam___16,levels=c("0","1"))
data$ptco_alzh_fam___17.factor = factor(data$ptco_alzh_fam___17,levels=c("0","1"))
data$ptco_alzh_fam___4.factor = factor(data$ptco_alzh_fam___4,levels=c("0","1"))
data$ptco_alzh_fam___18.factor = factor(data$ptco_alzh_fam___18,levels=c("0","1"))
data$ptco_alzh_fam___19.factor = factor(data$ptco_alzh_fam___19,levels=c("0","1"))
data$ptco_alzh_fam___5.factor = factor(data$ptco_alzh_fam___5,levels=c("0","1"))
data$ptco_alzh_fam___6.factor = factor(data$ptco_alzh_fam___6,levels=c("0","1"))
data$ptco_alzh_fam___7.factor = factor(data$ptco_alzh_fam___7,levels=c("0","1"))
data$ptco_alzh_fam___8.factor = factor(data$ptco_alzh_fam___8,levels=c("0","1"))
data$ptco_alzh_fam___9.factor = factor(data$ptco_alzh_fam___9,levels=c("0","1"))
data$ptco_alzh_fam___20.factor = factor(data$ptco_alzh_fam___20,levels=c("0","1"))
data$ptco_alzh_fam___21.factor = factor(data$ptco_alzh_fam___21,levels=c("0","1"))
data$ptco_alzh_fam___10.factor = factor(data$ptco_alzh_fam___10,levels=c("0","1"))
data$ptco_alzh_fam___22.factor = factor(data$ptco_alzh_fam___22,levels=c("0","1"))
data$ptco_alzh_fam___23.factor = factor(data$ptco_alzh_fam___23,levels=c("0","1"))
data$ptco_alzh_fam___11.factor = factor(data$ptco_alzh_fam___11,levels=c("0","1"))
data$ptco_alzh_fam___24.factor = factor(data$ptco_alzh_fam___24,levels=c("0","1"))
data$ptco_alzh_fam___25.factor = factor(data$ptco_alzh_fam___25,levels=c("0","1"))
data$ptco_alzh_fam___12.factor = factor(data$ptco_alzh_fam___12,levels=c("0","1"))
data$ptco_alzh_fam___26.factor = factor(data$ptco_alzh_fam___26,levels=c("0","1"))
data$ptco_alzh_fam___27.factor = factor(data$ptco_alzh_fam___27,levels=c("0","1"))
data$ptco_alzh_fam___13.factor = factor(data$ptco_alzh_fam___13,levels=c("0","1"))
data$ptco_alzh_fam___14.factor = factor(data$ptco_alzh_fam___14,levels=c("0","1"))
data$ptco_alzh_fam___15.factor = factor(data$ptco_alzh_fam___15,levels=c("0","1"))
data$ptco_park_fam___1.factor = factor(data$ptco_park_fam___1,levels=c("0","1"))
data$ptco_park_fam___2.factor = factor(data$ptco_park_fam___2,levels=c("0","1"))
data$ptco_park_fam___3.factor = factor(data$ptco_park_fam___3,levels=c("0","1"))
data$ptco_park_fam___16.factor = factor(data$ptco_park_fam___16,levels=c("0","1"))
data$ptco_park_fam___17.factor = factor(data$ptco_park_fam___17,levels=c("0","1"))
data$ptco_park_fam___4.factor = factor(data$ptco_park_fam___4,levels=c("0","1"))
data$ptco_park_fam___18.factor = factor(data$ptco_park_fam___18,levels=c("0","1"))
data$ptco_park_fam___19.factor = factor(data$ptco_park_fam___19,levels=c("0","1"))
data$ptco_park_fam___5.factor = factor(data$ptco_park_fam___5,levels=c("0","1"))
data$ptco_park_fam___6.factor = factor(data$ptco_park_fam___6,levels=c("0","1"))
data$ptco_park_fam___7.factor = factor(data$ptco_park_fam___7,levels=c("0","1"))
data$ptco_park_fam___8.factor = factor(data$ptco_park_fam___8,levels=c("0","1"))
data$ptco_park_fam___9.factor = factor(data$ptco_park_fam___9,levels=c("0","1"))
data$ptco_park_fam___20.factor = factor(data$ptco_park_fam___20,levels=c("0","1"))
data$ptco_park_fam___21.factor = factor(data$ptco_park_fam___21,levels=c("0","1"))
data$ptco_park_fam___10.factor = factor(data$ptco_park_fam___10,levels=c("0","1"))
data$ptco_park_fam___22.factor = factor(data$ptco_park_fam___22,levels=c("0","1"))
data$ptco_park_fam___23.factor = factor(data$ptco_park_fam___23,levels=c("0","1"))
data$ptco_park_fam___11.factor = factor(data$ptco_park_fam___11,levels=c("0","1"))
data$ptco_park_fam___24.factor = factor(data$ptco_park_fam___24,levels=c("0","1"))
data$ptco_park_fam___25.factor = factor(data$ptco_park_fam___25,levels=c("0","1"))
data$ptco_park_fam___12.factor = factor(data$ptco_park_fam___12,levels=c("0","1"))
data$ptco_park_fam___26.factor = factor(data$ptco_park_fam___26,levels=c("0","1"))
data$ptco_park_fam___27.factor = factor(data$ptco_park_fam___27,levels=c("0","1"))
data$ptco_park_fam___13.factor = factor(data$ptco_park_fam___13,levels=c("0","1"))
data$ptco_park_fam___14.factor = factor(data$ptco_park_fam___14,levels=c("0","1"))
data$ptco_park_fam___15.factor = factor(data$ptco_park_fam___15,levels=c("0","1"))
data$ptco_asma_fam___1.factor = factor(data$ptco_asma_fam___1,levels=c("0","1"))
data$ptco_asma_fam___2.factor = factor(data$ptco_asma_fam___2,levels=c("0","1"))
data$ptco_asma_fam___3.factor = factor(data$ptco_asma_fam___3,levels=c("0","1"))
data$ptco_asma_fam___16.factor = factor(data$ptco_asma_fam___16,levels=c("0","1"))
data$ptco_asma_fam___17.factor = factor(data$ptco_asma_fam___17,levels=c("0","1"))
data$ptco_asma_fam___4.factor = factor(data$ptco_asma_fam___4,levels=c("0","1"))
data$ptco_asma_fam___18.factor = factor(data$ptco_asma_fam___18,levels=c("0","1"))
data$ptco_asma_fam___19.factor = factor(data$ptco_asma_fam___19,levels=c("0","1"))
data$ptco_asma_fam___5.factor = factor(data$ptco_asma_fam___5,levels=c("0","1"))
data$ptco_asma_fam___6.factor = factor(data$ptco_asma_fam___6,levels=c("0","1"))
data$ptco_asma_fam___7.factor = factor(data$ptco_asma_fam___7,levels=c("0","1"))
data$ptco_asma_fam___8.factor = factor(data$ptco_asma_fam___8,levels=c("0","1"))
data$ptco_asma_fam___9.factor = factor(data$ptco_asma_fam___9,levels=c("0","1"))
data$ptco_asma_fam___20.factor = factor(data$ptco_asma_fam___20,levels=c("0","1"))
data$ptco_asma_fam___21.factor = factor(data$ptco_asma_fam___21,levels=c("0","1"))
data$ptco_asma_fam___10.factor = factor(data$ptco_asma_fam___10,levels=c("0","1"))
data$ptco_asma_fam___22.factor = factor(data$ptco_asma_fam___22,levels=c("0","1"))
data$ptco_asma_fam___23.factor = factor(data$ptco_asma_fam___23,levels=c("0","1"))
data$ptco_asma_fam___11.factor = factor(data$ptco_asma_fam___11,levels=c("0","1"))
data$ptco_asma_fam___24.factor = factor(data$ptco_asma_fam___24,levels=c("0","1"))
data$ptco_asma_fam___25.factor = factor(data$ptco_asma_fam___25,levels=c("0","1"))
data$ptco_asma_fam___12.factor = factor(data$ptco_asma_fam___12,levels=c("0","1"))
data$ptco_asma_fam___26.factor = factor(data$ptco_asma_fam___26,levels=c("0","1"))
data$ptco_asma_fam___27.factor = factor(data$ptco_asma_fam___27,levels=c("0","1"))
data$ptco_asma_fam___13.factor = factor(data$ptco_asma_fam___13,levels=c("0","1"))
data$ptco_asma_fam___14.factor = factor(data$ptco_asma_fam___14,levels=c("0","1"))
data$ptco_asma_fam___15.factor = factor(data$ptco_asma_fam___15,levels=c("0","1"))
data$ptco_bronquitis_fam___1.factor = factor(data$ptco_bronquitis_fam___1,levels=c("0","1"))
data$ptco_bronquitis_fam___2.factor = factor(data$ptco_bronquitis_fam___2,levels=c("0","1"))
data$ptco_bronquitis_fam___3.factor = factor(data$ptco_bronquitis_fam___3,levels=c("0","1"))
data$ptco_bronquitis_fam___16.factor = factor(data$ptco_bronquitis_fam___16,levels=c("0","1"))
data$ptco_bronquitis_fam___17.factor = factor(data$ptco_bronquitis_fam___17,levels=c("0","1"))
data$ptco_bronquitis_fam___4.factor = factor(data$ptco_bronquitis_fam___4,levels=c("0","1"))
data$ptco_bronquitis_fam___18.factor = factor(data$ptco_bronquitis_fam___18,levels=c("0","1"))
data$ptco_bronquitis_fam___19.factor = factor(data$ptco_bronquitis_fam___19,levels=c("0","1"))
data$ptco_bronquitis_fam___5.factor = factor(data$ptco_bronquitis_fam___5,levels=c("0","1"))
data$ptco_bronquitis_fam___6.factor = factor(data$ptco_bronquitis_fam___6,levels=c("0","1"))
data$ptco_bronquitis_fam___7.factor = factor(data$ptco_bronquitis_fam___7,levels=c("0","1"))
data$ptco_bronquitis_fam___8.factor = factor(data$ptco_bronquitis_fam___8,levels=c("0","1"))
data$ptco_bronquitis_fam___9.factor = factor(data$ptco_bronquitis_fam___9,levels=c("0","1"))
data$ptco_bronquitis_fam___20.factor = factor(data$ptco_bronquitis_fam___20,levels=c("0","1"))
data$ptco_bronquitis_fam___21.factor = factor(data$ptco_bronquitis_fam___21,levels=c("0","1"))
data$ptco_bronquitis_fam___10.factor = factor(data$ptco_bronquitis_fam___10,levels=c("0","1"))
data$ptco_bronquitis_fam___22.factor = factor(data$ptco_bronquitis_fam___22,levels=c("0","1"))
data$ptco_bronquitis_fam___23.factor = factor(data$ptco_bronquitis_fam___23,levels=c("0","1"))
data$ptco_bronquitis_fam___11.factor = factor(data$ptco_bronquitis_fam___11,levels=c("0","1"))
data$ptco_bronquitis_fam___24.factor = factor(data$ptco_bronquitis_fam___24,levels=c("0","1"))
data$ptco_bronquitis_fam___25.factor = factor(data$ptco_bronquitis_fam___25,levels=c("0","1"))
data$ptco_bronquitis_fam___12.factor = factor(data$ptco_bronquitis_fam___12,levels=c("0","1"))
data$ptco_bronquitis_fam___26.factor = factor(data$ptco_bronquitis_fam___26,levels=c("0","1"))
data$ptco_bronquitis_fam___27.factor = factor(data$ptco_bronquitis_fam___27,levels=c("0","1"))
data$ptco_bronquitis_fam___13.factor = factor(data$ptco_bronquitis_fam___13,levels=c("0","1"))
data$ptco_bronquitis_fam___14.factor = factor(data$ptco_bronquitis_fam___14,levels=c("0","1"))
data$ptco_bronquitis_fam___15.factor = factor(data$ptco_bronquitis_fam___15,levels=c("0","1"))
data$ptco_acv_fam___1.factor = factor(data$ptco_acv_fam___1,levels=c("0","1"))
data$ptco_acv_fam___2.factor = factor(data$ptco_acv_fam___2,levels=c("0","1"))
data$ptco_acv_fam___3.factor = factor(data$ptco_acv_fam___3,levels=c("0","1"))
data$ptco_acv_fam___16.factor = factor(data$ptco_acv_fam___16,levels=c("0","1"))
data$ptco_acv_fam___17.factor = factor(data$ptco_acv_fam___17,levels=c("0","1"))
data$ptco_acv_fam___4.factor = factor(data$ptco_acv_fam___4,levels=c("0","1"))
data$ptco_acv_fam___18.factor = factor(data$ptco_acv_fam___18,levels=c("0","1"))
data$ptco_acv_fam___19.factor = factor(data$ptco_acv_fam___19,levels=c("0","1"))
data$ptco_acv_fam___5.factor = factor(data$ptco_acv_fam___5,levels=c("0","1"))
data$ptco_acv_fam___6.factor = factor(data$ptco_acv_fam___6,levels=c("0","1"))
data$ptco_acv_fam___7.factor = factor(data$ptco_acv_fam___7,levels=c("0","1"))
data$ptco_acv_fam___8.factor = factor(data$ptco_acv_fam___8,levels=c("0","1"))
data$ptco_acv_fam___9.factor = factor(data$ptco_acv_fam___9,levels=c("0","1"))
data$ptco_acv_fam___20.factor = factor(data$ptco_acv_fam___20,levels=c("0","1"))
data$ptco_acv_fam___21.factor = factor(data$ptco_acv_fam___21,levels=c("0","1"))
data$ptco_acv_fam___10.factor = factor(data$ptco_acv_fam___10,levels=c("0","1"))
data$ptco_acv_fam___22.factor = factor(data$ptco_acv_fam___22,levels=c("0","1"))
data$ptco_acv_fam___23.factor = factor(data$ptco_acv_fam___23,levels=c("0","1"))
data$ptco_acv_fam___11.factor = factor(data$ptco_acv_fam___11,levels=c("0","1"))
data$ptco_acv_fam___24.factor = factor(data$ptco_acv_fam___24,levels=c("0","1"))
data$ptco_acv_fam___25.factor = factor(data$ptco_acv_fam___25,levels=c("0","1"))
data$ptco_acv_fam___12.factor = factor(data$ptco_acv_fam___12,levels=c("0","1"))
data$ptco_acv_fam___26.factor = factor(data$ptco_acv_fam___26,levels=c("0","1"))
data$ptco_acv_fam___27.factor = factor(data$ptco_acv_fam___27,levels=c("0","1"))
data$ptco_acv_fam___13.factor = factor(data$ptco_acv_fam___13,levels=c("0","1"))
data$ptco_acv_fam___14.factor = factor(data$ptco_acv_fam___14,levels=c("0","1"))
data$ptco_acv_fam___15.factor = factor(data$ptco_acv_fam___15,levels=c("0","1"))
data$ptco_otro_fam___1.factor = factor(data$ptco_otro_fam___1,levels=c("0","1"))
data$ptco_otro_fam___2.factor = factor(data$ptco_otro_fam___2,levels=c("0","1"))
data$ptco_otro_fam___3.factor = factor(data$ptco_otro_fam___3,levels=c("0","1"))
data$ptco_otro_fam___16.factor = factor(data$ptco_otro_fam___16,levels=c("0","1"))
data$ptco_otro_fam___17.factor = factor(data$ptco_otro_fam___17,levels=c("0","1"))
data$ptco_otro_fam___4.factor = factor(data$ptco_otro_fam___4,levels=c("0","1"))
data$ptco_otro_fam___18.factor = factor(data$ptco_otro_fam___18,levels=c("0","1"))
data$ptco_otro_fam___19.factor = factor(data$ptco_otro_fam___19,levels=c("0","1"))
data$ptco_otro_fam___5.factor = factor(data$ptco_otro_fam___5,levels=c("0","1"))
data$ptco_otro_fam___6.factor = factor(data$ptco_otro_fam___6,levels=c("0","1"))
data$ptco_otro_fam___7.factor = factor(data$ptco_otro_fam___7,levels=c("0","1"))
data$ptco_otro_fam___8.factor = factor(data$ptco_otro_fam___8,levels=c("0","1"))
data$ptco_otro_fam___9.factor = factor(data$ptco_otro_fam___9,levels=c("0","1"))
data$ptco_otro_fam___20.factor = factor(data$ptco_otro_fam___20,levels=c("0","1"))
data$ptco_otro_fam___21.factor = factor(data$ptco_otro_fam___21,levels=c("0","1"))
data$ptco_otro_fam___10.factor = factor(data$ptco_otro_fam___10,levels=c("0","1"))
data$ptco_otro_fam___22.factor = factor(data$ptco_otro_fam___22,levels=c("0","1"))
data$ptco_otro_fam___23.factor = factor(data$ptco_otro_fam___23,levels=c("0","1"))
data$ptco_otro_fam___11.factor = factor(data$ptco_otro_fam___11,levels=c("0","1"))
data$ptco_otro_fam___24.factor = factor(data$ptco_otro_fam___24,levels=c("0","1"))
data$ptco_otro_fam___25.factor = factor(data$ptco_otro_fam___25,levels=c("0","1"))
data$ptco_otro_fam___12.factor = factor(data$ptco_otro_fam___12,levels=c("0","1"))
data$ptco_otro_fam___26.factor = factor(data$ptco_otro_fam___26,levels=c("0","1"))
data$ptco_otro_fam___27.factor = factor(data$ptco_otro_fam___27,levels=c("0","1"))
data$ptco_otro_fam___13.factor = factor(data$ptco_otro_fam___13,levels=c("0","1"))
data$ptco_otro_fam___14.factor = factor(data$ptco_otro_fam___14,levels=c("0","1"))
data$ptco_otro_fam___15.factor = factor(data$ptco_otro_fam___15,levels=c("0","1"))
data$madre_viva.factor = factor(data$madre_viva,levels=c("1","2","3"))
data$padre_vivo.factor = factor(data$padre_vivo,levels=c("1","2","3"))
data$escolaridad_madre.factor = factor(data$escolaridad_madre,levels=c("1","2","3","4","5","6","7","8","9","10","11","12"))
data$escolaridad_padre.factor = factor(data$escolaridad_padre,levels=c("1","2","3","4","5","6","7","8","9","10","11","12"))
data$asma_madre.factor = factor(data$asma_madre,levels=c("1","2"))
data$bronq_cro_madre.factor = factor(data$bronq_cro_madre,levels=c("1","2"))
data$ecv_madre.factor = factor(data$ecv_madre,levels=c("1","2"))
data$hta_madre.factor = factor(data$hta_madre,levels=c("1","2"))
data$acv_madre.factor = factor(data$acv_madre,levels=c("1","2"))
data$dm_madre.factor = factor(data$dm_madre,levels=c("1","2"))
data$asma_padre.factor = factor(data$asma_padre,levels=c("1","2"))
data$bronq_cro_padre.factor = factor(data$bronq_cro_padre,levels=c("1","2"))
data$ecv_padre.factor = factor(data$ecv_padre,levels=c("1","2"))
data$hta_padre.factor = factor(data$hta_padre,levels=c("1","2"))
data$acv_padre.factor = factor(data$acv_padre,levels=c("1","2"))
data$dm_padre.factor = factor(data$dm_padre,levels=c("1","2"))
data$sexo_h1.factor = factor(data$sexo_h1,levels=c("1","2"))
data$sexo_h2.factor = factor(data$sexo_h2,levels=c("1","2"))
data$sexo_h3.factor = factor(data$sexo_h3,levels=c("1","2"))
data$sexo_h4.factor = factor(data$sexo_h4,levels=c("1","2"))
data$sexo_h5.factor = factor(data$sexo_h5,levels=c("1","2"))
data$sexo_h6.factor = factor(data$sexo_h6,levels=c("1","2"))
data$sexo_h7.factor = factor(data$sexo_h7,levels=c("1","2"))
data$sexo_h8.factor = factor(data$sexo_h8,levels=c("1","2"))
data$sexo_h9.factor = factor(data$sexo_h9,levels=c("1","2"))
data$sexo_h10.factor = factor(data$sexo_h10,levels=c("1","2"))
data$sexo_h11.factor = factor(data$sexo_h11,levels=c("1","2"))
data$sexo_h12.factor = factor(data$sexo_h12,levels=c("1","2"))
data$sexo_h13.factor = factor(data$sexo_h13,levels=c("1","2"))
data$sexo_h14.factor = factor(data$sexo_h14,levels=c("1","2"))
data$sexo_h15.factor = factor(data$sexo_h15,levels=c("1","2"))
data$asma_ant_10_h1.factor = factor(data$asma_ant_10_h1,levels=c("1","2"))
data$asma_ant_10_h2.factor = factor(data$asma_ant_10_h2,levels=c("1","2"))
data$asma_ant_10_h3.factor = factor(data$asma_ant_10_h3,levels=c("1","2"))
data$asma_ant_10_h4.factor = factor(data$asma_ant_10_h4,levels=c("1","2"))
data$asma_ant_10_h5.factor = factor(data$asma_ant_10_h5,levels=c("1","2"))
data$asma_ant_10_h6.factor = factor(data$asma_ant_10_h6,levels=c("1","2"))
data$asma_ant_10_h7.factor = factor(data$asma_ant_10_h7,levels=c("1","2"))
data$asma_ant_10_h8.factor = factor(data$asma_ant_10_h8,levels=c("1","2"))
data$asma_ant_10_h9.factor = factor(data$asma_ant_10_h9,levels=c("1","2"))
data$asma_ant_10_h10.factor = factor(data$asma_ant_10_h10,levels=c("1","2"))
data$asma_ant_10_h11.factor = factor(data$asma_ant_10_h11,levels=c("1","2"))
data$asma_ant_10_h12.factor = factor(data$asma_ant_10_h12,levels=c("1","2"))
data$asma_ant_10_h13.factor = factor(data$asma_ant_10_h13,levels=c("1","2"))
data$asma_ant_10_h14.factor = factor(data$asma_ant_10_h14,levels=c("1","2"))
data$asma_ant_10_h15.factor = factor(data$asma_ant_10_h15,levels=c("1","2"))
data$asma_des_10_h1.factor = factor(data$asma_des_10_h1,levels=c("1","2"))
data$asma_des_10_h2.factor = factor(data$asma_des_10_h2,levels=c("1","2"))
data$asma_des_10_h3.factor = factor(data$asma_des_10_h3,levels=c("1","2"))
data$asma_des_10_h4.factor = factor(data$asma_des_10_h4,levels=c("1","2"))
data$asma_des_10_h5.factor = factor(data$asma_des_10_h5,levels=c("1","2"))
data$asma_des_10_h6.factor = factor(data$asma_des_10_h6,levels=c("1","2"))
data$asma_des_10_h7.factor = factor(data$asma_des_10_h7,levels=c("1","2"))
data$asma_des_10_h8.factor = factor(data$asma_des_10_h8,levels=c("1","2"))
data$asma_des_10_h9.factor = factor(data$asma_des_10_h9,levels=c("1","2"))
data$asma_des_10_h10.factor = factor(data$asma_des_10_h10,levels=c("1","2"))
data$asma_des_10_h11.factor = factor(data$asma_des_10_h11,levels=c("1","2"))
data$asma_des_10_h12.factor = factor(data$asma_des_10_h12,levels=c("1","2"))
data$asma_des_10_h13.factor = factor(data$asma_des_10_h13,levels=c("1","2"))
data$asma_des_10_h14.factor = factor(data$asma_des_10_h14,levels=c("1","2"))
data$asma_des_10_h15.factor = factor(data$asma_des_10_h15,levels=c("1","2"))
data$rinitis_h1.factor = factor(data$rinitis_h1,levels=c("1","2"))
data$rinitis_h2.factor = factor(data$rinitis_h2,levels=c("1","2"))
data$rinitis_h3.factor = factor(data$rinitis_h3,levels=c("1","2"))
data$rinitis_h4.factor = factor(data$rinitis_h4,levels=c("1","2"))
data$rinitis_h5.factor = factor(data$rinitis_h5,levels=c("1","2"))
data$rinitis_h6.factor = factor(data$rinitis_h6,levels=c("1","2"))
data$rinitis_h7.factor = factor(data$rinitis_h7,levels=c("1","2"))
data$rinitis_h8.factor = factor(data$rinitis_h8,levels=c("1","2"))
data$rinitis_h9.factor = factor(data$rinitis_h9,levels=c("1","2"))
data$rinitis_h10.factor = factor(data$rinitis_h10,levels=c("1","2"))
data$rinitis_h11.factor = factor(data$rinitis_h11,levels=c("1","2"))
data$rinitis_h12.factor = factor(data$rinitis_h12,levels=c("1","2"))
data$rinitis_h13.factor = factor(data$rinitis_h13,levels=c("1","2"))
data$rinitis_h14.factor = factor(data$rinitis_h14,levels=c("1","2"))
data$rinitis_h15.factor = factor(data$rinitis_h15,levels=c("1","2"))
data$eczema_h1.factor = factor(data$eczema_h1,levels=c("1","2"))
data$eczema_h2.factor = factor(data$eczema_h2,levels=c("1","2"))
data$eczema_h3.factor = factor(data$eczema_h3,levels=c("1","2"))
data$eczema_h4.factor = factor(data$eczema_h4,levels=c("1","2"))
data$eczema_h5.factor = factor(data$eczema_h5,levels=c("1","2"))
data$eczema_h6.factor = factor(data$eczema_h6,levels=c("1","2"))
data$eczema_h7.factor = factor(data$eczema_h7,levels=c("1","2"))
data$eczema_h8.factor = factor(data$eczema_h8,levels=c("1","2"))
data$eczema_h9.factor = factor(data$eczema_h9,levels=c("1","2"))
data$eczema_h10.factor = factor(data$eczema_h10,levels=c("1","2"))
data$eczema_h11.factor = factor(data$eczema_h11,levels=c("1","2"))
data$eczema_h12.factor = factor(data$eczema_h12,levels=c("1","2"))
data$eczema_h13.factor = factor(data$eczema_h13,levels=c("1","2"))
data$eczema_h14.factor = factor(data$eczema_h14,levels=c("1","2"))
data$eczema_h15.factor = factor(data$eczema_h15,levels=c("1","2"))
data$antecedentes_familiares_complete.factor = factor(data$antecedentes_familiares_complete,levels=c("0","1","2"))
data$sil_pit_v2.factor = factor(data$sil_pit_v2,levels=c("1","2"))
data$sil_pit_1_1_v2.factor = factor(data$sil_pit_1_1_v2,levels=c("1","2"))
data$sil_pit_1_2_v2.factor = factor(data$sil_pit_1_2_v2,levels=c("1","2"))
data$sil_pit_1_4_v2.factor = factor(data$sil_pit_1_4_v2,levels=c("1","2","3"))
data$tirantez_v2.factor = factor(data$tirantez_v2,levels=c("1","2"))
data$falt_aire_v2.factor = factor(data$falt_aire_v2,levels=c("1","2"))
data$falt_aire_ejer_v2.factor = factor(data$falt_aire_ejer_v2,levels=c("1","2"))
data$falt_aire_noche_v2.factor = factor(data$falt_aire_noche_v2,levels=c("1","2"))
data$ata_tos_v2.factor = factor(data$ata_tos_v2,levels=c("1","2"))
data$ata_tos_1_1_v2.factor = factor(data$ata_tos_1_1_v2,levels=c("1","3","4","5"))
data$ata_tos_3_v2.factor = factor(data$ata_tos_3_v2,levels=c("1","2"))
data$ata_tos_4_v2.factor = factor(data$ata_tos_4_v2,levels=c("1","2"))
data$ata_tos_4_1_v2.factor = factor(data$ata_tos_4_1_v2,levels=c("1","2"))
data$esputos_v2.factor = factor(data$esputos_v2,levels=c("1","2"))
data$esputos_2_v2.factor = factor(data$esputos_2_v2,levels=c("1","2"))
data$esputos_2_1_v2.factor = factor(data$esputos_2_1_v2,levels=c("1","2"))
data$sin_res_peor_v2.factor = factor(data$sin_res_peor_v2,levels=c("1","2"))
data$resp_v2.factor = factor(data$resp_v2,levels=c("1","2","3","4"))
data$dif_cam_v2.factor = factor(data$dif_cam_v2,levels=c("1","2"))
data$falt_aire_cam_v2.factor = factor(data$falt_aire_cam_v2,levels=c("1","2"))
data$falt_aire_cam_2_v2.factor = factor(data$falt_aire_cam_2_v2,levels=c("1","2"))
data$falt_aire_cam_3_v2.factor = factor(data$falt_aire_cam_3_v2,levels=c("1","2"))
data$falt_aire_cam_5_v2.factor = factor(data$falt_aire_cam_5_v2,levels=c("1","2"))
data$falt_aire_cam_6_v2.factor = factor(data$falt_aire_cam_6_v2,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$asma_v2.factor = factor(data$asma_v2,levels=c("1","2"))
data$asma_1_1_v2.factor = factor(data$asma_1_1_v2,levels=c("1","2"))
data$asma_1_5_v2___1.factor = factor(data$asma_1_5_v2___1,levels=c("0","1"))
data$asma_1_5_v2___2.factor = factor(data$asma_1_5_v2___2,levels=c("0","1"))
data$asma_1_5_v2___3.factor = factor(data$asma_1_5_v2___3,levels=c("0","1"))
data$asma_1_5_v2___4.factor = factor(data$asma_1_5_v2___4,levels=c("0","1"))
data$asma_1_5_v2___5.factor = factor(data$asma_1_5_v2___5,levels=c("0","1"))
data$asma_1_5_v2___6.factor = factor(data$asma_1_5_v2___6,levels=c("0","1"))
data$asma_1_5_v2___7.factor = factor(data$asma_1_5_v2___7,levels=c("0","1"))
data$asma_1_6_v2.factor = factor(data$asma_1_6_v2,levels=c("1","2"))
data$asma_1_9_v2.factor = factor(data$asma_1_9_v2,levels=c("1","2","3","4","5"))
data$asma_1_10_v2.factor = factor(data$asma_1_10_v2,levels=c("1","2","3","4","5"))
data$asma_1_11_v2.factor = factor(data$asma_1_11_v2,levels=c("1","2"))
data$asma_1_12_v2.factor = factor(data$asma_1_12_v2,levels=c("1","2"))
data$bronq_cro_v2.factor = factor(data$bronq_cro_v2,levels=c("1","2"))
data$epoc_v2.factor = factor(data$epoc_v2,levels=c("1","2"))
data$enfisema_v2.factor = factor(data$enfisema_v2,levels=c("1","2"))
data$otra_enf_pulm_v2.factor = factor(data$otra_enf_pulm_v2,levels=c("1","2"))
data$otra_enf_pulm_op_v2___1.factor = factor(data$otra_enf_pulm_op_v2___1,levels=c("0","1"))
data$otra_enf_pulm_op_v2___2.factor = factor(data$otra_enf_pulm_op_v2___2,levels=c("0","1"))
data$otra_enf_pulm_op_v2___3.factor = factor(data$otra_enf_pulm_op_v2___3,levels=c("0","1"))
data$otra_enf_pulm_op_v2___4.factor = factor(data$otra_enf_pulm_op_v2___4,levels=c("0","1"))
data$otra_enf_pulm_op_v2___5.factor = factor(data$otra_enf_pulm_op_v2___5,levels=c("0","1"))
data$otra_enf_pulm_op_v2___6.factor = factor(data$otra_enf_pulm_op_v2___6,levels=c("0","1"))
data$otra_enf_pulm_op_v2___7.factor = factor(data$otra_enf_pulm_op_v2___7,levels=c("0","1"))
data$rinitis_v2.factor = factor(data$rinitis_v2,levels=c("1","2"))
data$estornudos_v2.factor = factor(data$estornudos_v2,levels=c("1","2"))
data$estornudos_1_1_v2.factor = factor(data$estornudos_1_1_v2,levels=c("1","2"))
data$estornudos_1_2_v2.factor = factor(data$estornudos_1_2_v2,levels=c("1","2"))
data$estornudos_1_3_v2___1.factor = factor(data$estornudos_1_3_v2___1,levels=c("0","1"))
data$estornudos_1_3_v2___2.factor = factor(data$estornudos_1_3_v2___2,levels=c("0","1"))
data$estornudos_1_3_v2___3.factor = factor(data$estornudos_1_3_v2___3,levels=c("0","1"))
data$estornudos_1_3_v2___4.factor = factor(data$estornudos_1_3_v2___4,levels=c("0","1"))
data$estornudos_1_3_v2___5.factor = factor(data$estornudos_1_3_v2___5,levels=c("0","1"))
data$estornudos_1_3_v2___6.factor = factor(data$estornudos_1_3_v2___6,levels=c("0","1"))
data$estornudos_1_3_v2___7.factor = factor(data$estornudos_1_3_v2___7,levels=c("0","1"))
data$estornudos_1_4_v2.factor = factor(data$estornudos_1_4_v2,levels=c("1","2"))
data$estornudos_1_5_v2.factor = factor(data$estornudos_1_5_v2,levels=c("1","2"))
data$moq_nariz_v2.factor = factor(data$moq_nariz_v2,levels=c("1","2","3","4"))
data$nariz_tapada_v2.factor = factor(data$nariz_tapada_v2,levels=c("1","2","3","4"))
data$picor_nariz_v2.factor = factor(data$picor_nariz_v2,levels=c("1","2","3","4"))
data$estornudos_2_v2.factor = factor(data$estornudos_2_v2,levels=c("1","2","3","4"))
data$ojos_llorosos_v2.factor = factor(data$ojos_llorosos_v2,levels=c("1","2","3","4"))
data$tras_nas_v2.factor = factor(data$tras_nas_v2,levels=c("1","2"))
data$tras_nas_1_1_v2.factor = factor(data$tras_nas_1_1_v2,levels=c("1","2"))
data$tras_nas_1_2_v2.factor = factor(data$tras_nas_1_2_v2,levels=c("1","2"))
data$nar_tap_v2.factor = factor(data$nar_tap_v2,levels=c("1","2"))
data$pre_fre_v2.factor = factor(data$pre_fre_v2,levels=c("1","2"))
data$mucosidad_v2.factor = factor(data$mucosidad_v2,levels=c("1","2"))
data$olfato_v2.factor = factor(data$olfato_v2,levels=c("1","2"))
data$sinusitis_v2.factor = factor(data$sinusitis_v2,levels=c("1","2"))
data$sinusitis_1_1_v2.factor = factor(data$sinusitis_1_1_v2,levels=c("1","2"))
data$eczema_v2.factor = factor(data$eczema_v2,levels=c("1","2"))
data$eczema_1_2_v2.factor = factor(data$eczema_1_2_v2,levels=c("1","2"))
data$eczema_1_3_v2.factor = factor(data$eczema_1_3_v2,levels=c("1","2"))
data$sarpullidos_v2.factor = factor(data$sarpullidos_v2,levels=c("1","2"))
data$erupcion_v2.factor = factor(data$erupcion_v2,levels=c("1","2"))
data$erupcion_1_1_v2.factor = factor(data$erupcion_1_1_v2,levels=c("1","2"))
data$erupcion_1_2_v2.factor = factor(data$erupcion_1_2_v2,levels=c("1","2"))
data$expo_trab2_v2.factor = factor(data$expo_trab2_v2,levels=c("1","2"))
data$expo_trab1_v2.factor = factor(data$expo_trab1_v2,levels=c("1","2"))
data$expo_trab1_1_v2.factor = factor(data$expo_trab1_1_v2,levels=c("1","2"))
data$expo_trab1_1_1_v2___1.factor = factor(data$expo_trab1_1_1_v2___1,levels=c("0","1"))
data$expo_trab1_1_1_v2___3.factor = factor(data$expo_trab1_1_1_v2___3,levels=c("0","1"))
data$expo_trab1_1_1_v2___4.factor = factor(data$expo_trab1_1_1_v2___4,levels=c("0","1"))
data$expo_trab1_1_1_v2___5.factor = factor(data$expo_trab1_1_1_v2___5,levels=c("0","1"))
data$expo_trab1_1_1_v2___6.factor = factor(data$expo_trab1_1_1_v2___6,levels=c("0","1"))
data$expo_trab1_1_1_v2___7.factor = factor(data$expo_trab1_1_1_v2___7,levels=c("0","1"))
data$expo_trab1_1_2_v2.factor = factor(data$expo_trab1_1_2_v2,levels=c("1","2"))
data$humed_trab1_v2.factor = factor(data$humed_trab1_v2,levels=c("1","2"))
data$moho_trab1_v2.factor = factor(data$moho_trab1_v2,levels=c("1","2"))
data$moho_alim_trab1_v2.factor = factor(data$moho_alim_trab1_v2,levels=c("1","2"))
data$pro_lim_trab1_v2.factor = factor(data$pro_lim_trab1_v2,levels=c("1","2"))
data$pro_lim_trab1_1_v2.factor = factor(data$pro_lim_trab1_1_v2,levels=c(""))
data$hipoclorito_1_v2.factor = factor(data$hipoclorito_1_v2,levels=c("1","2","3","4"))
data$amoniaco_1_v2.factor = factor(data$amoniaco_1_v2,levels=c("1","2","3","4"))
data$quitamanchas_1_v2.factor = factor(data$quitamanchas_1_v2,levels=c("1","2","3","4"))
data$acidos_1_v2.factor = factor(data$acidos_1_v2,levels=c("1","2","3","4"))
data$ceras_suelos_1_v2.factor = factor(data$ceras_suelos_1_v2,levels=c("1","2","3","4"))
data$ceras_muebles_1_v2.factor = factor(data$ceras_muebles_1_v2,levels=c("1","2","3","4"))
data$sprays_suelos_1_v2.factor = factor(data$sprays_suelos_1_v2,levels=c("1","2","3","4"))
data$sprays_muebles_1_v2.factor = factor(data$sprays_muebles_1_v2,levels=c("1","2","3","4"))
data$detergentes_1_v2.factor = factor(data$detergentes_1_v2,levels=c("1","2","3","4"))
data$sprays_cristales_1_v2.factor = factor(data$sprays_cristales_1_v2,levels=c("1","2","3","4"))
data$alcohol_1_v2.factor = factor(data$alcohol_1_v2,levels=c("1","2","3","4"))
data$jabones_1_v2.factor = factor(data$jabones_1_v2,levels=c("1","2","3","4"))
data$otro_desinfectante_1_v2.factor = factor(data$otro_desinfectante_1_v2,levels=c("1","2","3","4"))
data$sprays_desengrasantes_1_v2.factor = factor(data$sprays_desengrasantes_1_v2,levels=c("1","2","3","4"))
data$expo_v2.factor = factor(data$expo_v2,levels=c("1","2"))
data$expo_2_1_v2.factor = factor(data$expo_2_1_v2,levels=c("1","2","5","6"))
data$expo_2_2_v2.factor = factor(data$expo_2_2_v2,levels=c("1","2","3","4"))
data$expo_2_3_v2.factor = factor(data$expo_2_3_v2,levels=c("1","2"))
data$expo_2_4_1_v2.factor = factor(data$expo_2_4_1_v2,levels=c("1","2"))
data$vivienda_v2.factor = factor(data$vivienda_v2,levels=c("1","2","3","4","5","6"))
data$air_acon_v2.factor = factor(data$air_acon_v2,levels=c("1","2"))
data$combus_cocinar_v2___1.factor = factor(data$combus_cocinar_v2___1,levels=c("0","1"))
data$combus_cocinar_v2___2.factor = factor(data$combus_cocinar_v2___2,levels=c("0","1"))
data$combus_cocinar_v2___3.factor = factor(data$combus_cocinar_v2___3,levels=c("0","1"))
data$combus_cocinar_v2___4.factor = factor(data$combus_cocinar_v2___4,levels=c("0","1"))
data$combus_cocinar_v2___5.factor = factor(data$combus_cocinar_v2___5,levels=c("0","1"))
data$combus_cocinar_v2___6.factor = factor(data$combus_cocinar_v2___6,levels=c("0","1"))
data$combus_cocinar_v2___7.factor = factor(data$combus_cocinar_v2___7,levels=c("0","1"))
data$cocina_v2.factor = factor(data$cocina_v2,levels=c("1","2"))
data$cocinar_ventana_v2.factor = factor(data$cocinar_ventana_v2,levels=c("1","2","3","4","5"))
data$extractor_v2.factor = factor(data$extractor_v2,levels=c("1","2"))
data$extrator_1_1_v2.factor = factor(data$extrator_1_1_v2,levels=c("1","2","3"))
data$goteras_v2.factor = factor(data$goteras_v2,levels=c("1","2","3"))
data$goteras_1_v2.factor = factor(data$goteras_1_v2,levels=c("1","2","3"))
data$manchas_v2.factor = factor(data$manchas_v2,levels=c("1","2"))
data$moho_manchas_casa_v2.factor = factor(data$moho_manchas_casa_v2,levels=c("1","2"))
data$moho_casa_v2.factor = factor(data$moho_casa_v2,levels=c("1","2","3"))
data$moho_lugar_v2___1.factor = factor(data$moho_lugar_v2___1,levels=c("0","1"))
data$moho_lugar_v2___2.factor = factor(data$moho_lugar_v2___2,levels=c("0","1"))
data$moho_lugar_v2___3.factor = factor(data$moho_lugar_v2___3,levels=c("0","1"))
data$moho_lugar_v2___4.factor = factor(data$moho_lugar_v2___4,levels=c("0","1"))
data$moho_lugar_v2___5.factor = factor(data$moho_lugar_v2___5,levels=c("0","1"))
data$moho_lugar_v2___6.factor = factor(data$moho_lugar_v2___6,levels=c("0","1"))
data$moho_casa_2_v2.factor = factor(data$moho_casa_2_v2,levels=c("1","2"))
data$ventanas_2_v2.factor = factor(data$ventanas_2_v2,levels=c("1","2","3"))
data$gato_1_v2.factor = factor(data$gato_1_v2,levels=c("1","2"))
data$gato_2_v2.factor = factor(data$gato_2_v2,levels=c("1","2"))
data$perro_v2.factor = factor(data$perro_v2,levels=c("1","2"))
data$perro_1_v2.factor = factor(data$perro_1_v2,levels=c("1","2"))
data$perro_2_v2.factor = factor(data$perro_2_v2,levels=c("1","2"))
data$pajaro_v2.factor = factor(data$pajaro_v2,levels=c("1","2"))
data$pajaro_1_v2.factor = factor(data$pajaro_1_v2,levels=c("1","2"))
data$enfer_alime_v2.factor = factor(data$enfer_alime_v2,levels=c("1","2"))
data$enfer_alime_siem_v2.factor = factor(data$enfer_alime_siem_v2,levels=c("1","2"))
data$alime_v2___1.factor = factor(data$alime_v2___1,levels=c("0","1"))
data$alime_v2___2.factor = factor(data$alime_v2___2,levels=c("0","1"))
data$alime_v2___3.factor = factor(data$alime_v2___3,levels=c("0","1"))
data$alime_v2___4.factor = factor(data$alime_v2___4,levels=c("0","1"))
data$alime_v2___5.factor = factor(data$alime_v2___5,levels=c("0","1"))
data$alime_v2___6.factor = factor(data$alime_v2___6,levels=c("0","1"))
data$alime_v2___7.factor = factor(data$alime_v2___7,levels=c("0","1"))
data$alime_v2___8.factor = factor(data$alime_v2___8,levels=c("0","1"))
data$alime_v2___9.factor = factor(data$alime_v2___9,levels=c("0","1"))
data$alime_v2___10.factor = factor(data$alime_v2___10,levels=c("0","1"))
data$alime_v2___11.factor = factor(data$alime_v2___11,levels=c("0","1"))
data$alime_v2___12.factor = factor(data$alime_v2___12,levels=c("0","1"))
data$alime_v2___13.factor = factor(data$alime_v2___13,levels=c("0","1"))
data$alime_v2___14.factor = factor(data$alime_v2___14,levels=c("0","1"))
data$alime_v2___15.factor = factor(data$alime_v2___15,levels=c("0","1"))
data$alime_v2___16.factor = factor(data$alime_v2___16,levels=c("0","1"))
data$alime_v2___17.factor = factor(data$alime_v2___17,levels=c("0","1"))
data$alime_v2___18.factor = factor(data$alime_v2___18,levels=c("0","1"))
data$alime_v2___19.factor = factor(data$alime_v2___19,levels=c("0","1"))
data$alime_v2___20.factor = factor(data$alime_v2___20,levels=c("0","1"))
data$alime_v2___21.factor = factor(data$alime_v2___21,levels=c("0","1"))
data$alime_v2___22.factor = factor(data$alime_v2___22,levels=c("0","1"))
data$alime_v2___23.factor = factor(data$alime_v2___23,levels=c("0","1"))
data$alime_v2___24.factor = factor(data$alime_v2___24,levels=c("0","1"))
data$alime_v2___26.factor = factor(data$alime_v2___26,levels=c("0","1"))
data$alime_v2___27.factor = factor(data$alime_v2___27,levels=c("0","1"))
data$alime_v2___28.factor = factor(data$alime_v2___28,levels=c("0","1"))
data$enro_alime_otro_1_v2.factor = factor(data$enro_alime_otro_1_v2,levels=c("1","2"))
data$vomi_alime_otro_1_v2.factor = factor(data$vomi_alime_otro_1_v2,levels=c("1","2"))
data$tapa_alime_otro_1_v2.factor = factor(data$tapa_alime_otro_1_v2,levels=c("1","2"))
data$dol_cab_alime_otro_1_v2.factor = factor(data$dol_cab_alime_otro_1_v2,levels=c("1","2"))
data$alien_alime_otro_1_v2.factor = factor(data$alien_alime_otro_1_v2,levels=c("1","2"))
data$picor_alime_otro_1_v2.factor = factor(data$picor_alime_otro_1_v2,levels=c("1","2"))
data$dif_tra_alime_otro_1_v2.factor = factor(data$dif_tra_alime_otro_1_v2,levels=c("1","2"))
data$desma_alime_otro_1_v2.factor = factor(data$desma_alime_otro_1_v2,levels=c("1","2"))
data$inye_alime_otro_1_v2.factor = factor(data$inye_alime_otro_1_v2,levels=c("1","2"))
data$otro_alime_otro_1_v2.factor = factor(data$otro_alime_otro_1_v2,levels=c("1","2"))
data$tiemp_alime_otro_1_v2.factor = factor(data$tiemp_alime_otro_1_v2,levels=c("1","3","4","5","6"))
data$enro_alime_otro_2_v2.factor = factor(data$enro_alime_otro_2_v2,levels=c("1","2"))
data$vomi_alime_otro_2_v2.factor = factor(data$vomi_alime_otro_2_v2,levels=c("1","2"))
data$picor_alime_otro_2_v2.factor = factor(data$picor_alime_otro_2_v2,levels=c("1","2"))
data$dif_tra_alime_otro_2_v2.factor = factor(data$dif_tra_alime_otro_2_v2,levels=c("1","2"))
data$desma_alime_otro_2_v2.factor = factor(data$desma_alime_otro_2_v2,levels=c("1","2"))
data$inye_alime_otro_2_v2.factor = factor(data$inye_alime_otro_2_v2,levels=c("1","2"))
data$otro_alime_otro_2_v2.factor = factor(data$otro_alime_otro_2_v2,levels=c("1","2"))
data$tiemp_alime_otro_2_v2.factor = factor(data$tiemp_alime_otro_2_v2,levels=c("1","3","4","5","6"))
data$enro_alime_otro_3_v2.factor = factor(data$enro_alime_otro_3_v2,levels=c("1","2"))
data$vomi_alime_otro_3_v2.factor = factor(data$vomi_alime_otro_3_v2,levels=c("1","2"))
data$picor_alime_otro_3_v2.factor = factor(data$picor_alime_otro_3_v2,levels=c("1","2"))
data$dif_tra_alime_otro_3_v2.factor = factor(data$dif_tra_alime_otro_3_v2,levels=c("1","2"))
data$desma_alime_otro_3_v2.factor = factor(data$desma_alime_otro_3_v2,levels=c("1","2"))
data$inye_alime_otro_3_v2.factor = factor(data$inye_alime_otro_3_v2,levels=c("1","2"))
data$otro_alime_otro_3_v2.factor = factor(data$otro_alime_otro_3_v2,levels=c("1","2"))
data$tiemp_alime_otro_3_v2.factor = factor(data$tiemp_alime_otro_3_v2,levels=c("1","3","4","5","6"))
data$tos_anim_v2.factor = factor(data$tos_anim_v2,levels=c("1","2"))
data$tos_anim_op_v2___1.factor = factor(data$tos_anim_op_v2___1,levels=c("0","1"))
data$tos_anim_op_v2___2.factor = factor(data$tos_anim_op_v2___2,levels=c("0","1"))
data$tos_anim_op_v2___3.factor = factor(data$tos_anim_op_v2___3,levels=c("0","1"))
data$tos_anim_op_v2___4.factor = factor(data$tos_anim_op_v2___4,levels=c("0","1"))
data$sil_anim_v2.factor = factor(data$sil_anim_v2,levels=c("1","2"))
data$sil_anim_op_v2___1.factor = factor(data$sil_anim_op_v2___1,levels=c("0","1"))
data$sil_anim_op_v2___2.factor = factor(data$sil_anim_op_v2___2,levels=c("0","1"))
data$sil_anim_op_v2___3.factor = factor(data$sil_anim_op_v2___3,levels=c("0","1"))
data$sil_anim_op_v2___4.factor = factor(data$sil_anim_op_v2___4,levels=c("0","1"))
data$opre_anim_v2.factor = factor(data$opre_anim_v2,levels=c("1","2"))
data$opre_anim_op_v2___1.factor = factor(data$opre_anim_op_v2___1,levels=c("0","1"))
data$opre_anim_op_v2___2.factor = factor(data$opre_anim_op_v2___2,levels=c("0","1"))
data$opre_anim_op_v2___3.factor = factor(data$opre_anim_op_v2___3,levels=c("0","1"))
data$opre_anim_op_v2___4.factor = factor(data$opre_anim_op_v2___4,levels=c("0","1"))
data$falt_aire_anim_v2.factor = factor(data$falt_aire_anim_v2,levels=c("1","2"))
data$falta_aire_anim_op_v2___1.factor = factor(data$falta_aire_anim_op_v2___1,levels=c("0","1"))
data$falta_aire_anim_op_v2___2.factor = factor(data$falta_aire_anim_op_v2___2,levels=c("0","1"))
data$falta_aire_anim_op_v2___3.factor = factor(data$falta_aire_anim_op_v2___3,levels=c("0","1"))
data$falta_aire_anim_op_v2___4.factor = factor(data$falta_aire_anim_op_v2___4,levels=c("0","1"))
data$nariz_anim_v2.factor = factor(data$nariz_anim_v2,levels=c("1","2"))
data$nariz_anim_op_v2___1.factor = factor(data$nariz_anim_op_v2___1,levels=c("0","1"))
data$nariz_anim_op_v2___2.factor = factor(data$nariz_anim_op_v2___2,levels=c("0","1"))
data$nariz_anim_op_v2___3.factor = factor(data$nariz_anim_op_v2___3,levels=c("0","1"))
data$nariz_anim_op_v2___4.factor = factor(data$nariz_anim_op_v2___4,levels=c("0","1"))
data$ojos_anim_v2.factor = factor(data$ojos_anim_v2,levels=c("1","2"))
data$ojos_anim_op_v2___1.factor = factor(data$ojos_anim_op_v2___1,levels=c("0","1"))
data$ojos_anim_op_v2___2.factor = factor(data$ojos_anim_op_v2___2,levels=c("0","1"))
data$ojos_anim_op_v2___3.factor = factor(data$ojos_anim_op_v2___3,levels=c("0","1"))
data$ojos_anim_op_v2___4.factor = factor(data$ojos_anim_op_v2___4,levels=c("0","1"))
data$tos_2_v2.factor = factor(data$tos_2_v2,levels=c("1","2"))
data$sil_2_v2.factor = factor(data$sil_2_v2,levels=c("1","2"))
data$opre_2_v2.factor = factor(data$opre_2_v2,levels=c("1","2"))
data$falt_aire_2_v2.factor = factor(data$falt_aire_2_v2,levels=c("1","2"))
data$nariz_2_v2.factor = factor(data$nariz_2_v2,levels=c("1","2"))
data$ojos_2_v2.factor = factor(data$ojos_2_v2,levels=c("1","2"))
data$tos_3_v2.factor = factor(data$tos_3_v2,levels=c("1","2"))
data$sil_3_v2.factor = factor(data$sil_3_v2,levels=c("1","2"))
data$opre_3_v2.factor = factor(data$opre_3_v2,levels=c("1","2"))
data$falt_aire_3_v2.factor = factor(data$falt_aire_3_v2,levels=c("1","2"))
data$nariz_3_v2.factor = factor(data$nariz_3_v2,levels=c("1","2"))
data$ojos_3_v2.factor = factor(data$ojos_3_v2,levels=c("1","2"))
data$med_inha_v2.factor = factor(data$med_inha_v2,levels=c("1","2"))
data$ago_beta2_v2.factor = factor(data$ago_beta2_v2,levels=c("1","2"))
data$ago_beta2_corta_1_v2.factor = factor(data$ago_beta2_corta_1_v2,levels=c("1","2","3","4"))
data$ago_beta2_corta_2_v2.factor = factor(data$ago_beta2_corta_2_v2,levels=c("1","2","3","4"))
data$ago_beta2_corta_3_v2.factor = factor(data$ago_beta2_corta_3_v2,levels=c("1","2","3","4"))
data$ago_beta2_corta_4_v2.factor = factor(data$ago_beta2_corta_4_v2,levels=c("1","2","3","4"))
data$ago_beta2_fr_1_v2.factor = factor(data$ago_beta2_fr_1_v2,levels=c("1","2","3","4"))
data$ago_beta2_fr_2_v2.factor = factor(data$ago_beta2_fr_2_v2,levels=c("1","2","3","4"))
data$ago_beta2_fr_3_v2.factor = factor(data$ago_beta2_fr_3_v2,levels=c("1","2","3","4"))
data$ago_beta2_fr_4_v2.factor = factor(data$ago_beta2_fr_4_v2,levels=c("1","2","3","4"))
data$ago_beta2_pro_v2.factor = factor(data$ago_beta2_pro_v2,levels=c("1","2"))
data$ago_beta2_pro_1_v2.factor = factor(data$ago_beta2_pro_1_v2,levels=c("1","2"))
data$ago_beta2_pro_2_v2.factor = factor(data$ago_beta2_pro_2_v2,levels=c("1","2"))
data$ago_beta2_fr_5_v2.factor = factor(data$ago_beta2_fr_5_v2,levels=c("1","2","3","4"))
data$ago_beta2_fr_6_v2.factor = factor(data$ago_beta2_fr_6_v2,levels=c("1","2","3","4"))
data$antimus_cort_v2.factor = factor(data$antimus_cort_v2,levels=c("1","2"))
data$antimus_corta_1_v2.factor = factor(data$antimus_corta_1_v2,levels=c("1"))
data$antimus_fr_1_v2.factor = factor(data$antimus_fr_1_v2,levels=c("1","2","3","4"))
data$antimus_pro_v2.factor = factor(data$antimus_pro_v2,levels=c("1","2"))
data$antimus_pro_1_v2.factor = factor(data$antimus_pro_1_v2,levels=c("1","2"))
data$antimus_pro_2_v2.factor = factor(data$antimus_pro_2_v2,levels=c("1","2"))
data$antimus_fr_2_v2.factor = factor(data$antimus_fr_2_v2,levels=c("1","2","3","4"))
data$antimus_fr_3_v2.factor = factor(data$antimus_fr_3_v2,levels=c("1","2","3","4"))
data$este_inha_v2.factor = factor(data$este_inha_v2,levels=c("1","2"))
data$este_inha_1_v2.factor = factor(data$este_inha_1_v2,levels=c("1","2","3","4","5","6"))
data$este_inha_2_v2.factor = factor(data$este_inha_2_v2,levels=c("1","2","3","4","5","6"))
data$este_inha_3_v2.factor = factor(data$este_inha_3_v2,levels=c("1","2","3","4","5","6"))
data$este_inha_4_v2.factor = factor(data$este_inha_4_v2,levels=c("1","2","3","4","5","6"))
data$este_inha_5_v2.factor = factor(data$este_inha_5_v2,levels=c("1","2","3","4","5","6"))
data$este_inha_6_v2.factor = factor(data$este_inha_6_v2,levels=c("1","2","3","4","5","6"))
data$este_fr_1_v2.factor = factor(data$este_fr_1_v2,levels=c("1","2","3","4"))
data$este_fr_2_v2.factor = factor(data$este_fr_2_v2,levels=c("1","2","3","4"))
data$este_fr_3_v2.factor = factor(data$este_fr_3_v2,levels=c("1","2","3","4"))
data$este_fr_4_v2.factor = factor(data$este_fr_4_v2,levels=c("1","2","3","4"))
data$este_fr_5_v2.factor = factor(data$este_fr_5_v2,levels=c("1","2","3","4"))
data$este_fr_6_v2.factor = factor(data$este_fr_6_v2,levels=c("1","2","3","4"))
data$combi_inha_v2.factor = factor(data$combi_inha_v2,levels=c("1","2"))
data$combi_inha_op_v2___7.factor = factor(data$combi_inha_op_v2___7,levels=c("0","1"))
data$combi_inha_op_v2___8.factor = factor(data$combi_inha_op_v2___8,levels=c("0","1"))
data$combi_inha_op_v2___9.factor = factor(data$combi_inha_op_v2___9,levels=c("0","1"))
data$combi_inha_op_v2___10.factor = factor(data$combi_inha_op_v2___10,levels=c("0","1"))
data$combi_inha_op_v2___11.factor = factor(data$combi_inha_op_v2___11,levels=c("0","1"))
data$combi_inha_op_v2___1.factor = factor(data$combi_inha_op_v2___1,levels=c("0","1"))
data$combi_inha_op_v2___2.factor = factor(data$combi_inha_op_v2___2,levels=c("0","1"))
data$combi_inha_op_v2___3.factor = factor(data$combi_inha_op_v2___3,levels=c("0","1"))
data$combi_inha_op_v2___4.factor = factor(data$combi_inha_op_v2___4,levels=c("0","1"))
data$combi_inha_op_v2___5.factor = factor(data$combi_inha_op_v2___5,levels=c("0","1"))
data$combi_inha_op_v2___6.factor = factor(data$combi_inha_op_v2___6,levels=c("0","1"))
data$combi_inha_1_v2.factor = factor(data$combi_inha_1_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_2_v2.factor = factor(data$combi_inha_2_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_3_v2.factor = factor(data$combi_inha_3_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_4_v2.factor = factor(data$combi_inha_4_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_5_v2.factor = factor(data$combi_inha_5_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_6_v2.factor = factor(data$combi_inha_6_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_7_v2.factor = factor(data$combi_inha_7_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_8_v2.factor = factor(data$combi_inha_8_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_9_v2.factor = factor(data$combi_inha_9_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_10_v2.factor = factor(data$combi_inha_10_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_11_v2.factor = factor(data$combi_inha_11_v2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_fr_1_v2.factor = factor(data$combi_fr_1_v2,levels=c("1","2","3","4"))
data$combi_fr_2_v2.factor = factor(data$combi_fr_2_v2,levels=c("1","2","3","4"))
data$combi_fr_3_v2.factor = factor(data$combi_fr_3_v2,levels=c("1","2","3","4"))
data$combi_fr_4_v2.factor = factor(data$combi_fr_4_v2,levels=c("1","2","3","4"))
data$combi_fr_5_v2.factor = factor(data$combi_fr_5_v2,levels=c("1","2","3","4"))
data$combi_fr_6_v2.factor = factor(data$combi_fr_6_v2,levels=c("1","2","3","4"))
data$combi_fr_7_v2.factor = factor(data$combi_fr_7_v2,levels=c("1","2","3","4"))
data$combi_fr_8_v2.factor = factor(data$combi_fr_8_v2,levels=c("1","2","3","4"))
data$combi_fr_9_v2.factor = factor(data$combi_fr_9_v2,levels=c("1","2","3","4"))
data$combi_fr_10_v2.factor = factor(data$combi_fr_10_v2,levels=c("1","2","3","4"))
data$combi_fr_11_v2.factor = factor(data$combi_fr_11_v2,levels=c("1","2","3","4"))
data$antibi_v2.factor = factor(data$antibi_v2,levels=c("1","2"))
data$atb_cuales___1.factor = factor(data$atb_cuales___1,levels=c("0","1"))
data$atb_cuales___2.factor = factor(data$atb_cuales___2,levels=c("0","1"))
data$atb_cuales___3.factor = factor(data$atb_cuales___3,levels=c("0","1"))
data$atb_cuales___4.factor = factor(data$atb_cuales___4,levels=c("0","1"))
data$atb_cuales___5.factor = factor(data$atb_cuales___5,levels=c("0","1"))
data$atb_cuales___6.factor = factor(data$atb_cuales___6,levels=c("0","1"))
data$atb_cuales___7.factor = factor(data$atb_cuales___7,levels=c("0","1"))
data$atb_cuales___8.factor = factor(data$atb_cuales___8,levels=c("0","1"))
data$atb_cuales___9.factor = factor(data$atb_cuales___9,levels=c("0","1"))
data$atb_cuales___10.factor = factor(data$atb_cuales___10,levels=c("0","1"))
data$atb_cuales___11.factor = factor(data$atb_cuales___11,levels=c("0","1"))
data$atb_cuales___12.factor = factor(data$atb_cuales___12,levels=c("0","1"))
data$atb_cuales___13.factor = factor(data$atb_cuales___13,levels=c("0","1"))
data$atb_cuales___14.factor = factor(data$atb_cuales___14,levels=c("0","1"))
data$antibi_2_v2.factor = factor(data$antibi_2_v2,levels=c("1","2"))
data$remedio_v2.factor = factor(data$remedio_v2,levels=c("1","2"))
data$remedio_op_v2___1.factor = factor(data$remedio_op_v2___1,levels=c("0","1"))
data$remedio_op_v2___2.factor = factor(data$remedio_op_v2___2,levels=c("0","1"))
data$remedio_op_v2___3.factor = factor(data$remedio_op_v2___3,levels=c("0","1"))
data$remedio_op_v2___4.factor = factor(data$remedio_op_v2___4,levels=c("0","1"))
data$remedio_op_v2___5.factor = factor(data$remedio_op_v2___5,levels=c("0","1"))
data$remedio_op_v2___6.factor = factor(data$remedio_op_v2___6,levels=c("0","1"))
data$remedio_op_v2___7.factor = factor(data$remedio_op_v2___7,levels=c("0","1"))
data$remedio_op_v2___8.factor = factor(data$remedio_op_v2___8,levels=c("0","1"))
data$remedio_op_v2___9.factor = factor(data$remedio_op_v2___9,levels=c("0","1"))
data$remedio_op_v2___10.factor = factor(data$remedio_op_v2___10,levels=c("0","1"))
data$remedio_op_v2___11.factor = factor(data$remedio_op_v2___11,levels=c("0","1"))
data$remedio_op_v2___12.factor = factor(data$remedio_op_v2___12,levels=c("0","1"))
data$remedio_op_v2___13.factor = factor(data$remedio_op_v2___13,levels=c("0","1"))
data$acetaminofen_v2.factor = factor(data$acetaminofen_v2,levels=c("1","2","3","4","5"))
data$acetaminofen_2_v2___1.factor = factor(data$acetaminofen_2_v2___1,levels=c("0","1"))
data$acetaminofen_2_v2___2.factor = factor(data$acetaminofen_2_v2___2,levels=c("0","1"))
data$acetaminofen_2_v2___3.factor = factor(data$acetaminofen_2_v2___3,levels=c("0","1"))
data$acetaminofen_2_v2___4.factor = factor(data$acetaminofen_2_v2___4,levels=c("0","1"))
data$acetaminofen_2_v2___6.factor = factor(data$acetaminofen_2_v2___6,levels=c("0","1"))
data$acetaminofen_2_v2___5.factor = factor(data$acetaminofen_2_v2___5,levels=c("0","1"))
data$analgesico_v2.factor = factor(data$analgesico_v2,levels=c("1","2","3","4","5"))
data$analgesico_3_v2___1.factor = factor(data$analgesico_3_v2___1,levels=c("0","1"))
data$analgesico_3_v2___2.factor = factor(data$analgesico_3_v2___2,levels=c("0","1"))
data$analgesico_3_v2___3.factor = factor(data$analgesico_3_v2___3,levels=c("0","1"))
data$analgesico_3_v2___4.factor = factor(data$analgesico_3_v2___4,levels=c("0","1"))
data$analgesico_2_v2___1.factor = factor(data$analgesico_2_v2___1,levels=c("0","1"))
data$analgesico_2_v2___2.factor = factor(data$analgesico_2_v2___2,levels=c("0","1"))
data$analgesico_2_v2___3.factor = factor(data$analgesico_2_v2___3,levels=c("0","1"))
data$analgesico_2_v2___4.factor = factor(data$analgesico_2_v2___4,levels=c("0","1"))
data$analgesico_2_v2___6.factor = factor(data$analgesico_2_v2___6,levels=c("0","1"))
data$analgesico_2_v2___5.factor = factor(data$analgesico_2_v2___5,levels=c("0","1"))
data$desensibili_v2.factor = factor(data$desensibili_v2,levels=c("1","2"))
data$tto_desensibili_v2___1.factor = factor(data$tto_desensibili_v2___1,levels=c("0","1"))
data$tto_desensibili_v2___2.factor = factor(data$tto_desensibili_v2___2,levels=c("0","1"))
data$tto_desensibili_v2___3.factor = factor(data$tto_desensibili_v2___3,levels=c("0","1"))
data$tto_desensibili_v2___4.factor = factor(data$tto_desensibili_v2___4,levels=c("0","1"))
data$tto_desensibili_v2___5.factor = factor(data$tto_desensibili_v2___5,levels=c("0","1"))
data$desensibili_1_v2.factor = factor(data$desensibili_1_v2,levels=c("1","2"))
data$gripe_v2.factor = factor(data$gripe_v2,levels=c("1","2"))
data$gripe_2_v2.factor = factor(data$gripe_2_v2,levels=c("1","2"))
data$neumo_v2.factor = factor(data$neumo_v2,levels=c("1","2","3"))
data$covid_v2.factor = factor(data$covid_v2,levels=c("1","2","3"))
data$covid_exa_v2.factor = factor(data$covid_exa_v2,levels=c("1","2"))
data$covid_3_v2___1.factor = factor(data$covid_3_v2___1,levels=c("0","1"))
data$covid_3_v2___2.factor = factor(data$covid_3_v2___2,levels=c("0","1"))
data$covid_3_v2___3.factor = factor(data$covid_3_v2___3,levels=c("0","1"))
data$covid_3_v2___4.factor = factor(data$covid_3_v2___4,levels=c("0","1"))
data$covid_3_v2___5.factor = factor(data$covid_3_v2___5,levels=c("0","1"))
data$covid_3_v2___6.factor = factor(data$covid_3_v2___6,levels=c("0","1"))
data$covid_3_v2___7.factor = factor(data$covid_3_v2___7,levels=c("0","1"))
data$covid_3_v2___8.factor = factor(data$covid_3_v2___8,levels=c("0","1"))
data$covid_4_v2.factor = factor(data$covid_4_v2,levels=c("1","2"))
data$covid_5_v2.factor = factor(data$covid_5_v2,levels=c("1","2"))
data$covid_6_v2.factor = factor(data$covid_6_v2,levels=c("1","2"))
data$covid_exa_2_v2.factor = factor(data$covid_exa_2_v2,levels=c("1","2"))
data$covid_7_v2___1.factor = factor(data$covid_7_v2___1,levels=c("0","1"))
data$covid_7_v2___2.factor = factor(data$covid_7_v2___2,levels=c("0","1"))
data$covid_7_v2___3.factor = factor(data$covid_7_v2___3,levels=c("0","1"))
data$covid_7_v2___4.factor = factor(data$covid_7_v2___4,levels=c("0","1"))
data$covid_7_v2___5.factor = factor(data$covid_7_v2___5,levels=c("0","1"))
data$covid_7_v2___6.factor = factor(data$covid_7_v2___6,levels=c("0","1"))
data$covid_7_v2___7.factor = factor(data$covid_7_v2___7,levels=c("0","1"))
data$covid_7_v2___8.factor = factor(data$covid_7_v2___8,levels=c("0","1"))
data$covid_8_v2.factor = factor(data$covid_8_v2,levels=c("1","2"))
data$covid_9_v2.factor = factor(data$covid_9_v2,levels=c("1","2"))
data$covid_10_v2.factor = factor(data$covid_10_v2,levels=c("1","2"))
data$covid_exa_3_v2.factor = factor(data$covid_exa_3_v2,levels=c("1","2"))
data$covid_11_v2___1.factor = factor(data$covid_11_v2___1,levels=c("0","1"))
data$covid_11_v2___2.factor = factor(data$covid_11_v2___2,levels=c("0","1"))
data$covid_11_v2___3.factor = factor(data$covid_11_v2___3,levels=c("0","1"))
data$covid_11_v2___4.factor = factor(data$covid_11_v2___4,levels=c("0","1"))
data$covid_11_v2___5.factor = factor(data$covid_11_v2___5,levels=c("0","1"))
data$covid_11_v2___6.factor = factor(data$covid_11_v2___6,levels=c("0","1"))
data$covid_11_v2___7.factor = factor(data$covid_11_v2___7,levels=c("0","1"))
data$covid_11_v2___8.factor = factor(data$covid_11_v2___8,levels=c("0","1"))
data$covid_12_v2.factor = factor(data$covid_12_v2,levels=c("1","2"))
data$covid_13_v2.factor = factor(data$covid_13_v2,levels=c("1","2"))
data$covid_vacu_v2.factor = factor(data$covid_vacu_v2,levels=c("1","2"))
data$covid_prov_1_v2.factor = factor(data$covid_prov_1_v2,levels=c("1","2","3","4","5","6","7","8"))
data$covid_prov_2_v2.factor = factor(data$covid_prov_2_v2,levels=c("1","2","3","4","5","6","7","8"))
data$covid_prov_3_v2.factor = factor(data$covid_prov_3_v2,levels=c("1","2","3","4","5","6","7","8"))
data$covid_prov_4_v2.factor = factor(data$covid_prov_4_v2,levels=c("1","2","3","4","5","6","7","8"))
data$covid_prov_5_v2.factor = factor(data$covid_prov_5_v2,levels=c("1","2","3","4","5","6","7","8"))
data$vis_med_v2.factor = factor(data$vis_med_v2,levels=c("1","2"))
data$vis_med_2_v2.factor = factor(data$vis_med_2_v2,levels=c("1","2"))
data$vis_esp_v2.factor = factor(data$vis_esp_v2,levels=c("1","2"))
data$vis_esp_2_v2.factor = factor(data$vis_esp_2_v2,levels=c("1","2"))
data$cuestionario_respiratorio_2_complete.factor = factor(data$cuestionario_respiratorio_2_complete,levels=c("0","1","2"))
data$af_int_trab.factor = factor(data$af_int_trab,levels=c("1","2"))
data$af_mod_trab.factor = factor(data$af_mod_trab,levels=c("1","2"))
data$af_des.factor = factor(data$af_des,levels=c("1","2"))
data$af_int_libre.factor = factor(data$af_int_libre,levels=c("1","2"))
data$af_mod_libre.factor = factor(data$af_mod_libre,levels=c("1","2"))
data$actividad_fsica_complete.factor = factor(data$actividad_fsica_complete,levels=c("0","1","2"))
data$cfa_leche.factor = factor(data$cfa_leche,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_queso.factor = factor(data$cfa_queso,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_huevos.factor = factor(data$cfa_huevos,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_carne.factor = factor(data$cfa_carne,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_pollo.factor = factor(data$cfa_pollo,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_atun.factor = factor(data$cfa_atun,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_pescados.factor = factor(data$cfa_pescados,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_embutidos.factor = factor(data$cfa_embutidos,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_visceras_res.factor = factor(data$cfa_visceras_res,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_visceras_pollo.factor = factor(data$cfa_visceras_pollo,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_granos_secos.factor = factor(data$cfa_granos_secos,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_arroz.factor = factor(data$cfa_arroz,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_pan.factor = factor(data$cfa_pan,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_tuberculos.factor = factor(data$cfa_tuberculos,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_verdu_cocidas.factor = factor(data$cfa_verdu_cocidas,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_verdu_crudas.factor = factor(data$cfa_verdu_crudas,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_fru_jugo.factor = factor(data$cfa_fru_jugo,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_fru_ente.factor = factor(data$cfa_fru_ente,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_comida_rap.factor = factor(data$cfa_comida_rap,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_mantequilla.factor = factor(data$cfa_mantequilla,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_cafe.factor = factor(data$cfa_cafe,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_panela.factor = factor(data$cfa_panela,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_gaseosas.factor = factor(data$cfa_gaseosas,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_ali_paq.factor = factor(data$cfa_ali_paq,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_bienestarina.factor = factor(data$cfa_bienestarina,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_ali_fritos.factor = factor(data$cfa_ali_fritos,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_golosinas.factor = factor(data$cfa_golosinas,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_ali_light.factor = factor(data$cfa_ali_light,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_ali_integrales.factor = factor(data$cfa_ali_integrales,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_suplementos.factor = factor(data$cfa_suplementos,levels=c("1","2","3","4","5","6","7","8","9"))
data$cfa_ali_calle.factor = factor(data$cfa_ali_calle,levels=c("1","2","3","4","5","6","7","8","9"))
data$cuestionario_de_frecuencia_de_alimentos_complete.factor = factor(data$cuestionario_de_frecuencia_de_alimentos_complete,levels=c("0","1","2"))
data$exmen_fsico_complete.factor = factor(data$exmen_fsico_complete,levels=c("0","1","2"))
data$edta_tm.factor = factor(data$edta_tm,levels=c("1","2","3"))
data$seco_tm.factor = factor(data$seco_tm,levels=c("1","2","3"))
data$plasma_tm.factor = factor(data$plasma_tm,levels=c("1","2","3"))
data$suero_tm.factor = factor(data$suero_tm,levels=c("1","2","3"))
data$bf_tm.factor = factor(data$bf_tm,levels=c("1","2","3"))
data$adn_tm.factor = factor(data$adn_tm,levels=c("1","2","3"))
data$arn_tm.factor = factor(data$arn_tm,levels=c("1","2","3"))
data$toma_de_muestra_anlisis_bioqumicos_complete.factor = factor(data$toma_de_muestra_anlisis_bioqumicos_complete,levels=c("0","1","2"))
data$calidad.factor = factor(data$calidad,levels=c("1","2","3","4","5","6"))
data$interpretacion.factor = factor(data$interpretacion,levels=c("1","2","3","4","5","6","7","8"))
data$espirometra_complete.factor = factor(data$espirometra_complete,levels=c("0","1","2"))
data$i_m_carotidea.factor = factor(data$i_m_carotidea,levels=c("1","2","3","4","5"))
data$placas_atero.factor = factor(data$placas_atero,levels=c("1","0"))
data$a_vertebral.factor = factor(data$a_vertebral,levels=c("1","2","3","4","5"))
data$insuficiencia_vb.factor = factor(data$insuficiencia_vb,levels=c("1","0"))
data$eco_dopler_complete.factor = factor(data$eco_dopler_complete,levels=c("0","1","2"))
data$sil_pit.factor = factor(data$sil_pit,levels=c("1","2"))
data$sil_pit_1_1.factor = factor(data$sil_pit_1_1,levels=c("1","2"))
data$sil_pit_1_2.factor = factor(data$sil_pit_1_2,levels=c("1","2"))
data$sil_pit_1_4.factor = factor(data$sil_pit_1_4,levels=c("1","2","3"))
data$tirantez.factor = factor(data$tirantez,levels=c("1","2"))
data$falta_aire.factor = factor(data$falta_aire,levels=c("1","2"))
data$falt_aire.factor = factor(data$falt_aire,levels=c("1","2"))
data$falt_aire_ejer.factor = factor(data$falt_aire_ejer,levels=c("1","2"))
data$falt_aire_noche.factor = factor(data$falt_aire_noche,levels=c("1","2"))
data$ata_tos.factor = factor(data$ata_tos,levels=c("1","2"))
data$ata_tos_1_1.factor = factor(data$ata_tos_1_1,levels=c("1","3","4","5"))
data$ata_tos_3.factor = factor(data$ata_tos_3,levels=c("1","2"))
data$ata_tos_4.factor = factor(data$ata_tos_4,levels=c("1","2"))
data$ata_tos_4_1.factor = factor(data$ata_tos_4_1,levels=c("1","2"))
data$esputos.factor = factor(data$esputos,levels=c("1","2"))
data$esputos_2.factor = factor(data$esputos_2,levels=c("1","2"))
data$esputos_2_1.factor = factor(data$esputos_2_1,levels=c("1","2"))
data$sin_res_peor.factor = factor(data$sin_res_peor,levels=c("1","2"))
data$resp.factor = factor(data$resp,levels=c("1","2","3","4"))
data$dif_cam.factor = factor(data$dif_cam,levels=c("1","2"))
data$falt_aire_cam.factor = factor(data$falt_aire_cam,levels=c("1","2"))
data$falt_aire_cam_2.factor = factor(data$falt_aire_cam_2,levels=c("1","2"))
data$falt_aire_cam_3.factor = factor(data$falt_aire_cam_3,levels=c("1","2"))
data$falt_aire_cam_5.factor = factor(data$falt_aire_cam_5,levels=c("1","2"))
data$falt_aire_cam_6.factor = factor(data$falt_aire_cam_6,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$asma.factor = factor(data$asma,levels=c("1","2"))
data$asma_1_1.factor = factor(data$asma_1_1,levels=c("1","2"))
data$asma_1_5___1.factor = factor(data$asma_1_5___1,levels=c("0","1"))
data$asma_1_5___2.factor = factor(data$asma_1_5___2,levels=c("0","1"))
data$asma_1_5___3.factor = factor(data$asma_1_5___3,levels=c("0","1"))
data$asma_1_5___4.factor = factor(data$asma_1_5___4,levels=c("0","1"))
data$asma_1_5___5.factor = factor(data$asma_1_5___5,levels=c("0","1"))
data$asma_1_5___6.factor = factor(data$asma_1_5___6,levels=c("0","1"))
data$asma_1_5___7.factor = factor(data$asma_1_5___7,levels=c("0","1"))
data$asma_1_6.factor = factor(data$asma_1_6,levels=c("1","2"))
data$asma_1_9.factor = factor(data$asma_1_9,levels=c("1","2","3","4","5"))
data$asma_1_10.factor = factor(data$asma_1_10,levels=c("1","2","3","4","5"))
data$asma_1_11.factor = factor(data$asma_1_11,levels=c("1","2"))
data$asma_1_12.factor = factor(data$asma_1_12,levels=c("1","2"))
data$bronq_cro.factor = factor(data$bronq_cro,levels=c("1","2"))
data$epoc.factor = factor(data$epoc,levels=c("1","2"))
data$enfisema.factor = factor(data$enfisema,levels=c("1","2"))
data$otra_enf_pulm.factor = factor(data$otra_enf_pulm,levels=c("1","2"))
data$otra_enf_pulm_op___1.factor = factor(data$otra_enf_pulm_op___1,levels=c("0","1"))
data$otra_enf_pulm_op___2.factor = factor(data$otra_enf_pulm_op___2,levels=c("0","1"))
data$otra_enf_pulm_op___3.factor = factor(data$otra_enf_pulm_op___3,levels=c("0","1"))
data$otra_enf_pulm_op___4.factor = factor(data$otra_enf_pulm_op___4,levels=c("0","1"))
data$otra_enf_pulm_op___5.factor = factor(data$otra_enf_pulm_op___5,levels=c("0","1"))
data$otra_enf_pulm_op___6.factor = factor(data$otra_enf_pulm_op___6,levels=c("0","1"))
data$otra_enf_pulm_op___7.factor = factor(data$otra_enf_pulm_op___7,levels=c("0","1"))
data$rinitis.factor = factor(data$rinitis,levels=c("1","2"))
data$estornudos.factor = factor(data$estornudos,levels=c("1","2"))
data$estornudos_1_1.factor = factor(data$estornudos_1_1,levels=c("1","2"))
data$estornudos_1_2.factor = factor(data$estornudos_1_2,levels=c("1","2"))
data$estornudos_1_3___1.factor = factor(data$estornudos_1_3___1,levels=c("0","1"))
data$estornudos_1_3___2.factor = factor(data$estornudos_1_3___2,levels=c("0","1"))
data$estornudos_1_3___3.factor = factor(data$estornudos_1_3___3,levels=c("0","1"))
data$estornudos_1_3___4.factor = factor(data$estornudos_1_3___4,levels=c("0","1"))
data$estornudos_1_3___5.factor = factor(data$estornudos_1_3___5,levels=c("0","1"))
data$estornudos_1_3___6.factor = factor(data$estornudos_1_3___6,levels=c("0","1"))
data$estornudos_1_3___7.factor = factor(data$estornudos_1_3___7,levels=c("0","1"))
data$estornudos_1_4.factor = factor(data$estornudos_1_4,levels=c("1","2"))
data$estornudos_1_5.factor = factor(data$estornudos_1_5,levels=c("1","2"))
data$moq_nariz.factor = factor(data$moq_nariz,levels=c("1","2","3","4"))
data$nariz_tapada.factor = factor(data$nariz_tapada,levels=c("1","2","3","4"))
data$picor_nariz.factor = factor(data$picor_nariz,levels=c("1","2","3","4"))
data$estornudos_2.factor = factor(data$estornudos_2,levels=c("1","2","3","4"))
data$ojos_llorosos.factor = factor(data$ojos_llorosos,levels=c("1","2","3","4"))
data$tras_nas.factor = factor(data$tras_nas,levels=c("1","2"))
data$tras_nas_1_1.factor = factor(data$tras_nas_1_1,levels=c("1","2"))
data$tras_nas_1_2.factor = factor(data$tras_nas_1_2,levels=c("1","2"))
data$nar_tap.factor = factor(data$nar_tap,levels=c("1","2"))
data$pre_fre.factor = factor(data$pre_fre,levels=c("1","2"))
data$mucosidad.factor = factor(data$mucosidad,levels=c("1","2"))
data$olfato.factor = factor(data$olfato,levels=c("1","2"))
data$sinusitis.factor = factor(data$sinusitis,levels=c("1","2"))
data$sinusitis_1_1.factor = factor(data$sinusitis_1_1,levels=c("1","2"))
data$eczema.factor = factor(data$eczema,levels=c("1","2"))
data$eczema_1_2.factor = factor(data$eczema_1_2,levels=c("1","2"))
data$eczema_1_3.factor = factor(data$eczema_1_3,levels=c("1","2"))
data$sarpullidos.factor = factor(data$sarpullidos,levels=c("1","2"))
data$erupcion.factor = factor(data$erupcion,levels=c("1","2"))
data$erupcion_1_1.factor = factor(data$erupcion_1_1,levels=c("1","2"))
data$erupcion_1_2.factor = factor(data$erupcion_1_2,levels=c("1","2"))
data$expo_trab2.factor = factor(data$expo_trab2,levels=c("1","2"))
data$expo_trab1.factor = factor(data$expo_trab1,levels=c("1","2"))
data$expo_trab1_1.factor = factor(data$expo_trab1_1,levels=c("1","2"))
data$expo_trab1_1_1___1.factor = factor(data$expo_trab1_1_1___1,levels=c("0","1"))
data$expo_trab1_1_1___3.factor = factor(data$expo_trab1_1_1___3,levels=c("0","1"))
data$expo_trab1_1_1___4.factor = factor(data$expo_trab1_1_1___4,levels=c("0","1"))
data$expo_trab1_1_1___5.factor = factor(data$expo_trab1_1_1___5,levels=c("0","1"))
data$expo_trab1_1_1___6.factor = factor(data$expo_trab1_1_1___6,levels=c("0","1"))
data$expo_trab1_1_1___7.factor = factor(data$expo_trab1_1_1___7,levels=c("0","1"))
data$expo_trab1_1_2.factor = factor(data$expo_trab1_1_2,levels=c("1","2"))
data$humed_trab1.factor = factor(data$humed_trab1,levels=c("1","2"))
data$moho_trab1.factor = factor(data$moho_trab1,levels=c("1","2"))
data$moho_alim_trab1.factor = factor(data$moho_alim_trab1,levels=c("1","2"))
data$pro_lim_trab1.factor = factor(data$pro_lim_trab1,levels=c("1","2"))
data$pro_lim_trab1_1.factor = factor(data$pro_lim_trab1_1,levels=c(""))
data$hipoclorito_1.factor = factor(data$hipoclorito_1,levels=c("1","2","3","4"))
data$amoniaco_1.factor = factor(data$amoniaco_1,levels=c("1","2","3","4"))
data$quitamanchas_1.factor = factor(data$quitamanchas_1,levels=c("1","2","3","4"))
data$acidos_1.factor = factor(data$acidos_1,levels=c("1","2","3","4"))
data$ceras_suelos_1.factor = factor(data$ceras_suelos_1,levels=c("1","2","3","4"))
data$ceras_muebles_1.factor = factor(data$ceras_muebles_1,levels=c("1","2","3","4"))
data$sprays_suelos_1.factor = factor(data$sprays_suelos_1,levels=c("1","2","3","4"))
data$sprays_muebles_1.factor = factor(data$sprays_muebles_1,levels=c("1","2","3","4"))
data$detergentes_1.factor = factor(data$detergentes_1,levels=c("1","2","3","4"))
data$sprays_cristales_1.factor = factor(data$sprays_cristales_1,levels=c("1","2","3","4"))
data$alcohol_1.factor = factor(data$alcohol_1,levels=c("1","2","3","4"))
data$jabones_1.factor = factor(data$jabones_1,levels=c("1","2","3","4"))
data$otro_desinfectante_1.factor = factor(data$otro_desinfectante_1,levels=c("1","2","3","4"))
data$sprays_desengrasantes_1.factor = factor(data$sprays_desengrasantes_1,levels=c("1","2","3","4"))
data$expo.factor = factor(data$expo,levels=c("1","2"))
data$expo_2_1.factor = factor(data$expo_2_1,levels=c("1","2","5","6"))
data$expo_2_2.factor = factor(data$expo_2_2,levels=c("1","2","3","4"))
data$expo_2_3.factor = factor(data$expo_2_3,levels=c("1","2"))
data$expo_2_4_1.factor = factor(data$expo_2_4_1,levels=c("1","2"))
data$vivienda.factor = factor(data$vivienda,levels=c("1","2","3","4","5","6"))
data$air_acon.factor = factor(data$air_acon,levels=c("1","2"))
data$combus_cocinar___1.factor = factor(data$combus_cocinar___1,levels=c("0","1"))
data$combus_cocinar___2.factor = factor(data$combus_cocinar___2,levels=c("0","1"))
data$combus_cocinar___3.factor = factor(data$combus_cocinar___3,levels=c("0","1"))
data$combus_cocinar___4.factor = factor(data$combus_cocinar___4,levels=c("0","1"))
data$combus_cocinar___5.factor = factor(data$combus_cocinar___5,levels=c("0","1"))
data$combus_cocinar___6.factor = factor(data$combus_cocinar___6,levels=c("0","1"))
data$combus_cocinar___7.factor = factor(data$combus_cocinar___7,levels=c("0","1"))
data$cocina.factor = factor(data$cocina,levels=c("1","2"))
data$cocinar_ventana.factor = factor(data$cocinar_ventana,levels=c("1","2","3","4","5"))
data$extractor.factor = factor(data$extractor,levels=c("1","2"))
data$extrator_1_1.factor = factor(data$extrator_1_1,levels=c("1","2","3"))
data$goteras.factor = factor(data$goteras,levels=c("1","2","3"))
data$goteras_1.factor = factor(data$goteras_1,levels=c("1","2","3"))
data$manchas.factor = factor(data$manchas,levels=c("1","2"))
data$moho_manchas_casa.factor = factor(data$moho_manchas_casa,levels=c("1","2"))
data$moho_casa.factor = factor(data$moho_casa,levels=c("1","2","3"))
data$moho_lugar___1.factor = factor(data$moho_lugar___1,levels=c("0","1"))
data$moho_lugar___2.factor = factor(data$moho_lugar___2,levels=c("0","1"))
data$moho_lugar___3.factor = factor(data$moho_lugar___3,levels=c("0","1"))
data$moho_lugar___4.factor = factor(data$moho_lugar___4,levels=c("0","1"))
data$moho_lugar___5.factor = factor(data$moho_lugar___5,levels=c("0","1"))
data$moho_lugar___6.factor = factor(data$moho_lugar___6,levels=c("0","1"))
data$moho_casa_2.factor = factor(data$moho_casa_2,levels=c("1","2"))
data$moho_casa_4___1.factor = factor(data$moho_casa_4___1,levels=c("0","1"))
data$moho_casa_4___2.factor = factor(data$moho_casa_4___2,levels=c("0","1"))
data$moho_casa_4___4.factor = factor(data$moho_casa_4___4,levels=c("0","1"))
data$moho_casa_4___5.factor = factor(data$moho_casa_4___5,levels=c("0","1"))
data$moho_casa_4___6.factor = factor(data$moho_casa_4___6,levels=c("0","1"))
data$moho_casa_5.factor = factor(data$moho_casa_5,levels=c("1","2","3","4"))
data$moho_dormi_1___1.factor = factor(data$moho_dormi_1___1,levels=c("0","1"))
data$moho_dormi_1___2.factor = factor(data$moho_dormi_1___2,levels=c("0","1"))
data$moho_dormi_1___4.factor = factor(data$moho_dormi_1___4,levels=c("0","1"))
data$moho_dormi_1___5.factor = factor(data$moho_dormi_1___5,levels=c("0","1"))
data$moho_dormi_1___6.factor = factor(data$moho_dormi_1___6,levels=c("0","1"))
data$hab_uso.factor = factor(data$hab_uso,levels=c("1","2","3","4"))
data$ventanas_2.factor = factor(data$ventanas_2,levels=c("1","2","3"))
data$gato_1.factor = factor(data$gato_1,levels=c("1","2"))
data$gato_2.factor = factor(data$gato_2,levels=c("1","2"))
data$perro.factor = factor(data$perro,levels=c("1","2"))
data$perro_1.factor = factor(data$perro_1,levels=c("1","2"))
data$perro_2.factor = factor(data$perro_2,levels=c("1","2"))
data$pajaro.factor = factor(data$pajaro,levels=c("1","2"))
data$pajaro_1.factor = factor(data$pajaro_1,levels=c("1","2"))
data$limpieza.factor = factor(data$limpieza,levels=c("1","2","3","4"))
data$hipoclorito_2.factor = factor(data$hipoclorito_2,levels=c("1","2","3","4"))
data$amoniaco_2.factor = factor(data$amoniaco_2,levels=c("1","2","3","4"))
data$quitamanchas_2.factor = factor(data$quitamanchas_2,levels=c("1","2","3","4"))
data$acidos_2.factor = factor(data$acidos_2,levels=c("1","2","3","4"))
data$ceras_suelos_2.factor = factor(data$ceras_suelos_2,levels=c("1","2","3","4"))
data$ceras_muebles_2.factor = factor(data$ceras_muebles_2,levels=c("1","2","3","4"))
data$sprays_suelos_2.factor = factor(data$sprays_suelos_2,levels=c("1","2","3","4"))
data$sprays_muebles_2.factor = factor(data$sprays_muebles_2,levels=c("1","2","3","4"))
data$sprays_desengrasantes_2.factor = factor(data$sprays_desengrasantes_2,levels=c("1","2","3","4"))
data$detergentes_2.factor = factor(data$detergentes_2,levels=c("1","2","3","4"))
data$alcohol_2.factor = factor(data$alcohol_2,levels=c("1","2","3","4"))
data$sprays_cristales_2.factor = factor(data$sprays_cristales_2,levels=c("1","2","3","4"))
data$jabones_2.factor = factor(data$jabones_2,levels=c("1","2","3","4"))
data$otro_desinfectante_2.factor = factor(data$otro_desinfectante_2,levels=c("1","2","3","4"))
data$productos_casa_2.factor = factor(data$productos_casa_2,levels=c("1","2","3","4"))
data$productos_casa_3.factor = factor(data$productos_casa_3,levels=c("1","2","3","4"))
data$productos_casa_4.factor = factor(data$productos_casa_4,levels=c("1","2","3","4"))
data$insecticidas_1.factor = factor(data$insecticidas_1,levels=c("1","2","3","4"))
data$insecticidas_2.factor = factor(data$insecticidas_2,levels=c("1","2","3","4"))
data$insecticidas_3.factor = factor(data$insecticidas_3,levels=c("1","2","3","4"))
data$enfer_alime.factor = factor(data$enfer_alime,levels=c("1","2"))
data$enfer_alime_siem.factor = factor(data$enfer_alime_siem,levels=c("1","2"))
data$alime___1.factor = factor(data$alime___1,levels=c("0","1"))
data$alime___2.factor = factor(data$alime___2,levels=c("0","1"))
data$alime___3.factor = factor(data$alime___3,levels=c("0","1"))
data$alime___4.factor = factor(data$alime___4,levels=c("0","1"))
data$alime___5.factor = factor(data$alime___5,levels=c("0","1"))
data$alime___6.factor = factor(data$alime___6,levels=c("0","1"))
data$alime___7.factor = factor(data$alime___7,levels=c("0","1"))
data$alime___8.factor = factor(data$alime___8,levels=c("0","1"))
data$alime___9.factor = factor(data$alime___9,levels=c("0","1"))
data$alime___10.factor = factor(data$alime___10,levels=c("0","1"))
data$alime___11.factor = factor(data$alime___11,levels=c("0","1"))
data$alime___12.factor = factor(data$alime___12,levels=c("0","1"))
data$alime___13.factor = factor(data$alime___13,levels=c("0","1"))
data$alime___14.factor = factor(data$alime___14,levels=c("0","1"))
data$alime___15.factor = factor(data$alime___15,levels=c("0","1"))
data$alime___16.factor = factor(data$alime___16,levels=c("0","1"))
data$alime___17.factor = factor(data$alime___17,levels=c("0","1"))
data$alime___18.factor = factor(data$alime___18,levels=c("0","1"))
data$alime___19.factor = factor(data$alime___19,levels=c("0","1"))
data$alime___20.factor = factor(data$alime___20,levels=c("0","1"))
data$alime___21.factor = factor(data$alime___21,levels=c("0","1"))
data$alime___22.factor = factor(data$alime___22,levels=c("0","1"))
data$alime___23.factor = factor(data$alime___23,levels=c("0","1"))
data$alime___24.factor = factor(data$alime___24,levels=c("0","1"))
data$alime___26.factor = factor(data$alime___26,levels=c("0","1"))
data$alime___27.factor = factor(data$alime___27,levels=c("0","1"))
data$alime___28.factor = factor(data$alime___28,levels=c("0","1"))
data$enro_alime_otro_1.factor = factor(data$enro_alime_otro_1,levels=c("1","2"))
data$vomi_alime_otro_1.factor = factor(data$vomi_alime_otro_1,levels=c("1","2"))
data$tapa_alime_otro_1.factor = factor(data$tapa_alime_otro_1,levels=c("1","2"))
data$dol_cab_alime_otro_1.factor = factor(data$dol_cab_alime_otro_1,levels=c("1","2"))
data$alien_alime_otro_1.factor = factor(data$alien_alime_otro_1,levels=c("1","2"))
data$picor_alime_otro_1.factor = factor(data$picor_alime_otro_1,levels=c("1","2"))
data$dif_tra_alime_otro_1.factor = factor(data$dif_tra_alime_otro_1,levels=c("1","2"))
data$desma_alime_otro_1.factor = factor(data$desma_alime_otro_1,levels=c("1","2"))
data$inye_alime_otro_1.factor = factor(data$inye_alime_otro_1,levels=c("1","2"))
data$otro_alime_otro_1.factor = factor(data$otro_alime_otro_1,levels=c("1","2"))
data$tiemp_alime_otro_1.factor = factor(data$tiemp_alime_otro_1,levels=c("1","3","4","5","6"))
data$enro_alime_otro_2.factor = factor(data$enro_alime_otro_2,levels=c("1","2"))
data$vomi_alime_otro_2.factor = factor(data$vomi_alime_otro_2,levels=c("1","2"))
data$picor_alime_otro_2.factor = factor(data$picor_alime_otro_2,levels=c("1","2"))
data$dif_tra_alime_otro_2.factor = factor(data$dif_tra_alime_otro_2,levels=c("1","2"))
data$desma_alime_otro_2.factor = factor(data$desma_alime_otro_2,levels=c("1","2"))
data$inye_alime_otro_2.factor = factor(data$inye_alime_otro_2,levels=c("1","2"))
data$otro_alime_otro_2.factor = factor(data$otro_alime_otro_2,levels=c("1","2"))
data$tiemp_alime_otro_2.factor = factor(data$tiemp_alime_otro_2,levels=c("1","3","4","5","6"))
data$enro_alime_otro_3.factor = factor(data$enro_alime_otro_3,levels=c("1","2"))
data$vomi_alime_otro_3.factor = factor(data$vomi_alime_otro_3,levels=c("1","2"))
data$picor_alime_otro_3.factor = factor(data$picor_alime_otro_3,levels=c("1","2"))
data$dif_tra_alime_otro_3.factor = factor(data$dif_tra_alime_otro_3,levels=c("1","2"))
data$desma_alime_otro_3.factor = factor(data$desma_alime_otro_3,levels=c("1","2"))
data$inye_alime_otro_3.factor = factor(data$inye_alime_otro_3,levels=c("1","2"))
data$otro_alime_otro_3.factor = factor(data$otro_alime_otro_3,levels=c("1","2"))
data$tiemp_alime_otro_3.factor = factor(data$tiemp_alime_otro_3,levels=c("1","3","4","5","6"))
data$tos_anim.factor = factor(data$tos_anim,levels=c("1","2"))
data$tos_anim_op___1.factor = factor(data$tos_anim_op___1,levels=c("0","1"))
data$tos_anim_op___2.factor = factor(data$tos_anim_op___2,levels=c("0","1"))
data$tos_anim_op___3.factor = factor(data$tos_anim_op___3,levels=c("0","1"))
data$tos_anim_op___4.factor = factor(data$tos_anim_op___4,levels=c("0","1"))
data$sil_anim.factor = factor(data$sil_anim,levels=c("1","2"))
data$sil_anim_op___1.factor = factor(data$sil_anim_op___1,levels=c("0","1"))
data$sil_anim_op___2.factor = factor(data$sil_anim_op___2,levels=c("0","1"))
data$sil_anim_op___3.factor = factor(data$sil_anim_op___3,levels=c("0","1"))
data$sil_anim_op___4.factor = factor(data$sil_anim_op___4,levels=c("0","1"))
data$opre_anim.factor = factor(data$opre_anim,levels=c("1","2"))
data$opre_anim_op___1.factor = factor(data$opre_anim_op___1,levels=c("0","1"))
data$opre_anim_op___2.factor = factor(data$opre_anim_op___2,levels=c("0","1"))
data$opre_anim_op___3.factor = factor(data$opre_anim_op___3,levels=c("0","1"))
data$opre_anim_op___4.factor = factor(data$opre_anim_op___4,levels=c("0","1"))
data$falt_aire_anim.factor = factor(data$falt_aire_anim,levels=c("1","2"))
data$falta_aire_anim_op___1.factor = factor(data$falta_aire_anim_op___1,levels=c("0","1"))
data$falta_aire_anim_op___2.factor = factor(data$falta_aire_anim_op___2,levels=c("0","1"))
data$falta_aire_anim_op___3.factor = factor(data$falta_aire_anim_op___3,levels=c("0","1"))
data$falta_aire_anim_op___4.factor = factor(data$falta_aire_anim_op___4,levels=c("0","1"))
data$nariz_anim.factor = factor(data$nariz_anim,levels=c("1","2"))
data$nariz_anim_op___1.factor = factor(data$nariz_anim_op___1,levels=c("0","1"))
data$nariz_anim_op___2.factor = factor(data$nariz_anim_op___2,levels=c("0","1"))
data$nariz_anim_op___3.factor = factor(data$nariz_anim_op___3,levels=c("0","1"))
data$nariz_anim_op___4.factor = factor(data$nariz_anim_op___4,levels=c("0","1"))
data$ojos_anim.factor = factor(data$ojos_anim,levels=c("1","2"))
data$ojos_anim_op___1.factor = factor(data$ojos_anim_op___1,levels=c("0","1"))
data$ojos_anim_op___2.factor = factor(data$ojos_anim_op___2,levels=c("0","1"))
data$ojos_anim_op___3.factor = factor(data$ojos_anim_op___3,levels=c("0","1"))
data$ojos_anim_op___4.factor = factor(data$ojos_anim_op___4,levels=c("0","1"))
data$tos_2.factor = factor(data$tos_2,levels=c("1","2"))
data$sil_2.factor = factor(data$sil_2,levels=c("1","2"))
data$opre_2.factor = factor(data$opre_2,levels=c("1","2"))
data$falt_aire_2.factor = factor(data$falt_aire_2,levels=c("1","2"))
data$nariz_2.factor = factor(data$nariz_2,levels=c("1","2"))
data$ojos_2.factor = factor(data$ojos_2,levels=c("1","2"))
data$tos_3.factor = factor(data$tos_3,levels=c("1","2"))
data$sil_3.factor = factor(data$sil_3,levels=c("1","2"))
data$opre_3.factor = factor(data$opre_3,levels=c("1","2"))
data$falt_aire_3.factor = factor(data$falt_aire_3,levels=c("1","2"))
data$nariz_3.factor = factor(data$nariz_3,levels=c("1","2"))
data$ojos_3.factor = factor(data$ojos_3,levels=c("1","2"))
data$med_inha.factor = factor(data$med_inha,levels=c("1","2"))
data$ago_beta2.factor = factor(data$ago_beta2,levels=c("1","2"))
data$ago_beta2_corta_1.factor = factor(data$ago_beta2_corta_1,levels=c("1","2","3","4"))
data$ago_beta2_corta_2.factor = factor(data$ago_beta2_corta_2,levels=c("1","2","3","4"))
data$ago_beta2_corta_3.factor = factor(data$ago_beta2_corta_3,levels=c("1","2","3","4"))
data$ago_beta2_corta_4.factor = factor(data$ago_beta2_corta_4,levels=c("1","2","3","4"))
data$ago_beta2_fr_1.factor = factor(data$ago_beta2_fr_1,levels=c("1","2","3","4"))
data$ago_beta2_fr_2.factor = factor(data$ago_beta2_fr_2,levels=c("1","2","3","4"))
data$ago_beta2_fr_3.factor = factor(data$ago_beta2_fr_3,levels=c("1","2","3","4"))
data$ago_beta2_fr_4.factor = factor(data$ago_beta2_fr_4,levels=c("1","2","3","4"))
data$ago_beta2_pro.factor = factor(data$ago_beta2_pro,levels=c("1","2"))
data$ago_beta2_pro_1.factor = factor(data$ago_beta2_pro_1,levels=c("1","2"))
data$ago_beta2_pro_2.factor = factor(data$ago_beta2_pro_2,levels=c("1","2"))
data$ago_beta2_fr_5.factor = factor(data$ago_beta2_fr_5,levels=c("1","2","3","4"))
data$ago_beta2_fr_6.factor = factor(data$ago_beta2_fr_6,levels=c("1","2","3","4"))
data$antimus_cort.factor = factor(data$antimus_cort,levels=c("1","2"))
data$antimus_corta_1.factor = factor(data$antimus_corta_1,levels=c("1"))
data$antimus_fr_1.factor = factor(data$antimus_fr_1,levels=c("1","2","3","4"))
data$antimus_pro.factor = factor(data$antimus_pro,levels=c("1","2"))
data$antimus_pro_1.factor = factor(data$antimus_pro_1,levels=c("1","2"))
data$antimus_pro_2.factor = factor(data$antimus_pro_2,levels=c("1","2"))
data$antimus_fr_2.factor = factor(data$antimus_fr_2,levels=c("1","2","3","4"))
data$antimus_fr_3.factor = factor(data$antimus_fr_3,levels=c("1","2","3","4"))
data$este_inha.factor = factor(data$este_inha,levels=c("1","2"))
data$este_inha_1.factor = factor(data$este_inha_1,levels=c("1","2","3","4","5","6"))
data$este_inha_2.factor = factor(data$este_inha_2,levels=c("1","2","3","4","5","6"))
data$este_inha_3.factor = factor(data$este_inha_3,levels=c("1","2","3","4","5","6"))
data$este_inha_4.factor = factor(data$este_inha_4,levels=c("1","2","3","4","5","6"))
data$este_inha_5.factor = factor(data$este_inha_5,levels=c("1","2","3","4","5","6"))
data$este_inha_6.factor = factor(data$este_inha_6,levels=c("1","2","3","4","5","6"))
data$este_fr_1.factor = factor(data$este_fr_1,levels=c("1","2","3","4"))
data$este_fr_2.factor = factor(data$este_fr_2,levels=c("1","2","3","4"))
data$este_fr_3.factor = factor(data$este_fr_3,levels=c("1","2","3","4"))
data$este_fr_4.factor = factor(data$este_fr_4,levels=c("1","2","3","4"))
data$este_fr_5.factor = factor(data$este_fr_5,levels=c("1","2","3","4"))
data$este_fr_6.factor = factor(data$este_fr_6,levels=c("1","2","3","4"))
data$combi_inha.factor = factor(data$combi_inha,levels=c("1","2"))
data$combi_inha_op___7.factor = factor(data$combi_inha_op___7,levels=c("0","1"))
data$combi_inha_op___8.factor = factor(data$combi_inha_op___8,levels=c("0","1"))
data$combi_inha_op___9.factor = factor(data$combi_inha_op___9,levels=c("0","1"))
data$combi_inha_op___10.factor = factor(data$combi_inha_op___10,levels=c("0","1"))
data$combi_inha_op___11.factor = factor(data$combi_inha_op___11,levels=c("0","1"))
data$combi_inha_op___1.factor = factor(data$combi_inha_op___1,levels=c("0","1"))
data$combi_inha_op___2.factor = factor(data$combi_inha_op___2,levels=c("0","1"))
data$combi_inha_op___3.factor = factor(data$combi_inha_op___3,levels=c("0","1"))
data$combi_inha_op___4.factor = factor(data$combi_inha_op___4,levels=c("0","1"))
data$combi_inha_op___5.factor = factor(data$combi_inha_op___5,levels=c("0","1"))
data$combi_inha_op___6.factor = factor(data$combi_inha_op___6,levels=c("0","1"))
data$combi_inha_1.factor = factor(data$combi_inha_1,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_2.factor = factor(data$combi_inha_2,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_3.factor = factor(data$combi_inha_3,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_4.factor = factor(data$combi_inha_4,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_5.factor = factor(data$combi_inha_5,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_6.factor = factor(data$combi_inha_6,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_7.factor = factor(data$combi_inha_7,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_8.factor = factor(data$combi_inha_8,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_9.factor = factor(data$combi_inha_9,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_10.factor = factor(data$combi_inha_10,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_inha_11.factor = factor(data$combi_inha_11,levels=c("7","8","9","10","11","1","2","3","4","5","6"))
data$combi_fr_1.factor = factor(data$combi_fr_1,levels=c("1","2","3","4"))
data$combi_fr_2.factor = factor(data$combi_fr_2,levels=c("1","2","3","4"))
data$combi_fr_3.factor = factor(data$combi_fr_3,levels=c("1","2","3","4"))
data$combi_fr_4.factor = factor(data$combi_fr_4,levels=c("1","2","3","4"))
data$combi_fr_5.factor = factor(data$combi_fr_5,levels=c("1","2","3","4"))
data$combi_fr_6.factor = factor(data$combi_fr_6,levels=c("1","2","3","4"))
data$combi_fr_7.factor = factor(data$combi_fr_7,levels=c("1","2","3","4"))
data$combi_fr_8.factor = factor(data$combi_fr_8,levels=c("1","2","3","4"))
data$combi_fr_9.factor = factor(data$combi_fr_9,levels=c("1","2","3","4"))
data$combi_fr_10.factor = factor(data$combi_fr_10,levels=c("1","2","3","4"))
data$combi_fr_11.factor = factor(data$combi_fr_11,levels=c("1","2","3","4"))
data$med_oral.factor = factor(data$med_oral,levels=c("1","2"))
data$este_oral.factor = factor(data$este_oral,levels=c("1","2"))
data$este_oral_cual_1.factor = factor(data$este_oral_cual_1,levels=c("1","2","3","4","5","6"))
data$este_oral_cual_2.factor = factor(data$este_oral_cual_2,levels=c("1","2","3","4","5","6"))
data$este_oral_cual_3.factor = factor(data$este_oral_cual_3,levels=c("1","2","3","4","5","6"))
data$este_oral_cual_4.factor = factor(data$este_oral_cual_4,levels=c("1","2","3","4","5","6"))
data$este_oral_cual_5.factor = factor(data$este_oral_cual_5,levels=c("1","2","3","4","5","6"))
data$este_oral_cual_6.factor = factor(data$este_oral_cual_6,levels=c("1","2","3","4","5","6"))
data$antibi.factor = factor(data$antibi,levels=c("1","2"))
data$antibi_2.factor = factor(data$antibi_2,levels=c("1","2"))
data$remedio.factor = factor(data$remedio,levels=c("1","2"))
data$remedio_op___1.factor = factor(data$remedio_op___1,levels=c("0","1"))
data$remedio_op___2.factor = factor(data$remedio_op___2,levels=c("0","1"))
data$remedio_op___3.factor = factor(data$remedio_op___3,levels=c("0","1"))
data$remedio_op___4.factor = factor(data$remedio_op___4,levels=c("0","1"))
data$remedio_op___5.factor = factor(data$remedio_op___5,levels=c("0","1"))
data$remedio_op___6.factor = factor(data$remedio_op___6,levels=c("0","1"))
data$remedio_op___7.factor = factor(data$remedio_op___7,levels=c("0","1"))
data$remedio_op___8.factor = factor(data$remedio_op___8,levels=c("0","1"))
data$remedio_op___9.factor = factor(data$remedio_op___9,levels=c("0","1"))
data$remedio_op___10.factor = factor(data$remedio_op___10,levels=c("0","1"))
data$remedio_op___11.factor = factor(data$remedio_op___11,levels=c("0","1"))
data$remedio_op___12.factor = factor(data$remedio_op___12,levels=c("0","1"))
data$remedio_op___13.factor = factor(data$remedio_op___13,levels=c("0","1"))
data$receta_med.factor = factor(data$receta_med,levels=c("1","2"))
data$receta_med_2.factor = factor(data$receta_med_2,levels=c("1","3","4","5"))
data$receta_med_3.factor = factor(data$receta_med_3,levels=c("1","3","4","5"))
data$receta_med_4.factor = factor(data$receta_med_4,levels=c("1","2"))
data$receta_med_5.factor = factor(data$receta_med_5,levels=c("1","2"))
data$med_otras.factor = factor(data$med_otras,levels=c("1","2"))
data$acetaminofen.factor = factor(data$acetaminofen,levels=c("1","2","3","4","5"))
data$acetaminofen_2___1.factor = factor(data$acetaminofen_2___1,levels=c("0","1"))
data$acetaminofen_2___2.factor = factor(data$acetaminofen_2___2,levels=c("0","1"))
data$acetaminofen_2___3.factor = factor(data$acetaminofen_2___3,levels=c("0","1"))
data$acetaminofen_2___4.factor = factor(data$acetaminofen_2___4,levels=c("0","1"))
data$acetaminofen_2___6.factor = factor(data$acetaminofen_2___6,levels=c("0","1"))
data$acetaminofen_2___5.factor = factor(data$acetaminofen_2___5,levels=c("0","1"))
data$analgesico.factor = factor(data$analgesico,levels=c("1","2","3","4","5"))
data$analgesico_3___1.factor = factor(data$analgesico_3___1,levels=c("0","1"))
data$analgesico_3___2.factor = factor(data$analgesico_3___2,levels=c("0","1"))
data$analgesico_3___3.factor = factor(data$analgesico_3___3,levels=c("0","1"))
data$analgesico_3___4.factor = factor(data$analgesico_3___4,levels=c("0","1"))
data$analgesico_2___1.factor = factor(data$analgesico_2___1,levels=c("0","1"))
data$analgesico_2___2.factor = factor(data$analgesico_2___2,levels=c("0","1"))
data$analgesico_2___3.factor = factor(data$analgesico_2___3,levels=c("0","1"))
data$analgesico_2___4.factor = factor(data$analgesico_2___4,levels=c("0","1"))
data$analgesico_2___6.factor = factor(data$analgesico_2___6,levels=c("0","1"))
data$analgesico_2___5.factor = factor(data$analgesico_2___5,levels=c("0","1"))
data$desensibili.factor = factor(data$desensibili,levels=c("1","2"))
data$tto_desensibili___1.factor = factor(data$tto_desensibili___1,levels=c("0","1"))
data$tto_desensibili___2.factor = factor(data$tto_desensibili___2,levels=c("0","1"))
data$tto_desensibili___3.factor = factor(data$tto_desensibili___3,levels=c("0","1"))
data$tto_desensibili___4.factor = factor(data$tto_desensibili___4,levels=c("0","1"))
data$tto_desensibili___5.factor = factor(data$tto_desensibili___5,levels=c("0","1"))
data$desensibili_1.factor = factor(data$desensibili_1,levels=c("1","2"))
data$gripe.factor = factor(data$gripe,levels=c("1","2"))
data$gripe_2.factor = factor(data$gripe_2,levels=c("1","2"))
data$neumo.factor = factor(data$neumo,levels=c("1","2","3"))
data$covid.factor = factor(data$covid,levels=c("1","2","3"))
data$covid_exa.factor = factor(data$covid_exa,levels=c("1","2"))
data$covid_3___1.factor = factor(data$covid_3___1,levels=c("0","1"))
data$covid_3___2.factor = factor(data$covid_3___2,levels=c("0","1"))
data$covid_3___3.factor = factor(data$covid_3___3,levels=c("0","1"))
data$covid_3___4.factor = factor(data$covid_3___4,levels=c("0","1"))
data$covid_3___5.factor = factor(data$covid_3___5,levels=c("0","1"))
data$covid_3___6.factor = factor(data$covid_3___6,levels=c("0","1"))
data$covid_3___7.factor = factor(data$covid_3___7,levels=c("0","1"))
data$covid_3___8.factor = factor(data$covid_3___8,levels=c("0","1"))
data$covid_4.factor = factor(data$covid_4,levels=c("1","2"))
data$covid_5.factor = factor(data$covid_5,levels=c("1","2"))
data$covid_6.factor = factor(data$covid_6,levels=c("1","2"))
data$covid_exa_2.factor = factor(data$covid_exa_2,levels=c("1","2"))
data$covid_7___1.factor = factor(data$covid_7___1,levels=c("0","1"))
data$covid_7___2.factor = factor(data$covid_7___2,levels=c("0","1"))
data$covid_7___3.factor = factor(data$covid_7___3,levels=c("0","1"))
data$covid_7___4.factor = factor(data$covid_7___4,levels=c("0","1"))
data$covid_7___5.factor = factor(data$covid_7___5,levels=c("0","1"))
data$covid_7___6.factor = factor(data$covid_7___6,levels=c("0","1"))
data$covid_7___7.factor = factor(data$covid_7___7,levels=c("0","1"))
data$covid_7___8.factor = factor(data$covid_7___8,levels=c("0","1"))
data$covid_8.factor = factor(data$covid_8,levels=c("1","2"))
data$covid_9.factor = factor(data$covid_9,levels=c("1","2"))
data$covid_10.factor = factor(data$covid_10,levels=c("1","2"))
data$covid_exa_3.factor = factor(data$covid_exa_3,levels=c("1","2"))
data$covid_11___1.factor = factor(data$covid_11___1,levels=c("0","1"))
data$covid_11___2.factor = factor(data$covid_11___2,levels=c("0","1"))
data$covid_11___3.factor = factor(data$covid_11___3,levels=c("0","1"))
data$covid_11___4.factor = factor(data$covid_11___4,levels=c("0","1"))
data$covid_11___5.factor = factor(data$covid_11___5,levels=c("0","1"))
data$covid_11___6.factor = factor(data$covid_11___6,levels=c("0","1"))
data$covid_11___7.factor = factor(data$covid_11___7,levels=c("0","1"))
data$covid_11___8.factor = factor(data$covid_11___8,levels=c("0","1"))
data$covid_12.factor = factor(data$covid_12,levels=c("1","2"))
data$covid_13.factor = factor(data$covid_13,levels=c("1","2"))
data$covid_vacu.factor = factor(data$covid_vacu,levels=c("1","2"))
data$covid_prov_1.factor = factor(data$covid_prov_1,levels=c("1","2","3","4","5","6","7","8"))
data$covid_prov_2.factor = factor(data$covid_prov_2,levels=c("1","2","3","4","5","6","7","8"))
data$covid_prov_3.factor = factor(data$covid_prov_3,levels=c("1","2","3","4","5","6","7","8"))
data$covid_prov_4.factor = factor(data$covid_prov_4,levels=c("1","2","3","4","5","6","7","8"))
data$covid_prov_5.factor = factor(data$covid_prov_5,levels=c("1","2","3","4","5","6","7","8"))
data$urgen.factor = factor(data$urgen,levels=c("1","2"))
data$urgen_2.factor = factor(data$urgen_2,levels=c("1","2"))
data$urgen_3.factor = factor(data$urgen_3,levels=c("1","2"))
data$vis_med.factor = factor(data$vis_med,levels=c("1","2"))
data$vis_med_2.factor = factor(data$vis_med_2,levels=c("1","2"))
data$vis_esp.factor = factor(data$vis_esp,levels=c("1","2"))
data$vis_esp_2.factor = factor(data$vis_esp_2,levels=c("1","2"))
data$vis_reg_med.factor = factor(data$vis_reg_med,levels=c("1","2"))
data$vis_reg.factor = factor(data$vis_reg,levels=c("1","2","3","4"))
data$prueb_clin.factor = factor(data$prueb_clin,levels=c("1","2"))
data$prueb_clin_2.factor = factor(data$prueb_clin_2,levels=c("1","2"))
data$prueb_clin_3.factor = factor(data$prueb_clin_3,levels=c("1","2"))
data$prueb_clin_4___1.factor = factor(data$prueb_clin_4___1,levels=c("0","1"))
data$prueb_clin_4___2.factor = factor(data$prueb_clin_4___2,levels=c("0","1"))
data$prueb_clin_4___3.factor = factor(data$prueb_clin_4___3,levels=c("0","1"))
data$prueb_clin_4___4.factor = factor(data$prueb_clin_4___4,levels=c("0","1"))
data$prueb_clin_4___5.factor = factor(data$prueb_clin_4___5,levels=c("0","1"))
data$perd_trab.factor = factor(data$perd_trab,levels=c("1","2","3"))
data$perd_trab_4.factor = factor(data$perd_trab_4,levels=c("1","2"))
data$perd_trab_6.factor = factor(data$perd_trab_6,levels=c("1","2"))
data$perd_trab_7.factor = factor(data$perd_trab_7,levels=c("1","2"))
data$cuestionario_respiratorio_complete.factor = factor(data$cuestionario_respiratorio_complete,levels=c("0","1","2"))
data$sue_1_a.factor = factor(data$sue_1_a,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$sue_1_b.factor = factor(data$sue_1_b,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$sue_1_c.factor = factor(data$sue_1_c,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$sue_1_d.factor = factor(data$sue_1_d,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$sue_1_e.factor = factor(data$sue_1_e,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$sue_1_f.factor = factor(data$sue_1_f,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$sue_1_g.factor = factor(data$sue_1_g,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$sue_1_h.factor = factor(data$sue_1_h,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$sue_1_i.factor = factor(data$sue_1_i,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$sue_1_j.factor = factor(data$sue_1_j,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$est_sue.factor = factor(data$est_sue,levels=c("1","2","3","4","5"))
data$est_sue_2.factor = factor(data$est_sue_2,levels=c("1","2","3","4","5"))
data$racksa_sue.factor = factor(data$racksa_sue,levels=c("1","2","3","4","5"))
data$racksb_sue.factor = factor(data$racksb_sue,levels=c("1","2","3","4","5"))
data$racksc_sue.factor = factor(data$racksc_sue,levels=c("1","2","3","4","5"))
data$racksd_sue.factor = factor(data$racksd_sue,levels=c("1","2","3","4","5"))
data$racksa_sue_2.factor = factor(data$racksa_sue_2,levels=c("1","2","3","4","5"))
data$racksb_sue_2.factor = factor(data$racksb_sue_2,levels=c("1","2","3","4","5"))
data$racksc_sue_2.factor = factor(data$racksc_sue_2,levels=c("1","2","3","4","5"))
data$racksd_sue_2.factor = factor(data$racksd_sue_2,levels=c("1","2","3","4","5"))
data$caja_sue.factor = factor(data$caja_sue,levels=c("5","4","3","2","1"))
data$caja_sue_2.factor = factor(data$caja_sue_2,levels=c("5","4","3","2","1"))
data$ubicacion_archivo_general_complete.factor = factor(data$ubicacion_archivo_general_complete,levels=c("0","1","2"))
data$techo.factor = factor(data$techo,levels=c("1","2","3","4","5","6","7","8"))
data$paredes.factor = factor(data$paredes,levels=c("1","2","3","4","5","6","7","8"))
data$piso.factor = factor(data$piso,levels=c("1","2","3","4","5","6","7","8"))
data$ndice_de_materialidad_complete.factor = factor(data$ndice_de_materialidad_complete,levels=c("0","1","2"))

levels(data$redcap_repeat_instrument.factor)=c("ANTECEDENTES PERSONALES","ANTECEDENTES FAMILIARES","ACTIVIDAD FÍSICA","CUESTIONARIO DE FRECUENCIA DE ALIMENTOS","EXÁMEN FÍSICO","TOMA DE MUESTRA - ANÁLISIS BIOQUÍMICOS","CUESTIONARIO RESPIRATORIO")
levels(data$tipo_id.factor)=c("Cédula de Ciudadanía","Cédula de Extranjería","Pasaporte","Otro {ti_otro}")
levels(data$localidad.factor)=c("Localidad Histórica y del Caribe Norte","Localidad de la Virgen y Turística","Localidad Industrial de la Bahía","No Aplica")
levels(data$gender.factor)=c("Mujer","Hombre")
levels(data$lugar_nac_op.factor)=c("Sí","No")
levels(data$lugar_pro_op.factor)=c("Sí","No")
levels(data$escolaridad.factor)=c("Ninguna","Primaria incompleta","Primaria completa","Bachillerato incompleto","Bachillerato completo","Técnico incompleto","Técnico completo","Tecnológico incompleto","Tecnológico completo","Universitario incompleto","Universitario completo","Posgrado")
levels(data$grupo_san.factor)=c("O-","O+","A-","A+","B-","B+","AB-","AB+")
levels(data$ocupacion.factor)=c("Ama de casa","Funcionario","Comerciante","Albañil","Otra {ocupacion_otra1}")
levels(data$ocupacion_op.factor)=c("Empleado","Independiente","Estudiante a tiempo completo","Ama de casa (encargado de actividades domésticas)","Desempleado, no buscando trabajo","Desempleado, buscando trabajo","Jubilado","Otra")
levels(data$hijos.factor)=c("No","Sí, ¿cuantos? {num_hijos}")
levels(data$informacion_general_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$cesaria.factor)=c("No","Sí","No sabe")
levels(data$ant_p_enf.factor)=c("No","Sí")
levels(data$dis_p.factor)=c("No","Sí")
levels(data$dis_p_act.factor)=c("No","Sí")
levels(data$hta_p.factor)=c("No","Sí")
levels(data$ecv_p.factor)=c("No","Sí")
levels(data$cancer_p.factor)=c("No","Sí")
levels(data$dm2_p.factor)=c("No","Sí")
levels(data$ptiro_p.factor)=c("No","Sí")
levels(data$parep_p.factor)=c("No","Sí")
levels(data$otra_p.factor)=c("No","Sí")
levels(data$otra_p_cancer___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer___11.factor)=c("Unchecked","Checked")
levels(data$tto_dis_p___1.factor)=c("Unchecked","Checked")
levels(data$tto_dis_p___2.factor)=c("Unchecked","Checked")
levels(data$tto_dis_p___3.factor)=c("Unchecked","Checked")
levels(data$tto_dis_p___4.factor)=c("Unchecked","Checked")
levels(data$tto_dis_p___5.factor)=c("Unchecked","Checked")
levels(data$tto_dis_p___6.factor)=c("Unchecked","Checked")
levels(data$cual_estatinas___1.factor)=c("Unchecked","Checked")
levels(data$cual_estatinas___2.factor)=c("Unchecked","Checked")
levels(data$cual_estatinas___3.factor)=c("Unchecked","Checked")
levels(data$cual_fibratos___1.factor)=c("Unchecked","Checked")
levels(data$cual_fibratos___2.factor)=c("Unchecked","Checked")
levels(data$cual_fibratos___3.factor)=c("Unchecked","Checked")
levels(data$cual_resinas___1.factor)=c("Unchecked","Checked")
levels(data$cual_resinas___2.factor)=c("Unchecked","Checked")
levels(data$cual_resinas___3.factor)=c("Unchecked","Checked")
levels(data$tto_hta_p___1.factor)=c("Unchecked","Checked")
levels(data$tto_hta_p___2.factor)=c("Unchecked","Checked")
levels(data$tto_hta_p___3.factor)=c("Unchecked","Checked")
levels(data$tto_hta_p___4.factor)=c("Unchecked","Checked")
levels(data$tto_hta_p___5.factor)=c("Unchecked","Checked")
levels(data$tto_hta_p___6.factor)=c("Unchecked","Checked")
levels(data$tto_hta_p___7.factor)=c("Unchecked","Checked")
levels(data$tto_hta_p___8.factor)=c("Unchecked","Checked")
levels(data$tto_hta_p___9.factor)=c("Unchecked","Checked")
levels(data$cual_araii___1.factor)=c("Unchecked","Checked")
levels(data$cual_araii___2.factor)=c("Unchecked","Checked")
levels(data$cual_araii___3.factor)=c("Unchecked","Checked")
levels(data$cual_araii___4.factor)=c("Unchecked","Checked")
levels(data$cual_ca___1.factor)=c("Unchecked","Checked")
levels(data$cual_ca___2.factor)=c("Unchecked","Checked")
levels(data$cual_ca___3.factor)=c("Unchecked","Checked")
levels(data$cual_ca___4.factor)=c("Unchecked","Checked")
levels(data$cual_ca___5.factor)=c("Unchecked","Checked")
levels(data$cual_ca___6.factor)=c("Unchecked","Checked")
levels(data$cual_ca___7.factor)=c("Unchecked","Checked")
levels(data$cual_ca___8.factor)=c("Unchecked","Checked")
levels(data$cual_ca___9.factor)=c("Unchecked","Checked")
levels(data$cual_bb___1.factor)=c("Unchecked","Checked")
levels(data$cual_bb___2.factor)=c("Unchecked","Checked")
levels(data$cual_bb___3.factor)=c("Unchecked","Checked")
levels(data$cual_bb___4.factor)=c("Unchecked","Checked")
levels(data$cual_bb___5.factor)=c("Unchecked","Checked")
levels(data$cual_bb___6.factor)=c("Unchecked","Checked")
levels(data$cual_bb___7.factor)=c("Unchecked","Checked")
levels(data$cual_bb___8.factor)=c("Unchecked","Checked")
levels(data$cual_bb___9.factor)=c("Unchecked","Checked")
levels(data$cual_bb___10.factor)=c("Unchecked","Checked")
levels(data$cual_ieca___1.factor)=c("Unchecked","Checked")
levels(data$cual_ieca___2.factor)=c("Unchecked","Checked")
levels(data$cual_ieca___3.factor)=c("Unchecked","Checked")
levels(data$cual_ieca___4.factor)=c("Unchecked","Checked")
levels(data$cual_ieca___5.factor)=c("Unchecked","Checked")
levels(data$cual_diu___1.factor)=c("Unchecked","Checked")
levels(data$cual_diu___2.factor)=c("Unchecked","Checked")
levels(data$cual_diu___3.factor)=c("Unchecked","Checked")
levels(data$cual_diu___4.factor)=c("Unchecked","Checked")
levels(data$cual_digi___1.factor)=c("Unchecked","Checked")
levels(data$cual_digi___2.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___1.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___2.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___3.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___4.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___5.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___6.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___7.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___8.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___9.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___11.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___12.factor)=c("Unchecked","Checked")
levels(data$tto_dm2_p___13.factor)=c("Unchecked","Checked")
levels(data$cual_ins___1.factor)=c("Unchecked","Checked")
levels(data$cual_ins___2.factor)=c("Unchecked","Checked")
levels(data$cual_ins___3.factor)=c("Unchecked","Checked")
levels(data$cual_ins___4.factor)=c("Unchecked","Checked")
levels(data$cual_ins___5.factor)=c("Unchecked","Checked")
levels(data$cual_ins___6.factor)=c("Unchecked","Checked")
levels(data$cual_ins___7.factor)=c("Unchecked","Checked")
levels(data$cual_bigu___1.factor)=c("Unchecked","Checked")
levels(data$cual_sulfo___1.factor)=c("Unchecked","Checked")
levels(data$cual_sulfo___2.factor)=c("Unchecked","Checked")
levels(data$cual_sulfo___3.factor)=c("Unchecked","Checked")
levels(data$cual_sulfo___4.factor)=c("Unchecked","Checked")
levels(data$cual_sulfo___5.factor)=c("Unchecked","Checked")
levels(data$cual_sulfo___6.factor)=c("Unchecked","Checked")
levels(data$cual_i_alfa_g___1.factor)=c("Unchecked","Checked")
levels(data$cual_i_alfa_g___2.factor)=c("Unchecked","Checked")
levels(data$cual_megli___1.factor)=c("Unchecked","Checked")
levels(data$cual_megli___3.factor)=c("Unchecked","Checked")
levels(data$cual_tiazo___1.factor)=c("Unchecked","Checked")
levels(data$cual_tiazo___2.factor)=c("Unchecked","Checked")
levels(data$cual_i_dpp4___1.factor)=c("Unchecked","Checked")
levels(data$cual_i_dpp4___2.factor)=c("Unchecked","Checked")
levels(data$cual_i_dpp4___3.factor)=c("Unchecked","Checked")
levels(data$cual_ago_glp1___1.factor)=c("Unchecked","Checked")
levels(data$cual_ago_glp1___2.factor)=c("Unchecked","Checked")
levels(data$cual_isglt2___1.factor)=c("Unchecked","Checked")
levels(data$cual_isglt2___2.factor)=c("Unchecked","Checked")
levels(data$tto_ecv_p___6.factor)=c("Unchecked","Checked")
levels(data$tto_ecv_p___7.factor)=c("Unchecked","Checked")
levels(data$tto_ecv_p___0.factor)=c("Unchecked","Checked")
levels(data$tto_ecv_p___1.factor)=c("Unchecked","Checked")
levels(data$tto_ecv_p___2.factor)=c("Unchecked","Checked")
levels(data$tto_ecv_p___3.factor)=c("Unchecked","Checked")
levels(data$tto_ecv_p___4.factor)=c("Unchecked","Checked")
levels(data$tto_ecv_p___5.factor)=c("Unchecked","Checked")
levels(data$ant_p_qx_op.factor)=c("No","Sí")
levels(data$ape_p_qx.factor)=c("No","Sí")
levels(data$sal_p_qx.factor)=c("No","Sí")
levels(data$his_p_qx.factor)=c("No","Sí")
levels(data$oof_p_qx.factor)=c("No","Sí")
levels(data$ces_p_qx.factor)=c("No","Sí")
levels(data$her_p_qx.factor)=c("No","Sí")
levels(data$col_p_qx.factor)=c("No","Sí")
levels(data$fra_p_qx.factor)=c("No","Sí")
levels(data$otra_p_qx.factor)=c("No","Sí")
levels(data$ob_ape_p_qx.factor)=c("Ninguna","-")
levels(data$ob_sal_p_qx.factor)=c("Ninguna","-")
levels(data$ob_his_p_qx.factor)=c("Ninguna","-")
levels(data$ob_oof_p_qx.factor)=c("Ninguna","-")
levels(data$ob_ces_p_qx.factor)=c("Ninguna","-")
levels(data$ob_her_p_qx.factor)=c("Ninguna","-")
levels(data$ob_col_p_qx.factor)=c("Ninguna","-")
levels(data$ob_fra_p_qx.factor)=c("Ninguna","-")
levels(data$ob_otra_p_qx.factor)=c("Ninguna","-")
levels(data$con_alc_op.factor)=c("No","Sí")
levels(data$fre_cer_330.factor)=c("Día","Semana","Mes","Año")
levels(data$fre_cer_269.factor)=c("Día","Semana","Mes","Año")
levels(data$fre_cer_175.factor)=c("Día","Semana","Mes","Año")
levels(data$fre_vino.factor)=c("Día","Semana","Mes","Año")
levels(data$fre_aguar.factor)=c("Día","Semana","Mes","Año")
levels(data$fre_ron.factor)=c("Día","Semana","Mes","Año")
levels(data$fre_whis.factor)=c("Día","Semana","Mes","Año")
levels(data$fre_otro.factor)=c("Día","Semana","Mes","Año")
levels(data$con_tab_op.factor)=c("No","Sí")
levels(data$con_tab_act_op.factor)=c("No","Sí")
levels(data$expo_tab_otro.factor)=c("No","Sí")
levels(data$tab_trag.factor)=c("No","Sí")
levels(data$antecedentes_personales_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$dis_p_fam.factor)=c("No","Sí")
levels(data$hta_p_fam.factor)=c("No","Sí")
levels(data$ecv_p_fam.factor)=c("No","Sí")
levels(data$dm2_p_fam.factor)=c("No","Sí")
levels(data$cancer_p_fam.factor)=c("No","Sí")
levels(data$alzh_p_fam.factor)=c("No","Sí")
levels(data$park_p_fam.factor)=c("No","Sí")
levels(data$asma_p_fam.factor)=c("No","Sí")
levels(data$bronquitis_p_fam.factor)=c("No","Sí")
levels(data$acv_p_fam.factor)=c("No","Sí")
levels(data$otra_p_fam.factor)=c("No","Sí")
levels(data$otra_p_cancer_fam_1___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_1___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_2___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_3___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_4___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_5___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_6___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_7___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_8___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_9___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_10___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_11___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_12___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_13___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_14___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_15___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_16___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_18___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_20___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_23___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_24___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_25___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_26___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_27___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_22___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_21___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_19___12.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___1.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___2.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___3.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___4.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___5.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___6.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___7.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___8.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___9.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___10.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___11.factor)=c("Unchecked","Checked")
levels(data$otra_p_cancer_fam_17___12.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_dis_fam___15.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_hta_fam___15.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_ecv_fam___15.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_dm2_fam___15.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_cancer_fam___15.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_alzh_fam___15.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_park_fam___15.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_asma_fam___15.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_bronquitis_fam___15.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_acv_fam___15.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___1.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___2.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___3.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___16.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___17.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___4.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___18.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___19.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___5.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___6.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___7.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___8.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___9.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___20.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___21.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___10.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___22.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___23.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___11.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___24.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___25.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___12.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___26.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___27.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___13.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___14.factor)=c("Unchecked","Checked")
levels(data$ptco_otro_fam___15.factor)=c("Unchecked","Checked")
levels(data$madre_viva.factor)=c("No","Sí","No sabe")
levels(data$padre_vivo.factor)=c("No","Sí","No sabe")
levels(data$escolaridad_madre.factor)=c("Ninguna","Primaria incompleta","Primaria completa","Bachillerato incompleto","Bachillerato completo","Técnico incompleto","Técnico completo","Tecnológico incompleto","Tecnológico completo","Universitario incompleto","Universitario completo","Posgrado")
levels(data$escolaridad_padre.factor)=c("Ninguna","Primaria incompleta","Primaria completa","Bachillerato incompleto","Bachillerato completo","Técnico incompleto","Técnico completo","Tecnológico incompleto","Tecnológico completo","Universitario incompleto","Universitario completo","Posgrado")
levels(data$asma_madre.factor)=c("No","Sí")
levels(data$bronq_cro_madre.factor)=c("No","Sí")
levels(data$ecv_madre.factor)=c("No","Sí")
levels(data$hta_madre.factor)=c("No","Sí")
levels(data$acv_madre.factor)=c("No","Sí")
levels(data$dm_madre.factor)=c("No","Sí")
levels(data$asma_padre.factor)=c("No","Sí")
levels(data$bronq_cro_padre.factor)=c("No","Sí")
levels(data$ecv_padre.factor)=c("No","Sí")
levels(data$hta_padre.factor)=c("No","Sí")
levels(data$acv_padre.factor)=c("No","Sí")
levels(data$dm_padre.factor)=c("No","Sí")
levels(data$sexo_h1.factor)=c("Hombre","Mujer")
levels(data$sexo_h2.factor)=c("Hombre","Mujer")
levels(data$sexo_h3.factor)=c("Hombre","Mujer")
levels(data$sexo_h4.factor)=c("Hombre","Mujer")
levels(data$sexo_h5.factor)=c("Hombre","Mujer")
levels(data$sexo_h6.factor)=c("Hombre","Mujer")
levels(data$sexo_h7.factor)=c("Hombre","Mujer")
levels(data$sexo_h8.factor)=c("Hombre","Mujer")
levels(data$sexo_h9.factor)=c("Hombre","Mujer")
levels(data$sexo_h10.factor)=c("Hombre","Mujer")
levels(data$sexo_h11.factor)=c("Hombre","Mujer")
levels(data$sexo_h12.factor)=c("Hombre","Mujer")
levels(data$sexo_h13.factor)=c("Hombre","Mujer")
levels(data$sexo_h14.factor)=c("Hombre","Mujer")
levels(data$sexo_h15.factor)=c("Hombre","Mujer")
levels(data$asma_ant_10_h1.factor)=c("No","Sí")
levels(data$asma_ant_10_h2.factor)=c("No","Sí")
levels(data$asma_ant_10_h3.factor)=c("No","Sí")
levels(data$asma_ant_10_h4.factor)=c("No","Sí")
levels(data$asma_ant_10_h5.factor)=c("No","Sí")
levels(data$asma_ant_10_h6.factor)=c("No","Sí")
levels(data$asma_ant_10_h7.factor)=c("No","Sí")
levels(data$asma_ant_10_h8.factor)=c("No","Sí")
levels(data$asma_ant_10_h9.factor)=c("No","Sí")
levels(data$asma_ant_10_h10.factor)=c("No","Sí")
levels(data$asma_ant_10_h11.factor)=c("No","Sí")
levels(data$asma_ant_10_h12.factor)=c("No","Sí")
levels(data$asma_ant_10_h13.factor)=c("No","Sí")
levels(data$asma_ant_10_h14.factor)=c("No","Sí")
levels(data$asma_ant_10_h15.factor)=c("No","Sí")
levels(data$asma_des_10_h1.factor)=c("No","Sí")
levels(data$asma_des_10_h2.factor)=c("No","Sí")
levels(data$asma_des_10_h3.factor)=c("No","Sí")
levels(data$asma_des_10_h4.factor)=c("No","Sí")
levels(data$asma_des_10_h5.factor)=c("No","Sí")
levels(data$asma_des_10_h6.factor)=c("No","Sí")
levels(data$asma_des_10_h7.factor)=c("No","Sí")
levels(data$asma_des_10_h8.factor)=c("No","Sí")
levels(data$asma_des_10_h9.factor)=c("No","Sí")
levels(data$asma_des_10_h10.factor)=c("No","Sí")
levels(data$asma_des_10_h11.factor)=c("No","Sí")
levels(data$asma_des_10_h12.factor)=c("No","Sí")
levels(data$asma_des_10_h13.factor)=c("No","Sí")
levels(data$asma_des_10_h14.factor)=c("No","Sí")
levels(data$asma_des_10_h15.factor)=c("No","Sí")
levels(data$rinitis_h1.factor)=c("No","Sí")
levels(data$rinitis_h2.factor)=c("No","Sí")
levels(data$rinitis_h3.factor)=c("No","Sí")
levels(data$rinitis_h4.factor)=c("No","Sí")
levels(data$rinitis_h5.factor)=c("No","Sí")
levels(data$rinitis_h6.factor)=c("No","Sí")
levels(data$rinitis_h7.factor)=c("No","Sí")
levels(data$rinitis_h8.factor)=c("No","Sí")
levels(data$rinitis_h9.factor)=c("No","Sí")
levels(data$rinitis_h10.factor)=c("No","Sí")
levels(data$rinitis_h11.factor)=c("No","Sí")
levels(data$rinitis_h12.factor)=c("No","Sí")
levels(data$rinitis_h13.factor)=c("No","Sí")
levels(data$rinitis_h14.factor)=c("No","Sí")
levels(data$rinitis_h15.factor)=c("No","Sí")
levels(data$eczema_h1.factor)=c("No","Sí")
levels(data$eczema_h2.factor)=c("No","Sí")
levels(data$eczema_h3.factor)=c("No","Sí")
levels(data$eczema_h4.factor)=c("No","Sí")
levels(data$eczema_h5.factor)=c("No","Sí")
levels(data$eczema_h6.factor)=c("No","Sí")
levels(data$eczema_h7.factor)=c("No","Sí")
levels(data$eczema_h8.factor)=c("No","Sí")
levels(data$eczema_h9.factor)=c("No","Sí")
levels(data$eczema_h10.factor)=c("No","Sí")
levels(data$eczema_h11.factor)=c("No","Sí")
levels(data$eczema_h12.factor)=c("No","Sí")
levels(data$eczema_h13.factor)=c("No","Sí")
levels(data$eczema_h14.factor)=c("No","Sí")
levels(data$eczema_h15.factor)=c("No","Sí")
levels(data$antecedentes_familiares_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$sil_pit_v2.factor)=c("No","Sí")
levels(data$sil_pit_1_1_v2.factor)=c("No","Sí")
levels(data$sil_pit_1_2_v2.factor)=c("No","Sí")
levels(data$sil_pit_1_4_v2.factor)=c("Todos los días","Al menos una vez a la semana, pero no todos los días","Esporádicamente")
levels(data$tirantez_v2.factor)=c("No","Sí")
levels(data$falt_aire_v2.factor)=c("No","Sí")
levels(data$falt_aire_ejer_v2.factor)=c("No","Sí")
levels(data$falt_aire_noche_v2.factor)=c("No","Sí")
levels(data$ata_tos_v2.factor)=c("No","Sí")
levels(data$ata_tos_1_1_v2.factor)=c("Menos de una vez al mes","Todos los meses, pero no todas las semanas","Todas las semanas, pero no todos los días","Todos los días")
levels(data$ata_tos_3_v2.factor)=c("No","Sí")
levels(data$ata_tos_4_v2.factor)=c("No","Sí")
levels(data$ata_tos_4_1_v2.factor)=c("No","Sí")
levels(data$esputos_v2.factor)=c("No","Sí")
levels(data$esputos_2_v2.factor)=c("No","Sí")
levels(data$esputos_2_1_v2.factor)=c("No","Sí")
levels(data$sin_res_peor_v2.factor)=c("No","Sí")
levels(data$resp_v2.factor)=c("Continuamente, nunca respira totalmente bien","A menudo, pero siempre se recupera completamente","Sólo de vez en cuando","No tengo problemas")
levels(data$dif_cam_v2.factor)=c("No","Sí {dif_cam_2_v2}")
levels(data$falt_aire_cam_v2.factor)=c("No","Sí")
levels(data$falt_aire_cam_2_v2.factor)=c("No","Sí")
levels(data$falt_aire_cam_3_v2.factor)=c("No","Sí")
levels(data$falt_aire_cam_5_v2.factor)=c("No","Sí")
levels(data$falt_aire_cam_6_v2.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$asma_v2.factor)=c("No","Sí")
levels(data$asma_1_1_v2.factor)=c("No","Sí")
levels(data$asma_1_5_v2___1.factor)=c("Unchecked","Checked")
levels(data$asma_1_5_v2___2.factor)=c("Unchecked","Checked")
levels(data$asma_1_5_v2___3.factor)=c("Unchecked","Checked")
levels(data$asma_1_5_v2___4.factor)=c("Unchecked","Checked")
levels(data$asma_1_5_v2___5.factor)=c("Unchecked","Checked")
levels(data$asma_1_5_v2___6.factor)=c("Unchecked","Checked")
levels(data$asma_1_5_v2___7.factor)=c("Unchecked","Checked")
levels(data$asma_1_6_v2.factor)=c("No","Sí")
levels(data$asma_1_9_v2.factor)=c("todas las noches, o casi todas las noches","más de una vez a la semana, pero no la mayoría de las noches","más de dos veces al mes, pero no más de una vez a la semana","menos de dos veces al mes","nunca")
levels(data$asma_1_10_v2.factor)=c("continuamente","más o menos una vez al día","más de una vez a la semana, pero menos de una vez al día","menos de dos veces","nunca")
levels(data$asma_1_11_v2.factor)=c("No","Sí")
levels(data$asma_1_12_v2.factor)=c("No","Sí")
levels(data$bronq_cro_v2.factor)=c("No","Sí")
levels(data$epoc_v2.factor)=c("No","Sí")
levels(data$enfisema_v2.factor)=c("No","Sí")
levels(data$otra_enf_pulm_v2.factor)=c("No","Sí")
levels(data$otra_enf_pulm_op_v2___1.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op_v2___2.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op_v2___3.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op_v2___4.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op_v2___5.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op_v2___6.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op_v2___7.factor)=c("Unchecked","Checked")
levels(data$rinitis_v2.factor)=c("No","Sí")
levels(data$estornudos_v2.factor)=c("No","Sí")
levels(data$estornudos_1_1_v2.factor)=c("No","Sí")
levels(data$estornudos_1_2_v2.factor)=c("No","Sí")
levels(data$estornudos_1_3_v2___1.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3_v2___2.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3_v2___3.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3_v2___4.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3_v2___5.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3_v2___6.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3_v2___7.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_4_v2.factor)=c("No","Sí")
levels(data$estornudos_1_5_v2.factor)=c("No","Sí")
levels(data$moq_nariz_v2.factor)=c("No ha habido problema (el síntoma no estaba presente)","Había/hay un problema, pero no particularmente molesto","Problema molesto, pero que no interfiere con las actividades diarias ni con el sueño","Problemas que interfiere con las actividades diarias y/o con el sueño")
levels(data$nariz_tapada_v2.factor)=c("No ha habido problema (el síntoma no estaba presente)","Había/hay un problema, pero no particularmente molesto","Problema molesto, pero que no interfiere con las actividades diarias ni con el sueño","Problemas que interfiere con las actividades diarias y/o con el sueño")
levels(data$picor_nariz_v2.factor)=c("No ha habido problema (el síntoma no estaba presente)","Había/hay un problema, pero no particularmente molesto","Problema molesto, pero que no interfiere con las actividades diarias ni con el sueño","Problemas que interfiere con las actividades diarias y/o con el sueño")
levels(data$estornudos_2_v2.factor)=c("No ha habido problema (el síntoma no estaba presente)","Había/hay un problema, pero no particularmente molesto","Problema molesto, pero que no interfiere con las actividades diarias ni con el sueño","Problemas que interfiere con las actividades diarias y/o con el sueño")
levels(data$ojos_llorosos_v2.factor)=c("No ha habido problema (el síntoma no estaba presente)","Había/hay un problema, pero no particularmente molesto","Problema molesto, pero que no interfiere con las actividades diarias ni con el sueño","Problemas que interfiere con las actividades diarias y/o con el sueño")
levels(data$tras_nas_v2.factor)=c("No","Sí")
levels(data$tras_nas_1_1_v2.factor)=c("No","Sí")
levels(data$tras_nas_1_2_v2.factor)=c("No","Sí")
levels(data$nar_tap_v2.factor)=c("No","Sí")
levels(data$pre_fre_v2.factor)=c("No","Sí")
levels(data$mucosidad_v2.factor)=c("No","Sí")
levels(data$olfato_v2.factor)=c("No","Sí")
levels(data$sinusitis_v2.factor)=c("No","Sí")
levels(data$sinusitis_1_1_v2.factor)=c("No","Sí")
levels(data$eczema_v2.factor)=c("No","Sí")
levels(data$eczema_1_2_v2.factor)=c("No","Sí")
levels(data$eczema_1_3_v2.factor)=c("No","Sí")
levels(data$sarpullidos_v2.factor)=c("No","Sí")
levels(data$erupcion_v2.factor)=c("No","Sí")
levels(data$erupcion_1_1_v2.factor)=c("No","Sí")
levels(data$erupcion_1_2_v2.factor)=c("No","Sí")
levels(data$expo_trab2_v2.factor)=c("No","Sí ¿cuando? {expo_trab2_fec_v2}")
levels(data$expo_trab1_v2.factor)=c("No","Sí")
levels(data$expo_trab1_1_v2.factor)=c("No","Sí")
levels(data$expo_trab1_1_1_v2___1.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_1_v2___3.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_1_v2___4.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_1_v2___5.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_1_v2___6.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_1_v2___7.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_2_v2.factor)=c("No","Sí")
levels(data$humed_trab1_v2.factor)=c("No","Sí")
levels(data$moho_trab1_v2.factor)=c("No","Sí")
levels(data$moho_alim_trab1_v2.factor)=c("No","Sí")
levels(data$pro_lim_trab1_v2.factor)=c("No","Sí")
levels(data$pro_lim_trab1_1_v2.factor)=c("")
levels(data$hipoclorito_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$amoniaco_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$quitamanchas_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$acidos_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$ceras_suelos_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$ceras_muebles_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$sprays_suelos_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$sprays_muebles_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$detergentes_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$sprays_cristales_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$alcohol_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$jabones_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$otro_desinfectante_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$sprays_desengrasantes_1_v2.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$expo_v2.factor)=c("No","Sí")
levels(data$expo_2_1_v2.factor)=c("Un incendio o una explosión","Una fuga o un escape","Una inhalación relacionada con una mezcla de productos de limpieza","Otra cosa")
levels(data$expo_2_2_v2.factor)=c("En su propia casa","Una fuga o un escape","Un otro lugar interior","En el exterior (aire libre)")
levels(data$expo_2_3_v2.factor)=c("No","Sí")
levels(data$expo_2_4_1_v2.factor)=c("No","Sí")
levels(data$vivienda_v2.factor)=c("una casa unifamiliar separada de cualquier otra","una casa unifamiliar adherida a una o más casas","un edificio para 2 familias","un edificio para 3 o 4 familias","un edificio para 5 o más familias","Otro {vivienda_otro_v2}")
levels(data$air_acon_v2.factor)=c("No","Sí")
levels(data$combus_cocinar_v2___1.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar_v2___2.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar_v2___3.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar_v2___4.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar_v2___5.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar_v2___6.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar_v2___7.factor)=c("Unchecked","Checked")
levels(data$cocina_v2.factor)=c("No","Sí")
levels(data$cocinar_ventana_v2.factor)=c("la mayor parte del tiempo","algunas veces","pocas veces (o muy de vez en cuando)","no hay ninguna puerta ni ventana que dé al exterior","nunca")
levels(data$extractor_v2.factor)=c("No","Sí")
levels(data$extrator_1_1_v2.factor)=c("siempre","algunas veces","nunca")
levels(data$goteras_v2.factor)=c("No","Sí","No sabe")
levels(data$goteras_1_v2.factor)=c("No","Sí","No sabe")
levels(data$manchas_v2.factor)=c("No","Sí")
levels(data$moho_manchas_casa_v2.factor)=c("No","Sí")
levels(data$moho_casa_v2.factor)=c("No","Sí","No sabe")
levels(data$moho_lugar_v2___1.factor)=c("Unchecked","Checked")
levels(data$moho_lugar_v2___2.factor)=c("Unchecked","Checked")
levels(data$moho_lugar_v2___3.factor)=c("Unchecked","Checked")
levels(data$moho_lugar_v2___4.factor)=c("Unchecked","Checked")
levels(data$moho_lugar_v2___5.factor)=c("Unchecked","Checked")
levels(data$moho_lugar_v2___6.factor)=c("Unchecked","Checked")
levels(data$moho_casa_2_v2.factor)=c("No","Sí")
levels(data$ventanas_2_v2.factor)=c("Siempre","Alguna vez","Nunca")
levels(data$gato_1_v2.factor)=c("No","Sí")
levels(data$gato_2_v2.factor)=c("No","Sí")
levels(data$perro_v2.factor)=c("No","Sí")
levels(data$perro_1_v2.factor)=c("No","Sí")
levels(data$perro_2_v2.factor)=c("No","Sí")
levels(data$pajaro_v2.factor)=c("No","Sí")
levels(data$pajaro_1_v2.factor)=c("No","Sí")
levels(data$enfer_alime_v2.factor)=c("No","Sí")
levels(data$enfer_alime_siem_v2.factor)=c("No","Sí")
levels(data$alime_v2___1.factor)=c("Unchecked","Checked")
levels(data$alime_v2___2.factor)=c("Unchecked","Checked")
levels(data$alime_v2___3.factor)=c("Unchecked","Checked")
levels(data$alime_v2___4.factor)=c("Unchecked","Checked")
levels(data$alime_v2___5.factor)=c("Unchecked","Checked")
levels(data$alime_v2___6.factor)=c("Unchecked","Checked")
levels(data$alime_v2___7.factor)=c("Unchecked","Checked")
levels(data$alime_v2___8.factor)=c("Unchecked","Checked")
levels(data$alime_v2___9.factor)=c("Unchecked","Checked")
levels(data$alime_v2___10.factor)=c("Unchecked","Checked")
levels(data$alime_v2___11.factor)=c("Unchecked","Checked")
levels(data$alime_v2___12.factor)=c("Unchecked","Checked")
levels(data$alime_v2___13.factor)=c("Unchecked","Checked")
levels(data$alime_v2___14.factor)=c("Unchecked","Checked")
levels(data$alime_v2___15.factor)=c("Unchecked","Checked")
levels(data$alime_v2___16.factor)=c("Unchecked","Checked")
levels(data$alime_v2___17.factor)=c("Unchecked","Checked")
levels(data$alime_v2___18.factor)=c("Unchecked","Checked")
levels(data$alime_v2___19.factor)=c("Unchecked","Checked")
levels(data$alime_v2___20.factor)=c("Unchecked","Checked")
levels(data$alime_v2___21.factor)=c("Unchecked","Checked")
levels(data$alime_v2___22.factor)=c("Unchecked","Checked")
levels(data$alime_v2___23.factor)=c("Unchecked","Checked")
levels(data$alime_v2___24.factor)=c("Unchecked","Checked")
levels(data$alime_v2___26.factor)=c("Unchecked","Checked")
levels(data$alime_v2___27.factor)=c("Unchecked","Checked")
levels(data$alime_v2___28.factor)=c("Unchecked","Checked")
levels(data$enro_alime_otro_1_v2.factor)=c("No","Sí")
levels(data$vomi_alime_otro_1_v2.factor)=c("No","Sí")
levels(data$tapa_alime_otro_1_v2.factor)=c("No","Sí")
levels(data$dol_cab_alime_otro_1_v2.factor)=c("No","Sí")
levels(data$alien_alime_otro_1_v2.factor)=c("No","Sí")
levels(data$picor_alime_otro_1_v2.factor)=c("No","Sí")
levels(data$dif_tra_alime_otro_1_v2.factor)=c("No","Sí")
levels(data$desma_alime_otro_1_v2.factor)=c("No","Sí")
levels(data$inye_alime_otro_1_v2.factor)=c("No","Sí")
levels(data$otro_alime_otro_1_v2.factor)=c("No","Sí {otro_alime_otro_1_1_v2}")
levels(data$tiemp_alime_otro_1_v2.factor)=c("Menos de media hora después","De media hora a una hora","Entre una y dos horas","Entre dos y cuatro horas","Más de cuatro horas después")
levels(data$enro_alime_otro_2_v2.factor)=c("No","Sí")
levels(data$vomi_alime_otro_2_v2.factor)=c("No","Sí")
levels(data$picor_alime_otro_2_v2.factor)=c("No","Sí")
levels(data$dif_tra_alime_otro_2_v2.factor)=c("No","Sí")
levels(data$desma_alime_otro_2_v2.factor)=c("No","Sí")
levels(data$inye_alime_otro_2_v2.factor)=c("No","Sí")
levels(data$otro_alime_otro_2_v2.factor)=c("No","Sí {otro_alime_otro_1_2_v2}")
levels(data$tiemp_alime_otro_2_v2.factor)=c("Menos de media hora después","De media hora a una hora","Entre una y dos horas","Entre dos y cuatro horas","Más de cuatro horas después")
levels(data$enro_alime_otro_3_v2.factor)=c("No","Sí")
levels(data$vomi_alime_otro_3_v2.factor)=c("No","Sí")
levels(data$picor_alime_otro_3_v2.factor)=c("No","Sí")
levels(data$dif_tra_alime_otro_3_v2.factor)=c("No","Sí")
levels(data$desma_alime_otro_3_v2.factor)=c("No","Sí")
levels(data$inye_alime_otro_3_v2.factor)=c("No","Sí")
levels(data$otro_alime_otro_3_v2.factor)=c("No","Sí {otro_alime_otro_1_3_v2}")
levels(data$tiemp_alime_otro_3_v2.factor)=c("Menos de media hora después","De media hora a una hora","Entre una y dos horas","Entre dos y cuatro horas","Más de cuatro horas después")
levels(data$tos_anim_v2.factor)=c("No","Sí")
levels(data$tos_anim_op_v2___1.factor)=c("Unchecked","Checked")
levels(data$tos_anim_op_v2___2.factor)=c("Unchecked","Checked")
levels(data$tos_anim_op_v2___3.factor)=c("Unchecked","Checked")
levels(data$tos_anim_op_v2___4.factor)=c("Unchecked","Checked")
levels(data$sil_anim_v2.factor)=c("No","Sí")
levels(data$sil_anim_op_v2___1.factor)=c("Unchecked","Checked")
levels(data$sil_anim_op_v2___2.factor)=c("Unchecked","Checked")
levels(data$sil_anim_op_v2___3.factor)=c("Unchecked","Checked")
levels(data$sil_anim_op_v2___4.factor)=c("Unchecked","Checked")
levels(data$opre_anim_v2.factor)=c("No","Sí")
levels(data$opre_anim_op_v2___1.factor)=c("Unchecked","Checked")
levels(data$opre_anim_op_v2___2.factor)=c("Unchecked","Checked")
levels(data$opre_anim_op_v2___3.factor)=c("Unchecked","Checked")
levels(data$opre_anim_op_v2___4.factor)=c("Unchecked","Checked")
levels(data$falt_aire_anim_v2.factor)=c("No","Sí")
levels(data$falta_aire_anim_op_v2___1.factor)=c("Unchecked","Checked")
levels(data$falta_aire_anim_op_v2___2.factor)=c("Unchecked","Checked")
levels(data$falta_aire_anim_op_v2___3.factor)=c("Unchecked","Checked")
levels(data$falta_aire_anim_op_v2___4.factor)=c("Unchecked","Checked")
levels(data$nariz_anim_v2.factor)=c("No","Sí")
levels(data$nariz_anim_op_v2___1.factor)=c("Unchecked","Checked")
levels(data$nariz_anim_op_v2___2.factor)=c("Unchecked","Checked")
levels(data$nariz_anim_op_v2___3.factor)=c("Unchecked","Checked")
levels(data$nariz_anim_op_v2___4.factor)=c("Unchecked","Checked")
levels(data$ojos_anim_v2.factor)=c("No","Sí")
levels(data$ojos_anim_op_v2___1.factor)=c("Unchecked","Checked")
levels(data$ojos_anim_op_v2___2.factor)=c("Unchecked","Checked")
levels(data$ojos_anim_op_v2___3.factor)=c("Unchecked","Checked")
levels(data$ojos_anim_op_v2___4.factor)=c("Unchecked","Checked")
levels(data$tos_2_v2.factor)=c("No","Sí")
levels(data$sil_2_v2.factor)=c("No","Sí")
levels(data$opre_2_v2.factor)=c("No","Sí")
levels(data$falt_aire_2_v2.factor)=c("No","Sí")
levels(data$nariz_2_v2.factor)=c("No","Sí")
levels(data$ojos_2_v2.factor)=c("No","Sí")
levels(data$tos_3_v2.factor)=c("No","Sí")
levels(data$sil_3_v2.factor)=c("No","Sí")
levels(data$opre_3_v2.factor)=c("No","Sí")
levels(data$falt_aire_3_v2.factor)=c("No","Sí")
levels(data$nariz_3_v2.factor)=c("No","Sí")
levels(data$ojos_3_v2.factor)=c("No","Sí")
levels(data$med_inha_v2.factor)=c("No","Sí")
levels(data$ago_beta2_v2.factor)=c("No","Sí")
levels(data$ago_beta2_corta_1_v2.factor)=c("Salbutamol","Fenoterol","Terbutalina","Isoproterenol")
levels(data$ago_beta2_corta_2_v2.factor)=c("Salbutamol","Fenoterol","Terbutalina","Isoproterenol")
levels(data$ago_beta2_corta_3_v2.factor)=c("Salbutamol","Fenoterol","Terbutalina","Isoproterenol")
levels(data$ago_beta2_corta_4_v2.factor)=c("Salbutamol","Fenoterol","Terbutalina","Isoproterenol")
levels(data$ago_beta2_fr_1_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$ago_beta2_fr_2_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$ago_beta2_fr_3_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$ago_beta2_fr_4_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$ago_beta2_pro_v2.factor)=c("No","Sí")
levels(data$ago_beta2_pro_1_v2.factor)=c("Formoterol","Salmeterol")
levels(data$ago_beta2_pro_2_v2.factor)=c("Formoterol","Salmeterol")
levels(data$ago_beta2_fr_5_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$ago_beta2_fr_6_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$antimus_cort_v2.factor)=c("No","Sí")
levels(data$antimus_corta_1_v2.factor)=c("Bromuro de Ipatropio")
levels(data$antimus_fr_1_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$antimus_pro_v2.factor)=c("No","Sí")
levels(data$antimus_pro_1_v2.factor)=c("Bromuro de Tiotropio","Glicopirronio")
levels(data$antimus_pro_2_v2.factor)=c("Bromuro de Tiotropio","Glicopirronio")
levels(data$antimus_fr_2_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$antimus_fr_3_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_inha_v2.factor)=c("No","Sí")
levels(data$este_inha_1_v2.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_inha_2_v2.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_inha_3_v2.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_inha_4_v2.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_inha_5_v2.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_inha_6_v2.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_fr_1_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_fr_2_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_fr_3_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_fr_4_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_fr_5_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_fr_6_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_inha_v2.factor)=c("No","Sí")
levels(data$combi_inha_op_v2___7.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op_v2___8.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op_v2___9.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op_v2___10.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op_v2___11.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op_v2___1.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op_v2___2.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op_v2___3.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op_v2___4.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op_v2___5.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op_v2___6.factor)=c("Unchecked","Checked")
levels(data$combi_inha_1_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_2_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_3_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_4_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_5_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_6_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_7_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_8_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_9_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_10_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_11_v2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_fr_1_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_2_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_3_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_4_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_5_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_6_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_7_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_8_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_9_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_10_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_11_v2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$antibi_v2.factor)=c("No","Sí")
levels(data$atb_cuales___1.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___2.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___3.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___4.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___5.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___6.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___7.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___8.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___9.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___10.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___11.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___12.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___13.factor)=c("Unchecked","Checked")
levels(data$atb_cuales___14.factor)=c("Unchecked","Checked")
levels(data$antibi_2_v2.factor)=c("No","Sí")
levels(data$remedio_v2.factor)=c("No","Sí")
levels(data$remedio_op_v2___1.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___2.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___3.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___4.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___5.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___6.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___7.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___8.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___9.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___10.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___11.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___12.factor)=c("Unchecked","Checked")
levels(data$remedio_op_v2___13.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_v2.factor)=c("Nunca","Menos de una vez al mes","Más de una vez al mes, pero no todas las semanas","Por los menos una vez a la semana","Todos los días")
levels(data$acetaminofen_2_v2___1.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_2_v2___2.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_2_v2___3.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_2_v2___4.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_2_v2___6.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_2_v2___5.factor)=c("Unchecked","Checked")
levels(data$analgesico_v2.factor)=c("Nunca","Menos de una vez al mes","Más de una vez al mes, pero no todas las semanas","Por los menos una vez a la semana","Todos los días")
levels(data$analgesico_3_v2___1.factor)=c("Unchecked","Checked")
levels(data$analgesico_3_v2___2.factor)=c("Unchecked","Checked")
levels(data$analgesico_3_v2___3.factor)=c("Unchecked","Checked")
levels(data$analgesico_3_v2___4.factor)=c("Unchecked","Checked")
levels(data$analgesico_2_v2___1.factor)=c("Unchecked","Checked")
levels(data$analgesico_2_v2___2.factor)=c("Unchecked","Checked")
levels(data$analgesico_2_v2___3.factor)=c("Unchecked","Checked")
levels(data$analgesico_2_v2___4.factor)=c("Unchecked","Checked")
levels(data$analgesico_2_v2___6.factor)=c("Unchecked","Checked")
levels(data$analgesico_2_v2___5.factor)=c("Unchecked","Checked")
levels(data$desensibili_v2.factor)=c("No","Sí {tto_desensibili_v2}")
levels(data$tto_desensibili_v2___1.factor)=c("Unchecked","Checked")
levels(data$tto_desensibili_v2___2.factor)=c("Unchecked","Checked")
levels(data$tto_desensibili_v2___3.factor)=c("Unchecked","Checked")
levels(data$tto_desensibili_v2___4.factor)=c("Unchecked","Checked")
levels(data$tto_desensibili_v2___5.factor)=c("Unchecked","Checked")
levels(data$desensibili_1_v2.factor)=c("No","Sí")
levels(data$gripe_v2.factor)=c("No","Sí")
levels(data$gripe_2_v2.factor)=c("No","Sí")
levels(data$neumo_v2.factor)=c("No","Sí","No sabe")
levels(data$covid_v2.factor)=c("No","Sí","No sabe")
levels(data$covid_exa_v2.factor)=c("No","Sí")
levels(data$covid_3_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_3_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_3_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_3_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_3_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_3_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_3_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_3_v2___8.factor)=c("Unchecked","Checked")
levels(data$covid_4_v2.factor)=c("No","Sí")
levels(data$covid_5_v2.factor)=c("No","Sí")
levels(data$covid_6_v2.factor)=c("No","Sí")
levels(data$covid_exa_2_v2.factor)=c("No","Sí")
levels(data$covid_7_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_7_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_7_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_7_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_7_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_7_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_7_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_7_v2___8.factor)=c("Unchecked","Checked")
levels(data$covid_8_v2.factor)=c("No","Sí")
levels(data$covid_9_v2.factor)=c("No","Sí")
levels(data$covid_10_v2.factor)=c("No","Sí")
levels(data$covid_exa_3_v2.factor)=c("No","Sí")
levels(data$covid_11_v2___1.factor)=c("Unchecked","Checked")
levels(data$covid_11_v2___2.factor)=c("Unchecked","Checked")
levels(data$covid_11_v2___3.factor)=c("Unchecked","Checked")
levels(data$covid_11_v2___4.factor)=c("Unchecked","Checked")
levels(data$covid_11_v2___5.factor)=c("Unchecked","Checked")
levels(data$covid_11_v2___6.factor)=c("Unchecked","Checked")
levels(data$covid_11_v2___7.factor)=c("Unchecked","Checked")
levels(data$covid_11_v2___8.factor)=c("Unchecked","Checked")
levels(data$covid_12_v2.factor)=c("No","Sí")
levels(data$covid_13_v2.factor)=c("No","Sí")
levels(data$covid_vacu_v2.factor)=c("No","Sí")
levels(data$covid_prov_1_v2.factor)=c("Pfizer","Astrazeneca","Sinovac","Moderna","Janssen","Novavax","Jonhnson & Jonhnson","Sputnik")
levels(data$covid_prov_2_v2.factor)=c("Pfizer","Astrazeneca","Sinovac","Moderna","Janssen","Novavax","Jonhnson & Jonhnson","Sputnik")
levels(data$covid_prov_3_v2.factor)=c("Pfizer","Astrazeneca","Sinovac","Moderna","Janssen","Novavax","Jonhnson & Jonhnson","Sputnik")
levels(data$covid_prov_4_v2.factor)=c("Pfizer","Astrazeneca","Sinovac","Moderna","Janssen","Novavax","Jonhnson & Jonhnson","Sputnik")
levels(data$covid_prov_5_v2.factor)=c("Pfizer","Astrazeneca","Sinovac","Moderna","Janssen","Novavax","Jonhnson & Jonhnson","Sputnik")
levels(data$vis_med_v2.factor)=c("No","Sí")
levels(data$vis_med_2_v2.factor)=c("No","Sí")
levels(data$vis_esp_v2.factor)=c("No","Sí")
levels(data$vis_esp_2_v2.factor)=c("No","Sí")
levels(data$cuestionario_respiratorio_2_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$af_int_trab.factor)=c("No","Sí")
levels(data$af_mod_trab.factor)=c("No","Sí")
levels(data$af_des.factor)=c("No","Sí")
levels(data$af_int_libre.factor)=c("No","Sí")
levels(data$af_mod_libre.factor)=c("No","Sí")
levels(data$actividad_fsica_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$cfa_leche.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_queso.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_huevos.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_carne.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_pollo.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_atun.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_pescados.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_embutidos.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_visceras_res.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_visceras_pollo.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_granos_secos.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_arroz.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_pan.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_tuberculos.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_verdu_cocidas.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_verdu_crudas.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_fru_jugo.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_fru_ente.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_comida_rap.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_mantequilla.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_cafe.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_panela.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_gaseosas.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_ali_paq.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_bienestarina.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_ali_fritos.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_golosinas.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_ali_light.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_ali_integrales.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_suplementos.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cfa_ali_calle.factor)=c(">1/día","1/día","4-5/sem","2-3/sem","1/sem","1-3/mes","5-10/año","1-4/año","Nunca")
levels(data$cuestionario_de_frecuencia_de_alimentos_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$exmen_fsico_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$edta_tm.factor)=c("No","Sí","No Aplica")
levels(data$seco_tm.factor)=c("No","Sí","No Aplica")
levels(data$plasma_tm.factor)=c("No","Sí","No Aplica")
levels(data$suero_tm.factor)=c("No","Sí","No Aplica")
levels(data$bf_tm.factor)=c("No","Sí","No Aplica")
levels(data$adn_tm.factor)=c("No","Sí","No Aplica")
levels(data$arn_tm.factor)=c("No","Sí","No Aplica")
levels(data$toma_de_muestra_anlisis_bioqumicos_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$calidad.factor)=c("A","B","C","D","E","F")
levels(data$interpretacion.factor)=c("Obtrucción Leve","Obstrucción Moderada","Obstrucción Moderada-Severa","Obstrucción Severa","Restricción Leve","Restricción Moderada","Restricción Moderada-Severa","Restricción Severa")
levels(data$espirometra_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$i_m_carotidea.factor)=c("Normal","Ligero","Discreto","Moderado","Severo")
levels(data$placas_atero.factor)=c("Sí","No")
levels(data$a_vertebral.factor)=c("Normal","Ligero","Discreto","Moderado","Severo")
levels(data$insuficiencia_vb.factor)=c("Sí","No")
levels(data$eco_dopler_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$sil_pit.factor)=c("No","Sí")
levels(data$sil_pit_1_1.factor)=c("No","Sí")
levels(data$sil_pit_1_2.factor)=c("No","Sí")
levels(data$sil_pit_1_4.factor)=c("Todos los días","Al menos una vez a la semana, pero no todos los días","Esporádicamente")
levels(data$tirantez.factor)=c("No","Sí")
levels(data$falta_aire.factor)=c("No","Sí")
levels(data$falt_aire.factor)=c("No","Sí")
levels(data$falt_aire_ejer.factor)=c("No","Sí")
levels(data$falt_aire_noche.factor)=c("No","Sí")
levels(data$ata_tos.factor)=c("No","Sí")
levels(data$ata_tos_1_1.factor)=c("Menos de una vez al mes","Todos los meses, pero no todas las semanas","Todas las semanas, pero no todos los días","Todos los días")
levels(data$ata_tos_3.factor)=c("No","Sí")
levels(data$ata_tos_4.factor)=c("No","Sí")
levels(data$ata_tos_4_1.factor)=c("No","Sí")
levels(data$esputos.factor)=c("No","Sí")
levels(data$esputos_2.factor)=c("No","Sí")
levels(data$esputos_2_1.factor)=c("No","Sí")
levels(data$sin_res_peor.factor)=c("No","Sí")
levels(data$resp.factor)=c("Continuamente, nunca respira totalmente bien","A menudo, pero siempre se recupera completamente","Sólo de vez en cuando","No tengo problemas")
levels(data$dif_cam.factor)=c("No","Sí {dif_cam_2}")
levels(data$falt_aire_cam.factor)=c("No","Sí")
levels(data$falt_aire_cam_2.factor)=c("No","Sí")
levels(data$falt_aire_cam_3.factor)=c("No","Sí")
levels(data$falt_aire_cam_5.factor)=c("No","Sí")
levels(data$falt_aire_cam_6.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$asma.factor)=c("No","Sí")
levels(data$asma_1_1.factor)=c("No","Sí")
levels(data$asma_1_5___1.factor)=c("Unchecked","Checked")
levels(data$asma_1_5___2.factor)=c("Unchecked","Checked")
levels(data$asma_1_5___3.factor)=c("Unchecked","Checked")
levels(data$asma_1_5___4.factor)=c("Unchecked","Checked")
levels(data$asma_1_5___5.factor)=c("Unchecked","Checked")
levels(data$asma_1_5___6.factor)=c("Unchecked","Checked")
levels(data$asma_1_5___7.factor)=c("Unchecked","Checked")
levels(data$asma_1_6.factor)=c("No","Sí")
levels(data$asma_1_9.factor)=c("todas las noches, o casi todas las noches","más de una vez a la semana, pero no la mayoría de las noches","más de dos veces al mes, pero no más de una vez a la semana","menos de dos veces al mes","nunca")
levels(data$asma_1_10.factor)=c("continuamente","más o menos una vez al día","más de una vez a la semana, pero menos de una vez al día","menos de dos veces","nunca")
levels(data$asma_1_11.factor)=c("No","Sí")
levels(data$asma_1_12.factor)=c("No","Sí")
levels(data$bronq_cro.factor)=c("No","Sí")
levels(data$epoc.factor)=c("No","Sí")
levels(data$enfisema.factor)=c("No","Sí")
levels(data$otra_enf_pulm.factor)=c("No","Sí")
levels(data$otra_enf_pulm_op___1.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op___2.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op___3.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op___4.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op___5.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op___6.factor)=c("Unchecked","Checked")
levels(data$otra_enf_pulm_op___7.factor)=c("Unchecked","Checked")
levels(data$rinitis.factor)=c("No","Sí")
levels(data$estornudos.factor)=c("No","Sí")
levels(data$estornudos_1_1.factor)=c("No","Sí")
levels(data$estornudos_1_2.factor)=c("No","Sí")
levels(data$estornudos_1_3___1.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3___2.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3___3.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3___4.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3___5.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3___6.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_3___7.factor)=c("Unchecked","Checked")
levels(data$estornudos_1_4.factor)=c("No","Sí")
levels(data$estornudos_1_5.factor)=c("No","Sí")
levels(data$moq_nariz.factor)=c("No ha habido problema (el síntoma no estaba presente)","Había/hay un problema, pero no particularmente molesto","Problema molesto, pero que no interfiere con las actividades diarias ni con el sueño","Problemas que interfiere con las actividades diarias y/o con el sueño")
levels(data$nariz_tapada.factor)=c("No ha habido problema (el síntoma no estaba presente)","Había/hay un problema, pero no particularmente molesto","Problema molesto, pero que no interfiere con las actividades diarias ni con el sueño","Problemas que interfiere con las actividades diarias y/o con el sueño")
levels(data$picor_nariz.factor)=c("No ha habido problema (el síntoma no estaba presente)","Había/hay un problema, pero no particularmente molesto","Problema molesto, pero que no interfiere con las actividades diarias ni con el sueño","Problemas que interfiere con las actividades diarias y/o con el sueño")
levels(data$estornudos_2.factor)=c("No ha habido problema (el síntoma no estaba presente)","Había/hay un problema, pero no particularmente molesto","Problema molesto, pero que no interfiere con las actividades diarias ni con el sueño","Problemas que interfiere con las actividades diarias y/o con el sueño")
levels(data$ojos_llorosos.factor)=c("No ha habido problema (el síntoma no estaba presente)","Había/hay un problema, pero no particularmente molesto","Problema molesto, pero que no interfiere con las actividades diarias ni con el sueño","Problemas que interfiere con las actividades diarias y/o con el sueño")
levels(data$tras_nas.factor)=c("No","Sí")
levels(data$tras_nas_1_1.factor)=c("No","Sí")
levels(data$tras_nas_1_2.factor)=c("No","Sí")
levels(data$nar_tap.factor)=c("No","Sí")
levels(data$pre_fre.factor)=c("No","Sí")
levels(data$mucosidad.factor)=c("No","Sí")
levels(data$olfato.factor)=c("No","Sí")
levels(data$sinusitis.factor)=c("No","Sí")
levels(data$sinusitis_1_1.factor)=c("No","Sí")
levels(data$eczema.factor)=c("No","Sí")
levels(data$eczema_1_2.factor)=c("No","Sí")
levels(data$eczema_1_3.factor)=c("No","Sí")
levels(data$sarpullidos.factor)=c("No","Sí")
levels(data$erupcion.factor)=c("No","Sí")
levels(data$erupcion_1_1.factor)=c("No","Sí")
levels(data$erupcion_1_2.factor)=c("No","Sí")
levels(data$expo_trab2.factor)=c("No","Sí ¿cuando? {expo_trab2_fec}")
levels(data$expo_trab1.factor)=c("No","Sí")
levels(data$expo_trab1_1.factor)=c("No","Sí")
levels(data$expo_trab1_1_1___1.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_1___3.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_1___4.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_1___5.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_1___6.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_1___7.factor)=c("Unchecked","Checked")
levels(data$expo_trab1_1_2.factor)=c("No","Sí")
levels(data$humed_trab1.factor)=c("No","Sí")
levels(data$moho_trab1.factor)=c("No","Sí")
levels(data$moho_alim_trab1.factor)=c("No","Sí")
levels(data$pro_lim_trab1.factor)=c("No","Sí")
levels(data$pro_lim_trab1_1.factor)=c("")
levels(data$hipoclorito_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$amoniaco_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$quitamanchas_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$acidos_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$ceras_suelos_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$ceras_muebles_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$sprays_suelos_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$sprays_muebles_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$detergentes_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$sprays_cristales_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$alcohol_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$jabones_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$otro_desinfectante_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$sprays_desengrasantes_1.factor)=c("nunca","< 1 día/sem","1-3 días/sem","4-7 días/sem")
levels(data$expo.factor)=c("No","Sí")
levels(data$expo_2_1.factor)=c("Un incendio o una explosión","Una fuga o un escape","Una inhalación relacionada con una mezcla de productos de limpieza","Otra cosa")
levels(data$expo_2_2.factor)=c("En su propia casa","Una fuga o un escape","Un otro lugar interior","En el exterior (aire libre)")
levels(data$expo_2_3.factor)=c("No","Sí")
levels(data$expo_2_4_1.factor)=c("No","Sí")
levels(data$vivienda.factor)=c("una casa unifamiliar separada de cualquier otra","una casa unifamiliar adherida a una o más casas","un edificio para 2 familias","un edificio para 3 o 4 familias","un edificio para 5 o más familias","Otro {vivienda_otro}")
levels(data$air_acon.factor)=c("No","Sí")
levels(data$combus_cocinar___1.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar___2.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar___3.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar___4.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar___5.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar___6.factor)=c("Unchecked","Checked")
levels(data$combus_cocinar___7.factor)=c("Unchecked","Checked")
levels(data$cocina.factor)=c("No","Sí")
levels(data$cocinar_ventana.factor)=c("la mayor parte del tiempo","algunas veces","pocas veces (o muy de vez en cuando)","no hay ninguna puerta ni ventana que dé al exterior","nunca")
levels(data$extractor.factor)=c("No","Sí")
levels(data$extrator_1_1.factor)=c("siempre","algunas veces","nunca")
levels(data$goteras.factor)=c("No","Sí","No sabe")
levels(data$goteras_1.factor)=c("No","Sí","No sabe")
levels(data$manchas.factor)=c("No","Sí")
levels(data$moho_manchas_casa.factor)=c("No","Sí")
levels(data$moho_casa.factor)=c("No","Sí","No sabe")
levels(data$moho_lugar___1.factor)=c("Unchecked","Checked")
levels(data$moho_lugar___2.factor)=c("Unchecked","Checked")
levels(data$moho_lugar___3.factor)=c("Unchecked","Checked")
levels(data$moho_lugar___4.factor)=c("Unchecked","Checked")
levels(data$moho_lugar___5.factor)=c("Unchecked","Checked")
levels(data$moho_lugar___6.factor)=c("Unchecked","Checked")
levels(data$moho_casa_2.factor)=c("No","Sí")
levels(data$moho_casa_4___1.factor)=c("Unchecked","Checked")
levels(data$moho_casa_4___2.factor)=c("Unchecked","Checked")
levels(data$moho_casa_4___4.factor)=c("Unchecked","Checked")
levels(data$moho_casa_4___5.factor)=c("Unchecked","Checked")
levels(data$moho_casa_4___6.factor)=c("Unchecked","Checked")
levels(data$moho_casa_5.factor)=c("Sótano (00)","Planta baja (01)","Planta (02)","2º Planta (03)")
levels(data$moho_dormi_1___1.factor)=c("Unchecked","Checked")
levels(data$moho_dormi_1___2.factor)=c("Unchecked","Checked")
levels(data$moho_dormi_1___4.factor)=c("Unchecked","Checked")
levels(data$moho_dormi_1___5.factor)=c("Unchecked","Checked")
levels(data$moho_dormi_1___6.factor)=c("Unchecked","Checked")
levels(data$hab_uso.factor)=c("Sótano (00)","Planta baja (01)","Planta (02)","2º Planta (03)")
levels(data$ventanas_2.factor)=c("Siempre","Alguna vez","Nunca")
levels(data$gato_1.factor)=c("No","Sí")
levels(data$gato_2.factor)=c("No","Sí")
levels(data$perro.factor)=c("No","Sí")
levels(data$perro_1.factor)=c("No","Sí")
levels(data$perro_2.factor)=c("No","Sí")
levels(data$pajaro.factor)=c("No","Sí")
levels(data$pajaro_1.factor)=c("No","Sí")
levels(data$limpieza.factor)=c("Nunca","< 1 día/semana","1-3 días/semana","4-7 días/semana")
levels(data$hipoclorito_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$amoniaco_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$quitamanchas_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$acidos_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$ceras_suelos_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$ceras_muebles_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$sprays_suelos_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$sprays_muebles_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$sprays_desengrasantes_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$detergentes_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$alcohol_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$sprays_cristales_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$jabones_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$otro_desinfectante_2.factor)=c("nunca","< 1 d/sem","1-3 d/sem","4-7 d/sem")
levels(data$productos_casa_2.factor)=c("Nunca","< 1d/sem","1-3d/sem","4-7d/sem")
levels(data$productos_casa_3.factor)=c("Nunca","< 1d/sem","1-3d/sem","4-7d/sem")
levels(data$productos_casa_4.factor)=c("Nunca","< 1d/sem","1-3d/sem","4-7d/sem")
levels(data$insecticidas_1.factor)=c("Nunca","< 1d/sem","1-3d/sem","4-7d/sem")
levels(data$insecticidas_2.factor)=c("Nunca","< 1d/sem","1-3d/sem","4-7d/sem")
levels(data$insecticidas_3.factor)=c("Nunca","< 1d/sem","1-3d/sem","4-7d/sem")
levels(data$enfer_alime.factor)=c("No","Sí")
levels(data$enfer_alime_siem.factor)=c("No","Sí")
levels(data$alime___1.factor)=c("Unchecked","Checked")
levels(data$alime___2.factor)=c("Unchecked","Checked")
levels(data$alime___3.factor)=c("Unchecked","Checked")
levels(data$alime___4.factor)=c("Unchecked","Checked")
levels(data$alime___5.factor)=c("Unchecked","Checked")
levels(data$alime___6.factor)=c("Unchecked","Checked")
levels(data$alime___7.factor)=c("Unchecked","Checked")
levels(data$alime___8.factor)=c("Unchecked","Checked")
levels(data$alime___9.factor)=c("Unchecked","Checked")
levels(data$alime___10.factor)=c("Unchecked","Checked")
levels(data$alime___11.factor)=c("Unchecked","Checked")
levels(data$alime___12.factor)=c("Unchecked","Checked")
levels(data$alime___13.factor)=c("Unchecked","Checked")
levels(data$alime___14.factor)=c("Unchecked","Checked")
levels(data$alime___15.factor)=c("Unchecked","Checked")
levels(data$alime___16.factor)=c("Unchecked","Checked")
levels(data$alime___17.factor)=c("Unchecked","Checked")
levels(data$alime___18.factor)=c("Unchecked","Checked")
levels(data$alime___19.factor)=c("Unchecked","Checked")
levels(data$alime___20.factor)=c("Unchecked","Checked")
levels(data$alime___21.factor)=c("Unchecked","Checked")
levels(data$alime___22.factor)=c("Unchecked","Checked")
levels(data$alime___23.factor)=c("Unchecked","Checked")
levels(data$alime___24.factor)=c("Unchecked","Checked")
levels(data$alime___26.factor)=c("Unchecked","Checked")
levels(data$alime___27.factor)=c("Unchecked","Checked")
levels(data$alime___28.factor)=c("Unchecked","Checked")
levels(data$enro_alime_otro_1.factor)=c("No","Sí")
levels(data$vomi_alime_otro_1.factor)=c("No","Sí")
levels(data$tapa_alime_otro_1.factor)=c("No","Sí")
levels(data$dol_cab_alime_otro_1.factor)=c("No","Sí")
levels(data$alien_alime_otro_1.factor)=c("No","Sí")
levels(data$picor_alime_otro_1.factor)=c("No","Sí")
levels(data$dif_tra_alime_otro_1.factor)=c("No","Sí")
levels(data$desma_alime_otro_1.factor)=c("No","Sí")
levels(data$inye_alime_otro_1.factor)=c("No","Sí")
levels(data$otro_alime_otro_1.factor)=c("No","Sí {otro_alime_otro_1_1}")
levels(data$tiemp_alime_otro_1.factor)=c("Menos de media hora después","De media hora a una hora","Entre una y dos horas","Entre dos y cuatro horas","Más de cuatro horas después")
levels(data$enro_alime_otro_2.factor)=c("No","Sí")
levels(data$vomi_alime_otro_2.factor)=c("No","Sí")
levels(data$picor_alime_otro_2.factor)=c("No","Sí")
levels(data$dif_tra_alime_otro_2.factor)=c("No","Sí")
levels(data$desma_alime_otro_2.factor)=c("No","Sí")
levels(data$inye_alime_otro_2.factor)=c("No","Sí")
levels(data$otro_alime_otro_2.factor)=c("No","Sí {otro_alime_otro_1_2}")
levels(data$tiemp_alime_otro_2.factor)=c("Menos de media hora después","De media hora a una hora","Entre una y dos horas","Entre dos y cuatro horas","Más de cuatro horas después")
levels(data$enro_alime_otro_3.factor)=c("No","Sí")
levels(data$vomi_alime_otro_3.factor)=c("No","Sí")
levels(data$picor_alime_otro_3.factor)=c("No","Sí")
levels(data$dif_tra_alime_otro_3.factor)=c("No","Sí")
levels(data$desma_alime_otro_3.factor)=c("No","Sí")
levels(data$inye_alime_otro_3.factor)=c("No","Sí")
levels(data$otro_alime_otro_3.factor)=c("No","Sí {otro_alime_otro_1_3}")
levels(data$tiemp_alime_otro_3.factor)=c("Menos de media hora después","De media hora a una hora","Entre una y dos horas","Entre dos y cuatro horas","Más de cuatro horas después")
levels(data$tos_anim.factor)=c("No","Sí")
levels(data$tos_anim_op___1.factor)=c("Unchecked","Checked")
levels(data$tos_anim_op___2.factor)=c("Unchecked","Checked")
levels(data$tos_anim_op___3.factor)=c("Unchecked","Checked")
levels(data$tos_anim_op___4.factor)=c("Unchecked","Checked")
levels(data$sil_anim.factor)=c("No","Sí")
levels(data$sil_anim_op___1.factor)=c("Unchecked","Checked")
levels(data$sil_anim_op___2.factor)=c("Unchecked","Checked")
levels(data$sil_anim_op___3.factor)=c("Unchecked","Checked")
levels(data$sil_anim_op___4.factor)=c("Unchecked","Checked")
levels(data$opre_anim.factor)=c("No","Sí")
levels(data$opre_anim_op___1.factor)=c("Unchecked","Checked")
levels(data$opre_anim_op___2.factor)=c("Unchecked","Checked")
levels(data$opre_anim_op___3.factor)=c("Unchecked","Checked")
levels(data$opre_anim_op___4.factor)=c("Unchecked","Checked")
levels(data$falt_aire_anim.factor)=c("No","Sí")
levels(data$falta_aire_anim_op___1.factor)=c("Unchecked","Checked")
levels(data$falta_aire_anim_op___2.factor)=c("Unchecked","Checked")
levels(data$falta_aire_anim_op___3.factor)=c("Unchecked","Checked")
levels(data$falta_aire_anim_op___4.factor)=c("Unchecked","Checked")
levels(data$nariz_anim.factor)=c("No","Sí")
levels(data$nariz_anim_op___1.factor)=c("Unchecked","Checked")
levels(data$nariz_anim_op___2.factor)=c("Unchecked","Checked")
levels(data$nariz_anim_op___3.factor)=c("Unchecked","Checked")
levels(data$nariz_anim_op___4.factor)=c("Unchecked","Checked")
levels(data$ojos_anim.factor)=c("No","Sí")
levels(data$ojos_anim_op___1.factor)=c("Unchecked","Checked")
levels(data$ojos_anim_op___2.factor)=c("Unchecked","Checked")
levels(data$ojos_anim_op___3.factor)=c("Unchecked","Checked")
levels(data$ojos_anim_op___4.factor)=c("Unchecked","Checked")
levels(data$tos_2.factor)=c("No","Sí")
levels(data$sil_2.factor)=c("No","Sí")
levels(data$opre_2.factor)=c("No","Sí")
levels(data$falt_aire_2.factor)=c("No","Sí")
levels(data$nariz_2.factor)=c("No","Sí")
levels(data$ojos_2.factor)=c("No","Sí")
levels(data$tos_3.factor)=c("No","Sí")
levels(data$sil_3.factor)=c("No","Sí")
levels(data$opre_3.factor)=c("No","Sí")
levels(data$falt_aire_3.factor)=c("No","Sí")
levels(data$nariz_3.factor)=c("No","Sí")
levels(data$ojos_3.factor)=c("No","Sí")
levels(data$med_inha.factor)=c("No","Sí")
levels(data$ago_beta2.factor)=c("No","Sí")
levels(data$ago_beta2_corta_1.factor)=c("Salbutamol","Fenoterol","Terbutalina","Isoproterenol")
levels(data$ago_beta2_corta_2.factor)=c("Salbutamol","Fenoterol","Terbutalina","Isoproterenol")
levels(data$ago_beta2_corta_3.factor)=c("Salbutamol","Fenoterol","Terbutalina","Isoproterenol")
levels(data$ago_beta2_corta_4.factor)=c("Salbutamol","Fenoterol","Terbutalina","Isoproterenol")
levels(data$ago_beta2_fr_1.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$ago_beta2_fr_2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$ago_beta2_fr_3.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$ago_beta2_fr_4.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$ago_beta2_pro.factor)=c("No","Sí")
levels(data$ago_beta2_pro_1.factor)=c("Formoterol","Salmeterol")
levels(data$ago_beta2_pro_2.factor)=c("Formoterol","Salmeterol")
levels(data$ago_beta2_fr_5.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$ago_beta2_fr_6.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$antimus_cort.factor)=c("No","Sí")
levels(data$antimus_corta_1.factor)=c("Bromuro de Ipatropio")
levels(data$antimus_fr_1.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$antimus_pro.factor)=c("No","Sí")
levels(data$antimus_pro_1.factor)=c("Bromuro de Tiotropio","Glicopirronio")
levels(data$antimus_pro_2.factor)=c("Bromuro de Tiotropio","Glicopirronio")
levels(data$antimus_fr_2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$antimus_fr_3.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_inha.factor)=c("No","Sí")
levels(data$este_inha_1.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_inha_2.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_inha_3.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_inha_4.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_inha_5.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_inha_6.factor)=c("Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$este_fr_1.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_fr_2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_fr_3.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_fr_4.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_fr_5.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$este_fr_6.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_inha.factor)=c("No","Sí")
levels(data$combi_inha_op___7.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op___8.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op___9.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op___10.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op___11.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op___1.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op___2.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op___3.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op___4.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op___5.factor)=c("Unchecked","Checked")
levels(data$combi_inha_op___6.factor)=c("Unchecked","Checked")
levels(data$combi_inha_1.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_2.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_3.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_4.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_5.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_6.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_7.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_8.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_9.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_10.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_inha_11.factor)=c("Salbutamol","Salmeterol","Bromuro de Ipatropio","Bromuro de Tiotropio","Glicopirronio","Beclometasona","Budesonida","Ciclesonida","Fluticasona","Furoato de Mometasona","Acetonida de Triamcinolona")
levels(data$combi_fr_1.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_2.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_3.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_4.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_5.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_6.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_7.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_8.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_9.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_10.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$combi_fr_11.factor)=c("Cuando los necesita","En tratamientos cortos","Continuamente","Nunca")
levels(data$med_oral.factor)=c("No","Sí")
levels(data$este_oral.factor)=c("No","Sí")
levels(data$este_oral_cual_1.factor)=c("Dexametasona","Prednisona","Prednisolona","Hidrocortisona","Betametasona","Otro")
levels(data$este_oral_cual_2.factor)=c("Dexametasona","Prednisona","Prednisolona","Hidrocortisona","Betametasona","Otro")
levels(data$este_oral_cual_3.factor)=c("Dexametasona","Prednisona","Prednisolona","Hidrocortisona","Betametasona","Otro")
levels(data$este_oral_cual_4.factor)=c("Dexametasona","Prednisona","Prednisolona","Hidrocortisona","Betametasona","Otro")
levels(data$este_oral_cual_5.factor)=c("Dexametasona","Prednisona","Prednisolona","Hidrocortisona","Betametasona","Otro")
levels(data$este_oral_cual_6.factor)=c("Dexametasona","Prednisona","Prednisolona","Hidrocortisona","Betametasona","Otro")
levels(data$antibi.factor)=c("No","Sí")
levels(data$antibi_2.factor)=c("No","Sí")
levels(data$remedio.factor)=c("No","Sí")
levels(data$remedio_op___1.factor)=c("Unchecked","Checked")
levels(data$remedio_op___2.factor)=c("Unchecked","Checked")
levels(data$remedio_op___3.factor)=c("Unchecked","Checked")
levels(data$remedio_op___4.factor)=c("Unchecked","Checked")
levels(data$remedio_op___5.factor)=c("Unchecked","Checked")
levels(data$remedio_op___6.factor)=c("Unchecked","Checked")
levels(data$remedio_op___7.factor)=c("Unchecked","Checked")
levels(data$remedio_op___8.factor)=c("Unchecked","Checked")
levels(data$remedio_op___9.factor)=c("Unchecked","Checked")
levels(data$remedio_op___10.factor)=c("Unchecked","Checked")
levels(data$remedio_op___11.factor)=c("Unchecked","Checked")
levels(data$remedio_op___12.factor)=c("Unchecked","Checked")
levels(data$remedio_op___13.factor)=c("Unchecked","Checked")
levels(data$receta_med.factor)=c("No","Sí")
levels(data$receta_med_2.factor)=c("Toda la medicación","Casi toda la medicación","Algo de la medicación","Nada")
levels(data$receta_med_3.factor)=c("Toda la medicación","Casi toda la medicación","Algo de la medicación","Nada")
levels(data$receta_med_4.factor)=c("No","Sí")
levels(data$receta_med_5.factor)=c("No","Sí")
levels(data$med_otras.factor)=c("No","Sí")
levels(data$acetaminofen.factor)=c("Nunca","Menos de una vez al mes","Más de una vez al mes, pero no todas las semanas","Por los menos una vez a la semana","Todos los días")
levels(data$acetaminofen_2___1.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_2___2.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_2___3.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_2___4.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_2___6.factor)=c("Unchecked","Checked")
levels(data$acetaminofen_2___5.factor)=c("Unchecked","Checked")
levels(data$analgesico.factor)=c("Nunca","Menos de una vez al mes","Más de una vez al mes, pero no todas las semanas","Por los menos una vez a la semana","Todos los días")
levels(data$analgesico_3___1.factor)=c("Unchecked","Checked")
levels(data$analgesico_3___2.factor)=c("Unchecked","Checked")
levels(data$analgesico_3___3.factor)=c("Unchecked","Checked")
levels(data$analgesico_3___4.factor)=c("Unchecked","Checked")
levels(data$analgesico_2___1.factor)=c("Unchecked","Checked")
levels(data$analgesico_2___2.factor)=c("Unchecked","Checked")
levels(data$analgesico_2___3.factor)=c("Unchecked","Checked")
levels(data$analgesico_2___4.factor)=c("Unchecked","Checked")
levels(data$analgesico_2___6.factor)=c("Unchecked","Checked")
levels(data$analgesico_2___5.factor)=c("Unchecked","Checked")
levels(data$desensibili.factor)=c("No","Sí {tto_desensibili}")
levels(data$tto_desensibili___1.factor)=c("Unchecked","Checked")
levels(data$tto_desensibili___2.factor)=c("Unchecked","Checked")
levels(data$tto_desensibili___3.factor)=c("Unchecked","Checked")
levels(data$tto_desensibili___4.factor)=c("Unchecked","Checked")
levels(data$tto_desensibili___5.factor)=c("Unchecked","Checked")
levels(data$desensibili_1.factor)=c("No","Sí")
levels(data$gripe.factor)=c("No","Sí")
levels(data$gripe_2.factor)=c("No","Sí")
levels(data$neumo.factor)=c("No","Sí","No sabe")
levels(data$covid.factor)=c("No","Sí","No sabe")
levels(data$covid_exa.factor)=c("No","Sí")
levels(data$covid_3___1.factor)=c("Unchecked","Checked")
levels(data$covid_3___2.factor)=c("Unchecked","Checked")
levels(data$covid_3___3.factor)=c("Unchecked","Checked")
levels(data$covid_3___4.factor)=c("Unchecked","Checked")
levels(data$covid_3___5.factor)=c("Unchecked","Checked")
levels(data$covid_3___6.factor)=c("Unchecked","Checked")
levels(data$covid_3___7.factor)=c("Unchecked","Checked")
levels(data$covid_3___8.factor)=c("Unchecked","Checked")
levels(data$covid_4.factor)=c("No","Sí")
levels(data$covid_5.factor)=c("No","Sí")
levels(data$covid_6.factor)=c("No","Sí")
levels(data$covid_exa_2.factor)=c("No","Sí")
levels(data$covid_7___1.factor)=c("Unchecked","Checked")
levels(data$covid_7___2.factor)=c("Unchecked","Checked")
levels(data$covid_7___3.factor)=c("Unchecked","Checked")
levels(data$covid_7___4.factor)=c("Unchecked","Checked")
levels(data$covid_7___5.factor)=c("Unchecked","Checked")
levels(data$covid_7___6.factor)=c("Unchecked","Checked")
levels(data$covid_7___7.factor)=c("Unchecked","Checked")
levels(data$covid_7___8.factor)=c("Unchecked","Checked")
levels(data$covid_8.factor)=c("No","Sí")
levels(data$covid_9.factor)=c("No","Sí")
levels(data$covid_10.factor)=c("No","Sí")
levels(data$covid_exa_3.factor)=c("No","Sí")
levels(data$covid_11___1.factor)=c("Unchecked","Checked")
levels(data$covid_11___2.factor)=c("Unchecked","Checked")
levels(data$covid_11___3.factor)=c("Unchecked","Checked")
levels(data$covid_11___4.factor)=c("Unchecked","Checked")
levels(data$covid_11___5.factor)=c("Unchecked","Checked")
levels(data$covid_11___6.factor)=c("Unchecked","Checked")
levels(data$covid_11___7.factor)=c("Unchecked","Checked")
levels(data$covid_11___8.factor)=c("Unchecked","Checked")
levels(data$covid_12.factor)=c("No","Sí")
levels(data$covid_13.factor)=c("No","Sí")
levels(data$covid_vacu.factor)=c("No","Sí")
levels(data$covid_prov_1.factor)=c("Pfizer","Astrazeneca","Sinovac","Moderna","Janssen","Novavax","Jonhnson & Jonhnson","Sputnik")
levels(data$covid_prov_2.factor)=c("Pfizer","Astrazeneca","Sinovac","Moderna","Janssen","Novavax","Jonhnson & Jonhnson","Sputnik")
levels(data$covid_prov_3.factor)=c("Pfizer","Astrazeneca","Sinovac","Moderna","Janssen","Novavax","Jonhnson & Jonhnson","Sputnik")
levels(data$covid_prov_4.factor)=c("Pfizer","Astrazeneca","Sinovac","Moderna","Janssen","Novavax","Jonhnson & Jonhnson","Sputnik")
levels(data$covid_prov_5.factor)=c("Pfizer","Astrazeneca","Sinovac","Moderna","Janssen","Novavax","Jonhnson & Jonhnson","Sputnik")
levels(data$urgen.factor)=c("No","Sí")
levels(data$urgen_2.factor)=c("No","Sí")
levels(data$urgen_3.factor)=c("No","Sí")
levels(data$vis_med.factor)=c("No","Sí")
levels(data$vis_med_2.factor)=c("No","Sí")
levels(data$vis_esp.factor)=c("No","Sí")
levels(data$vis_esp_2.factor)=c("No","Sí")
levels(data$vis_reg_med.factor)=c("No","Sí")
levels(data$vis_reg.factor)=c("Enfermera {enfer_veces}","Fisioterapia {fisio_veces}","Terapias de medicinas alternativas {alter_veces}","Ninguno")
levels(data$prueb_clin.factor)=c("No","Sí")
levels(data$prueb_clin_2.factor)=c("No","Sí")
levels(data$prueb_clin_3.factor)=c("No","Sí")
levels(data$prueb_clin_4___1.factor)=c("Unchecked","Checked")
levels(data$prueb_clin_4___2.factor)=c("Unchecked","Checked")
levels(data$prueb_clin_4___3.factor)=c("Unchecked","Checked")
levels(data$prueb_clin_4___4.factor)=c("Unchecked","Checked")
levels(data$prueb_clin_4___5.factor)=c("Unchecked","Checked")
levels(data$perd_trab.factor)=c("No he trabajado","No","Sí")
levels(data$perd_trab_4.factor)=c("No","Sí")
levels(data$perd_trab_6.factor)=c("No","Sí")
levels(data$perd_trab_7.factor)=c("No","Sí")
levels(data$cuestionario_respiratorio_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$sue_1_a.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$sue_1_b.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$sue_1_c.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$sue_1_d.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$sue_1_e.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$sue_1_f.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$sue_1_g.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$sue_1_h.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$sue_1_i.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$sue_1_j.factor)=c("1","2","3","4","5","6","7","8","9","10")
levels(data$est_sue.factor)=c("1","2","3","4","5")
levels(data$est_sue_2.factor)=c("1","2","3","4","5")
levels(data$racksa_sue.factor)=c("A1","A2","A3","A4","A5")
levels(data$racksb_sue.factor)=c("B1","B2","B3","B4","B5")
levels(data$racksc_sue.factor)=c("C1","C2","C3","C4","C5")
levels(data$racksd_sue.factor)=c("D1","D2","D3","D4","D5")
levels(data$racksa_sue_2.factor)=c("A1","A2","A3","A4","A5")
levels(data$racksb_sue_2.factor)=c("B1","B2","B3","B4","B5")
levels(data$racksc_sue_2.factor)=c("C1","C2","C3","C4","C5")
levels(data$racksd_sue_2.factor)=c("D1","D2","D3","D4","D5")
levels(data$caja_sue.factor)=c("5","4","3","2","1")
levels(data$caja_sue_2.factor)=c("5","4","3","2","1")
levels(data$ubicacion_archivo_general_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$techo.factor)=c("Tejas (arcilla, metálica, cemento)","Tejuela (madera, asfáltica)","Losa de hormigón","Zinc","Fibra de vidrio","Paja","Desechos (lata, cartones, plásticos)","Otro {otro_techo}")
levels(data$paredes.factor)=c("Hormigón armado, piedra","Ladrillo","Páneles estructurados, bloque","Madera","Internit","Barro empajado","Desecho (latas, cartones, plásticos)","Otro {otro_paredes}")
levels(data$piso.factor)=c("Cerámica","Madera (entablado)","Alfombra","Baldosas de cemento","Plástico","Ladrillo","Tierra","otro {otro_piso}")
levels(data$ndice_de_materialidad_complete.factor)=c("Incomplete","Unverified","Complete")

# Save dataframe as .Rda
saveRDS(data, file="CartagenaCohortStudy_R_2022-08-09_0211.Rda")
