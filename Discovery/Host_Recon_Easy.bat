whoami
systeminfo
qwinsta
quser

net user Administrator /domain
net Accounts
net localgroup administrators
net use
net share
net group "domain admins" /domain
net config workstation
net accounts
net accounts /domain
net view

wmic useraccount get /ALL
wmic startup list brief
wmic share list
wmic service get name,displayname,pathname
wmic process list brief
wmic process get caption,executablepath
wmic qfe get description,installedOn /format:csv

arp -a
ipconfig /displaydns
route print
netsh advfirewall show allprofiles

findstr /si password C:\Users\*.bat, C:\Users\*.vbs, C:\Windows\Temp\*.vbs, C:\Windows\Temp\*.bat, C:\Windows\Temp\*.ini, C:\Users\*.ini, C:\Users\*.xml
findstr /si pwd= *.xml *.ini *.txt
findstr /si password= *.xml *.ini *.txt
findstr /si pass= *.xml *.ini *.txt
