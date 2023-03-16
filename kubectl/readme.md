# EXTRACTING KUBECTL SECRET:
```bash
$ kubectl -n argocd  get secret argocd-initial-admin-secret
NAME                          TYPE     DATA   AGE
argocd-initial-admin-secret   Opaque   1      23m

$ kubectl -n argocd  get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 --decode
8e2SUH330EPnIqvI
```

# KUBECTL PATCH:
## Before:
```bash
$ kubectl get svc -n argocd -o wide
NAME                                      TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE   SELECTOR
argocd-applicationset-controller          ClusterIP   10.103.223.203   <none>        7000/TCP,8080/TCP            14m   app.kubernetes.io/name=argocd-applicationset-controller
argocd-dex-server                         ClusterIP   10.101.86.32     <none>        5556/TCP,5557/TCP,5558/TCP   13m   app.kubernetes.io/name=argocd-dex-server
argocd-metrics                            ClusterIP   10.102.11.165    <none>        8082/TCP                     13m   app.kubernetes.io/name=argocd-application-controller
argocd-notifications-controller-metrics   ClusterIP   10.111.166.197   <none>        9001/TCP                     13m   app.kubernetes.io/name=argocd-notifications-controller
argocd-redis                              ClusterIP   10.107.157.240   <none>        6379/TCP                     13m   app.kubernetes.io/name=argocd-redis
argocd-repo-server                        ClusterIP   10.110.157.201   <none>        8081/TCP,8084/TCP            13m   app.kubernetes.io/name=argocd-repo-server
argocd-server                             ClusterIP   10.109.186.124   <none>        80/TCP,443/TCP               13m   app.kubernetes.io/name=argocd-server
argocd-server-metrics                     ClusterIP   10.103.5.109     <none>        8083/TCP                     13m   app.kubernetes.io/name=argocd-server
```

## $ kubectl -n argocd patch svc argocd-server -p '{"spec":{"type":"LoadBalancer"}}'
## After:
```bash
$ kubectl get svc -n argocd -o wide
NAME                                      TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE   SELECTOR
argocd-applicationset-controller          ClusterIP      10.103.223.203   <none>        7000/TCP,8080/TCP            14m   app.kubernetes.io/name=argocd-applicationset-controller
argocd-dex-server                         ClusterIP      10.101.86.32     <none>        5556/TCP,5557/TCP,5558/TCP   14m   app.kubernetes.io/name=argocd-dex-server
argocd-metrics                            ClusterIP      10.102.11.165    <none>        8082/TCP                     14m   app.kubernetes.io/name=argocd-application-controller
argocd-notifications-controller-metrics   ClusterIP      10.111.166.197   <none>        9001/TCP                     14m   app.kubernetes.io/name=argocd-notifications-controller
argocd-redis                              ClusterIP      10.107.157.240   <none>        6379/TCP                     14m   app.kubernetes.io/name=argocd-redis
argocd-repo-server                        ClusterIP      10.110.157.201   <none>        8081/TCP,8084/TCP            14m   app.kubernetes.io/name=argocd-repo-server
argocd-server                             LoadBalancer   10.109.186.124   <pending>     80:32569/TCP,443:32409/TCP   14m   app.kubernetes.io/name=argocd-server
argocd-server-metrics                     ClusterIP      10.103.5.109     <none>        8083/TCP                     14m   app.kubernetes.io/name=argocd-server
```
