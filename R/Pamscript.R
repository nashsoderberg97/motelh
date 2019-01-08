library(devtools)  # install.packages("devtools")
#devtools::install_github("jrcunning/steponeR")
library(steponeR)
library(tidyverse)

#Loads pam data, then takes the columns with data, then reads the date column as dates
pam01 <- read.table(file = "data/pam/pam20180131.tsv", fill = TRUE, header = T, sep = "\t")
pam01 <- pam01[,1:3]
pam01$date <- as.Date("2018-01-31")

pam02 <- read.table(file = "data/pam/pam20180202.tsv", fill = TRUE, header = T, sep = "\t")
pam02 <- pam02[,1:3]
pam02$date <- as.Date("2018-02-02")

pam03 <- read.table(file = "data/pam/pam20180205.tsv", fill = TRUE, header = T, sep = "\t")
pam03 <- pam03[,1:3]
pam03$date <- as.Date("2018-02-05")

pam04 <- read.table(file = "data/pam/pam20180207.tsv", fill = TRUE, header = T, sep = "\t")
pam04 <- pam04[,1:3]
pam04$date <- as.Date("2018-02-07")

pam05 <- read.table(file = "data/pam/pam20180209.tsv", fill = TRUE, header = T, sep = "\t")
pam05 <- pam05[,1:3]
pam05$date <- as.Date("2018-02-09")

pam06 <- read.table(file = "data/pam/pam20180212.tsv", fill = TRUE, header = T, sep = "\t")
pam06 <- pam06[,1:3]
pam06$date <- as.Date("2018-02-12")

pam07 <- read.table(file = "data/pam/pam20180214.tsv", fill = TRUE, header = T, sep = "\t")
pam07 <- pam07[,1:3]
pam07$date <- as.Date("2018-02-14")

pam08 <- read.table(file = "data/pam/pam20180216.tsv", fill = TRUE, header = T, sep = "\t")
pam08 <- pam08[,1:3]
pam08$date <- as.Date("2018-02-16")

pam10 <- read.table(file = "data/pam/pam20180228.tsv", fill = TRUE, header = T, sep = "\t")
pam10 <- pam10[,1:3]
pam10$date <- as.Date("2018-02-28")

pam11 <- read.table(file = "data/pam/pam20180321.tsv", fill = TRUE, header = T, sep = "\t")
pam11 <- pam11[,1:3]
pam11$date <- as.Date("2018-03-21")

pam12 <- read.table(file = "data/pam/pam20180523.tsv", fill = TRUE, header = T, sep = "\t")
pam12 <- pam12[,1:3]
pam12$date <- as.Date("2018-05-23")

pam13 <- read.table(file = "data/pam/pam20180525.tsv", fill = TRUE, header = T, sep = "\t")
pam13 <- pam13[,1:3]
pam13$date <- as.Date("2018-05-25")

pam14 <- read.table(file = "data/pam/pam20180526.tsv", fill = TRUE, header = T, sep = "\t")
pam14 <- pam14[,1:3]
pam14$date <- as.Date("2018-05-26")

pam15 <- read.table(file = "data/pam/pam20180527.tsv", fill = TRUE, header = T, sep = "\t")
pam15 <- pam15[,1:3]
pam15$date <- as.Date("2018-05-27")

pam16 <- read.table(file = "data/pam/pam20180528.tsv", fill = TRUE, header = T, sep = "\t")
pam16 <- pam16[,1:3]
pam16$date <- as.Date("2018-05-28")

pam17 <- read.table(file = "data/pam/pam20180528.tsv", fill = TRUE, header = T, sep = "\t")
pam17 <- pam17[,1:3]
pam17$date <- as.Date("2018-05-28")

pam18 <- read.table(file = "data/pam/pam20180529.tsv", fill = TRUE, header = T, sep = "\t")
pam18 <- pam18[,1:3]
pam18$date <- as.Date("2018-05-29")

pamtotal <- rbind(pam01, pam02, pam03, pam04, pam05, pam06, pam07, pam08, pam10, pam11, pam12, pam13, pam14, pam15, pam16, pam17, pam18)
            
boxplot(pamtotal$Fv.Fm~pamtotal$date)
anova(lm(pam1$Fv.Fm~pam1$Tank))

pamtotal1 <- pamtotal
pamtotal1$Tank <- as.character(pamtotal1$Tank)

#reads treatment from tank and puts in column "treatment" of pamtotal
if (nchar(pamtotal$Tank, type = "chars", allowNA = FALSE, keepNA = NA) > 3) {
pamtotal$treatment <- substr(pamtotal$Tank, 4, 5)
} else {
  pamtotal$treatment <- substr(pamtotal$Tank, 3, 3)
}
control <- subset(pamtotal, treatment == "C")

#fixes the formatting of the later pam tables
pamtotal1$Tank <- replace(pamtotal1$Tank, pamtotal1$Tank=="6AC", "6A-C")
pamtotal1$Tank <- replace(pamtotal1$Tank, pamtotal1$Tank=="6AH", "6A-HT")
pamtotal1$Tank <- replace(pamtotal1$Tank, pamtotal1$Tank=="7AC", "7A-C")
pamtotal1$Tank <- replace(pamtotal1$Tank, pamtotal1$Tank=="7AH", "7A-HT")
pamtotal1$Tank <- replace(pamtotal1$Tank, pamtotal1$Tank=="7BC", "7B-C")
pamtotal1$Tank <- replace(pamtotal1$Tank, pamtotal1$Tank=="7BH", "7B-HT")

#creates a separate column for treatment
pamtotal1$treatment <- substr(pamtotal1$Tank, 4, 5)

#Need a dataframe of means to clean the plot up a bit
stress1_df <- aggregate(pamtotal1[,3], list(pamtotal1$date, pamtotal1$treatment), mean)

stress1_plot <- ggplot(pamtotal1, aes(x = date, y = Fv.Fm, color = treatment)) +
  geom_smooth(method = "loess")

min <- as.Date(NA)
max <- as.Date("2018-03-21")
stress1_plot + scale_x_date(limits = c(min, max))

stress1_plot

#Now I need to make a plot to utilize the means of each of the treatments to clean up the plot for a clearer picture of what's happening, also it would be good to differentiate the different treatments by different colored lines with ggplot
#May have to separate the treatments into different dataframes if I can't figure out how to incorporate mean into the ggplot







boxplot(control$Fv.Fm~control$date)

light <- subset(pamtotal, treatment == "HL")

boxplot(light$Fv.Fm~light$date)

heat <- subset(pamtotal, treatment == "HT")

boxplot(heat$Fv.Fm~heat$date)


