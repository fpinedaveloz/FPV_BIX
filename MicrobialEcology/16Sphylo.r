library(ggplot2)
library(tidyverse)
library(readxl)
library(RColorBrewer)

df <- read_excel("ClassPhylo16S.xlsx", col_names = TRUE)
head(df)

cbPalette <- c("gray80", "grey0", "gray55", "gray90", "gray25", "gray10", "gray99", "gray40" )

df2 <- ggplot(df, aes(x = Sample, y = Feature_Count, fill = Taxonomy)) + 
  geom_bar(stat = 'identity', position = 'fill',  color = 'black', size=0.05) + 
  scale_fill_manual(values = cbPalette) +
  labs(title = 'Amplicon Taxonomic Abundance by Class')
df3 <- df2 + xlab("Sample ID") + ylab("Relative Abundance") +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = 'bold')) +
  theme(legend.title = element_blank()) + scale_y_continuous(expand = c(0, 0), labels = scales::percent)+
  theme(axis.line = element_line(color = 'black', size = 0.25, linetype = 'solid'))
df4 <- df3 + scale_x_discrete(labels = c("July28_CP" = "7/28 CP", "July28_PB" = "7/28 PB", "July28_FBF" = "7/28 FBF", "Aug18_CP" = "8/18 CP", 
                                         "Aug18_PB" = "8/18 PB", "Aug18_FBF" = "8/18 FBF", "Sept8_CP" = "9/8 CP", "Sept8_FBF" = "9/8 FBF",
                                         "Aug4_PB" = "8/4 PB")) + theme(axis.text.x = element_text(angle=30, hjust =1))
df5 <- df4 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                     panel.background = element_blank(), axis.line = element_line(colour = "black"))
df5