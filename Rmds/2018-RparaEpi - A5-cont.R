## ---- echo=TRUE, fig.align='center', out.width='90%', message=FALSE, warning=FALSE----
rm(list = ls(all = T))

library(ggplot2)
library(Epi)
data(births)
sp <- ggplot(births,
             aes(x = gestwks,
                 y = bweight,
                 colour = I("red"))) +
  geom_point() +
  labs(x = "Tempo de gestação (semanas)",
       y = "Peso ao nascer (gramas)")
sp

# ---------------------------------------
# Formatando variáveis

births$preterm <- factor(births$preterm,
                         labels = c("Não", "Sim"))

births$sex <- factor(births$sex,
                     labels = c("Masculino", "Feminino"))

births$gestwks.cat <- cut(births$gestwks,
                          breaks = c(0, 37, 42, 100),
                          labels = c("Pré-termo", "Termo", "Pós-termo"))

births$matage.cat <- cut(births$matage,
                         breaks = c(20, 30, 40, 50),
                         labels = c("20-29", "30-39", "40-49"))

# births$lowbw <- factor(births$lowbw)
# births$bweight.cat <- cut(births$bweight,
#                           breaks = c(0, 1000, 1500, 2500, 5000),
#                           labels = c("Baixo extremo", "Muito baixo", "Baixo", "Normal"))
summary(births)

# ---------------------------------------
# Explicativa contínua

mod.lm <- lm(bweight ~ gestwks,
             data = births)

summary(mod.lm)

# ---------------------------------------
# Explicativa dicotômica

mod.lm2 <- lm(bweight ~ preterm,
             data = births)

summary(mod.lm2)

mod.lm3 <- lm(bweight ~ sex,
              data = births)

summary(mod.lm3)

# ---------------------------------------
# Uma explicativa contínua 
# e uma explicativa dicotômica (ajuste)

mod.lm4 <- lm(bweight ~ gestwks + sex,
              data = births)

summary(mod.lm4)

# ---------------------------------------
# Uma explicativa contínua 
# e uma explicativa politômica (ajuste)

mod.lm5 <- lm(bweight ~ gestwks + matage.cat,
              data = births)

summary(mod.lm5)

births$sex2 <- relevel(births$sex, ref = 2)

mod.lm3.2 <- lm(bweight ~ sex2,
              data = births)
summary(mod.lm3.2)
# ---------------------------------------
# Uma explicativa contínua 
# e uma explicativa dicotômica (interação)

mod.lm6 <- lm(bweight ~ gestwks * sex,
              data = births)

summary(mod.lm6)

mod.lm6.2 <- lm(bweight ~ gestwks + sex + gestwks:sex,
              data = births)

summary(mod.lm6.2)

# ---------------------------------------
# Uma explicativa contínua 
# e uma explicativa contínua (categorizada)

mod.lm7 <- lm(bweight ~ gestwks.cat,
              data = births)

summary(mod.lm7)

library(ggeffects)

mydf <- ggpredict(mod.lm7, terms = "gestwks.cat")
plot(mydf)

# ---------------------------------------
# Uma explicativa contínua 
# e uma explicativa contínua (polinomial)

mod.lm8 <- lm(bweight ~ gestwks + I(gestwks^2) + I(gestwks^3),
              data = births)

summary(mod.lm8)

mydf <- ggpredict(mod.lm8, terms = "gestwks")
plot(mydf)

# ---------------------------------------
# Uma explicativa contínua 
# e uma explicativa contínua (scr)

mod.lm9 <- lm(bweight ~ ns(gestwks, df = 4),
              data = births)

summary(mod.lm9)

mydf <- ggpredict(mod.lm9, terms = "gestwks")
plot(mydf)

# ---------------------------------------
sp <- ggplot(births,
             aes(x = gestwks,
                 y = bweight,
                 colour = matage.cat)) +
  geom_point() +
  labs(x = "Tempo de gestação (semanas)",
       y = "Peso ao nascer (gramas)")
sp


# sp + geom_abline(intercept = -4000, slope = 200, colour = I("red")) +
#   geom_abline(intercept = 6500, slope = -100, colour = I("blue")) +
#   geom_abline(intercept = -4000, slope = 250) +
#   geom_abline(intercept = 3000, slope = 0, colour = I("green"))
# 


## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------
mod.lm <- lm(bweight ~ gestwks,
             data = births)

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------
print(mod.lm)

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------
summary(mod.lm)

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------
coef(mod.lm)
confint(mod.lm, level = 0.95)

## ---- echo=TRUE, fig.align='center', out.width='90%', message=FALSE, warning=FALSE----
# par(mfrow = c(2,2))
plot(mod.lm)

## ---- echo=TRUE, fig.align='center', out.width='90%', message=FALSE, warning=FALSE----
par(mfrow = c(1,1))

sp + stat_smooth(method = "lm",
                 col = "blue",
                 se = FALSE)

sp + stat_smooth(method = "lm",
                 col = "blue",
                 se = TRUE)

births$bweight.2 <- ifelse(births$bweight > 2500, births$bweight, 2500)
mod.lm2 <- lm(bweight.2 ~ gestwks,
              data = births)

mod.lm3 <- lm(bweight ~ matage,
              data = births)

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------
summary(mod.lm)$coef


## ---- echo=TRUE, message=FALSE, warning=FALSE, results='asis'------------
mod.lm2 <- lm(bweight ~ gestwks + matage + factor(hyp),
             data = births)
library(knitr)
kable(x = summary(mod.lm2)$coef,
      format = "markdown",
      digits = c(2,2,3,4))

## ---- echo=TRUE, fig.align='center', out.width='60%', message=FALSE, warning=FALSE----
library(sjPlot)
plot_model(mod.lm2)

## ---- echo=TRUE, fig.align='center', out.width='60%', message=FALSE, warning=FALSE----
plot_model(mod.lm2,
           vline.color = "red")

## ---- echo=TRUE, fig.align='center', out.width='55%', message=FALSE, warning=FALSE----
plot_model(mod.lm2,
           show.values = TRUE, 
           value.offset = .3)

## ---- echo=TRUE, eval=FALSE, message=FALSE, warning=FALSE, results='asis'----
tab_model(mod.lm2,
           file = "tabela_lm_1.html")

## ---- echo=TRUE, eval=FALSE, message=FALSE, warning=FALSE, results='asis'----
tab_model(mod.lm, mod.lm2,
           file = "tabela_lm_2.html")

## ----echo=FALSE, fig.align='center', message=FALSE, warning=FALSE, out.width='50%', paged.print=FALSE----
knitr::include_graphics('Figuras/r4epi_sticker.png')

