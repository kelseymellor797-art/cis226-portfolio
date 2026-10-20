# Week 7: Backup & Restore

## The problem

I needed to back up a folder, restore it, & make sure the restored files matched the original.

## The commands

These are from my actual Week 7 Kalikat shell history (original commands #273–279):

```bash
ls -lR projects > before.txt
ls -lh before.txt
rm -r projects
ls projects
tar -xzvf projects_backup.tar.gz
ls -lR projects > after.txt
diff before.txt after.txt && echo "Identical - restore verified"
```

## How it works

My week 7 backup & restore work shows how I made an archive with tar, restored the folder, & used diff to check whether it matched the original. I picked it bc verifying a restore matters just as much as creating the backup.

The commands above are from my original lab history. The archive had already been created earlier with `tar -czvf projects_backup.tar.gz projects` (original history #253).
