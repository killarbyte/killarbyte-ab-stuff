# vars
# base1="good"
# base2="goodHQ"
# base3="testing"
# base4="[Z]all"
# base5="bad"
# tmp="tmp"
# rdy="rdy"

echo "##############################################################################"
echo "# BLACKLIST"
echo "##############################################################################"

blacklist="blacklist.txt"

# clean blacklist
> $tmp/$blacklist

# download blacklists to one file
curl -L https://raw.githubusercontent.com/killarbyte/killarbyte-ab-stuff/main/soft/Botmaster/Xrumer/Base/Blacklist/bl-extentions.txt >> tmp/blacklist.txt
echo "" >> tmp/blacklist.txt

curl -L https://raw.githubusercontent.com/killarbyte/killarbyte-ab-stuff/main/soft/Botmaster/Xrumer/Base/Blacklist/bl-web2.0.txt >> tmp/blacklist.txt
echo "" >> tmp/blacklist.txt

curl -L https://raw.githubusercontent.com/killarbyte/killarbyte-ab-stuff/main/soft/Botmaster/Xrumer/Base/Blacklist/bl-webservice.txt >> tmp/blacklist.txt
echo "" >> tmp/blacklist.txt

curl -L https://raw.githubusercontent.com/killarbyte/killarbyte-ab-stuff/main/soft/Botmaster/Xrumer/Base/Blacklist/bl-gos.txt >> tmp/blacklist.txt
echo "" >> tmp/blacklist.txt

curl -L https://raw.githubusercontent.com/killarbyte/killarbyte-ab-stuff/main/soft/Botmaster/Xrumer/Base/Blacklist/bl-domains.txt >> tmp/blacklist.txt
echo "" >> tmp/blacklist.txt

# remove blacklisted lines from base
#grep -v -f tmp/blacklist.txt tmp/base.txt > tmp/basenew.txt

echo "# remove blacklisted lines from good-base"
grep -v -f $tmp/$blacklist $base1/$base1-links.txt > $base1/$base1-links-tmp.txt
mv $base1/$base1-links-tmp.txt $base1/$base1-links.txt && sleep 3


echo "# remove blacklisted lines goodHQ-base"
grep -v -f $tmp/$blacklist $base2/$base2-links.txt > $base2/$base2-links-tmp.txt
mv $base2/$base2-links-tmp.txt $base2/$base2-links.txt && sleep 3


echo "# remove blacklisted lines from testing-base"
grep -v -f $tmp/$blacklist $base3/$base3-links.txt > $base3/$base3-links-tmp.txt
mv $base3/$base3-links-tmp.txt $base3/$base3-links.txt && sleep 3


echo "# remove blacklisted lines from [Z]base"
grep -v -f $tmp/$blacklist $base4/$base4-links.txt > $base4/$base4-links-tmp.txt
mv $base4/$base4-links-tmp.txt $base4/$base4-links.txt && sleep 3


echo "# remove blacklisted lines from bad"
grep -v -f $tmp/$blacklist $base5/$base5-links.txt > $base5/$base5-links-tmp.txt
mv $base5/$base5-links-tmp.txt $base5/$base5-links.txt && sleep 3


clear