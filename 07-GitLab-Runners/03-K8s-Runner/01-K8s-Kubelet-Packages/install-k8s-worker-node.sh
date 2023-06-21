#!/bin/bash


echo "******************** Installing kubernetes *********************"
#apt-get update && apt-get install -y apt-transport-https
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
#cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
#deb http://apt.kubernetes.io/ kubernetes-xenial main
#EOF
#apt-get update
#apt-get install -y kubelet kubeadm kubectl



#sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
#echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list


sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor | sudo dd status=none of=/usr/share/keyrings/kubernetes-archive-keyring.gpg
sudo echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list


sudo apt-get update
sudo apt-get install -y kubectl
sudo apt-mark hold kubectl

