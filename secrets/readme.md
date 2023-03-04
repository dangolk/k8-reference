# Get base64-encoded strings for some sensitive data.

## $ echo Secret Stuff! | base64
```
U2VjcmV0IFN0dWZmIQo=
```

## $ echo Secret Stuff in a file! | base64
```
U2VjcmV0IHN0dWZmIGluIGEgZmlsZSEK
```

## $ kubectl apply -f my-secret.yaml 
```
secret/my-secret created
```

## $ kubectl apply -f secret.pod.yaml 
```
pod/secret-pod created
```

## $ kubectl get all,secrets -o wide
```
NAME             READY   STATUS      RESTARTS   AGE     IP        NODE     NOMINATED NODE   READINESS GATES
pod/cm-pod       0/1     Completed   0          22m     5.5.5.8   ub18c2   <none>           <none>
pod/secret-pod   0/1     Completed   0          3m14s   5.5.5.9   ub18c2   <none>           <none>

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   41h   <none>

NAME               TYPE     DATA   AGE
secret/my-secret   Opaque   2      7m44s
```

## $ kubectl logs secret-pod
```
Secret Stuff!
Secret stuff in a file!
```
