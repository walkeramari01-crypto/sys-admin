# Task 6 — Managing the Sudoers List (macOS)

## Goal
Understand how `sudo` works on macOS and how workstation admin privileges are controlled through group membership.

## Summary of what I did
1. Created a Standard user named `JuniorAdmin` in **System Settings → Users & Groups**
2. Logged into `JuniorAdmin` and confirmed `sudo visudo` failed (no admin rights)
3. Logged into my main Admin account and added `JuniorAdmin` to the `admin` group using `dseditgroup`
4. Logged back into `JuniorAdmin` and verified `sudo` commands now work

## Script
This repo includes a helper script that:
- Adds a macOS user to the `admin` group (requires `sudo`)
- Checks whether a user is a member of the `admin` group

### Usage
Check membership:
```bash
./task6_admin_group.sh check JuniorAdmin

