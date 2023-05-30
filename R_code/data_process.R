#파일 읽기
cough22<-read.table("/Users/mae/Desktop/archive/4-1/bigdata/20221031_2/cough.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1) #1행을 제외하고 파일 불러오기
asthma22<-read.table("/Users/mae/Desktop/archive/4-1/bigdata/20221031/asthma.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1) #1행을 제외하고 파일 불러오기
dermatitis22<-read.table("/Users/mae/Desktop/archive/4-1/bigdata/20221031/dermatitis.csv", header=FALSE, sep=',', encoding="UTF-8", skip=1) #1행을 제외하고 파일 불러오기


head(cough22)
library(lubridate)

df <- data.frame(cough22,year=year(as.Date(cough22$V1)),month=month(as.Date(cough22$V1)))

library(dplyr)

df2 <- df %>% filter(V2 %in% c("29110","29140","29155","29170","29200")) %>%  ## 지역별로 filter하는 부분
  group_by(year,month) %>% summarise(ddsum=sum(V3)) #연월그룹별로 합계

df2

write.csv(df2,"df2.csv")
getwd()
