## ---- echo=FALSE, eval=TRUE, warning=FALSE, message=FALSE----------------
f.dados <- read.table("funcionarios.txt",
                      header = TRUE)
f.dados$civil <- factor(f.dados$civil,
                        labels = c("solteiro",
                                   "casado"))
f.dados$instrucao <- factor(f.dados$instrucao,
                            labels = c("1º Grau",
                                       "2º Grau",
                                       "Superior"))
f.dados$regiao <- factor(f.dados$regiao,
                         labels = c("interior",
                                    "capital",
                                    "outro"))
f.dados <- transform(f.dados, idade = ano + mes/12)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
t.test(f.dados$idade, mu = 30)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
t.test(f.dados$idade,
       alternative = "greater",
       mu = 35)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
t.test(idade ~ civil,
       data = f.dados)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
t.test(idade ~ civil,
       data = f.dados,
       var.equal = TRUE)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
anovaIdade <- aov(idade ~ instrucao,
                  data = f.dados)
summary(anovaIdade)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
chisq.test(table(f.dados$instrucao, f.dados$regiao))

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
wilcox.test(idade ~ civil,
            data = f.dados)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
kruskal.test(idade ~ instrucao,
             data = f.dados)

## ---- echo=TRUE, eval=TRUE-----------------------------------------------
shapiro.test(f.dados$idade)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## install.packages("compareGroups")

## ---- echo=TRUE, warning=FALSE, message=FALSE----------------------------
library(compareGroups)

## ------------------------------------------------------------------------
data(predimed)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
## ?predimed

## ----echo=FALSE,results="asis"-------------------------------------------
levels(predimed$group) <- c("Control","MDN","MDV")
dicc <- data.frame(
"Name" = I(names(predimed)),
"Label" = I(sjlabelled::get_label(predimed)),
"Codes" = I(unlist(lapply(predimed, function(x) paste(levels(x), collapse="; "))))
)
dicc$Codes <- sub(">=", "$\\\\geq$", dicc$Codes)  
knitr::kable(dicc, caption = NULL, format = "pandoc")
# library(xtable)
# print(xtable(dicc,align=rep("l",4)),include.rownames=FALSE,type="latex")

## ---- warning=FALSE, message=FALSE---------------------------------------
predimed$tmain <- with(predimed,
                       Surv(toevent, event == 'Yes'))
Hmisc::label(predimed$tmain) <- "AMI, stroke, or CV Death"

## ---- results='hide'-----------------------------------------------------
compareGroups(group ~ . , data = predimed)

## ---- results='hide'-----------------------------------------------------
compareGroups(group ~ . - toevent - event, data = predimed)

## ------------------------------------------------------------------------
res <- compareGroups(group ~ age + sex + smoke + waist + hormo,
                     data = predimed)
res

## ------------------------------------------------------------------------
compareGroups(group ~ age + smoke + waist + hormo,
              data = predimed,
              subset = sex == 'Female')

## ---- echo=TRUE----------------------------------------------------------
compareGroups(group ~ age + smoke + waist + hormo,
              data = predimed,
              method = c(waist = 2))

## ---- echo=TRUE----------------------------------------------------------
compareGroups(group ~ age + smoke + waist + hormo,
              data = predimed,
              method = c(waist = NA),
              alpha = 0.01)

## ---- echo=TRUE, warning=FALSE, message=FALSE----------------------------
res <- compareGroups(group ~ age + sex + smoke + waist + hormo,
                     data = predimed, method = c(waist = NA),
                     selec = list(hormo = sex == "Female"))
restab <- createTable(res)
print(restab, which.table = 'descr')

## ---- echo=TRUE----------------------------------------------------------
print(restab, which.table = 'avail')

## ----echo=TRUE-----------------------------------------------------------
restab2 <- createTable(res, hide = c(sex = "Male"))
print(restab2)

## ----echo=TRUE-----------------------------------------------------------
restab3 <- createTable(res, hide.no = "no",
                       hide = c(sex = "Male"))
print(restab3)

## ----echo=TRUE-----------------------------------------------------------
restab4 <- createTable(res, digits = c(age = 2, sex = 3),
                       hide.no = "no",
                       hide = c(sex = "Male"))
print(restab4)

## ----echo=TRUE-----------------------------------------------------------
restab5 <- createTable(res, show.n = TRUE,
                       hide.no = "no",
                       hide = c(sex = "Male"))
print(restab5)

## ----echo=TRUE-----------------------------------------------------------
restab6 <- createTable(res, show.all = TRUE,
                       hide.no = "no",
                       hide = c(sex = "Male"))
print(restab6)

## ----echo=TRUE-----------------------------------------------------------
restab7 <- createTable(res, show.p.trend = TRUE,
                       hide.no = "no",
                       hide = c(sex = "Male"))
print(restab7)

## ----echo=TRUE-----------------------------------------------------------
restab8 <- createTable(res, show.p.mul = TRUE,
                       hide.no = "no",
                       hide = c(sex = "Male"))
print(restab8)

## ----echo=TRUE-----------------------------------------------------------
restab9 <- createTable(res, show.all = TRUE,
                       hide.no = "no",
                       hide = c(sex = "Male"))
print(restab9, header.labels = c(p.overall = "p-valor", all = "Total"))

## ---- echo=TRUE----------------------------------------------------------
export2md(restab9, caption = "Características dos grupos do estudo",
          header.labels = c(p.overall = "p-valor", all = "Total"))

## ----echo=TRUE-----------------------------------------------------------
data(regicor)
res <- compareGroups(year ~ . - id, regicor)
restab <- createTable(res, show.n = TRUE,
                      hide.no = "no",
                      hide = c(sex = "Male"))
print(restab, header.labels = c(p.overall = "p-valor", all = "Total"))
missingTable(res)

## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='50%', paged.print=FALSE----
knitr::include_graphics('Figuras/r4epi_sticker.png')

