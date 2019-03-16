#!/bin/sh

SAMPLE_POST_TEXT="_post-sample.md"

if [ $# -eq 0 ]
then
    echo "Hey! Give me URL to create draft post. ;)"
    echo "Usage: $ ./create-draft-from-template.sh POST_TITLE"
    echo " e.g.: $ ./create-draft-from-template.sh krisp-trial"
else
    /bin/echo -n "Generated "

    TEMPLATE_FILENAME=`ruby -e 'puts Time.now.strftime("%Y-%m-%d") + "-#{ARGV[0]}.md"' $1`
    echo "---"                     >  $TEMPLATE_FILENAME
    echo "layout: post"            >> $TEMPLATE_FILENAME
    echo "title:  タイトル"        >> $TEMPLATE_FILENAME
    echo "thumbnail: bg-sky.jpg"   >> $TEMPLATE_FILENAME
    echo "author: `whoami`"        >> $TEMPLATE_FILENAME
    echo "categories: [blog]"      >> $TEMPLATE_FILENAME
    echo "tags: [press, rails]"    >> $TEMPLATE_FILENAME
    echo "permalink: /ja/posts/$1" >> $TEMPLATE_FILENAME
    echo "---"                     >> $TEMPLATE_FILENAME
    echo ""                        >> $TEMPLATE_FILENAME
    cat  $SAMPLE_POST_TEXT         >> $TEMPLATE_FILENAME

    ruby -e 'puts Time.now.strftime("%Y-%m-%d") + "-#{ARGV[0]}.md"' $1
fi
echo ""
