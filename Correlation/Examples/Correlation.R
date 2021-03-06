##########################################################################
#####################################################
########### UNIVERSIDAD NACIONAL DE COLOMBIA
############PROFESOR: LUIS FERNANDO GRAJALES H. ####
###### MAY.2020
####### R version 3.6.3
#### EJEMPLOS DE COEFICIENTES DE CORRELACI�N PEARSON Y SPEARMAN
###### DECISI�N CON BASE EN PRUEBA DE MARDIA: AC�, NORMALIDAD BIVARIADA
install.packages("MVN")

library(MASS)
library(MVN)

################ EJEMPLO 1: 8 GRANOLAS.
ma�z <- c(2.4, 3.4, 4.6, 3.7, 2.2, 3.3,  4.0, 2.1)
Cacahuates <- c(1.33, 2.12, 1.8, 1.65, 2.0, 1.76, 2.11,1.63)
ma�z
par(mfrow=c(1,2))
plot(ma�z, Cacahuates,main="lfgrajalesh. Apoyo a diapositivas CORRELACI�N")
plot(Cacahuates, ma�z, main="lfgrajalesh. Apoyo a diapositivas CORRELACI�N")
#### IDEA VISUAL DE CORRELACI�N LINEAL POSITIVA.
##### �Cu�l coeficiente de correlaci�n es apropiado?
######## Primero hacemos la prueba de Mardia donde Ho es
####### Ho: el vector aleatorio distribuye normal bivariado.
####### Ha: el vector aleatorio NO distribuye normal bivariado.
GRANOLAS = data.frame (cbind(ma�z, Cacahuates))
GRANOLAS
mvn(GRANOLAS) ### Multivariate Normality Tests
###### valores.p: 0.95 (Skewness) y 0.32 (Kurtosis)
###################################################
###### SOLICITANDO A R el coeficiente de correlaci�n de Pearson. 
########## Tambi�n produce el contraste de hip�tesis
############# Ha: rho es distinto de cero. 
cor.test(ma�z, Cacahuates,method= "pearson") 
####### rho puede ser cero (valor.p=0.4), por que valor P es muy alto)
#### al no ser Ho distinta de 0 se puede decir que no hay una asociacion significativa entre las 2 variables
################# r = 0.35

################ EJEMPLO 2:CIGARRILLOS.
alquitran=c(14,17,28,17,16,13,24,25,18,31)
nicotina=c(0.9,1.1,1.6,1.8,1.0,0.8,1.5,1.4,1.2,2)
par(mfrow=c(2,1))
plot(alquitran,nicotina,main="lfgrajalesh. Apoyo a dipositivas CORRELACI�N")
plot(nicotina, alquitran, main="lfgrajalesh. Apoyo a dipositivas CORRELACI�N")

#### IDEA VISUAL DE CORRELACI�N LINEAL POSITIVA.
##### �Cu�l coeficiente de correlaci�n es apropiado?
######## Primero hacemos la prueba de Mardia donde Ho es
####### Ho: el vector aleatorio distribuye normal bivariado.
cigarrillo = data.frame (cbind(alquitran,nicotina))
cigarrillo

mvn(cigarrillo)
####            Test         Statistic             p value Result
### 1 Mardia Skewness  13.6086560601299 0.00865472750808305     NO
### 2 Mardia Kurtosis 0.448880815916851   0.653517635731147    YES

### Conclusi�n nuestra: El vector no distribuye normal bivariado.  
### Estimaremos el coeficiente de correlaci�n no param�trico de Spearman.

###### SOLICITANDO A R el coeficiente de correlaci�n de Spearman. 
########## Tambi�n produce el contraste de hip�tesis
############# Ha: rho es distinto de cero. 
cor.test(alquitran, nicotina, data="cigarrillo", method="spearman") 
### RESULTADOS
### 1) p.value= 0.002 
#### 2) sample estimates:
###      rho 
#### 0.8389097 
###### INTERPRETAR!!!!



#############################################################
###################### EJEMPLO 3. TALLA DE BEB�S 
################# CORRELACI�N ENTRE Torax_nacer y Peso_nacer 
###########################################################
#### REGRESI�N tallas.beb�s CALIFICAR TALLER2. EDYE Y EXAM 3 INFERENCIA
babies<-read.csv("C:/Users/yosef/OneDrive/Escritorio/New folder/babies.csv", header=T,sep=";")
babies


attach(babies)
############## regresi�n lineal simple
plot(Talla_nacer,�..Talla_hoy, main="Apoyo a Diapositivas de RLS.")
baby.fit<-lm(�..Talla_hoy~ Talla_nacer)
baby.fit








