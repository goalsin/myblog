#!/bin/bash

function dols()
{
  echo 'Title: 诗歌'>$2
  echo 'Category:'>>$2
  echo 'Slug: poem'>>$2
  echo ''>> $2

  for file in `ls -t $1`
  do
    if [ -d $1"/"$file ]
    then
      echo 'dir'
    else
      wc -L $1"/"$file | cut -d' ' -f1 >> ./out
      date_created=`echo $file| awk -F '_' '{print $1}'`
      url=`echo $file| awk -F '_' '{print $2}'| awk -F '.' '{print $1}' `
      title=`head -1 $1"/"$file | awk -F ':' '{print $2}'`
      echo "* ["$date_created" "$title"]("$url")" >> $2
     # echo $str
     # echo $str >> ./out
    fi

  done
}

INIT_PATH="./content/pages/poem"
OUT_PATH="./content/pages/poem.md"
dols $INIT_PATH $OUT_PATH
