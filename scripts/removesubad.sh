#!/usr/bin/bash
#Removes ads from downloaded subtitles

#convert to proper format first

chmod 777 "*.srt"
dos2unix "*.srt"

#remove subtitle ads

#addic7ed
sed -i '/.*www\.addic7ed\.com.*/d' "*.srt"

### ENGLISH ###
#vegusto
sed -i '/Delicious Vegan Sausages, Cheese/d; /and Burgers - Vegusto.co.uk/d' "*.en.srt"
#looklive
sed -i '/Shop this shows fashion, download the/d; /"LookLive" app in iTunes/d' "*.en.srt"
#opensubtitles
sed -i '/Support us and become VIP member /d; /to remove all ads from www.OpenSubtitles.org/d' "*.en.srt"
#gts-translation
sed -i '/Professional Translation Services/d; /www.gts-translation.com/d' "*.en.srt"
#americas-cardroom
sed -i '/AmericasCardroom.com brings poker back/d; /Million Dollar Sunday Tournament every Sunday/d' "*.en.srt"
###

### DUTCH ###
#panther pro
sed -i '/De Panther pro beste streambox van 2016 betaal geen abonnement meer kijk alles gratis/d; /www.pantherpro.nl/d' "*.nl.srt"
#tvbox
sed -i '/De meest gebruiksvriendelijke streambox:/d; /www.TvBoxPro.nl/d' "*.nl.srt"
#looklive
sed -i '/Shop deze kleding op LookLive.com/d' "*.nl.srt"
#gratisstreamen
sed -i '/Bekijk de reviews en bestel op GRATISSTREAMEN.NL/d' "*.nl.srt"
###

### FRENCH ###
#looklive
sed -i '/Achète la mode de cet ep via Loolive.com/d' "*.fr.srt"
sed -i '/Ach�te la mode de cet ep via Loolive.com/d' "*.fr.srt"
###

### TBA ###

#sync and corrected
sed -i '/.*Synced & corrected.*/d' "*.srt"
sed -i 'Sync et corrigé par.*' "*.srt"
sed -i 'Syncro par.*' "*.srt"
sed -i '/Resync by <font color=.*>/d' "*.srt"

#tvsubtitles.net
sed -i '/<font color=.*>www.tvsubtitles.*$/d' "*.srt"
