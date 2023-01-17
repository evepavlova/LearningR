# Merge conflict example
# 10

# R_basics ----------------------------------------------------------------

# weight_kilos <- 100
# weight_kilos <- 10
# colnames(airquality)
# str(airquality)
# summary(airquality)


# 2 + 2
# 2 + 2

# Packages ----------------------------------------------------------------

# library(tidyverse)

# this will be used for testing out Git


# Learning data wrangling -------------------------------------------------

library(tidyverse)
library(NHANES)

# Looking at data ---------------------------------------------------------

glimpse(NHANES)
colnames(NHANES)

select(NHANES, Age, Weight, BMI)

select(NHANES, -HeadCirc)

select(NHANES, starts_with("BP"), Age)
select(NHANES, ends_with("Day"))
select(NHANES, contains("Age"))

nhanes_small <- select(
  NHANES,
  ID,
  Age,
  Gender,
  BMI,
  Diabetes,
  PhysActive,
  BPSysAve,
  BPDiaAve,
  Education
)
nhanes_small


# Fixing variable names ---------------------------------------------------

nhanes_small <- rename_with(
  nhanes_small,
  snakecase::to_snake_case
)

nhanes_small <- rename(
  nhanes_small,
  sex = gender
)


# Piping ------------------------------------------------------------------

# colnames(nhanes_small)
nhanes_small %>%
  colnames()
nhanes_small %>%
  select(phys_active) %>%
  rename(physically_active = phys_active)


# Exercising --------------------------------------------------------------

nhanes_small %>%
  select(
    bp_sys_ave,
    education
  )

nhanes_small %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_dia_ave
  )

# select(nhanes_small, bmi, contains("age"))
nhanes_small %>%
  select(
    bmi,
    contains("age")
  )

# blood_pressure <- select(nhanes_small, starts_with("bp_"))
# rename(blood_pressure, bp_systolic = bp_sys)
nhanes_small %>%
  select(
    starts_with("bp_")
    ) %>%
  rename(
    bp_systolic = bp_sys_ave
    )
