#!/bin/bash


#a. Create copy of passwd file to passwd_new. :exclamation: Do all modifications on passwd_new file

#b. Change shell for user saned from /usr/sbin/nologin to /bin/bash using AWK
awk -i inplace '/saned/ {gsub("/usr/sbin/nologin", "/bin/bash")}1' passwd_new

#c. Change shell for user avahi from /usr/sbin/nologin to /bin/bash using SED

sed -i '/avahi/s/\/usr\/sbin\/nologin/\/bin\/bash/' passwd_new

#d. Save only 1-st 3-th 5-th 7-th columns of each string based on : delimiter

awk -i inplace -F ":" '/1/ {print $1 ":" $3 ":" $5 ":" $7}' passwd_new

#e. Remove all lines from file containing word daemon

sed -i '/daemon/d' passwd_new

#f. Change shell for all users with even UID to /bin/zsh
awk -i inplace -F ":" '{$4="/bin/zsh"; print $1 ":" $2 ":" $3 ":" $4}' passwd_new

