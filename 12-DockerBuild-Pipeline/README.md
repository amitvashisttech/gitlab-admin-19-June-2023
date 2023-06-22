# GitLab Docker Image Build Pipeline

## We need to export our gitlab docker register authentication token: 

### Go to Gitlab -> Project -> CD/CD -> Setting -> Varibales
1. DOCKER_LOGIN_NAME_TOKEN  : value 
2. DOCKER_LOGIN_NAME        : value 

### We have been using shell runner due to registry name resolution issue. 

### Shell Runner on the host machine login with gitlab-runner user which don't have the previlages to perfrom any action againt docker, even with sudo. 

### We need to password less sudo as workaround for gitlab-runner user
```
grep -i gitlab-runner /etc/sudoers
```
```
root@gitlabdemovm1:~# grep -i gitlab-runner /etc/sudoers
gitlab-runner   ALL=(ALL:ALL) NOPASSWD:ALL
root@gitlabdemovm1:~#
```