library(gcookbook)
library(ggplot2)
library(dplyr)
library(reshape2)
library(devtools)

#saber em qual diretório eu me encontro
getwd()

#definindo pasta
setwd("/home/isabella/R_Titanic")

#valores que a variavel pode assumir
summary(train)

#nome de variaveis e seus tipos
str(train)

#---Analisando separadamente as variaveis
#--Sobreviventes
table(train$Survived) #342 pessoas sobreviveram e 549 morreram
barplot(table(train$Survived))
table(train$Age,train$Sex == 'female')
table(train$Age,train$Sex == 'male')
by(train$Age,train$Survived,summary) #estatitica descritiva de sobreviventes e não sobreviventes
table(train$Pclass)

Age_Survived_Sex = train[c("Age","Survived","Sex","Pclass")]
ggplot(data=Age_Survived_Sex, aes(x=Age, y=Survived)) +
  geom_bar(stat="identity",width=0.5)    

#-Sobreviventes
Survived_Table = subset(Age_Survived_Sex,Survived == 1)
summary(Survived_Table) #233  mulheres e 109 homens
Survived_Table_male = subset(Survived_Table,Sex =='male')
Survived_Table_female = subset(Survived_Table, Sex == 'female')
barplot(table(Survived_Table_female$Age))
barplot(table(Survived_Table_male$Age))
by(Survived_Table_female$Age,Survived_Table_female$Pclass,summary)
by(Survived_Table_male$Age,Survived_Table_male$Pclass,summary)
qplot(x = Pclass,y = Age,data= Survived_Table_male)
qplot(Pclass == 2,Age,data= Survived_Table_male)
qplot(Pclass == 3,Age,data= Survived_Table_male)

#-Nao sobreviventes
NoSurvived_Table = subset(Age_Survived_Sex,Survived == 0)
summary(NoSurvived_Table) #81  mulheres e 468 homens
NoSurvived_Table_male = subset(NoSurvived_Table,Sex =='male')
NoSurvived_Table_female = subset(NoSurvived_Table, Sex == 'female')
barplot(table(NoSurvived_Table_female$Age))
barplot(table(NoSurvived_Table_male$Age))
