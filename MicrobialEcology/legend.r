library(ggplot2)
library(tidyverse)
library(RColorBrewer)
library(readxl)

g <- read_xlsx("WGSgenus.xlsx", col_names = TRUE)

g2 <- subset(g, select = -Percent_Abundance)

#nb.cols <- 24
mycolors <- c(brewer.pal(name = "Set3", n = 12), brewer.pal(name = "Paired", n = 12))
positions <- c('CanarsiePier', 'GrassyBay', 'Rockaway', 'FloydBennett')

p <- ggplot(g2, mapping = aes(x = Site, y = Relative_Abundance, fill = Taxonomy)) + geom_bar(position = "fill", stat = 'identity') +
  scale_fill_manual(values = mycolors) + 
  labs(title = 'WGS Genera by Site')
p1 <- p + xlab("Sample Site") + ylab("Relative Abundance") + theme(plot.title = element_text(hjust = 0.5, size = 14, face = 'bold'), plot.caption = element_text(hjust = 0, size = 8))
p2 <- p1 + theme(legend.title = element_blank(), legend.position = "right") + scale_y_continuous(expand = c(0, 0), labels = scales::percent)
p3 <- p2 + scale_x_discrete(limits = positions, labels = c("GrassyBay" = "Grassy Bay", "Rockaway" = "Rockaway Inlet", "CanarsiePier" = "Canarsie Pier", "FloydBennett" = "Floyd"))
p4 <- p3 + theme(axis.line = element_line(color = 'black', size = 0.25, linetype = 'solid'))
p4
