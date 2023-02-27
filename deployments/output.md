# $ kubectl get all -o wide --show-labels
```
NAME                                    READY   STATUS    RESTARTS   AGE     IP            NODE     NOMINATED NODE   READINESS GATES   LABELS
pod/nginx-deployment-7fb96c846b-gj5bt   1/1     Running   0          6m15s   2.2.234.138   ub18c1   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b
pod/nginx-deployment-7fb96c846b-r6qjd   1/1     Running   0          6m15s   2.2.251.69    ub18c2   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE    SELECTOR   LABELS
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   131m   <none>     component=apiserver,provider=kubernetes

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS   IMAGES         SELECTOR    LABELS
deployment.apps/nginx-deployment   2/2     2            2           6m15s   nginx        nginx:1.14.2   app=nginx   <none>

NAME                                          DESIRED   CURRENT   READY   AGE     CONTAINERS   IMAGES         SELECTOR                                 LABELS
replicaset.apps/nginx-deployment-7fb96c846b   2         2         2       6m15s   nginx        nginx:1.14.2   app=nginx,pod-template-hash=7fb96c846b   app=nginx,pod-template-hash=7fb96c846b
```

# $ kubectl scale deployment/nginx-deployment --replicas=3
```
deployment.apps/nginx-deployment scaled
```

# $ kubectl get all -o wide --show-labels
```
NAME                                    READY   STATUS    RESTARTS   AGE     IP            NODE     NOMINATED NODE   READINESS GATES   LABELS
pod/nginx-deployment-7fb96c846b-gj5bt   1/1     Running   0          6m57s   2.2.234.138   ub18c1   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b
pod/nginx-deployment-7fb96c846b-lpwhg   1/1     Running   0          20s     2.2.234.142   ub18c1   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b
pod/nginx-deployment-7fb96c846b-r6qjd   1/1     Running   0          6m57s   2.2.251.69    ub18c2   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE    SELECTOR   LABELS
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   131m   <none>     component=apiserver,provider=kubernetes

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE     CONTAINERS   IMAGES         SELECTOR    LABELS
deployment.apps/nginx-deployment   3/3     3            3           6m57s   nginx        nginx:1.14.2   app=nginx   <none>

NAME                                          DESIRED   CURRENT   READY   AGE     CONTAINERS   IMAGES         SELECTOR                                 LABELS
replicaset.apps/nginx-deployment-7fb96c846b   3         3         3       6m57s   nginx        nginx:1.14.2   app=nginx,pod-template-hash=7fb96c846b   app=nginx,pod-template-hash=7fb96c846b
```

# $ kubectl edit deployment nginx-deployment
```
spec:
  ...
   replicas: 2
   

deployment.apps/nginx-deployment edited
```

# $ kubectl get all -o wide --show-labels
```
NAME                                    READY   STATUS    RESTARTS   AGE   IP            NODE     NOMINATED NODE   READINESS GATES   LABELS
pod/nginx-deployment-7fb96c846b-gj5bt   1/1     Running   0          25m   2.2.234.138   ub18c1   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b
pod/nginx-deployment-7fb96c846b-lpwhg   1/1     Running   0          18m   2.2.234.142   ub18c1   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b
pod/nginx-deployment-7fb96c846b-r6qjd   1/1     Running   0          25m   2.2.251.69    ub18c2   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b
pod/nginx-deployment-7fb96c846b-v67ng   1/1     Running   0          25s   2.2.251.73    ub18c2   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE    SELECTOR   LABELS
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   150m   <none>     component=apiserver,provider=kubernetes

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES         SELECTOR    LABELS
deployment.apps/nginx-deployment   4/4     4            4           25m   nginx        nginx:1.14.2   app=nginx   <none>

NAME                                          DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES         SELECTOR                                 LABELS
replicaset.apps/nginx-deployment-7fb96c846b   4         4         4       25m   nginx        nginx:1.14.2   app=nginx,pod-template-hash=7fb96c846b   app=nginx,pod-template-hash=7fb96c846b
```
