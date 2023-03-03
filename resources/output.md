## $ kubectl get all -o wide -n resources-test
```
NAME                READY   STATUS    RESTARTS   AGE   IP        NODE     NOMINATED NODE   READINESS GATES
pod/resources-pod   1/1     Running   0          11m   5.5.5.7   ub18c2   <none>           <none>
```

## $ kubectl get resourcequota -A
```
NAMESPACE        NAME                   AGE   REQUEST                                                LIMIT
resources-test   resources-test-quota   21s   requests.cpu: 250m/500m, requests.memory: 64Mi/128Mi   limits.cpu: 500m/1, limits.memory: 128Mi/256Mi
```

## $ kubectl apply -f too-many-resources-pod.yaml 
```
Error from server (Forbidden): error when creating "too-many-resources-pod.yaml": pods "too-many-resources-pod" is forbidden: exceeded quota: resources-test-quota, requested: limits.memory=200Mi, used: limits.memory=128Mi, limited: limits.memory=256Mi
```

# Max out Resource Quota
## $ kubectl apply -f resources-pod2.yaml 
```
pod/resources-pod2 created
```

## $ kubectl get resourcequota,pods -A
```
NAMESPACE        NAME                                 AGE   REQUEST                                                 LIMIT
resources-test   resourcequota/resources-test-quota   14m   requests.cpu: 500m/500m, requests.memory: 128Mi/128Mi   limits.cpu: 1/1, limits.memory: 256Mi/256Mi

NAMESPACE        NAME                                           READY   STATUS    RESTARTS       AGE
kube-system      pod/calico-kube-controllers-74677b4c5f-f4tpw   1/1     Running   0              19h
kube-system      pod/calico-node-dqmh6                          1/1     Running   0              19h
kube-system      pod/calico-node-fvqkl                          1/1     Running   0              19h
kube-system      pod/calico-node-n6hlt                          1/1     Running   0              19h
kube-system      pod/coredns-565d847f94-dfgpz                   1/1     Running   0              19h
kube-system      pod/coredns-565d847f94-tj7wx                   1/1     Running   0              19h
kube-system      pod/etcd-ub18                                  1/1     Running   49             19h
kube-system      pod/kube-apiserver-ub18                        1/1     Running   0              15m
kube-system      pod/kube-controller-manager-ub18               1/1     Running   3 (15m ago)    19h
kube-system      pod/kube-proxy-cz9k8                           1/1     Running   0              19h
kube-system      pod/kube-proxy-vwr8b                           1/1     Running   0              19h
kube-system      pod/kube-proxy-xbbpx                           1/1     Running   0              19h
kube-system      pod/kube-scheduler-ub18                        1/1     Running   47 (15m ago)   19h
kube-system      pod/metrics-server-7d9c65958-ghrmp             1/1     Running   0              19h
resources-test   pod/resources-pod                              1/1     Running   0              17m
resources-test   pod/resources-pod2                             1/1     Running   0              55s
```
