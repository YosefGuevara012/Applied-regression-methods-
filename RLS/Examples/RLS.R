
##########################################################################
#####################################################
######### UNIVERSIDAD NACIONAL DE COLOMBIA, SEDE BOGOT�.
######### DEPARTAMENTO DE ESTAD�STICA.
############PROFESOR: LUIS FERNANDO GRAJALES H. ####
### Enviarme correcciones o inquietudes a 
############ lfgrajalesh@unal.edu.co
###### OCTUBRE del 2020. CURSO: MODELOS DE REGRESI�N.
####### R version 4.0.3
#### EJEMPLOS DE regresi�n lineal M�LTIPLE.
library(MASS)
library(lmtest)
library(nortest)
#############################################################
###################### EJEMPLOS RLS con TALLA DE BEB�S 
########## Base de datos (parcial) de 7 beb�s reci�n nacidos.
########## ### Una variable respuesta: Talla_hoy (en cm),
######### 4 Covariables, continuas: Edad_d�as,
###### Talla_nacer, Peso_nacer y Torax_nacer.  
###### Los datos completos est�n en Walpole y Myers (2017).
###########################################################
#### REGRESI�N tallas.beb�s 
babies<-read.csv("C:/Users/yosef/OneDrive/Documents/Esp_Estadistica/Applied-regression-methods-/Correlation/Examples/babies.csv", header=T,sep=";")
babies
attach(babies)
head(babies)
summary(babies)
dim(babies)
library(MASS)
library(lmtest)
library(nortest)
##### MODELO DE RLS CON TORAX
baby.fit11<-lm(Talla_hoy~Torax_nacer) # 1) AJUSTAR EL MODELO 
baby.fit11     ### 2) COEFICIENTES ESTIMADOS bo y b1

# GENERACION DE RESIDUALES
resid.torax<-residuals(baby.fit11)  ### Residuales (errores estimados)
resid.torax
########## COMIENZO A VALIDAR SUPUESTOS.
shapiro.test(residuals(baby.fit11)) ## normalidad 
lillie.test(residuals(baby.fit11)) ### normalidad
bptest(Talla_hoy~ Torax_nacer) ### Homocedasticidad Breusch-Pagan 
gqtest(lm(Talla_hoy~ Torax_nacer)) ### Homocedasticidad Goldfeld-Quandt
dwtest(Talla_hoy ~ residuals(baby.fit11)) # Durbin Watson independencia
### EN RESUMEN: No hay normalidad, no hay varianza constante, s� independencia
### en nuestra estrategia: detenemos el proceso y volvemos al modelo te�rico 1. 

