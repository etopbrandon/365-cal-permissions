$Owner = Read-Host "Please enter the email of the user who owns the calendar"
$User = Read-Host "Please enter the email of the user who needs permissions to access the owner's calendar"
Write-Host "Permission Levels:" -ForegroundColor Yellow
Write-Host "(1) Full Editing Rights" -ForegroundColor Yellow
Write-Host "(2) Read-Only" -ForegroundColor Yellow
Write-Host "(3) Only See if Busy" -ForegroundColor Yellow
$PermissionSel = Read-Host "Please enter the number corresponding with the correct permission"

if ($PermissionSel -eq "1"){
    $Confirm = Read-Host "I will be allowing $User to edit the calendar owned by $Owner. Is this correct? (y/n)"
    if ($Confirm -eq "y"){
        Connect-ExchangeOnline
        Write-Host "Updating permissions, please wait..."
        Add-MailboxFolderPermission -Identity "${Owner}:\calendar" -user $User -AccessRights editor | Out-Null
        Get-MailboxFolderPermission "${Owner}:\calendar"
        Read-Host "I have updated the permissions on the Owner's mailbox to reflect the above output. Press enter to exit"
    } else {
        Read-Host "Press enter to exit"
    }
} elseif ($PermissionSel -eq "2"){
    $Confirm = Read-Host "I will be allowing $User to only read the calendar owned by $Owner. Is this correct? (y/n)"
    if ($Confirm -eq "y"){
        Connect-ExchangeOnline
        Write-Host "Updating permissions, please wait..."
        Add-MailboxFolderPermission -Identity "${Owner}:\calendar" -user $User -AccessRights reviewer | Out-Null
        Get-MailboxFolderPermission "${Owner}:\calendar"
        Read-Host "I have updated the permissions on the Owner's mailbox to reflect the above output. Press enter to exit"
    } else {
        Read-Host "Press enter to exit"
    }
} elseif ($PermissionSel -eq "3"){
    $Confirm = Read-Host "I will be allowing $User to only see availability on the calendar owned by $Owner. Is this correct? (y/n)"
    if ($Confirm -eq "y"){
        Connect-ExchangeOnline
        Write-Host "Updating permissions, please wait..."
        Add-MailboxFolderPermission -Identity "${Owner}:\calendar" -user $User -AccessRights AvailabilityOnly | Out-Null
        Get-MailboxFolderPermission "${Owner}:\calendar"
        Read-Host "I have updated the permissions on the Owner's mailbox to reflect the above output. Press enter to exit"
    } else {
        Read-Host "Press enter to exit"
    }
} else {
    Read-Host "Did not understand input, press enter to quit and try again"
}