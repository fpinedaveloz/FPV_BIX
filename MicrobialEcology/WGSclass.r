library(ggplot2)
library(tidyverse)
library(readxl)
library(RColorBrewer)

c <- read_excel("WGSclass.xlsx", col_names = TRUE)
head(c)

c1 <- subset(c, select = -Percent_Abundance)
nb.cols <- 14
mycolors <- colorRampPalette(brewer.pal(8, "Accent"))(nb.cols)

cbPalette <- c("gray95", "gray35", "gray15", "gray45", "gray85", "gray25", "gray75", "gray99")
cbbPalette <- c("gray0", "grey80", "gray55", "gray90", "gray35", "gray10")
Combo <- c(cbPalette, cbbPalette)

positions <- c('CanarsiePier', 'GrassyBay', 'Rockaway', 'FloydBennett')

c2 <- ggplot(c1, mapping = aes(x = Site, y = Relative_Abundance, fill = Taxonomy))+ geom_bar(stat = 'identity', position = 'fill', color = 'black', size=0.05)+
  scale_fill_manual(values = Combo) + 
  labs(title = 'WGS Class by Site', caption = '* "Marginal groups" is a cumulative group that represents all classes which were beneath 1%')
c3 <- c2 + xlab("Sample Site") + ylab("Relative Abundance") + theme(plot.title = element_text(hjust = 0.5, size = 14, face = 'bold'), plot.caption = element_text(hjust = 0, size = 8))
c4 <- c3 + theme(legend.title = element_blank()) + scale_y_continuous(expand = c(0, 0), labels = scales::percent) 
c5 <- c4 + scale_x_discrete(limits = positions, labels = c("GrassyBay" = "Grassy Bay", "Rockaway" = "Rockaway Inlet", "CanarsiePier" = "Canarsie Pier", "FloydBennett" = "Floyd Bennett Field"))
c6 <- c5  + theme(axis.line = element_line(color = 'black', size = 0.25, linetype = 'solid'))
c6

