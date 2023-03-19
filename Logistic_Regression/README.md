# Logistic Regression

This Repo is about build a Logistic regression model using kdb+/q language. Here the logistic regression is follow the gradiant descent and sigmoid functions. 


<h3>Summary:</h3>
* Get data and make it table.
* Prepare and split the data for training and testing.
    * Training - 8000
    * Testing - 2000
* Data preprocessing 
    * Punctuation removal.
    * lower case.
    * Stop words removal.
    * Stemming.
* Extract feature of tweet - convert the tweet to vector based on words frequency.
* Traing the tweets in vector form, get the theta value. 
* Find the sentiment if test data with theta value. Compare the actual result with predicted result. 