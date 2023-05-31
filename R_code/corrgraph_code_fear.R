# 필요한 패키지 로드
library(readr)
library(ggplot2)
library(extrafont)

# 한글 폰트 설정
font <- "NanumGothic"  # 사용하고자 하는 한글 폰트 지정
font_import()  # 폰트를 불러옴
loadfonts(device = "win")  # 폰트를 로드함
extrafont::font_import(prompt = FALSE)
extrafont::loadfonts()

# 파일 읽기
data <- read_csv("/Users/mae/Desktop/archive/4-1/bigdata/dataset/covid19_fear_22(4).csv")

# 1행(실제2행)과 11행(실제 12행) 값 추출
fear_scores <- as.numeric(data[1, -1])
infection_counts <- as.numeric(data[11, -1])

fear_scores
infection_counts
# 상관분석 계산
correlation <- cor(fear_scores, infection_counts)

# 그래프 그리기
p <- ggplot(data = data.frame(fear_scores, infection_counts), aes(x = infection_counts, y = fear_scores)) +
  geom_point(color = "red") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "                   [코로나19] 감염자수와 두려움 상관분석 그래프\n", x = "\n코로나19 감염자수", y = "코로나 19에 대한 두려움 총점(평균)\n") +
  theme(text = element_text(family = font))

# 그래프에 한글 표시
p <- p + annotate("text", x = max(infection_counts), y = max(fear_scores),
                  label = paste("상관계수:", round(correlation, 2)), hjust = 1, vjust = 1, family = font)

# 그래프 출력
p
