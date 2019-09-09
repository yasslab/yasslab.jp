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

    # Write down here if your screen name
    # is different from your Twitter name.
    AUTHOR=`whoami`
    case $AUTHOR in
	"yuppy" ) AUTHOR="Yuppyhappytoyou" ;;
    esac

    echo "---"                     >  $TEMPLATE_FILENAME
    echo "layout: post"            >> $TEMPLATE_FILENAME
    echo "title:  タイトル"        >> $TEMPLATE_FILENAME
    echo "thumbnail: bg-sky.jpg"   >> $TEMPLATE_FILENAME
    echo "author: ${AUTHOR}"       >> $TEMPLATE_FILENAME
    echo "categories: [blog]"      >> $TEMPLATE_FILENAME
    echo "tags: [登壇, Rails]"     >> $TEMPLATE_FILENAME
    echo "---"                     >> $TEMPLATE_FILENAME
    echo ""                        >> $TEMPLATE_FILENAME
    cat  $SAMPLE_POST_TEXT         >> $TEMPLATE_FILENAME

    ruby -e 'puts Time.now.strftime("%Y-%m-%d") + "-" + ARGV[0].gsub("_", "-") + ".md"' $1
fi
echo ""
