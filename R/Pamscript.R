pam1 <- read.table(file = "data/pam/pam20180131.tsv", fill = TRUE, header = T, sep = "\t")
pam1 <- pam1[,1:3]
boxplot(pam1$Fv.Fm~pam1$Tank)
anova(lm(pam1$Fv.Fm~pam1$Tank))
