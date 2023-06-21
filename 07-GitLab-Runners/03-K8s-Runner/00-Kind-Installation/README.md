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
cd 07-GitLab-Runners/03-K8s-Runner
sh 01-K8s-Kubelet-Packages/install-k8s-worker-node.sh
```

## Deploy KIND K8s Cluster

### Generate 
```
cat > kind-config.yaml <<EOF
# three node (two workers) cluster config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
EOF
```


## Bring up the cluster
```
kind create cluster --name k8s-runner-cluster --config kind-config.yaml
```

## Check your cluster info / user / cluster context 
```
kubectl cluster-info --context kind-k8s-runner-cluster
```

## Check the Cluster Node Status 
```
kubectl get nodes 
```

## Deploy my first pod 
```
kubectl run hello-k8s --image=nginx --port=80
```

## Check your pod status 
```
kubectl get pods 
```

## Check all in all the namespace
```
kubectl get all --all-namespaces
```

## Let expose our first (hello-k8s) pod
```
kubectl expose pod hello-k8s --type=NodePort
```

## Check the Service Status & Get Hold on Node Port
```
kubectl  get svc
```

## Now check on which node your pod is running & get hold of Node IP Address 
```
kubectl get pods -o wide
kubectl get nodes -o wide
```

## Now to access the application web page, curl NodeIPaddress:NodePort
```
curl 172.18.0.3:31457
```

## Let's Delete the pod & Service 
```
kubectl  delete pod hello-k8s
```
```
kubectl  delete svc  hello-k8s
```


