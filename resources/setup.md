## $ kubectl create namespace resources-test

## Enable the ResourceQuota admission controller.
``` 
sudo vi /etc/kubernetes/manifests/kube-apiserver.yaml
```

## Locate the --enable-admission-plugins flag and add ResourceQuota to the list. Note: If the NamespaceAutoProvision controller is still enabled from a previous lesson, you can remove it from the list to disable it, or leave it enabled if you wish.
```
- --enable-admission-plugins=NodeRestriction,ResourceQuota
```
