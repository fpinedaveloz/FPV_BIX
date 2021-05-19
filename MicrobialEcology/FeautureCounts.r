library(tidyverse)
library(gt)

t <- read_csv("sample-frequency-detail.csv", col_names = TRUE)
head(t)

t1 <- gt(data = t)
t1

t1 <-
  t1 %>% 
  tab_header(
    title = md("**Amplicon Feature Count by Sample in QIIME2**")
  )
t1