## $ kubectl get all -o wide --show-labels
```
NAME                READY   STATUS    RESTARTS   AGE     IP            NODE     NOMINATED NODE   READINESS GATES   LABELS
pod/liveness-pod    1/1     Running   0          18m     2.2.234.129   ub18c1   <none>           <none>            <none>
pod/readiness-pod   1/1     Running   0          3m38s   2.2.251.66    ub18c2   <none>           <none>            <none>

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE   SELECTOR   LABELS
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   33m   <none>     component=apiserver,provider=kubernetes
```

## $ kubectl describe pod/liveness-pod
```
Name:             liveness-pod
Namespace:        default
Priority:         0
Service Account:  default
Node:             ub18c1/192.168.255.133
Start Time:       Wed, 01 Mar 2023 11:01:41 -0600
Labels:           <none>
Annotations:      cni.projectcalico.org/containerID: 23efd08b6a92bb33566f80f4f5ef3659fb532e9e236e211fc5911a17eb909bcf
                  cni.projectcalico.org/podIP: 2.2.234.129/32
                  cni.projectcalico.org/podIPs: 2.2.234.129/32
Status:           Running
IP:               2.2.234.129
IPs:
  IP:  2.2.234.129
Containers:
  busybox:
    Container ID:  containerd://ac469390eae1529d034c0ddff6b3b17b29d13b57e0ed9a3a6c2feb6992486c28
    Image:         busybox:stable
    Image ID:      docker.io/library/busybox@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      while true; do sleep 10; done
    State:          Running
      Started:      Wed, 01 Mar 2023 11:01:43 -0600
    Ready:          True
    Restart Count:  0
    Liveness:       exec [echo health check] delay=5s timeout=1s period=5s #success=1 #failure=3
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-qvphw (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kube-api-access-qvphw:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  18m   default-scheduler  Successfully assigned default/liveness-pod to ub18c1
  Normal  Pulled     18m   kubelet            Container image "busybox:stable" already present on machine
  Normal  Created    18m   kubelet            Created container busybox
  Normal  Started    18m   kubelet            Started container busybox
```

## $ kubectl describe pod/readiness-pod
```
Name:             readiness-pod
Namespace:        default
Priority:         0
Service Account:  default
Node:             ub18c2/192.168.255.135
Start Time:       Wed, 01 Mar 2023 11:16:34 -0600
Labels:           <none>
Annotations:      cni.projectcalico.org/containerID: 803038c2239f098e2265ecf82a756e344956a17cbd7e75eae8c5d7e61609dac4
                  cni.projectcalico.org/podIP: 2.2.251.66/32
                  cni.projectcalico.org/podIPs: 2.2.251.66/32
Status:           Running
IP:               2.2.251.66
IPs:
  IP:  2.2.251.66
Containers:
  nginx:
    Container ID:   containerd://f9ab05d94dbf8e3f2e2a35763ea3b68dc14ebf9515e36939c412f610e3b8efcd
    Image:          nginx:stable
    Image ID:       docker.io/library/nginx@sha256:52a6b1268e32ed5b6f59da8222f7627979bfb739f32aae3fb5b5ed31b8bf80c4
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Wed, 01 Mar 2023 11:16:35 -0600
    Ready:          True
    Restart Count:  0
    Liveness:       http-get http://:80/ delay=3s timeout=1s period=3s #success=1 #failure=3
    Readiness:      http-get http://:80/ delay=15s timeout=1s period=5s #success=1 #failure=3
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-blvpv (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  kube-api-access-blvpv:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  4m30s  default-scheduler  Successfully assigned default/readiness-pod to ub18c2
  Normal  Pulled     4m29s  kubelet            Container image "nginx:stable" already present on machine
  Normal  Created    4m29s  kubelet            Created container nginx
  Normal  Started    4m29s  kubelet            Started container nginx
```
