library(tidyverse)
library(hexbin)
library(jsonlite)
library(httr)
library(scales)
library(ggExtra)   # marginal plots
library(ggtext)    # color your text
library(patchwork) # combine multiple plots
library(paletteer) # get all the color palettes
library(scales) 
library(ggplot2)
library(ggrepel)
library(gt)

Net_Rtg_Win <- read.csv("NBA_Rtg_W.csv")

Net_Rtg_Win%>%
  ggplot(aes(x= NETRTG, y= W))+
  geom_point()+
  geom_text_repel(aes(label = TEAM))+
  stat_smooth(geom = "line", alpha = 0.5, se=FALSE, method = "lm", color = "red")+
  scale_x_continuous(breaks = seq(-10, 10, 1))+
  scale_y_continuous(breaks = seq(0,25,1))+
  labs(x = "Net Rating",
       y = "Wins",
       title = "Wins vs Net Rating (Feb 24,2021)",
       caption = "Data:Nba.com, plot: @_ThomasT")


offRTG <- read_csv("OffRtg_Shot.csv")
offRTG <- offRTG%>%
  mutate(Rim3Freq = AtRimFG3AFrequency*100)


offRTG %>%  ggplot(aes(x = Rim3Freq, y= OffRtg))+
  geom_point(aes(size = 0.5), alpha =0.5)+
  geom_text_repel(aes(label = Name))+
  geom_smooth(method = lm, se = FALSE, color = "red", linetype = "dashed")+
  scale_x_continuous(breaks = seq(58,85,1))+
  scale_y_continuous(breaks = seq(80, 120,2))+
  labs(x = "At Rim or 3 Frequency",
       y= "Offenisve Rating",
       title = "Offenisve Rating vs Rim Or 3 Frequency %(Feb 24 2021)",
       caption = "Data: pbpstats, plot:@_ThomasT")
