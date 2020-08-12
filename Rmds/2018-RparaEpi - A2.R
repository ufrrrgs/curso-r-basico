## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# 1. Crie o objeto vetor chamado idades
idades <- c(32, 29, 60, 59, 22, 27, 98)

# 2. Aplique a função mean() no objeto idades
mean(idades)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
1 + 2
3 - 4
5 * 6
7/8
2^3

## ----echo=TRUE, eval=FALSE-----------------------------------------------
## # Belo Horizonte, 4 de agosto de 2016
## # Aula de R para epidemiologia
## # Autor: Rodrigo
## 
## # Instalando pacotes do R
## # install.packages(Epi)
## 
## # Carregando pacotes do R
## library(Epi)
## 
## # Carregando os dados de BIRTHS
## data(births)
## 
## # O nome das colunas deste conjunto de dados
## names(births)
## 
## # Qual a média da variável bweight
## mean(births$bweight)
## 
## # Quantos meninos nasceram com baixo peso?
## sum(births$lowbw[births$sex == 1])

## ----echo=TRUE, eval=FALSE-----------------------------------------------
## a<-(100+3)-2
## mean(c(a/100,642564624.34))
## t.test(formula=bweight~sex,data=births)
## plot(x=births$gestwks,y=births$bweight,main="myplot")

## ----echo=TRUE, eval=FALSE-----------------------------------------------
## # Alguns cálculos sem significado
## 
## a <- (100 + 3) - 2
## mean(c(a / 100, 642564624.34))
## 
## # Teste t para comparar o peso
## # ao nascer de meninos e meninas
## 
## t.test(formula = bweight ~ sex,
##        data = births)
## 
## # Gráfico de dispersão de tempo
## # de gestação (em semanas) e peso ao nascer
## plot(x = births$gestwks,
##      y = births$bweight,
##      main = "myplot")

## ---- echo=TRUE, eval=TRUE, results='hide'-------------------------------
a <- 535

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
a

## ---- echo=TRUE, eval=TRUE, error=TRUE-----------------------------------
b

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
b <- 500

# O que é a + b?
a + b

# Atribua a + b a um novo objeto (c)
c <- a + b

# O que é c?
c

# Atualize o objeto a
a <- 11
a

## ---- echo=TRUE, eval=TRUE, results='hide'-------------------------------
z <- 0
z + 1

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
z

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## z <- 0
## z <- z + 1 # Agora de fato estamos mudando z
## z

## ---- echo=TRUE, eval=FALSE, highlight=FALSE-----------------------------
## # Nomes válidos
## media.grupo <- 10.21
## minha.idade <- 32
## TimeFavorito <- "Grêmio"
## soma.de.1.a.5 <- 1 + 2 + 3 + 4 + 5

## ---- echo=TRUE, eval=FALSE, highlight=FALSE-----------------------------
## # Nomes inválidos: possuem espaços ou começam com números
## 5experimento <- 50
## 5! <- 50
## Pontuacao do Gremio <- 50

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## # Estes são objetos diferentes
## Peso <- 78
## peso <- 68
## PESO <- 98

## ---- echo=TRUE, eval=FALSE, highlight=FALSE-----------------------------
## esteaqui <- 1
## ESTEAQUI <- 2
## este.aqui <- 3
## Este.1 <- 4
## EsTE.......AQU....I <- 5
## Este!Aqui! <- 6
## ldkflkdflsk <- 7

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## a <- 10
## a + 10
## a

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## a <- 100
## b <- 3 / 100
## c <- (a + b) / c

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## d <- "Epidemiologia"
## e <- "Saúde Pública"
## f <- "Campus Pampulha fechado por causa dos Olimpíadas!"

## ---- echo=TRUE, eval=TRUE, error=TRUE-----------------------------------
a.num <- 1
b.num <- 2
a.num + b.num

## ---- echo=TRUE, eval=TRUE, error=TRUE-----------------------------------
a.cha <- "1"
b.cha <- "2"
a.cha + b.cha

# Se o conteúdo do objeto caracter for um número,
# podemos torná-lo um objeto numérico:
as.numeric(a.cha)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
a <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
a

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
peso <- c(70, 97, 78)
peso

sexo <- c("Fem", "Masc", "Masc")
sexo

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
a <- c(1, 2, 3, 4, 5)
b <- c(6, 7, 8, 9, 10)
c <- c(a, b)
c

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
vet.mescla <- c("R", 1, "para", 2, "Epidemiologia", 3)
vet.mescla

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
id <- 1:100
# id
10:1
2.5:8.5

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
id <- seq(from = 1, to = 100, by = 1)
# id
seq(from = 0, to = 100, by = 10)
seq(from = 0, to = 100, length.out = 5)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
rep(x = 3, times = 10)
rep(x = c(1, 2), times = 5)
rep(x = c("fumante", "não-fumante"), each = 2)
rep(x = 1:5, times = 3)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
a <- 1:10
length(a)

