<#
Remote Drive Re-mapping
v1.0

This script was designed for remote users that need to have their login scripts remapped, but cannot do so because their login script can't execute at startup. Works for users that have their login script defined in their AD profile.

--Functionality--
1. Uses profile cache to determine what login script to run
2. Executes script in a command prompt

--Requirements--
1. User must have remote connection to the domain
2. If using name of DC, remote connection must have DNS available.
#>

#Name or IP of Domain Controller
$dc = 'fp-dc1'

$file = (([adsisearcher]"(&(objectCategory=User)(samaccountname=$env:UserName))").findall()).properties.scriptpath
start-process "cmd.exe" "/c \\$dc\NETLOGON\$file";