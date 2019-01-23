#!/bin/sh

TEMPLATE_FILENAME="2019-xx-xx-template.md"

if [ $# -eq 0 ]
then
    /bin/echo -n "- "
    ruby -e 'puts Time.now.strftime("%Y-%m-%d") + "-title.md"' | xargs cp $TEMPLATE_FILENAME
    ruby -e 'puts Time.now.strftime("%Y-%m-%d") + "-title.md"'
else
    /bin/echo -n "- "
    ruby -e 'puts Time.now.strftime("%Y-%m-%d") + "-#{ARGV[0]}.md"' $1 | xargs cp $TEMPLATE_FILENAME
    ruby -e 'puts Time.now.strftime("%Y-%m-%d") + "-#{ARGV[0]}.md"' $1
fi

echo "Generated draft file from $TEMPLATE_FILENAME."
exit

# The following code is a sample script
# to generate a file to post n-days later.
if [ $# -eq 1 ]
   i=0
    while [ $i -ne $1 ]
    do
	i=`expr $i +  1`
	d=`expr $i \* 7`
	/bin/echo -n "- "
	ruby -r date -e 'puts Date.today.+(ARGV[0].to_i).strftime("%Y-%m-%d") + ".png"' $d
	ruby -r date -e 'puts Date.today.+(ARGV[0].to_i).strftime("%Y-%m-%d") + ".png"' $d | xargs cp $TEMPLATE_FILENAME
    done
fi

