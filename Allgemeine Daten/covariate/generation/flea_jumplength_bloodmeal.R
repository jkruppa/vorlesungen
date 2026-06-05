pacman::p_load(tidyverse, readxl, writexl, conflicted)

jumplength_bloodmeal_tbl <- read_excel("~/Desktop/flea_jumplength_bloodmeal_raw.xlsx", range = "A1:E22")

jumplength_bloodmeal_tbl |> 
  sample_frac() |> 
  mutate(fid = 1:21,
         bodyweight = round(bodyweight, 1)) |> 
  write_xlsx("~/Desktop/flea_jumplength_bloodmeal.xlsx")