b <- seq(from = 1, to = 100, length.out = 20)
length(b)

length(c("R", "para", "Epidemiologia"))

length(c("R para Epidemiologia"))

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
a <- c(1, 3, 5, 7)
b <- c(1, 2, 4, 8)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
5 * a

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
a + b

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
a - b
a * b
a / b

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
u <- c(10,20,30)
v <- 1:9
u + v

# Sua vez!

props <- c(0.01, 0.2, 0.13, 0.47, 0.08)
percents <- props * 100
props
percents


cintura <- c(102, 92, 104, 90, 97, 85, 100, 114, 83, 99)
quadril <- c(119, 104, 123, 102, 105, 109, 117, 102, 99, 112)

rcq <- cintura / quadril

cintura
quadril
rcq



## ---- echo=TRUE, eval=TRUE-----------------------------------------------
colesterol <- c(221.7, 195.0, 235.8, 234.4, 246.9,
                212.7, 204.2, 173.9, 227.9, 237.3)

min(colesterol)
max(colesterol)
mean(colesterol)
median(colesterol)
quantile(colesterol, p = 0.5) # Quem é este quantil?
quantile(colesterol, p = c(0.25, 0.5, 0.75))
summary(colesterol)
sd(colesterol)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
hdl <- c(68.1, 30.5, NA, 31.2, NA, 78.8, NA, 51.2, 62.2, 57.6)

mean(hdl)
mean(hdl, na.rm = TRUE)
# T como um "apelido" para TRUE
mean(hdl, na.rm = T)
# F como um "apelido" para FALSE
sd(hdl, na.rm = F)
# Veja a informação adicional que aparece
# quando utilizamos a função summary()
# em um vetor com valores NA
summary(hdl)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
gest.anteriores <- c(1, 0, 2, 1, 4, 1, 0, 3, 2, 1)
sexo <- c("M", "M", "F", "F", "F", "M", "F", "M", "F", "F")

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
unique(gest.anteriores)
unique(sexo)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
table(gest.anteriores)
table(sexo)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
table(gest.anteriores)/sum(table(gest.anteriores))
table(sexo)/sum(table(sexo))

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
notas <- c(7.5, 9.2, 6, 8.1, 8, 9.9, 8.3, 8.7, 8.5, 7.7)
mean(notas)
sd(notas)

# Criando o vetor de notas padronizadas
notas.z <- (notas - mean(notas)) / sd(notas)
mean(notas.z)
sd(notas.z)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
gest.sem <- c(38.52, 0, 38.15, 0, 0, 40.97, 42.14, 0, 42.03, 0)
sexo <- c("f", "m", "f", "m", "m", "f", "f", "m", "f", "m")
# Qual o tempo de gestação do primeiro indivíduo?
gest.sem[1]
# Qual o sexo do 3º, 4º e 5º indivíduos?
sexo[3:5]
# Quantos indivíduos do sexo feminino foram pesquisados?
sum(sexo == "f")
# Quais são os valores de gestação que são maiores que 0?
gest.sem[gest.sem > 0]
# Quais são os tempos de gestação das mulheres?
gest.sem[sexo == "f"]

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
a <- c(0, 50, 2, 39, 9, 20, 17, 8, 10, 100)
# 1º elemento
a[1]
# Elementos 1-5
a[1:5]
# Todo segundo elemento
a[seq(from = 2, to = 10, by = 2)]
# Passo-a-passo
ind <- seq(from = 2, to = 10, by = 2)
ind
a[ind]
# Todos os elementos com exceção do 4º
a[-4]
# Todo o vetor sem os primeiros 4 elementos
a[-1:-4]

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Que valores são maiores que 40?
gest.sem > 40
# Que valores são iguais a 0?
gest.sem == 0

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
sexo == "m"
sexo == "f"
sexo != "m"

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
pas.antes  <- c(143, 122, 113, 126, 126, 135, 135, 151, 130, 136)
pas.depois <- c(127, 129, 107, 107, 103, 135, 140, 145, 110, 115)
# O tratamento fez efeito?
pas.depois < pas.antes
# PAS foi diferente após tratamento?
pas.antes != pas.depois

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Quais são os tempos de gestação das mulheres?
gest.sem[sexo == "f"]
# Quais os valores de pressão daqueles que
# possuem pressão alta?
pas.antes[pas.antes > 130]

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# Quais são os tempos de gestação dos indivíduos
# do sexo feminino E com pressão acima de 130?
gest.sem[sexo == "f" & pas.antes > 130]
# Quais são os tempos de gestação dos indivíduos
# do sexo feminino OU com pressão acima de 130?
gest.sem[sexo == "f" | pas.antes > 130]

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
# O valor 999 representa um valor ausente 
# neste vetor de pesos
peso <- c(70, 97, 78, 57, 48, 999, 103, 83, 999)
peso[peso == 999] <- NA
mean(peso, na.rm = T)

## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='50%', paged.print=FALSE----
knitr::include_graphics('Figuras/r4epi_sticker.png')

