pacman::p_load(tidyverse, readxl, writexl, conflicted)

## small dataset
jumplength_bloodmeal_tbl <- read_excel("~/GitHub/vorlesungen/Allgemeine Daten/covariate/generation/flea_jumplength_bloodmeal_raw.xlsx", range = "A1:G15")

jumplength_bloodmeal_tbl |> 
  sample_frac() |> 
  mutate(fid = 1:14,
         bodyweight = round(bodyweight, 1),
         jumplength = round(jumplength, 1)) |> 
  select(-craving, -jumplength2) |> 
  write_xlsx("~/GitHub/vorlesungen/Allgemeine Daten/covariate/flea_jumplength_bloodmeal_n14.xlsx")

## full data set
jumplength_bloodmeal_tbl <- read_excel("~/GitHub/vorlesungen/Allgemeine Daten/covariate/generation/flea_jumplength_bloodmeal_raw.xlsx", range = "A1:G22")

jumplength_bloodmeal_tbl |> 
  sample_frac() |> 
  mutate(fid = 1:21,
         bodyweight = round(bodyweight, 1),
         jumplength = round(jumplength, 1)) |> 
  select(-craving, -jumplength2) |> 
  write_xlsx("~/GitHub/vorlesungen/Allgemeine Daten/covariate/flea_jumplength_bloodmeal_n21.xlsx")

jumplength_bloodmeal_tbl |> 
  sample_frac() |> 
  mutate(fid = 1:21,
         bodyweight = round(bodyweight, 1)) |> 
  mutate(craving = case_when(bloodmeal < 4 ~ "hungry",
                             bloodmeal >= 4 & bloodmeal < 8 ~ "full",
                             bloodmeal >= 8 ~ "overeat"))
