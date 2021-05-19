library(ggplot2)
library(tidyr)
library(RColorBrewer)
library(readxl)

pd <- read_excel("faith_pd.xlsx", col_names = TRUE)
head(pd)

pd2 <- gather(pd, samples, value1, -Iterations)
head(pd2)



pd3 <- ggplot(pd2, aes(x = Iterations, y = value1)) +
  geom_line(aes(color = samples)) +
  xlab("Sequences") +
  ylab("Phylogenetic Diversity") + 
  scale_y_continuous(expand = c(0, 0)) + theme_classic() + labs(title = 'Faith PD') +
  theme(legend.title = element_blank()) + theme(plot.title = element_text(hjust = 0.5, size = 12, face = 'bold')) 
pd3
