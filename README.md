# StaleAccoutsMoveAndDisable
Move&amp;Disable accounts not logon since X days.

Example : .\StaleAccount.ps1  -Days 100 -moveto 'OU=Disabled,OU=Corp,DC=Contoso,DC=com'

![image](https://github.com/PSGuy-x64/StaleAccoutsMoveAndDisable/assets/130890375/678a8fda-2a9e-4da6-9bd5-96a9b7cb5fc0)


SamAccountName	enabled	LastLogonDate	Days	canonicalname	objectguid
Hr1	TRUE	7/9/2023 22:27	30	Contoso.com/Corp/Disabled/Hr1	1fc7f031-9a0c-4852-abac-95fffcb89698
kra	TRUE	6/6/2023 13:52	33	Contoso.com/Corp/Disabled/kra	a2f6bbfd-84df-4704-9d5f-fbf6b1b4afe3
![image](https://github.com/PSGuy-x64/StaleAccoutsMoveAndDisable/assets/130890375/2c2e1d6c-2a64-41cd-a83b-61558f7388ef)

