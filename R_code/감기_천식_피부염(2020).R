library(dplyr)

cough20<-read.table("C:/Users/user/BigData/cough_city2020.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1)
asthma20 <- read.table("C:/Users/user/BigData/asthma_city2020.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1)
dermatitis20<-read.table("C:/Users/user/BigData/dermatitis_city2020.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1)

cough20
asthma20
dermatitis20

dim(cough20)
dim(asthma20)
dim(dermatitis20)

cat(cough20[1,3])
cat(asthma20[1,3])
cat(dermatitis20[1,3])

new_cough2020 <- cough20 %>%
  mutate(V2 = as.numeric(V2)) %>%
  group_by(V2) %>%
  summarise(V3 = sum(V3)) %>%
  rename(시군구 = V2, 감기_발생건수 = V3)

new_asthma2020 <- asthma20 %>%
  mutate(V2 = as.numeric(V2)) %>%
  group_by(V2) %>%
  summarise(V3 = sum(V3)) %>%
  rename(시군구 = V2, 천식_발생건수 = V3)

new_dermatitis2020 <- dermatitis20 %>%
  mutate(V2 = as.numeric(V2)) %>%
  group_by(V2) %>%
  summarise(V3 = sum(V3)) %>%
  rename(시군구 = V2, 피부염_발생건수 = V3)

print(new_cough2020, n=300)
print(new_asthma2020, n=300)
print(new_dermatitis2020, n=300)