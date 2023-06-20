# GitLab Administration 

## Email Address Update for the root user.

### Step 1: Login to GitLab 

### Step 2: Go to Admin / root user prefrences -> Email -> Add new email address 

## Password Rotation 

### Step 1: Login to GitLab 

### Step 2: Go to Admin / root user prefrences -> Password -> Current Password -> New Password. 

## Setup & Configure MFA / 2FA 

### Step 1: Login to GitLab 

### Step 2: Go to Admin / root user prefrences -> Enable MFA / 2FA  -> It will genrate a QR code. 

### Step 3: Download MS Authenticator -> Accounts -> Click on [+] icon -> work or school account  -> Now Scan the GitLab MFA / 2FA QR Code -> Download the MFA / 2FA Recovery Key -> Proceed -> Supply your current password -> MFA Random Token. 

### Step 4: Now open GitLab URL in private browser -> Authenticate with admin / root user -> Validate your MFA. 



## Setup & Configure SSH Key

### Step 1: Login to Cloud Shell or any clinet machine

### Step 2: Genrate SSH Key, as we are using linux based cloud shell, will be followiing below steps: 

```
ssh-keygen 
```

```
ls $HOME/.ssh/id_*
```

### Step 3: Get hold on your public key
```
cat $HOME/.ssh/id_rsa.pub
```

### Step 4: Login to GitLab 

### Step 5: Go to Admin / root user prefrences -> SSH Key -> Paste your public key -> Title Name : my-cloudshell-ssh-key -> Set the Expiry Date ( 1 Year or so ) -> Add Key. 