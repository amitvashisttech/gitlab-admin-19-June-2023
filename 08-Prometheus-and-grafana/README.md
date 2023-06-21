# Install Grafana

## Let's use gitlab admin utils to the check the status of all the services
```
gitlab-ctl status 
```

## In the list grafana is missing. 

## Let install grafana via gitlab util ( CF Engine - CHEF ) 

## Edit the chef / gitlab config file ( /etc/gitlab/gitlab.rb ) & update the below parameters:
```
root@gitlabdemovm1:~# grep -i grafana /etc/gitlab/gitlab.rb | grep -v "^#"
grafana['enable'] = true
grafana['enable_deprecated_service'] = true
grafana['log_directory'] = '/var/log/gitlab/grafana'
grafana['admin_password'] = 'admin'
grafana['allow_user_sign_up'] = true
grafana['disable_login_form'] = false
root@gitlabdemovm1:~# 
```

## Run the gitlab-ctl reconfigure
```
gitlab-ctl reconfigure
```

## Now the check the status 
```
root@gitlabdemovm1:~# gitlab-ctl status | grep -i grafana
run: grafana: (pid 152645) 1587s; run: log: (pid 152637) 1588s
root@gitlabdemovm1:~# 
```

## Open the grafana web page by appending gitlab primary url with "/-/grafana"
```
Login Name    : admin 
Login Password: admin 
```

## Now configure our gitlab local prometheus as default datasource:
   - Setting -> DataSource -> [GitLab Omnibus]

## Now check the pre-published dashboards 
   - Dashboards -> Manage -> Folder [GitLab Omnibus] -> GitLab Omnibus Gitaly

## In case you want to import the public dashboards 
   - Go to URL [https://grafana.com/grafana/dashboards/]
   - Select the dashboad of your choice & get hold on dashboard id
   - Click [+] -> Import -> Import via grafana.com [insertdashboard id ] -> Load -> Apply. 

