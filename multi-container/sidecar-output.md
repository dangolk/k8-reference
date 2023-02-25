# $ kubectl apply -f sidecar-test.yaml 
```
pod/sidecar-test created
```

# $ kubectl get pods -o wide
```
NAME           READY   STATUS    RESTARTS   AGE     IP                NODE     NOMINATED NODE   READINESS GATES
sidecar-test   2/2     Running   0          5m49s   192.168.234.171   ub18c1   <none>           <none>
```

# $ kubectl logs sidecar-test -c sidecar | head
```
The writer wrote this!
Sat Feb 25 21:55:44 UTC 2023
The writer wrote this!
Sat Feb 25 21:55:49 UTC 2023
The writer wrote this!
Sat Feb 25 21:55:54 UTC 2023
The writer wrote this!
Sat Feb 25 21:55:59 UTC 2023
The writer wrote this!
Sat Feb 25 21:56:04 UTC 2023
```

# $ kubectl exec -it pod/sidecar-test -c sidecar sh
```
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
/ # ls
bin    dev    etc    home   input  lib    lib64  proc   root   sys    tmp    usr    var
/ # ls input/
data.txt
/ # cat input/data.txt 
The writer wrote this!
```

# $ kubectl exec -it sidecar-test -c writer sh
```
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
/ # ls
bin     dev     etc     home    lib     lib64   output  proc    root    sys     tmp     usr     var
/ # cat output/data.txt 
The writer wrote this!
/ # 
```

# $ kubectl describe pod sidecar-test
```
Name:             sidecar-test
Namespace:        default
Priority:         0
Service Account:  default
Node:             ub18c1/192.168.255.133
Start Time:       Sat, 25 Feb 2023 15:55:42 -0600
Labels:           <none>
Annotations:      cni.projectcalico.org/containerID: 100ef7e9a2a244c5480c0d167b32d3fe47ccc72835a442037d27e730fd5bad38
                  cni.projectcalico.org/podIP: 192.168.234.171/32
                  cni.projectcalico.org/podIPs: 192.168.234.171/32
Status:           Running
IP:               192.168.234.171
IPs:
  IP:  192.168.234.171
Containers:
  writer:
    Container ID:  containerd://59ddebda976a1859e3730db97949ce2e1328c46adeab3b12269f753e4c213c39
    Image:         busybox:stable
    Image ID:      docker.io/library/busybox@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      echo "The writer wrote this!" > /output/data.txt; while true; do sleep 5; done
    State:          Running
      Started:      Sat, 25 Feb 2023 15:55:44 -0600
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /output from shared (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-88bnh (ro)
  sidecar:
    Container ID:  containerd://122559adf285623e5de5bea1b497a26c5a4e42eaa59d8192a2bee161ace9b9ed
    Image:         busybox:stable
    Image ID:      docker.io/library/busybox@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      while true; do cat /input/data.txt; date; sleep 5; done
    State:          Running
      Started:      Sat, 25 Feb 2023 15:55:44 -0600
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /input from shared (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-88bnh (ro)
Conditions:
  Type              Status
  Initialized       True 
  Ready             True 
  ContainersReady   True 
  PodScheduled      True 
Volumes:
  shared:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  kube-api-access-88bnh:
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
  Normal  Scheduled  9m17s  default-scheduler  Successfully assigned default/sidecar-test to ub18c1
  Normal  Pulled     9m16s  kubelet            Container image "busybox:stable" already present on machine
  Normal  Created    9m16s  kubelet            Created container writer
  Normal  Started    9m15s  kubelet            Started container writer
  Normal  Pulled     9m15s  kubelet            Container image "busybox:stable" already present on machine
  Normal  Created    9m15s  kubelet            Created container sidecar
  Normal  Started    9m15s  kubelet            Started container sidecar
```
