# Step 1: Install and load necessary packages
install.packages("tidyverse")
install.packages("lubridate")
library(tidyverse)
library(lubridate)
library(ggplot2)

# Step 2: Read the "cough_gj.csv" file
file_path <- "/Users/mae/Desktop/archive/4-1/bigdata/BigDataAnalysis/resultdata/asthma_gj.csv"
data_cough <- read_csv(file_path)

# Step 3: Convert year and month to date format
data_cough$year_month <- ymd(paste0(data_cough$year, "-", data_cough$month, "-01"))

# Step 4: Plot time series graph
ggplot(data_cough, aes(x = year_month, y = count)) +
  geom_line(color = "green", size = 2) +
  labs(x = "Year", y = "Count", title = "                              천식 발생 건수 ( 광주 )\n") +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  scale_y_continuous(limits = c(0, 40000)) +
  theme_minimal() +
  theme(text = element_text(family = "NanumGothic"))

