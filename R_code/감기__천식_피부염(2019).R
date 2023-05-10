library(dplyr)

cough19<-read.table("C:/Users/user/BigData/cough_city2019.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1)
asthma19 <- read.table("C:/Users/user/BigData/asthma_city2019.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1)
dermatitis19<-read.table("C:/Users/user/BigData/dermatitis_city2019.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1)

cough19
asthma19
dermatitis19

dim(cough19)
dim(asthma19)
dim(dermatitis19)

cat(cough19[1,3])
cat(asthma19[1,3])
cat(dermatitis19[1,3])

new_cough2019 <- cough19 %>%
  mutate(V2 = as.numeric(V2)) %>%
  group_by(V2) %>%
  summarise(V3 = sum(V3)) %>%
  rename(시군구 = V2, 감기_발생건수 = V3)

new_asthma2019 <- asthma19 %>%
  mutate(V2 = as.numeric(V2)) %>%
  group_by(V2) %>%
  summarise(V3 = sum(V3)) %>%
  rename(시군구 = V2, 천식_발생건수 = V3)

new_dermatitis2019 <- dermatitis19 %>%
  mutate(V2 = as.numeric(V2)) %>%
  group_by(V2) %>%
  summarise(V3 = sum(V3)) %>%
  rename(시군구 = V2, 피부염_발생건수 = V3)

print(new_cough2019, n=300)
print(new_asthma2019, n=300)
print(new_dermatitis2019, n=300)

