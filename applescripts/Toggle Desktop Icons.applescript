do shell script "STATUS=`defaults read com.apple.finder CreateDesktop`
if [ $STATUS == true ]; 
then
    defaults write com.apple.finder CreateDesktop false
else
    defaults write com.apple.finder CreateDesktop true
fi
killall Finder"