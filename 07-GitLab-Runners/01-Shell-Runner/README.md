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
Runner Description: MyFirstShellRunner
Run Untagged Job  : [*]
Tags              : shell, base, linux
Maximum Time      : 1500 
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
- [gitlabdemovm1]: gitlabdemovm3
Enter an executor: docker-autoscaler, instance, custom, docker, docker-windows, shell, ssh, parallels, virtualbox, docker+machine, kubernetes:
- shell
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!
 
Configuration (with the authentication token) was saved in "/etc/gitlab-runner/config.toml" 
root@gitlabdemovm1:~# 
```


## Now we need to introduce the .gitlab-ci file in our project. 

```
stages: 
  - build

build-job:
  stage: build
  script:
    - echo "Welcome to the world of GitLab CICD Runner."
    - cat /etc/os-release 
```    