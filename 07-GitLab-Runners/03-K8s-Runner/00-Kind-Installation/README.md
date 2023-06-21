# Install Kind for K8s in Docker

## Download the KIND Packages
```
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
```

## Configuring KIND
```
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

## Install the Kubectl packages on the base machine. 
```
sh ../01-K8s-Kubelet-Packages/install-k8s-worker-node.sh
```
