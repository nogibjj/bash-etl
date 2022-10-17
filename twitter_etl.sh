#!/bin/bash

#Check if the directory data already exists
if [ ! -d data ]; then
    mkdir data
fi

# get the tweets using the twitter_collector.py script
echo "Enter which handle you want to collect tweets from (with an @):"
read handle1 
python3 extract.py -n $handle1 -c 200

# # Loop through files in data directory
for file in data/*_tweets.csv; do 
    # # Get the filename without the extension
    filename=$(basename -- "$file")
    name=$(echo $filename | awk -F'_' '{print $1}')
    echo "Processing ${name} tweets..."
    echo "We sort the data by the number of favorites in each tweet."
    # sort the file by its favorite counts
    (head -n1 $file && cat $file | sed "1 d" | sort -t , -k 3  -n -r) > data/${name}_sorted.csv
    # (head -n1 $file && cat $file | sed "1 d" | sort -t , -k 3  -n -r) >> $file
    # Get some information about the data
    echo "There are $(wc -l < $file) tweets in the file."
    echo "The columns are:"
    head -n1 $file

    #Get the 5 most favorited tweets
    echo "The 5 most favorited tweets are:"
    echo ""
    head -n 6 data/${name}_sorted.csv | sed "1 d"
    echo ""
done
