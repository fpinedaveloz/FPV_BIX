library(ggplot2)
library(readxl)
library(tidyverse)
library(RColorBrewer)

df <- read_excel("PICRUStData.xlsx", sheet = 2, col_names = TRUE)
head(df)

cbPalette <- c("gray15", "gray35", "gray65")

df2 <- ggplot(df, aes(x = Pathway, y = FeatureCount, fill = Date))+
  geom_bar(stat = 'identity', position = position_dodge()) + 
  scale_fill_manual(values = cbPalette) +
  labs(title = 'PICRUSt2 Pathway Prevalence by Date')
df3 <- df2 + xlab("Gene Family") + ylab("Feature Count") +
  theme(plot.title = element_text(hjust = 0.5, size = 14, face = 'bold')) +
  theme(legend.title = element_blank()) + scale_y_continuous(expand = c(0, 0), labels = scales::comma) +
  theme(axis.text.x = element_text(angle=30, hjust =1 )) + theme(axis.line = element_line(color = 'black', size = 0.25, linetype = 'solid'))

positions <- c("SucroseBiosyn", "Photoresp", "IncomRedTCA", "GaLacDegrad", "NitrateRed", "SuperPathGbT", "MixFerm",
               "Glyco", "AeroResp", "ChloroABio", "Urea" )

controls <- c("SucroseBiosyn", "Photoresp", "IncomRedTCA", "GaLacDegrad")
aug18 <- c( "NitrateRed", "SuperPathGbT", "MixFerm",
            "Glyco", "AeroResp")
july28 <- c("ChloroABio", "Urea")
subgroups <- c(controls, aug18, july28)


df4 <- df3 +  scale_x_discrete(limits = positions , labels = c("AeroResp" = "Aerobic Respiration", "ChloroABio" = "Chlorophyllide A Biosynthesis", "GaLacDegrad" = "Lactose/Galactose Degradation", "Glyco" = "Glycolysis", 
                                         "IncomRedTCA" = "Incomplete Reductive TCA Cycle", "MixFerm" = "Mixed Acid Fermentation", "NitrateRed" = "Assimilatory Nitrate Reduction", "Photoresp" = "Photorespiration",
                                         "SucroseBiosyn" = "Photosynthetic Sucrose Biosynthesis", "SuperPathGbT" = "Superpathway of Glyoxylate Bypass & TCA Cycle", "Urea" = "Urea Cycle*"))
df5 <- df4 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                   panel.background = element_blank(), axis.line = element_line(colour = "black"))+coord_flip() 
df5


#scale_fill_brewer(palette="Accent")