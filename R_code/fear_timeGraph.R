# Step 1: Install and load necessary packages
#install.packages("tidyverse")
#install.packages("lubridate")
#install.packages("extrafont")
library(tidyverse)
library(lubridate)
library(ggplot2)
library(extrafont)

# Step 2: Read the "cough_gj.csv" file
file_fear <- "C:/BigData/BigDataAnalysis/resultData/covid19_fear_22(4).csv"
#file_depressed <- "C:/BigData/BigDataAnalysis/resultData/depressed(PHQ-9)_22(4).csv"
#file_unrest <- "C:/BigData/BigDataAnalysis/resultData/unrest(GAD-7)_22(4).csv"

data_fear <- read_csv(file_fear)
#data_depressed <- read_csv(file_path2)
#data_unrest <- read_csv(file_unrest)

# Step 3: Reshape the data into long format
data_long <- data_fear %>%
  pivot_longer(cols = -구분, names_to = "year_month", values_to = "value") %>%
  separate(year_month, into = c("year", "month"), sep = " ", remove = FALSE)

# Step 4: Convert year and month to date format
data_long$year_month <- ymd(paste0(data_long$year, "-", data_long$month, "-01"))

# 색상 벡터 지정
category_colors <- c("red","#B2182B", "#D6604D", "#F4A582", "#FDDBC7", "#92C5DE", "#4393C3", "#2166AC", "black", "#0066DA")

#font_import()
#loadfonts()

# Step 5: Plot time series graph for each category
ggplot(data_long, aes(x = year_month, y = value, color = 구분)) +
  geom_line(size = 1) +
  labs(x = "\nYear", y = "Value\n", title = "                                           20-22년 분기별 코로나19에 대한 두려움 시계열 그래프\n") +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  scale_color_manual(values = category_colors) +  # 각 카테고리에 대한 색상 지정
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, margin = margin(b = 20)),
        text = element_text(family = "NanumGothic"))
