#!/bin/bash

if [[ $# != 1 ]] 
then
    url="www.google.com";
else 
    url="https://$1"
fi
response=$(curl -s {$url})

if [[ -f response.html ]] 
then 
    rm response.html
fi
touch "response.html"

echo ${response} >> response.html

echo "page getted now getting the media files init..."

rm -r siteData
if [[ ! -d siteData ]] 
then
    mkdir siteData
fi


wget --recursive \
    --no-clobber \
    --page-requisites \
    --html-extension \
    --convert-links \
    --restrict-file-names=windows \
    --no-parent \
    -P ./siteData $url