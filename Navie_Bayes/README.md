# Navie Bayes
Naive Bayes Introduction

To build a classifier, we will first start by creating conditional probabilities given the following table:

![Word and table](./../src/Navie_Bayes_1.png)

This allows us compute the following table of probabilities:

![Probability Table](./../src/Navie_Bayes_probtable.png)

Once you have the probabilities, you can compute the likelihood score as follows

![Final](./../src/Navie_Bayes_final.png)

A score greater than 1 indicates that the class is positive, otherwise it is negative.