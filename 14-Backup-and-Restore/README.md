# Gitlab BackUp & Restore


## Back up - GitLab

1. Add the following to /etc/gitlab/gitlab.rb:
```
root@gitlabdemovm1:~# grep -i backup /etc/gitlab/gitlab.rb | grep -v "^#"
gitlab_rails['manage_backup_path'] = true
gitlab_rails['backup_path'] = "/var/opt/gitlab/backups"
gitlab_rails['backup_gitaly_backup_path'] = "/opt/gitlab/embedded/bin/gitaly-backup"
root@gitlabdemovm1:~# 
```

2.  To reconfigure a Linux package installation, run:
```
sudo gitlab-ctl reconfigure
```

3. Please fix your registry nginx listening port issue before backup:


4. Manually trigger the backup: 
```
gitlab-backup create BACKUP=gitlab_dump GZIP_RSYNCABLE=yes
```

5. Lets check the backup files 
```
ls -ltr /var/opt/gitlab/backups/
```

6. Also manually take the back of /etc/gitlab/ folder:

7. Now you can delete any project, if you want the backup restoration.

## Restore - GitLab

1. First ensure your backup tar file is in the backup directory described in the gitlab.rb configuration gitlab_rails['backup_path']. The default is /var/opt/gitlab/backups. The backup file needs to be owned by the git user.

```
sudo cp gitlab_dump_gitlab_backup.tar /var/opt/gitlab/backups/
sudo chown git:git /var/opt/gitlab/backups/gitlab_dump_gitlab_backup.tar
```

2.  Stop the processes that are connected to the database. Leave the rest of GitLab running:
```
sudo gitlab-ctl stop puma
sudo gitlab-ctl stop sidekiq
```


3. Verify
```
sudo gitlab-ctl status
```

4. Next, restore the backup, specifying the timestamp of the backup you wish to restore
```
sudo gitlab-backup restore BACKUP=gitlab_dump
```

5. Restart and check GitLab:: 
```
sudo gitlab-ctl restart
sudo gitlab-rake gitlab:check SANITIZE=true
```

# Now you can go and the restore project from the portal. 