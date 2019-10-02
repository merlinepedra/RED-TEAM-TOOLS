echo on HOST Enumeration:
echo on --- OS Specifics ---
wmic OS get Caption,OSArchitecture,Version
wmic BIOS get Manufacturer,Name,SMBIOSBIOSVersion,Version
wmic CPU get Name,NumberOfCores,NumberOfLogicalProcessors
wmic NIC get Description,MACAddress,NetEnabled,Speed
wmic USERACCOUNT get Caption,Name,PasswordRequired,Status
wmic csproduct get vendor, version
wmic computersystem LIST full
wmic process get Name, executablepath, processid
wmic startup get Caption,Command,Location,User
wmic PRODUCT get Description,InstallDate,InstallLocation,Vendor,Version

echo on :: --- Local User Accounts ---
wmic USERACCOUNT Get Domain,Name,Sid
wmic USERACCOUNT list full
wmic useraccount get /ALL


echo on --- Netowrk Config ---
wmic nicconfig where IPEnabled='true' get Caption,DefaultIPGateway,Description,DHCPEnabled,DHCPServer,IPAddress,IPSubnet,MACAddress

echo on --- Anti-Virus ---
wmic /namespace:\\root\securitycenter2 path antivirusproduct

echo on --- Directory Listing and File Search ---
REM wmic DATAFILE where "path='\\Users\\[VICTIM_USERNAME]'" GET Name,readable,size
REM wmic DATAFILE where "drive='C:' AND Name like '%password%'" GET Name,readable,size /VALUE
wmic DATAFILE where "name like '%.doc'" get Name 
wmic DATAFILE where "name like '%.pdf'" get Name
REM wmic DATAFILE where "name like '%.xls'" get Name
REM wmic DATAFILE where "name like '%.xlsx'" get Name
REM wmic DATAFILE where "name like '%.docx'" get Name
REM wmic DATAFILE where "name like '%.ppt'" get Name

echo on Domain Enumeration:
echo on --- Domain and DC Info ---
wmic NTDOMAIN GET DomainControllerAddress,DomainName,Roles /VALUE

echo on --- Domain User Info ---
wmic /NAMESPACE:\\root\directory\ldap PATH ds_user where "ds_samaccountname='Admin'"

echo on --- List All Users ---
wmic /NAMESPACE:\\root\directory\ldap PATH ds_user GET ds_samaccountname

echo on --- List All Groups ---
wmic /NAMESPACE:\\root\directory\ldap PATH ds_group GET ds_samaccountname

echo on --- Members of A Group ---
wmic /NAMESPACE:\\root\directory\ldap PATH ds_group where "ds_samaccountname='Domain Admins'" Get ds_member /Value

echo on --- List All Computers ---
wmic /NAMESPACE:\\root\directory\ldap PATH ds_computer GET ds_samaccountname
wmic /NAMESPACE:\\root\directory\ldap PATH ds_computer GET ds_dnshostname

echo on Misc:
echo on --- Execute Remote Command ---
wmic process call create "cmd.exe /c ping google.com"

echo on --- Peripherals ---
wmic path Win32_PnPdevice 

echo on --- Installed Updates ---
wmic qfe list brief

REM --- Enable Remote Desktop ---
REM wmic rdtoggle where AllowTSConnections="0" call SetAllowTSConnections "1"
REM wmic /node:remotehost path Win32_TerminalServiceSetting where AllowTSConnections="0" call SetAllowTSConnections "1"
