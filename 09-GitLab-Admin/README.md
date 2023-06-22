# GitLab Log System

## Log Levels 
The following log levels are supported:

Level	Name
0	DEBUG
1	INFO
2	WARN
3	ERROR
4	FATAL
5	UNKNOWN

## Log Rotation
   - logrotate
   - svlogd

## Genral Log Location 
```
root@gitlabdemovm1:~# ls -ltr /var/log/gitlab/
total 76
drwx------ 2 root              root       4096 Jun 19 13:39 logrotate
drwx------ 2 git               root       4096 Jun 21 06:44 gitlab-shell
drwx------ 2 gitlab-prometheus root       4096 Jun 21 14:18 grafana
drwxr-x--- 2 root              gitlab-www 4096 Jun 22 00:44 nginx
drwx------ 2 git               root       4096 Jun 22 01:30 gitlab-rails
drwx------ 2 gitlab-redis      root       4096 Jun 22 06:34 redis-exporter
drwx------ 2 gitlab-redis      root       4096 Jun 22 06:34 redis
drwx------ 2 gitlab-psql       root       4096 Jun 22 06:34 postgres-exporter
drwx------ 2 git               root       4096 Jun 22 06:34 gitlab-kas
drwx------ 2 gitlab-prometheus root       4096 Jun 22 06:34 alertmanager
drwx------ 2 gitlab-prometheus root       4096 Jun 22 06:34 prometheus
drwx------ 2 gitlab-psql       root       4096 Jun 22 06:34 postgresql
drwx------ 2 git               root       4096 Jun 22 06:34 puma
drwx------ 2 git               root       4096 Jun 22 06:34 gitlab-exporter
drwx------ 2 gitlab-prometheus root       4096 Jun 22 06:34 node-exporter
drwx------ 2 git               root       4096 Jun 22 06:34 gitaly
drwx------ 2 git               root       4096 Jun 22 06:34 gitlab-workhorse
drwx------ 2 git               root       4096 Jun 22 06:34 sidekiq
drwxr-xr-x 2 root              root       4096 Jun 22 07:15 reconfigure
root@gitlabdemovm1:~#
```


### All the respective logs file is haveing their own format / type 

### We can use tail command to see the logs. 
```
tail  -f /var/log/gitlab/nginx/gitlab_access.log
```

### In you need to view the json logs in pretty format, then install jq 
```
apt-get install jq 
```
```
tail  -f /var/log/gitlab/gitlab-rails/api_json.log | jq
```


### In case you want to configure or modify the existing log rotation policy

1. Default Values
```
root@gitlabdemovm1:~# grep -i logrotate /etc/gitlab/gitlab.rb 
# logging['logrotate_frequency'] = "daily" # rotate logs daily
# logging['logrotate_maxsize'] = nil # rotate logs when they grow bigger than size bytes even before the specified time interval (daily, weekly, monthly, or yearly)
# logging['logrotate_size'] = nil # do not rotate by size by default
# logging['logrotate_rotate'] = 30 # keep 30 rotated logs
# logging['logrotate_compress'] = "compress" # see 'man logrotate'
# logging['logrotate_method'] = "copytruncate" # see 'man logrotate'
# logging['logrotate_postrotate'] = nil # no postrotate command by default
# logging['logrotate_dateformat'] = nil # use date extensions for rotated files rather than numbers e.g. a value of "-%Y-%m-%d" would give rotated files like production.log-2016-03-09.gz
root@gitlabdemovm1:~# 
```


2. Lets have a custom poliy for nginx 
```
nginx['logrotate_frequency'] = "daily" # rotate logs daily
nginx['logrotate_maxsize'] = "200M" # rotate logs when they grow bigger than size bytes even before the specified time interval (daily, weekly, monthly, or yearly)
```
3. Enable Logrotate
```
logrotate['enable'] = true
logrotate['log_directory'] = "/var/log/gitlab/logrotate"
```
 


# GitLab CTL Admin Utils 

### To check the all the service status
```
gitlab-ctl status
```

### To check the specfic service status
```
gitlab-ctl status nginx 
```

### To restart the specfic service status
```
gitlab-ctl restart nginx 
```

### To stop / start the specfic service status
```
gitlab-ctl stop nginx 
```

### To View the logs of any service 
```
gitlab-ctl tail 
```

### To View the logs of specfic service status
```
gitlab-ctl tail nginx
```

### To View the logs of specfic service & a file 
```
gitlab-ctl tail nginx/gitlab_access.log 
```

### Configure log level by edit the gitlab.rb


1. vim /etc/gitlab/gitlab.rb

```
nginx['log_level'] = 'DEBUG'
```

2. Reconfigure GitLab:
```
sudo gitlab-ctl reconfigure
```

3. Check the service status 
```
sudo gitlab-ctl status nginx 
```
