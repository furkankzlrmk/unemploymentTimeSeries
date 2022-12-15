
install.packages("readxl")
library(readxl)
EVDS <- read_excel("C:/Users/Furkan Kizilirmak/Documents/universalBank/EVDS.xlsx")

unemployment <- EVDS

unemployment<- ts(unemployment[2],start=c(2014,01),frequency=12)


plot(unemployment)


install.packages("urca")
library(urca)


## ortalama ve trend yok ##

adf= ur.df(unemployment,type="none",lags=12,selectlags="AIC")

summary(adf)


## ortalamanın olduğu

adf2= ur.df(unemployment,type="drift",lags=12,selectlags="AIC")

summary(adf2)


## ortalama ve trend var

adf3= ur.df(unemployment,type="trend",lags=12,selectlags="AIC")

summary(adf3)





# differences

unemploymentfark =diff(unemployment,differences=1)

plot(unemploymentfark)


## ortalama ve trend yok ##

adfdiff= ur.df(unemploymentfark,type="none",lags=12,selectlags="AIC")

summary(adfdiff)


## ortalamanın olduğu

adfdiff2= ur.df(unemploymentfark,type="drift",lags=12,selectlags="AIC")

summary(adfdiff2)


## ortalama ve trend var

adfdiff3= ur.df(unemploymentfark,type="trend",lags=12,selectlags="AIC")

summary(adfdiff3)



