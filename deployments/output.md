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

# $ kubectl delete pod/nginx-deployment-7fb96c846b-cppbg
```
pod "nginx-deployment-7fb96c846b-cppbg" deleted
```

# $ kubectl get all -o wide --show-labels      
```
NAME                                    READY   STATUS              RESTARTS   AGE    IP            NODE     NOMINATED NODE   READINESS GATES   LABELS
pod/nginx-deployment-7fb96c846b-cppbg   1/1     Terminating         0          22s    2.2.234.144   ub18c1   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b
pod/nginx-deployment-7fb96c846b-dc6w7   0/1     ContainerCreating   0          1s     <none>        ub18c1   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b
pod/nginx-deployment-7fb96c846b-m5vdh   1/1     Running             0          84s    2.2.234.143   ub18c1   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b
pod/nginx-deployment-7fb96c846b-r6qjd   1/1     Running             0          29m    2.2.251.69    ub18c2   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b
pod/nginx-deployment-7fb96c846b-v67ng   1/1     Running             0          4m5s   2.2.251.73    ub18c2   <none>           <none>            app=nginx,pod-template-hash=7fb96c846b

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE    SELECTOR   LABELS
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   153m   <none>     component=apiserver,provider=kubernetes

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES         SELECTOR    LABELS
deployment.apps/nginx-deployment   3/4     4            3           29m   nginx        nginx:1.14.2   app=nginx   <none>

NAME                                          DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES         SELECTOR                                 LABELS
replicaset.apps/nginx-deployment-7fb96c846b   4         4         3       29m   nginx        nginx:1.14.2   app=nginx,pod-template-hash=7fb96c846b   app=nginx,pod-template-hash=7fb96c846b
```


# Rolling Update
## $ kubectl set image deployment.v1.apps/rolling-deployment nginx=nginx:1.16.1
```
deployment.apps/rolling-update-deployment image updated
```

## $ kubectl rollout status deployment/rolling-update-deployment
```
Waiting for deployment "rolling-update-deployment" rollout to finish: 3 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 3 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 3 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 3 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 3 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 4 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 4 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 4 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 4 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 4 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 4 of 5 updated replicas are available...
deployment "rolling-update-deployment" successfully rolled out
```

# Roll back to Previous version (undo rolling update)
## $ kubectl rollout undo deployment/rolling-update-deployment
```
deployment.apps/rolling-update-deployment rolled back
```

# $ kubectl rollout status deployment/rolling-update-deployment
```
Waiting for deployment "rolling-update-deployment" rollout to finish: 3 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 3 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 3 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 3 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 3 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 4 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 4 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 4 out of 5 new replicas have been updated...
Waiting for deployment "rolling-update-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "rolling-update-deployment" rollout to finish: 4 of 5 updated replicas are available...
deployment "rolling-update-deployment" successfully rolled out
```
