# 데이터프레임을 만듦
## 범주형 자료를 남자 5, 여자 5

gender_v <- c(rep("남자",5),rep("여자",5))

## 숫자형 자료 체중, 키

height <- rnorm(10,170,10)
weight <- rnorm(10,60,10)

## 데이터프레임

demo_df <- data.frame(
  "성별" = gender_v,
   "키" = height,
   "몸무게" = weight)
demo_df

library(tidyverse)

#%>% %>% %>% 단축키 -> 컨트롤 + 쉬프트 + M 

demo_df %>% 
  
  select(체중,성별) %>% 
  
  #filter(체중>60)
  filter(성별 == "남자", 체중>55)

demo_df %>%
  mutate(BMI = 체중/(키/100)**2) %>% 
  arrange(desc(BMI))

demo_df %>% 
  group_by(성별) %>% 
  summarise(평균_키 = mean(키),
        최대_키 = max(키),
        사람수 =n()) 
