pacman::p_load(tidyverse, readxl, janitor, see, conflicted)

answer_tbl <- read_excel("~/GitHub/vorlesungen/Statistik/data/Antworten_Floh_im_Ohr.xlsx") |> 
  clean_names() |> 
  mutate(zufriedenheit_des_infizierten = factor(zufriedenheit_des_infizierten,
                                                levels = c("Sehr unzufrieden", "Eher unzufrieden",
                                                           "Weder noch", "Eher zufrieden", 
                                                           "Sehr zufrieden")),
         flohschnupfen_vom_floh = factor(flohschnupfen_vom_floh, levels = c("nein", "ja")),
         ernahrungszustand_des_flohs = factor(ernahrungszustand_des_flohs,
                                              levels = c("schlecht", "mittel", "gut")))

## Wirt des Flohes und Flohschnupfen
answer_tbl |> 
  ggplot(aes(x = wirt_des_flohs, fill = flohschnupfen_vom_floh)) +
  geom_bar(position = "fill") + 
  theme_minimal() +
  scale_y_continuous(labels = scales::percent) +
  labs(x = "Wirt des Flohs", y = "Relativer Anteil", 
       fill = "Flohschnupfen") +
  scale_x_discrete(labels = c("Hund", "Katze")) +
  scale_fill_okabeito()


answer_tbl |> 
  tabyl(wirt_des_flohs, flohschnupfen_vom_floh)

answer_tbl |> 
  tabyl(wirt_des_flohs, zufriedenheit_des_infizierten)

answer_tbl |> 
  tabyl(ernahrungszustand_des_flohs, flohschnupfen_vom_floh, wirt_des_flohs)

