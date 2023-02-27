# $ kubectl get pod -o wide
```
NAME                   READY   STATUS      RESTARTS   AGE   IP            NODE     NOMINATED NODE   READINESS GATES
emptydir-volume-test   0/1     Completed   0          26m   2.2.234.130   ub18c1   <none>           <none>
hostpath-volume-test   1/1     Running     0          30m   2.2.251.68    ub18c2   <none>           <none>
```

# $ kubectl logs hostpath-volume-test 
```
This is worker 2!
```
(when pod was deployed to node2:ub18c2)

# $ kubectl logs hostpath-volume-test 
```
This is worker 1!
```
(when pod was deployed to node1:ub18c1)

# $ kubectl logs emptydir-volume-test
```
Writing to the empty dir ...
```

# $ kubectl get all -o wide
```
NAME                       READY   STATUS      RESTARTS   AGE   IP            NODE     NOMINATED NODE   READINESS GATES
pod/hostpath-volume-test   0/1     Completed   0          15m   2.2.234.137   ub18c1   <none>           <none>
pod/pv-pod-test            0/1     Completed   0          17m   2.2.234.136   ub18c1   <none>           <none>
```

# $ kubectl logs pod/pv-pod-test
```
This is worker 1
Sun Feb 26 22:56:06 CST 2023
```

# $ kubectl get pv,pvc -o wide
```
NAME                           CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                  STORAGECLASS   REASON   AGE   VOLUMEMODE
persistentvolume/hostpath-pv   1Gi        RWO            Retain           Bound    default/hostpath-pvc   slow                    29m   Filesystem

NAME                                 STATUS   VOLUME        CAPACITY   ACCESS MODES   STORAGECLASS   AGE   VOLUMEMODE
persistentvolumeclaim/hostpath-pvc   Bound    hostpath-pv   1Gi        RWO            slow           26m   Filesystem
```
