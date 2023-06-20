# GitLab Installation 

## Azure VM Installtion Step

### Step 1: Login to Azure Portal

### Step 2: Create a new resource group : [GitLab-Demo]

### Step 3: Create a Linux Virtual Machine with the following: 

```
Provision Ubuntu 20.04  

Type : Standard_D2s_v3

Configure Password : Enabled 

SSH Access : Enabled 

HTTP & HTTPS : Enabled 

```

### Step 4: Check the Public IP & SSH to from your Azure Cloud shell to GitLab VM. 


## GitLab Installation on Ubuntu 20.04 

### Step 1: Install Gitlab Packages & Dependencies 

```
sudo su - 
sudo apt-get update 
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl 
sudo hostname -f 
sudo apt-get install -y postfix
```

### Step 2: Add the GitLab Repo & Install Gitlab Packages 

### NotePoint :  Replace "gitlab.example.com" with your machines FQDN. 

```
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

sudo EXTERNAL_URL="http://gitlab.example.com" apt-get install gitlab-ee
```

### After the install you should be able see the below message: 

```
gitlab Reconfigured!

       *.                  *.
      ***                 ***
     *****               *****
    .******             *******
    ********            ********
   ,,,,,,,,,***********,,,,,,,,,
  ,,,,,,,,,,,*********,,,,,,,,,,,
  .,,,,,,,,,,,*******,,,,,,,,,,,,
      ,,,,,,,,,*****,,,,,,,,,.
         ,,,,,,,****,,,,,,
            .,,,***,,,,
                ,*,.
  


     _______ __  __          __
    / ____(_) /_/ /   ____ _/ /_
   / / __/ / __/ /   / __ `/ __ \
  / /_/ / / /_/ /___/ /_/ / /_/ /
  \____/_/\__/_____/\__,_/_.___/
  

Thank you for installing GitLab!
```
### Step 3: Now we can open the GitLab web page in brower via VM IPAddress. 

### Step 4: Login with default root user & its respective initial password. 
```
cat /etc/gitlab/initial_root_password
```

### Step 5: We need to reset the root user password. 



