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


# Filtering by row --------------------------------------------------------

nhanes_small %>%
  filter(phys_active == "No") # Filtered only non-active people

nhanes_small %>%
  filter(phys_active != "No") # Filtered only active or NA people

nhanes_small %>%
  filter(bmi >= 25 &
    phys_active == "No") # Filtered only bmi>=25 AND non-active people

nhanes_small %>%
  filter(bmi == 25 | phys_active == "No")

# Arranging rows ----------------------------------------------------------

nhanes_small %>%
  arrange(age)

nhanes_small %>%
  arrange(desc(age), bmi)


# Mutating columns --------------------------------------------------------

nhanes_small %>%
  mutate(
    age_months = age * 12
  )

nhanes_small %>%
  mutate(
    logged_bmi = log(bmi)
  )

nhanes_update <- nhanes_small %>%
  mutate(
    old = if_else(
      age >= 30,
      "Yes",
      "No"
    )
  )


# More exercising ---------------------------------------------------------

# 1. BMI between 20 and 40 with diabetes
nhanes_small %>%
  # Format should follow: variable >= number or character
  filter(
    bmi >= 20 &
      bmi <= 40 &
      diabetes == "Yes"
  )

# Pipe the data into mutate function and:
nhanes_modified <- nhanes_small %>% # Specifying dataset
  mutate(
    # 2. Calculate mean arterial pressure
    mean_arterial_pressure = (bp_dia_ave * 2 + bp_sys_ave) / 3,
    # 3. Create young_child variable using a condition
    young_child = if_else(age <= 6, "Yes", "No")
  )

# Summarizing -------------------------------------------------------------

nhanes_small %>%
  filter(!is.na(diabetes)) %>%
  group_by(
    diabetes,
    phys_active
  ) %>%
  summarise(
    max_bmi = max(bmi, na.rm = TRUE),
    min_bmi = min(bmi, na.rm = TRUE)
  )
