# 3-2-1 Backup Strategy Audit

## Scenario
A boutique architecture firm has 500GB of project files stored on a NAS. They back up to a single external USB drive once a week.

---

## 1. Single Points of Failure (SPOF)

- NAS failure → no primary data access
- USB backup failure → no recovery option
- Weekly backups → up to 1 week of data loss
- Physical disaster (fire/theft) → both NAS and USB lost
- Backup corruption → no secondary copy available

---

## 2. 3-2-1 Backup Plan

### Copy 1 (Primary)
- NAS (existing)

### Copy 2 (Local Backup)
- Daily automated backup to second drive using rsync or Time Machine

### Copy 3 (Off-site Backup)
- Cloud storage (AWS S3 / Backblaze / Google Cloud)
- Automated sync from NAS to cloud

---

## 3. Disaster Recovery Table (RTO / RPO)

| Scenario | Recovery Method | RTO | RPO |
|----------|----------------|-----|-----|
| NAS failure | Restore from local backup | 2-4 hrs | ≤24 hrs |
| USB failure | Use cloud backup | 4-8 hrs | ≤24 hrs |
| Fire/Theft | Restore from cloud | 8-24 hrs | ≤24 hrs |
| File deletion | Restore from backup | 1-2 hrs | ≤24 hrs |

---

## 4. Terminal Backup Simulation

### Backup Command
This command copies all data from the NAS to the backup drive to create a local backup. 
```bash
rsync -av --delete /Volumes/NAS/ /Volumes/BackupDrive/
