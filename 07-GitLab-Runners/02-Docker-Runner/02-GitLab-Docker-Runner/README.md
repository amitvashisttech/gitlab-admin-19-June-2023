## Installing GitLab Runner

1. Add the APT Repo 
```
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
```

2. Install the gitlab Runner Packages 
```
sudo apt-get install gitlab-runner
```

3. Runner Registration 
```
sudo gitlab-runner register
```

### Create a GitLab Runner Registration Token

1. Login to GitLab 

2. Go to Group [Development]

3. Go to CICD -> Runner

4. Create New Group Runner  -> Submit
```
Operating systems : Linux 
Runner Description: Docker-Runner-Local-GitLab
Run Untagged Job  : [*]
Tags              : docker, local
Maximum Time      : 3000
```


## Now go back the command line gitlab runner registration
```
root@gitlabdemovm1:~# gitlab-runner register --url http://gitlab.example.con --token tokenXXX
Runtime platform                                    arch=amd64 os=linux pid=29550 revision=85586bd1 version=16.0.2
Running in system-mode.                            
                                                   
Enter the GitLab instance URL (for example, https://gitlab.com/):
- [http://40.117.79.85]: 
Verifying runner... is valid                        runner=3v3w7bspc
Enter a name for the runner. This is stored only in the local config.toml file:
- [gitlabdemovm1]: docker-local-runner
Enter an executor: docker-autoscaler, instance, custom, docker, docker-windows, shell, ssh, parallels, virtualbox, docker+machine, kubernetes:
- docker
Enter the default Docker image (for example, ruby:2.7):
- alpine:latest
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!
 
Configuration (with the authentication token) was saved in "/etc/gitlab-runner/config.toml" 
root@gitlabdemovm1:~# 
```


## Now we need to update the .gitlab-ci.yml file with tags our project. 

```
stages: 
  - builddefault:
  tags:
    - docker

stages: 
  - build
  - test

build-job:
  stage: build
  script:
    - echo "Welcome to the world of GitLab CICD Runner."
    - cat /etc/os-release

test-job:
  stage: test
  script:
    - echo "Testing Docker Runner on the remote Node "
    - uname -a

build-job:
  stage: build
  script:
    - echo "Welcome to the world of GitLab CICD Runner."
    - cat /etc/os-release 
```    
