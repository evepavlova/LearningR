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
