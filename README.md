[![CI](https://github.com/nogibjj/mlops-template/actions/workflows/cicd.yml/badge.svg)](https://github.com/nogibjj/mlops-template/actions/workflows/cicd.yml)


## Bash CLI tool to scrape and transform Twitter Data

In this project, I used twitter API with Tweepy and bash scripts to scrape tweets and perform simple transformations and analysis on these tweets. 

For textual analysis and sentiment analysis, Twitter data is fundamental in important ways. This project aims to use Bash and Tweepy to expedite the extraction and transformation process for Tweets.  

![Project Diagram](https://github.com/nogibjj/bash-etl/issues/1#issue-1410715392)

I used GitHub Code Space's builtin secrets option to add my Twitter API key, secret, access token, and access token secret. The extract.py script is a Click application that authenticates to Twitter using these API authentifications and retrieves the most recent tweets from the handle that is inputed by the user. The Bash script calls on the extract script, get the most recent tweets from a given user and export it to a csv file in the data directory. It then sorts the csv file by the number of favorites on each tweet and echos the number of lines in the file as well as the most popular 5 tweets by the user. 

### Here is an example:

First give the bash script execution permission.

```
chmod +x twitter_etl.sh
```

Then call the script

```
./twitter_etl.sh
```

Bash will ask you to input the Twitter handle of the user you want tweets from, enter their handle, starting with the @. e.g. @JoeBiden or @SpeakerPelosi. 

You will then see a new data directory in your working directory with a raw tweets csv and a sorted csv!