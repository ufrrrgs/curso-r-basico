# Vetores representando variáveis
# de um banco de dados

id <- c(1, 2, 3, 4, 5)
sexo <- c("m", "m", "m", "f", "f")
idade <- c(99, 46, 23, 54, 23)

data.frame(id, sexo, idade)
data.frame(id, idade, sexo)

dados <- data.frame(id, sexo, idade)


## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Criar um dataframe com as colunas col.1,
# col.2 e col.3
data.frame("id" = c(1, 2, 3, 4, 5),
           "sexo" = c("m", "m", "m", "f", "f"),
           "idade" = c(99, 46, 23, 54, 23)
           )

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## df$nomecoluna

## ---- echo=FALSE, eval=TRUE, warning=FALSE, message=FALSE----------------

library(Epi)

data(births)

births$bweight

mean(births$bweight)

table(births$preterm)

births$bweight.kg <- births$bweight / 1000

births$baixo.peso <- births$bweight.kg < 2.5

births$baixo.peso <- factor(births$baixo.peso, labels = c("Não", "Sim"))

summary(births)









## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Retorna a coluna peso ao nascer bweight
births100$bweight

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Qual a média do peso ao nascer?
mean(births100$bweight)
# Tabela de frequências da variável sexo
table(births100$sex)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Acrescentando uma nova coluna de peso em kg
# bweight / 1000
births100$bweight.kg <- births100$bweight / 1000
births100$bweight.kg

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Acrescentando uma nova coluna de baixo peso
births$baixo.peso <- births$bweight.kg < 2.5
table(births100$baixo.peso)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Nomes das colunas do dataframe births100
names(births)
# Alterando o nome da segunda coluna
# para peso.nascer
names(births)[2] <- "peso.nascer"
# Novos nomes das colunas do dataframe births100
names(births)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Linhas de 1 a 5 e coluna 1 de births100
births[1:5, 1]

# Linhas de 1 a 3 e colunas 1 e 3 de births100
births[1:3, c(1,3)]

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Linha 1 de births100
births[1, ]

# Coluna 2 de births100
births[, 2]

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Novo dataframe contendo apenas
# nascimentos de meninos
births.m <- births[births$sex == 1, ]

# Novo dataframe contendo apenas
# meninas com peso normal

births.f.pn <- births[births$sex == 2 & 
                              births$bweight >= 2500, ]


## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Subconjunto contendo apenas
# meninas com baixo peso e
# tempo de gestação menor 
# que 40 semanas
subset(births100,
       subset = sex == 2 &
         peso.nascer < 2500 &
         gestwks < 40
)


library(Epi)

data(diet)
head(diet)
str(diet)
dim(diet)
summary(diet)

diet[,c("y", "job", "chd")]
diet[,c(5,7,15)]
diet[c(3,9,100),]

diet[c(35,53,82),]

diet[c(35,53,82), c("y", "job", "chd")]

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## data() # lista dos diversos conjuntos de dados do pacote base R
## data(package = "survival") # lista os conj. de dados de um pacote específico
## data(package = .packages(all.available = TRUE)) # lista todos os conj. de dados disponíveis nos pacotes instalados

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
data(esoph)
head(esoph, n = 4)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dados <- data.frame("sexo" = c("m", "m", "m", "f", "f"),
                    "idade" = c(99, 46, 23, 54, 23))
save(dados, file = "Exemplo1.RData")

## ---- echo=TRUE, eval=TRUE, error=TRUE-----------------------------------
rm(dados) # removendo o objeto dados
dados # apenas checando que o objeto dados não mais existe
load("Exemplo1.RData") # carregando os dados do arquivo
head(dados, n = 5)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosEx2 <- read.table("Ex2.txt")
dadosEx2

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosEx3 <- read.table("Ex3.txt", header = TRUE)
dadosEx3

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosEx4 <- read.table("Ex4.txt", header = TRUE, dec = ",")
dadosEx4

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosEx5 <- read.table("Ex5.txt", header = TRUE, sep = ",")
dadosEx5

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosEx6 <- read.table("Ex6.txt", header = TRUE, sep = ";", dec = ",")
dadosEx6

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosEx7 <- read.table("Ex7.txt", header = TRUE, na.strings = "9999")
dadosEx7

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosEx8 <- read.csv("Ex8.csv", header = TRUE)
dadosEx8

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosEx9 <- read.csv2("Ex9.csv", header = TRUE)
dadosEx9

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Carregando arquivo dicionário de dados
dic <- read.csv2("dicPNAD2011.csv", header = TRUE)
head(dic)
# Carregando arquivo de dados da PNAD
# utilizando o vetor tamanho do dataframe
# dic para especificar o argumento 
# width
dadosPNAD <- read.fwf("pnad2011.txt", width = dic$tamanho)
names(dadosPNAD) <- dic$cod
dadosPNAD[1:4,1:10]

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Dados em 
# http://web1.sph.emory.edu/dkleinb/allDatasets/datasets/evans.dat
dadosWEB <- read.table(file =
  "http://web1.sph.emory.edu/dkleinb/allDatasets/datasets/evans.dat")
head(dadosWEB)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## # Instale o pacote readxl
## install.packages("readxl")

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Carregue o pacote readxl
library(readxl)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosEXCEL <- read_excel("pain_medication.xlsx", # caminho do arquivo
                         sheet = 1) # número da planilha do arquivo
