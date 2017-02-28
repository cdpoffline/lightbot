#!/bin/bash

cd "`dirname $0`"

website="../web"
zipfile="../web/lightbot.zip"
lightbot_folder="$website/lightbot.com"
webpage="flash.html"

mkdir -p "$website"


(
  cd $website || { >&2 echo "ERROR: Could not find website directory \"$website\"." ; exit 1 ; }
  echo "downloading to `pwd`"
  wget -c -N -p -k "http://lightbot.com/$webpage"
) || { >&2 echo "ERROR: could not download." ; exit 1 ; }

echo "<html>
  <head>
    <meta http-equiv=refresh content='0; url=$webpage' />
  </head>
  <body>
    <h1><a href=\"$webpage\">Lightbot</a></h1>
  </body>
</html>" > "$lightbot_folder"/index.html

rm -f $zipfile
zip -r -9 -o $zipfile $lightbot_folder

wget -c -N -O "$website/lightbot.apk" https://github.com/cdpoffline/lightbot/releases/download/do-not-touch/lightbot.apk

