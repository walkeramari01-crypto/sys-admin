# Managing Permissions with the Principle of Least Privilege
Note: This configuration was documented rather than executed due to the lab environment not running a Windows Server domain controller.

## Overview

This exercise demonstrates how to implement the Principle of Least Privilege in a Windows Server environment using Active Directory, security groups, and file system permissions.

The goal is to ensure users only receive the minimum permissions necessary to perform their tasks.

---

## Environment Setup

### Organizational Units

To keep the directory organized, create the following OUs:

- Users
- Groups

---

## User Accounts

Create the following users inside the **Users OU**:

- MarketingUser1
- MarketingManager
- JuniorAdmin

---

## Security Groups

### Global Groups
These groups contain users.

- Marketing_Team
- Junior_Admins

### Domain Local Groups
These groups are used to assign permissions to resources.

- Marketing_Full
- Marketing_ReadOnly

---

## Group Membership

Assign users to the appropriate groups.

**Users → Global Groups**

- MarketingUser1 → Marketing_Team
- MarketingManager → Marketing_Team
- JuniorAdmin → Junior_Admins

**Global Groups → Domain Local Groups**

- Marketing_Team → Marketing_Full
- Marketing_Team → Marketing_ReadOnly

Accounts → Global Groups → Domain Local Groups → Permission


---

## Shared Folder Setup

Create a shared folder on the server:

## Share Permissions

Remove the default **Everyone** permission and configure:

| Group | Permission |
|------|------------|
| Marketing_Full | Full Control |
| Marketing_ReadOnly | Read |

---

## NTFS Permissions

Configure the following permissions under the **Security** tab:

| Group | Permission |
|------|------------|
| Marketing_Full | Modify |
| Marketing_ReadOnly | Read & Execute |

This ensures:

- **Marketing_ReadOnly** users can view files but cannot modify or delete them.
- **Marketing_Full** users can edit and manage files.

---

## Delegation of Control

To allow limited administrative access, delegate control to **JuniorAdmin**.

Steps:

1. Right-click the **Users OU**
2. Select **Delegate Control**
3. Add **JuniorAdmin**
4. Select the task

Reset user passwords and force password change at next logon


This allows password management without granting **Domain Admin privileges**.

---

## Result

This configuration enforces the **Principle of Least Privilege** by:

- Using security groups instead of individual permissions
- Limiting administrative access
- Separating user roles and permissions
- Protecting shared resources from unauthorized changes
