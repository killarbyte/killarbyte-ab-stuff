#!/bin/bash
URL="http://tululu.org/"
RAZDEL=fantastic
PAGE_TMP=/tmp/page.tmp 
BOOK_TMP=/tmp/book.tmp
BOOKS_DIR=~/Scripts/Books
test -d $BOOKS_DIR || mkdir $BOOKS_DIR
for page in {1..1015}
do
   echo -e "======================================\nОбрабатывается страница номе $page\n======================================"
   wget "${URL}/${RAZDEL}/$page" -O- 2> /dev/null | iconv -f cp1251 -t utf-8 -o $PAGE_TMP
   grep 'bookimage' $PAGE_TMP | while read BOOK 
   do
      echo $BOOK | sed s/alt.*//gi \
      | sed s/.*'><a '//gi \
      | sed s/'><img'//gi \
      | sed s/'\" '/'\"\n'/gi > $BOOK_TMP
      . $BOOK_TMP
      ID=`echo ${href//\/} | sed s/^b//`
      wget "${URL}/$href" -O-  2> /dev/null \
      | iconv -f cp1251 -t utf-8 \
      | grep 'скачать txt' > /dev/null && \
      echo " * Книга $title" ; \
      wget -c "${URL}/txt.php?id=${ID}" -O ${BOOKS_DIR}/"${title}.txt"  2> /dev/null
   done
done