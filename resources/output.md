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
