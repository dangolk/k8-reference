# If a pod has multiple containers, you can exec into a specific one by specifying container name (-c)
```
$ kubectl exec -it sidecar-test -c container sh
$ kubectl exec -it sidecar-test -c writer sh
```

# $ kubectl exec -it -n kube-system pod/kube-proxy-xpkp2 sh

# $ kubectl exec -it -n kube-system pod/calico-node-sjvwr sh
```
sh-4.4# ip addr | grep inet
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host 
    inet 192.168.255.129/24 brd 192.168.255.255 scope global dynamic noprefixroute ens33
    inet6 fe80::ffc2:790f:75f5:819c/64 scope link noprefixroute 
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
    inet6 fe80::42:a3ff:fee3:345f/64 scope link 
    inet 172.18.0.1/16 brd 172.18.255.255 scope global br-9064ce594f2a
    inet6 fc00:f853:ccd:e793::1/64 scope global 
    inet6 fe80::42:f5ff:fe1e:e021/64 scope link 
    inet6 fe80::1/64 scope link 
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
    inet 192.168.19.192/32 scope global tunl0

```

# $ kubectl get all,nodes --all-namespaces -o wide
```
NAMESPACE     NAME                                           READY   STATUS    RESTARTS        AGE   IP                NODE     NOMINATED NODE   READINESS GATES
default       pod/ambassador-test                            2/2     Running   0               27m   192.168.251.112   ub18c2   <none>           <none>
default       pod/ambassador-test-webserver                  1/1     Running   0               27m   192.168.234.173   ub18c1   <none>           <none>
kube-system   pod/calico-kube-controllers-74677b4c5f-mwxmc   1/1     Running   1 (3h9m ago)    18h   192.168.19.198    ub18     <none>           <none>
kube-system   pod/calico-node-hhskz                          1/1     Running   1 (3h ago)      18h   192.168.255.135   ub18c2   <none>           <none>
kube-system   pod/calico-node-kn87q                          1/1     Running   1 (3h10m ago)   18h   192.168.255.133   ub18c1   <none>           <none>
kube-system   pod/calico-node-sjvwr                          1/1     Running   1 (3h9m ago)    18h   192.168.255.129   ub18     <none>           <none>
kube-system   pod/coredns-565d847f94-5jzmc                   1/1     Running   1 (3h9m ago)    18h   192.168.19.196    ub18     <none>           <none>
kube-system   pod/coredns-565d847f94-l4vzn                   1/1     Running   1 (3h9m ago)    18h   192.168.19.197    ub18     <none>           <none>
kube-system   pod/etcd-ub18                                  1/1     Running   39 (3h9m ago)   18h   192.168.255.129   ub18     <none>           <none>
kube-system   pod/kube-apiserver-ub18                        1/1     Running   1 (3h9m ago)    18h   192.168.255.129   ub18     <none>           <none>
kube-system   pod/kube-controller-manager-ub18               1/1     Running   1 (3h9m ago)    18h   192.168.255.129   ub18     <none>           <none>
kube-system   pod/kube-proxy-7kndl                           1/1     Running   1               18h   192.168.255.133   ub18c1   <none>           <none>
kube-system   pod/kube-proxy-hb6fp                           1/1     Running   1 (3h ago)      18h   192.168.255.135   ub18c2   <none>           <none>
kube-system   pod/kube-proxy-xpkp2                           1/1     Running   1 (3h9m ago)    18h   192.168.255.129   ub18     <none>           <none>
kube-system   pod/kube-scheduler-ub18                        1/1     Running   1 (3h9m ago)    18h   192.168.255.129   ub18     <none>           <none>

NAMESPACE     NAME                          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE   SELECTOR
default       service/ambassador-test-svc   ClusterIP   10.103.211.73   <none>        80/TCP                   27m   app=ambassador-test
default       service/kubernetes            ClusterIP   10.96.0.1       <none>        443/TCP                  18h   <none>
kube-system   service/kube-dns              ClusterIP   10.96.0.10      <none>        53/UDP,53/TCP,9153/TCP   18h   k8s-app=kube-dns

NAMESPACE     NAME                         DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE   CONTAINERS    IMAGES                               SELECTOR
kube-system   daemonset.apps/calico-node   3         3         3       3            3           kubernetes.io/os=linux   18h   calico-node   docker.io/calico/node:v3.25.0        k8s-app=calico-node
kube-system   daemonset.apps/kube-proxy    3         3         3       3            3           kubernetes.io/os=linux   18h   kube-proxy    registry.k8s.io/kube-proxy:v1.25.6   k8s-app=kube-proxy

NAMESPACE     NAME                                      READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS                IMAGES                                      SELECTOR
kube-system   deployment.apps/calico-kube-controllers   1/1     1            1           18h   calico-kube-controllers   docker.io/calico/kube-controllers:v3.25.0   k8s-app=calico-kube-controllers
kube-system   deployment.apps/coredns                   2/2     2            2           18h   coredns                   registry.k8s.io/coredns/coredns:v1.9.3      k8s-app=kube-dns

NAMESPACE     NAME                                                 DESIRED   CURRENT   READY   AGE   CONTAINERS                IMAGES                                      SELECTOR
kube-system   replicaset.apps/calico-kube-controllers-74677b4c5f   1         1         1       18h   calico-kube-controllers   docker.io/calico/kube-controllers:v3.25.0   k8s-app=calico-kube-controllers,pod-template-hash=74677b4c5f
kube-system   replicaset.apps/coredns-565d847f94                   2         2         2       18h   coredns                   registry.k8s.io/coredns/coredns:v1.9.3      k8s-app=kube-dns,pod-template-hash=565d847f94

NAMESPACE   NAME          STATUS   ROLES           AGE   VERSION   INTERNAL-IP       EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION       CONTAINER-RUNTIME
            node/ub18     Ready    control-plane   18h   v1.25.3   192.168.255.129   <none>        Ubuntu 18.04.5 LTS   4.15.0-204-generic   containerd://1.6.18
            node/ub18c1   Ready    <none>          18h   v1.25.3   192.168.255.133   <none>        Ubuntu 18.04.5 LTS   4.15.0-204-generic   containerd://1.6.18
            node/ub18c2   Ready    <none>          18h   v1.25.3   192.168.255.135   <none>        Ubuntu 18.04.5 LTS   4.15.0-204-generic   containerd://1.6.18
```
