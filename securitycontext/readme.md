## $ kubectl apply -f securitycontext.yaml 
```
pod/securitycontext-pod created
```

## $ kubectl get all -o wide          
```
NAME                      READY   STATUS      RESTARTS   AGE     IP         NODE     NOMINATED NODE   READINESS GATES
pod/cm-pod                0/1     Completed   0          24m     5.5.5.11   ub18c2   <none>           <none>
pod/secret-pod            0/1     Completed   0          55m     5.5.5.9    ub18c2   <none>           <none>
pod/securitycontext-pod   1/1     Running     0          3m30s   5.5.5.12   ub18c2   <none>           <none>

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   42h   <none>
```

## $ kubectl exec securitycontext-pod -- sh -c "echo test > test.txt"
```
sh: can't create test.txt: Read-only file system
command terminated with exit code 1
```

## $ kubectl exec -it securitycontext-pod sh
```
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
/ $ su -
su: must be suid to work properly
/ $ 
```
