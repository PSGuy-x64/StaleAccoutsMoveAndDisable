# StaleAccoutsMoveAndDisable
Move&amp;Disable accounts not logon since X days.

Example : .\StaleAccount.ps1  -Days 100 -moveto 'OU=Disabled,OU=Corp,DC=Contoso,DC=com'

![image](https://github.com/PSGuy-x64/StaleAccoutsMoveAndDisable/assets/130890375/ece492d5-922b-4f57-9dda-91713161e18c)

CSV Report :

![image](https://github.com/PSGuy-x64/StaleAccoutsMoveAndDisable/assets/130890375/2c2e1d6c-2a64-41cd-a83b-61558f7388ef)

NOTES: 
USE SCRIPT IN YOUR RSIK


Risk Mitigation:
Test first in test enviroment,
Do backup before proceed,
Proceed in production in waves,
Start with lmimited no of users,
One day between waves without changes,
Prepare restoreplan incase of need.

Contact AUthor in case of urgent support, psguy-x64@outlook.com
