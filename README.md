# 365-cal-permissions
Tool to set calendar permissions on Exchange Online calendars

**Current Limitations**
- Cannot change existing permissions. Need to add checks for Add-MailboxFolderPermission vs Set-MailboxFolderPermission
- Cannot automap into Outlook. This is an Outlook limitation and unlikely to be fixed
