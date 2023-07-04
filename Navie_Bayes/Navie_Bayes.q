/
This is update version of https://github.com/Senthilvadivel-20/NLP_in_KDB/blob/main/Navie_Bayes.ipynb
Version 22.01.02
\

/ Here I skip the NLP preprocessing steps like stop word removal, stemming, lemmatization.
/ Coz this is basic idea of implement the NLP in KDB
/ If you have any thoughts please give pull request.


/ Example words. Consider this as a training Data.
positive: "I am happy because I today am learning NLP I am happy not sad hello guys how are you this is good evening I going to office today great evening very well easy"
negative: "I am sad I am not learning NLP today I am sad not happy this is bad evening I take leave today today is not good worst of all not well this is so hard to me"


/Convert the words to symbol list
pos_lis:`$" " vs lower(positive);
neg_lis:`$" " vs lower(negative);

/Make word frequency dictionary
mkdic:{[d;x]$[x in key d;d[x]+:1;d[x]:1];d};

/Make positive word frequency list
w:()!();
w:mkdic/[w;pos_lis];

/Make negative word frequency list
v:()!();
v:mkdic/[v;neg_lis];

/ Make w,v dictionary as a table
pos_t: ([word:key w]; pos:value w);
neg_t: ([word:key v]; negv:value v);

/ Combine the two table based on word column
word_freq: 0!0^(pos_t uj neg_t);

/ Create positive and negative word frequency column, usgin update statement.
update pos_per:pos % sum pos, neg_per:negv % sum negv from `word_freq;

/ 
Get val function for getting the probability value of particular
word present in positive word list and negative word list.

probability = (count accurence_in_positive_list/ count positive_word) / (count accurence_in_negative_list/ count negative_word) 

\

get_val:{exec pos_per%neg_per from word_freq where word in x};
check:{{`Negative`Positive 1<prd get_val[x]}[lower(`$" " vs x)]};

/
q)
check "Hi Guys"
`Positive
check "Today was not good"
`Negative
check "Well I am not happy"
`Negative
check "The task is easy"
`Positive
q)

This function have limitations, if you give untrained words it will return negative only!
If you want just update the word list
\








