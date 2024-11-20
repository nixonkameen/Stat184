#Goal: ----
##Provide descriptive and incisive information about the three physical dimensions of diamonds 
##relative to the quality of the cut in a data frame

#Needs:ggplot2, tidyverse, diamonds data frame, summarize, group_by, dplyr vignettes ----

#Import the necessary packages ----
##ggplot2 package and diamonds package ----
library(ggplot2)
view(diamonds)

##TidyVerse Package ----
install.packages("tidyverse")
library(tidyverse)

#First, select only the necessary columns of the diamonds data frame
#Next, Pivot_longer and make the dimensions and value columnns. This tidys the data and makes every row a case
#Next, group by the cut and dimension to prepare for summarizeing.
#Next, summarize
##count
##minimum
##Quartile1
##Median
##Quartile3
##Maximum
##Median Absolute Deviation
##Sample Arithmetic Mean
##Sample Arithmetic Standard Deviation

diamonds_stats <- diamonds %>% 
  select(cut, x:z) %>% 
  pivot_longer(cols = x:z,names_to = "Dimension",values_to = "Value") %>% 
  group_by(cut,Dimension) %>% 
  summarise(count = n(),min = min(Value),Q1 = quantile(Value, .25),median = median(Value),Q3 = quantile(Value, .75),max = max(Value),
  Median_Absolute_Deviation = mad(Value),Sample_Arithmetic_Mean = mean(Value),Sample_Arithmetic_Standard_Deviation = sd(Value))
