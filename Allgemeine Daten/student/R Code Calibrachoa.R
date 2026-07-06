library (tidyverse)
library (readxl)
library (janitor)
library (see)
library (GGally)
library (emmeans)
library (multcomp)
library(multcompView)
library (parameters)
library (report)
library (conflicted)
conflicts_prefer(dplyr::select)
conflicts_prefer(dplyr::filter)

## daten einlesen
calibrachoa_full_tbl <- read_excel("C:/Users/Admin/Downloads/Calibrachoa.xlsx") %>% 
  clean_names()

calibrachoa_tbl <- calibrachoa_full_tbl %>% 
  select(sorte, substrat, woche, frischgewicht_spross_in_g, trockengewicht_wurzel_in_g) %>% 
  mutate(sorte = as_factor(sorte),
         substrat = as_factor(substrat),
         woche_fct = as_factor(woche))

## summary statistik

stat_tbl <- calibrachoa_tbl %>% 
  group_by(sorte, substrat, woche_fct) %>% 
  summarise(mean = mean(frischgewicht_spross_in_g),
            sd = sd(frischgewicht_spross_in_g),
            n = n()) 


calibrachoa_tbl %>% 
  ggplot(aes(x = woche, y = frischgewicht_spross_in_g, color = sorte,
             linetype = substrat)) +
  theme_minimal() +
##  geom_point() +
  stat_summary(geom = "line", fun = "mean") +
  scale_color_okabeito() + 
  labs(y = "Frischgewicht Spross in g", x = "Kalenderwoche") +
  geom_errorbar(data = stat_tbl,
                aes(ymin = mean - sd, ymax = mean + sd),
                width = 0.2)

## anova
aov_fit <- aov(frischgewicht_spross_in_g  ~ substrat*sorte*woche_fct, data = calibrachoa_tbl)

aov_fit %>% 
  model_parameters()

aov_fit %>% 
  emmeans(~ sorte*substrat|woche_fct, vcov = sandwich::vcovHAC) %>% 
  cld(Letters = letters)




cld_tbl <- aov_fit |>
  emmeans(~ sorte*substrat|woche_fct, vcov = sandwich::vcovHAC) %>% 
  cld(Letters = letters)






geom_label(data=aov_fit,
          aes(label = .group, y = emmean),
          show.legend = FALSE, size = 4, 
          fontface =2)




## Wurzel Grafik 

calibrachoa_tbl %>% 
  group_by(sorte, substrat, woche_fct) %>% 
  summarise(mean = mean(trockengewicht_wurzel_in_g),
            sd = sd(trockengewicht_wurzel_in_g),
            n = n())

calibrachoa_tbl %>% 
  ggplot(aes(x = woche, y = trockengewicht_wurzel_in_g, color = sorte,
             linetype = substrat)) +
  theme_minimal() +
  ##  geom_point() +
  stat_summary(geom = "line", fun = "mean") +
  scale_color_okabeito() + 
  labs(y = "Trockengewicht Wurzel in g", x = "Kalenderwoche")

## anova Wurzel 
aov_fit <- aov(trockengewicht_wurzel_in_g  ~ substrat*sorte*woche_fct, data = calibrachoa_tbl)

aov_fit %>% 
  model_parameters()

aov_fit %>% 
  emmeans(~ sorte*substrat|woche_fct, vcov = sandwich::vcovHAC) %>% 
  cld(Letters = letters)





## old -----



mutate = as.factor ("Sorte/Substrat")

names (Calibrachoa_tbl) %>% dput

names_full_vec <- c("plant_ID", "Sorte/Substrat", "Petrischale\r\n_leer_in_g", 
  "Frischgewicht\r\n_Wurzel_in_g", "Frischgewicht\r\n_Spross_in_g", 
  "Trockengewicht_Wurzel\r\n_und_Petrischale_in_g", "Trockengewicht\r\n_Wurzel_in_g")

##select
Calibrachoa_tbl %>%
  dplyr::select("Sorte/Substrat", "Frischgewicht\r\n_Spross_in_g", "Trockengewicht\r\n_Wurzel_in_g")

stat_tbl <- Calibrachoa_tbl |>
   mutate("Sorte/Substrat" = as_factor ()


stat_tbl <- Calibrachoa_tbl |>
  group_by("Sorte/SUbstrat") |>
summarise (mean=mean ("Trockengewicht\r\n_Wurzel_in_g"))



stat_tbl <- CalNull()stat_tbl <- CalNull()stat_tbl <- Calibrachoa |>
group_by("Sorte/Substrat") |>  
summarise(mean=mean ("Frischgewicht_Spross_in_g"),
          sd = sd("Frischgewicht_Spross_in_g")
          
          