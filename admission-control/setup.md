## $ kubectl apply -f new-namespace-pod.yml
```
This will fail because specified Namespace, new-namespace, does not exist
```

## Change the API Server config to enable the NamespaceAutoProvision admission controller:
```
sudo vim /etc/kubernetes/manifests/kube-apiserver.yaml
```

## Locate the --enable-admission-plugins flag, and add NamespaceAutoProvision to the list:
```
- --enable-admission-plugins=NodeRestriction,NamespaceAutoProvision
```

## When you save changes to this file, the API Server will be automatically re-created with the new settings. It may become unavailable for a few moments during this process. Most kubectl commands will fail during this time, until the new API Server is available

## Try to create new-namespace-pod again.
```
kubectl apply -f new-namespace-pod.yml
```

## It should succeed this time, as the NamespaceAutoProvision admission controller will automatically handle the process of creating the Namespace.

## List the Namespaces to see the new Namespace.
```
$ kubectl get namespace
kubectl get namespace
NAME              STATUS   AGE
default           Active   18h
kube-node-lease   Active   18h
kube-public       Active   18h
kube-system       Active   18h
new-namespace     Active   7m53s
```