head(dadosEXCEL, n = 4)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosEXCEL2 <- read_excel("pain_medication.xlsx", # caminho do arquivo
                         sheet = "pain_medication_var2") # nome da planilha
head(dadosEXCEL2)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## # Instale o pacote foreign
## install.packages("foreign")

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Carregue o pacote foreign
library(foreign)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosSPSS <- read.spss("dietstudy.sav", # caminho do arquivo
                   to.data.frame = TRUE, # armazenar em objeto dataframe
                   use.value.labels = TRUE, # transformar labels em factor
                   use.missings = TRUE) # usar definições de missing
head(dadosSPSS)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dadosStata <- read.dta("evans.dta") 
head(dadosStata)

write.table(x = dadosStata, file = "evansTexto.txt", sep = ";")

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## # Instale o pacote RMySQL
## install.packages("RMySQL")

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## # Carregue o pacote RMySQL
## library(RMySQL)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## 
## # connecting to genome mysql database
## ucsDb <- dbConnect(MySQL(),
##                    user = "genome",
##                    host = "genome-mysql.cse.ucsc.edu")
## 
## result <- dbGetQuery(ucsDb, "show databases;")
## dbDisconnect(ucsDb)
## head(result)
## nrow(result)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## 
## # connect to db hg19 and list its tables
## hg19 <- dbConnect(MySQL(),
##                 user = "genome",
##                 db = "hg19",
##                 host = "genome-mysql.cse.ucsc.edu")
## hg19Tbls <- dbListTables(hg19)
## length(hg19Tbls)
## hg19Tbls[1:15]
## 
## # get dim for specific tbl
## hg19Flds <- dbListFields(hg19, "affyU133Plus2")
## hg19Flds

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## 
## # "nrow" of hg19
## dbGetQuery(hg19, "select count(*) from affyU133Plus2")
## 
## # read from tbl
## affyData <- dbReadTable(hg19, "affyU133Plus2")
## head(affyData)
## 
## # select a subset
## query <- dbSendQuery(hg19,
##                      "select * from affyU133Plus2 where misMatches between 1 and 3")
## affyMis <- fetch(query)
## quantile(affyMis$misMatches)
## 
## # fetch only 10 rows (limit query to top n rows)
## affyMisSmall <- fetch(query,n=10)
## dbClearResult(query)
## dim(affyMisSmall)
## 
## # remember to disconnect when done!
## dbDisconnect(hg19)

dados <- read.table("maternal-smoking.txt", head = T)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dados.imc <- read.table("imc.txt", header = TRUE)
dim(dados.imc)
head(dados.imc)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dados.col <- read.table("colesterol.txt", header = TRUE)
dim(dados.col)
head(dados.col)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dados <- merge(x = dados.imc,
               y = dados.col,
               by = "id",
               all = TRUE)
dim(dados)
head(dados)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dados.col2 <- read.table("colesterol2.txt", header = TRUE)
dim(dados.col2)
head(dados.col2)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dados2 <- merge(x = dados.imc,
               y = dados.col2,
               by = "id",
               all.x = TRUE)
dim(dados2)
head(dados2)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dados2.2 <- merge(x = dados.imc,
               y = dados.col2,
               by = "id",
               all.y = TRUE)
dim(dados2.2)
head(dados2.2)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dados.col3 <- read.table("colesterol3.txt", header = TRUE)
dim(dados.col3)
head(dados.col3)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
dados3 <- merge(x = dados.imc,
               y = dados.col3,
               by.x = "id",
               by.y = "IDENTIFICATION")
dim(dados3)
head(dados3)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------

head(airquality)

## ---- echo=FALSE, eval=TRUE, results='hide', warning=FALSE, message=FALSE----

library(datasets)
library(dplyr)


## ---- echo=TRUE, eval=TRUE, warning=FALSE, message=FALSE-----------------

head(filter(airquality, Temp > 70))

## ---- echo=FALSE, eval=TRUE, results='hide', warning=FALSE, message=FALSE----

filter(airquality, Temp > 80 & Month > 5)

## ---- echo=TRUE, eval=TRUE, warning=FALSE, message=FALSE-----------------

head(mutate(airquality, TempInC = (Temp - 32) * 5 / 9))

## ---- echo=TRUE, eval=TRUE, warning=FALSE, message=FALSE-----------------

summarise(airquality, mean(Temp, na.rm = TRUE))

## ---- echo=TRUE, eval=TRUE-----------------------------------------------

summarise(group_by(airquality, Month),
          mean(Temp, na.rm = TRUE))

## ---- echo=TRUE, eval=TRUE-----------------------------------------------

count(airquality, Month)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------

head(airquality)

head(arrange(airquality, desc(Month), Day))

## ---- echo=TRUE, eval=TRUE-----------------------------------------------

filteredData <- filter(airquality, Month != 5)
groupedData <- group_by(filteredData, Month)
summarise(groupedData, mean(Temp, na.rm = TRUE))

## ---- echo=TRUE, eval=TRUE-----------------------------------------------

airquality %>%
    filter(Month != 5) %>%
    group_by(Month) %>%
    summarise(mean(Temp, na.rm = TRUE))

## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='50%', paged.print=FALSE----
knitr::include_graphics('Figuras/r4epi_sticker.png')

