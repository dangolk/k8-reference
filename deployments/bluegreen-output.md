# # $ kubectl get all -o wide --show-labels
```
NAME                                    READY   STATUS    RESTARTS   AGE     IP            NODE     NOMINATED NODE   READINESS GATES   LABELS
pod/blue-deployment-d6c5cf8bc-wfx8m     1/1     Running   0          16h     2.2.234.173   ub18c1   <none>           <none>            app=bluegreen-test,color=blue,pod-template-hash=d6c5cf8bc
pod/green-deployment-7989475869-4tsfb   1/1     Running   0          5m40s   2.2.251.94    ub18c2   <none>           <none>            app=bluegreen-test,color=green,pod-template-hash=7989475869

NAME                         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE   SELECTOR                         LABELS
service/bluegreen-svc-test   ClusterIP   10.96.42.127   <none>        80/TCP    11m   app=bluegreen-test,color=green   <none>
service/kubernetes           ClusterIP   10.96.0.1      <none>        443/TCP   20h   <none>                           component=apiserver,provider=kubernetes

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS   IMAGES                                 SELECTOR                         LABELS
deployment.apps/blue-deployment    1/1     1            1           16h     nginx        linuxacademycontent/ckad-nginx:blue    app=bluegreen-test,color=blue    <none>
deployment.apps/green-deployment   1/1     1            1           5m40s   nginx        linuxacademycontent/ckad-nginx:green   app=bluegreen-test,color=green   <none>

NAME                                          DESIRED   CURRENT   READY   AGE     CONTAINERS   IMAGES                                 SELECTOR                                                      LABELS
replicaset.apps/blue-deployment-d6c5cf8bc     1         1         1       16h     nginx        linuxacademycontent/ckad-nginx:blue    app=bluegreen-test,color=blue,pod-template-hash=d6c5cf8bc     app=bluegreen-test,color=blue,pod-template-hash=d6c5cf8bc
replicaset.apps/green-deployment-7989475869   1         1         1       5m40s   nginx        linuxacademycontent/ckad-nginx:green   app=bluegreen-test,color=green,pod-template-hash=7989475869   app=bluegreen-test,color=green,pod-template-hash=7989475869
```

## $ kubectl get service -o wide --show-labels
```
NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE   SELECTOR                         LABELS
bluegreen-svc-test   ClusterIP   10.96.42.127   <none>        80/TCP    14m   app=bluegreen-test,color=blue   <none>
kubernetes           ClusterIP   10.96.0.1      <none>        443/TCP   20h   <none>                           component=apiserver,provider=kubernetes
```

## $ curl 10.96.42.127
```
I'm Blue!
```

## $ curl 2.2.234.173
```
I'm Blue!
```

##  $ curl 2.2.251.94
```
I'm green!
```

## $ kubectl edit service service/bluegreen-svc-test
```
spec:
  selector:
    app: bluegreen-test
    color: green
```

## $ kubectl get service -o wide --show-labels
```
NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE   SELECTOR                         LABELS
bluegreen-svc-test   ClusterIP   10.96.42.127   <none>        80/TCP    14m   app=bluegreen-test,color=green   <none>
kubernetes           ClusterIP   10.96.0.1      <none>        443/TCP   20h   <none>                           component=apiserver,provider=kubernetes
```

## $ curl 10.96.42.127
```
I'm green!
```
