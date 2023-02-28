# # $ kubectl get all -o wide --show-labels
```
NAME                                    READY   STATUS    RESTARTS   AGE   IP            NODE     NOMINATED NODE   READINESS GATES   LABELS
pod/canary-deployment-9bf8c69b8-zmht5   1/1     Running   0          26m   2.2.234.175   ub18c1   <none>           <none>            app=canary-test,environment=canary,pod-template-hash=9bf8c69b8
pod/main-deployment-68fd6df75b-6cxkr    1/1     Running   0          32m   2.2.234.174   ub18c1   <none>           <none>            app=canary-test,environment=main,pod-template-hash=68fd6df75b
pod/main-deployment-68fd6df75b-pg85p    1/1     Running   0          32m   2.2.251.96    ub18c2   <none>           <none>            app=canary-test,environment=main,pod-template-hash=68fd6df75b
pod/main-deployment-68fd6df75b-qbp77    1/1     Running   0          32m   2.2.251.95    ub18c2   <none>           <none>            app=canary-test,environment=main,pod-template-hash=68fd6df75b

NAME                         TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE   SELECTOR                         LABELS
service/bluegreen-svc-test   ClusterIP   10.96.42.127   <none>        80/TCP    53m   app=bluegreen-test,color=green   <none>
service/canary-test-svc      ClusterIP   10.109.150.8   <none>        80/TCP    30m   app=canary-test                  <none>
service/kubernetes           ClusterIP   10.96.0.1      <none>        443/TCP   20h   <none>                           component=apiserver,provider=kubernetes

NAME                                READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES                                  SELECTOR                             LABELS
deployment.apps/canary-deployment   1/1     1            1           26m   nginx        linuxacademycontent/ckad-nginx:canary   app=canary-test,environment=canary   <none>
deployment.apps/main-deployment     3/3     3            3           32m   nginx        linuxacademycontent/ckad-nginx:1.0.0    app=canary-test,environment=main     <none>

NAME                                          DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES                                  SELECTOR                                                         LABELS
replicaset.apps/canary-deployment-9bf8c69b8   1         1         1       26m   nginx        linuxacademycontent/ckad-nginx:canary   app=canary-test,environment=canary,pod-template-hash=9bf8c69b8   app=canary-test,environment=canary,pod-template-hash=9bf8c69b8
replicaset.apps/main-deployment-68fd6df75b    3         3         3       32m   nginx        linuxacademycontent/ckad-nginx:1.0.0    app=canary-test,environment=main,pod-template-hash=68fd6df75b    app=canary-test,environment=main,pod-template-hash=68fd6df75b
```

# # $ curl 10.109.150.8
```
I'm the main production environment!
```

# # $ curl 10.109.150.8
```
I'm the main production environment!
```

# # $ curl 10.109.150.8
```
I'm the main production environment!
```

# # $ curl 10.109.150.8
```
I'm the canary!
```
