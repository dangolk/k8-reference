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

