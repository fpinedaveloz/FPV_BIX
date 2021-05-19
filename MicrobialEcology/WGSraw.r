library(ggplot2)
library(tidyr)
library(readxl)
library(RColorBrewer)

df <- read_excel("WGSphylum.xlsx", col_names = TRUE)

df2 <- subset(df, select = -Percentage)
head(df2)

positions <- c('CanarsiePier', 'GrassyBay', 'Rockaway', 'FloydBennett')

p <- ggplot(df2, mapping = aes(x = Site, y = Relative_Abundance, fill = Taxonomy)) + geom_bar(position = "fill", stat = 'identity') +
  scale_fill_brewer(palette="Paired") + 
  labs(title = 'WGS Phlya by Site', caption = '* "Marginal groups" is a cumulative group that represents all phyla which were beneath 1%')
p1 <- p + xlab("Sample Site") + ylab("Relative Abundance") + theme(plot.title = element_text(hjust = 0.5, size = 14, face = 'bold'), plot.caption = element_text(hjust = 0, size = 8))
p2 <- p1 + theme(legend.title = element_blank()) + scale_y_continuous(expand = c(0, 0),labels = scales::percent) + theme(axis.line = element_line(color = 'black', size = 0.25, linetype = 'solid'))
p3 <- p2 + scale_x_discrete( limits = positions, labels = c("GrassyBay" = "Grassy Bay", "Rockaway" = "Rockaway Inlet", "CanarsiePier" = "Canarsie Pier", "FloydBennett" = "Floyd Bennett Field"))
p3
