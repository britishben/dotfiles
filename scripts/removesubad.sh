#!/usr/bin/env bash

#convert to proper format first

chmod 777 *.srt
dos2unix *.srt

#remove subtitle ads

### ENGLISH ###
#vegusto
sed -i '/Delicious Vegan Sausages, Cheese/d' *.en.srt && sed -i '/and Burgers - Vegusto.co.uk/d' *.en.srt
#looklive
sed -i '/Shop this shows fashion, download the/d' *.en.srt && sed -i '/"LookLive" app in iTunes/d' *.en.srt
#opensubtitles
sed -i '/Support us and become VIP member /d' *.en.srt && sed -i '/to remove all ads from www.OpenSubtitles.org/d' *.en.srt
#gts-translation
sed -i '/Professional Translation Services/d' *.en.srt && sed -i '/www.gts-translation.com/d' *.en.srt
###

### DUTCH ###
#panther pro
sed -i '/De Panther pro beste streambox van 2016 betaal geen abonnement meer kijk alles gratis/d' *.nl.srt && sed -i '/www.pantherpro.nl/d' *.nl.srt
#tvbox
sed -i '/De meest gebruiksvriendelijke streambox:/d' *.nl.srt && sed -i '/www.TvBoxPro.nl/d' *.nl.srt
#looklive
sed -i '/Shop deze kleding op LookLive.com/d' *.nl.srt
#gratisstreamen
sed -i '/Bekijk de reviews en bestel op GRATISSTREAMEN.NL/d' *.nl.srt
###

### FRENCH ###
#looklive
sed -i '/AchÃ¨te la mode de cet ep via Loolive.com/d' *.fr.srt
sed -i '/Achète la mode de cet ep via Loolive.com/d' *.fr.srt
###

### TBA ###


