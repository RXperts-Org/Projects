install.packages("choroplethr")
install.packages("choroplethrAdmin1")

## load the requisite libraries into R
library("xlsx")
library("choroplethr")
library("choroplethrAdmin1")
library("ggplot2")

setwd("F:/choloropethr Example")
bdregions <- get_admin1_regions("bangladesh")
## gets dataframe of 2 columns with name of country ("bangladesh") throughout column 1
## and name of regions in 2nd column

nrow(bdregions)
## counts the number of regions under country "bangladesh"


df_dev_indicators <- read.xlsx("bd_division_wise_indicators.xlsx", sheetIndex = 1, colIndex = 2:5, rowIndex = 2:8, header = FALSE)
## reads excel data into an R dataframe

df_dev_indicators_2012 <- df_dev_indicators[c(1,2)]
df_dev_indicators_2013 <- df_dev_indicators[c(1,3)]
df_dev_indicators_2014 <- df_dev_indicators[c(1,4)]
## create 3 separate dataframes from the parent dataframe so as to have 2 columns,
## column 1 for region and column 2 for column 2 for value metric

names(df_dev_indicators_2012) <- c("region","value")
names(df_dev_indicators_2013) <- c("region","value")
names(df_dev_indicators_2014) <- c("region","value")
## assigning column names [required as per choroplethr function] 

admin1_choropleth("bangladesh", df_dev_indicators_2012, title = "% Expenditure on Development in 2012 in Bangladesh", legend = "", zoom = NULL)
## prints the choropleth map for 2012 indicators



## --- CONTINUOUS SCALE ---

png(filename="2012.png")
admin1_choropleth("bangladesh", df_dev_indicators_2012, title = "% Expenditure on Development in 2012", legend = "", zoom = NULL)
dev.off()
png(filename="2013.png")
admin1_choropleth("bangladesh", df_dev_indicators_2013, title = "% Expenditure on Development in 2013", legend = "", zoom = NULL)
dev.off()
png(filename="2014.png")
admin1_choropleth("bangladesh", df_dev_indicators_2014, title = "% Expenditure on Development in 2014", legend = "", zoom = NULL)
dev.off()
system("magick -delay 160 *.png bd_indicators3.gif")


