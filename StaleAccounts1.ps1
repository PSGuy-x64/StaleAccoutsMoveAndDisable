<#
.SYNOPSIS
    Move/Disable unused users for X days

.DESCRIPTION
    Search AD for users not logon for X days
    Disable & Move users for specified OU.
    Generate report
.PARAMETER
    .

.EXAMPLE
    .\StaleAccount.ps1  -Days 100 -moveto 'OU=Disabled,OU=Corp,DC=Contoso,DC=com'

.INPUTS
   'C:\script\input.csv '  

.OUTPUTS
    'C:\script\backup.csv'

.NOTES
    Author            : PS Guy.
    Owner Contact     : psguy-x64@outlook.com.
    Version           : 1.0
    Script send mail  : False.
    Script export csv : true.
    Script Nick Name  : NA

    Version 1.0 - 2023/07/09 by Ahmed Samir, initial release.
#>


#---------------------------------------------------------[      Parameters   ]--------------------------------------------------------
[cmdletbinding()]
Param (
[Parameter(Mandatory=$true,Position=0)]
[int]$Days,
[Parameter(Mandatory=$true,Position=1)]
[string]$moveto
)

#---------------------------------------------------------[   Initialisations  ]--------------------------------------------------------
 Start-Transcript .\StaleAccounts_Transcript.log -Append -Force | Out-Null
 $LastMonth = $(((Get-Date).AddDays(-$Days)).ToFileTime())
 $today = Get-Date
 $i = 1
 Write-Host 'searching for accounts does not logon since ' -f Green -NoNewline
 Write-Host "$days"                                       -b White -f Black -NoNewline 
 Write-Host ' & Move to '                                -f Green -NoNewline
 Write-Host  $moveto                                       -b White -f Black
#--------------------------------------------------------[     Functions      ]--------------------------------------------------------

#---------------------------------------------------------[      Execution     ]--------------------------------------------------------

 $accounts = Get-ADUser -LDAPFilter "(&(lastLogonTimeStamp>=$LastMonth)(SamAccountName=kra))" -pr * | Select SamAccountName,enabled,LastLogonDate,@{N='Days';E={($today-$_.LastLogonDate).Days;}},canonicalname,objectguid
 $accounts | Export-Csv -NoTypeInformation .\StaleAccounts_backup.csv -Force
 $accounts | ft
 Write-Host 'proceed moving ' -f Yellow -NoNewline
 Write-Host $accounts.count 'accounts' -b White -f Black 
 Write-Host ' ' 
 $accounts | % { Write-Host "Moving [$i] $($_.canonicalname)" -f Green ; Disable-ADAccount $_.objectguid ; Move-ADObject $_.objectguid -TargetPath $Moveto ; $i++ }
#---------------------------------------------------------[      Notfication   ]--------------------------------------------------------


#---------------------------------------------------------[      Finish UP     ]--------------------------------------------------------
Stop-Transcript | Out-Null
