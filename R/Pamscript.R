
pam31 <- read.table(file = "data/pam/pam20180131.tsv", fill = TRUE, header = T, sep = "\t")
pam31 <- pam31[,1:3]
pam31$newcolumn <- 20180131

pam02 <- read.table(file = "data/pam/pam20180202.tsv", fill = TRUE, header = T, sep = "\t")
pam02 <- pam02[,1:3]
pam02$newcolumn <- 20180202

pam05 <- read.table(file = "data/pam/pam20180205.tsv", fill = TRUE, header = T, sep = "\t")
pam05 <- pam05[,1:3]
pam05$newcolumn <- 20180205

pam07 <- read.table(file = "data/pam/pam20180207.tsv", fill = TRUE, header = T, sep = "\t")
pam07 <- pam07[,1:3]
pam07$newcolumn <- 20180207

pam09 <- read.table(file = "data/pam/pam20180209.tsv", fill = TRUE, header = T, sep = "\t")
pam09 <- pam09[,1:3]
pam09$newcolumn <- 20180209

pam12 <- read.table(file = "data/pam/pam20180212.tsv", fill = TRUE, header = T, sep = "\t")
pam12 <- pam12[,1:3]
pam12$newcolumn <- 20180212

pam14 <- read.table(file = "data/pam/pam20180214.tsv", fill = TRUE, header = T, sep = "\t")
pam14 <- pam14[,1:3]
pam14$newcolumn <- 20180214

pam16 <- read.table(file = "data/pam/pam20180216.tsv", fill = TRUE, header = T, sep = "\t")
pam16 <- pam16[,1:3]
pam16$newcolumn <- 20180216

pamtotal <- rbind(pam31, pam02, pam05, pam07, pam09, pam12, pam14, pam16)
            

boxplot(pamtotal$Fv.Fm~pam1$newcolumn)
anova(lm(pam1$Fv.Fm~pam1$Tank))
