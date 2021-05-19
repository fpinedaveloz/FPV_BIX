library(readxl)
library(ggplot2)
library(tidyr)
library(RColorBrewer)

sh <- read_excel("shannon.xlsx", col_names = TRUE)
View(sh)

sh2 <- gather(sh, samples, value1, -iterations)
head(sh2)



sh3 <- ggplot(sh2, aes(x = iterations, y = value1)) +
  geom_line(aes(color = samples)) +
  xlab("Sampling Depth") +
  ylab("Diversity (H)") + 
  scale_y_continuous(expand = c(0, 0)) + theme_classic() + labs(title = 'Shannon Index') +
  theme(legend.title = element_blank()) + theme(plot.title = element_text(hjust = 0.5, size = 12, face = 'bold'))
sh3


